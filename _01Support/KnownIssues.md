---
layout: default
title: Known Issues
nav_order: 4
has_children: false
description: Known Issues and Fixes
---

This document will contain all of the Main Known Issues. It excludes any graphical issues, EG Clipping textures. This document is updated as issues are verified/reproduced by staff or reported by multiple people. If you would like to see the entire list to date

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
> If you have played a character already and then exit to the main menu, do not attempt to start a new character in the same session. Instead, quit entirely out of Skyrim and restart it from there. If you do not do so, the game will not operate properly and you will get errors such as 'please restart the economy,' or 'Honed Metal has crashed.'
>
> This *isn't* a bug with the list. Skyrim does not handle you playing one character, returning to the menu and starting a second. This is because Skyrim doesn't unload all of the previous games scripts and can cause severe issues with your new play-through (hot-keys not working, broken economy, merchants with no gold, or even your character leveling up when they shouldn't be).
>
> Every time you want to start a new character, you should be closing and reopening Skyrim in its entirety.
>
> Please *DO NOT* report bugs relating to this topic as its a flaw with Skyrim itself. There is nothing we can do to make this work!


## When will these be fixed?

Depending on the severity some maybe hot-fixed immediately, other will wait til next major release.

Some may need to wait for the mods used behind the scenes to be corrected.

the next section highlights the issues which cant be resolved.

---
## Issues which Cannot be Resolved 

This section includes issues which cannot presently be resolved due to the issue being related to the technical functionality of a mod, the time it would take to correct would not be of benefit, or a engine issue related to skyrim itself.

### Lights are flickering on and off

Most noticeable in Breezehome's basement and entrance to riverwood but can happen everywhere.

This is caused by Skyrim's engine limitation of 4 light sources in a 30ft radius of the player. When you move the camera in a area with more than 4 light sources they alternate/cycle and turn on and off. This includes your torches and/or lantern.

There is nothing we can do to correct this, bug reports on this topic will be deleted.

### When using Honed metal to craft something, missives in your inventory complete and then abort.

This is related to how honed metal functions. It transfers the inventory of the smith or enchanter to your inventory so you can see from the honed metal craft menu, what the smith can craft. this transfer essentially triggers the "quest complete" part of the missive.

### I hear Random drinking noises.

In Wildlander, both NPC's followers and horses can drink potions from their inventory. Unfortunately Skyrim doesnt have a "NPC" drink noise, so it plays the generic one as though the player was drinking.

### Health/Stamina Potions are disappearing from my horse's inventory.

The horse is treated as though it is a follower, and when its low on stamina or health can and does drink potions from its inventory

### NPC's added by mods dont have voicelines or are immersion breaking.

Unfortunately - this would require a great deal of effort to replace the voice lines and dialog so they fit.

### I speak to a farmer and ask him if i can harvest his crops, but some give me bounties.

Again - this would require a lot of effort to correct ownership on the specific plants causing the issues. In some cases the opposite is true as well, and plants which should be owned are not.

### Bookshelves can be used to duplicate items placed upon them.

E.g Placing a book on a shelf, removing the book from the shelf by "picking it up" then using the shelf inventory to get a copy.

Unfortunate this is a engine issue where removing the book from the shelf by pickup doesn't edit the container.

### SkyUI Groups broken.

When a item changes condition, either via tempering or via degredation, any groups that that item was assigned to no longer functions.

SkyUI uses SKSE to find the specific item (via CRC) to equip. changes to a weapon, either name or temper causes the CRC to change and prevents groups from functioning. There is nothing we can do to prevent the CRC from changing.

### Thieves guild quests not starting when handing in the previous quest.

This is a vanilla issue, there is a section further down this page which contains work arounds for the common problems.

---
## M/O 2 

None of these are actually bugs - but i'm including them here to hopefully prevent bug reports.

1. Reporting files in the overwrite - these are your crash logs
1. All the Npc overhauls are disabled - They are supposed to be _they are for Dylan's use only_ Hence "DEV RESOURCES" label.
1. There are mods with Red X's - these are merged into the Wildlander ESP - its perfectly normal
1. Mod XXX is out of date - Perfectly normal for modlists to have older versions of mods, Some mods update several times a month and the list wont ever be able to keep up.

---

## Camera Issues

1. Camera can go wonky opening the Tab Menu whilst on horse back. (rarely happens)
1. Waking nightmare - when on step release the miasma  - and your pretending to be Casimir. You can see your player's body in front of camera. The effect only lasts for the duration of this step and can be safely ignored.
1. Camera is too close to head when running
1. Arms clipping or off to one side when casting spells - Issue with the current version of Improved camera, closing and reloading generally corrects this temporary.
1. Whenever I open a crafting station such as an enchantment table, alchemy lab, cooking pot, etc., for the second time in the same cell, the menu doesn't load and I'm stuck.have to save exit and restart the game to fix

---

## UI

1. On ultrawide monitor (2560x1080), perk names appear VERY right aligned to perk "stars" making it awkward to use the perk menu as perk names appear over other perk "stars" in many cases.
1. certain elements of the UI will disappear (the compass and the H/M/S bars) after pressing X or when an inventory window is open

---

## Gameplay Issues

1. Waking nightmare - when on step release the miasma  - and your pretending to be Casimir. You can see your player's body in front of camera. The effect only lasts for the duration of this step and can be safely ignored.
1. Drawing weapon when stealthed increases speed 
1. Got a bounty for opening a unlocked door in Whiterun's halls of the dead.
1. Prices of the summon tomes are WAY higher than the other ones
1. There is a note from Holidays on the counter of the Bannered Mare, but it cant be interacted with
1. Got a Trespassing in Warmaidens during opening hours (typically happens if the shop doesnt open and user picks lock to gain entry)
1. The Nightmother's Coffin can be searched and is Empty While helping Cicero 
1. Alessandra says Anders is located in Windhelm instead of Whiterun
1. Tempering Labels currently do not work.
1. Bathing can teleport the player to a seemingly random location.

### With workarounds

**When weapons are pulled out and you alt-tab, in third person the pc goes into block animation and moves really slowly but in first person the issues goes away**

Hit Control. Note: This happens if you have moved Duel wield block to the Alt key and then alt+tab out. Its strongly recommended that nothing be bound to the alt key. 

--- 

**Horses occasionally forget to spawn with armor, despite having it in their inventory** 

You can force the horse to equip armor by the following process.
1. Drop the armor on the floor
2. open console, Click on it and make a note of the base id for the horse armor.
3. close console, Pick it up and place it in the horse's inventory.
4. In console again click the horse replacing "baseid" with the number you made note of use the following console command 

{: .console}
>
> equipitem baseID 1 

---

## Thieves Guild

Thieves guild has some issues for a small percentage of people. The vast majority of these issues are caused by vanilla issues where when handing in one quest, the following quest does not start correctly. 

As a general rule - save **before** handing in a quest to Brynjolf, so if you have issues you don't have to redo it.

### Next quest isnt starting

You need to do Radiant quests before the next quest will start these settings can be seen in the MCM. 

If you have met these objectives but the next quest does not start.

1. Exit Wildlander and restart using the Wildlander Launcher.
1. Load your game using a save before you handed in the previous quest.
1. Speak to Brynjolf hand in previous quest - next should start.

If it doesn't, you will need to look up the quest ID to start the quest manually then use the below commands to force it to start.

{: .console}
>
> startquest <questid>
>
> setstage <questid> 10

---

### Brynjolf just wants to sell me falmer blood elixer.

Thieves guild in Wildlander has standards and they will only recruit thieves.

you need :-
1. 250 items stolen, 
1. 25 items pick pocketed from unique people. (taking multiples from the same person only counts as 1 pocket picked)
1. Sneak Skill at 25

for Brynjolf to approach you.

---

### Issues with Brynjolf not waiting for me in the ragged flaggen / A Chance Arrangement issues.

90% of the time - this Happens if Brynjolf starts the quest "A Chance Arrangement" *anywhere* except in Riften's market place. (typically in the bee and barb)

1. Meet the requirements to start the thieves guild (250 items stolen, 25 items pickpocketed, Sneak Skill at 25).
1. Go to Riften Stables (or outside of Riften itself)
1. Get to 10am gametime.
1. Save your game.
1. Exit Wildlander and restart using the Wildlander Launcher.
1. Load your game.
1. Go to the Riften marketplace and allow Brynjolf to come up to you and start the conversation.
1. Complete the marketplace quest by planting the ring on Brand-Shei.
1. Make a save.
1. Talk to Brynjolf once that is complete.

At this point - check your journal to make sure if Taking Care of Business has started. If not - close Skyrim, reopen Skyrim and load the save you made before handing A Chance Arrangement in and try again. if that still doesn't work, then try below console commands to force it to start.

{: .console}
>
> startquest TG01
>
> setstage TG01  10

If Brynjolf is not at the ragged flagon when you get there, but the quest is running.

{: .console}
>
> prid 20545
>
> moveto player

### People attack me when entering the cistern / Loud and Clear not started

This can occur in a unmodified version of Skyrim as well. For some reason Skyrim simply wont start the quest automatically after handing in Taking Care of Business.

Source: From Bugs section of <https://en.uesp.net/wiki/Skyrim:Taking_Care_of_Business> :-

Make a save, Close Wildlander completely and restart Wildlander . load your save, then type in the below console commands.

{: .console}
>
> startquest TG02
>
> setstage TG02  0 
>
> setstage TG02  10

---

### Dampened Spirits doesn't start

This can occur in a unmodified version of Skyrim as well. For some reason Skyrim simply wont start the quest automatically after speaking to Brynjolf and him telling you to talk to Maven. Console commands don't work, Waiting and then console commands don't work.

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

### i've completed the main thieves guild quest, but now Brynjolf is stalking me!

This is because one of the quests wasn't set to completed.

{: .console}
>
> completequest TG03

---

## Mod Issues.

### Outlaw Refuges. 

* The stores contain static items which can't be stolen
* Several beds have owned markers
* Several objects (e.g. training dummies) are not interactable and should be.

---

### Bathing

If bathing in very cold water, it can kill you before the animation finishes. 

Work around: don't take a bath in cold water ;)

---

### I get a pouch/book/holder/carpet appearing at my feet (or my followers) / Crafting opening when Zoneing.

Firstly: NEVER give followers backpacks. using these items causes scripts to fire unintentionally, you to get crafting experience unexpectedly and carpets to appear whenever they are stationary.

If you don't HAVE followers, You can possibly solve it by either selling your existing backpack and buying a new backpack OR by dropping your backpack and using console commands 

{: .console}
>
> help "item" 
>
> Player.Additem {itemid} 1
> 

to console yourself a replacement.
--- 

### Crossbow Infinitely reloads

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

### Properties Without Pestering

After starting a new game dialogue to purchase player homes will not show at first. This can be fixed by saving the game and loading the save.

---
## Quests
* Impossible to complete Finding Velehk Sain quest without console commands
* You don't get any reward for returning the Ring of Pure Mixtures to Dawnstar' Pestle and Mortar
* Pieces of the Past quest is broken
* halldir's "summons" in halldir's cairn are located in the walls, and simply "move" when they're summoned
* When doing the first real Dark Brotherhood Mission. You get an optional Objective of killing someone in Windhelm.
* Trying to become thane of riften so that I can get the house for cheaper. Did the the entire skooma quest and I didn’t asked by her at all to help the people of riften.
* Captain Valnir does not accept a Missive quest item, the only conversation options available with him are about his quest to go meddle with a dragon priest.
* When fighting Mikael to leave carmilla alone the quest does not move to the next step, it instead acts like nothing happened. I fought him over and over hoping it would complete that step and it never did.
* Issue with Paarthurnax quest line (When talking to Paarthurnax during the "Paarthurnax" quest line, both "The Blades say you deserve to die" and "You speak wisely, yet how can I be sure you won't return to your old ways?" dialogue trees lead to Paarthurnax stating that Alduin has been defeated.)
* Stuck NPC Fort Greenwall - Stormcloak NPC gets stuck in a door if he can't be killed then the fort won't be cleared, preventing the quest from advancing.
* The carriage during Compelling Tribute quest vanishes upon immediate completion
* Failing to Garrison outside of Fort Sungard causes Unfinishable Questline
* Talking to Ulfric Incorrect Travel Marker to Fort Kastav

1. No boss to kill for trouble in skyrim at Druadach Redoubt or Blind Cliff Cave
* Sometimes quests can spawn for locations you have already cleared, or require another quest to be done first. Use console command to skip to the next stage

{: .console}
>
> setstage cr05 20

1. Upon entering Frostflow Lighthouse and finding the dead bodies, the related quest does not register.
* Intentional - This is now a hidden quest. Manually looting the giant Chaurus provides you with Habd's remains which you can burn at the top of the lighthouse to complete the quest.

1. Rebuilding the Blades cannot be completed.
* Workaround: Use console to complete this quest. 

{: .console}
>
> setstage FreeformSkyhavenTempleA 40  

1. Refusing Harkon's offer means a new order doesnt start 
* Workaround  Force the quest to start using console commands.

{: .console}
> setstage DLC1HunterBaseIntro 20 
>
> setobjectivedisplayed DLC1HunterBaseIntro 20 1

1. Silus would not leave his house for me to go to Mehrunes' shrine for his quest 
* Workaround: Using Console commands to move him allows the quest to proceed.

{: .console}
>
>Prid 240CE 
>
>moveto player

1. "Accept Jarl Balgruuf the Greater's surrender" objective during Battle for Whiterun (Stormcloaks) is stuck.
* Striking the Jarl and then paying off the bounty may fix this.

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

### NPC's

* Several NPC's are sleeping in unrealistic places. (e.g. Orphans are found sleeping on the ground, in Windhelm in the middle of a snowstorm not near a fire)
* Some vendors don't show a inventory/show limited inventory when you open them for the first time.
* Some NPC's like idling inside of bushes or sitting on invisible chairs.
* Milking a cow doesn't require a empty bottle and should.
* There is a stubborn pig in windhelm which likes being in the way
* Dawnstar carriage driver apparently thinks that standing inside his carriage, instead of sitting on the seat is a great place to stand (his horse is disconnected too)  
* College NPCs cannot clear steps leaving Winterhold in order to walk to Saarthal
* Ancient Mudcrab [NPC_:8B056F89] from depths of skyrim missing Requiem's natural mudcrab armor
* Borkul the Beast [NPC_:0001338A] If he dies during escape from cidhna mine - his body lies dead forever (missing cleanup script)
* Bull & betty netch's have calf armor & calf netch  [NPC_:0402857F] has the adult.
* Gerda has oldwoman voice
* Guards should carry Torches at Night
* Knjakr the Cannibal spawned in The Bee and Barb
* Merchant Trader Orc of Dawnstar (Oorlung?). His first line of voice when entering his shop is always silent. 
* Uthgerd (follower) will be stuck sitting down and float off into space if I enter a building while she is on a horse.
* Wylandriah doesn't train Enchanting until after her quest
* Dawnstar Carriage driver clips though his coach
* Janus Mentedius in Farmer's Bounty Mercantile in Rorikstead is missing a voiced greeting.
* Tekla in Falkreath has old voice, young face
* During the Siege of Whiterun, mod added vendors can be traded with
* Male prostitute near ratway entrance need... clearing up (also Yikes)
* The travel carriage is available during the Siege of Whiterun
* Ulfric grants permission to purchase property, 2x dialogue options
* Work sandbox AI Packages might do with having the "Corpses greet behavior" flag removed, so NPC's don't randomly walk up to corpses anymore
* Wuunferth the Unliving is wearing an Illusion robe (clearly visible with the retexture) but he specialises and provides training in Destruction. Should be wearing a Destruction robe for obvious thematic reasons.
* Ever since Afflicted Refugees entered began spawning, it seems like they are spawning a lot. Granted, I've been traveling the roads a lot due to Thieves' Guild side quests, but they still feel over-represented in encounters.
* Melaran, Sybille Stentor replacement, can be invested in multiple times, but with no effect
* NPCs bunch around to loot dropped items / Dead bodies
* Random scavenger encounter where a guy is standing over some dead people. Scavenger is apparently flagged essential. Tried console /kill and he just took a knee and got back up.
* Stuck NPCs - Adrianne (ref ID: 0001A67C) is stuck on a ledge in Whiterun Market. Belethor is stuck at forge.

---

### Idle markers

* Brand-Shei is supposed to be seated on a crate, however he is sitting on nothing.
* College NPC Idle marker in the Arcarnem - Leaning on invisible table
* Marise Aravel, the produce merchant in Riften, has an idle marker inside of a barrel
* NPC idle marker inside planter in front of the Winking Skeever
* Silda the Unseen is standing too far away to warm her hands from the Place of kings brazier
* Embry started leaning his back towards the street while standing in the air.
* Stuck NPC Dervernin appears to be either stuck or admiring the wall. Tunnel to castle dowr next to vittoria vici's house
* NPC hammers window at Arcadia's in Whiterun; should hammer the wall maybe
* Hulda at Bannered Mare has a quill, a ledger and a mug in her hands
* Malur Seloth Floating through floor
* Markarth NPC leaning inside of a support beam

---
   
### Objects / Buildings

* Several wells are missing bucket activators
* Imperial Alehouse in Solitude is locked
* Training Dummies outside Whiterun (on the battlements) cannot be interacted with
* Iron Woodcutting axe is invisible for male characters

---

### Houses

* Two things with fully furnished Honeyside (without the kid's room) - missing wall texture, porch door says Examine Lock Rented House
* Breezehome doesnt have a alchemy lab after purchasing it well it does - but its hidden behind a wall
* Proudspire manor - Bar area. Odd Mead crate texture.
* HJerim issues - After purchase (floating objects in kids bedroom, various clipping issues)
* Building jetty took zero time
* The Skyrim side door into Honeyside behaves weirdly depending on where on it you point your cursor. 

---

### Sounds

* Insect noise is overly loud.
* Some interiors have ghost children playing sound effect.
* When NPC drinks potion, sound is too loud and sounds like player is drinking the potion
* If you go to a place like Bleak Falls Barrow, you can hear the wind blowing on those high hills,. But if you leave the place and go to anywhere else the windy sound doesn't stop until you enter a new cell
* combat music plays on infinite loop sometimes despite no enemies, despite changing area (like going into an inn),   or quicksave/loading. the only workaround is to close the game and boot it  back up
* Audio Bug — Lowering the slider under Settings>Audio>Horse Steps does nothing.
* Candlehearth Hall, snowstorm  outside and inside had a very loud wind whistling sound effect.
* Dawnstar's White Hall (and interiors in general) are too reverby

---

## Crafting

* No breakdown recipe for flagon
* Dunmeri Brown Hood - Cannot be dismantled.
* DLC01TortureTool01 "Crushing Device" [MISC:02008E4E] has no breakdown recipe
* 99% of Circlets / Rings / Necklaces Missing breakdown recipes.
* Recipe for potion of cleansing bugged
* I have noticed that when paying a blacksmith to temper a weapon you get smithing experience (I just got a level up due to it)
* Tempering/Enchanting are way too cheap - I had Eurland temper my warhammer to legendary which only cost 1200 gold. The warhammer was doing 600+ damage after tempering

---

## Exploits

*  I probably should mention that if a container isn't marked as stealing is not red then you can take anything inside thats marked as stolen right in front of the owner without theft
*  Put armor on mannequins  in Breezehome. Logged off for the night. Re logged in and went inside the items the mannequins  were wearing was then sent directly to my inventory.
*  Npcs can get stuck in the snow outside of mehrunes dagons shrine, this causes them to sink slightly into the ground and are unable to move.
*  Wuunferth the Unliving grants 3 levels to Destruction
*  Lightning speed has infinite duration. Unlike the double cast bug in UltSky pressing T to wait ends the spell. However this always happens, doublecast by default.
*  Trolls - When hit by almost mortal wound, leaving them >5% HP, they fall on knees and stay that way, even when regenerate all health. Making them perfect punchbag.
*  Hunterborn isn't properly passing the amount of time that it supposed to 

---

## Followers

* Delphine cannot accept followers to join the blades * Current work around is to console skip the quest 

{: .console}
>
> setstage FreeformSkyhavenTempleA 40  

* Taught follower the spell Sunfire through the dialog. They use it in combat even on enemies which aren't undead and they seem to prioritize using only that. 
* I gave my follower Marcurio 2 scrolls of Summon Fire Atronach and 2 Scrolls of Summon Wolf Familiar (Ghost wolf w/e its called) and he is able to summon either (one at a time) infinitely during battle. In other words, he never consumes the scrolls.
* Janessa has Good lock-picking perks * but * Cant get her to unlock anything?
* Follower perks * Missing and/or Inconsistencies (Some followers have no perks)
* Followers teleport forward too close

---

## ENB

* Spider webs, beehives, and dragonfly wings are generally too bright and white, despite being edited by Spider Webs and Particles for ENB
* Strange water reflections
* Spriggans (purple) cause night-vision spells to occasionally flash blue
* Map went technicolor Workaround: Restart Skyrim
* Medium Graphic, Low shaders.  During Rain, there is no rain when i looking north. By looking West and East I can see wall of rain behind me.  Rain is visible only at one side
* Interiors have Broken Green Lighting Workaround: Restart Skyrim

---

## Civil war

* Its full of vanilla bugs.
* It exists (Why Bethesda did you include this mess in the release). 
* We (Wildlander) do not edit any quest associated with civil war therefore any bugs you encounter are original issues.
* Several immersion breaking issues during battle for Whiterun (Vendors in market are trying to make a living, The carriage driver be vibing as explosions happen all around him)
* Lights within Korvanjund Hall beyond the sealed door are lit (should be dark)

If you are having a issue for a civil war quest - please check <a href="https://en.uesp.net/wiki/Main_Page" target="_blank" rel="noopener noreferrer">UESP WIki <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a> - there maybe a work around here.



### Full List of issues

<a class="btn btn-pink" href="https://wiki.wildlandermod.com/01Support/FullKnownissues/index.html">All Known issues</a>