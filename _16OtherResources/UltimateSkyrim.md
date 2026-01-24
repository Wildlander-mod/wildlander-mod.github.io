---
layout: default
title: Ultimate Skyrim 
description: Ultimate Skyrim Installation Guide
has_children: true
---

{: .important}
> **UNSUPPORTED MODLIST**: Ultimate Skyrim is no longer developed or maintained. This guide is archived reference only. Installation support is not available. If you encounter issues, search Discord #ultsky-faq channel for previous solutions. See [FAQ](https://wiki.wildlandermod.com/16OtherResources/UltSkyFAQ/) for common problems.

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

## Overview

**Ultimate Skyrim requires Skyrim Legendary Edition** (Classic Edition with all DLC). You can find purchase links on [Reddit: How to get Skyrim LE in 2021](https://www.reddit.com/r/Wabbajack/comments/kx6ppr/how_to_get_skyrim_legendary_edition_in_2021/)

### System Requirements

| Tier | GPU | CPU | RAM |
|------|-----|-----|-----|
| **Recommended** | GeForce GTX 970 or higher | Intel Core i5-7500 or higher | 8 GB or more |
| **Minimum** | GeForce GTX 660 or equivalent | AMD Ryzen 3 2200G or equivalent | 4 GB or more |

---

## Pre-Installation Checklist

Before starting, ensure you have:

- At least **40 GB free space**
- An archive tool ([7-Zip](https://www.7-zip.org/) or [WinRAR](https://www.win-rar.com/download.html?L=0))
- Latest [Microsoft Visual C++ (32-bit and 64-bit)](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads)
- Latest [.NET Framework Runtime](https://dotnet.microsoft.com/download/dotnet-framework)
- **NO** Skyrim mod subscriptions from Steam Workshop
- Clean, **ENGLISH** Skyrim 1.3.22 installed through Steam
- **NOT** the GamePass version of Skyrim

**Recommended:** [Nexus Premium membership](https://forums.nexusmods.com/index.php?%2Fstore%2Fcategory%2F1-premium-membership%2F) for automated downloads

You can view the modlist [here](https://loadorderlibrary.com/lists/ultimate-skyrim-430-high-preset)

{: .hint}
> **Note (06/09/24):** Bethesda updated Skyrim via Steam. You may need to downgrade using Steam depot `download_depot 72850 72853 3817241784354177437`. See [downgrade instructions](https://wiki.wildlandermod.com/09-How-Do-i/HowDoI/downgrade/).

---

## Installation Process

<details markdown="block">
  <summary>
    <strong>STEP 1: Prepare Game Files</strong>
  </summary>

1. Launch "The Elder Scrolls V: Skyrim" from Steam
2. When launcher offers auto-detect settings, click "OK" and dismiss the follow-up
3. Click "Play" to launch the game
4. From main menu, select "Quit" to return to desktop

This generates necessary files for Ultimate Skyrim installation.

</details>

<details markdown="block">
  <summary>
    <strong>STEP 2: Download & Install with Wabbajack</strong>
  </summary>

1. [Download the install package](https://mega.nz/file/HZl2WIhD#5WmvkefR-ZKv0NqrxbgpRWfZcbM9AikOXAZYAf1Ac9g)

2. Extract and place "UltSky" folder in desired location

   {: .important}
   > **Installation Location Restrictions** - Do NOT place in:
   > - Program Files / Program Files (x86)
   > - Users folder or subfolders
   > - Steam folder or subfolders
   > - Skyrim folder or subfolders
   > - Desktop or Documents folders
   > - Folders with non-English characters
   > - Cloud storage (Dropbox, OneDrive, etc.)

3. [Download latest Wabbajack](https://www.wabbajack.org/) and place in `UltSky\installer\` folder

4. Double-click Wabbajack.exe to run

5. Click "Install From Disk" and locate the Wabbajack file you downloaded

6. Select your `content` folder as installation location (NOT the Skyrim folder)

   {: .important}
   > **WARNING:** Select the `content` folder, NOT `Skyrim\TESV.exe`. Selecting wrong folder will break your install!

7. (Optional) If upgrading, select your old Downloads folder to reuse existing downloads

8. Click the install button to begin

9. If prompted, click "Accept" for Nexus API

10. (Optional) If not a Nexus Premium member, [follow this guide](https://streamable.com/5uuzo) for manual downloads

11. When complete, click "Install Folder"

12. Open "Game Folder Files" and copy all files inside

13. Navigate to your Skyrim root folder and paste files

14. Open the pasted `enblocal.ini` and configure according to [this guide](https://imgur.com/yfBDnJI)

</details>

<details markdown="block">
  <summary>
    <strong>STEP 3: Fix Known Issues</strong>
  </summary>

Review and apply fixes from the [Known Issues guide](https://docs.google.com/document/d/10jxUuBhmnLne5e4lb7ifAz9rByrTy_wEOpojmItyScM/preview) as needed.

</details>

<details markdown="block">
  <summary>
    <strong>STEP 4: In-Game Configuration</strong>
  </summary>

1. Navigate to your `content` folder and double-click "Launch Ultimate Skyrim.bat"

   {: .hint}
   > If this doesn't launch, refer to the [Known Issues guide](https://docs.google.com/document/d/10jxUuBhmnLne5e4lb7ifAz9rByrTy_wEOpojmItyScM/preview)

2. Select a performance profile in the launcher

3. (Optional) Click "Create Desktop Shortcut" for quick access

4. Click "Launch Ultimate Skyrim"

5. Start a new game (Ultimate Skyrim is not compatible with old saves)

6. **WAIT** until all initialization messages have cleared and you see a blank screen

7. Press Esc/Start to open game menu and select "Mod Configuration"

8. Follow the [Mod Configuration guide](https://docs.google.com/document/d/1atILnDe7x-FKG0Oahvpq-dAe_PEgIEcSFj1Li2Kia0g/edit?usp=sharing) to adjust settings (recommended: open on separate device for reference)

</details>

---

## After Installation

### Save Safely

{: .important}
> - Wait at least **1 minute** after loading before saving
> - Avoid saving during combat or heavy script load
> - Never save more than once per minute
> - Never save within 30 seconds of entering building/cell/dungeon

### Need Help?

- **Common Issues:** See [Frequently Asked Questions](https://wiki.wildlandermod.com/16OtherResources/UltSkyFAQ/)
- **New Player Guide:** [Gameplay guide for new players](http://shorturl.at/achCW)
- **Support:** Search Discord #ultsky-faq for previous answers (no active support available)

### Want to Customize?

See [Modding Guides](https://wiki.wildlandermod.com/16OtherResources/UltskyModdingGuide/) - **Make sure to read Modding Basics first!**

**Note:** These guides are for Ultimate Skyrim, not Wildlander.


