# Copilot Instructions: Wildlander Wiki

This is a Jekyll-based static wiki for the Wildlander Skyrim modlist, deployed via GitHub Pages. All pages are markdown with YAML frontmatter, rendered using the Just-the-Docs theme.

## Critical Architecture & Conventions

### Folder Structure & Navigation
- **Top-level folders:** Numbered `_NN-SectionName/` (e.g., `_03-YourFirstCharacter/`, `_04WildlanderWorld/`). The number determines nav bar order.
- **Special folder:** `wip/` is excluded from builds and acts as the development folder.
- **Page ordering:** Within each section, `nav_order` in frontmatter controls the reading sequence. Page 0 is the section hub (e.g., `0-Start-Here.md`).

### Frontmatter Requirements
Every `.md` file MUST have this YAML header:
```yaml
---
layout: default           # Always use "default" - do not change
title: Page Title         # Required, appears in nav bar
nav_order: 5              # Required for ordering, use sequential integers per section
description: Brief desc   # Optional but recommended - used for link previews
has_toc: true             # Optional - adds auto-generated table of contents
---
```

### Link Naming Convention (CRITICAL)
**Use full wiki URLs with trailing slashes, NEVER relative paths or `.md` extensions:**
- ✅ `[Text](https://wiki.wildlandermod.com/03-YourFirstCharacter/Needs/)`
- ❌ `[Text](Needs.md)` or `[Text](#section)` for cross-page linking
- ❌ `[Text](https://wiki.wildlandermod.com/_03-YourFirstCharacter/Needs/)` - NO UNDERSCORES in folder names
- **Exception:** Only internal page anchors use `#section-name` format

**CRITICAL:** Wiki URLs must use folder names WITHOUT leading underscores:
- ✅ `https://wiki.wildlandermod.com/03-YourFirstCharacter/` 
- ✅ `https://wiki.wildlandermod.com/04WildlanderWorld/`
- ❌ `https://wiki.wildlandermod.com/_03-YourFirstCharacter/`
- ❌ `https://wiki.wildlandermod.com/_04WildlanderWorld/`

The underscores in folder names are for Jekyll ordering only and must be removed from all wiki link URLs.

**CRITICAL: Case matters in URLs!** Always verify the exact case of folder and file names:
- ✅ `https://wiki.wildlandermod.com/03-YourFirstCharacter/Character-Creation/` (matches actual folder/file case)
- ❌ `https://wiki.wildlandermod.com/03-yourfirstcharacter/character-creation/` (wrong case = broken link)
- ❌ `https://wiki.wildlandermod.com/03-YourFirstCharacter/character-creation/` (wrong page case = broken link)

When creating links, check the actual folder structure or existing links in the repo to ensure case-correct URLs. Case sensitivity varies by platform but Jekyll treats URLs as case-sensitive.

**NOTE:** January 31, 2026 - Found 24 broken links using incorrect folder name `Beastiary` (should be `Bestiary`) across wiki. Typos in folder names in URLs are easy to miss and cause silent link breakage. Always double-check folder name spelling against actual file structure.

## Content Patterns & Styling

### Page Structure Template
1. **Opening hook** (1-2 sentences explaining why this matters for gameplay)
2. **Conceptual sections** (explain mechanics, not just list facts)
3. **Practical examples** (concrete game scenarios showing the concept)
4. **Strategic application** (how players use this knowledge)
5. **Next Steps section** (3 links to sequential pages in reading order)

### Callout Blocks (Kramdown Styling)
```markdown
{: .warning}
> Critical warning text here.
> Second line.

{: .note}
> Helpful hint or secondary info.

{: .callout-highlight}
> Important emphasis.

{: .tip}
> Optional advanced tip.

{: .important}
> Essential information block.

{: .logfile}
> Log file content or code output.
> Use for crash logs, console output, error messages.

{: .callout-code}
> Console commands or code snippets for users to copy/paste.
```
- Use sparingly; only for truly callout-worthy content
- Each line needs blank separation in the source
- **Common uses:**
  - `.warning`, `.note`, `.highlight`, `.tip`, `.important` - General content emphasis
  - `.logfile` - Display crash logs, console output, error traces
  - `.callout-code` - Show console commands or code users should copy/paste

### Tables & Code Blocks
- **Tables:** Use markdown tables (`| col | col |`) for structured data. HTML tables are acceptable for complex layouts.
- **CRITICAL:** Always add a blank line between a heading and the table that follows it. Jekyll requires this spacing to render tables correctly.
  - ❌ Wrong: `### Heading\n| col | col |`
  - ✅ Correct: `### Heading\n\n| col | col |`
- **Code blocks:** Only for crafting recipes and formulas—NOT for highlighting syntax or general emphasis.
- Use backticks ` for inline elements (except hotkeys—use **bold** instead).

### Hotkey Formatting
- **Always use bold:** `**L**` not `` `L` ``
- **Example:** "Press **F11** to open settings" or "Press **Right Shift** + **E**"
- Backticks create unwanted styling in Jekyll rendering

### JavaScript Critical Rules (⚠️ ENFORCED)

**These rules were established after comprehensive repository audit (V1.1.0 rebuild + codebase review). NEVER violate these.**

1. **🚫 NEVER use backticks (`) in JavaScript code inside Jekyll files**
   - Problem: Jekyll markdown processor misinterprets backticks in `<script>` blocks, causing "Unexpected end of input" errors
   - This breaks the ENTIRE page's JavaScript functionality
   - Violation found in: FullKnownissues.md, CookingRecipes.md, AlchIng.md, Ammunition.md (all 4 FIXED in commit 5a051e9)
   - ✅ Use: String concatenation with `+` operator instead: `'<div>' + variable + '</div>'`
   - ❌ Never: Template literals with backticks: `` `<div>${variable}</div>` ``

2. **🚫 NEVER use `event.pageX` / `event.pageY` for fixed positioning tooltips**
   - Problem: These coordinates are relative to the entire page document; when scrolled, tooltips appear off-screen
   - Violation found in: FullKnownissues.md (FIXED in commit 5a051e9)
   - ✅ Use: `event.clientX` and `event.clientY` for viewport-relative positioning (works correctly when page is scrolled)
   - ❌ Never: `tooltip.style.left = event.pageX + 'px'` — Use `tooltip.style.left = event.clientX + 'px'` instead

3. **ALWAYS use string concatenation for HTML building in JavaScript**
   - Pattern: `'<div>' + data1 + '</div>' + data2` (combining with `+` operator)
   - All pages with interactive tables (22 total across _10-Crafting/, _12Cheat-Sheets/, _01Support/) must follow this pattern
   - See [CookingRecipes.md](../../_10-Crafting/CookingRecipes.md) for reference implementation

4. **NEVER modify frontmatter `---` delimiters when editing files**
   - These delimiters are CRITICAL for Jekyll parsing and YAML interpretation
   - Even minor character changes (spaces, encoding) break the entire page build
   - When rebuilding modlist files (V1.1.0, V1.0.0, etc.), preserve frontmatter EXACTLY as-is
   - Violation risk: High for large file edits; always validate after any bulk replacements

5. **ALWAYS preserve exact Wildlander color scheme in all styling**
   - Defined in: `_sass/custom/custom.scss` and `_sass/color_schemes/wildlander-dark.scss`
   - Required colors for table/button styling:
     - `#50098a` (Purple) - Primary buttons, headers, borders
     - `#f77ef1` (Pink) - Hover states, accents, labels
     - `#3d2454` (Dark Purple) - Table row hover backgrounds (added V1.1.7)
     - `#462b53` (Control Purple) - Input/select backgrounds
     - `#2a2a2a` (Dark Gray) - Main backgrounds, dark rows
     - `#e6e6e6` (Light Text) - Default text color
   - All new styling MUST use these exact colors; never approximate or substitute

6. **ALWAYS test filter/tooltip pages after Jekyll updates or dependency changes**
   - JavaScript features (tooltips, filtering) are sensitive to environment changes
   - Test checklist: Search function works → Filters apply → Dropdowns populate → Tooltips appear → Clear button resets
   - Reference pages for testing: [Cooking Recipes](../../_10-Crafting/CookingRecipes.md), [Known Issues](../../_01Support/FullKnownissues.md)

## Wildlander Color Scheme Reference

**Official colors are defined in:** `_sass/custom/custom.scss` and `_sass/color_schemes/wildlander-dark.scss`

**Primary colors for styling:**
- **Purple (Primary):** `#50098a` - Used for headers, buttons, borders, table headers
- **Pink (Accent):** `#f77ef1` - Used for hover states, highlights, accents
- **Dark Purple (Code/Controls):** `#462b53` - Used for code blocks, control panels
- **Dark Background:** `#222222` - Main page and table background
- **Light Text:** `#e6e6e6` - Default text on dark backgrounds
- **Light Pink:** `#f77ef1` - Links, labels, accents

**When styling new components (tables, buttons, etc.),:**
- Use `#50098a` for primary buttons and headers
- Use `#f77ef1` for hover states and accents
- Use `#462b53` for control/input backgrounds
- Use dark backgrounds (`#222222`, `#2a2a2a`) for alternating rows
- Use `#3d2454` (purple-tinted) for hover effects on table rows

**Example:** [KnownIssuesTableStyle.html](../../_includes/KnownIssuesTableStyle.html) demonstrates proper color usage for custom styled tables.

### Table of Contents
Add to pages with multiple major sections:
```markdown
## Table of contents
{: .no_toc .text-delta }

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>
```

## Reading Order & Next Steps Sequencing

**Pattern: Sections with `0-Start-Here` pages MUST guide users sequentially through all content.**

Sections with `0-Start-Here`:
- `_02-RecommendedReading/` (7 sequential setup/reference pages)
- `_03-YourFirstCharacter/` (14 sequential gameplay mechanics pages)
- `_04-WildlanderWorld/` (13 sequential world systems pages)

**Each page in these sections MUST have a "Next Steps" section** linking to the NEXT 3 pages in the reading order defined in that section's `0-Start-Here.md`.

### Proper Next Steps Format
```markdown
## Next Steps

1. **Read [Next Page](https://wiki.wildlandermod.com/folder/next-page/)** - What you'll learn
2. **Read [Page After](https://wiki.wildlandermod.com/folder/page-after/)** - What you'll learn
3. **Read [Third Page](https://wiki.wildlandermod.com/folder/third-page/)** - What you'll learn

**Remember:** One-sentence reminder of main concept.
```

**CRITICAL:** Every Next Steps section MUST end with **Remember:** (not "Key Takeaway" or "Pro Tip"). This provides consistent closure across all pages.

### Examples of Reading Orders
- **_02-RecommendedReading:** Before You Begin → Stability Test → The UI → Introduction → Changes From Vanilla → Changes From Ultsky → Keybindings → Important Information
- **_03-YourFirstCharacter:** Your First Character → Character Creation → First Day → Leveling Up → Stamina → Health → Combat → Carry Weight → Camping → Resistances → Magic → Needs → Derived Attributes → NPC Services
- **_04-WildlanderWorld:** Tempering → Economy → Essential Gear → Divines → Diseases → Food & Drink → Trainers → Quests → Followers → Player Homes → Enchantments → Shouts → Horses

**Implementation rule:** When editing a page in these sections, ensure its "Next Steps" matches the reading order in that section's `0-Start-Here.md`.

## Requiem-Specific Content Notes

This wiki documents **Requiem-based Wildlander**, which differs from vanilla Skyrim:
- **De-leveled world:** Enemies don't scale; content has fixed difficulty
- **Mechanics are different:** Armor penetration, stamina drain, no passive healing, survival needs
- **Always compare to vanilla if needed:** Mark Requiem-specific mechanics explicitly

When editing pages, verify they distinguish Requiem mechanics from vanilla.

## File Naming & Capitalization

- **Folder names:** Numbered prefix, hyphenated (e.g., `_03-YourFirstCharacter`)
- **Page filenames:** Hyphenated lowercase (e.g., `basic-combat-mechanics.md`) OR PascalCase if matching page title exactly (e.g., `Character-Creation.md`, `Resistances.md`)
- **Consistency:** Match the existing naming in each section—don't rename files unless coordinating across backlinks

## Deployment & Publishing

- **Build:** Jekyll auto-builds on push to main branch via GitHub Actions
- **Publication lag:** Changes can take 10+ minutes to appear on the live site (wiki.wildlandermod.com)
- **Preview:** Test locally if possible, or rely on GitHub Pages preview URLs
- **Theme:** Do NOT edit `_config.yml`, `_sass/`, or CSS—Dylan (owner) controls appearance
- **File encoding:** CRITICAL - All `.md` files MUST be saved as UTF-8. Files with Windows-1252 encoding (smart quotes, non-breaking spaces) will cause Jekyll build failures with "invalid byte sequence in UTF-8" errors. When creating or editing files, ensure they are explicitly saved as UTF-8.
- **🚨 CRITICAL: NO AUTOMATIC GIT COMMITS OR PUSHES** - Git commits and pushes MUST NOT happen without explicit user permission. Only commit and push when the user explicitly requests it with commands like "push it" or "commit and push". Never assume permission to modify git history.

## Dependency Management

- **Gemfile updates:** When updating `Gemfile`, also update `Gemfile.lock` by running `bundle lock --no-update` or `bundle install` locally
- **Lock file:** `Gemfile.lock` pins gem versions for reproducibility across builds—always keep in sync with Gemfile changes

## Common Editing Tasks

### Adding a new page to a section
1. Create `.md` file with sequential `nav_order` number (don't reorder existing pages)
2. Add proper frontmatter and "Next Steps" section linking to following pages
3. Update the "Next Steps" section in the PREVIOUS page to point to the new page

### Updating cross-section links
- Always use full wiki URL format: `https://wiki.wildlandermod.com/folder/page-name/`
- Search entire repo for old link format before replacing

### Markdown rendering issues
- Ensure blank lines between `#Title` and content, and before/after `---` dividers
- Collapsible sections with markdown inside need `<div markdown="1">` wrapper
- If table of contents doesn't generate, verify `has_toc: true` in frontmatter

## Converting Airtable Embeds to Markdown Tables (Standardized Process)

This framework enables consistent conversion of Airtable CSV exports to styled markdown tables with filtering capabilities.

### General Workflow

1. **Export CSV from Airtable** → Save to `_includes/DataFromAirtable/` folder
2. **Run PowerShell conversion script** → Generates markdown table in `_includes/`
3. **Create/configure styling wrapper** → HTML file with CSS and filtering JavaScript
4. **Update target page** → Integrate three Jekyll includes in correct sequence
5. **Verify on wiki** → Changes appear after Jekyll rebuild (10+ minutes)

### Step-by-Step Template

#### 1. Prepare the CSV
- Export from Airtable as CSV format (Grid view)
- Save to: `_includes/DataFromAirtable/[Table Name].csv`
- Ensure column headers are clean (no special characters causing parsing issues)
- Test that newlines within cells are handled (CSV standard)

#### 2. Generate Markdown Table via PowerShell

**Existing Tables:**
Use the prepared script from `_includes/AirtableConversionScripts/`:
- **Known Issues:** From `_includes/` folder, run: `.\AirtableConversionScripts\Convert-KnownIssuesCSV.ps1`
- This regenerates `KnownIssuesTable.md` from the latest CSV export

**New Tables:**
1. Copy `_includes/AirtableConversionScripts/Template-CSVtoMarkdownTable.ps1`
2. Customize the variables at the top:
   - `$csvPath` = Path to your CSV export (save to `DataFromAirtable/[Table Name].csv`)
   - `$outputFile` = Name of markdown file to generate
   - `$columnHeaders` = Array of CSV column names to extract (in order)
   - `$tableHeaderRow` = Markdown table header row (pipe-delimited)
   - `$tableSeparator` = Header separator row (dashes matching column count)
3. Run from `_includes/` folder: `.\AirtableConversionScripts\Template-CSVtoMarkdownTable.ps1`

**Key PowerShell patterns used in scripts:**
- Replace newlines: `-replace '\n', ' ' -replace '\r', ' '` (converts multiline cells to single line)
- Escape pipes: `-replace '\|', '\|'` (prevents pipe conflicts in markdown table syntax)
- Filter empty rows: `if ($cells[0])` (only output rows where first column is not empty)

#### 3. Create Styling Wrapper HTML
Create file: `_includes/[TableName]TableStyle.html`

**Required components:**
- CSS class `.known-issues-controls` for filter UI container
- CSS class `.known-issues-table` for table wrapper
- CSS classes for styling `th`, `td`, alternating rows (`:nth-child(odd/even)`)
- Search input: `#[tableName]Search` (type="text")
- Category dropdown: `#categoryFilter` (auto-populated from column data)
- Status dropdown: `#statusFilter` (auto-populated from column data)
- Clear button: `#clearFilters` (onclick="clearFilters()")
- Result counter: `#filterResultCount` (displays "Showing X of Y [items]")
- JavaScript functions:
  - `init[TableName]Filters()` — Runs on DOMContentLoaded, populates dropdowns
  - `filter[TableName]Table()` — Implements AND logic: search + category + status
  - `clear[TableName]Filters()` — Resets all inputs and reruns filter
  - `updateFilterCount()` — Updates visible row counter
- Opening div: `<div class="[table-name]-table" markdown="1">`

**Use Wildlander styling standards:**
- Header background: `#5b7c99` (blue)
- Row striping: Alternating white/`#f8f9fa` (light gray)
- Hover: `#eef2f7` (lighter blue)
- Button color: `#5b7c99` matching headers
- Button hover: `#3d5467` (darker blue)
- Borders: `#c8cfd8` (light gray)
- Reference: [KnownIssuesTableStyle.html](../../_includes/KnownIssuesTableStyle.html)

#### 4. Create Closing Wrapper
Create file: `_includes/[TableName]TableStyleEnd.html`

**Content:** Single closing div tag
```html
</div>
```

#### 5. Integrate into Target Page
Edit the destination markdown file (e.g., `_01Support/FullKnownissues.md`) with proper frontmatter:

```yaml
---
layout: default
title: Page Title
nav_exclude: true
has_children: false
description: Brief description
---

{% include [TableName]TableStyle.html %}
{% include [TableName].md %}
{% include [TableName]TableStyleEnd.html %}
```

**Critical:** Include the three files in exact sequence:
1. **TableStyle.html** - Contains HTML controls (search input, dropdowns, buttons) + opening div
2. **[TableName].md** - Contains the markdown table with data
3. **TableStyleEnd.html** - Contains the closing div + `<script>` with all JavaScript functions

**IMPORTANT - JavaScript Initialization Order:**
- ALL JavaScript functions (filtering, tooltips, event listeners) MUST go in the **TableStyleEnd.html** file
- Do NOT include any `<script>` tags in the TableStyle.html file
- The script tag at the end ensures the table DOM elements exist before JavaScript tries to initialize
- Without this order, you will get "Unexpected end of input" syntax errors and "function not defined" errors

The markdown attribute on the opening div (`markdown="1"`) enables markdown rendering inside HTML containers.

#### 6. Verify Jekyll Rendering
- Commit to main branch
- Wait 10+ minutes for GitHub Pages rebuild
- Check `https://wiki.wildlandermod.com/section/page/` for live output
- Verify:
  - Table displays with all rows
  - Filter dropdowns populate from data
  - Search works across columns
  - Category and Status filters apply
  - Clear button resets all filters
  - Row counter displays correct counts

### Troubleshooting Common Issues

| Issue | Solution |
|-------|----------|
| Pipes appear in table | Ensure `-replace '\|', '\|'` applied to fields with pipe characters |
| Newlines break table | Use `-replace '\n', ' ' -replace '\r', ' '` to convert to spaces |
| Dropdowns empty | Verify column indices in `cells[N]` selectors match your table structure |
| "Unexpected end of input" syntax error | JavaScript is in TableStyle.html instead of TableStyleEnd.html - move all `<script>` to the End file |
| "Function not defined" errors when button clicked | JavaScript never executed due to syntax error - move script to TableStyleEnd.html AFTER table is included |
| Jekyll build fails | Verify YAML frontmatter is valid (syntax: `key: value`, no extra indentation) |
| Table not rendering | Check that `<div markdown="1">` is properly closed by include wrapper |
| Jekyll build fails | Verify YAML frontmatter is valid (syntax: `key: value`, no extra indentation) |
| Filters not working | Confirm JavaScript function names match IDs (e.g., `#knownIssuesSearch` with `knownIssuesSearch` variable) |

## Standard Page Structure for Tables with Filtering

**All pages with interactive tables and filtering must follow this structure (use Cooking Recipes as the reference):**

```html
<!-- 1. STYLE BLOCK (CSS for table and controls) -->
<style>
/* All CSS here */
</style>

<!-- 2. SCRIPT BLOCK (jQuery + JavaScript functions) -->
<!-- Script MUST come BEFORE controls and table -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initializeFilters() {
  const table = document.querySelector('.table-wrapper table');
  if (!table) {
    console.warn('Table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const categories = new Set();
  const groups = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 7) {
      const group = cells[0].textContent.trim();
      const category = cells[6].textContent.trim();
      if (group && group !== 'Group') groups.add(group);
      if (category && category !== 'Category') categories.add(category);
    }
  });
  
  const categoryFilter = document.getElementById('categoryFilter');
  const groupFilter = document.getElementById('groupFilter');
  
  Array.from(categories).sort().forEach(cat => {
    const option = document.createElement('option');
    option.value = cat;
    option.textContent = cat;
    categoryFilter.appendChild(option);
  });
  
  Array.from(groups).sort().forEach(grp => {
    const option = document.createElement('option');
    option.value = grp;
    option.textContent = grp;
    groupFilter.appendChild(option);
  });
  
  document.getElementById('searchInput').addEventListener('input', applyFilters);
  categoryFilter.addEventListener('change', applyFilters);
  groupFilter.addEventListener('change', applyFilters);
  
  updateResultCount();
}

function applyFilters() {
  const table = document.querySelector('.table-wrapper table');
  if (!table) return;
  
  const searchTerm = document.getElementById('searchInput').value.toLowerCase();
  const categoryFilter = document.getElementById('categoryFilter').value;
  const groupFilter = document.getElementById('groupFilter').value;
  
  const rows = table.querySelectorAll('tbody tr');
  let visibleCount = 0;
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length < 7) {
      row.style.display = 'none';
      return;
    }
    
    const group = cells[0].textContent.trim();
    const itemName = cells[1].textContent.toLowerCase();
    const category = cells[6].textContent.trim();
    const author = cells[7].textContent.toLowerCase();
    
    const matchesSearch = !searchTerm || 
                         itemName.includes(searchTerm) ||
                         author.includes(searchTerm) ||
                         category.toLowerCase().includes(searchTerm);
    
    const matchesCategory = !categoryFilter || category === categoryFilter;
    const matchesGroup = !groupFilter || group === groupFilter;
    
    const isVisible = matchesSearch && matchesCategory && matchesGroup;
    row.style.display = isVisible ? '' : 'none';
    
    if (isVisible) visibleCount++;
  });
  
  updateResultCount(visibleCount, rows.length);
}

function updateResultCount(visible, total) {
  const table = document.querySelector('.table-wrapper table');
  if (!table) return;
  
  if (visible === undefined) {
    visible = Array.from(table.querySelectorAll('tbody tr')).filter(row => row.style.display !== 'none').length;
    total = table.querySelectorAll('tbody tr').length;
  }
  
  const countElement = document.getElementById('filterResultCount');
  if (countElement) {
    countElement.textContent = `Showing ${visible} of ${total} items`;
  }
}

function clearAllFilters() {
  document.getElementById('searchInput').value = '';
  document.getElementById('categoryFilter').value = '';
  document.getElementById('groupFilter').value = '';
  applyFilters();
}

initializeFilters();

});
</script>

<!-- 3. CONTROLS HTML (search input, select dropdowns, buttons) -->
<div class="table-controls">
  <input type="text" id="searchInput" placeholder="Search..." />
  <select id="categoryFilter">
    <option value="">All Categories</option>
  </select>
  <select id="groupFilter">
    <option value="">All Groups</option>
  </select>
  <button onclick="clearAllFilters()">Clear Filters</button>
  <div id="filterResultCount"></div>
</div>

<!-- 4. TABLE (wrapped in markdown="1" for Jekyll) -->
<div class="table-wrapper" markdown="1">

| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Data | Data | Data |

</div>
```

**Key Rules:**
1. **All code goes INSIDE `$(document).ready()` block**
2. **Script must come BEFORE controls and table**
3. **Script loads jQuery from CDN**
4. **Use arrow functions and template literals (ES6) - BUT see critical note below**
5. **Use `addEventListener` for event binding** (vanilla JavaScript, not jQuery .on())
6. **Call `initializeFilters()` directly at end of ready block** - NO setTimeout or retry logic
7. **Controls come after script** (search inputs, dropdowns, buttons)
8. **Table is in div with `markdown="1"`** to enable Jekyll markdown rendering
9. **Table closing `</div>` is at the end** (after all markdown table rows)
10. **Use `document.querySelector()` for DOM access**

**🚨 CRITICAL: NEVER use `//` comments in JavaScript**
{: .warning}
> Do NOT add `//` comments inside `<script>` blocks. Jekyll's markdown processor misinterprets them and breaks the entire script with "Unexpected end of input" syntax errors. This took 2+ hours to debug on V1.1.6.
> 
> Use `console.warn()` for debugging instead, or simply omit comments. Template literals with backticks (`` ` ``) and string concatenation are also safe alternatives for clarity.

**Critical Pattern:**
```javascript
$(document).ready(function(){
  // All functions defined here
  function initializeFilters() { ... }
  function applyFilters() { ... }
  function updateResultCount() { ... }
  function clearAllFilters() { ... }
  
  // Call init function directly at end
  initializeFilters();
});
```

**Reference Pages:**
- [Cooking Recipes](../../_10-Crafting/CookingRecipes.md) - Working embedded table with filtering
- [V1.1.6 Modlist](../../_14ModlistVersions/V1-1-6.md) - Full modlist with search and multi-filter

### Updating Existing Tables


When CSV source data changes, regenerate from `_includes/` folder:
1. Export updated CSV from Airtable (same folder path as before)
2. Run PowerShell script again (same syntax, replaces old markdown file)
3. Verify row count in script output
4. Commit to trigger Jekyll rebuild

### CSV-to-Page Cross-Reference

**Quick lookup to find which CSV and PowerShell script corresponds to each wiki page:**

| Wiki Page | CSV Source | PowerShell Script | Type |
|-----------|-----------|------------------|------|
| `_01Support/FullKnownissues.md` | `Known Issues 2-Grid view.csv` | `Convert-KnownIssuesCSV.ps1` | Include-based |
| `_07-GearAnalysis/Armor.md` | `Armor.csv` | `Convert-ArmorCSV.ps1` | Embedded |
| `_10-Crafting/CookingRecipes.md` | `All Crafting Recipes-Cooking Recipes.csv` | `Convert-CookingRecipesCSV.ps1` | Embedded |
| `_10-Crafting/misc.md` | `All Crafting Recipes-Misc Recipes.csv` | `Convert-MiscRecipesCSV.ps1` | Embedded |
| `_10-Crafting/raw.md` | `All Crafting Recipes-Raw Materiels.csv` | `Convert-RawMaterialsCSV.ps1` | Embedded |
| `_10-Crafting/Jewelery.md` | `All Crafting Recipes-Jewellers Recipes.csv` | `Convert-JewelryRecipesCSV.ps1` | Embedded |
| `_10-Crafting/AlchIng.md` | `All Crafting Recipes-Alchemy Recipes.csv` | `Convert-AlchemyRecipesCSV.ps1` | Embedded |
| `_10-Crafting/blacksmith.md` | `All Crafting Recipes-Forge Recipes.csv` | `Convert-ForgeRecipesCSV.ps1` | Embedded |
| `_10-Crafting/Armor-Table-Recipes.md` | `All Crafting Recipes-Armor Table.csv` | `Convert-ArmorTableRecipesCSV.ps1` | Embedded |
| `_10-Crafting/Ammunition.md` | `All Crafting Recipes-Ammunition.csv` | `Convert-AmmunitionCSV.ps1` | Embedded |
| `_10-Crafting/Tailor.md` | `All Crafting Recipes-Tailor Recipes.csv` | `Convert-TailorRecipesCSV.ps1` | Embedded |
| `_10-Crafting/Breakdown-Recipes.md` | `All Crafting Recipes-Breakdown.csv` | `Convert-BreakdownRecipesCSV.ps1` | Embedded |
| `_10-Crafting/Sharpening-Wheel.md` | `All Crafting Recipes-Sharpening Wheel.csv` | `Convert-SharpeningWheelRecipesCSV.ps1` | Embedded |
| `_10-Crafting/CraftingSpreadsheet.md` | `All Crafting Recipes-All recipes.csv` | `Convert-CraftingSpreadsheetCSV.ps1` | Embedded |
| `_12Cheat-Sheets/Alchemy-Effects-by-Ingredient.md` | `Alchemy - Collected.csv` | `Convert-AlchemyIngredientsCSV.ps1` | Embedded |
| `_12Cheat-Sheets/Alchemy-Ingredient-Effect-List.md` | `Alchemy Ing Effects.csv` | `Convert-AlchemyIngEffectsCSV.ps1` | Embedded |
| `_12Cheat-Sheets/Effect View.md` | `Effects view.csv` | `Convert-EffectsViewCSV.ps1` | Embedded |
| `_12Cheat-Sheets/Ingredient View.md` | `Ingridient View.csv` | `Convert-IngredientsViewCSV.ps1` | Embedded |
| `_12Cheat-Sheets/Solutions-View.md` | `Solutions View.csv` | `Convert-SolutionsViewCSV.ps1` | Embedded |
| `_12Cheat-Sheets/Spells View.md` | `Spells & Archetypes.csv` | `Convert-SpellsViewCSV.ps1` | Embedded |
| `_12Cheat-Sheets/Elixir View.md` | `Elixirs Chear sheet.csv` | `Convert-ElixirsViewCSV.ps1` | Embedded |
| `_14ModlistVersions/V1-1-6.md` | `Current Mod list.csv` | `Convert-ModlistCSV.ps1` | Embedded |

**How to use this table:**
- When updating a table on a wiki page, find the page name in the first column
- Use the corresponding CSV file and PowerShell script from the same row
- Run the script from `_includes/` folder: `cd _includes && .\AirtableConversionScripts\[ScriptName].ps1`
- For embedded tables: Copy the generated markdown table to the page
- For include-based tables: Replace only the table rows, keeping HTML controls and scripts intact

### Known Issues Table (Example Implementation)

**Files for Known Issues:**
- CSV source: `_includes/DataFromAirtable/Known Issues 2-Grid view.csv` (712 rows)
- Conversion script: `_includes/AirtableConversionScripts/Convert-KnownIssuesCSV.ps1` (run from `_includes/` folder to regenerate)
- Markdown table: `_includes/KnownIssuesTable.md` (auto-generated, used to update main page)
- Main page: `_01Support/FullKnownissues.md` (contains all scripts, controls, and table content)
- Columns: ID, Category, Summary, Description, Status, Investigation, Notes
- Features: Full-text search, category filter, status filter, result counter

**Update Workflow:**
When CSV source data changes:
1. Export updated CSV from Airtable to `_includes/DataFromAirtable/`
2. Run PowerShell script: `cd _includes && .\AirtableConversionScripts\Convert-KnownIssuesCSV.ps1`
3. Copy the entire markdown table content from generated `_includes/KnownIssuesTable.md`
4. In `_01Support/FullKnownissues.md`, replace only the markdown table rows (between the `<div class="known-issues-table" markdown="1">` and `</div>`)
5. Keep all scripts, HTML controls, and other content unchanged
6. Commit and push

**Note:** HTML styling and filter controls are embedded directly in the main page. Only the table markdown needs updating when data changes.

### Embedded Tables (Example: Cooking Recipes)

Some tables are embedded directly in pages instead of using includes, for better search indexing by Just the Docs search engine. Embedded tables have filtering/search functionality but are static page content, not includes.

**Files for Cooking Recipes (embedded example):**
- CSV source: `_includes/DataFromAirtable/All Crafting Recipes-Cooking Recipes.csv` (237 rows)
- Conversion script: `_includes/AirtableConversionScripts/Convert-CookingRecipesCSV.ps1` (run from `_includes/` folder)
- Markdown table: `_includes/CookingRecipesTable.md` (auto-generated, used as reference only)
- Page with embedded table: `_10-Crafting/CookingRecipes.md` (table embedded directly in markdown)
- Columns: Item Name, Type, Effects, Items Required, Qty Made, Perks Needed, Toolkits Required, Proximity, Additional Requirements
- Features: Full-text search, type filter, toolkit filter, perks filter, result counter

**To update embedded table after Airtable changes:**
1. Export updated CSV from Airtable to `_includes/DataFromAirtable/`
2. Run conversion script: `cd _includes` then `.\AirtableConversionScripts\Convert-CookingRecipesCSV.ps1`
3. Copy all content from the generated `_includes/CookingRecipesTable.md`
4. Replace the markdown table section in the target page (between the HTML controls div and the closing script tag)
5. Keep the HTML controls (search input, filters, clear button) and JavaScript unchanged
6. Commit the updated page

**Key difference from include-based tables:**
- Embedded tables are part of the main page content, making them searchable by Just the Docs
- No need to update includes separately
- Table stays on same page with all content
- Manual copy-paste step required (unlike auto-includes), but ensures search visibility

### Tooltip Styling for Recipe and Reference Tables

All recipe pages (`_10-Crafting/`) and reference pages (`_12Cheat-Sheets/`) with interactive tables include hover tooltips that display detailed information. Tooltips must follow a **standardized styling pattern** for consistent user experience.

#### Tooltip CSS Styling Template

Add this `<style>` block **before** the `<script>` tag for every page with tooltips:

```html
<style>
#tooltip-id-here {
  background-color: #2a2a2a;
  border: 2px solid #50098a;
  border-radius: 4px;
  padding: 10px;
  color: #e6e6e6;
  font-size: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.5);
  max-width: 300px;
  word-wrap: break-word;
}

#tooltip-id-here div {
  margin: 4px 0;
}

#tooltip-id-here strong {
  color: #f77ef1;
}
</style>
```

**Replace `tooltip-id-here` with the page's actual tooltip ID** (e.g., `allrecipes-tooltip`, `cooking-tooltip`, `armor-table-tooltip`, etc.)

#### JavaScript Tooltip Implementation Pattern

**Key principles:**
1. **Delayed initialization** - Use `setTimeout(initPageName, 300)` to ensure table is fully rendered
2. **Table reference passing** - Pass table reference to functions to avoid repeated DOM queries
3. **Proper positioning** - Use `clientX/clientY` (NOT `pageX/pageY`) for fixed positioning
4. **String concatenation** - Use `+` for string building, NOT template literals
5. **Null checks** - Guard all DOM element queries with null checks

**Standard initialization structure:**

```javascript
$(document).ready(function(){
  setTimeout(initPageName, 300);
});

function initPageName() {
  const table = document.querySelector('.page-table-class table');
  if (!table) return;
  initPageFilters(table);
  initPagetooltips(table);
}

function initPagetooltips(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    if (!itemCell) return;
    itemCell.style.cursor = 'pointer';
    itemCell.style.color = '#f77ef1';
    itemCell.addEventListener('mouseenter', (e) => showPagetooltip(e, row));
    itemCell.addEventListener('mousemove', updatePagetooltipPosition);
    itemCell.addEventListener('mouseleave', hidePagetooltip);
  });
}

function showPagetooltip(event, row) {
  const cells = row.querySelectorAll('td');
  let tooltip = document.getElementById('page-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'page-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  // Build tooltip content using string concatenation (NOT template literals)
  tooltip.innerHTML = '<div><strong>Name:</strong> ' + cells[0]?.textContent?.trim() + '</div>';
  tooltip.style.display = 'block';
  updatePagetooltipPosition(event);
}

function updatePagetooltipPosition(event) {
  const tooltip = document.getElementById('page-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hidePagetooltip() {
  const tooltip = document.getElementById('page-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}
```

#### Color Scheme Consistency

- **Background:** `#2a2a2a` (dark gray - matches Wildlander dark theme)
- **Border:** `#50098a` (purple - primary brand color)
- **Text:** `#e6e6e6` (light gray)
- **Labels:** `#f77ef1` (pink - accent highlighting)
- **Box shadow:** `0 2px 8px rgba(0, 0, 0, 0.5)` (depth effect)

#### Pages with Implemented Tooltips

**Crafting Recipe Pages (_10-Crafting/):**
- CraftingSpreadsheet.md
- AlchIng.md
- CookingRecipes.md
- Ammunition.md
- raw.md (Raw Materials)
- misc.md (Miscellaneous)
- blacksmith.md (Forge)
- Breakdown-Recipes.md
- Sharpening-Wheel.md
- Armor-Table-Recipes.md
- Tailor.md
- Jewelery.md

**Reference Pages (_12Cheat-Sheets/):**
- Spells View.md
- Alchemy-Effects-by-Ingredient.md
- Alchemy-Ingredient-Effect-List.md
- Effect View.md
- Elixir View.md
- Ingredient View.md
- Solutions-View.md

**When adding tooltips to a new page:**
1. Create unique tooltip ID (e.g., `mypage-tooltip`)
2. Add CSS `<style>` block with that ID before `<script>` tag
3. Implement `initPageName()`, `initPagetooltips()`, `showPagetooltip()`, `updatePagetooltipPosition()`, and `hidePagetooltip()` functions
4. Pass table reference to all functions (do NOT query DOM repeatedly)
5. Use `clientX/clientY` for cursor positioning (never `pageX/pageY`)
6. Test on live wiki after 10+ minute Jekyll rebuild



