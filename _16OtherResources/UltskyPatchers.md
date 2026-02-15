---
layout: default
title: Ultimate Skyrim Patchers
description: Ultimate Skyrim - Patchers
parent: Ultimate Skyrim
---

{: .important}
> **Patchers for Ultimate Skyrim**: These tools are optional and used to enhance specific aspects of the modlist. Installation is not required for core functionality. See [FAQ](https://wiki.wildlandermod.com/16OtherResources/UltSkyFAQ/#reqtificator) for required Reqtificator setup.

## Table of Contents
{: .no_toc }
<details markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

---

# Nemesis

**What it does:** Replaces Fore's New Idles for Skyrim (FNIS) and allows mods to use new animations.

**When to use:** Already installed in Ultimate Skyrim 4.1+. Only rerun if you've added new animation mods.

**Performance impact:** Minimal - only affects mod loading at startup.

## Running Nemesis

1. Open your Ultimate Skyrim installation folder and run `ModOrganizer.exe`

2. Watch [Nemesis installation tutorial](https://www.youtube.com/watch?v=ki2bghy2Mvo)

3. Follow along with the tutorial to complete Nemesis generation

## Troubleshooting

**Nemesis won't start:**
- Check MO2 executable paths are correct
- Ensure Nemesis folder path contains no spaces or special characters
- Try running ModOrganizer.exe as administrator


---

# Automatic Variants

**What it does:** Creates visual variety for animals, monsters, and creatures (realistic appearance differences).

**When to use:** Optional enhancement. Recommended for improved immersion and visual variety.

**Performance impact:** Minimal - one-time generation at startup, negligible ongoing impact.

## Installation

1. Open your Ultimate Skyrim installation folder and run `ModOrganizer.exe`

2. Watch [Automatic Variants tutorial](https://youtu.be/thfOQIdW0Cg?t=814) (created for older versions but still mostly correct)
   - Your Mod Organizer folder location = your Ultimate Skyrim install
   - Automatic Variants folder will be named "AV"

3. **STOP** once Automatic Variants installation completes - do not continue past this step

## Result

Animal and creature appearances will now display realistic visual variety across the game world.

## Troubleshooting

**Automatic Variants not generating:**
- Ensure you have Java 64-bit installed
- Check that your Ultimate Skyrim folder path contains no spaces
- Try running with administrator privileges


## DYNDOLOD 

**What it does:** Greatly improves the appearance of distant terrain and objects.

**When to use:** Optional visual enhancement. Recommended for significant visual improvement of distant landscapes.

{: .important}
> **Performance impact:** Can noticeably affect framerate depending on your PC specs. Disable if experiencing FPS drops.

## Installation

1. [Download DynDOLOD](https://www.nexusmods.com/skyrim/mods/59721?tab=files) - select "Manual Download"

2. If running Ultimate Skyrim 4.0.7, also [download DynDOLOD Resources](https://www.nexusmods.com/skyrim/mods/59721?tab=files) for the same version

3. Copy downloaded files to your preferred location (preferably same drive as Skyrim install)

4. Open your Ultimate Skyrim installation folder and run `ModOrganizer.exe`

5. Install the Resources mod and enable like a normal mod (apply FOMOD settings as shown)

6. [Click "Modify Executables"](https://wiki.wildlandermod.com/Assets/Dyndlod.jpg), enter "DynDOLOD" as Title

7. Click ellipses next to "Binary" field and navigate to your DynDOLOD.exe file


Navigate to where you placed the DynDOLOD files, select DynDOLOD.exe,  and then click “Apply” to finalize the executable.
Your button may show “Add” or "Modify” or "Apply" - Any are fine. 

Click [here for a video tutorial on running DynDOLOD](https://youtu.be/thfOQIdW0Cg?t=1130) that was created for older versions of Ultimate Skyrim.

9. Watch the tutorial (older version but mostly correct)
   - **IMPORTANT:** Do NOT disable DynDOLOD.esp as video shows - instead **disable the entire "Ultsky 4.0.7 Dyndolod" mod** on the left side
   - Stop watching once DynDOLOD installation completes

## Final Steps

1. Copy your DynDOLOD output folder to `content\mods\`

2. Re-open ModOrganizer and activate the "dyndolod_output" mod

3. In load order (right side), place DynDOLOD.esp just above "Requiem of the Indifferent"

4. **Do NOT disable the DynDOLOD resources mod**

## Troubleshooting

**DynDOLOD fails to generate:**
- Check that output folder path is correct and writable
- Ensure your Ultimate Skyrim folder path has no spaces
- Try running with administrator privileges
- Verify you're using the correct DynDOLOD version for your Ultimate Skyrim version

**Poor framerate after installing DynDOLOD:**
- This is normal; DynDOLOD trades FPS for visual quality
- Consider disabling if FPS impact is unacceptable
- Alternatively, disable DynDOLOD.esp but keep resources installed for partial visual benefit

