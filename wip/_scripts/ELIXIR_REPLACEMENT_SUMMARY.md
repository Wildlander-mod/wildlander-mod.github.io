# Elixir Name Replacement Summary

## Script: Replace-ElixirNames.ps1

**Status:** ✅ COMPLETED SUCCESSFULLY

**Date:** March 20, 2026

---

## Replacement Statistics

| Metric | Count |
|--------|-------|
| Replacement Mappings Loaded | 330 |
| Successfully Replaced Rows | 259 |
| Rows Without Mapping | 71 |

---

## What Was Replaced

The script successfully replaced generic "[Strength] Elixir" names with unique R4-mapped elixir names across the Elixir View.md table.

### Examples of Successful Replacements:

**Cure Disease Effect:**
- `Dilute Elixir` → `Diluted Glowing Elixir`
- `Weak Elixir` → `Weak Glowing Elixir`
- `Mild Elixir` → `Mild Glowing Elixir`
- `Strong Elixir` → `Strong Glowing Elixir`
- `Potent Elixir` → `Potent Glowing Elixir`
- `Concentrated Elixir` → `Concentrated Glowing Elixir`

**Damage Health Effect:**
- `Dilute Elixir` → `Diluted Grainy Elixir`
- `Weak Elixir` → `Weak Grainy Elixir`
- `Mild Elixir` → `Mild Grainy Elixir`
- `Strong Elixir` → `Strong Grainy Elixir`
- `Potent Elixir` → `Potent Grainy Elixir`
- `Concentrated Elixir` → `Concentrated Grainy Elixir`

**Damage Magicka Effect:**
- `Dilute Elixir` → `Diluted Chunky Elixir`
- And five more variants across all strength levels...

## Effects With Replacements

The following 43 effects have complete strength-level mappings:
- Cure Disease
- Damage Health
- Damage Health Duration
- Damage Health Ravage
- Damage Magicka
- Damage Magicka Duration
- Damage Magicka Rate
- Damage Magicka Ravage
- Damage Speed
- Damage Stamina
- Damage Stamina Duration
- Damage Stamina Rate
- Damage Stamina Ravage
- Fear
- Fortify Alteration
- Fortify Barter
- Fortify Block
- Fortify Carry Weight
- Fortify Conjuration
- Fortify Destruction
- Fortify Enchanting
- Fortify Heal Rate
- Fortify Health
- Fortify Heavy Armor
- Fortify Illusion
- Fortify Light Armor
- Fortify Lockpicking
- Fortify Magicka
- Fortify Magicka Rate
- Fortify Marksman
- Fortify One Handed
- Fortify Pickpocket
- Fortify Restoration
- Fortify Smithing
- Fortify Sneak
- Fortify Stamina
- Fortify Stamina Rate
- Fortify Two Handed
- Frenzy
- Invisibility
- Paralysis
- Resist Fire/Frost/Magic/Poison/Shock (5 effects)
- Restore Health/Magicka/Stamina (3 effects)
- Waterbreathing
- Weakness Fire/Frost/Magic/Poison/Shock (5 effects)

---

## Effects Without Mappings (71 rows)

The following effects do **not** have R4 mappings and were **not** replaced:
- Damage Magicka Regen (6 rows)
- Damage Maximum Health (6 rows)
- Damage Maximum Magicka (6 rows)
- Damage Stamina Regen (6 rows)
- Fortify Armor (12 rows - different variants)

These rows remain with generic elixir names and require mapping data from the R4 JSON.

---

## How to Use the Script

### Preview Mode (Recommended First Run)
```powershell
.\Replace-ElixirNames.ps1
```
Shows what replacements will be made without modifying the file.

### Apply Changes
```powershell
.\Replace-ElixirNames.ps1 -Apply
```
Replaces all elixir names in the Elixir View.md file.

### Custom Paths
```powershell
.\Replace-ElixirNames.ps1 -ElixirViewFile "path/to/file.md" -ReplacementsFile "path/to/mappings.txt" -Apply
```

---

## Files Modified

- **Source:** `c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\Elixir View.md`
- **Mapping:** `c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\elixir-replacements.txt`
- **Script:** `c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\Replace-ElixirNames.ps1`

---

## Next Steps

1. ✅ Verify replacements in the wiki preview after Jekyll rebuild (10+ minutes)
2. ⏳ Address missing mappings for unmapped effects:
   - Generate R4 mappings for "Damage Magicka Regen", "Damage Maximum Health", etc.
   - Or remove placeholder rows if they're not needed
3. ⏳ Test filter functionality on live wiki (ensure dropdowns and search work with new names)
4. ⏳ Commit changes to git once verified

---

## Script Details

**Language:** PowerShell 5.1
**Functions:**
- Parses pipe-delimited mapping file
- Extracts strength level and effect from table rows
- Performs case-sensitive lookups on effect + strength combination
- Replaces only the first column (elixir name) while preserving all other columns intact
- Counts successful/failed replacements with detailed logging

**Key Logic:**
- Match pattern: `| [Strength] Elixir | [Effect] | ...`
- Build lookup key: `"[Effect] ([Strength])"`
- Find in mapping: `"Cure Disease (Dilute)" → "Diluted Glowing Elixir"`
- Replace: `| Cure Disease Elixir |` → `| Diluted Glowing Elixir |`
