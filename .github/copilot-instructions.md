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
- **Code blocks:** Only for crafting recipes and formulas—NOT for highlighting syntax or general emphasis.
- Use backticks ` for inline elements (except hotkeys—use **bold** instead).

### Hotkey Formatting
- **Always use bold:** `**L**` not `` `L` ``
- **Example:** "Press **F11** to open settings" or "Press **Right Shift** + **E**"
- Backticks create unwanted styling in Jekyll rendering

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

## Key Files for Reference

- `README.md` — Detailed wiki maintenance guide (definitive source)
- `_config.yml` — Jekyll theme and publishing config
- `_03-YourFirstCharacter/0-Start-Here.md` — Model page with proper structure
- `.github/workflows/pages.yml` — Auto-deploy configuration
