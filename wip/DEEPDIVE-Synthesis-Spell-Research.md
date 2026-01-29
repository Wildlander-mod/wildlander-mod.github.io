---
layout: default
title: Deep Dive - Synthesis & Spell Research Synthesizer
description: Complete guide to installing and using Synthesis with Spell Research Synthesizer in Wildlander
---

# Deep Dive: Synthesis & Spell Research Synthesizer

Synthesis is a patcher framework that allows mod authors to create complex modifications to your game after loading all mods. The Spell Research Synthesizer is a Synthesis patcher that generates spell research content and manages spell book conversions in your modlist.

---

## What is Synthesis?

Synthesis is a C#-based modding framework that:

- **Runs after mod load order** - Patches are applied after all mods are loaded, allowing compatibility checks
- **Generates content dynamically** - Creates records based on your specific mod configuration
- **Provides a GUI interface** - User-friendly settings without command-line knowledge
- **Maintains compatibility** - Patches work with your specific load order without conflicts

### How Synthesis Differs from Traditional Patching

**Traditional Patching (xEdit):**
- Manual creation of conflict resolutions
- Static output that must be regenerated if mod order changes
- Requires deep technical knowledge
- Time-consuming for complex patches

**Synthesis Patching:**
- Automated based on load order and settings
- Regenerated quickly when load order changes
- User-friendly MCM-style interface
- Efficient for complex cross-mod compatibility

---

## Initial Setup

1. **Launch Synthesis** - Run `Synthesis.exe`
2. **Open Settings** - Click the gear/cog icon (top right area)
3. **Set Installation Data Folder:**
   - Navigate to "Profiles" tab
   - Set "Installation Data Folder" to your **stock Skyrim Special Edition** installation
   - This should contain unmodified Skyrim files (the base game)
   - Click the back icon (top left) to return to main window

## Adding Spell Research Synthesizer Patcher

1. **Find Git Repository Button** - Look for icon in top left (square tilted 45° with branch symbol)
2. **Enter Repository URL:**
   - Click "Git Repository" button
   - Go to "Input" tab
   - Paste: `https://github.com/audriuska12/SpellResearchSynthesizer`
   - Click "Add from Repository"

3. **Select Project File:**
   - A dropdown menu appears with available projects
   - Select: `SpellResearchSynthesizer.csproj`
   - This adds the patcher to your Synthesis profile

---

## Configuring Spell Research Synthesizer

### Initial Setup

Once the Spell Research Synthesizer is added:

1. **Locate Settings** - Find the patcher in the main Synthesis window
2. **Open Settings Panel** - Click the settings icon or panel associated with the patcher
3. **Navigate to Main Configuration** - Settings are organized by spell level and process type

### Critical Configuration: Prevent Spell Book Conversion

**This is the most important setting for Wildlander:**

The synthesizer can convert spell books to "study" archetype manuals. In Wildlander, we want to **prevent this conversion** because:
- Standard spell books work better with Requiem's spell system
- Study manuals have different mechanics that may break compatibility
- We want to generate new research content, not modify existing spells

**To configure correctly:**

For **each Spell Level section** (Novice, Apprentice, Adept, Expert, Master):

1. **Untick "Process"** - This disables spell book conversion for that level
   - Finding: Look for checkbox labeled "Process" in each spell level section
   - Action: **UNCHECK** this box for ALL spell levels

2. **Enable Research Generation Only:**
   - Tick: **"Generate FLM"** (Generate Formula List Member - this creates research content)
   - Leave **UNTICKED:** All other checkboxes in this area
   - These other options control optional features we don't need

**Summary of Correct Settings:**

```
Novice Spells:
  ☐ Process (UNCHECKED - prevents conversion)
  ☑ Generate FLM (CHECKED - generates research)
  ☐ [other options] (UNCHECKED)

Apprentice Spells:
  ☐ Process (UNCHECKED)
  ☑ Generate FLM (CHECKED)
  ☐ [other options] (UNCHECKED)

[Repeat for Adept, Expert, Master levels]
```

---

## Running the Synthesizer

### Generate Patcher Output

1. **Load Mod Order** - Synthesis needs your current load order visible
   - Ensure your mod manager is set up with your Wildlander load order
   - Synthesis will scan this to understand your mods

2. **Run Patcher:**
   - Click the "Run" button (usually in bottom right of Synthesis window)
   - Synthesis processes all patcher rules
   - Progress bar shows patcher execution
   - Process takes 30-60 seconds typically

3. **Review Output:**
   - Synthesis generates a new ESP file
   - Default output location: `[Synthesis folder]\Synthesized\[ProfileName].esp`
   - This file contains all generated spell research content

### Output File

The synthesizer creates:
- **Output ESP:** Contains generated research spells and formulas
- **Filename:** Typically `SynthesizedPatch.esp` or `SpellResearchSynthesis.esp`
- **Size:** Usually 1-5 MB depending on your load order and mods

---

## Using the Output in Your Load Order

### Adding to Mod Manager

1. **Locate Output File** - Find the generated ESP in Synthesis output folder
2. **Copy to Mods Folder:**
   - Copy the ESP file to your mod manager's mods folder
   - In Mod Organizer 2: `[MO2 folder]\mods\[New Folder]\`
   - Create a folder like "Synthesized Patch - Spell Research"

3. **Add to Load Order:**
   - Refresh mod manager to detect the new mod
   - Enable the synthesized patch in your mod list
   - Place in load order **after** all spell-related mods
   - **Important:** Should load AFTER mods like:
     - Spell Research Framework (if used)
     - Apocalypse, Mysticism (if used)
     - Other spell-adding mods

4. **Save Load Order** - Ensure your mod manager saves the change

### Load Order Placement Rules

The synthesized patch should load:
- **AFTER** all mods that add or modify spells
- **BEFORE** any utility patches or fixes
- Near the **end of your load order**, but before game patches

Example placement:
```
...
Apocalypse.esp
Mysticism.esp
[other spell mods]
SynthesizedPatch.esp ← Synthesized patch here
Setstyle - Creation Club.esp
Bashed Patch.esp
Smashed Patch.esp
```

---

## Understanding What Spell Research Synthesizer Does

### Research Generation

The "Generate FLM" setting creates:
- **Research Formulas** - Spell combinations that can be researched
- **Recipe Books** - Study manuals that teach research combinations
- **Skill Requirements** - Prerequisite conditions for learning research formulas

### What Gets Generated?

For each spell level (Novice through Master):

1. **Research Combinations** - Spells can be combined to research new spells
2. **Study Materials** - Materials needed to research combinations
3. **Research Progression** - Creates logical progression for spell research system

### Why We Untick "Process"?

The "Process" setting controls spell **book conversion**:
- **Enabled:** Converts spell books to "study" format (breaks compatibility)
- **Disabled:** Keeps spell books in standard format, only adds research content

---

## Troubleshooting

### Synthesis Won't Start

**Issue:** "Installation Data Folder not set" error
- **Solution:** 
  1. Open Settings → Profiles tab
  2. Set folder to your stock Skyrim SE installation
  3. Must contain Data folder with original Skyrim files
  4. Cannot point to modded installation

**Issue:** Can't find Git Repository button
- **Solution:**
  1. Look top-left of main Synthesis window
  2. Icon looks like tilted square with branch symbol
  3. Hover over buttons to see tooltips if unsure
  4. May be in "Input" section of interface

### Patcher Fails to Run

**Issue:** "Repository not found" error
- **Solution:**
  1. Check internet connection
  2. Verify URL copied correctly: `https://github.com/audriuska12/SpellResearchSynthesizer`
  3. Try removing and re-adding repository

**Issue:** "SpellResearchSynthesizer.csproj not found"
- **Solution:**
  1. Ensure repository URL is correct
  2. Click refresh button to reload project list
  3. Verify spelling of `.csproj` filename

### Output File Doesn't Generate

**Issue:** "Run" button produces no file
- **Solution:**
  1. Check Synthesis console output for error messages
  2. Verify all required settings are configured
  3. Ensure mod order is loaded (check in Settings)
  4. Try running again - sometimes takes multiple attempts

### Spells Not Appearing in Game

**Issue:** Generated research content doesn't appear
- **Solution:**
  1. Verify synthesized patch is enabled in mod manager
  2. Check load order placement (should be near end)
  3. Run Synthesis again and regenerate
  4. Delete old synthesized patch and regenerate fresh
  5. Verify no load order conflicts using xEdit

---

## Regenerating After Mod Changes

**When to Regenerate:**

- Added or removed spell mods to your load order
- Changed mod load order significantly
- Updated a spell-related mod
- Want to add new research formulas

**How to Regenerate:**

1. Open Synthesis
2. Update your mod manager load order
3. Click "Run" in Synthesis
4. Delete old synthesized patch ESP from your load order
5. Copy new synthesized patch to mods folder
6. Add to load order in same position

---

## Common Questions

**Does Synthesis work with other patchers?**
Yes! Synthesis works alongside Bashed Patch, Smashed Patch, and other patchers. Just ensure load order placement makes sense (Synthesis patch → other patches).

**Will regenerating lose my game progress?**
No. Synthesis patches are ESPs - they don't affect existing saves. You can regenerate anytime, and saves continue working.

**Can I use Spell Research Synthesizer with other spell frameworks?**
It depends on compatibility. The framework was designed for Skyrim's core spell system. Test by generating and checking if new spells appear correctly in-game.

**What if I don't want research content, just spell fixes?**
The Spell Research Synthesizer specifically generates research content. If you only need spell balancing, consider other Synthesis patchers designed for that purpose.

**How often should I regenerate the patch?**
Only when your load order changes or you update spell-related mods. No need to regenerate frequently - once per month or per major load order change is sufficient.

---

## Resources

- **Synthesis Documentation:** [mutagen-modding.github.io/Synthesis](https://mutagen-modding.github.io/Synthesis/Installation/)
- **Spell Research Synthesizer Repository:** [github.com/audriuska12/SpellResearchSynthesizer](https://github.com/audriuska12/SpellResearchSynthesizer)
- **Synthesis Patchers Directory:** Check Synthesis documentation for other available patchers
- **Community Support:** Discuss issues on mod pages or modding communities

---

## Next Steps

1. **Download and Install Synthesis** - Set up the application outside your game folder
2. **Configure Installation Data Folder** - Point to stock Skyrim SE
3. **Add Spell Research Synthesizer** - Use Git Repository feature
4. **Adjust Settings** - Ensure all spell levels have Process UNCHECKED, Generate FLM CHECKED
5. **Run First Generation** - Generate initial synthesized patch
6. **Add to Load Order** - Copy output ESP to mods folder and enable it
7. **Test in Game** - Verify generated spells appear and no conflicts occur
8. **Regenerate as Needed** - When you change spell mods or load order

**Remember:** Synthesis is powerful but only when configured correctly. Take time with initial setup to prevent issues later. The Spell Research Synthesizer specifically helps create research progression - focus on preventing unwanted spell conversions by keeping "Process" unticked.
