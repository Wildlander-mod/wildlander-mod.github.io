# R4 Crafting JSON Structure & Categorization Mapping

**Document Version:** 1.0  
**Date:** March 20, 2026  
**Purpose:** Document JSON recipe structure and map them to wiki pages  
**Data Source:** I:\Wildlander Core R4\ConstructibleObjects\

---

## 1. JSON Recipe Structure (Field Reference)

### Example: Cooking Recipe
```json
{
  "FormKey": "3555FA:Wildlander.esp",
  "EditorID": "AlchFood_CookedChaurusMeat_Recipe5",
  "Items": [
    {
      "Item": {
        "Item": "027783:Hunterborn.esp",
        "Count": 5
      }
    }
  ],
  "CreatedObject": "0314CC:Hunterborn.esp",
  "WorkbenchKeyword": "0A5CB3:Skyrim.esm",
  "CreatedObjectCount": 5
}
```

### Field Definitions

| Field | Type | Example | Purpose |
|-------|------|---------|---------|
| **FormKey** | String | `3555FA:Wildlander.esp` | Unique recipe identifier |
| **EditorID** | String | `AlchFood_CookedChaurusMeat_Recipe5` | Human-readable recipe name; CRITICAL for categorization |
| **Items[]** | Array | `Count: 5` | Input ingredients (what player needs) |
| **CreatedObject** | String FormKey | `0314CC:Hunterborn.esp` | Output item identifier |
| **CreatedObjectCount** | Integer | 5 | How many items created |
| **WorkbenchKeyword** | String FormKey | `0A5CB3:Skyrim.esm` | Crafting station type |
| **Conditions[]** | Array | ComparisonValue, Global | Skill/perk requirements |

### Key Insight
**EditorID determines recipe type & wiki page placement!**

---

## 2. EditorID Naming Patterns (Categorization Rules)

By analyzing file names, recipes can be categorized:

### Cooking Recipes
**Pattern:** `AlchFood_*` or `Alch*` with food-related keywords
- `AlchFood_CookedChaurusMeat_Recipe5` → CookingRecipes.md
- `Alchfood_BeefStew_Recipe5` → CookingRecipes.md
- Target page: **CookingRecipes.md**

### Alchemy Ingredients/Potions
**Pattern:** `Alch_*` (non-food) or `Ingr_*`
- `Alch_PowderedChitin_Recipe` → AlchIng.md
- Target page: **AlchIng.md**

### Smithing/Weapon Crafting
**Pattern:** `Weap_*` with recipe keywords
- `Weap_BonemoldAxe_Crude_Temper` → blacksmith.md or Armor-Table-Recipes.md
- `Weap_BonemoldAxe_Recipe` → blacksmith.md (direct crafting)
- Target page: **blacksmith.md** or **Armor-Table-Recipes.md**

### Armor Crafting
**Pattern:** `Armor_*` with recipe keywords
- `Armor_BonemoldBoots_Crude_Breakdown` → Breakdown-Recipes.md (armor breakdown)
- `Armor_FalmerBoots_Crude_Recipe` → blacksmith.md (armor crafting)
- `Armor_BonemoldImprovedBoots_Masterwork_Recipe` → Armor-Table-Recipes.md
- Target pages: **blacksmith.md**, **Armor-Table-Recipes.md**, **Breakdown-Recipes.md**

### Ammunition
**Pattern:** `Ammo_*` 
- `Ammo_ArrowBoneCrude_RecipeBoneForge` → Ammunition.md
- Target page: **Ammunition.md**

### Jewelry
**Pattern:** `Armor_*Gold*`, `Armor_*Silver*`, `Armor_*Jewelry*`
- `Armor_GoldAmethystNecklace_Breakdown` → Jewelery.md
- Target page: **Jewelery.md**

### Clothing/Tailor
**Pattern:** `Armor_*` with clothing keywords (robes, clothes, boots, etc.) OR specific clothing mods
- `Armor_LinenCuffedBoots_Recipe` → Tailor.md
- Includes: ClothingCraft.esp recipes
- Target page: **Tailor.md**

### Miscellaneous Items
**Pattern:** `Misc_*`, `Book_*`, `Ingr_*` (non-potion ingredients)
- `Misc_LeatherStrips_RecipePlayer` → misc.md
- `Book_SkillSmithing1_BreakdownPaper` → misc.md
- Target page: **misc.md** or **Breakdown-Recipes.md**

### Raw Materials/Processing
**Pattern:** `Ingr_*` or `Alch_*` (materials), `Misc_*` (material processing)
- `Ingr_CharredHawkBeak_RecipeSurvival` → raw.md
- `Misc_PeltBear_ProcessLeatherPlayer` → raw.md or Tailor.md
- Target page: **raw.md**

### Breakdown Recipes
**Pattern:** `*_Breakdown` in EditorID
- `Armor_BonemoldBoots_Crude_Breakdown` → Breakdown-Recipes.md
- `Weap_BonemoldAxe_Breakdown` → Breakdown-Recipes.md
- `Book_SkillSmithing1_BreakdownPaper` → Breakdown-Recipes.md
- Target page: **Breakdown-Recipes.md**

### Temper/Sharpening Recipes
**Pattern:** `*_Temper` in EditorID (weapon sharpening) or `*_Temper` (armor improvement)
- `Weap_BonemoldAxe_Crude_Temper` → Sharpening-Wheel.md
- `Armor_BonemoldBoots_Crude_Temper` → Sharpening-Wheel.md
- Target page: **Sharpening-Wheel.md**

---

## 3. WorkbenchKeyword Reference

These Skyrim/Wildlander FormKeys map recipes to crafting stations:

| Keyword FormKey | Crafting Station | Use |
|-----------------|------------------|-----|
| `0A5CB3:Skyrim.esm` | Cooking Pot/Oven | AlchFood (cooking) |
| `0A5CB8:Skyrim.esm` | Alchemy Lab | Alchemy potions |
| `088108:Skyrim.esm` | Grindstone/Sharpen Wheel | Weapon tempering |
| (Unknown - needs mapping) | Forge | Smithing/creation |
| (Unknown - needs mapping) | Workbench | Ammunition |
| (Unknown - needs mapping) | Loom | Clothing/tailor |
| `35A918:Wildlander.esp` | Spinning Wheel | Clothing related |

**Note:** Mapping WorkbenchKeyword values requires cross-referencing Keywords JSON folder.

---

## 4. File Count Analysis (16,000+ files)

### Estimated Distribution by Category

| Recipe Type | Approx. Files | Primary EditorID Pattern |
|------------|---------------|------------------------|
| Cooking | 300 | `AlchFood_*` |
| Alchemy | 200 | `Alch_*` (non-food) |
| Weapon Crafting | 400 | `Weap_*_Recipe`, `Weap_*_Temper` |
| Weapon Breakdown | 300 | `Weap_*_Breakdown` |
| Armor Crafting | 400 | `Armor_*_Recipe` |
| Armor Temper | 400 | `Armor_*_Temper` |
| Armor Breakdown | 400 | `Armor_*_Breakdown` |
| Ammunition | 150 | `Ammo_*` |
| Jewelry | 200 | `Armor_*Gold*`, `Armor_*Silver*` |
| Tailor/Clothing | 1000 | `Armor_*` (garments) + ClothingCraft.esp |
| Misc/Materials | 500 | `Misc_*`, `Ingr_*` |
| Other/Unknown | 12,000+ | Various disabled, modded, unused |
| **TOTAL** | **~16,000** | |

**Key Finding:** ~2000-3000 actively used recipes; ~13,000 possibly disabled or modded variants.

---

## 5. R4-Specific Patterns Observed

### New in R4
- Heavy use of `_Survival` suffix (survival mode recipes): `AlchFood_CookedDragonMeat_RecipeSurvival`
- Heavy use of `_Magic` suffix (magic-focused variant): `AlchFood_CookedDragonMeat_RecipeMagic`
- New material breakdown recipes (ClothingCraft.esp integration)
- Expanded armor/weapon variants (Crude, Rustic, Masterwork quality levels)

### Pattern Examples
```
AlchFood_CookedChaurusMeat_RecipeSurvival    (new - survival variant)
AlchFood_CookedChaurusMeat_RecipeMagic       (new - magic variant)
Weap_BonemoldAxe_Crude_Temper                (R4 quality levels)
Armor_BonemoldBoots_Crude_Recipe              (R4 quality levels)
Misc_DyeBlack_Recipe                          (new in ClothingCraft)
```

---

## 6. Missing Data Challenge: Item Name Resolution

### Problem
JSON files contain FormKeys (e.g., `027783:Hunterborn.esp`), NOT item display names.
To populate wiki tables with readable ingredient/output names, need **FormKey → Name lookup**.

### Solution Approach
**Step 1:** Locate Items folder JSON
- Check: `I:\Wildlander Core R4\Items\` directory
- Should contain individual JSON per item with Name/FullName fields

**Step 2:** Build lookup table
- Read all Item JSON files
- Extract: FormKey → Display Name mapping
- Save as CSV: `formkey-to-itemname-mapping.csv`

**Example Mapping:**
```
FormKey,ItemName,Mod
027783:Hunterborn.esp,Chaurusmeat,Hunterborn.esp
0314CC:Hunterborn.esp,Cooked Chaurusmeat,Hunterborn.esp
```

---

## 7. Extraction Strategy Summary

To update wiki pages, follow this sequence:

### Step 1: Categorize All Recipes (Phase 1)
- [ ] Count files by EditorID pattern
- [ ] Verify pattern → wiki page mapping
- [ ] Identify edge cases/ambiguous files

### Step 2: Build Item Lookup (Phase 2)
- [ ] Parse Items folder JSON
- [ ] Create FormKey → Name CSV
- [ ] Resolve 100+ ingredients per recipe type

### Step 3: Extract Recipe Data (Phase 2)
- [ ] For each wiki page category:
  - Read all matching EditorID JSONs
  - Extract: Name, Ingredients, Output, Count
  - Cross-reference with Item Lookup
  - Output structured format (CSV/JSON)

### Step 4: Update Wiki Tables (Phase 3)
- [ ] For each wiki page:
  - Identify table structure
  - Replace Data rows, preserve headers & styling
  - Preserve JavaScript search/filter code
  - Test on live wiki

---

## 8. Next Actions (Phase 1 - This Session)

1. **Verify category patterns**
   - [ ] Count recipes by prefix in ConstructibleObjects
   - [ ] Spot-check ambiguous categories

2. **Examine Item structure**
   - [ ] Check if `I:\Wildlander Core R4\Items\` exists
   - [ ] Sample Item JSON structure
   - [ ] Estimate item lookup table size

3. **Document current wiki page tables**
   - [ ] Note columns in each of 13 pages
   - [ ] Identify which columns need updated data
   - [ ] Note which columns are reference-only

4. **Create priority list**
   - [ ] Rank pages by change impact
   - [ ] Estimate recipe count per page
   - [ ] Plan update sequence

---

## 9. Known Unknowns

- [ ] How many disabled/unused recipes in the 16K files?
- [ ] Are there version conflicts (multiple mod versions of same recipe)?
- [ ] What's the breakpoint between R3 → R4 recipe changes?
- [ ] Do any recipes have conditional ingredients (skill-dependent)?
- [ ] Are there crafting tree dependencies?

---

## 10. Reference: Current Wiki Pages Inventory

All currently in `wip/_10-Crafting/`:

1. ✓ CookingRecipes.md - ~200 recipes expected
2. ✓ AlchIng.md - ~150 recipes expected
3. ✓ blacksmith.md - ~400 recipes expected
4. ✓ Armor-Table-Recipes.md - ~200 recipes expected
5. ✓ Ammunition.md - ~100 recipes expected
6. ✓ Jewelery.md - ~150 recipes expected
7. ✓ Tailor.md - ~200 recipes expected
8. ✓ misc.md - ~150 recipes expected
9. ✓ raw.md - ~100 recipes expected
10. ✓ Breakdown-Recipes.md - ~300 recipes expected
11. ✓ Sharpening-Wheel.md - ~200 recipes expected
12. ✓ CraftingSpreadsheet.md - ~2000 recipes (master listing)
13. ✓ 1.1-Crafting-System.md - Index page (non-recipe content)

**Total Expected:** 4,000+ wiki-visible recipes

