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
- ✅ `[Text](https://wiki.wildlandermod.com/_03-YourFirstCharacter/Needs/)`
- ❌ `[Text](Needs.md)` or `[Text](#section)` for cross-page linking
- **Exception:** Only internal page anchors use `#section-name` format

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

{: .highlight}
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

1. **Read [Next Page](https://wiki.wildlandermod.com/_folder/next-page/)** - What you'll learn
2. **Read [Page After](https://wiki.wildlandermod.com/_folder/page-after/)** - What you'll learn
3. **Read [Third Page](https://wiki.wildlandermod.com/_folder/third-page/)** - What you'll learn

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

## Dependency Management

- **Gemfile updates:** When updating `Gemfile`, also update `Gemfile.lock` by running `bundle lock --no-update` or `bundle install` locally
- **Lock file:** `Gemfile.lock` pins gem versions for reproducibility across builds—always keep in sync with Gemfile changes

## Common Editing Tasks

### Adding a new page to a section
1. Create `.md` file with sequential `nav_order` number (don't reorder existing pages)
2. Add proper frontmatter and "Next Steps" section linking to following pages
3. Update the "Next Steps" section in the PREVIOUS page to point to the new page

### Updating cross-section links
- Always use full wiki URL format: `https://wiki.wildlandermod.com/_folder/page-name/`
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

### Updating Existing Tables

When CSV source data changes, regenerate from `_includes/` folder:
1. Export updated CSV from Airtable (same folder path as before)
2. Run PowerShell script again (same syntax, replaces old markdown file)
3. Verify row count in script output
4. Commit to trigger Jekyll rebuild

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

