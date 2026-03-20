# Skyrim Follower Batch Processing Workflow

**Purpose:** Standardized workflow for syncing all 77 Skyrim followers from Wildlander Core R4 JSON source files to wiki with accurate perks and data.

**Status:** Batches 1-9 complete (26/77 followers = 33.8%). Batches 10+ pending.

---

## Quick Reference: The Three-Step Cycle

For each batch (typically 3 followers):

1. **LOCATE** → Find JSON files in `i:\Wildlander Core R4\Npcs\`
2. **EXTRACT** → Pull perk FormIDs from JSON "Perks" array
3. **EXPAND** → Replace wiki entries with comprehensive perk lists from standardization notes
4. **VERIFY** → Search wiki for distinctive perks to confirm replacement

---

## Step 1: Locate JSON Files

**Command:**
```
file_search("i:\Wildlander Core R4\Npcs\*FollowerName*")
```

**What to expect:**
- Returns full path to JSON file if follower is available
- Most vanilla Skyrim followers available
- Dragonborn followers in `DLC2*` files
- External mod followers often UNAVAILABLE (skip these)
- Some followers have variant naming (e.g., `*Sticks*` for Runs-With-Sticks)

**Common issues:**
- Follower name variations: Try wildcards like `*Sticks*`, `*Zahan*`, `*ja*`
- External mod followers (Dawnstar Sanctuary, etc.) with 4+ letter hex prefixes typically unavailable
- If 1/3 followers unavailable → Process 2/3 as single batch (e.g., Batch 8 had Runs-With-Sticks + Sameth only, skipped Soh'ja Zahan)

---

## Step 1.5: Extract FormID from Filename (Quick Reference)

**JSON filename structure:** `[FollowerName] - [FormID]_[Plugin].json`

**Example:** `Talvas Fathryon - 017777_Dragonborn.esm.json`
- FormID: `017777` (extracted from filename)
- Plugin: `Dragonborn.esm`
- Use this FormID to verify against wiki entries' RefID fields

**Why this matters:**
- Quick cross-check: Compare filename FormID with wiki RefID to catch mismatches
- Future batch planning: Can reference followers by FormID for faster file lookups
- Verification: If wiki shows mismatched RefID (e.g., Vorstag wiki showed 000B9984 but JSON was 0B997F), flag for correction

---

## Step 2: Extract Perk FormIDs from JSON

**Process:**

### 2A. Find Perks Section
```
read_file(jsonfile, startLine: 1, endLine: 100)
```
Look for:
```json
"Perks": [
  {
    "Perk": "0153CF:Skyrim.esm",
    "Rank": 1,
    ...
  },
  ...
]
```

### 2B. Identify Source (Skyrim.esm vs Requiem.esp vs DLC files)
- `Skyrim.esm` → Vanilla Requiem perks (most common)
- `Requiem.esp` → Universal perks like Trait Follower (270B76), Charisma Bonus (270B77)
- `Dragonborn.esm` → DLC2 perks (less common)

### 2C. Extract All FormIDs in Sequence
```
grep_search(jsonfile, "Perk")
```
Shows line numbers. Read sections containing all `"Perk"` entries.

**Output Format - Create simple list:**
```
Talvas FormIDs: 0153CF, 0153D2, 053128, 053129, 0581E4, 0581E7, 0581EA, ...
```

### 2D. Note the Count
Used later to estimate entry size (e.g., Teldryn has 30 perks → expect 30+ line replacement).

---

## Step 3: Map FormIDs → Perk Names & Descriptions

**Primary Reference:** `PERK-STANDARDIZATION-NOTES.md` (240+ documented perks)

**Process:**

### 3A. Create School-Based Organization
Look at the FormIDs and identify schools from standardization notes:

| Perk Name | School | FormID | Description |
|-----------|--------|--------|-------------|
| Novice Conjuration | Conjuration | 0153CF | Novice spells cost 55% less magicka, and improve 1% per skill level. |
| Apprentice Conjuration | Conjuration | 0153D2 | Apprentice spells cost 55% less magicka, and improve 2% per skill level. |
| Magic Resistance II | Alteration | 053128 | 20% Magic Resistance |
| ... | ... | ... | ... |

**Fast lookup:** Grep the standardization notes for each FormID or perk name.

### 3B. Handle Unknown Perks
If a FormID appears in JSON but NOT in standardization notes:
1. Add descriptive text from wiki (if already documented there)
2. Add FormID + description to PERK-STANDARDIZATION-NOTES.md with "Unknown - Requires FormID extraction" status
3. Placeholder pattern: `TBD_FOLLOWERNAME_SCHOOLX`

**Example:** Unknown perks from Marcurio → Added as TBD_MARCURIO_ALT1-3, TBD_MARCURIO_DEST1-4

### 3C. Organize by School
Conjuration perks → Conjuration section
One-Handed perks → One-Handed section
Unique perks → Unique section
Universal perks (always 270B76, 270B77) → Requiem Perks (Universal) section

---

## Step 4: Retrieve Current Wiki Entry

**Command:**
```
grep_search(7-Available-Followers.md, "FollowerName")
```

Returns line numbers. Then:
```
read_file(7-Available-Followers.md, startLine: XXX, endLine: YYY)
```

**What to expect:**
- Minimal/corrupted entries (the goal is to expand these)
- Some followers have "None" for perks
- RefID in wiki may be INCORRECT (e.g., Runs-With-Sticks had 4400ED94 but JSON shows 00ED93)

**Correct the RefID:**
- Look at JSON "FormKey": field → extract the prefix (e.g., "017777:Dragonborn.esm" → RefID 017777)
- Use this in wiki entry

**Skip updating Info section** unless critical errors (we keep location, level ranges from existing entry)

---

## Step 5: Build Expanded Wiki Entry

**Template Structure:**

```markdown
<summary> Follower Name </summary>

<div class="Info" markdown="1">
<p class="text-gamma">Info</p>

|Race/Class |...|Location |...|
|Level Min/Max |...|Prerequisite |...|
|Blades |...|Marriage |...|
|Steward |...|RefID |XXXXX|

|Morality: N – ...

<p class="text-gamma">Perks</p>

<p class="text-delta">School Name</p>

|Perk Name|Description|
|Perk Name|Description|

... repeat for each school ...

<p class="text-delta">Unique</p>

|Unique Perk|Description|

<p class="text-gamma">Requiem Perks (Universal)</p>

|Trait Follower|+60 carry weight ... (FormID: 270B76)|
|Charisma Bonus|If player has Leadership ... (FormID: 270B77)|

<p class="text-gamma">Spells</p>

<p class="text-delta">School Name</p>

|Spell Name|
|Spell Name|

... repeat for each spell school ...

***

</div>
</details>
```

**School Order (Alphabetical by header):**
1. Alteration
2. Block
3. Conjuration
4. Destruction
5. Evasion
6. Heavy Armor
7. Illusion
8. Lockpicking
9. Mace
10. Marksman
11. One-Handed
12. Restoration
13. Sneak
14. Two-Handed
15. Then: Unique
16. Then: Requiem Perks (Universal)

**Spell Order:** Same alphabetical by school

---

## Step 6: Apply Wiki Replacement

**Command:**
```
replace_string_in_file(7-Available-Followers.md, oldString, newString)
```

**oldString Requirements:**
- Include 3-5 lines of context BEFORE and AFTER the change
- Must uniquely identify the section (include opening `<summary>` and closing `</div></details>`)
- Include first line of Info table and last line before next follower's `</details>`

**Example oldString pattern:**
```
<details>
 <summary> Follower Name </summary>
 
<div class="Info" markdown="1">
...
|RefID |XXXXX

|Morality: N – ...

<p class="text-gamma">Perks</p>

...

***

</div>
</details>
```

**Pro tip:** For 3+ followers in same batch, use `multi_replace_string_in_file` to apply all at once (more efficient).

---

## Step 7: Verification via Distinctive Perk Search

**Pattern:** Each follower has 2-3 distinctive perks that uniquely identify them.

**Process:**
```
grep_search(7-Available-Followers.md, "DistinctivePerkName")
```

**Expected result:** Match found at correct follower's line number.

**Common distinctive perks:**
- `Rune Mastery` → Talvas
- `Vexing Flanker` → Jenassa, Teldryn, Ugor, others (cross-check line number)
- `Devastating Charge` → Stenvar
- `Purification Process` → Amanra Solas
- `Locksmithing Lore` → Multiple (verify exact line)
- `Trait Follower` (270B76) → All universal requiem perks followers

**If perk NOT found:** Replacement failed → Review oldString/newString and retry.

---

## Step 8: Update Standardization Notes (If Unknown Perks Found)

**When to update:**
- New perk discovered that wasn't in standardization notes
- Need to replace TBD_* placeholders with actual FormIDs

**Process:**
```
grep_search(PERK-STANDARDIZATION-NOTES.md, "PerkName")
```

If not found:
```
replace_string_in_file(PERK-STANDARDIZATION-NOTES.md, ...)
```

Add row to appropriate school section:
```
| **Perk Name** | Description from wiki | FormID |
```

**Example (from Session Batch 4):**
Added these 7 unknowns under ALTERATION/DESTRUCTION:
- Spellmaking, Mage's Endurance, Density (Alteration)
- Savage Impact, Blast Wave I/II/III (Destruction)

---

## Batch Processing Checklist

For each batch (repeat 3+ times):

- [ ] **Locate:** `file_search("*FollowerName*")` → confirm JSON exists
- [ ] **Extract:** Read JSON Perks array → list all FormIDs
- [ ] **Reference:** Map FormIDs to perk names in standardization notes
- [ ] **Wiki Lookup:** `grep_search("FollowerName")` → find current entry
- [ ] **Build:** Create expanded entry with schools + perks + spells
- [ ] **Replace:** `replace_string_in_file()` with full context
- [ ] **Verify:** `grep_search("DistinctivePerk")` → confirm match
- [ ] **Update Standardization:** If any new perks found

---

## Common Race Corrections

Watch for RefID mismatches:

| Race | FormID | Notes |
|------|--------|-------|
| Argonian | 013740 | Runs-With-Sticks was mislabeled as Nord |
| Breton | 013741 | Common female race |
| Dark Elf (Dunmer) | 013742 | Common for Mage & Spellsword followers |
| Orc | 013747 | Ugor (and others) |
| Nord | 013746 | Common in Skyrim |
| Khajiit | 013745 | Kharjo, others |

**Always verify race FormID against actual file!**

---

## Time Estimates

**Per Follower (assuming JSON available):**
- Locate + Extract: 2 minutes
- Map FormIDs: 3-5 minutes (depends on perk count)
- Build wiki entry: 3-5 minutes
- Replace + Verify: 1-2 minutes

**Per Batch (3 followers):** ~30-40 minutes total work

**Tokens per Batch:** ~3000-5000 tokens (varies with perk complexity)

---

## Known Issues & Workarounds

| Issue | Solution |
|-------|----------|
| Unavailable JSON files | Skip follower, note as external mod (e.g., Soh'ja Zahan) |
| RefID mismatch in wiki | Extract from JSON FormKey, update in entry |
| Race appears wrong | Verify FormID mapping in Races/ folder |
| Unknown perks in JSON | Add to standardization notes with FormID TBD |
| Duplicate Sneak section | Clean up during replacement (Talvas had this) |
| Wiki entry cut off mid-spell | Extend endLine in read_file to capture full entry |
| grep_search finds multiple matches | Verify correct line number matches follower name |

---

## Folders & File Locations

| Purpose | Path |
|---------|------|
| JSON source | `i:\Wildlander Core R4\Npcs\` |
| Wiki working file | `c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\7-Available-Followers.md` |
| Release wiki | `c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\_04WildlanderWorld\7-Available-Followers.md` |
| Perk standards | `c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\PERK-STANDARDIZATION-NOTES.md` |
| Race FormIDs | `i:\Wildlander Core R4\Races\` |

---

## Next Steps for Future Sessions

1. **Batch 10-13:** Process remaining ~12-15 followers in this pattern
2. **Update Release Wiki:** After final batch, merge wip/ → _04WildlanderWorld/
3. **Final Audit:** grep_search for any remaining "None" perk entries
4. **Standardization:** Ensure all perks documented in PERK-STANDARDIZATION-NOTES.md

---

**Document Version:** 1.0  
**Last Updated:** March 19, 2026  
**Sessions Completed:** 1-9 (26/77 followers)  
**Ready for:** Batch 10+
