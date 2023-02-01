---
layout: default
title: How Do I Customize the list?
has_toc: false
description: Customization Guide
---

Welcome to the Wildlander customization guide! This page will explain the basics of modifying Wildlander, such as adding, removing, modifying, and patching mods.


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


## A warning before proceeding

Wildlander is a very complex modlist, and modifying it will likely cause issues unless you know what you're doing. This guide _can_ be used by modding novices, but as of now, it's aimed at proficient modders who need to know Wildlander specific information. (More basic modding guides will be available in the future, as time permits.)

For more general modding guides, we recommend [Lively's tutorials](https://github.com/LivelyDismay/Learn-To-Mod/blob/main/Main.md), the [GamerPoets YouTube Channel](https://www.youtube.com/@gamerpoets), and the [DarkFox127 YouTube channel](https://www.youtube.com/@Darkfox127).

{: .warning}
> The Wildlander support team does not offer support for modified versions of Wildlander. This is because it can be difficult or impossible to tell whether issues are the result of Wildlander, or a user's modifications.
>
> Should you choose to modify your install, you will only receive "support" from your fellow customizers in the official customization Discord channels. If you ask for modified Wildlander support in any other channel, your posts will be deleted, and you will be directed to the appropriate locations—and further posts outside the appropriate channels may result in a mute or ban.

## Modding Basics

**NEVER EVER** uninstall mods unless you are starting a new play-through.

Be careful updating mods. Check for update instructions. Some updates require you to start a new play-through.

Vortex / Wyrebash / Loot have their place, that place is 2 billion miles away from Wildlander and should not be used.
    
Make sure when downloading mods - they work with Skyrim 1.5.97. Downloading SKSE for anniversary editions WILL NOT WORK.

{: .important}
> You Cannot Disable Essential mods required by wildlander.ESP, unless you want to manually remove all references from wildlander.ESP for the mod you want to disable.

### Important Terms

1. Mod organizer      - The tool which makes everything work - Installed as part of the Wildlander installation in <install directory>\Game-files\Mod Organizer.exe
1. [Reqtificator](#Reqtificator)       - The requiem patcher - Makes 3rd party mods compatible with the Wildlander install.
1. [Dyndolod](#dyndolod) - The tool which draws items in the distance, generally needed to be ran if adding mods which change the landscape or add new player homes
1. Merging mods       - Advanced modding technique to combine multiple mods Plugin's into one.
     

### Known Mod Issues/Incompatibilities

The following Types of mods are NOT Compatible. (cause game breaking bugs)
> * Any Alternate start mod. (Skyrim unbound reborn is included in the list, which acts as a alternate start mod. It cannot be removed and replaced with something else)
> * Any Mod which affects the perk trees E.g. Ordinator 
> * Truly Absorb Dragon Souls, DSAMG - Dragon Soul Absorb More Glorious and Dragon Remains or any other mods which edit the main quest. (both listed mods prevents the main quest from firing upon killing a dragon)
> * Cold & Wet SE - causes Various CTD
> * Populated Cities Towns Village SE - Can cause the game to bug out into an endless loading scene when entering cities. COC'ing into one of the cities shops and leaving into the city from there circumvents and fixes it for some time
> * New Races (unless requiem patch available) Requiem won’t start and will return you to the main menu.
> * Skyrim Together (We use the wrong version of Skyrim for this)  
> * Enhanced character edit - Not compatible with racemenu, which cannot be disabled.
> * Any SKSE mods which require Skyrim version 1.6 onwards.

The following Mods are extremely script heavy, Will possibly break your game.
> *  Open Cities (also requires a tonne of manual patching)
> *  Sexlab Separate Orgasms (known to cause fps degradation/script bloat)

The following types of mods have Issues 
> *  New creatures/enemies/NPC's/followers   (unless requiem patch available) - Note: for enemies - they are generally added as unleveled, and in requiem this means they are always level 1. for NPC's and Followers - they will be missing the requiem perks and may also be unleveled (ergo level 1)
> *  Dead NPC Body Cleaner Remover (caused Immortal Vampires when you attempt to burn them, also causes civil war patrols to scream like banshee's)  
> *  New Quest area mods   (unless requiem patch available) - Note: This is because new area's generally add new creatures/enemies/NPC's and followers
> *  3Tweaks/BTweaks (Wont be compatible OUT OF THE BOX - It changes so much stuff, that it won't be compatible with anything without 3tweaks dedicated patch - which just doesn't exist for the bulk of the mods in the list - Including Wildlander.esp itself).     

---
### Introduction to Mod Organizer 2
	
Mod Organizer is divided into two sections, The left side is for loose files, these are loaded into Skyrim from the top down. If two identical files exist, the one closest to the bottom will be the one loaded.

The Right side of the list is the plugins, these are the mods themselves containing instructions on how the game constructs the world. Instructions inside of these plugins can conflict, so again, the ones at the bottom of the list take priority.

![image](https://user-images.githubusercontent.com/26418143/173229360-cc431243-c5fb-4f1b-babd-74efc9cb80db.png)

If you have two Plugins which touch the same records then you need to make a decision, Which one should take priority. Or - If you want BOTH plugins to affect the record, then you will need a compatibility patch to combine both Plugin's records into 1. The panes are sorted by drag and drop. If you want to move a mod you click-drag it to where you want it on the load order.

{: .important}
> 
> If you start modding make a copy of Wildlander profile and name it something like "$Original Wildlander Profile name+ Modified".
> 
> You will always be able to switch back to the original profile and load it that way in case you screw up badly.

In the top right area of mod organizer are the shortcuts to run the various tools. 
	
![image](https://user-images.githubusercontent.com/26418143/215193269-199f14c3-a4ae-4ed5-8414-34b88966c04d.png)
	
#### How to backup the original profile

If it is your first time Modding the list. Then use the profiles dropdown and select 'manage'. From there make sure the profile "performance" or "standard" is highlighted (depending on which one you want to mod) and select Copy. Give the backup a name.
	
![image](https://user-images.githubusercontent.com/26418143/215202472-e996627a-664d-4230-a04a-0eb00fb78c98.png)
	

#### How to backup the Load Orders

On the left side next to the "active" mod count there is a button which looks like a white box with a blue arrow pointing at it. This will create a backup of the Left side at the current point.
	
![image](https://user-images.githubusercontent.com/26418143/215202535-0b276616-4826-4bac-9614-783292cd28ec.png)
	
On the Right side next to the "active" mod count there is a button which looks like a white box with a blue arrow pointing at it. This will create a backup of the Plugins side at the current point.
	
![image](https://user-images.githubusercontent.com/26418143/215202610-e6368e81-22d0-44be-827a-a361e88d6413.png)

The yellow arrow button next to the backup (both sides) will allow you to restore from previous settings in case you make a oopsie.	

---

### Installing Mods not covered by guides.

All mods should be added to Mod organizer, not to your Skyrim directory. 

- Download it to your Wildlander download folder (this will be the directory you entered on the Wabbajack installer when you first installed the list)
- From the launcher select Advanced > Mod organizer.
- Take a backup on the load order before making any changes.
- Select download tab on right side
- Find the mod in the list and right click > install (you may need to click the refresh button to make it appear)
- choose your settings (if it has installation options) then once its finished installing turn it on, on the left side of the mod organizer (should be at bottom of the list).
- **Important** if patching from "Requiem patch central" Untick any ticked patches for mods in the base Wildlander install, and only tick ones for mods you are adding yourself.
- If you mod doesn’t have any ESP/ESM/ESL's then that’s it - otherwise continue!

Sort your (right side) Plugins load order **manually** (LOOT IS THE DEVIL - ERASE its Existence from your memory).

If there isn't a specific guide, then as a general rule of thumb

- Anything that adds spells, weapons, followers or other types of NPCs should go ABOVE Requiem.esp (right pane of MO2)
- Patches always have to be below the mod they are patching, thus the requiem patches will be below Requiem.esp by the other requiem patches while your mod will be above Requiem.esp.

![image](http://wiki.wildlandermod.com/Assets/RequiremPatch.png)

- Any mods which don't Add new NPCS, followers, Spells and weapons, should be installed below the Wildlander Full mod(E.g. Autosave manager, bathtubs Basins and beyond, tentpalooza)
- Run the Reqtificator whenever you change the load order.

Close mod organizer - and use the launcher to start the game.

---

## Can I add.....?

How are we supposed to know? There are over 50,000 mods on nexus, There is no way anyone can tell you if a mod is going to cause problems or not.

Things to check
1. Is there already a guide for it available
1. Are there any mod conflicts from Mod organizer tool - this will tell you if the files being changed as touched by any other mods in the list. You would see this by looking at Mod organizers "information" panel to see if any files are overwritten by your new mod.
1. Record conflict resolution. The next thing to check is the actual ESP/ESL/ESM files for conflicts. I would recommend the following guide <https://tes5edit.github.io/docs/5-conflict-detection-and-resolution.html> to help you to learn how to check for mod conflicts within SSEEdit. If there are any then most likely you would need to write a conflict resolution patch.

---

## Can i Remove.....?


The Wildlander mod itself has a lot of Master files (144 plugins) which cannot be disabled without removing all of the relevant records from wildlander.esp. 

Files which are masters are required by the mod itself, and disabling the master will cause the game to crash.

I'm commonly asked about the following mods. They are all Masters of Wildlander and cannot be removed:-
* Suspicious city guards
* Sunhelm
* Frostfall
* Immersive Horses
* Follower Live Package

Requiem is the core mod in this pack - It literally cannot be removed.

---

## I've added mods and I'm getting crashes to desktop!

Firstly - Check our [crash help](https://wiki.wildlandermod.com/01Support/CTDs/) - it maybe you are getting one of the crashes from Wildlander itself

If your issue isnt listed - then the below resources may help you identify what is going wrong.

A quick guide to NetScriptFramework Error Codes <https://www.nexusmods.com/skyrimspecialedition/articles/3031/>
More crash help here <https://github.com/Fikthenig/Crash-Bonanza>

and finally - if all else fails search here (or make your own post) <https://www.nexusmods.com/skyrimspecialedition/mods/49130?tab=posts>


-----
## Tools

### Creation Kit

1) Download and install into steam Folder : https://store.steampowered.com/app/1946180/Skyrim_Special_Edition_Creation_Kit/
2) Download and install into steam Folder : https://www.nexusmods.com/skyrimspecialedition/mods/67096/

* Copy Papyrus Compiler folder from Steam skryim into <install folder>\Game-files\Stock game
* Copy Creation kit.exe from Steam skryim into <install folder>\Game-files\Stock game  
* Unzip <steam fold>\data\Scripts.zip into <install folder>\Game-files\Stock game\Data
	
Download https://www.nexusmods.com/skyrimspecialedition/mods/20061 and unzip contents into <install folder>\game-files\Stock game

### Papyrus Compiler SE
	
1) Download and install creation kit as per above instructions
2) Open program from mod organizer
	
![image](https://user-images.githubusercontent.com/26418143/180988545-9a2f1b18-553e-455c-ba28-73c67f225e5a.png)
	
3) from above screen click cog icon
4) Set  Skyrim SE folder to Game-files\Stock game 
5) Set  papyrus compiler to Game-files\Stock game\Papyrus Compiler

### Dyndolod

DynDOLOD is an optional mod that greatly improves the appearance of distant terrain. It can affect your framerate, but the impact isn’t too bad and the visual difference is well worth it.

There is nothing unique about Wildlander's DynDOLOD settings. Simply follow Phoenix's excellent guides: first the [SSELODGen guide](https://thephoenixflavour.com/tpf/finalisation/sselodgen/), then the subsequent [DynDOLOD guide](https://thephoenixflavour.com/tpf/finalisation/dyndolod/).

### Reqtificator
	
The Reqtificator should be configured as follows:
	
![image](https://user-images.githubusercontent.com/26418143/215734169-c779476d-c699-43b1-bf51-afc4d1009639.png)


### Nemesis 

1. Most important - before doing anything - You have to add Nemesis Engine to the windows defender exception list, or whatever Anti Virus you are running otherwise it will crash on startup.
2. Install your animation mods as normal.
3. Run Nemesis from Mod organizer dropdown.


The following Video shows a tutorial of how to install some Nemesis Animations
[Skyrim 2022 Ultra Modded - Animation mod recommendations and how to install - Wildlander](https://youtu.be/gc8Ai7jYDXc?t=1077)

The video covers most of it and I already linked to the timestamp that is really important, but there are a few edge cases still left.

Q: I have followed the tutorial but my animations don't show up/Nemesis just throws up something like: Initializing Engine update, engine update complete 15 seconds. But none of my extra animation mods are referenced.

A: Click Launch Nemesis Engine and not Update.

Q: I clicked Launch Nemesis engine and now I am getting an access error or some other sort of crash.

A: You have to add Nemesis Engine to the windows defender exception list, or whatever Anti Virus you are running. For Windows defender, go to its system  and add "Nemesis Unlimited Behavior Engine.exe" Process to the exclusion list. It should look something like this. 

![image](https://user-images.githubusercontent.com/26418143/173229406-08b78e3a-6ec5-4eaf-9647-5d618559c6e0.png)

### Resaver - Save cleaner and script remover.

This tool is useful for removing Bugged/crashed scripts from your save and correct script-lag. 

I strongly recommend reading the mod page And/or watching tutorial videos before using.

ReSaver from FallrimTools: https://www.nexusmods.com/skyrimspecialedition/mods/5031?tab=files


### Xedit / tes5edit/ SSEedit

If you want to mod Wildlander - then you need to know how to use this tool to check for conflicts. 

The bible for the tool is located <https://tes5edit.github.io/docs/>

----

## Submitting Patches

Should you wish to submit a single Patch you can do so here <https://forms.gle/D6zwQ9XiywDpqVfR7>

Should you wish to submit a Guide containing multiple patches you can do so here <https://forms.gle/BFnvGTPpAhTYjw8q9>

