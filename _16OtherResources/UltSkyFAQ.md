---
layout: default
title: Ultimate Skyrim FAQ
description: Ultimate Skyrim - Frequently Asked Questions
parent: Ultimate Skyrim
---

{: .important}
> **Ultimate Skyrim Status**: This modlist is no longer actively developed or supported. Installation support is limited to Discord archives. Use at your own risk. See [Installation Guide](https://wiki.wildlandermod.com/16OtherResources/UltimateSkyrim/) for details.

## Table of contents
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

# Getting Started

## Does this mod pack support SSE/AE?

Ultimate Skyrim is only for legal copies of Skyrim Classic Edition with all DLC's, otherwise known as **Skyrim Legendary Edition**. It does not support Special Edition (SSE) or Anniversary Edition (AE).

## Where can I buy Legendary Edition?

You can find purchase links through Wabbajack's Reddit post: [Wabbajack: How to get Skyrim LE in 2021](https://www.reddit.com/r/Wabbajack/comments/kx6ppr/how_to_get_skyrim_legendary_edition_in_2021/)

---

# Installation & Setup

## How do I setup a Steam library outside of Program Files?

The Wabbajack team has a handy utility to help you do that: [Steam Library Setup Tool](https://github.com/LostDragonist/steam-library-setup-tool/wiki/Usage-Guide)

---

# Wabbajack Issues

## Wabbajack Fails to install with GameFileSourceDownloader Error

**Symptom**: Installation fails with "GameFileSourceDownloader" error message

**Four Known Causes:**

1. **Skyrim installed in Program Files**
   - Solution: Use the [Steam Library Setup Tool](https://github.com/LostDragonist/steam-library-setup-tool/wiki/Usage-Guide) to create a new Steam library outside of Program Files, then move/install Skyrim into that library

2. **You have previously "cleaned" your DLC**
   - Solution: Have Steam verify the game files

3. **You have manually moved your Skyrim install**
   - Solution: Move it back, then use Steam to move it to the new location

4. **You don't have DLC installed**
   - Solution: Install DLC; if you don't own it, purchase from link above

After applying solutions 2, 3, or 4, restart Wabbajack.

---

## Wabbajack Fails to download mods or hangs for a long time

**Symptom**: Wabbajack gets stuck downloading and won't proceed

**Solutions:**

1. **Restart Wabbajack** - Close and restart, enter same criteria as before. Wabbajack will CRC check existing files and normally resume where it failed.

2. **Try a VPN** - If restart doesn't work, try a VPN service such as Cloudflare WARP or ProtonVPN.

{: .hint}
> Note: Ultimate Skyrim is not affiliated with any VPN service and cannot provide user support for VPN usage. Use at your own discretion.

---

# Installation Troubleshooting

## I'm missing master for HighResTexturePack01-03 or game CTDs after Skyrim Logo

**Solution (Easiest)**: Download and enable the High Res DLC from [Steam](https://store.steampowered.com/app/202485/Skyrim_High_Resolution_Texture_Pack_Free_DLC/)

**Alternative**: Re-run the Reqtificator to generate a new Requiem For The Indifferent.esp (RFTI) without the High Res DLC as a master. (This will be fixed in the next release.)

If you have issues viewing the DLC, try [this workaround](https://www.reddit.com/r/ultimateskyrim/comments/galfjk/high_res_texture_pack_info/)

---

## Game doesn't boot when launching SKSE / Cannot Start SKSE_Loader Error

![SKSE Loader Error](https://github.com/Wildlander-mod/wildlander-mod.github.io/assets/26418143/011e741b-dc39-46eb-a5d8-2b350af89ab9)

**Checklist:**

1. Check that your Anti-virus is not flagging SKSE or Skyrim files
   - Best solution: Add Anti-virus exceptions for Ultimate Skyrim & Skyrim folders

2. Verify your content folder contains:
   - `usvfs_proxy_x64.exe`
   - `usvfs_proxy_x86.exe`
   - If missing, Anti-virus likely moved them to virus vault

3. Restore missing files from Mod Organizer Zip in `Ultimate Skyrim\download` directory

---

## Can't Launch Ultimate Skyrim Bat file

**Symptom**: Screen flashes for half a second then disappears; launcher doesn't start at all

**Cause**: Windows UAC is preventing the program from running

**Solutions:**

1. Open PowerShell as administrator and type: `Set-ExecutionPolicy Bypass`
   - Answer "yes" to any prompts

2. If #1 doesn't work, navigate to `\content\_shortcut` folder and run batch file matching your graphics settings

{: .hint}
> If launcher starts but crashes after clicking "play", see [Game Hard CTD on Splashscreen](#game-hard-ctd-on-splashscreen)

---

## Game Hard CTD on Splashscreen

**Symptom**: Game crashes immediately after Skyrim logo splash screen

**Note**: You may see error about missing `d3dx9_43.dll`

**Step 1 - Try vanilla Skyrim first:**
- Launch Skyrim from Steam directly. If it also crashes, continue to Step 2.

**Step 2 - Install DirectX Runtimes:**

1. Download DirectX End-User Runtimes from:
   - [Archive.org Mirror](https://web.archive.org/web/20190616115008/https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe)
   - [CNET Mirror](https://download.cnet.com/Microsoft-DirectX-Redistributable-June-2010/3000-2121_4-10176490.html)
   - Note: This gives you a zip file disguised as .EXE, not actual installer

2. Unpack into a directory (e.g., `C:\directX\`)

3. Run `DXSetup.exe` and follow on-screen instructions

4. (Optional but recommended) Reboot PC

**Step 3 - Regional/Locale settings:**

If Skyrim launches from Steam after Step 2:

1. Open Windows Control Panel → Region
2. Click "Additional settings..." at bottom
3. Click "Reset" in the window that opens

**Other causes:**
- ASUS GPU TweakII, Xtrem Tuner, or MSI Afterburner running
- "My Documents" folder moved to different hard drive (SKSE requires system drive)
- Overlays running (Steam, Discord, GeForce Experience, Overwolf, etc.)

---

## Skyrim has failed to allocate memory! or running out of memory

**Symptom**: CTD with Crash Fixes error "Skyrim has failed to allocate memory" or crashes during/after character creation

**Cause**: Bad ENB installation (most common)

**Solution**: Open `enblocal.ini` in your Skyrim folder and configure according to this guide:

![enblocal.ini Configuration](https://github.com/Wildlander-mod/wildlander-mod.github.io/assets/26418143/464543de-67f6-4898-bd10-d943a2efdbe1)

---

## My game freezes during loading screens

**Symptom**: Game appears frozen or has unusually long loading time (may still be loading in background)

**Causes & Solutions:**

1. **OneTweak Windowless Bordered mode issue:**
   - Make sure Windows Task Manager is NOT running
   - Don't Alt-tab out of loading screens
   - Disable "Save on wait" and "Save on travel"; use manual saves instead

2. **Below minimum PC specs:**
   - Check [Installation Guide](https://wiki.wildlandermod.com/16OtherResources/UltimateSkyrim/) for minimum requirements
   - Try removing ENB using [this method](#my-pc-cant-handle-the-enb-graphics-even-on-low-settings---can-i-remove-it)

3. **Folder permission issues:**
   - Ensure Ultimate Skyrim folder is NOT read-only

4. **Drive location issues:**
   - Ultimate Skyrim must be on SAME hard drive as Skyrim
   - Ultimate Skyrim CANNOT be in Program Files

5. **Previous mods/subscriptions:**
   - Remove any additional mods from `skyrim\data` folder from previous modding

6. **AMD Driver conflict (5000 & 6000 series):**
   - Roll back to working drivers OR disable ENB graphics

7. **Corrupt Skyrim install:**
   - Launch Skyrim from Steam directly and check for crashes

8. **Antivirus scanning:**
   - Add Ultimate Skyrim and Skyrim folders to antivirus exceptions

9. **Missing C++ or DirectX:**
   - Reinstall [C++ 32-bit and 64-bit versions](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads)
   - Reinstall [DirectX](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads)

10. **Permission loss:**
    - You've lost write permissions to `My Documents\My Games\Skyrim` or Ultimate Skyrim folder

11. **OneDrive/Dropbox syncing:**
    - OneDrive or Dropbox is syncing `My Documents\My Games\Skyrim` or Ultimate Skyrim folder (disable syncing for these)

12. **Corrupt save file:**
    - Try using [Savetool.exe](https://www.nexusmods.com/skyrim/mods/52363/) to recover save
    - If that fails, revert to previous save or start new game

---

# Known Issues

## Can I see a list of Known issues?

Yes: [Known Issues Document](https://docs.google.com/document/d/10jxUuBhmnLne5e4lb7ifAz9rByrTy_wEOpojmItyScM/preview)

---

# Updates & Uninstalling

## How Do I Update to the current Version?

**Important**: Version 4.3 is NOT save game compatible. Updating requires a fresh game with new MCM setup.

**Steps:**

1. Delete contents of `<Ultsky install folder>\content` (EXCEPT the `downloads` folder)

2. Follow the [installation guide from step 2.3](https://wiki.wildlandermod.com/16OtherResources/UltimateSkyrim/)

---

## How do I Uninstall?

We're sorry to see you leave!

Removing UltSky is simple:

1. Remove files from your Steam Skyrim folder that you copied from "Game Folder Files"
   - (See [Installation Guide](https://wiki.wildlandermod.com/16OtherResources/UltimateSkyrim/) for reference)

2. Delete the Ultimate Skyrim installation folder

---

# Configuration

## What do the presets mean?

| Preset | Target PC | Details |
|--------|-----------|---------|
| **High** | Top-end PC | Grass visible at maximum draw distance (equivalent to Ultra) |
| **Medium** | Mid-range PC | Grass visible from ~10 meters (equivalent to Medium-High) |
| **Low** | Minimum spec PC | Grass drawn ~1 meter away; may have visual effects during heavy snow |

---

## My PC can't handle the ENB - Can I reduce the Settings?

**Option 1 - Keep Dylan's lighting:**

Open `ENBseries.ini` in your Steam Skyrim folder and change the effects section to match [this guide](https://github.com/Wildlander-mod/wildlander-mod.github.io/assets/26418143/1d53cb9f-4989-444a-9ed8-72947fd6ff1b)

**Option 2 - Best performance (keep weather & lighting):**

Switch your `ENBseries.ini` with [this one](https://wiki.wildlandermod.com/16OtherResources/enbseries.ini) in your Steam Skyrim folder

---

## My PC Can't handle the ENB Graphics even on low settings - Can I remove it?

**Important**: Skyrim can't handle modern PC RAM capacity. If your PC has more than 4GB RAM, you cannot disable ENB entirely—only the graphics, keeping the memory boost (ENBboost).

**Steps:**

1. Delete `ENBseries` folder and `ENBseries.ini` from Steam Skyrim folder

2. Open `Content\ModOrganiser.exe`

3. Select graphics profile from profiles dropdown

4. On left side: Untick "Snowfall weathers"

5. On right side: Untick "ultimate skyrim - snowfall weathers.esp"

6. Setup and run Reqtificator per [instructions](#how-do-i-install-the-reqtificator)

7. Open `Skyrim\Enblocal.ini` and change `UsePatchSpeedhackWithoutGraphics` to `true`

---

## It's too dark at night, can I make it brighter?

**For regular vision:**

1. Open ENB GUI in-game with `Shift+Enter`
2. In ENBseries window, find weather toggle and turn ON
3. In weather pane, find Environment section → Point Lighting
4. Adjust settings to your preference
5. Hit "Save" then "Apply" in ENBlocal window

![ENB Settings](https://github.com/Wildlander-mod/wildlander-mod.github.io/assets/26418143/4c9ce928-8d18-4397-8870-e97cb1df6d5f)

**For Nighteye:**

See [ENNE NightEye Settings Guide](https://www.reddit.com/r/ultimateskyrim/comments/bpk1js/adjusting_night_eyeeene_for_better_visibility/)

---

# Reqtificator

## How do I Install the Reqtificator?

**Prerequisites:**
- Java MUST be installed in `Program Files` (NOT `Program Files(x86)`)
- If you don't have it, download [Windows Offline 64-bit version](https://java.com/en/download/manual.jsp)

**Steps:**

1. Watch this [video guide](https://www.youtube.com/watch?v=thfOQIdW0Cg&t=1389s)

2. **When patcher asks if you're running new game:** Select "Yes, this is a new game"

3. **When patcher notifies about 100+ plugins:** Select "Ignore from now on"

4. Leave all options at defaults and click patch button

---

## There was no consistency file found

![Consistency File Error](https://github.com/Wildlander-mod/wildlander-mod.github.io/assets/26418143/3c65ee1a-55dd-4e61-92d5-d891c8bf0c3f)

**Solution:** Select "Yes, this is a new game"

---

## Automatically allocating memory failed

![Memory Allocation Error](https://github.com/Wildlander-mod/wildlander-mod.github.io/assets/26418143/4b98e1ad-f986-4e8f-abb5-8c36f955059f)

**Cause**: Your Java binary path is wrong; you're using 32-bit Java instead of 64-bit

**Solution:** Check your paths per Step 5 in [Requiem Wiki](https://requiem.atlassian.net/wiki/spaces/RS/pages/691470460/Installing+Requiem+with+Mod+Organizer+2+version+3.2.0+and+older)

---

## It says I am using more than 100 plugins

![100+ Plugins Warning](https://github.com/Wildlander-mod/wildlander-mod.github.io/assets/26418143/dc7035a8-d102-4a53-93b0-922cce872e50)

**Solution:** Select "Ignore from now on"

---

## The Reqtificator won't start. MO2 locks up or returns "Directory name is invalid" error

**Cause**: Typo in folder path for Requiem Skyproc patcher

**Solution**: Verify path is exactly: `\<path to your Skyrim installation>\Data\SkyProc Patchers\Requiem`

Common mistake: Omitting the 's' at end of "SkyProc Patchers"

Also confirm the "Start in" path in MO2 Reqtificator configuration matches.

---

# MCM & Gameplay Configuration

## What does the MCM guide mean about template saves?

There is no way to copy MCM settings to new characters for every mod.

**Workaround - Create a "template save":**

1. Configure bulk of MCM's
2. Load this template save every time you start new character
3. You'll only need to do "post-Start" MCM setups (last ~2 pages)

**Template save definition:** A save game made BEFORE clicking "Begin My Adventure" in Ultimate Skyrim MCM menu. This avoids reconfiguring everything for future characters.

**Disclaimer**: Certain game elements are "baked" into Skyrim the moment "Start New Game" is clicked, including: Locations of certain items, starting inventory, initial stats

---

## iNeeds MCM page is blank OR Requiem Cannot be added to existing save

**Cause**: You started MCM config before mod finished initializing (scrolling messages in top left)

**Fix:**

1. Close and re-open Skyrim to remove partially loaded scripts
2. Start new game
3. **Wait for ALL messages in top left to disappear**
4. Start MCM setup again

{: .important}
> Once this error occurs, the save is corrupted and cannot be recovered.

---

# Customization

## Can someone help with my load order?

The Ultimate Skyrim Support Team cannot assist due to too many variables.

**⚠️ DO NOT use L.O.O.T or rearrange Ultimate Skyrim's default mods unless a guide specifically tells you to!**

### If you've broken your load order:

1. Close Mod Organizer

2. Back up profile-specific saves (located at `<install path>\content\profiles\<profile>\saves`)

3. Delete everything from `<install path>\content\profiles\`

4. Download profiles zip for your UltSky version:
   - [4.0.7](https://wiki.wildlandermod.com/Assets/Downloads/profiles.rar)
   - [4.1](https://wiki.wildlandermod.com/Assets/Downloads/4.1_profiles.rar)
   - [4.2](https://wiki.wildlandermod.com/Assets/Downloads/4.2_profiles.rar)
   - [4.3](https://wiki.wildlandermod.com/Assets/Downloads/4.3_profiles.zip)

5. Unpack into `<install path>\content\profiles\`

6. If you added mods: re-enable and reorganize load order

7. If you had profile saves: restore from backup

---

## Mod X has been updated, can I install that?

**No.** For stability reasons, only the versions installed by Wabbajack are supported.

---

## Can I remove/disable mod X?

Many mods have MCM options for disabling. Some mods are marked optional and can be disabled in Mod Organizer.

**Important**: If you remove optional mods with `.esp` plugins, you must run Reqtificator and possibly Automatic Variants patcher.

---

## Can I Add Additional mods?

**Before you start:**

1. Check [known incompatibilities list](https://wiki.wildlandermod.com/16OtherResources/UltskyModdingGuide/#known-mod-issuesincompatibilities)

2. Read the [modding basics](https://wiki.wildlandermod.com/16OtherResources/UltskyModdingGuide/#ultimate-skyrim-modding-basics)

3. **⚠️ YOU CANNOT USE LOOT ⚠️**

The Support Team has created guides for popular mods at [this page](https://wiki.wildlandermod.com/16OtherResources/UltskyModdingGuide/#guides-list) or ask in Wildlander Discord #ultsky-customization channel.

---

## Does this mod pack support other languages?

No. SKSE crashes if you try non-English Skyrim. Install English Skyrim to play this modpack.

---

## Can I backup and restore Ultimate Skyrim?

Yes: [Backup Guide](https://github.com/Wildlander-mod/Support/blob/master/Docs/Backup.md)

---

## I want to setup rodericktech guide for fancy graphics - where are the patcher instructions?

- **Reqtificator:** [See instructions](#how-do-i-install-the-reqtificator)
- **Other Patchers** (AV, Dyndolod, etc): [See Patchers Page](https://wiki.wildlandermod.com/16OtherResources/UltskyPatchers/)

---

# Gameplay Issues

## Why are auto-saves disabled or quicksaves not recommended for use in Ultsky?

**The Problem:**

Heavily modded setups have many script-heavy mods. Sometimes a script pauses during saving and can't recover properly, causing corrupted saves. Additionally, heavy script load can cause CTD during save function.

**Auto-saves also increase cell loading times by 500%**, making manual saves preferred over integrated loading screen saves.

**Safe Save Practice:**

{: .hint}
> - Wait at least **1 minute** after loading before saving (some scripts break if you save too soon)
> - Avoid saving during combat or heavy script load
> - Never save more than once per minute
> - Never save within 30 seconds of entering building/cell/dungeon

**Auto/Quicksaves Verdict:**
- Auto/Quicksaves are OK, but timing determines safety
- Having multiple saves limits playtime loss if corruption occurs
- Better safe than sorry

---

## My Keyboard isn't working

**Usual cause**: You ran Special Edition version of Skyrim prior to UltSky. SE doesn't release all files LE needs, disabling keyboard.

**Solutions:**

1. Close and reopen Steam itself (sometimes sufficient)
2. Reboot your PC

---

## My Compass has disappeared!

**This is intentional.** Immersive HUD hides the compass by default.

**To make it temporarily visible:** Press 'N' key

**To make it permanently visible:** Change MCM setting in Immersive HUD → Compass Activation → Key Press Toggles

---

## Why can't I select the first crafting perk?

You need a book called **The Craftsman's Manual** in your inventory. Most blacksmiths sell it. Requiem crafting perks each require their own books (some purchased, others found in world).

---

## Why Can't I Run or Why is my stamina going down for no reason?

Requiem applies stamina drain when you run OR wear armor without first Heavy/Evasion Armor perk. Running is normal speed (not sprinting or walking).

**Solution:** Buy food with "Regenerate 1 stamina per second for X seconds" effect and keep buff active at all times.

{: .important}
> NO YOU CANNOT DISABLE IT, PLEASE DON'T ASK!

---

## Why can't I get a blessing at a shrine?

Requiem's Gods are unforgiving. Too much crime = no blessings or healing.

---

## Why aren't I healing?

Requiem disables passive health regen. You need healing poultice or potion to regenerate health.

---

## My character is glowing ugly orange patches at night

This is how ENB expresses the dirt shader: **Take a bath!**

---

## Error: Incompatible menu file(Map.swf) when opening the map

**Solution:** Open SkyUI MCM Menu → Advanced → Uncheck 'Map menu' in SWF Version Checking section

---

## My vision is all Blurry/Messed up!

**Cause 1:** You ate too many alchemy ingredients too quickly
- Solution: Find and eat Nirnroot to remove effect

**Cause 2:** You picked up a disease
- Solution: Check active effects, use potion of cleansing

---

## The screen randomly went dark shortly after I entered <location>

**Cause**: Darker Dungeons mod

**Solution:** Open Darker Dungeons MCM → General Configuration → Untick "Do Fadeout On Dungeon Entry"

---

## Lights are Flickering on and off

**Cause**: Skyrim's engine limitation of 4 lightsources max in an area. When 4+ lightsources exist, they alternate/cycle on and off.

**Only Resolution:** Use Cobb Positioner to identify and delete extra lightsources

---

## I tried to learn a spell from a Tome - the book disappeared but I still don't know it

**Cause**: You missed loading SV Mods Preset during Post-Start MCM Setup

**Fix:** Navigate to SV's MCM menu → Save/Load Preset → FISS → Click 'Load Preset'

---

## Why does the NPC dialogue cut out when talking to Aela?

Enhanced Skyrim Factions - The Companions Guild adds new dialogue options to NPCs that aren't voiced. Other NPCs have same behavior.

---

## My game has no grass or has very little grass

**Ensure these settings in `Content\Profiles\<Profile you play>\`:**

1. In `skyrim.ini`: Set `bAllowCreateGrass`, `bAllowLoadGrass`, and `bDrawShaderGrass` to `1`

2. Decrease `iMinGrassSize=` (default Skyrim = 20, recommended with Verdant plugin = 60)

3. Change `iMaxGrassTypesPerTexure=` (default = 5, max = 15)
   - Note: "Texure" misspelling is Bethesda's mistake; replicate it

---

## Why is everything so expensive in shops?

**You're naked!** Put some clothes on, ya filthy animal!

---

## I am getting a lot of stutter / CTD / Low FPS?

{: .important}
> **FPS CAP**: Ultimate Skyrim maxes at 60 FPS due to Skyrim's engine limitations. If 60fps seems low, too bad. Cannot run higher.

**Checklist:**

1. Don't have Task Manager open (not even minimized to taskbar)
   - If CTD occurs during loading screens, this is likely the cause

2. Check `ENBlocal.ini` - No comma in "VideoMemorySizeMb" field

3. Don't change "FPSLimit" field in limiter section (default: 59.900002)

4. Try turning off vsync & g-sync for `TESV.exe` in GPU settings

5. Close background programs injecting into DirectX:
   - GeForce Experience
   - MSI Afterburn
   - Similar tools

6. Check background processes - Skyrim heavily relies on CPU Core 0

7. Run [Bmxfreestyle's Stability Guide](https://docs.google.com/document/d/1PusjuS09qs8QPU5PVf7uSoZKt_35ZTvFmFrLWtIaTQ0/edit#heading=h.6znbuu4htqw) and follow tweaks

**Advanced Optimizations (after checking above):**

1. **Disable borderless window** (gives ~10 FPS boost):
   - Edit `<ultimate Skyrim>\content\mods\UltSky (Version) Core Files\SKSE\Plugins\OneTweak.ini`
   - Optional: Set `BFullScreen` to `1` in `content\profiles\UltSky (preset)\Skyrimpref.ini` for fullscreen

2. **Lower graphics preset** or adjust `content\profiles\UltSky (preset)\Skyrimpref.ini`:
   - Reduce `iShadowMapResolution` (try 1024 or 512)
   - Lower `fShadowDistance`
   - Lower `fGrassMaxStartFadeDistance`

3. [Lower](#my-pc-cant-handle-the-enb---can-i-reduce-the-settings) or [remove](#my-pc-cant-handle-the-enb-graphics-even-on-low-settings---can-i-remove-it) ENB

---

## When I equip my Lantern/Backpack I get a pouch/book/holder/carpet appearing in my inventory

**Cause**: Unknown bug

**Workaround (may solve):** Drop and buy new item, OR drop and use console to create one

---

## When I equip my Belt items it doesn't ask me which slot I want to put it in

**Solution:** Drop the item and pick it back up—it will ask you where to place it

---

## When I drop items on the ground, they sometimes vanish

**Cause 1:** Dropping in 1st person view (common)
- Solution: Switch to 3rd person before dropping

**Cause 2:** Item from Campfire, Wearable Lanterns, or Bandoleers - Bad editor ID
- Solution: Drop and reconsole item in, or if craftable, remake it

---

## My Lantern/Tent is asking me where I'd like it equipped

**Cause**: Bad ID

**Solution:** Break down lantern and re-craft in crafting ledger, or purchase new tent from vendor

---

## How do I re-enable menus pausing?

`SkyrimSouls.ini` controls pause functions. Edit from Mod Organiser:

1. Right-click mod (e.g., `Ultimate Skyrim 4.x Core Files`) in left pane
2. Select Information → ini files tab

---

## My character's animations are stuck

**Vanilla Skyrim bug**, exacerbated by scripted mods. If jumping doesn't fix:

```
Pushactoraway 14 1
SetPlayerAIDriven 0
```

---

## I keep hearing strange noises around me or objects floating around

**Cause**: Physics engine limitation at framerates higher than 60 FPS

**Solution:** Limit framerate to 60 FPS via ENB config (Shift+Enter in-game) or GPU software

---

## My Character Spawned Underwater

**Symptom**: Character loads underwater outside, usually near Whiterun or Markarth bridges

**Fix:** Enter nearby building then exit to force cell reload

---

## Why Can't I Fast Travel?

Requiem disables Fast Travel. Multiple alternatives:

- Boats near large water areas
- Carriage drivers at cities

---

## How do I change the difficulty?

**In-game difficulty sliders do NOT work with Requiem.**

**Use Requiem MCM instead:** Set Damage Dealt/Taken sliders

Recommended: 100% for both (Requiem already increases difficulty significantly)

If struggling: See [Beginner Guide for New Requiem Players](https://www.reddit.com/r/skyrimrequiem/comments/1w5cej/surviving_the_first_few_hours_in_requiem_or/)

---

## I contracted Sanguinare Vampiris and now I can't sleep!

**Intentional change:** Weak characters can't instantly become vampires

**What happens:** Spend 3 days while Sanguinare slowly drains health and negates natural healing. Then you become a Vampire.

---

## My Grass/Tree's in distance are shimmering/flickering

**Cause**: ENB on some graphics cards

**Solutions:**

1. Add "max FPS limit" of 59 for `TESV.exe` in GPU settings (helps high-refresh monitors)

2. Follow [this guide](https://www.reddit.com/r/ultimateskyrim/comments/gfdg6l/antialiasing_is_b_a_d/) (+ user comments)
   - Original site gone; [antialiasing injector mirror here](https://www.softpedia.com/get/Tweak/Video-Tweak/injectSMAA.shtml#download)

{: .hint}
> This is the only known fix; support cannot assist if it doesn't work

---

## Eorlund Graymane won't temper/craft stuff for me

**Reason**: Eorlund is the best smith and reserves services for Companions Circle members

**Requirement**: Must be at "Kill the werewolf hunters" stage of "The Silver Hand" quest

---

## How Do I Enable Permadeath?

**Short answer**: You can't (mod was removed in 4.0.7)

**Instead**: Requiem presents death dialog asking you to load save. To simulate permadeath, manually delete all saves for dead character and load template save to start new character.

---

# Questing

## How do I start the main quest?

Kill a dragon (make sure you're set as Dragonborn in Ultimate Skyrim MCM)

---

## Why can't I obtain the dragonstone?

This quest auto-completes when you kill a dragon

---

## How Do I Become Thane of Whiterun?

**New way in UltSky:**

1. Complete "The Blessings of Nature" quest (start with Danica at Gildergreen tree)
2. Talk to Jarl Balgruuf when Gildergreen is repaired/sapling blooms
3. He thanks you and lets you buy Breezehome
4. Standard thaneship quest now available (help people + buy house)

---

## I can't start the Thieves Guild through Brynjolf

**Requirement**: "Thieves Guild Requirements" mod requires certain amount of pockets picked/items stolen

---

## How do I start the Dragonborn questline?

Dragonborn content available after completing "A Blade in the Dark" (main quest)

---

## How do I start the Undeath questline?

Undeath content available after **level 30**. Quest will appear in journal with further instructions.

---

# Version-Specific Issues (4.0.6)

## I have this really weird red/green/brown/black graphical issue on the bottom half of my screen

**Version**: 4.0.6 Issue

**Cause**: Messed up installing custom INI files

**Solution**: Ensure you're installing `Skyrim.ini` and `SkyrimPrefs.ini` in `\Ultimate Skyrim 4.0.x\profiles\Ultimate Skyrim 4.0.x (Full)` folder

---

## My rain splashes are purple/pink!

**Version**: 4.0.6 Issue

**Solution**: You need a patch! Install `[US 406 HF2] Fix for purple/pink rain splashes (Wonders of Weather)` with MO2 at end of mod list on left side (no esp)

Find on [Official UltSy Discord](https://discordapp.com/invite/8VkDrfq) #ultsky-bug-submission channel

---

## Why am I not leveling up!

**Version**: 4.0.6 Issue

**Solution**: You only get experience while sleeping. Take a nap!

---

## My character is invincible - I get to zero health but don't die!

**Version**: 4.0.6 Issue

**Solution**: You need patch `[US 406 HF2] Ashes 0.02 patch v0.6`

Find on [Official UltSy Discord](https://discordapp.com/invite/8VkDrfq) #ultsky-bug-submission channel

---

## I'm trying to load my template save and it says my character is dead

**Version**: 4.0.6 Issue

**Cause**: Character named default name "Adventurer" killed by permadeath

**Fix:** Delete `.dead` file in `steamapps\common\Skyrim` folder; can now load save

---

## My Character takes off his/her clothes when swimming

**Version**: 4.0.6 Issue

**Solution:** Open Bathing in Skyrim MCM → Player Animations → Untick everything in "Undress Before Bathing - Standard" and "Undress Before Bathing - Extended"

---

## Why isn't my compass showing undiscovered locations?

**Cause**: iCompass hides locations by default

**Solution**: Uninstall by unchecking iCompass in MO2 and rerun Reqtificator

{: .hint}
> Note: Installing/uninstalling mods during playthrough may break game; not recommended
