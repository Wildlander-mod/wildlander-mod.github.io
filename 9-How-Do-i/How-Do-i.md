---
layout: default
title: How Do i?
nav_order: 9
has_toc: false
has_children: false
---

## How Do I tweak the difficulty??

If you find combat is still not to your liking on Easy mode, you can adjust the amount of damage you take in the Requiem MCM.

If the survival elements are getting to you, Sunhelm and/or Frostfall can be adjusted (or turned off) in their respective MCMs. 

If you are finding the survival aspect too easy - you can increase the difficulty by increasing your exposure within frostfall 

---

## How Do I Change The ENB Settings?

You can edit the various Settings inside of the Shift+Enter menu in game

---

## How Do I Add Mods?

At present this is unsupported and unrecommended. 

Some facts before you start complaining:
- Staff are modders too, we enjoy tweaking things, a lot of the UltSky customization was done by Support staff (BMX, Anna, Lizzy and Resident Thievul). It's a given we'd have to spend some focus and time in customization channel(s) making sure the correct information is being shared.
- In terms of supporting the list itself, it's basically impossible to support every iteration of additions/subtractions in people's customizations - as such, support is 100% focused on unedited lists so we can identify genuine errors and not user generated ones.
- *There's not a forever ban on customizing the list* We just ask for some time in getting the list itself in a better state, and for the initial support burden to lessen. No official customization of anything for now allows more focus on that.


## is there any way to change the font in letters/journals/books?

Thats being fixed in the bugfix patch coming soon but - it cant be edited in the current build without installing a additional mod to do so - and that will remove your right to support

--- 

## Break Down Armor

Use the Breakdown keybind "?"

---

## Turn on Autosaves

The problem in a heavily modded set up is that it has a ton of script heavy mods. Sometimes a script will get paused for saving, and that script won't be able to recover properly from it's paused state. This leads to a corrupted save. Another possibility is that your computer is already under so much strain from the scripts that the save function can actually cause a ctd when trying to save, usually during some script-intensive moment.

The point being that not using autosave can help with avoiding ctds (if you've been experiencing them on loading Screens) and hence corrupted save files when you try to load one after a CTD. In addition Auto-saves increase cell loading times by 500%, so its preferable to manually save once inside of a cell, rather than have it integrated into the loading screen.

Autosaves are not bad intrinsically (in and of themselves), it's that there are an insufficient number of them if something goes wrong, leading to the possibility of many lost hours of gameplay progress. You would be forced to use a previous 'hard save.'.

TL;DR Autosaves are ok, but timing is what determines if they're safe or more likely to corrupt. Having multiple saves to use limits the amount of play lost to script-death.

Should you want to turn them on against advice - they can be re-enabled in the ingame settings menu.

--- 

## Enable Fast travel

1) edit game-files\mods\Disable Fast Travel SKSE - No Janky Map UI\SKSE\Plugins\DisableFastTravel.ini and change bFastTravelDisabled to 0.
2) In game - make fure fast travel is enabled in Requiem, sunhelm, and frostfall MCM's

---

## Edit the UI

The UI elements are controlled by a bunch of INI files

for the main UI elements and positions
* game-files\mods\Wildlander\interface\skyhud\Skyhud.txt

for the contextual crosshair 
* game-files\mods\Wildlander\SKSE\Plugins\ContextualCrosshair.ini

to edit the Item card on 16:10 moniters so it doesnt "clip" (set bEnableItemCardResize=0 )
* game-files\mods\moreHUD Inventory Edition\SKSE\Plugins\AHZmoreHUDInventory.ini
---

