# Crafting Spreadsheet R4 Update Strategy

**Document Version:** 1.0  
**Created:** March 20, 2026  
**Project Scope:** Update 13 crafting wiki pages for Wildlander R4 release  
**Data Source:** ~16,000 ConstructibleObjects JSON files

---

## 1. Project Complexity & Scope

### Current State
- **13 wiki pages** in `_10-Crafting/` with embedded markdown tables + JavaScript filtering
- **16,000+ JSON recipe files** in `I:\Wildlander Core R4\ConstructibleObjects\`
- **Multiple recipe categories**: Cooking, Alchemy, Smithing, Tailor, Ammunition, Jewelry, etc.
- **Complex wiki structure**: Each page has CSS styling, JavaScript search/filter functionality, and embedded markdown tables

### Data Organization Challenge
The JSON files are scattered across a single directory with names like:
- `AlchFood_CookedChaurusMeat_Recipe5 - 3555FA_Wildlander.esp.json`
- `Weap_BonemoldAxe_Crude_Temper - 35FAE3_Wildlander.esp.json`
- `Armor_FalmerBoots_Crude_Breakdown - 35FB1F_Wildlander.esp.json`

Files represent:
- **Recipes** (cooking, crafting)
- **Temper recipes** (weapon/armor improvement)
- **Breakdown recipes** (crafting item breakdown)
- **Other recipes** (enchanting, etc.)

---

## 2. Identified Wiki Pages & Their Purposes

| Page Name | File | Purpose | Est. Recipes |
|-----------|------|---------|--------------|
| Cooking Recipes | CookingRecipes.md | Food & meal preparation | 200+ |
| Alchemy Ingredients | AlchIng.md | Alchemy crafting | 150+ |
| Smithing | blacksmith.md | Forge weapon/armor creation | 400+ |
| Armor Table Recipes | Armor-Table-Recipes.md | Armor crafting reference | 200+ |
| Ammunition | Ammunition.md | Arrow & bolt creation | 100+ |
| Jewelry | Jewelery.md | Jewelry crafting | 150+ |
| Tailor (Clothing) | Tailor.md | Clothing crafting | 200+ |
| Miscellaneous | misc.md | Misc item crafting | 150+ |
| Raw Materials | raw.md | Raw material processing | 100+ |
| Breakdown Recipes | Breakdown-Recipes.md | Item breakdown | 300+ |
| Sharpening Wheel | Sharpening-Wheel.md | Weapon enhancement | 200+ |
| Full Spreadsheet | CraftingSpreadsheet.md | Master recipe list | 2000+ |
| System Overview | 1.1-Crafting-System.md | Index & links | N/A |

---

## 3. Data Extraction Challenge

### Problem 1: Identifying Recipe Categories
Recipe type must be determined by:
- **File name prefix**: `AlchFood_`, `Weap_`, `Armor_`, `Ammo_`, `Alch_`, `Misc_`
- **WorkbenchKeyword**: Maps to crafting station (0A5CB3 = cooking pot, etc.)
- **EditorID pattern**: Reveals recipe type

**Solution:** Create a categorization mapping file that routes recipes to appropriate wiki pages.

### Problem 2: Resolving Item Names
JSON contains **FormKeys** (e.g., `3555FA:Wildlander.esp`), NOT human-readable names.
- Items folder contains ItemDescriptor JSON files with translations
- Names found in **Name/String field** of item JSON
- Must cross-reference thousands of item files

**Solution:** Build an item name lookup table from Item JSON files.

### Problem 3: Extracting Ingredients & Outputs
Each recipe JSON has:
- **Items[]** array: Input ingredients with counts
- **CreatedObject**: Output item FormKey
- **CreatedObjectCount**: Quantity produced
- **Conditions[]**: Requirements (skill level, perks, etc.)
- **WorkbenchKeyword**: Crafting location

**Solution:** Parse these fields consistently across all recipes.

---

## 4. Recommended Approach: Phase-Based Execution

### Phase 1: Analysis & Discovery (CURRENT - This Week)
**Goal:** Understand R4 data structure and identify what needs updating

**Tasks:**
1. ✅ Copy crafting pages to `wip/_10-Crafting/` (DONE)
2. Sample 5-10 JSON recipe files from each category
3. Create JSON structure documentation
4. Identify FormKey → Item Name mapping approach
5. Document which pages need what type of data

**Output:** 
- `CRAFTING-JSON-MAPPING.md` (FormKey analysis)
- Sample recipe data in structured format

### Phase 2: Data Extraction Tools (Next)
**Goal:** Create PowerShell scripts to extract recipe data from JSONs

**Tasks:**
1. Build `Extract-RecipeData.ps1` - reads JSON files and extracts entries
2. Build `Resolve-ItemNames.ps1` - maps FormKeys to human names
3. Build `Categorize-Recipes.ps1` - routes recipes to correct wiki page
4. Create `recipe-master-list.csv` with all extracted data

**Output:**
- Structured recipe data files (CSV/JSON)
- Master lookup tables

### Phase 3: Wiki Page Updates (Later)
**Goal:** Update markdown tables with new R4 recipe data

**Tasks:**
1. For each of the 13 pages:
   - Extract current table structure
   - Replace recipe data with R4 data
   - Preserve styling, JavaScript, formatting
   - Verify search/filter functionality

**Output:**
- Updated wiki pages ready for deployment

---

## 5. Immediate Next Steps

### To Begin Phase 1 Discovery:

1. **Examine JSON structure in detail**
   - Read sample cooking recipes: `AlchFood_*`
   - Read sample smithing recipes: `Weap_*`, `Armor_*`
   - Read sample breakdown recipes: `*_Breakdown`
   - Document field patterns

2. **Create categorization rules**
   - Map filename prefixes → wiki pages
   - Map WorkbenchKeyword values → crafting stations

3. **Identify item name resolution method**
   - Check if Items folder has readable names
   - Plan FormKey lookup approach

4. **Analyze current wiki page structure**
   - Document table column structure for each page
   - Identify which columns need R4 data updates
   - Preserve non-recipe content (intro text, styling, JS)

---

## 6. Known Challenges & Mitigations

| Challenge | Mitigation |
|-----------|-----------|
| 16,000+ files to parse | Focus on relevant categories; build batch processing tools |
| FormKey → Name resolution | Pre-build lookup table from Items folder |
| Multiple mod dependencies | Extract from Wildlander.esp only initially |
| Wiki page complexity | Separate table content from styling/JS; preserve latter |
| Incomplete R4 data | Document gaps; may require manual research |
| Script development time | Iterative approach; start with most-changed categories |

---

## 7. File Organization for This Project

**Working Directory Structure:**
```
wip/
├── documentation/
│   ├── FILE-ORGANIZATION-STANDARDS.md
│   ├── CRAFTING-SPREADSHEET-R4-UPDATE-STRATEGY.md (this file)
│   ├── CRAFTING-JSON-MAPPING.md (TBD)
│   └── CRAFTING-EXTRACTION-RESULTS.md (TBD)
│
├── _10-Crafting/              (staging area for updated wiki pages)
│   ├── CookingRecipes.md      (in progress)
│   ├── AlchIng.md
│   ├── blacksmith.md
│   └── [10 other flavor files]
│
├── _scripts/
│   ├── Extract-RecipeData.ps1 (TBD)
│   ├── Resolve-ItemNames.ps1 (TBD)
│   ├── Categorize-Recipes.ps1 (TBD)
│   ├── recipe-master-list.csv (TBD)
│   └── formkey-to-itemname-mapping.csv (TBD)
│
└── incomplete/               (pages awaiting updates)
    └── [partial work products]
```

---

## 8. Success Criteria

✅ **Phase 1 Complete When:**
- JSON structure fully documented
- Recipe categorization rules defined
- Item name resolution method identified
- Current wiki page structures analyzed

✅ **Phase 2 Complete When:**
- PowerShell extraction scripts functional
- Recipe data successfully extracted for all categories
- Items have resolved human-readable names
- Master recipe list (CSV) available

✅ **Phase 3 Complete When:**
- All 13 wiki pages have updated R4 recipe data
- Table content replaced; styling/JS preserved
- All links in documentation verified
- Pages tested on live wiki (wait for Jekyll rebuild)

---

## 9. Time Estimate

Based on complexity:
- **Phase 1 (Discovery):** 1-2 hours
- **Phase 2 (Script Development):** 3-4 hours  
- **Phase 3 (Page Updates):** 2-3 hours per page × 13 = 26-39 hours

**Total: 30-45+ hours of careful work**

This is genuinely a large project. Breaking it into phases allows verification before proceeding.

---

## 10. Questions & Open Items

- [ ] Are there existing Item FormKey → Name lookup tables?
- [ ] Should all 16K recipes be processed or only Wildlander.esp?
- [ ] Are there dependencies between pages (e.g., raw materials needed for cooking)?
- [ ] Should historical recipe data be archived for version comparison?
- [ ] Which recipe categories changed most drastically in R4?

