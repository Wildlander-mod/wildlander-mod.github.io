---
layout: default
title: Help I'm getting CTD's
nav_order: 6
description: Help I'm getting CTD's
---

## Quick CTD Troubleshooting Checklist

**Before panicking, work through this checklist:**

- [ ] Did your game freeze or crash? (Freezing = out of memory issue, crashing = something else)
- [ ] Are you running an unmodified Wildlander install? (If modified, use community support only)
- [ ] Have you restarted the game since your last change?
- [ ] Check the crash log: Can you find the crash code in the [list below](#common-crash-codes)?
- [ ] **Is the crash reproducible?** (Can you make it happen again by repeating the same steps?)

**Next Steps:**
- **If you found your crash code:** Follow the solution for that code
- **If you can't find your crash code AND can reproduce it:** Gather the information in the [Reporting Your Crash](#reporting-your-crash) section and file a bug report
- **If you can't reproduce it:** Unfortunately, we cannot help. One-time crashes are too difficult to debug

---

## Table of contents
{: .no_toc }
<details markdown="block">
<summary>
   Expand to view
</summary>
{: .text-delta }
1. TOC
{:toc}
</details>

---

## How to Read Your Crash Log

**Step 1: Locate Your Crash Log**
- Click the "Advanced" button in the launcher
- Click "Open Crash Log" button
- A text file will open showing your crash information

**Step 2: Find the Crash Code**
The first few lines will show something like:

{: .callout-code}
> Unhandled native exception occurred at 0x7FFEF914CE66 (skse64_1_5_97.dll+5CE66) on thread 7360!
> 

The part in **parentheses** is what you're looking for. Examples:
- `(SkyrimSE.exe+132BEF)` - Game engine problem
- `(skse64_1_5_97.dll+5CE66)` - Script extender problem
- `(atidxx64.dll+523A0)` - AMD graphics issue
- `(nvwgf2umx.dll+265E07)` - NVIDIA graphics issue

**Step 3: Search This Page**
Use Ctrl+F to search for your crash code on this page. If found, follow the solution. If not found, scroll to [Reporting Your Crash](#reporting-your-crash) below.

---

## Common Crash Codes

Skyrim with Wildlander creates crash logs. You can access these crash logs by using the button on the advanced page of the launcher. **IMPORTANT:** If your game is freezing rather than crashing, then the cause of the freeze is most likely to be a ["out of memory" error](#crash-to-desktop-when-entering-a-building-or-on-finalising-setup-crash-code-fissdll4481-or-skyrimseexed6ddda).

The first line of the crash log indicates the crash code, and the process which crashes. E.g 

* Unhandled native exception occurred at 0x7FFEF914CE66 (skse64_1_5_97.dll+5CE66) on thread 7360!
* Unhandled native exception occurred at 0x7FF6C59F2BEF (SkyrimSE.exe+132BEF) on thread 1552!
* Unhandled native exception occurred at 0x7FFD09DC23A0 (atidxx64.dll+523A0) on thread 6944!
* Unhandled native exception occurred at 0x7FF8DEA95E07 (nvwgf2umx.dll+265E07) on thread 27128!

![image](https://user-images.githubusercontent.com/26418143/184343479-0bbafd85-3e81-4411-8c0b-dff9620de663.png)

The brackets are generally the most important line of the crash code E.g (SkyrimSE.exe+132BEF). You should search this page for this code.

---

## Reporting Your Crash

If you have crashes which are not included in the list below, they are **repeatable** while running an **unmodified list**, follow these steps:

1. Copy your crash log to [Pastebin](https://pastebin.com)
2. Create a [bug report](https://wiki.wildlandermod.com/16OtherResources/bugreport/) 

**Minimum information required:**
- What you were doing when the crash occurred
- A link to your Pastebin crash log
- Wildlander version (shown in bottom left of launcher)
- Are you running unmodified Wildlander? (Yes/No)
- **Can you reproduce this crash consistently?** (If no, do NOT file a bug report)

The more information you provide, the easier it will be for us to track down the issue.

**Note:** Non-reproducible crashes are very difficult to debug. Only file a report if you can consistently trigger the crash by repeating the same steps.

---

## Crashing on Startup 
### Medal.tv Clipping Software
Task-killing this program is the recommended advice before playing Wildlander, as on lower end PC’s it causes a CTD from the main menu. On higher end machines, it causes the ENB to have blinding sunlight and black water.

Either way, support staff strongly advise that you do not have this running when starting Wildlander.

### Before main menu appears - no crash log, with a launcher error.

If this is your first run, then it may be that the launcher installed an updated version of C++ and the PC requires a reboot. 

### Before main menu appears - no crash log, no launcher error

Typically caused by a corrupt plugin which is also master. Rerunning the Wabbajack installer choosing "overwrite install" will generally resolve these issues.

The only other cause is 3rd party antiviruses, you can see the known issues here [Wildlander and Antiviruses](https://wiki.wildlandermod.com/01Support/Launcher/#wildlander-and-antiviruses).

Note: If you are running a customized build - this can also be caused by a missing dependency of a mod you installed.

### With a crashlog with "BGSStoryManagerBranchNode" in the Possible relevant objects  

May generate crashes with codes SkyrimSE.exe+132BEF or SkyrimSE.exe+1BF04F or SkyrimSE.exe+124243A (or others).

{: .logfile}
> Possible relevant objects (2)
> {
> [ 125]    BGSStoryManagerBranchNode(FormId: 0000005B)
> [ 188]    PlayerCharacter(FormId: 00000014, BaseForm: null)
> }

If you have played a character, exited to the menu, and tried to create a new character then this is expected behavior. You should **always** restart the game before creating or switching characters.

If it is your first character after a clean install, then it could be caused by a mod(-s) which didn't install correctly. Rerunning the Wabbajack installer and choosing "overwrite install" will generally resolve these issues. 

If that fails: 
- Clean out the game-files folder (with the exception to the downloads folder) 
- Make sure any 3rd-party anti-virus you have is turned off (with the exception of Windows Defender)
- Re-run Wabbajack to re-do the install cleanly.

### With a crashlog with "usvfs_x64.dll" in the Possible relevant objects when using Bitdefender Antivirus.

The antivirus is the bane of my existence!

Recommendations: Uninstall it - free version is shit anyway - lol. 

If you can't uninstall it.

1. Add a "Advanced Threat Defense" exception for Wildlander\game-files\Stock Game\SkyrimSE.exe. If you also have “Ransom-ware Remediation” on Add Wildlander\game-files\ModOrganizer.exe to this.

2. if that doesn't work - run with "no shaders" from the launcher. Wildlander won't look as nice, but at least you can play.

## Crashing while Playing your character

### Any Crash related to atidxx64.dll Or nvwgf2umx.dll

This crash is associated with your graphics card drivers. Make sure they are up-to-date. If that doesn't work, try updating your Windows drivers. Some have also said this can occur if you P.C doesn't fill out all the requirements needed to run Skyrim(P.C too weak-sauce). Only assume this after trying out all stated options.

### Crash to Desktop on save when using the BitDefender Antivirus (No crash code, just an exception code).

Crash-logs usually start with *Unhandled native exception occurred at 0x7FF8C00004FA* (other numbers may occur) ! But no "Skyrim.exe Crash code"

The clue for this crash is the below.

{: .logfile}
> Possible relevant objects (2)
>
>{
>
>  [ 161]    BGSProjectile(FormId: 0007326E, File: `Skyrim.esm`)
>
>  [ 161]    GrenadeProjectile(FormId: 851F0CEC, File: `Fozars_Dragonborn_-_Requiem_Patch.esp&`, BaseForm: BGSProjectile(FormId: 0007326E, File: `Skyrim.esm`))
>
>}


Apply the following fixes after install to prevent crash on save: 

#### Easy solution 
   
Turn off Advance Threat Defense when playing Wildlander.

##### Alternatively, proper solutions

1. Add an Advanced Threat Defense exception for `Wildlander\game-files\Stock Game\SkyrimSE.exe`.
2. If you also have "Ransomware Remediation" on, add `Wildlander\game-files\ModOrganizer.exe`.

---
### Crash to Desktop when entering a building or on "finalising setup". Crash code fiss.dll+4481 or SkyrimSE.exe+D6DDDA. 

These error codes have three common causes:

#### 1. Can  be caused by Medal clipping software

Exiting this program is the recommended advice before playing Wildlander, as on lower end PC's it causes a CTD from the main menu. On higher end machines, it causes the ENB to have blinding sunlight and black water.

Either way, support staff strongly advise that you do not have this running when starting wildlander. 

#### 2. Out of memory crash. Caused by System RAM and page file overflowing.

Bigger Skyrim mod lists need **a lot** of memory. When there is not enough available, it may fail allocating more. To fix this, you'll want to have a bigger pagefile.

A pagefile is a file on your disk Windows will use when there is not enough RAM available. 

**Never** disable the page-file. This may lead to various issues on your system, such as this Skyrim crash.

If you've never touched the pagefile, try performing the following steps:
1. Press Windows + R on your keyboard and enter sysdm.cpl,3 . If you are not already there, navigate to the 'Advanced' tab.
2. Under the 'Performance' section, press 'Settings'.
3. Go to the 'Advanced tab' at the top, and at the Virtual memory section press 'Change...'
4. Disable 'Automatically manage paging file size for all drives'
5. a) If you have more than one drive, try enabling it for at least one more drive as a backup (make sure it has a decent bit of free space, like 15GB). Set the size to 'System managed size'.

   b) Otherwise, set a custom size for the drive it's currently on and increase the maximum size to be at least 20GB - the minimum can be left at the default.    
   
#### 3, This error can also be caused by a corrupt NIF/DDS file. 

If adding a pagefile doesn't resolve the issue, then look through the logfiles' stack section for Meshes(nif files) or Textures(dds). The below log snippet shows a example of the type of file you are looking for. Search your PC for the file(s) shown. Delete the Mod folder that texture is located in. **Important:** It won't be in the folder in the log (e.g data\TEXTURES\) as these come from the virtual filesystem. You will need to search for them yourself.  Then reinstall from Wabbajack **choosing overwrite installation.**

{: .logfile}
>  [SP+200]  0x1EC0CCCD990      (BSResource::anonymous_namespace::LooseFileStream*)
>
>  [SP+208]  0x1EC00000002      (void*)
>
>  [SP+210]  0x1EC0CCD3418      (char*) "data\TEXTURES\plants\shrub01half_n.dds"
>
>  [SP+218]  0x1EC0CCD3458      (char*) "data\TEXTURES\plants\shrub01half.dds"


---

### When using a crossbow for the first time. Crash code SkyrimSE.exe+7BEC84  (only affects Version 1.0)

The crossbow mod needs to initialize and cannot do this while in combat causing the CTD. 

Fix: When you get your crossbow equip and unsheathe it right away (unless you obtain while in combat).

---

### When mounting horse with a follower. SkyrimSE.exe+6441D0 (affects Version 1.1 - 1.1.5)

In follower live package MCM - there's a option which says followers summon horses. **Turn this off.**

---

### Entering Windpeak Inn in dawnstar while on quest  "Rise in the East".  SkyrimSE.exe+C28E26 (only affects Version 1.0)

NPC Irlof is causing the game to bomb out. Fortunately he is just a "flavor" NPC so can be safely deleted. 

Fix: Use the following console commands to make him go away (one per line).

{: .callout-code}
> prid 0005226B  
> markfordelete  
> disable

---

### Crash on save with crash code (skse64_1_5_97.dll+5CE66)

Fortunately rare. Believed to be caused by saving while some form of head-tracking is in use (E.g Lock on in true directional movement).

---

## Crash on decapitation of a player or NPC AKA RaceMenu face overlay decapitation CTD bug (tbbmalloc.dll+196EB)

Happens when a player or NPC with a "face overlay" such as facepaint gets decapitated. Kill moves are turned off to prevent this.

---

### Crash on trying to edit Iequip. SkyrimSE.exe+C28C8B

This is caused by a conflict between consoleutil and Iequip. If you want to edit the Iequip screen, turn time dilation down to zero, make your changes, and then change it back.

---

### Crash on save with crash code making no reference to skyrimSe.exe (e.g Unhandled native exception occurred at 0x0 on thread) AKA the coffin crash

Caused by a City NPC dying while wearing cold weather gear (e.g cloaks, gloves, facemasks). 

In the example below you can see a Coffin object (may also be a burial Urn) - each NPC has a unique hall of the dead object. 

You will need to use a save cleaner and terminate the offending script (WIDeadBodyCleanupScript) causing the issue moving the NPC to the coffin.

- using <a href="https://www.nexusmods.com/skyrimspecialedition/mods/5031/" target="_blank" rel="noopener noreferrer">ReSaver from FallrimTools <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>
- Load the savegame > Active Scripts > WIDeadBodyCleanupScript 
- Locate ScriptInstance: WIDeadBodyCleanupScript: *refID=DEFAULT: Followed by the NPC Reference ID causing issues (if you don't know which NPC - its safe to remove all WIDeadBodyCleanupScript)
- Terminate the script

{: .logfile}
> Possible relevant objects (5)
>    
>  [  24]    TESObjectREFR(FormId: 000DEFB5, File: `Skyrim.esm`, BaseForm: TESObjectCONT(Name: `Coffin`, FormId: 000F6891, File: `Requiem for the Indifferent.esp <- Requiem Record Fixes.esm <- Unofficial Skyrim Special Edition Patch.esp <- Skyrim.esm`))
>  
>  [  34]    TESObjectARMO(Name: `Wolfskin Cloak - Light Trimmed Black`, FormId: 76002348, File: `Requiem for the Indifferent.esp <- Wildlander.esp <- 1nivWICCloaks.esp`)


---

### Noble with Bodyguard crash. (SkyrimSE.exe+10B9F52) (only affects Version 1.0)

This crash is caused by a random roadside spawn of a NPC with a bodyguard. The Noble has a bad facegen. This bug will be fixed in 1.1.

Fix: none. However, avoiding the area where the crash occurred for 24 hours normally "rerolls" the encounter.

---

### Honed Metal Random Crash. (SkyrimSE.exe+DDB796)

This we believe to be caused by scrolling though the honed metal blacksmith menu too quickly thus causing Skyrim to fail to load item previews.

This typically happens around the Saddle's. We are not sure if this is the cause or just a coincidence.

Fix: Use the filter to find the objects you want to craft. **Do not scroll.**

---

### Random Crash. Unidentified Cause (SkyrimSE.exe+C2A5F3)

This crash basically means something went wrong somewhere. Every report we have received is for different "relevant objects". It is not reproducible on demand.

Fix: reload and redo.

---

### Random NPC Movement crash (SkyrimSE.exe+11012FC)

The crash logs for this that we have seen are all in different locations, with different NPCs. Its not reproducible on demand.

Fix: reload and continue playing from last save.

---

### FLP Horse Random crash - (SkyrimSE.exe+6441D0)

Caused by you enabling "Follower horses" in the FLP MCM. This is known to cause crashes either during mounting or dismounting. It is why it is disabled by default.

Fix: Turn it off. 

---
### Istar Cairn-Breaker crash (SkyrimSE.exe+21FFE3)

Happens in and around Dragonbridge at sunrise (7am). Caused by the scrips telling Istar Cairn-Breaker to put his torch away when he isn't using one.

This is a rare crash. Attempts by staff to prevent the issue have reduced frequency but not prevented it all together. 

Fix: If you are inside of Dragonbridge's Inn, wait until 8am. If you are approaching in Dragonbridge, don't do so until after 8am. 

---

### Collision Crash. (SkyrimSE.exe+E014EC)

This crash basically means someone - when coming out of a building, collided with something.

95% of the reports I've had are in Whiterun, caused by a NPC loading inside a static object(scrubbing tub). At the rear of Arcadia's there are two farmhouses which have a scrubbing tub near them. NPC's leaving the house occasionally spawn inside the scrub tub, instead of outside the door. 

Fix: If the crash occurs in Whiterun, then disable the scrubbing tub using console. For all other locations, please raise a bug report.

---


### Crash selling Dwarven Dagger to Lisbet in Arnleif and Sons Trading (No crash code, just an exception code)

We don't know what causes this specific weapon to cause the crash. It is under investigation.

Fix: Sell it to someone else.

---

### Crash using a poisoned weapon (SkyrimSE.exe+1871198)

This crash only occurs when using a poisoned weapon while wearing a backpack with a tent, bedroll or cooking pot in your inventory.  We are not sure what about this specific combination of items is triggering the crash. We suspect it is the dynamic display of items triggering mid-weapon swing which might be causing the fault.

Fix: Give the offending items to a follower or horse to carry, or store inside of a placeable Chest/Barrel. 
                                                                                                
---    

### Save corruption. (SkyrimSE.exe+12DC5B)  

This crash means your save has corrupted. **There is no fix.** Any save you make after will have the same issue. Typical cause is ["save-scumming"](https://en.wiktionary.org/wiki/savescum).

Symptom: You can't load any save after the initial load into the game from the main menu (attempting causes a CTD). You may be able to "continue" from main menu, but not load specific save from main menu, or vice versa. Exiting to the main menu and loading a save from there will also cause the crash.

More Information: When you start skyrim initially, the character loaded into memory is a level 1 basic Nord character. Soon as you load your game from the menu, that level 1 is overwritten by your current character. Under normal circumstances when you reload your game, Skyrim tries to reset all of the changes step by step to get back to the original state of your save. In some cases, the engine doesn't fully reset (E.G merchant inventories not resetting, object Havok physics positions being different. NPC's or hand placed items disappearing).  When attempting this reset on a corrupt save, the engine throws a wobbly and causes the CTD. You can read more information about the skyrim Engine loading bugs here <https://www.reddit.com/r/skyrimmods/comments/116raxm/psa_engine_bug_when_reloading_saves/> 

Only solution is to roll back saves until you find one which works correctly.

Recommendations to reduce chance of issue occurring
* Don't save more than once a minute.
* **Never** save in combat.
* Avoid saving right after entering a building/cave/dungeon. 
* If you have re-enabled autosaves, **turn them off.**
 

---

### Crash using a Alembic from the favorites menu (SkyrimSE.exe+2994F6)

This Crash occurs when using the favorites menu to use the Alembic. The Alembic item assumes that the inventory is already open when activiating it. If its not it can generate a CTD when using any of the options from the popup menu.

Fix: Use the item from the Inventory.
