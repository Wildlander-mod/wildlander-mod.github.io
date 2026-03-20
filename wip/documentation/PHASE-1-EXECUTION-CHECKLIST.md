# Crafting R4 Update - Phase 1 Execution Checklist

**Phase:** 1 - Analysis & Discovery  
**Start Date:** March 20, 2026  
**Estimated Duration:** 1-2 hours  
**Objective:** Fully understand R4 JSON structure and plan extraction approach

---

## High-Level Summary

You now have **13 crafting wiki pages** (staged in `wip/_10-Crafting/`) that need updating with **R4 recipe data from 16,000+ JSON files**.

This is a phased approach:
- **Phase 1 (NOW):** Understand what we're dealing with
- **Phase 2 (NEXT):** Build extraction tools
- **Phase 3 (LATER):** Update wiki pages with new data

---

## Phase 1 Checklist

### Section A: Understand the JSON Files

- [ ] **A1:** Verify ConstructibleObjects folder exists and contains ~16,000 files
  - Location: `I:\Wildlander Core R4\ConstructibleObjects\`
  - Quick check: `(Get-ChildItem "I:\Wildlander Core R4\ConstructibleObjects\" | Measure-Object).Count` should ≈ 16,000

- [ ] **A2:** Examine sample recipe JSONs by category
  - Cooking: Open `AlchFood_CookedChaurusMeat_Recipe5 - 3555FA_Wildlander.esp.json`
  - Smithing: Open `Weap_BonemoldAxe_Recipe - 0009CD_ScrimshawExpanded.esp.json`
  - Armor: Open `Armor_BonemoldBoots_Recipe - 000937_ScrimshawExpanded.esp.json`
  - Breakdown: Open `Armor_BonemoldBoots_Crude_Breakdown - 35FBB3_Wildlander.esp.json`
  - **Document:** What fields are present? Are they consistent?

- [ ] **A3:** Understand EditorID patterns
  - List 10 examples from each category: AlchFood_, Weap_, Armor_, Ammo_, Misc_
  - **Document:** Do the categorization rules in `CRAFTING-JSON-MAPPING.md` hold true?

- [ ] **A4:** Map WorkbenchKeyword values
  - Extract unique `WorkbenchKeyword` values from ConstructibleObjects
  - Match them to crafting stations (Cooking Pot, Forge, Loom, etc.)
  - **Command:**
    ```powershell
    cd "I:\Wildlander Core R4\ConstructibleObjects"
    Get-ChildItem *.json | % { 
      (Get-Content $_ | ConvertFrom-Json).WorkbenchKeyword 
    } | Sort-Object | Get-Unique | Select-Object -First 20
    ```

### Section B: Understand the Wiki Pages

- [ ] **B1:** Open each of the 13 wiki pages and note:
  - Table structure (columns & headers)
  - Data format (what do cells contain?)
  - Styling approach (CSS, JavaScript, markdown)
  - Approximate number of current recipes
  - **Document:** Create a quick reference table for each page

  Pages to review:
  - [ ] CookingRecipes.md
  - [ ] AlchIng.md
  - [ ] blacksmith.md
  - [ ] Armor-Table-Recipes.md
  - [ ] Ammunition.md
  - [ ] Jewelery.md
  - [ ] Tailor.md
  - [ ] misc.md
  - [ ] raw.md
  - [ ] Breakdown-Recipes.md
  - [ ] Sharpening-Wheel.md
  - [ ] CraftingSpreadsheet.md
  - [ ] 1.1-Crafting-System.md (reference only)

- [ ] **B2:** Identify table structure pattern
  - Do all tables have same columns? (Likely NO - different recipes need different info)
  - Which columns always need updated data? (Ingredients, Output, Quantity)
  - Which columns are static/reference? (Perks, Difficulty, Notes)
  - **Document:** Template for "Recipe Table Columns" reference

### Section C: Identify Data Lookup Requirements

- [ ] **C1:** Check for Items folder with human-readable names
  - Look in: `I:\Wildlander Core R4\Items\`
  - Check subfolder structure
  - Sample one Item JSON file
  - **Document:** How to map FormKeys → Item Display Names

- [ ] **C2:** Identify high-priority information gaps
  - Are there special requirements (skill level, perk) embedded in conditions?
  - Do any recipes reference other recipes?
  - Are there multiple variants of same recipe (Survival, Magic, etc.)?
  - **Document:** Special cases that need manual handling

### Section D: Plan Extraction Strategy

- [ ] **D1:** Count recipes by category
  - Run count of files by EditorID prefix
  - **Commands:**
    ```powershell
    cd "I:\Wildlander Core R4\ConstructibleObjects\"
    
    "AlchFood" recipes:
    (Get-ChildItem "AlchFood_*" | Measure-Object).Count
    
    "Weap" recipes:
    (Get-ChildItem "Weap_*" | Measure-Object).Count
    
    "Armor" recipes:
    (Get-ChildItem "Armor_*" | Measure-Object).Count
    
    (etc. for each category)
    ```
  - **Document:** Actual counts vs. estimates in CRAFTING-JSON-MAPPING.md

- [ ] **D2:** Identify ambiguous recipes
  - Find recipes that could fit multiple categories
  - Find disabled/deprecated recipes (check EditorID for "Disabled")
  - **Document:** Edge cases for manual review

- [ ] **D3:** Create recipe routing table
  - Map EditorID pattern → target wiki page
  - Handle edge cases
  - **Output:** `recipe-routing-table.csv` with columns:
    - EditorID Pattern
    - Target Wiki Page
    - Estimated Count
    - Notes

### Section E: Create Phase 1 Summary Report

- [ ] **E1:** Update documentation
  - Add findings to `CRAFTING-JSON-MAPPING.md` with actual counts
  - Fix any incorrect categorization rules
  - Document workflow for Phase 2

- [ ] **E2:** Identify blockers
  - Missing data? What needs research?
  - Ambiguous recipes? How to resolve?
  - Process gaps? What's unclear?

- [ ] **E3:** Create Phase 2 task list
  - Build PowerShell script for extraction
  - Build FormKey → Name lookup
  - Build recipe data aggregator

- [ ] **E4:** Estimate Phase 2 timeline
  - How long will extraction scripts take?
  - How long to resolve all 4000+ recipe names?
  - How many edge cases to handle manually?

---

## Success Criteria (Phase 1 Complete When)

✅ You can answer these questions:

1. **How many recipes are in each category?**
   - Cooking: ___
   - Alchemy: ___
   - Smithing: ___
   - Armor: ___
   - Ammunition: ___
   - Jewelry: ___
   - Tailor: ___
   - Misc/Breakdown: ___

2. **What does the wiki table structure look like for each page?**
   - CookingRecipes: columns are [______]
   - blacksmith: columns are [______]
   - (etc.)

3. **How can we map FormKeys to item display names?**
   - Build lookup from Items folder? or
   - Manual research? or
   - Other method?

4. **What are the edge cases that need special handling?**
   - List 5-10 ambiguous recipes
   - Note any disabled/deprecated recipes

5. **What's the prioritized plan for Phase 2?**
   - Which categories to extract first?
   - Which pages are highest priority?
   - What's the dependency order?

---

## Time Estimate by Section

| Section | Task | Est. Time |
|---------|------|-----------|
| A | Understand JSON files | 20 min |
| B | Understand wiki pages | 30 min |
| C | Data lookup requirements | 15 min |
| D | Plan extraction strategy | 20 min |
| E | Create summary report | 15 min |
| **TOTAL** | **Phase 1** | **~100 min (1.5-2 hours)** |

---

## What's Next After Phase 1

Once this checklist is 100% complete:

1. **Phase 2 begins:** Build PowerShell scripts to extract recipe data
   - Extract-RecipeData.ps1
   - Resolve-ItemNames.ps1
   - Categorize-Recipes.ps1

2. **Output from Phase 2:** 
   - CSV files with structured recipe data
   - Item name lookup table
   - Master recipe list

3. **Phase 3 begins:** Update wiki pages
   - Replace table data with Phase 2 outputs
   - Preserve styling and JavaScript
   - Test pages on live wiki

---

## Notes & Reminders

- This is a **very large project** - breaking it into phases prevents overwhelming complexity
- Each phase builds on previous work - don't rush through Phase 1
- Documentation created so far:
  - `CRAFTING-SPREADSHEET-R4-UPDATE-STRATEGY.md` (big picture)
  - `CRAFTING-JSON-MAPPING.md` (technical details)
  - This checklist (action items)

- Good luck! 🍀 This is genuinely complex work, but breaking it down makes it manageable.

