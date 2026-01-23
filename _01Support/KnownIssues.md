---
layout: default
title: Known Issues & Workarounds
nav_order: 4
has_children: false
description: Known Issues and Fixes
---

This document will contain all of the Known Issues with workarounds, as well as a listing of issues which cannot be resolved.  

The below button will take you to the full known issue page.

<a class="btn btn-pink" href="https://wiki.wildlandermod.com/01Support/FullKnownissues/index.html">All Known issues</a>

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

--- 
## Getting asked to restart for the economy on a new game. DiD players * please read.

{: .warning } 
> **See [Important Information > When starting a new character](https://wiki.wildlandermod.com/01Help/Important-Information/#when-starting-a-new-character) for full details.**
>
> TL;DR: Always close and reopen Skyrim entirely before creating a new character. Do not just exit to menu and start a new game in the same session - this is a Skyrim engine limitation, not a Wildlander bug.


## When will these be fixed?

Depending on the severity some maybe hot-fixed immediately, other will wait until next major release. Some patches are available in the patches and Bugfixes channel on our discord.

Some may need to wait for the mods used behind the scenes to be corrected.

The next section highlights the issues which cant be resolved.

---
## Issues which cannot be resolved.

This section includes issues which cannot presently be resolved due to the issue being related to the technical functionality of a mod, the time it would take to correct would not be of benefit, or an engine issue related to Skyrim itself.

**Severity Legend:** 🔴 = Game-breaking | 🟡 = Major impact | 🟢 = Minor/cosmetic

### � NPCs added by mods don't have voice lines or are immersion breaking.

Unfortunately, this would require a great deal of effort to replace the voice lines and dialog so they fit.

### 🟡 I speak to a farmer and ask him if I can harvest his crops, but some give me bounties.

This would require a lot of effort to correct ownership on the specific plants causing the issues. In some cases the opposite is true as well and plants which should be owned are not.

### 🟡 SkyUI Groups broken.

When an item changes condition, either via tempering or via degradation, any groups that that item was assigned to no longer function.

SkyUI uses SKSE to find the specific item (via CRC) to equip. Changes to a weapon, either name or temper, causes the CRC to change and prevents groups from functioning. There is nothing we can do to prevent the CRC from changing.

### 🟡 Thieves Guild quests not starting when handing in the previous quest.

This is a vanilla issue. See the section further down this page which contains workarounds for common problems.

### 🟢 Lights are flickering on and off.

Most noticeable in Breezehome's basement and entrance to Riverwood but can happen everywhere.

This is caused by Skyrim's engine limitation of 4 light sources in a 30ft radius of the player. When you move the camera in an area with more than 4 light sources they alternate/cycle and turn on and off. This includes your torches and/or lantern.

There is nothing we can do to correct this. **Bug reports on this topic will be deleted.**

**Note:** While Community Shaders includes a light limit fix, using it would constitute a modification to Wildlander and is therefore unsupported. If you choose to use it, you do so at your own risk and should not report issues encountered while using it.

### 🟢 When using Honed Metal to craft something, missives in your inventory complete and then abort.

This is related to how Honed Metal functions. It transfers the inventory of the smith or enchanter to your inventory so you can see from the Honed Metal craft menu what the smith can craft. This transfer essentially triggers the "quest complete" part of the missive.

### 🟢 I hear random drinking noises.

In Wildlander, both NPCs, followers, and horses can drink potions from their inventory. Unfortunately, Skyrim doesn't have an "NPC" drink noise, so it plays the generic one as though the player was drinking.

### 🟢 Health/Stamina potions are disappearing from my horse's inventory.

The horse is treated as though it is a follower and when it's low on stamina or health, it can and does drink potions from its inventory.

This will be corrected in R4. Unfortunately, this cannot be corrected by the user as doing so would break existing saves.

### 🟢 Bookshelves can be used to duplicate items placed upon them.

E.g. Placing a book on a shelf, removing the book from the shelf by "picking it up," then using the shelf inventory to get a copy.

Unfortunately, this is an engine issue where removing the book from the shelf by pickup doesn't edit the container.

---
## M/O 2 

None of these are actually bugs but I'm including them here to hopefully prevent bug reports.

1. *Reporting files in the overwrite.* These are your crash logs.
2. *All the NPC overhauls are disabled.* They are supposed to be. _They are for Dylan's use only_ Hence "DEV RESOURCES" label.
3. *There are mods with Red X's.* These are merged into the Wildlander ESP. It's perfectly normal
4. *Mod XXX is out of date.* Perfectly normal for modlists to have older versions of mods. Some mods update several times a month and the list won't ever be able to keep up.

---

## Camera Issues

1. *Arms clipping or off to one side when casting spells*. Issue with the current version of Improved camera, closing and reloading generally corrects this temporary.
2. *Whenever I open a crafting station such as an enchantment table, alchemy lab, cooking pot, etc., for the second time in the same cell, the menu doesn't load and I'm stuck.* You have to save, exit and restart the game to fix this.

---

## Gameplay Issues

### 🟡 Waking Nightmare - Casimir body visible

When on the step "release the miasma" and you're pretending to be Casimir, you can see your player's body in front of camera.

The effect only lasts for the duration of this step and can be safely ignored.

### 🟡 Alt-Tab Block Animation Issue

When weapons are pulled out and you alt-tab in third person, the PC goes into block animation and moves really slowly, but in first person the issue goes away.

**Workaround:** Press Control. Note: This happens if you have moved "Dual Wield Block" to the Alt key and then alt+tab out. It's strongly recommended that nothing be bound to the Alt key.

### 🟢 Horses forget to spawn with armor

Horses occasionally forget to equip armor, despite having it in their inventory.

**Workaround:** Force the horse to equip armor:
1. Drop the armor on the floor.
2. Open console. Click on the armor and make a note of the Base ID (the hex number).
3. Close console. Pick it up and place it in the horse's inventory.
4. In console, click the horse and use this command (replace baseID with the number you noted):

{: .console}
> equipitem baseID 1 

### 🟡 Owned items become free to take

This is caused by a setting in Po3 Tweaks called "faction stealing" in the INI. It states that you can only take items when you are friends with all members of a faction present.

Unfortunately, this setting also allows you to take items when *no* members of a faction are present.

**Workaround:** Edit `game-files\mods\Wildlander\SKSE\Plugins\po3_Tweaks.ini` and change the setting below to False:

{: .iniSetting}
>[Tweaks]
>FactionStealing = False
>
>
>;Items will be marked stolen until player is friendly with all present members of faction.
>
>Faction Stealing = true



---

## Thieves Guild.

Thieves guild has some issues for a small percentage of people. The vast majority of these issues are caused by vanilla issues where when handing in one quest and the following quest does not start correctly. 

As a general rule: save **before** handing in a quest to Brynjolf, so if you have issues you don't have to redo it.

### Next quest isn't starting.

You need to do Radiant quests before the next quest will start these settings can be seen in the MCM. 

If you have met these objectives but the next quest does not start.

1. Exit Wildlander and restart using the Wildlander Launcher.
2. Load your game using a save before you handed in the previous quest.
3. Speak to Brynjolf hand in previous quest - next should start.

If it doesn't, you will need to look up the quest ID to start the quest manually then use the below commands to force it to start.

{: .console}
>
> startquest questid
>
> setstage questid 10

---

### Brynjolf just wants to sell me falmer blood elixer.

Thieves guild in Wildlander has standards and they will only recruit thieves.

You will need:
1. 250 items stolen, 
2. 25 items pick pocketed from **unique** people. Taking multiple items from the same person only counts as 1 pocket picked.
3. Sneak skill at 25.

for Brynjolf to approach you.

---

### Issues with Brynjolf not waiting for me in the ragged flaggen / A Chance Arrangement issues.

90% of the time this happens if Brynjolf starts the quest "A Chance Arrangement" *anywhere* except in Riften's market place. Typically in the bee and barb.

1. Meet the requirements to start the thieves guild (250 items stolen, 25 items pickpocketed, Sneak Skill at 25).
1. Go to Riften Stables (or outside of Riften itself)
1. Get to 10am game time.
1. Save your game.
1. Exit Wildlander and restart using the Wildlander Launcher.
1. Load your game.
1. Go to the Riften marketplace and allow Brynjolf to come up to you and start the conversation.
1. Complete the marketplace quest by planting the ring on Brand-Shei.
1. Make a save.
1. Talk to Brynjolf once that is complete.

At this point, check your journal to make sure if Taking Care of Business has started. If not:

1. Close Skyrim.
1. Re-open Skyrim.
1. Load the save you made before handing A Chance Arrangement in and try again.

If that still doesn't work, then try below console commands to force it to start:

{: .console}
>
> startquest TG01
>
> setstage TG01  10

If Brynjolf is not at the ragged flagon when you get there, but the quest is running:

{: .console}
>
> prid 20545
>
> moveto player

### People attack me when entering the cistern / Loud and Clear not started.

This can occur in a unmodified version of Skyrim as well. For some reason Skyrim simply won't start the quest automatically after handing in Taking Care of Business.

Source: From Bugs section of <https://en.uesp.net/wiki/Skyrim:Taking_Care_of_Business> :-

1. Make a save.
2. Close Wildlander completely
3. Restart Wildlander. 
4. Load your save
5. Type in the below console commands.

{: .console}
>
> startquest TG02
>
> setstage TG02  0 
>
> setstage TG02  10

---

### Dampened Spirits doesn't start.

This can occur in a unmodified version of Skyrim as well. For some reason Skyrim simply won't start the quest automatically after speaking to Brynjolf and him telling you to talk to Maven. Console commands don't work, Waiting and then console commands don't work.

The only reliable work around we have found (instead of rolling back to previous saves and retrying a few times) is to :-

1. Make a save
1. Exit Wildlander and restart using the Wildlander Launcher 
1. Load the save you just made
1. Then type in the below console commands.

{: .console}
>
> startquest tg03
>
> setstage tg03 10

---

### I've completed the main thieves guild quest, but now Brynjolf is stalking me!

This is because one of the quests wasn't set to completed. Its usually Tg03 so you can use the commands below to complete and then stop it.

{: .console}
>
> completequest TG03
>
> stopquest tg03

if he continues to stalk you then it will be either quests 1, 2 or 4 still running. Using the command "sqv tg01" to "sqv tg04" and stopping the quests still enabled with "stopquest tg01" and "stopquest tg04"  (example below)

{: .console}
>
> sqv tg01
>
> stopquest tg01

---

## Mod Issues.

### Dragons spawning early or not at all.

This is a fault with the current version of Skyrim Unbound Reborn. It cannot be corrected without updating the mod which would require us to enforce a "new game" required rule.

It will be corrected in R4.

If your dragons are not spawning: you can go to the Skyrim Unbound Reborn MCM and set Dragons to Enabled, which will force them to spawn.

---

### Bathing

If bathing in very cold water, it can kill you before the animation finishes. 

Work around: don't take a bath in cold water ;)

---

### I get a pouch/book/holder/carpet appearing at my feet (or my followers) / Crafting opening when Zoneing.

Firstly: **NEVER** give followers backpacks. Using these items causes scripts to fire unintentionally, you to get crafting experience unexpectedly and carpets to appear whenever they are stationary.

If you **don't** have followers then you can possibly solve it by either selling your existing backpack and buying a new backpack OR by dropping your backpack and using console commands 

{: .console}
>
> help "item" 
>
> Player.Additem {itemid} 1
> 

to console yourself a replacement.

You can safely disable any rugs which have spawned near you. The general cause of this issue affecting the players backpack is Unsafe Saving. Make sure that you follow the advice in [Important Information](https://wiki.wildlandermod.com/02-RecommendedReading/9-Important-Information/#save-advice) regarding saving to reduce the chance of this reoccuring.

--- 

### Crossbow Infinitely reloads.

Happens if you switch gender using showracemenu. 

Simple fix - switch gender back.

{: .alternative } 
>
> using <a href="https://www.nexusmods.com/skyrimspecialedition/mods/5031?tab=files" target="_blank" rel="noopener noreferrer">ReSaver from FallrimTools <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>
>
> Loaded the save game > search for hzNECRAliasScript
>
> Delete Everything using the right click menu.

![image](https://user-images.githubusercontent.com/26418143/175317923-9cdc1a68-4653-4e18-a274-d48cf8feeea0.png)

---
### Potions don't dissolve when using a spell research coldroun 

Happens because requiem potions are "too" strong for the default calculation to produce a result.

Fix: Patch and installation instructions are on our discord Patches and bugfixes channel.

---
### Hawks cant be looted whhen shot down

Happens because of a failed attempt to resolve another issue with hawks which causes them to become invisible when they hit the floor.

Fix: Patch and installation instructions are on our discord Patches and bugfixes channel.


---
## Quests

1. No boss to kill for trouble in skyrim at Druadach Redoubt or Blind Cliff Cave
* Sometimes quests can spawn for locations you have already cleared, or require another quest to be done first. Use console command to skip to the next stage.

{: .console}
>
> setstage cr05 20

---

1. Upon entering Frostflow Lighthouse and finding the dead bodies, the related quest does not register.

* Intentional. This is now a hidden quest. Manually looting the giant Chaurus provides you with Habd's remains which you can burn at the top of the lighthouse to complete the quest.

---

1. Rebuilding the Blades cannot be completed. / Delphine cannot accept followers to join the blades.

* Workaround: Use console to complete this quest. 

{: .console}
>
> setstage FreeformSkyhavenTempleA 40  

---

1. Refusing Harkon's offer means a new order doesnt start 
* Workaround  Force the quest to start using console commands.

{: .console}
> setstage DLC1HunterBaseIntro 20 
>
> setobjectivedisplayed DLC1HunterBaseIntro 20 1

---

1. Silus would not leave his house for me to go to Mehrunes' shrine for his quest 
* Workaround: Using Console commands to move him allows the quest to proceed.

{: .console}
>
>Prid 240CE 
>
>moveto player

---

1. "Accept Jarl Balgruuf the Greater's surrender" objective during Battle for Whiterun (Stormcloaks) is stuck.
* Striking the Jarl and then paying off the bounty may fix this.

---

1. Valerica Refuses to enter the Boneyard
* Caused by a bug which deletes the door references. Fixed temporarly by using console.

{: .console}
>
> prid 02003B8E  
>
> moveto player. 
> 
> This will teleport Valerica next to you, and she will resume to her correct pathing. As for Serana, just repeat the process but type prid 02002B74 instead.

---

## Immersion issues

  
### Sounds

* Insect noise is overly loud.
* Some interiors have ghost children playing sound effect.

Both these can be turned off using the Immersive sounds MCM.

* Combat music plays on infinite loop sometimes despite no enemies, despite changing area (like going into an inn), or save/loading. 

The only workaround is to close the game and boot it back.


---

## ENB

* Map went technicolor 

Workaround: Restart Skyrim.

* Interiors have broken green lighting 

Workaround: Restart Skyrim.

---

## Civil war

* It's full of vanilla bugs.
* It exists (Why Bethesda did you include this mess in the release?). 
* We (Wildlander) do not edit any quest associated with civil war therefore any bugs you encounter are original issues.
* Several immersion breaking issues during battle for Whiterun (Vendors in market are trying to make a living. The carriage driver be vibing as explosions happen all around him)
* Lights within Korvanjund Hall beyond the sealed door are lit (should be dark).

If you are having a issue for a civil war quest - please check <a href="https://en.uesp.net/wiki/Main_Page" target="_blank" rel="noopener noreferrer">UESP WIki <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a> - there maybe a work around here.

#### Rikke keeps asking me if i'm lost when trying to join the imperials

This can happen if "joining the imperial legion" quest is at a incorrect stage.

{: .console}
>
> sqv D3C5F

if it's not stage 20
then

{: .console}
>
> setstage D3C5F 20

## Bugs with At the Summit of Apocrypha

* Unfortunately, this was also a bethesda scripted mess. There is precious little Wildlander Staff can do to resolve the issues.

If Miraak doesn't die after you defeat him 
* The general solution for this is to load a save prior to the word wall and redo the fight until it works correctly.


Please check <a href="https://en.uesp.net/wiki/Skyrim:At_the_Summit_of_Apocrypha" target="_blank" rel="noopener noreferrer">UESP WIki <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a> - there maybe a work around which works for you here here.



### Full List of issues

<a class="btn btn-pink" href="https://wiki.wildlandermod.com/01Support/FullKnownissues/index.html">All Known issues</a>