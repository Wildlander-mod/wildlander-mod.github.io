# Wiki File Organization & Folder Structure Standards

**Document Version:** 1.0  
**Last Updated:** March 20, 2026  
**Context:** Established during Wildlander R4 spell research page updates

## Overview

This document defines folder structure standards and file organization conventions for the Wildlander wiki project. These standards ensure content is properly categorized, working files are separated from deployment-ready content, and future updates can follow a consistent workflow.

---

## 1. Main Wiki Directory Structure

The main wiki repository (`wildlander-mod.github.io/`) uses numbered section folders matching Jekyll's Just-the-Docs theme convention.

### Section Folders (for deployment)
- `_01Help/` - Quick help pages
- `_01Support/` - Support & troubleshooting (CTDs, Known Issues, FAQ)
- `_02-RecommendedReading/` - Essential reading for new players
- `_03-YourFirstCharacter/` - Character progression mechanics
- `_04WildlanderWorld/` - World systems, followers, economy
- `_05-HintsandTips/` - Gameplay tips
- `_06Dungeons/` - Dungeon and location information
- `_07-GearAnalysis/` - Equipment analysis (armor, weapons)
- `_08-SkillAnalysis/` - Skill mechanics analysis
- `_09-How-Do-i/` - How-to guides
- `_10-Crafting/` - Crafting recipes (cooking, alchemy, smithing, etc.)
- `_11Deep-Dives/` - In-depth technical documentation
- `_12Cheat-Sheets/` - Reference tables and quick-lookup sheets
- `_13Community/` - Community content and contributions
- `_14ModlistVersions/` - Modlist version-specific information
- `_15ClassGuides/` - Character build guides by class
- `_16OtherResources/` - External links and additional resources
- `_17Bestiary/` - Enemy/NPC reference information

### Key Requirements for Section Folders
- Every `.md` file MUST have valid YAML frontmatter (layout, title, nav_order, description)
- Files are automatically excluded from builds if they reside in `wip/` folder
- Only finalized, tested content should be in main wiki directories
- All deployment-ready files are in main wiki, not in `wip/`

---

## 2. Working Directory Structure (`wip/`)

The `wip/` (work-in-progress) folder parallels the main wiki structure but contains files that are:
- Still being updated or reviewed
- Awaiting deployment
- In testing phase
- Not yet ready for live site

### Recommended `wip/` Subfolder Structure

```
wip/
├── _12Cheat-Sheets/          (content folders matching main wiki structure)
├── _04WildlanderWorld/
├── _11Deep-Dives/
├── _10-Crafting/
│
├── documentation/            (👈 NEW - workflow & standards docs)
│   └── FILE-ORGANIZATION-STANDARDS.md
│
├── _scripts/                 (working scripts, temporary tools, mapping files)
│   ├── *.ps1 (PowerShell scripts)
│   ├── *.py (Python scripts)
│   ├── *-replacements.txt (mapping/data files)
│   └── SCRIPT-USAGE-LOG.md (optional: which scripts were used when)
│
├── templates/                (template files for reuse)
│   ├── TEMPLATE-ReleaseNotes.md
│   └── TEMPLATE-WildlanderWorldSubpage.md
│
├── incomplete/               (WIP content - incomplete articles)
│   ├── Barbarian.md
│   └── [other incomplete pages]
│
├── backup/                   (archival/backup versions)
│   ├── 7-Available-Followers.BACKUP.md
│   └── [previous versions before major edits]
│
└── [individual files at root level]
    ├── BATCH-PROCESSING-WORKFLOW.md (👈 should move to documentation/)
    └── PERK-STANDARDIZATION-NOTES.md (👈 should move to documentation/)
```

---

## 3. Folder Categories & Usage

### Content Folders (match main wiki structure)
**Purpose:** Staging area for deployment-ready content  
**Contents:** `.md` files with proper frontmatter, matching main wiki sections  
**Example:** `wip/_12Cheat-Sheets/` contains spell research pages awaiting deployment  
**Lifecycle:** Move to main wiki directory once reviewed and approved

### `documentation/` Folder
**Purpose:** Store workflow documentation, standards, and process guides  
**Contents:**
- FILE-ORGANIZATION-STANDARDS.md (this file)
- Workflow guides for specific projects
- Process documentation for recurring tasks
- Architecture/design decisions  

**Examples:**
- "R4-Update-Workflow.md" (steps for updating for new releases)
- "Spell-Research-Update-Process.md" (process for updating spell research pages)
- "File-Organization-Standards.md" (shared knowledge about folder structure)

**Lifecycle:** Keep as reference; update as processes change

### `_scripts/` Folder
**Purpose:** Hold temporary PowerShell/Python scripts and mapping files used during updates  
**Contents:**
- `*.ps1` scripts (PowerShell utilities, replacement scripts, converters)
- `*.py` scripts (Python utilities)
- `*-replacements.txt` (mapping data: old names → new names)
- `ELIXIR_REPLACEMENT_SUMMARY.md` (optional: summary of replacements applied)
- `SCRIPT-USAGE-LOG.md` (optional: document which scripts were used when)

**Guidelines:**
- Scripts are temporary working files; delete when project is complete
- Keep mapping data files (*.txt) as reference for what replacements were made
- One subfolder per major project (`_scripts/R4-Update/`, `_scripts/Content-Refresh/`, etc.) if organizing by project

**Lifecycle:** Delete scripts after verification; keep mapping data as reference

### `templates/` Folder
**Purpose:** Store reusable template files for consistent page creation  
**Contents:**
- Release notes templates
- Section page templates
- Standard page layouts  

**Examples:**
- TEMPLATE-ReleaseNotes.md (copy for each release)
- TEMPLATE-WildlanderWorldSubpage.md (copy for new world pages)

**Lifecycle:** Persistent; update as templates improve

### `incomplete/` Folder
**Purpose:** Hold work-in-progress content that isn't ready for deployment  
**Contents:**
- Pages with incomplete sections
- Articles in early drafts
- Content awaiting research or updates
- Pages pending review

**Examples:**
- Spell Research pages needing source/archetype data
- Barbarian class guide (incomplete)

**Lifecycle:** Move to appropriate content folder when complete; archive to backup/ if abandoned

### `backup/` Folder
**Purpose:** Archive previous versions before major edits  
**Contents:**
- `.BACKUP.md` files (previous versions before significant rewrites)
- Version snapshots before major replacements

**Examples:**
- `7-Available-Followers.BACKUP.md` (snapshot before restructuring)
- `Solutions-View.BACKUP.md` (snapshot before R4 name updates)

**Lifecycle:** Keep for reference; can be deleted after edit completion is verified

---

## 4. File Organization Workflow: Example (R4 Spell Research Update)

This example demonstrates the complete workflow for organizing files during a major content update.

### Phase 1: Copying & Staging
```
Main Wiki (source)          →  wip/ (staging)
_12Cheat-Sheets/                _12Cheat-Sheets/
├── Solutions-View.md        ├── Solutions-View.md
├── Elixir View.md           ├── Elixir View.md (updated)
├── Ingredient View.md       ├── Ingredient View.md (updated)
├── Effect View.md           ├── Effect View.md
└── Spells View.md           └── Spells View.md
```

### Phase 2: Create Working Files
```
wip/
├── _12Cheat-Sheets/
│   ├── Solutions-View.md (being updated)
│   └── Elixir View.md (being updated)
│
├── _scripts/
│   ├── ReplaceNames.ps1 (new: applies solution replacements)
│   ├── ApplyArchetypeReplacements.ps1 (new: updates archetype refs)
│   ├── solution-replacements.txt (new: 114 mapping pairs)
│   └── elixir-replacements.txt (new: 330 mapping pairs)
```

### Phase 3: Apply Updates
- Run replacement scripts against staging files
- Verify replacements with grep/search tools
- Log results: "114 solutions updated, 259 elixirs updated, 21 archetypes updated"

### Phase 4: Organize & Finalize
```
After verification:

wip/
├── _12Cheat-Sheets/
│   ├── Solutions-View.md (✅ READY - move to main wiki)
│   ├── Elixir View.md (✅ READY - move to main wiki)
│   ├── Ingredient View.md (✅ READY - move to main wiki)
│   ├── Effect View.md (✅ READY - move to main wiki)
│   └── Spells View.md (✅ READY - move to main wiki)
│
├── _scripts/
│   ├── ReplaceNames.ps1 (⚠️ DELETE - temporary working file)
│   ├── solution-replacements.txt (📝 KEEP - reference of what changed)
│   └── [other temporary files - DELETE]
│
└── documentation/
    └── FILE-ORGANIZATION-STANDARDS.md (reference)
```

### Phase 5: Deployment
- Move `_12Cheat-Sheets/` folder contents to `main-wiki/_12Cheat-Sheets/`
- Delete temporary scripts from `_scripts/`
- Keep mapping data files (*.txt) for reference
- Push to GitHub; Jekyll rebuilds with new content

---

## 5. File Naming Conventions

### Wiki Pages (Markdown Files)
- **Format:** Hyphenated-lowercase or PascalCase-matching-title
- **Examples:**
  - `character-creation.md` (hyphenated)
  - `Character-Creation.md` (PascalCase matching title in frontmatter)
  - `7-Available-Followers.md` (numeric prefix for ordering)
- **Rule:** Be consistent within each section

### Frontmatter Requirements
Every `.md` file in deployment folders MUST have:
```yaml
---
layout: default
title: Page Title
nav_order: 5
description: Brief description (optional but recommended)
has_toc: true (optional, adds auto table of contents)
---
```

### Script Files (in `_scripts/`)
- **PowerShell:** `ScriptName.ps1` (verb-noun format: `Apply`, `Generate`, `Convert`)
  - `ReplaceNames.ps1`
  - `ApplyArchetypeReplacements.ps1`
  - `Convert-KnownIssuesCSV.ps1`
- **Python:** `script_name.py` (snake_case)
  - `generate_solution_replacements.py`
- **Data/Mapping:** `descriptor-replacements.txt` or `descriptor-mapping.csv`
  - `solution-replacements.txt` (pairs: oldname → newname)
  - `elixir-replacements.txt` (mapping table)

### Documentation Files (in `documentation/`)
- **Format:** SECTION-DESCRIPTION.md (all-caps section, hyphenated description)
- **Examples:**
  - `FILE-ORGANIZATION-STANDARDS.md`
  - `R4-UPDATE-WORKFLOW.md`
  - `SPELL-RESEARCH-UPDATE-PROCESS.md`

---

## 6. Quality Standards for Deployment

Before moving content from `wip/` to main wiki, verify:

- ✅ **Frontmatter:** Valid YAML, all required fields present
- ✅ **Content:** Tested, reviewed, no placeholder text
- ✅ **Links:** All cross-wiki links use full URLs (`https://wiki.wildlandermod.com/section/page/`)
- ✅ **Naming:** Content matches wiki folder structure and naming conventions
- ✅ **Encoding:** All files saved as UTF-8 (not Windows-1252 or other)
- ✅ **File Permissions:** Readable and writable by build process
- ✅ **Search Verification:** If indexed table, verify search/filter works

---

## 7. When to Use Each Folder

| Scenario | Folder | Action |
|----------|--------|--------|
| Creating new wiki page | `wip/[section]/` | Write & test in wip, move to main when ready |
| Updating existing page | `wip/[section]/` | Copy from main, edit in wip, move back when done |
| Writing replacement script | `wip/_scripts/` | Create script here; delete when done |
| Saving mapping data | `wip/_scripts/` | Keep *.txt files as reference |
| Documenting workflow | `wip/documentation/` | Document process for future reference |
| Creating page template | `wip/templates/` | Copy template when creating new pages |
| Incomplete content | `wip/incomplete/` | Move to content folder when finished |
| Previous version backup | `wip/backup/` | Save .BACKUP.md before major edits |

---

## 8. Cleanup Checklist

After completing a major project (e.g., R4 update):

- [ ] Move all finalized content from `wip/[section]/` to main wiki `[section]/`
- [ ] Verify all content appears correctly on live wiki (wait 10+ min for Jekyll rebuild)
- [ ] Delete temporary scripts from `_scripts/` (keep only mapping data files)
- [ ] Move incomplete pages to `wip/incomplete/` (do not leave in content folders)
- [ ] Archive previous versions to `wip/backup/` if replaced entirely
- [ ] Update `documentation/` with new learnings or process changes
- [ ] Document script usage in `_scripts/SCRIPT-USAGE-LOG.md` for next project
- [ ] Verify no `wip/` folder remains in git (it's in .gitignore)

---

## References

- [Wildlander Wiki Copilot Instructions](../../.github/copilot-instructions.md)
- [Jekyll Just-the-Docs Theme](https://just-the-docs.com/)
- [GitHub Pages Build States](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/)

