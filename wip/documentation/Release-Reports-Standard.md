# Release Reports Standard

**Version:** 1.0  
**Created:** March 26, 2026  
**Applies To:** All Wildlander release versions (R4+)  
**Last Updated:** March 26, 2026 (R4 Release Notes)

---

## 1. Overview & Purpose

This document establishes a standardized framework for creating Wildlander release reports and release notes. The purpose is to ensure consistency across all release versions, maintainability of documentation, and a reusable workflow that can be adapted for future major releases.

### Target Deliverables
- Main release notes overview page
- Detailed bugfixes list with search/filter
- Complete modlist breakdown (additions, removals, replacements)
- Changelog with structured entries
- All files published to the wiki with working search functionality

### Architecture Principles
- **Data-Driven:** All content sourced from CSV exports (Airtable or similar)
- **Standard Markdown:** Jekyll-compatible markdown tables with `markdown="1"` wrapper
- **Interactive Filtering:** JavaScript-based client-side search/filter with result counters
- **Maintainable:** Separation of concerns (CSV → markdown conversion → wiki publishing)
- **Version Tracking:** Each release version has dedicated folder and documentation

---

## 2. Data Source Specification

### CSV Structure & Format

Release data is exported from Airtable or similar database system as CSV files.

#### Bugfixes/Issues CSV
**Column Structure:** 6 columns minimum
- **Issue ID** - Unique identifier (can be empty for untracked issues)
- **Description** - Problem statement or issue summary (text, may contain truncated notes "...")
- **Resolution** - How the issue was fixed/resolved
- **Category** - Either "Bug" (original issues) or "Resolved" (issues resolved by other changes)
- **Status** - (Optional) Additional classification if needed
- **Notes** - (Optional) Reference to related issues (e.g., "WL-1654", "Resolved by WL-1958")

**Row Count for R4:** 80 bugfixes/resolutions

**Special Characters:** 
- HTML entities (`&quot;`, `&amp;`) are preserved as-is
- URLs must be complete (including protocol)
- Newlines within cells are replaced with spaces during conversion

#### Modlist CSV
**Column Structure:** 4 columns minimum (for mods added)
- **Mod Name** - Display name of the mod
- **Category** - Categorization (e.g., architecture, balance, content, utility)
- **Description** - What the mod does
- **Reason** - Why it was added to Wildlander

**Row Count for R4:** 648 mods (645 additions + 1 update + 2 setting changes)

**Removed/Replaced Mods:** May use same format or separate notation

### CSV Export Process
1. Export from Airtable as CSV (Grid view)
2. Save to versioned folder: `wip/DataFromAirtable/[Version]-[Table-Name].csv`
3. Example: `R4-Known-Issues-2-Grid-view.csv`, `R4-Mod-List.csv`
4. Verify column headers are clean (no special characters causing parsing issues)
5. Test that multiline cells are handled correctly (CSV standard escaping)

### Data Validation Checklist
- [ ] All required columns present
- [ ] No blank rows in the middle of data
- [ ] HTML entities properly escaped
- [ ] URLs complete and clickable
- [ ] Row count matches expected count
- [ ] No duplicate entries
- [ ] Category values are consistent and canonical

---

## 3. File Structure & Naming Conventions

### Folder Structure
```
wip/
├── __14ModlistVersions/                # the copy-paste folder where these files will live when they go live
│   ├── CHANGELOG.md                    # Master changelog with all updates, Copy of existing file with 
                                          new  section added at the top
│   ├── R4-Release-Notes-Bugfixes.md    # Detailed bugfixes list
│   └── R4-Release-Notes-Mod-Changes.md # Modlist breakdown
└── documentation/
    └── Release-Reports-Standard.md     # This file - the playbook
```

### File Naming Convention
- **Format:** `[Version]-[Type].md`
- **Examples:** 
  - `R4-Release-Notes-Bugfixes.md` (issues/fixes)
  - `R4-Release-Notes-Mod-Changes.md` (mods added/removed)
- **Case:** PascalCase for version (R4, R5) and hyphenated multi-word titles

### Frontmatter Template

Every release notes file MUST have this YAML header:

```yaml
---
layout: default
title: Release Notes - [Version] [Type]
nav_exclude: true
parent: Release Notes - [Version]
description: Brief description of content
---
```

**Example:**
```yaml
---
layout: default
title: Release Notes - R4 Bugfixes
nav_exclude: true
parent: Release Notes - R4
description: Complete list of bug fixes and issue resolutions for Wildlander R4
---
```

---

## 4. Table Format Standards

### Markdown Table Format (REQUIRED)

All tables in release notes MUST use Jekyll-compatible markdown format with `markdown="1">` wrapper.

**Why:** 
- Consistent with wiki standards
- Enables Jekyll markdown rendering inside HTML containers
- Compatible with JavaScript search/filtering
- Future-proof for static site generation

### HTML Wrapper Structure

```html
<div class="[table-name]-table" markdown="1">

| Column 1 | Column 2 | Column 3 | Column 4 |
|----------|----------|----------|----------|
| data | data | data | data |
| data | data | data | data |

</div>
```

**Critical Rules:**
1. Blank line after `<div>` opening tag
2. Header row with pipe-delimited columns
3. Separator row: `|----------|----------|...|`
4. Data rows: `| col1 | col2 | col3 | col4 |`
5. Blank line before closing `</div>`

### Table Names (CSS Classes)
- Bugfixes: `bugfix-table`
- Mod Changes: `mod-changes-table`
- Other tables: `[descriptive-name]-table`

### Column Specifications

**Bugfixes Table:**
```
| Issue ID | Description | Resolution | Category |
|----------|-------------|-----------|----------|
```

**Mod Changes Table:**
```
| Mod Name | Category | Description | Reason |
|----------|----------|-------------|--------|
```

Plus optional columns for additional data such as Version, Author, or Status.

### Cell Content Guidelines
- Empty cells: Leave blank (just pipe separators)
- Long text: Can span multiple lines in source (markdown will render correctly)
- Special characters: HTML entities (`&quot;`, `&amp;`) are allowed
- URLs: Must be complete markdown links: `[text](https://...)`
- Pipes in content: Escape with `\|`

---

## 5. JavaScript/Search Implementation

### Search System Architecture

Each release notes file with a table includes:
1. CSS styling for search controls and table appearance
2. jQuery initialization and event binding
3. Vanilla JavaScript filter functions
4. Event listeners on search inputs

### Required JavaScript Components

**Style Block (before script):**
```html
<style>
#[tableType]Search {
  padding: 8px 12px;
  background-color: #462b53;
  border: 2px solid #50098a;
  border-radius: 4px;
  color: #e6e6e6;
  font-size: 14px;
  font-family: inherit;
  min-width: 300px;
  margin-bottom: 15px;
}
#[tableType]Search::placeholder { color: #999; }
#[tableType]Search:focus {
  outline: none;
  border-color: #f77ef1;
  box-shadow: 0 0 8px rgba(247, 126, 241, 0.3);
}
</style>
```

**Script Block (jQuery wrapper):**
```javascript
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  // All functions defined here
  function init[TableType]Filters() { ... }
  function filter[TableType]Table() { ... }
  function updateFilterCount() { ... }
  
  // Initialize on page load
  init[TableType]Filters();
});
</script>
```

### HTML Controls
```html
<input type="text" id="[tableType]Search" placeholder="Search..." />
<div id="[tableType]Result" style="margin-bottom: 15px; color: #e6e6e6;">
  Showing X of Y items
</div>
```

### Color Scheme (Wildlander Theme)
- **Primary Purple:** `#50098a` (headers, borders)
- **Accent Pink:** `#f77ef1` (hover, focus)
- **Input Background:** `#462b53` (control purple)
- **Text:** `#e6e6e6` (light gray)
- **Dark Background:** `#2a2a2a` (tables)

### Filter Logic
- **Search:** Full-text search across all visible columns
- **Filters:** Category dropdown, status dropdown (populate from unique values in column)
- **AND Logic:** Search + category + status all apply simultaneously
- **Result Counter:** "Showing X of Y items"
- **Clear Button:** Resets all filters and re-runs filter function

### Critical JavaScript Rules

⚠️ **DO NOT VIOLATE THESE** (Learned from V1.1.0+ rebuild):

1. **NO backticks (`)** in JavaScript code inside Jekyll files
   - They break Jekyll markdown processor
   - Use string concatenation with `+` instead
   - ❌ `` `<div>${var}</div>` ``
   - ✅ `'<div>' + var + '</div>'`

2. **Use `clientX/clientY` for fixed positioning tooltips, NOT `pageX/pageY`**
   - `pageX/pageY` are relative to entire page
   - When scrolled, tooltips appear off-screen
   - ❌ `tooltip.style.left = event.pageX + 'px'`
   - ✅ `tooltip.style.left = event.clientX + 'px'`

3. **All JavaScript must be in `$(document).ready()` block**
   - Code outside block won't execute
   - Functions must be defined inside ready block

4. **Scripts must come BEFORE HTML controls**
   - Script loads first, then DOM elements are created
   - Ensures functions exist before they're called

5. **NO `//` comments in JavaScript blocks**
   - Jekyll parser misinterprets them
   - Results in "Unexpected end of input" errors
   - Use `console.warn()` or omit comments

---

## 6. Step-by-Step Workflow

### Phase 1: Data Collection

1. **Export CSV from Airtable**
   - Select appropriate grid view
   - Export as CSV format
   - Save to: `wip/DataFromAirtable/[Version]-[Table-Name].csv`
   - Verify UTF-8 encoding (Windows-1252 causes Jekyll build failures)

2. **Validate Data**
   - Check row counts match expected
   - Verify no duplicate entries
   - Ensure all required columns present
   - Test multiline cells

### Phase 2: File Generation

3. **Create Markdown Files**
   - Create folder: `wip/_[VersionNumber][VersionName]/`
   - Create 4 files with proper frontmatter:
     - `CHANGELOG.md`
     - `[Version]-Release-Notes.md` (main page)
     - `[Version]-Release-Notes-Bugfixes.md`
     - `[Version]-Release-Notes-Mod-Changes.md`

4. **Add Base Structure to Each File**
   - Frontmatter (YAML header)
   - Title and description
   - CSS `<style>` block (table styling + colors)
   - jQuery `<script>` block with:
     - `init[Type]Filters()` function
     - `filter[Type]Table()` function
     - `updateFilterCount()` function
     - Clear button handler
   - Search controls HTML (input, dropdown, button, result counter)
   - Table wrapper div with `markdown="1"` attribute
   - Empty placeholder for data rows

### Phase 3: Data Conversion

5. **Convert CSV to Markdown Tables**
   - Use Python script to convert CSV rows to markdown format
   - Pattern: `| col1 | col2 | col3 | col4 |`
   - Script handles:
     - HTML entity preservation
     - Multiline to single-line conversion
     - Special character escaping
   - Output: Markdown table rows ready for insertion

6. **Inject Data into Files**
   - Insert converted rows between table header and closing `</div>`
   - Verify all rows present:
     - Bugfixes: 80 rows
     - Mods: 648+ rows
   - Check for data corruption (mixed formats, missing pipes, etc.)

### Phase 4: Testing & Validation

7. **Local Testing** (before pushing)
   - If possible, test on local Jekyll build
   - Verify search/filter functions work
   - Check table rendering
   - Confirm all rows display

8. **Verify Files**
   - Run syntax check on markdown
   - Verify frontmatter YAML
   - Check closing `</div>` tags present
   - Ensure UTF-8 encoding

### Phase 5: Publishing

9. **Commit & Push**
   - Commit to main branch
   - Push to GitHub
   - Wait 10+ minutes for Jekyll rebuild
   - Check wiki.wildlandermod.com for live updates

10. **Final Verification on Live Wiki**
    - [ ] Page loads without errors
    - [ ] Table displays all rows
    - [ ] Search input works
    - [ ] Filters populate from data
    - [ ] Result counter updates
    - [ ] Clear button resets filters

---

## 7. Validation Checklist

### Pre-Publication Validation

**File Structure:**
- [ ] All 4 required files present
- [ ] Correct naming convention: `R[Version]-Release-Notes-[Type].md`
- [ ] All files in `wip/_[VersionNumber][Name]/` folder
- [ ] No stray or temporary files in modlist folder

**Frontmatter (YAML):**
- [ ] `---` delimiters present and intact
- [ ] All required fields: `layout`, `title`, `nav_exclude`, `parent`, `description`
- [ ] No extra indentation or encoding issues
- [ ] Valid YAML syntax (colons, hyphens, quotes)

**Content Structure:**
- [ ] CSS block before script block
- [ ] Script inside `$(document).ready()` with proper braces
- [ ] HTML controls present (search input, dropdown, button)
- [ ] Table wrapper: `<div class="[name]-table" markdown="1">`
- [ ] Blank line after opening div
- [ ] Table header row with correct columns
- [ ] Separator row with pipes and dashes
- [ ] All data rows converted to markdown format
- [ ] Blank line before closing `</div>`
- [ ] Closing `</div>` on separate line

**Data Integrity:**
- [ ] All rows from CSV present (80 bugfixes, 648 mods)
- [ ] No truncated or corrupted rows
- [ ] Special characters preserved (HTML entities, URLs)
- [ ] Pipe delimiters intact in all rows
- [ ] No mixed HTML and markdown in data rows

**Encoding & Special Characters:**
- [ ] File saved as UTF-8 (not Windows-1252)
- [ ] HTML entities display correctly
- [ ] No mojibake or garbled text
- [ ] URLs are complete and click able

**Search/Filter Functionality (if applicable):**
- [ ] JavaScript functions defined with correct names
- [ ] Event listeners bound to search inputs
- [ ] Filter logic implements AND operator correctly
- [ ] Result counter formats message properly
- [ ] No backticks (`) in JavaScript
- [ ] Using `clientX/clientY` for positioning (if tooltips)

**Links (if any):**
- [ ] Wiki links use full URLs: `https://wiki.wildlandermod.com/[path]/`
- [ ] URLs have trailing slashes
- [ ] No leading underscores in folder names in URLs
- [ ] Case matches actual folder/file structure exactly

---

## 8. Common Issues & Solutions

### Issue: "Invalid byte sequence in UTF-8" Jekyll Build Error

**Symptom:** Build fails with encoding error

**Cause:** File saved as Windows-1252 or another encoding

**Solution:** 
1. Open file in VS Code
2. Click encoding indicator (bottom right)
3. Select "UTF-8" and save
4. Test build again

**Prevention:** Always save release notes files as UTF-8 explicitly

---

### Issue: "Unexpected end of input" JavaScript Syntax Error

**Symptom:** Page loads but JavaScript doesn't run, console shows syntax error

**Causes:**
1. Backticks used in JavaScript (Jekyll parser breaks them)
2. `//` comments in `<script>` block
3. Missing closing `}` or `)` braces
4. Template literals where string concatenation needed

**Solution:**
1. Find the problematic line (check browser console for line number)
2. Replace backticks with string concatenation: `` `text` `` → `'text'`
3. Remove `//` comments or replace with `console.warn()`
4. Check brace matching in all functions

**Example Fix:**
```javascript
// ❌ WRONG - backticks and comments
const html = `<div>${data}</div>`;  // Create HTML

// ✅ CORRECT - string concatenation, no comments
const html = '<div>' + data + '</div>';
```

---

### Issue: Table Not Rendering or Shows Raw Markdown

**Symptom:** Table shows as raw markdown text instead of formatted table

**Causes:**
1. Missing `markdown="1"` attribute on wrapping div
2. No blank line after opening `<div>` tag
3. No blank line before closing `</div>` tag
4. Malformed header row or separator row

**Solution:**
1. Verify div has `markdown="1"` attribute
2. Add blank line after `<div class="..." markdown="1">`
3. Add blank line before `</div>`
4. Check header and separator rows match pattern:
   - Header: `| Col 1 | Col 2 | Col 3 | Col 4 |`
   - Separator: `|--------|--------|--------|--------|`

**Example:**
```html
<div class="bugfix-table" markdown="1">

| Header | Header | Header |
|--------|--------|--------|
| data | data | data |

</div>
```

---

### Issue: Search/Filter Functions Not Working

**Symptom:** Search input appears but doesn't filter rows

**Causes:**
1. JavaScript never initialized (function not called or syntax error)
2. Input ID doesn't match JavaScript variable names
3. Table ID doesn't match in JavaScript queries
4. Function defined outside `$(document).ready())` block
5. Event listener not bound to search input

**Solution:**
1. Check browser console for errors
2. Verify IDs match:
   - HTML: `<input id="bugfixSearch" ...>`
   - JS: `document.getElementById('bugfixSearch')`
3. Verify function call at end of ready block: `initBugfixSearch();`
4. Check event listener: `.addEventListener('input', filterBugfixTable);`
5. Move code into ready block if outside

---

### Issue: Conversion Script Produces Mixed HTML and Markdown

**Symptom:** Some rows still have `<tr><td>` tags, others converted to `|...|`

**Cause:** Regex conversion pattern didn't match all rows, or special characters broke parser

**Solution:**
1. Use Python regex instead of PowerShell (PowerShell interprests special characters)
2. Test regex pattern on sample data first
3. Use raw string literals in Python: `r'pattern'`
4. Handle multiline cells with `re.DOTALL` flag
5. Verify all rows converted before committing

**Python Pattern:**
```python
pattern = r'<tr><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td></tr>'
re.sub(pattern, lambda m: f"| {m.group(1)} | {m.group(2)} | {m.group(3)} | {m.group(4)} |", 
       content, flags=re.DOTALL)
```

---

### Issue: Data Corruption After Conversion

**Symptom:** Rows contain garbled text, missing content, or wrong values

**Causes:**
1. Pipe characters `|` in original data not escaped
2. Newline characters not converted to spaces
3. HTML entities not preserved
4. Regex capturing groups too greedy (matched beyond intended row)

**Solution:**
1. Pre-process CSV to escape pipes: `content.replace('|', '\|')`
2. Convert newlines: `content.replace('\n', ' ').replace('\r', ' ')`
3. Verify HTML entities: `&quot;`, `&amp;` should remain as-is
4. Use non-greedy regex: `(.*?)` instead of `(.*)`
5. Test on small sample before running on full file

---

## 9. Tools Used

### Required Tools

**Python 3.x**
- Used for: Safe CSV to markdown conversion
- Scripts: `convert_to_markdown_tables.py`, data processing
- Advantages: Handles special characters correctly, no shell interpretation

**Git & GitHub**
- Used for: Version control, publish to wiki
- Workflow: Commit changes, push to main branch
- Publishing: Automatic Jekyll rebuild on push

**Jekyll**
- Used for: Building and rendering wiki
- Build time: ~10-60 minutes after push
- Local testing: `bundle exec jekyll serve` (if configured)

**Browser DevTools**
- Used for: Testing search/filter, debugging JavaScript
- Console: Check for syntax errors, inspect elements
- Network: Monitor Jekyll rebuild status

### Optional Tools

**Airtable** (or similar database)
- Used for: Data source management
- Features: Easy CSV export, structured data
- Maintenance: Central location for truth data

**VS Code**
- Used for: File editing, preview, Git integration
- Extensions: Jekyll preview, Markdown linting
- Terminal: Run scripts and Git commands

### Conversion Scripts Repository

Store conversion scripts in `wip/temp/` during development, move to `wip/documentation/` if reusable:

**Permanent Scripts (wip/documentation/):**
- Reusable across versions
- Documented with usage instructions
- Example: General CSV-to-markdown converter

**Temporary Scripts (wip/temp/):**
- Version-specific conversions
- Cleanup after use
- Example: R4-specific data processors

---

## 10. Workflow Summary (Quick Reference)

```
1. COLLECT DATA
   └─ Export CSV from Airtable → wip/DataFromAirtable/

2. CREATE FILES
   └─ Create 4 markdown files in wip/_[Version]ModlistVersions/
     ├── CHANGELOG.md
     ├── [Version]-Release-Notes.md
     ├── [Version]-Release-Notes-Bugfixes.md
     └── [Version]-Release-Notes-Mod-Changes.md

3. ADD STRUCTURE
   ├─ Frontmatter (YAML header)
   ├─ CSS styling block
   ├─ jQuery/JavaScript block
   ├─ HTML search controls
   └─ Markdown table wrapper (empty for now)

4. CONVERT DATA
   ├─ Run Python conversion script
   ├─ CSV rows → Markdown format
   └─ Insert converted rows into table

5. VALIDATE
   ├─ Check all rows present
   ├─ Verify no data corruption
   ├─ Test search/filter locally
   └─ Verify UTF-8 encoding

6. PUBLISH
   ├─ Commit to git
   ├─ Push to main branch
   ├─ Wait 10+ minutes for Jekyll rebuild
   └─ Verify on live wiki.wildlandermod.com

7. FINAL QA
   ├─ Table displays correctly
   ├─ Search works
   ├─ Filters populate
   ├─ Result counter updates
   └─ All rows visible
```

---

## Appendix A: File Templates

### Minimal Markdown File Template

```yaml
---
layout: default
title: Release Notes - R[X] [Type]
nav_exclude: true
parent: Release Notes - R[X]
description: Description of content
---

## Wildlander R[X] - [Title]

Brief introduction about this section.

<style>
/* CSS for search input and table styling */
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  function init() { }
  function filter() { }
  init();
});
</script>

<input type="text" id="search" placeholder="Search..." />
<div id="result"></div>

<div class="table-name" markdown="1">

| Col 1 | Col 2 | Col 3 | Col 4 |
|-------|-------|-------|-------|
| data | data | data | data |

</div>

---

**Total Entries:** X
```

---

## Appendix B: Glossary

- **CSV:** Comma-Separated Values; plain text data format
- **Airtable:** Online database for structured data management
- **Jekyll:** Static site generator used for wiki
- **Markdown:** Lightweight markup language for formatting text
- **Frontmatter:** YAML metadata at top of markdown files
- **Markdown Table:** Plain-text table format with pipes `|`
- **`markdown="1"` attribute:** Tells Jekyll to process markdown inside HTML div
- **jQuery:** JavaScript library for DOM manipulation
- **Regex/RegExp:** Regular expression pattern matching
- **Entity:** HTML special character codes (`&quot;` for `"`)

---

**Document End**

For questions or updates, refer to the latest copilot-instructions.md in the repository.
