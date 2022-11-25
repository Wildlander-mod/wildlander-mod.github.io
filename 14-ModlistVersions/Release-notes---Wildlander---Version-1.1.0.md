### Bug
<details>
  <summary>Click to expand!</summary>

[WL-1288](https://ultimateskyrim.atlassian.net/browse/WL-1288 )	Northwatch keep habour - Overgown	

**Solution**:	Disabled tree

[WL-1286](https://ultimateskyrim.atlassian.net/browse/WL-1286 )	Dwarven breakdown recipes giving more weight of fragments than original item	

**Solution**:	Added breakdowns for Dwarven Cutlery and corrected existing recipes so that fragments are based on 5 fragments per kilo.

[WL-1285](https://ultimateskyrim.atlassian.net/browse/WL-1285 )	Immersive Patrols NPC's might not be using proper head parts for High Poly Head	

**Solution**:	Swapped regular head parts for high poly head versions.

[WL-1284](https://ultimateskyrim.atlassian.net/browse/WL-1284 )	Wolf conjuration summon flees when injured	

**Solution**:	Tagged all summons with KYWD_NoFearYield

[WL-1283](https://ultimateskyrim.atlassian.net/browse/WL-1283 )	Drink/Refill hotkey does not work	

**Solution**:	Added a bit of code to SunHelm's startup to force initialize some missing settings. The hotkey now works as designed

[WL-1282](https://ultimateskyrim.atlassian.net/browse/WL-1282 )	Immersive Speechcraft guard dialogue is broken, only displays "Nevermind"	

**Solution**:	Fixed conditions in combat speech subtopics, works properly now

[WL-1280](https://ultimateskyrim.atlassian.net/browse/WL-1280 )	Spell selection is erroneously displaying when users create a custom class	

**Solution**:	Edited the manual skill selection script to bypass the spell selection state entirely, and jump straight to the final state

[WL-1277](https://ultimateskyrim.atlassian.net/browse/WL-1277 )	Animal death item lists are still accessible when animals turn to dust post-Raise Dead	

**Solution**:	Removed all items from all DeathItem animal and monster leveled lists referenced by Hunterborn.

[WL-1274](https://ultimateskyrim.atlassian.net/browse/WL-1274 )	Double hotkey - FLP and Predator vision	

**Solution**:	Moved Nightvision and Heat (Predator) vision to [ and ] respectively

[WL-1271](https://ultimateskyrim.atlassian.net/browse/WL-1271 )	Corproial Dragons doesnt appear to be working correctly	

**Solution**:	Hunterborn had a built-in method of preventing the mod from starting during startup, as well as some other tricky checks. I re-edited the MCM and MAIN scripts to properly initialize, load, and implement the settings, and everything now appears to be working properly.

[WL-1268](https://ultimateskyrim.atlassian.net/browse/WL-1268 )	Nightgale inn is really dark! 	

**Solution**:	Added a candle to the bar to make things a bit less dark at night.

[WL-1267](https://ultimateskyrim.atlassian.net/browse/WL-1267 )	Mjoll the lioness - Not my follower - but i can ask her to carry gear	

**Solution**:	Fixed improper condition ordering on a Mjoll-specific trade dialogue (60020)

[WL-1266](https://ultimateskyrim.atlassian.net/browse/WL-1266 )	"Combination" horse armor recipes result in an overabundance of crafting XP	

**Solution**:	Tagged all the "adorned" horse armors with No Crafting Experience

[WL-1265](https://ultimateskyrim.atlassian.net/browse/WL-1265 )	Various recipes adding hoods to helmets result in too much crafting XP, and many of the helmeted hoods are missing breakdown/separation recipes	

**Solution**:	Tagged all the "hooded helmet" items with No Crafting Experience, and added breakdown recipes for any hooded helmets still missing them.

[WL-1264](https://ultimateskyrim.atlassian.net/browse/WL-1264 )	Steel Furred Cuirass and Steel Furred Plate Cuirass utilize Craftsmanship instead of Advanced Blacksmithing	

**Solution**:	Edited Steel Furred Cuirass and Steel Furred Plate Cuirass to utilize Advanced Blacksmithing, and edited their recipes for parity with other similar items

[WL-1263](https://ultimateskyrim.atlassian.net/browse/WL-1263 )	Many Ancient Nordic Hero items can be crafted with the basic crafting perk, instead of Advanced Blacksmithing as intended	

**Solution**:	Edited all Ancient Nordic Hero recipes to utilize Advanced Blacksmithing instead of Craftsmanship.

[WL-1262](https://ultimateskyrim.atlassian.net/browse/WL-1262 )	Missing breakdown recipes for divine replica amulets	

**Solution**:	Added missing breakdown recipes for the nine divine replica amulets

[WL-1261](https://ultimateskyrim.atlassian.net/browse/WL-1261 )	Recipes for fully assembled jewelry (for example, Gold Amber Circlet) are providing tons of experience because of their value	

**Solution**:	Tagged the fully assembled items with NoCraftingExperience. Crafting experience will instead come from creating the base materials (gems and base items). Ideally you'd have experience from setting the gems as well, but this is a limitation of basing XP gain on value.

[WL-1260](https://ultimateskyrim.atlassian.net/browse/WL-1260 )	Amulet Replicas erroneously do not require Advanced Blacksmithing	

**Solution**:	Added Advanced Blacksmithing perk requirement to all divine amulet replicas (excluding Zenithar's, which only requires steel)

[WL-1259](https://ultimateskyrim.atlassian.net/browse/WL-1259 )	Ultrawide resolution support for 21:9 and 32:9 monitors	

**Solution**:	Added full support for 21:9 and 32:9 monitors. All HUD elements have been adjusted and rescaled, scripts updated, and launcher updated. Thanks to user LeapDay for their help, plus the Wildlander team.

[WL-1257](https://ultimateskyrim.atlassian.net/browse/WL-1257 )	Better landscape conflict resolution	

**Solution**:	I ran through all landscape records edited by all mods and ensured they are properly conflict resolved, and use intended fixes where appropriate.

[WL-1255](https://ultimateskyrim.atlassian.net/browse/WL-1255 )	Edit Immersive Speechcraft options and menu to be more immersive	

**Solution**:	Edited all Immersive Speechcraft options to more closely resemble the modals from The Sims, e.g. they are descriptive actions instead of spoken lines.

[WL-1253](https://ultimateskyrim.atlassian.net/browse/WL-1253 )	Irnskar ironhand having a conversatiuon from inside of a tree.	

**Solution**:	Moved Tree back closer to the wall

[WL-1251](https://ultimateskyrim.atlassian.net/browse/WL-1251) Dawn of skyrim NPC "Nilera" sells a Daedra heart every refresh

**Solution**: Removed Heart from merchant chest.

[WL-1250](https://ultimateskyrim.atlassian.net/browse/WL-1250) Illusion upkeep spells

**Solution**: Corrected perks which were incorrectly inflating the upkeep costs

[WL-1246](https://ultimateskyrim.atlassian.net/browse/WL-1246) Quest Waking nightmare - when on step release the miasma  - And your pretending yto be casimir - you can see your player's body in front of camera \(video attached\)

**Solution**:

[WL-1244](https://ultimateskyrim.atlassian.net/browse/WL-1244) \[Smithing Exploit\] Mammoth tusk breakdown

**Solution**: Added NoCraftingExperience to all Ingredients crafted by Wildlander, and changed nordic amulet/necklace recipes to use a small animal bone instead of bonemeal

[WL-1242](https://ultimateskyrim.atlassian.net/browse/WL-1242) Brynwolf in Thieves guild gear is "Armless"

**Solution**: Added the entire Thieves Guild faction to the NPC clothing exception list. I also adjusted the navmesh for the Thieves Guild HQ to go around the brazier.

[WL-1236](https://ultimateskyrim.atlassian.net/browse/WL-1236) Mudcrabs/Chaarus have bones - real crabs have a exoskeleton so shouldnt give bones

**Solution**: Removed Bones from the loot lists

[WL-1233](https://ultimateskyrim.atlassian.net/browse/WL-1233 )	Traps at Rundil's alter (winterhold) are more or less completely invisible 	

**Solution**:	This one continues to be a huge pain in the ass, so I just left the rune that kills Rundi, and removed the others.

[WL-1230](https://ultimateskyrim.atlassian.net/browse/WL-1230) Wooden chests and wooden barrels are inequal in weight

**Solution**: Both items now have same weight

[WL-1229](https://ultimateskyrim.atlassian.net/browse/WL-1229) Spider webs are generally too bright and white, despite being edited by Spider Webs and Particles for ENB

**Solution**: Edited their textures to be a little darker, though they are still a bit bright maybe

[WL-1219](https://ultimateskyrim.atlassian.net/browse/WL-1219) MCM Suggestions

**Solution**: Set Requiem and Skald’s Mail so that smithing books are non mandatory, and the courier will still deliver important letters. I also nerfed Hunterborn’s Bounty bonus by 75%

[WL-1216](https://ultimateskyrim.atlassian.net/browse/WL-1216 )	AlchDrink_NirnSpringTea "Nirn Spring Tea" [ALCH:300402E0] - Gives 50% MR, 25 Magic regen and 25 fortify. Can be used while in combat. needs a nerf	

**Solution**:	Reduced effects to 5 fortify / 5 regen / 5 MR

[WL-1215](https://ultimateskyrim.atlassian.net/browse/WL-1215) Beitild "Beitild" \[NPC\_:00013612\] cannot be killed for dark brotherhood quest 

**Solution**: Added No flee keyword to this NPC \(and to ebony warrior\)

[WL-1213](https://ultimateskyrim.atlassian.net/browse/WL-1213) Further crafting fixes

**Solution**: Added Breakdown recipes for Backpacks, Daedric armor, Dawnguard armor and several horse Saddles which were missing one

[WL-1204](https://ultimateskyrim.atlassian.net/browse/WL-1204) Adding a new item to favourites isnt removing from the breakdown menu when using a keyboard \+ controller \(and using the F kley\)

**Solution**: Script for breakdown menu was only refreshing favorites when using the key from controller. This has been corrected,

[WL-1195](https://ultimateskyrim.atlassian.net/browse/WL-1195) Solitude Outlaw Refuge chef was not selling any food items \(despite buying them\)

**Solution**: For whatever reason, having his buy/sell list set to VendorItemsInnkeeper was not populating his inventory \(maybe because he didn’t belong to the innkeeper faction?\) In any case, selecting a different vendor list allowing food seems to have done the job

[WL-1193](https://ultimateskyrim.atlassian.net/browse/WL-1193) Whiterun Guards still say the player has "the jarl's confidence", despite the player being a fresh char

**Solution**: The vanilla guard dialogue responsible was overwritten by Guard Dialogue Overhaul. I reset it to vanilla/USSEP, and adjusted the conditions to check for whiterun thaneship \(Favor253 quest == stage 20\)

[WL-1190](https://ultimateskyrim.atlassian.net/browse/WL-1190 )	typo on perk REQ_Alchemy_AlchemicalLore2 "Alchemical Lore" [PERK:000C07CA]	

**Solution**:	Corrected Spelling

[WL-1189](https://ultimateskyrim.atlassian.net/browse/WL-1189) Flame Powder unavailable to craft

**Solution**: Removed the reference to the smelter in the perk description.

[WL-1188](https://ultimateskyrim.atlassian.net/browse/WL-1188) Missing Breakdown recipes.

**Solution**: Added breakdown recipes for Cloaks and fur hoods.

[WL-1187](https://ultimateskyrim.atlassian.net/browse/WL-1187) Marksman perks reference Expertise in the description which doesn't actually exist.

**Solution**:  Perk Description corrected

[WL-1184](https://ultimateskyrim.atlassian.net/browse/WL-1184) Crafting a Stack of items grants the same XP as crafting a single item

**Solution**: XP script corrected to multiply the XP by number crafted.

[WL-1183](https://ultimateskyrim.atlassian.net/browse/WL-1183) XPMSSE still generates a bunch of suspended errored stacks

**Solution**: Script fix applied to prevent these errors.

[WL-1181](https://ultimateskyrim.atlassian.net/browse/WL-1181) Male skin textures are too shiny

**Solution**: Made less Shiny

[WL-1180](https://ultimateskyrim.atlassian.net/browse/WL-1180) Summoned Dremora are susceptible to fear fleeing

**Solution**: Added No flee Keyword

[WL-1176](https://ultimateskyrim.atlassian.net/browse/WL-1176) Armor\_LinenMonkBootsBlack\_Breakdown \[COBJ:FE023A6D\] Not working

**Solution**: Corrected erroneous Archmage boots entries in the conditions to be able to break down this item.

[WL-1175](https://ultimateskyrim.atlassian.net/browse/WL-1175) Random CTD in solitude SkyrimSE.exe\+9C2DCF
**Solution**:

[WL-1173](https://ultimateskyrim.atlassian.net/browse/WL-1173) Crafting lockpicks \(need just first Smithing and first Lockpicking perks\) grants a LOT of exp for virtually zero gold investment; iron frags are cheap! Probably needs reworking.

Solution: The bulk Lockpick \(10\) recipe used a token that for some reason was causing double XP gain. Edited the recipe to simply produce 10 standard lockpick misc items.

Also reduced the value of lockpicks to 5 and edited their recipes to require 2 fragments, so they give less overpowered crafting XP

[WL-1170](https://ultimateskyrim.atlassian.net/browse/WL-1170) Add smelter to winterhold - Somewhere in this area

**Solution**: Added smelter next to the crafting area at the rear of Birna’s oddments.

[WL-1169](https://ultimateskyrim.atlassian.net/browse/WL-1169) \[Quest\] Sinding has a speechcraft “hand over your variables” line when you tell him hircine says he needs to die, and he responds so be it”

**Solution:** Exempted WerewolfBeastRace from Immersive Speechcraft mechanics.

[WL-1168](https://ultimateskyrim.atlassian.net/browse/WL-1168) Turning the lantern on, then storing it in a chest doesnt turn it off, nor will it let you turn it off with the L key

**Solution:** Reworked the lantern code. The light will turn off automatically if you remove the lantern, and have no lanterns left in your inventory.

[WL-1167](https://ultimateskyrim.atlassian.net/browse/WL-1167) Followers aren't using player crafted healing potions

**Solution**: Added suggested mod NPC's Use Potions

[WL-1166](https://ultimateskyrim.atlassian.net/browse/WL-1166) Riding in 1st person - Jumped off a cliff, My horse despawned on death.

**Solution**: Removed deleteonunload keyword from horse clone records.

[WL-1164](https://ultimateskyrim.atlassian.net/browse/WL-1164) \[Quest\] Barbas gets stuck on a tree just outside of Falkreath and cant progress the quest

**Solution:** Moved the offending tree off the road onto the nearby grass.

[WL-1163](https://ultimateskyrim.atlassian.net/browse/WL-1163) Toolkits missing breakdown recipes

**Solution:** Added breakdown recipes for all toolkits. Steel for ones requiring steel, coal and kindling for the wooden ones

[WL-1161](https://ultimateskyrim.atlassian.net/browse/WL-1161) Master locked safe in Markarth isn't marked as owned

**Solution:** Assigned ownership to TownMarkarthFaction

[WL-1159](https://ultimateskyrim.atlassian.net/browse/WL-1159) Random fire in the middle of Proudspire manor

**Solution:** Embers XD was overwriting proudspiremanortnf for this reference. Forwarded the latter as intended

[WL-1158](https://ultimateskyrim.atlassian.net/browse/WL-1158)  bulk recipes for fragments to ingots

Solution: Added bulk recipes for 5 and 10 ingots

[WL-1155](https://ultimateskyrim.atlassian.net/browse/WL-1155 )	Laundry clipping with tree - Darkwater crossing	

**Solution**:	Deleted tree

[WL-1153](https://ultimateskyrim.atlassian.net/browse/WL-1153) Breakdown menu has two recipes to craft “disabled” weapons

Solution: Removed Recipes

[WL-1149](https://ultimateskyrim.atlassian.net/browse/WL-1149) Thieves guild - Training chests contain loot

**Solution:** Created non-loot, non-respawning versions of the chests and also included the linked script fix mod so that chest relock seconds after being opened. 

[WL-1148](https://ultimateskyrim.atlassian.net/browse/WL-1148 )	Floating tree in solitude (next to imperial Alehouse)	

**Solution**:	Moved Tree

[WL-1146](https://ultimateskyrim.atlassian.net/browse/WL-1146) Cutpurse perk effects does not match description  REQ\_Pickpocket\_Cutpurse "Cutpurse" \[PERK:00058202\]

**Solution:** Changed text to indicate 100%

[WL-1145](https://ultimateskyrim.atlassian.net/browse/WL-1145) All of the horses at the Dawnstar/Morthal/Dragonbridge Stables are free

**Solution:** Changed ownership of horses to town factions.

[WL-1144](https://ultimateskyrim.atlassian.net/browse/WL-1144 )	Happy little Floating tree next to windpeak Inn	

**Solution**:	Moved trees so they are in the floor

[WL-1142](https://ultimateskyrim.atlassian.net/browse/WL-1142) \[Icle marker\] NPC hammering on fresh air!

**Solution:** Moved Idle marker to correct location

[WL-1141](https://ultimateskyrim.atlassian.net/browse/WL-1141) Leather strips & dark leather - Recipes only available via player crafting - not on  work stations

**Solution:** Added Recipes to the Tanning rack object.

[WL-1140](https://ultimateskyrim.atlassian.net/browse/WL-1140 )	Floating lantern outside of Olava the feebles house in whiterun	

**Solution**:	Disabled Lantern

[WL-1136](https://ultimateskyrim.atlassian.net/browse/WL-1136) roast meat keybind when standing next to a campfire is empty, but player crafting has meat recipes.

**Solution:** Disabled Roast meat keybind - Functionality has been folded into player crafting.

[WL-1134](https://ultimateskyrim.atlassian.net/browse/WL-1134) Track abilility in game is disabled, so why does Bone Amulet of the Full Moon crafting recipe still exist

**Solution:**  Bone Amulet of the Full Moon crafting recipe disabled

[WL-1132](https://ultimateskyrim.atlassian.net/browse/WL-1132) Borgakh the Steel Heart - Cannot recruit even with 100 speech as a none orc.

**Solution:**  Corrected her recruitment checks.

[WL-1131](https://ultimateskyrim.atlassian.net/browse/WL-1131) Enchant Lvl 100 does work, but only at 55% instead of 75% magnitude

**Solution:**  Increased effect to 75% magnitude as described in the perk

[WL-1130](https://ultimateskyrim.atlassian.net/browse/WL-1130) Player crafting bug - When near a heatsource, can only use chef toolkit. Survival is greyed out.

**Solution:**  Enchanting via honed metal wasn't correctly resetting the flag, So player crafting believed the player was talking to a blacksmith

[WL-1127](https://ultimateskyrim.atlassian.net/browse/WL-1127 )	[Clip] Solitude -Tree growing our of left side of archway (both front and back - two trees)	

**Solution**:	Disabled Trees

[WL-1125](https://ultimateskyrim.atlassian.net/browse/WL-1125 )	Blue palace - Floating Candle in courtyard 	

**Solution**:	Removed Candle

[WL-1112](https://ultimateskyrim.atlassian.net/browse/WL-1112) using alt\+tab causes weird 3rd person behaviour

**Solution:**  Moved Duel Wield Parry from Alt to Control. 

[WL-1111](https://ultimateskyrim.atlassian.net/browse/WL-1111) Going into console shows a unknown variable error

**Solution:**  Removed variable from setup script.

[WL-1110](https://ultimateskyrim.atlassian.net/browse/WL-1110) NPC Overhauls. \(Madesi, Keevara, Cicero, Veezara, Nenya\)

**Solution:** Adjusted all mentioned NPC’s to be better fitting.  

[WL-1108](https://ultimateskyrim.atlassian.net/browse/WL-1108) CTD - running from riverwood to whiterun - foggy weather - SkyrimSE.exe\+C2A5F3

**Solution:** Still not entirely sure about the cause of this one, so I’m trying a nuclear solution where I revert the weather record entirely back to Update.esm \(versus the CW edits\).

[WL-1107](https://ultimateskyrim.atlassian.net/browse/WL-1107) Tools - vendor purchase

**Solution:**

* Added Alchemist’s Toolkit to VendorGoldApothecary list
* Added Chef’s Tools to VendorGoldInn
* Added 5 counts of the 75% chance toolkit list to VendorGoldMisc

[WL-1106](https://ultimateskyrim.atlassian.net/browse/WL-1106) Dual wield weapons - off hand invisible

**Solution:** Added Simple Dual Sheath.

[WL-1105](https://ultimateskyrim.atlassian.net/browse/WL-1105) Bashing with torches gives destruction exp

**Solution:** This is no longer an issue, now that you cannot attack dummies directly to gain experience.

[WL-1104](https://ultimateskyrim.atlassian.net/browse/WL-1104) Missing recipe - Lantern oil A1247D91

**Solution:** Added Crafting recipes for this item

[WL-1103](https://ultimateskyrim.atlassian.net/browse/WL-1103) Starting as a nightblade - no tooltip for other toolkits shown in forge

**Solution:** Added missing forge recipes for toolkits. They will now be craftable at the forge as well.

[WL-1102](https://ultimateskyrim.atlassian.net/browse/WL-1102) Started as a Nightblade - Gave me 9 perks to spend!

**Solution:** 

[WL-1101](https://ultimateskyrim.atlassian.net/browse/WL-1101) Using f10 to start as a vampire in Karthwasden trigger a crash on spawn SkyrimSE.exe\+7BEC84

**Solution:** Moved Spawn point away from the scripted event which was triggering the crash.

[WL-1100](https://ultimateskyrim.atlassian.net/browse/WL-1100) Nemesis Unlimited Behavior Engine - crashes on engine update

**Solution:**  This could be related to antivirus / windows defender, as I have to disable my windows defender every time I want to run any of the patchers. We should include a note about this in any customization resources

[WL-1099](https://ultimateskyrim.atlassian.net/browse/WL-1099) FAL Skin Shaved Version for Female SE - does weirdness with the left ear

**Solution:** Hid the FAL normal map for female head, and allowed Cyb’s to take precedence. This appears to have worked with no issue - somewhat surprising, since the normals were technically generated from different textures and maybe even different meshes.

[WL-1098](https://ultimateskyrim.atlassian.net/browse/WL-1098) Firepit in moorside Inn not recognized for food cooking as "nearby flame"

**Solution:** Added Embers XD proprietary static records to the campfire fire detection formID list

[WL-1097](https://ultimateskyrim.atlassian.net/browse/WL-1097) Healing Poultice Recipe incorrect \(item 8141d2CD\)

**Solution:** Swapped in custom written copy with accurate instructions, materials, and requirements

[WL-1094](https://ultimateskyrim.atlassian.net/browse/WL-1094) Hunters still have various callouts when attacking animals

**Solution:** I covered many of the uncovered attack dialogues \(listed in dialogue topic `00013ee3`\) with a condition to not attack if the actor has the animal keyword.

[WL-1092](https://ultimateskyrim.atlassian.net/browse/WL-1092) J's bugfixes

**Solution:** Various script fixes to prevent papyrus errors.

[WL-1091](https://ultimateskyrim.atlassian.net/browse/WL-1091) Steel buckle - crafting recipe exists, but nothing can be made with them!

**Solution:** Disabled recipe

[WL-1085](https://ultimateskyrim.atlassian.net/browse/WL-1085) Dawn of Skyrim skooma merchants do not actually sell skooma / don't have a faction & chest associated \(with the likely exception of "Ferrum" in Riften

**Solution:** These vendors were drawing from the VendorListApothecary, but that vendor list no longer accepts skooma/drugs because of Requiem’s addition of the BlackMarket keyword.

I created a separate vendor list for Skooma dealers \(VendorItemsSkoomaDealer\) that includes the black market keyword, and assigned this new vendor list to the InconNPC’s dealers.

[WL-1078](https://ultimateskyrim.atlassian.net/browse/WL-1078) Looking at some fires drop the fps hard. \(about -120 FPS for me\)

**Solution:**  Adjusted ENB Settings.

[WL-1076](https://ultimateskyrim.atlassian.net/browse/WL-1076) Armor material keywords need reverting to vanilla for Item Degradation's ini to process correctly.

**Solution:** Reverted all vanilla armor material keywords to their og EDID’s \(all DLC’s \+ update as well\)

[WL-1074](https://ultimateskyrim.atlassian.net/browse/WL-1074) ENB wetness and night eye

**Solution for wetness:** Disabled cubemap, adjusted fresnel fences as instructed. Nighteye corrected via installing the correct files.

[WL-1072](https://ultimateskyrim.atlassian.net/browse/WL-1072) Dawnguard questline does not continue after refusing Harkon and returning to fort dawnguard

**Unable to Correct.** According to the info at [this UESP link, ](https://en.uesp.net/wiki/Skyrim:Bloodline)the conclusion of the Bloodline quest sometimes bugs and does not properly start A New Order. This issue did not occur for me.

If it does occur, it seems simple enough to advance the quest stages mentioned in the description.

[WL-1069](https://ultimateskyrim.atlassian.net/browse/WL-1069) Dwarven Masterful Light Crossbow's cannot be tempered - even with all perks "you dont know how to improve this yet" Despite it appearing on the grindstone

**Solution:** Removed the keyword preventing the temper of enchanted light crossbows.

[WL-1051](https://ultimateskyrim.atlassian.net/browse/WL-1051) Blacksmiths will not improve Nordic Armor

**Solution:** Distributed Nordic Smithing perk to a bunch of blacksmiths throughout the world. Mostly nords, and blacksmiths whose skill would qualify them.

[WL-1036](https://ultimateskyrim.atlassian.net/browse/WL-1036) Malyn Varyn \(Azura's Star warlock\) is too far away upon entering the cell, creating a scenario where the player becomes dialogue locked while enemies are attacking

**Solution:** Moved his reference marker even closer to the player spawn marker. This is a weird one - we patched it in response to Just Wildy not encountering Malyn until much further into the cell, but there’s no explanation as to why Malyn was not on his original marker, as its location is not edited.

In any case, moved it closer to be surer the situation will not happen.

[WL-1034](https://ultimateskyrim.atlassian.net/browse/WL-1034) Frostfall messages are annoying, there's too many

**Solution:** Nullified a lot of Frostfall’s generic status updates. Will see if more crop up during gameplay that require fixing

[WL-1032](https://ultimateskyrim.atlassian.net/browse/WL-1032) Immersive Speech/Dialogue affects children

**Interim solution:** Added `ischild == 0` conditions on Immersive Speechcraft dialogue topics and quest. In the future, would be cool if this were doable via vaSynth or whatevs.

[WL-1030](https://ultimateskyrim.atlassian.net/browse/WL-1030) Innkeepers keep repeating their "greeting" dialogue; doubly annoying when re-entering the cell from a bath, or card game

**Solution:** Created custom script `WL_TavernGreetingsPreventer` that updates a global for each of the 10 tavern greetings. I also added a global condition to the dialogues. This prevents the dialogues from playing more than once per character.

[WL-1027](https://ultimateskyrim.atlassian.net/browse/WL-1027 )	Aetherial Helmet night vision bug	

**Solution**:	Caused by the Nightvision - no shaders bug. Launcher update for 1.1 will fix this

[WL-1023](https://ultimateskyrim.atlassian.net/browse/WL-1023) Bow-bashing dummies gains Marksman experience

**Solution:** This is no longer an issue, now that you cannot attack dummies directly to gain experience.

[WL-1022](https://ultimateskyrim.atlassian.net/browse/WL-1022) The level 100 enchanting perk text is confusing users

**Solution:** Changed text to highlight that the player receives a USABLE POWER

[WL-1019](https://ultimateskyrim.atlassian.net/browse/WL-1019) Medium/Low/Potato ini's need tweaking for shadows, rain occlusion

**Solution:** changed Precipitation Occlusion setting to 1 in all SkyrimPrefs ini’s.

[WL-1014](https://ultimateskyrim.atlassian.net/browse/WL-1014) The Two Handed Master perk: Mighty Strike says in it's description it provides Expertise \(instead of AP\) ans not only that, but it doesn't provide any Armor Penetration at all ,tested several times

**Solution:** Changed the copy to read \[Damage x1.25\]

[WL-1012](https://ultimateskyrim.atlassian.net/browse/WL-1012) \[Crafting\] Fragments cannot be turned into Ingots using honed metal

**Solution:** I believe this was related to the globals problem in the honed metal script \(can’t find the linked issue, but Lizzy found it when enchanting or selecting a different service besides straight crafting\). I was not able to reproduce this issue after the fix, so hopefully that is the case.

[WL-1008](https://ultimateskyrim.atlassian.net/browse/WL-1008) \[PWP\] Unable to purchase Hjerim

**Solution:** Dialog conditions for No Favor relationship rank were >=2 instead of <2.

[WL-1007](https://ultimateskyrim.atlassian.net/browse/WL-1007) \[PWP\] Incorrect Honeyside Cost

**Solution:** Honeyside \(Riften\) No Favor cost is 18750. This is the Breezehome \(Whiterun\) Favor cost. Likely the dialogue condition is checking against the wrong global.

[WL-1004](https://ultimateskyrim.atlassian.net/browse/WL-1004 )	Werewolves are not Hunterborn-harvestable	

**Solution**:	Hunterborn was using the Dawnguard Loot leveled list for werewolves, instead of the requiem linked to the actual NPC's

[WL-997](https://ultimateskyrim.atlassian.net/browse/WL-997) Absorb Essence and possibly other spells don't have archetypes for spell research

**Solution:** Added appropriate archtypes for new requiem spells.

[WL-992](https://ultimateskyrim.atlassian.net/browse/WL-992) Left Casting/ Weapon swingind NOT working while standing

**Solution:** Installed Dual Wield Block, should be fixed

[WL-990](https://ultimateskyrim.atlassian.net/browse/WL-990) Sybille Stentor keeps walking outside and dying to sunlight

**Solution:** Increased Ms. Stentors base health so that the sun does not kill her outright.

[WL-989](https://ultimateskyrim.atlassian.net/browse/WL-989) I activated a training dummy and selected to train 2-handed skill for 4 hours. The skill gain was about 1/30 of a skill level. My 2 handed skill level is 27.

**Solution:** Installed Train and Study Requiem Patch

[WL-984](https://ultimateskyrim.atlassian.net/browse/WL-984) Starting a new game, when finish mapping the keys and show a modal saying its all ready and crash in the character creation menu fiss.dll\+4481

**Potential solution:** Added some `Utility.Wait()`'s to the FISS loading operations in the Wildlander startup script. There are still FISS operations in Hunterborn and MoreHUD that this would not account for, but this padding will hopefully be enough to prevent the issue.

[WL-982](https://ultimateskyrim.atlassian.net/browse/WL-982) Hunterborn not giving some materials

**Solution:** Issue here is that Venomous Spittle comes from Requiem, versus Hunterborn’s venom\(s\). I replaced the instances of Venomous Spittle within the blood vial recipe, and also replaced any other instances of Venomous Spittle with appropriate venom\(s\).

[WL-977](https://ultimateskyrim.atlassian.net/browse/WL-977) Remove non-smithing/metal recipes from Forge to assuage user confusion, add NoCraftingExperience keywords to all pertinent items

**Solution:** Any None-metal item no longer requires a forge to craft. but does not give smithing XP as a result

[WL-974](https://ultimateskyrim.atlassian.net/browse/WL-974) Erik the Slayer looks too old.

**Solution:** Model has been adjusted to suit his age.

[WL-973](https://ultimateskyrim.atlassian.net/browse/WL-973) No Light version of the Stormcloak Cuirass appears to exist in game.

**Solution:** Made the featured armor record back into Light.

[WL-972](https://ultimateskyrim.atlassian.net/browse/WL-972) Killed level 37 "Renald Bridgette" and when trying to loot his hooded robes of quickening they do not appear in my inventory

**Solution:** Hooded Robes were apparently using the wrong swap script

[WL-971](https://ultimateskyrim.atlassian.net/browse/WL-971) Thalmors believe Dragon Bridge is the Ultimate Rebel Village or something

**Solution:** Corrected the AI package of the Added Thalmor patrols so they dont think they are common bandits

[WL-968](https://ultimateskyrim.atlassian.net/browse/WL-968) Short male hairstyles clip with neck

**Solution:** Reinstalled HPH and ticked the option to patch the vanilla hairstyles. appears to have fixed the issues

[WL-966](https://ultimateskyrim.atlassian.net/browse/WL-966) The X hud button is cancelled out by too many actions

**Solution:** the improved / more airtight logic of the updated Hide HUD code fixes these issues.

[WL-962](https://ultimateskyrim.atlassian.net/browse/WL-962) I completed part of the civil war Reunification of Skyrim to retake the Pale for the Legion. Afterwards when I visited again the Imperial guards supposed to be there are now walking around wearing no armor and only loincloths.	

"**Background**: My theory on the cause of this issue is that the base record for these Imperial guards (6189040c) is flagged to use the template’s inventory, and the template (LvlGuardImperial 1fc62) has a Requiem script assigned to conditionally add gear, versus a standard method like adding gear to their inventory.

**Solution**: I have removed the “Use Inventory” flag from each of the 3 ETaC Dawnstar Imperial guards, and given them gear from leveled list CWSoldierImperialGear. This will bypass the need to grab gear from that script, and if that was the issue, they should have gear now."

[WL-961](https://ultimateskyrim.atlassian.net/browse/WL-961) Fort Hraggstad's outside trap door of the collapsed tower to the right.

**Solution:** No Snow Under Roofs was reverting Forts' re-instatement of the tower. Fort mod has been given precedence, fixing the issue.

[WL-954](https://ultimateskyrim.atlassian.net/browse/WL-954) In Honed Metal, if your select the option to have NPCs have rare materials, when you try any of the HM menu options, the menu closes, and the PC is frozen in place.

**Unable to Replicate.** This is likely fixed by the newest version of Honed Metal

[WL-953](https://ultimateskyrim.atlassian.net/browse/WL-953) CTD when trying to interact with Adrianne Avenicci Honed Metal dialogue additions.

**Unable to Replicate.** This is likely fixed by the newest version of Honed Metal

[WL-945](https://ultimateskyrim.atlassian.net/browse/WL-945)	[Clipping] Basil's house in Riverwood has multiple trees clipping through it	

**Solution**:	Removed Tree from House

[WL-939](https://ultimateskyrim.atlassian.net/browse/WL-939) After loading my most recent saves I am able to play the game but after engaging in dialogue or about 3 minutes in, SkyrimSE.exe\+10B9F52

**Solution:** RLO Adds new models for the noble on horseback random encounter. One of these nobles is triggering the crash. Reverted to Vanilla.

[WL-937](https://ultimateskyrim.atlassian.net/browse/WL-937) Train Dummies are overpowered.

**Solution:** Removed the ability to gain experience from dummies by straight up hitting them; removed the Train and Study dummies from the list of dummies that grant xp. there is not a way by default to differentiate between skills. It would be possible in the future to un-globalize the experience multiplier per skill, but I don’t think it’s worth the effort right now.

[WL-936](https://ultimateskyrim.atlassian.net/browse/WL-936) Iron Lantern will not equip properly. Prompts character to place a storage chest upon equipping

**Solution** I'm going to add QuickLight ro replace Wearable Lanters. Perhaps in the future we can expand on quicklight to utilize an "oil" resource, the same as Wearable Lanterns.

[WL-933](https://ultimateskyrim.atlassian.net/browse/WL-933) Captain Veleth is being renamed by Real Names \(DLC2 guy fighting ash spawn\)

**Solution:** Added Captain Veleth to Real Names' exceptions formlist

[WL-929](https://ultimateskyrim.atlassian.net/browse/WL-929) Easy smithing Levels exploits

**Solution:** Added the NoCraftingExperience keyword to:

* All kindling
* All tinder
* Wooden Walking Stick
* Medicinal Salve

[WL-928](https://ultimateskyrim.atlassian.net/browse/WL-928) Dovah Sonaak textures being overwritten with Project clarity

**Solution:** Hid pertinent textures from Project Clarity.

[WL-926](https://ultimateskyrim.atlassian.net/browse/WL-926) I just hired Jenassa in Whiterun as a mercenary, was supposed to get charged 300 septims \(she is lvl10\), instead got charged 300 septims and then immediately another 215 septims for no apparent reason.

**Solution:** For some reason, hiring a mercenary sometimes “double charges” the player. I tried adding a check to the FLP hire/tame script to check for pre-existence in the Current Follower Faction, which hopefully will solve the problem.

[WL-924](https://ultimateskyrim.atlassian.net/browse/WL-924) Linen Monk Boots - Black \(swapped\) do not seem to be giving the swapped version

**Solution:** The swap script was using “SeparateHood” instead of “SeparateRobe” which maybe caused the issue????

[WL-921](https://ultimateskyrim.atlassian.net/browse/WL-921) When the Hall of the Vigilant is destroyed, the intact version of the Hall remains when it shouldn't

**Solution:** The issue is that NSUTR’s undestroyed version of the hall was not linked to the reference that enables when the Dawnguard questline starts \(when the hall is supposed to be destroyed\). I linked this version to that reference, and set its enable state to opposite of the parent \(so when the parent marker is enabled, this reference is disabled\).

[WL-920](https://ultimateskyrim.atlassian.net/browse/WL-920) Holding block does not cost any stamina

**Not an issue.** I vastly reduced the amount of stamina drain for blocking because NPC AI can’t account for it, and would turtle until their stamina was shot.

[WL-919](https://ultimateskyrim.atlassian.net/browse/WL-919) moreHUD carry weight does not update properly when bathing; reequipping a backpack, for example, will not update the total carry weight until player enters magic menu or receives an item

**Solution:** I added moreHUD’s refresh function `UI.Invoke("HUD Menu", "_root.AHZWidgetContainer.AHZWidget" + ".RefreshWidgets")` to the end of the animation events for bathing, both with and without soap.

[WL-914](https://ultimateskyrim.atlassian.net/browse/WL-914) Put EbonyMail armor crafting under Ebony crafting perk

**Solution**: Ebony Smithing requirement to Ebony Mail conversion recipes

[WL-913](https://ultimateskyrim.atlassian.net/browse/WL-913) Guards enter dialogue and interrupt when using forge or other objects

**Solution:** I removed the forcegreet package from Suspicious City Guards' stopquest scene. After testing, all of the other functionality remains intact except the annoying force greet

[WL-912](https://ultimateskyrim.atlassian.net/browse/WL-912) Guards comment negatively when training at the range...eg" don't do that", "Stop it" Please fix it for immersion

**Not an Issue:** Rather than removing the guard reactions when you swing your weapon, etc. \(which I do find cool\), I have prevented training dummies from providing experience when attacked directly, so there should not be a need to “fix” this

[WL-910](https://ultimateskyrim.atlassian.net/browse/WL-910) The gold a npc adds to their inventory after you train at them is not accessible for trade with the player

**Solution:** Issue resolved

[WL-909](https://ultimateskyrim.atlassian.net/browse/WL-909) Fort dawnguard dogs can be greeted or intimidated to hand over valuables.

**Solution:** Added conditions to Immersive Speechcraft quests preventing them from activating on the race DLC1ArmoredHuskyCompanionRace.

[WL-907](https://ultimateskyrim.atlassian.net/browse/WL-907) Sybille Stentor only pays close to nothing for any item regardless of value.

**Solution:** Issue resolved

[WL-901](https://ultimateskyrim.atlassian.net/browse/WL-901?atlOrigin=eyJpIjoiYzgwYTQ0ZjEyNzQzNGJhN2JmNjEyZTM0NmRhZWZhNjIiLCJwIjoic2hlZXRzLWppcmEifQ)	[Idle marker] In Riftern, around forge, theres a guy hammering the air	

**Solution**:	Solution: Shifted the idle marker over to the other side of the crane

[WL-898](https://ultimateskyrim.atlassian.net/browse/WL-898) Black Book Sallow Regent area is pitch black

**Solution:** ELE’s edits were causing weirdness with this cell, presumably bc of the unique darkness mechanic. Reverting the lighting templates/etc. fixed the issue and made the cell visible/navigable again.

[WL-896](https://ultimateskyrim.atlassian.net/browse/WL-896) using real names on Inconcequental NPC's Sometimes breaks the Interactions.

**Solution:** I gave all the Incon NPC’s their own names, which should prevent Real Names from running on them in the first place.

[WL-893](https://ultimateskyrim.atlassian.net/browse/WL-893) I purchased all the upgrades to Breezehome. Some containers aren't flagged as safe, mainly the wardrobes, end tables and cupboard on the main floor as well as upper floor. The chest in the master bedroom is also not flagged as safe container.

**Solution:** Many of the containers utilized by the housing mods are vanilla, and many of the vanilla containers are set to respawn by WACCF. I replaced \(hopefully\) all instances of these containers with custom empty/non-respawning versions, across all the player homes.

[WL-887](https://ultimateskyrim.atlassian.net/browse/WL-887) It looks like spending too much time \(15 \+ min\) in Racemenu at character creation starts an infinite load time.

**Unable to Replicate**. I left a character in initial race menu for ~30 minutes, loaded into the game just fine

[WL-886](https://ultimateskyrim.atlassian.net/browse/WL-886) Crafting any type of arrows or bolts gives insane amount of experience.

**Solution:** Added NoCraftingExperience keyword to the Quiver weapon records.

[WL-885](https://ultimateskyrim.atlassian.net/browse/WL-885) Hestla \(Vampire Smith in Castle Volikhar\) does not have Honed Metal options

**Solution:** Added Hestla to JobBlacksmithFaction.

[WL-881](https://ultimateskyrim.atlassian.net/browse/WL-881) You do not receive blessings of Azura, Mephala or Boethia in the Dunmer Temple in Windhelm

**Solution:** These effects were edited by Fozar’s so that you could only receive them if you had completed the corresponding Daedric quest. I added lessened versions of the blessings for players who have not yet completed the quests.

[WL-880](https://ultimateskyrim.atlassian.net/browse/WL-880) Missive to deliver weapon to prisoner in Cidhna Mine

**Solution:** Added all Cidhna Mine Expanded NPC’s to missives blocklist

[WL-879](https://ultimateskyrim.atlassian.net/browse/WL-879?atlOrigin=eyJpIjoiYzgwYTQ0ZjEyNzQzNGJhN2JmNjEyZTM0NmRhZWZhNjIiLCJwIjoic2hlZXRzLWppcmEifQ)	Cannot remove facepaint from Bosmer Male preset 1	

**Solution**:	Fixed as part of 1.1's NPC updates

[WL-878](https://ultimateskyrim.atlassian.net/browse/WL-878) I just came across "Return to Severin Manor" spell, and to be honest, that's just broken for Requiem

**Solution:** Disabled reference for the spellbook, added by Severin Manor Improvements.

[WL-876](https://ultimateskyrim.atlassian.net/browse/WL-876) Raven Rock blacksmith cannot craft or temper morrowind gear\(bonemold, chitin\)

**Solution:** Added the Bonemold and Chitin perks to Glover Mallory.

[WL-874](https://ultimateskyrim.atlassian.net/browse/WL-874) character spawns in the void

**Solution:** Interim fix is removing the Random option from the initial menu message. I think the reason this issue occurs is because our changes to Skyrim Unbound currently break some of its starts/presets, which is a larger issue with the current Skyrim Unbound implementation.

In the future, when we expand the starts, we should revisit the implementation. This will give us a chance to revisit the random feature as well.

A useful bit of code for implementing our own random feature will be `Utility.RandomInt()`, which allows us to cast an int’s value randomly \(e.g. `int option = Utility.RandomInt(0,10)`

[WL-873](https://ultimateskyrim.atlassian.net/browse/WL-873) CTD on saving, be it manual or quick, after getting the necromancers amulet and leaving the windhelm area. I can sometimes save once or twice after the amulet, usually thou CTD immediately. 0X0, 0x143CAC20360 and SkyrimSE.exe\+128C07

**Solution:** I Added [WIDeadBodyCleanup script](https://www.nexusmods.com/skyrimspecialedition/mods/62413/) to _unequip_ all items before the transfer, which apparently fixes the issue! 

[WL-870](https://ultimateskyrim.atlassian.net/browse/WL-870) After completing the Forsworn Conspiracy and going to Cidna mine peacefully I can not speak to anyone, draw any weapons, or interact with any objects.

**Not An Issue** / **Unable to Replicate**. When you go peacefully with the guards, there is a small moment before the guard lets you out where you are unable to interact with anything, but this appears by design. I am not sure if the update to Blood and Silver fixed this issue, or if it never existed to begin with, but I was able to interact with everyone in the mine past that point.

[WL-868](https://ultimateskyrim.atlassian.net/browse/WL-868) Honed metal broketh

**Unable to Replicate.** Very likely this was caused by the older version\(s\) and fixed with the update.

[WL-867](https://ultimateskyrim.atlassian.net/browse/WL-867) Followers are stuck in place after player waiting

**Unable to Replicate.** Perhaps fixed by the additional memory scripts can use to fire, or something borked over a long term playthrough for the user.

[WL-866](https://ultimateskyrim.atlassian.net/browse/WL-866) \[CTD\] I equipped a paper lantern than replaced it with an iron lantern and threw the paper lantern on the floor. SkyrimSE.exe\+AA07E4

**Unable to Replicate.** Could just be same ol Wearable Lanterns weirdness,

[WL-865](https://ultimateskyrim.atlassian.net/browse/WL-865) Riding Lydia - YIKES

**Solution:** Disabled the FLP dialogue options for… riding followers? whatever they are, they’re disabled now

[WL-863](https://ultimateskyrim.atlassian.net/browse/WL-863) When performing research \(eg 3 hours\) on visibility, an insane amount of experience is received on illusion and light.

**Solution:** Updated Plot’s spell research requiem patch, should fix this

[WL-862](https://ultimateskyrim.atlassian.net/browse/WL-862) vendor chest no lock in windhelm

**Solution:** Added a master lock to Ginda Ildram’s vendor chest.

[WL-860](https://ultimateskyrim.atlassian.net/browse/WL-860) There is no Abandoned Wolf Den, only a hole in the ground without any items.

**Not an Issue.** The abandoned wolf den is functioning as intended, i.e. it is just an abandoned wolf den with nothing in it. The user likely expected a dungeon, when the cell is intended as a place to rest.

[WL-859](https://ultimateskyrim.atlassian.net/browse/WL-859) Ancestor Glade extremely bright and saturated

**Solution:** The ancestor glade overarching worldspace was missing a lighting template record from ELE; forwarding this record to WildlanderFULL seems to have fixed the issue

[WL-858](https://ultimateskyrim.atlassian.net/browse/WL-858) Audio Overhaul Skyrim - Immersive Sounds Patch not carried over to Wildlander.esp

**Not an issue.** These edits are intended.

[WL-856](https://ultimateskyrim.atlassian.net/browse/WL-856) Alessandra be naked. \(priestess in Riften's hall of the dead\)

**Unable to Replicate.** Dunno what’s happening here

[WL-855](https://ultimateskyrim.atlassian.net/browse/WL-855) I can wear two sets of gloves, normal elven \(honed by Eorlund and enchanted\) and thalmor elven \(just enchanted, Eorlund cannot see them in the list and hone\). They are both in slot 33 \(checked in the inventory\).

**Solution:** The AMB thalmor variants did not have their proper Armor Addon/Armature records forwarded. Forwarding these records fixed the issue.

[WL-850](https://ultimateskyrim.atlassian.net/browse/WL-850) NPC bard "Karita" in the Windpeak Inn in Dawnstar has something wrong with her model/clothing. Her nipple can be seen with her default outfit.

**Solution:** Added an alternate version of the IB textures \(art, normal\) to Wildlander with no nipples/bits.

[WL-847](https://ultimateskyrim.atlassian.net/browse/WL-847) If you open the map and quickly pick a location to mark, there is a chance requiem fast travel restriction won't be enforced

**Solution:** Added Disable Fast Travel SKSE - No Janky Map UI

[WL-845](https://ultimateskyrim.atlassian.net/browse/WL-845) Riften boatman doesn't register you having the right amount of gold

**Solution:** The dialogue conditions were incorrect for ferrymen whose ferry costs were supposed to be FerryCostLocal; the dialogue was actually checking against FerryCost. Have updated all pertinent dialogues.

[WL-844](https://ultimateskyrim.atlassian.net/browse/WL-844) Adding and removing amulet from backpack leads to infinite experience

**Solution:** Removed the recipes for balance reasons. They are a neat idea, but a little odd in the wider scheme of WL, Like... why does wearing this random thing on my equipment give me a bonus

[WL-842](https://ultimateskyrim.atlassian.net/browse/WL-842) GIST and Requium Interaction - Soul Tomatoes do not act like Soul Gems

**Solution:** Added Xanza’s Requiem GIST patch mentioned in the description.

[WL-836](https://ultimateskyrim.atlassian.net/browse/WL-836) \[Gameplay\] You can use pep talk \("Greetings \(Speechcraft\)" option\) dialogue options on Dawnguard dogs

**Solution:** Added conditions to Immersive Speechcraft quests preventing them from activating on the race DLC1ArmoredHuskyCompanionRace.

[WL-835](https://ultimateskyrim.atlassian.net/browse/WL-835) Dead horse inventories cannot be looted without turning on manual loot option

**Solution:** Added a custom feature to Hunterborn whereby only horses will have the manual loot option. You can also loot them before Field Dressing, to ensure the items are not destroyed beforehand.

[WL-834](https://ultimateskyrim.atlassian.net/browse/WL-834) \[FLP?\] Beast Of Intangible, Ability to Change Race???

**Solution:** There were some leftover dialogue options applying to non-human actors. I removed an erroneous inventory dialogue option, and also routed the non-human “tactics” dialogue to the ordinary options \(while excluding things that didn’t make sense, like outfits and teaching spells\).

[WL-831](https://ultimateskyrim.atlassian.net/browse/WL-831) \[NPCS\] Some npcs have not had their facegen converted to High Poly Head. This mostly applies to npcs from the Bijin Mods. Some male npcs don't have high poly beards.

**Solution:** added proper headparts to Inconsequential NPC’s, Outlaw Refuges, Skyrim Sewers, JK’s, and Dawn of Skyrim.

[WL-828](https://ultimateskyrim.atlassian.net/browse/WL-828) Gold has too much weight if there is no system for converting gold weight/denominations

**Solution:** Have reduced gold coin weight to .001000 for the time being, from .002500.

[WL-825](https://ultimateskyrim.atlassian.net/browse/WL-825) Player housing "crate" containers eating items stored in them

**Solution**: I have removed all crates from the vanilla player houses. This issue is caused by Dynamic Things making the crates lootable (and therefore respawning).

[WL-823](https://ultimateskyrim.atlassian.net/browse/WL-823) \[Perk trees\] Despite having Alchemical Lore rank 2, sometimes consuming an ingredient only reveals 2 properties.

**Solution**: Added a condition to Hunterborn’s Botany perk that checks for the presence of Alchemical Lore 2. If Alchemical Lore 2 is detected, it will take precedent over Botany.

[WL-821](https://ultimateskyrim.atlassian.net/browse/WL-821) \[Quest\] "Gather 10 bear pelts for Temba Wide-Arms in Ivarstead" doesn't recognize non-vanilla quality pelts.

**Solution**:  Added a custom script WL_PeltSwapper to all Fine and Flawless pelts, allows you to downgrade these pelts into standard quality for the purpose of turning them in for quests.

[WL-820](https://ultimateskyrim.atlassian.net/browse/WL-820) \[Crafting\] Can't craft torches.

**Solution**: Apparently LIGHT records cannot be crafted directly. Replaced the crafted object with Campfire’s torch tokens, which swap a torch into your inventory when crafted.

[WL-819](https://ultimateskyrim.atlassian.net/browse/WL-819) Follower dialogue that should not be visible is visible at one of Markarth Stables' dog companions

**Solution**: There were some leftover dialogue options applying to non-human actors. I removed an erroneous inventory dialogue option, and also routed the non-human “tactics” dialogue to the ordinary options (while excluding things that didn’t make sense, like outfits and teaching spells).

[WL-815](https://ultimateskyrim.atlassian.net/browse/WL-815) \[NPC\] Lord Harkon turns invisible while transformed into a vampire lord

**Solution**: As provided by ImUrGreg. The “SkinNaked” armor added by EasyNPC did not contain the requisite Vampire Lord and Werewolf armor addons, causing these transformations to appear invisible. The armor addons have been added to the record in Wildlander.esp.

[WL-812](https://ultimateskyrim.atlassian.net/browse/WL-812) \[Gameplay\] Door to exit Heartwood Mill misplaced

**Solution**: Landscape and Water Fixes adjusted the location, which was being overwritten by Requiem. Forwarded proper location

[WL-797](https://ultimateskyrim.atlassian.net/browse/WL-797) soap baskets in the baths sell a variety of items other than soap when the player takes the Merchant perk in Speechcraft

Background: When the player has the “Merchant” perk, merchants will also sell items from their inventory to the player. Keep It Clean used Carlotta Valentia as the base for its washbasket merchant NPC, and erroneously included the items Carlotta also had on her person.

**Solution**: Removed all inventory items from the Keep It Clean washbasket merchant NPC.

[WL-796](https://ultimateskyrim.atlassian.net/browse/WL-796) Whenever you cast spells and then press "x" to hide GUI, The calender at the bottom left, which spells you have equip, and the temperature bar at the right does not get hidden.

**Solution**: This is an odd one for sure - hopefully it will be fixed anyway, with the updated version of the Hide UI code.

[WL-794](https://ultimateskyrim.atlassian.net/browse/WL-794) \[CTD\] After crossing a certain threshold in Chillwind Depths, I crash to desktop; it is 100% reproducible on my saves. \(SkyrimSE.exe\+1309A40\)

**Solution**: This is apparently a common repeatable crash, fixed by tarlazo’s Chillwind Depths CTD Fix.

[WL-793](https://ultimateskyrim.atlassian.net/browse/WL-793) Followers are fleeing. See if we can't prevent the flee behavior from engaging, or at least see what's causing it

**Solution**: The issue appears to have been caused by Requiem’s True Yield (combat fear) effect being applied to followers. I have added a condition to each of the two effects that ensures the subject is not in the CurrentFollowerFaction.

[WL-792](https://ultimateskyrim.atlassian.net/browse/WL-792) M'aiq seems to be sprinting from place to place

**Solution**: I think this may be happening because AI Overhaul is overriding his wander package with some weird shit. I have tried reverting the wander package to vanilla, to see if that changes his behavior.

[WL-791](https://ultimateskyrim.atlassian.net/browse/WL-791) Spell Research is going to need further patches, as it imports, for example, the Invisibility spell as an Expert spell \(vanilla rank\), while it is an apprentice spell in Requiem, this makes it give waay too much experience.

**Solution**: Patches have been checked and edited where nessisary to ensure that the spells give correct levels of experience

[WL-786](https://ultimateskyrim.atlassian.net/browse/WL-786) Bloodskal Blade not working properly, the one that do woosh and send an red magic damage arc fly. Does not work, it seem that damage is there, but .. no distant attack woosh.

**Solution**: Unable to Replicate. Seems to work for me

[WL-784](https://ultimateskyrim.atlassian.net/browse/WL-784) I accepted the fire salts quest from Balimund, but then when I speak to him again I get a CTD, doesn't crash if I don't accept the quest. SkyrimSE.exe\+C2A5F3

**Solution**: Unable to Replicate. At this point, it is hard to say what might cause C2a5f3. Will keep them logged

[WL-783](https://ultimateskyrim.atlassian.net/browse/WL-783) Mixing Salmon Roe with any other ingredient that gives Waterbreathing will produce a Waterbreathing Potion that has insane value.

**Solution**: Nerfed the value of Salmon Roe by disabling Auto-Calc, and reducing the ingredient value to 5.

[WL-782](https://ultimateskyrim.atlassian.net/browse/WL-782) Ash spawn are not affected by sun spells.

**Solution**: Not An Issue, Ash Spawn are not undead lore-wise

[WL-777](https://ultimateskyrim.atlassian.net/browse/WL-777) \[Idle marker\] faralda in the arcaneum & Ralis Sedarys the first time meeting him \(i had to detect aura to find him\)

**Solution**:  Removed erroneous idle marker in Arcaneaeaeaeum, adjusted idle markers near Kolbjorn Barrow so they’re not in the ground

[WL-773](https://ultimateskyrim.atlassian.net/browse/WL-773) Summon werebear \(duration etc\) has not been reqtified at all

Background: This one is odd; the one you obtain from the Standing Stone (as intended) was properly reqtified to a duration of 300 by Fozar’s, but there is an unreferenced variant with the original 60 sec duration. Perhaps the user somehow acquired this unreferenced variant, maybe through Spell Research?

**Solution**:  I made the unreferenced variant 300 seconds, just in case.

[WL-769](https://ultimateskyrim.atlassian.net/browse/WL-769) "Restoration Ritual Spell" quest destription says that I "have been granted the Bane of the Undead" spell, which is not the correct name

**Solution**:  Corrected the quest stage copy to read “Repel Undead (Rank III)” instead of “Bane of the Undead”.

[WL-768](https://ultimateskyrim.atlassian.net/browse/WL-768) Bloodskal Barrow word wall not working

**Solution**: worked for me!

[WL-766](https://ultimateskyrim.atlassian.net/browse/WL-766) Can't meet some crafting requirements, like "Forge" while using a forge. Another I have seen is "Soul Gem: Grand" even though I have one in my inventory.

**Solution**: Removed dummies from offending recipes

[WL-765](https://ultimateskyrim.atlassian.net/browse/WL-765) Start as a wood elf, use the command animal ability, it'll be greyed out forever from that point. I haven't tested to see if it does this in other regions or on other animals. Sabre cats were all I used it on.

**Solution**: This is only half-solved, really. I have removed the SkyUI AIO Survival feature that causes the string script issue (though that is fundamentally caused by the incompatibility between SkyUILib and SkyHUD). However, there is still an issue with Cooldowns not respecting time elapse from mods like Train and Study.

[WL-764](https://ultimateskyrim.atlassian.net/browse/WL-764) \[Crafting\] Calcinium Fragments cannot be turned into Calcinium Ingots.

**Solution**:  Added missing ingot recipes for both Calcinium and Galatite Fragments.


[WL-758](https://ultimateskyrim.atlassian.net/browse/WL-758) \[CTD\] Performing melee stealth kill triggers a killmove camera and game crashes \(KERNELBASE.dll\+34F69\)

**Solution**: Switched to use Violens to stop these Killcams.

[WL-752](https://ultimateskyrim.atlassian.net/browse/WL-752) NPCs appear to have trouble pathing a certain step in Windhelm

**Solution**: Adjusted the stairs upward slightly to fix the step.

[WL-751](https://ultimateskyrim.atlassian.net/browse/WL-751) Varin at the copper cask inn in deep water crossing has a fucked up chin and only has trade/rent options. no full meal, water refill etc...

**Solution**:  This is actually two issues. One, Varin did not properly belong to the innkeeper faction and therefore missed certain services (fixed by adding to innkeeper faction). Second, his beard and other face parts were not patched for High Poly Head (fixed by patching them for high poly head).

[WL-750](https://ultimateskyrim.atlassian.net/browse/WL-750) Kuvar is a master Heavy Armor trainer after taking back Thirsk Mead Hall, but shows as One Handed at the price of 0 Gold and does not function.

**Solution**:  For some reason, Fozar’s turned Kuvar into a one-handed trainer; since his dialogue and other elements still reference him being a heavy armor trainer, I edited his class back to master heavy armor trainer. 

[WL-749](https://ultimateskyrim.atlassian.net/browse/WL-749) \[CTD\] A crash to desktop occurring at random loading screens.

**Solution**: I am hoping that the various memory fixes implemented by the linked ticket will help this issue as well, and thus, I am moving this ticket to Testing. 

If this proves NOT to be the case, and the crash persists, I will likely update my own pagefile above 8gb and make the pagefile adjustment a necessary part of the install process. 

[WL-744](https://ultimateskyrim.atlassian.net/browse/WL-744) Steel cuirass is stronger than Pauldroned Steel Cuirass. \(for armour and warmth while it's also lighter / clearly meant to be less armour

**Solution**: The user was likely referring to the White variant of Steel Pauldroned Cuirass, which had less armor than its standard counterpart. Brought all Steel Pauldroned Cuirass variants in line - they are all slightly better than Steel Cuirass, and also warm

[WL-743](https://ultimateskyrim.atlassian.net/browse/WL-743) The experience gained from studying invisibility seems to be broken. A few study session yield 438,943 novice experience.

**Solution**: Updated Plot’s spell research requiem patch, should fix this

[WL-740](https://ultimateskyrim.atlassian.net/browse/WL-740) After getting Hamal \(Dibella priestess in Markarth\) to enchant something to me, told me my enchanting level hit 91, which I assume is her enchanting level, and gave me experience to my xp bar. Currently my level of enchanting is 7 when that happened.

**Solution**: Unable to Replicate - this was likely fixed by the update(s) to Honed Metal, as there is a reference to this fix in its changelog.

[WL-738](https://ultimateskyrim.atlassian.net/browse/WL-738) Camera stuck on horse instead of character after using grime covered item while mounted.

**Solution**: Added a mounted condition check if !PlayerRef.IsOnMount() to the hunterborn grime scavenging script.

[WL-736](https://ultimateskyrim.atlassian.net/browse/WL-736) When using the forge in breezehome, no experience is given for creating anything

**Solution**: Crafting experience is given - but switching workstations fast means the UI doesnt update. Will need update to CCOR to Fix.

[WL-734](https://ultimateskyrim.atlassian.net/browse/WL-734) Unable to activate Inconsequential NPCs \(Cannot talk to them\)

**Solution**: I gave all the Incon NPC’s their own names, which should prevent Real Names from running on them in the first place.

[WL-732](https://ultimateskyrim.atlassian.net/browse/WL-732) Whenever I take a bath \(always with soap now\) and my character puts her gear back on, she loses all, if not most, of the enchantment buffs from her associated gear.

**Solution**: This one is interesting; tested by bathing, both using soap and not using soap. The enchantments do seem to reappear, but I noticed moreHUD does not update properly until the player re-enters their magic menu, or receives an item.

I have added a mod called Equip Enchantment Fix as a backup, though I will look into moreHUD’s scripts to see if I can force an update whenever an item is equipped.

[WL-731](https://ultimateskyrim.atlassian.net/browse/WL-731) There are black blocks in the reflecions on the water near riften, noticed only in the rift

**Solution**: Went to the location described, tested on Ultra / Low / Potato, ENB on and Off. Could not get the issue to reappear.

[WL-730](https://ultimateskyrim.atlassian.net/browse/WL-730) Casting any spell with restricted use area \(conjuration spells, runes, etc.\) while sneaking causes the crosshair to disappear. Fix included

**Solution**: The fixed version actually does not seem to affect anything, as the issue itself does not appear - perhaps due to SmoothCam getting updated? Interestingly, the crosshair does sort of “flicker” as though it’s trying to disappear while sneaking/casting runes, but it never actually disappears.

[WL-728](https://ultimateskyrim.atlassian.net/browse/WL-728) Widgets appear over inventory menu when buying/selling or looting inventory.

**Solution**: Added the fixed version of SkyHUD, per Uranreactor.

[WL-727](https://ultimateskyrim.atlassian.net/browse/WL-727) Crafting gear at the forge grants no smithing experience; tried with several different types of leather equipment, and reloaded older saves. Smithing is level 4 and I have the first perk \(but have since sold the book\).

**Solution**: Unable to Replicate. Tried crafting the entire standard Leather Set at Alvor’s forge, plus some random leather items like the doublet.

[WL-726](https://ultimateskyrim.atlassian.net/browse/WL-726) \[CTD\] Happens at random as far as I can tell, I've had a few crashes when loading a save. The crashlog I've linked was a save during combat but it has happened before without being in combat. 0x20AAC641F30

**Solution**: See linked issue 763 for potential solution. This report has a different error code, which is somewhat concerning. Notably, this issue also contains a reference to frostfall projectiles, without a proper crash callstack code; see linked issue 516

[WL-722](https://ultimateskyrim.atlassian.net/browse/WL-722) \[CTD\] On Save

**Solution**: Coffin crash :)

[WL-721](https://ultimateskyrim.atlassian.net/browse/WL-721) Elsi's journal isn't there?

**Solution**: The Wildlander.esp was assigning a different model for the book that might’ve been from an older version of Book Covers Skyrim. I think this model assignment was rendering the book invisible.

In any case, restoring the original model seems to have worked, and the book now appears as intended.

[WL-719](https://ultimateskyrim.atlassian.net/browse/WL-719) Recharging Services at a Court Wizard not working

**Solution**: Appears to have been fixed by the Honed metal update, which adds an alternative recharging method. 

[WL-718](https://ultimateskyrim.atlassian.net/browse/WL-718) \[Econemy?\] Cost of enchanted items drops drastically after putting in first perk into enchantment tree.

Background: Requiem’s attempt at blocking enchanting is the perk RFTI_Player_Enchanting, which apparently sets enchantment power to 0. No idea why this produces the weird values

**Solution**:  I did not fix the pricing, but rather prevented players from being able to use enchanting tables in the first place by adding a perk WL_EnchantingBlocker to the player on startup that blocks activation of any furniture with keyword WICraftingEnchanting

[WL-716](https://ultimateskyrim.atlassian.net/browse/WL-716) Companions quest "Hired Muscle" sent PC to brawl Drevis Neloren at the College of Winterhold. Drevis is inaccessible without college entry requirements met.

**Solution**: Added Drevis to CR04 Exclusion Faction.

[WL-715](https://ultimateskyrim.atlassian.net/browse/WL-715) \[CTD\] I saw a horse that was left around Falkreath with noone around, so I stole it and used it to get to Whiterun stables. There I tried to use "adopt" to claim the horse but the game CTDs every time I finish naming it SkyrimSE.exe\+67D040

**Solution**: I went and adopted what I believe is the same horse as this user - the Fjord horse floating around Falkreath after the civil war battle. After riding away, I was able to adopt the horse with no issue.

It is possible that my game is not experiencing the same circumstance’s as the user, or that the crash has been assuaged by the memory fixes. We will see if it appears again.

[WL-713](https://ultimateskyrim.atlassian.net/browse/WL-713) Saadia gets stuck while following her after telling her there are people looking for her. She goes to the table in the kitchen and stands there.

**Solution**: Unable to Replicate. For me, Saadia just went in the back and upstairs like she always does :thinking: we will be on the lookout for more help replicating.

[WL-706](https://ultimateskyrim.atlassian.net/browse/WL-706) First companion quest - Hired Muscle - sent to attack Hert in Half-Moon-Mill.. who's a vampire.

**Solution**: added both Hert and Hern to CR04ExclusionFaction, which should prevent them from being selected for Hired Muscle.

[WL-705](https://ultimateskyrim.atlassian.net/browse/WL-705) Companions quest rewards are too low

**Solution**: edited CompanionsHousekeepingScript to differentiate the gold rewards based on companions quest difficulty (roughly). I say “roughly” because some quests can still send you to either a bandit camp/animal den, OR a vampire/warlock den. Unfortunately there is no easy way to differentiate rewards between location, may be worth doing in the futur

[WL-703](https://ultimateskyrim.atlassian.net/browse/WL-703) Can't gather firewood through camping mods. Hunterborn Forage can gather edibles, ingredients, and bones, but will only pass time when selecting the "firewood" forage option and will never give firewood items when generally foraging.

**Solution**: For some reason, Hunterborn’s tree scanning properties were not assigned. Restoring them has allowed the wood foraging to function as normal; it is possible again to get wood, deadwood, and tree bark from the trees.

[WL-702](https://ultimateskyrim.atlassian.net/browse/WL-702) Handwriting font is too difficult for users to read

**Solution**: Reverted Handwriting font to vanilla’s.

[WL-701](https://ultimateskyrim.atlassian.net/browse/WL-701) Many jewelry available to craft with first perk.  \(more in description\)

**Solution**: 
* Fixed several of the CCA armors showing up twice in Forge (needed to have their stations properly set to Player crafting)
* Fixed Alik’r Hood - Red having an enchantment when it should not have
* Fixed Steel Furred Plate Cuirass perk requirement from Craftsmanship to Advanced Blacksmithing
* Added Ebony Smithing requirement to Ebony Mail conversion recipes

[WL-690](https://ultimateskyrim.atlassian.net/browse/WL-690?atlOrigin=eyJpIjoiYzgwYTQ0ZjEyNzQzNGJhN2JmNjEyZTM0NmRhZWZhNjIiLCJwIjoic2hlZXRzLWppcmEifQ)	[Quest] GOOD INTENTIONS wont progress after listening to tolfdir	

**Solution**:	Not So Fast Mage's guild has been removed

[WL-694](https://ultimateskyrim.atlassian.net/browse/WL-694) \[CTD\] I have crashed three times, once entering whiterun through the gate, once trying to order something from the blacksmith in riverwood, once going into the general trader in riverwood.

**Solution**: The commonality in all of these seems to be “hkpRigidBody”, which may be a skeleton related issue. However, an unfortunate problem in diagnosing these is that any crash could theoretically be related to the script memory/memory issues.

[WL-688](https://ultimateskyrim.atlassian.net/browse/WL-688) Hunterborn \(and maybe other mods\) does not start. Had to load the FISS Profile, before that couldn't find Huntingknifes at stores and abilities like forage were not available.

**Solution**: This is actually the conflation of two separate issues. The “hunting knives not appearing at stores” is sort of legitimate, in the sense that Hunterborn’s scripts do not seem to apply the knives the way they’re supposed to unless you deactivate / reactivate the option. However, I have already solved this by manually adding Hunting Knives to general goods merchants.

The “Forage will not activate” issue is one I was Unable to Replicate. Forage seems to work fine for me in every instance I’ve tested it (possibly user needs to rebind key like with Drink in Sunhelm).

[WL-686](https://ultimateskyrim.atlassian.net/browse/WL-686) Told companions to All Wait in the Sleeping GIant Inn and they begin to attack the NPCs. My companions are a Stray Dog and Bjalfi Snow-Song.

**Solution**: “Bjalfi Snow-Song” is not an actual NPC, so he is probably one of the Inconsequential NPC mercenaries renamed by Real Names. Unfortunately, this means I can’t know which NPC caused the issue. I did recruit the Stray Dog and issue the “All Wait” command with him in the Sleeping Giant Inn, but no one attacked him.

[WL-677](https://ultimateskyrim.atlassian.net/browse/WL-677) CTD When entering the Inn in Dawnstar to talk to Stig Salt-Plank during the second phase of the Rise in the East Quest,

**Solution**: Irlof appearance replacer (Beards of Power) shipped with a broken appearance, causing this crash for Irlof. I have updated the mod to the latest version, which fixes the crash.

[WL-675](https://ultimateskyrim.atlassian.net/browse/WL-675?atlOrigin=eyJpIjoiYzgwYTQ0ZjEyNzQzNGJhN2JmNjEyZTM0NmRhZWZhNjIiLCJwIjoic2hlZXRzLWppcmEifQ)	Speed Trees snow pine models have some blocky, chunky floating snow bits at eye level that should be removed in the model	

**Solution**:	Elwaps has been removed.

[WL-672](https://ultimateskyrim.atlassian.net/browse/WL-672) Disable CCOR category menus for compatibility with Honed Metal

**Solution**: Solution: Disabled CCOR category menus for compatibility with Honed Metal, by adding the following to Autorun.txt: set CCO_OptionCraftingMenuOptions to 0
set CCO_OptionCraftingMenuCategories to 0

[WL-670](https://ultimateskyrim.atlassian.net/browse/WL-670) Allow mouse wheel to toggle camera again

**Solution**: Set ScrollingDoesntSwitchPOV = false in WL’s copy of EngineFixes.toml

[WL-667](https://ultimateskyrim.atlassian.net/browse/WL-667) When selling an item that is worth more gold than the merchant has available the item will leave my inventory but I receive no gold.

**Solution**: Reduced vendor's starting gold to prevent overflow.

[WL-666](https://ultimateskyrim.atlassian.net/browse/WL-666) Training with HA and 2H gives full level ups. Video provides evidence of HA. 

**Solution**: Not an issue. This is how training is supposed to work; I was surprised it didn’t work this way back on LE. oopsie 

[WL-663](https://ultimateskyrim.atlassian.net/browse/WL-663) I'm playing as a khajiit on a fresh save. I got frostbite on my hands, which was supposed to reduce my skills, but instead increases them.

Background: As it turns out, the frostbite does not technically increase the stats; it does reduce them as stated. However, the issue turned out to be that for whatever reason, the frostbite stat maluses do not stack with the stat maluses provided by the main “freezing” effect. Freezing applies -60, hand Frostbite applies -10, and instead of resulting in -70, the -60 is removed to produce a net -10.

I am not sure why this is happening, as Frostfall does use separate effects for each, which usually allows values to stack. I thought it might be Requiem’s custom disabler of stacking, but the issue persisted even without Requiem installed. 

**Solution**: I decided to disable the frostbite system within Frostfall by editing the _frost_exposuresystem.psc script. The default freezing stats are plenty impactful imo, and this might be a bit less confusing anyway, since players no longer have to understand that Freezing and Frostbite are separate mechanics.

[WL-662](https://ultimateskyrim.atlassian.net/browse/WL-662) Unable to craft Blacksmith's Hammer \(spell research tool\). I have the first perk in smithing, which I assume would be enough considering that I can craft tongs with that perk. But I cannot see a way to produce a hammer.

**Solution**: Hammer recipe required an Iron Kettle for some reason. Condition has been removed 

[WL-658](https://ultimateskyrim.atlassian.net/browse/WL-658) The default economy values seem to be a bit off, fBarterMin and fBarterMax values are much lower than default Vanilla Skyrim and Requiem.  \(more in description\)

**Solution**: Not an Issue. As far as I know, these are the intended values and they are intended to be set within Trade Routes as the user noted.

[WL-655](https://ultimateskyrim.atlassian.net/browse/WL-655) Item: Iron Knife \(MISC\) is not showing in the inventory when picked up...it is still adding weight to the Weight Limit... and can only be remove via Console command removeitem

Background: Looks like I attempted at some point to use Campfire’s misc swap script to swap the misc variant of the knife/fork for the weapon variant. This would not have worked in either case, since the script cannot recognize the swap when the new record is a Weap instead of a Misc.

**Solution**: I copied all references of the misc knives and forks to override, then replaced them with the weapon versions. From brief ingame testing, this does not appear to cause clipping/havok issues.

[WL-654](https://ultimateskyrim.atlassian.net/browse/WL-654) Requiem startup quest is erroneously displaying

**Solution**: Apparently, quests will show up as long as there are log entries. I have removed the log entries, which has hidden the quest.

[WL-653](https://ultimateskyrim.atlassian.net/browse/WL-653) Cannot take Orcish smithing with just Dwarven as prerequisite

**Solution**: Added changed Orcish Smithing perk conditions so that the player can have either Morrowind or Dwarven smithing

[WL-649](https://ultimateskyrim.atlassian.net/browse/WL-649) Drunk visuals are far too severe

**Solution**: Until we have a better solution for “drunk visuals”, I have nullified the visual effect. (Removed the Drunk imagespace modifier from Requiem quest REQ_CoreScripts_AlcoholEffectsPlayer, and also REQ_Effect_Alcohol_Magicka.)

[WL-645](https://ultimateskyrim.atlassian.net/browse/WL-645) \[CTD\] crash to desktop whenever i try to save.

**Solution**: Coffin Crash :)

[WL-644](https://ultimateskyrim.atlassian.net/browse/WL-644)   In the Crafting Menu \(Right Shift\) I searched a recipe, typed 'b' and it caused the follower framework window to pop-up

**Solution**: prevented hoykeys firing when using filters.

[WL-643](https://ultimateskyrim.atlassian.net/browse/WL-643)  Crossbows cannot be ordered via Honed Metal They require Hide Lace, which a smith can craft, but Hide Lace requires Fur Plate, which they cannot craft.

**Solution**:  Added Hide Lace to common materials, and patched Honed Metal tanning rack to use our tanning rack keyword (for pelt processing). 

[WL-641](https://ultimateskyrim.atlassian.net/browse/WL-641) Barrels and Chests act like minecraft enderchests.  did purchase 2 barrels and one chest and all 3 share the same inventory.

**Solution**: Not an Issue because this is technically how those mods are intended to function. Needs replacing with a new container-specific framework. 

[WL-639](https://ultimateskyrim.atlassian.net/browse/WL-639) After character creation i choose Background: Archer, Birthsign: The Lady, Starting location: Surviving the Wilds, Falkreath, Difficulty: Standard, press Begin Story and Then the sky changes to the moon and in freezes right there.

**Solution**: Unable to Replicate. This may be related to the FISS loading issue (see linked). May be solved with the additional padding and/or memory changes.

[WL-630](https://ultimateskyrim.atlassian.net/browse/WL-630) Unable to breakdown linen cloaks into linen for bandages. All? Linen recipe missing from crafting menu.

**Solution**: this is actually an issue with Campfire’s travel cloaks getting added to vendors when they should not be. Patched the campfire vendor quest to replace them with wolfskin cloaks.

[WL-628](https://ultimateskyrim.atlassian.net/browse/WL-628) FollowerLivePackage has follower worship, enabling them to do certain actions depending on their deity. Sheogorath followers can spawn cheese out of nowhere and throw it, and that _sometimes_ breaks their AI in combat

**Solution**: Disabled follower worship in the FLP preset we load on game start.

[WL-621](https://ultimateskyrim.atlassian.net/browse/WL-621) \[CTD\] My horse's saddle disappeared \(no longer showing on the horse model\). I can equip on myself! which cases CTD

**Solution**:  was able to replicate the saddle crash, but only once; every other time resulted in the saddle being unequipped automatically, and no crash. Otherwise, all of the saddles and barding behaved normally.

This could be because of the script memory changes.

[WL-616](https://ultimateskyrim.atlassian.net/browse/WL-616) Temple of Dibella : Infinite Health, Magicka and Stamina

**Solution**:  I disabled the activators for this spell within the Dawnstar Dibella bathhouse. The player should no longer receive this bonus when utilizing the facilities.

[WL-611](https://ultimateskyrim.atlassian.net/browse/WL-611) \[Crafting leveling exploit\] backpacks \+ god amulets. craft, breakdown and repeat for infinite XP. This should probably be on player crafting.

**Solution**: Disabled Recipes.

[WL-610](https://ultimateskyrim.atlassian.net/browse/WL-610) Reduce Carry Weight bonuses from SunHelm's campfire skill tree perks

**Solution**: Reduced bonus from 50 and 100 to 15 and 30 respectively

[WL-608](https://ultimateskyrim.atlassian.net/browse/WL-608) Eorlund is providing crafting services after Take Up Arms, instead of after joining the circle

**Solution**:  I have changed the quest requirement from C00 Take up Arms, stage 100 to C03 The Silver Hand, stage 200. This should function as a quest completion check for joining the circle.

[WL-603](https://ultimateskyrim.atlassian.net/browse/WL-603) Missive quests can send you to courior

**Solution**: All couriers have been added to the forbidden list.

[WL-602](https://ultimateskyrim.atlassian.net/browse/WL-602) \[CTD\] Reloading a crossbow in combat is causing a crash; seems related to NECR firing at that time?

**Solution**: Edited the NECR script to initialize on game start. Could not reproduce crash after that.

[WL-601](https://ultimateskyrim.atlassian.net/browse/WL-601) Hired Muscle selected XJKroriksteadvendor "Cedric" \[NPC\_:3C004189\] In \("Cedric's Trading Stop" \[CELL:3C003F78\]\) in rorikstead for target - but he isnt acceable in game world

**Solution**: Added Cedric to missives forbidden list. I’m not sure why Cedric’s cell is inaccessible, but it appears to be. 

[WL-596](https://ultimateskyrim.atlassian.net/browse/WL-596) \[CTD\] Buy iron knife from Riverwood Trader, head outside riverwood, equip knife, game crashes

**Solution**: I had no trouble equipping and using the knife, so it’s not a mesh crash. Maybe an animation crash relating to TDM with specific circumstances? 

[WL-593](https://ultimateskyrim.atlassian.net/browse/WL-593) Potato mode heads mismatching the body textures \(Neckseam\)

**Solution**: Made Cyb’s Remix Skin part of core.

[WL-589](https://ultimateskyrim.atlassian.net/browse/WL-589) Able to craft "Steel Furred Plate Cuirass" with only the basic crafting perk, not the "Advanced Blacksmithing" perk at smithing 50 that allows the crafting of plate armors.

**Solution**: Fixed Recipe

[WL-588](https://ultimateskyrim.atlassian.net/browse/WL-588) Empty bottle \(made by "emptying" a bottle\) won't fill with water.

**Solution**: Added bottle refill script to all varieties of empty bottle, should allow them to refill 

[WL-581](https://ultimateskyrim.atlassian.net/browse/WL-581) Dialogue adjustments: remove black bars, put the notifications back in the proper place, and see if head tracking cannot be re-established \(will require fixing card games\)

**Solution**:  Re-added Improved Camera and head lock for Alternate Conversation Camera. Fixed card game issue by utilizing the camera reset function built into the card game scripts.

[WL-580](https://ultimateskyrim.atlassian.net/browse/WL-580) \[CTD\] User reporting the infamous Istar Cairn-Breaker crash at 6am in Dragon Bridge \(SkyrimSE.exe\+21FFE3\)

**Unable to Replicate**:  I have not managed to reproduce the bug thus far; we’ll see if it surfaces again.

[WL-579](https://ultimateskyrim.atlassian.net/browse/WL-579) Economy is slightly borked. Adjustments in the description

**Solution**: 
* Issue 1: Edited the existing Trade Routes script (TRSD_Base) to make the Outer Markup 1.20 and Inner Markup to 1.20.
* Issue 2: Edited the Trade Routes script (TRSD_Base) to make Trade Supply 100 instead of 1000.
* Issue 3: Edited TRSD_Base to remove Extra Gold, edited all REQ_VendorChest Containers to utilize fewer/default Vendor Gold Leveled List counts
* Issue 4: Adjusted Honed Metal’s variables via a quest override within the Wildlander plugin.

[WL-578](https://ultimateskyrim.atlassian.net/browse/WL-578) Amulet of Talos and Backpack with Amulet of Talos have different effects - Amulet has 5% better penetration, but backpack with amulet of talos has reduced Thu'um cooldown

**Solution**: Backpack with Amulet recipes have been disabled.

[WL-577](https://ultimateskyrim.atlassian.net/browse/WL-577) Tempering tiers, durability, HUD display are unintuitive and need revising

**Solution**:  set iEquip MCM settings to no longer fade from bottom to top, giving the appearance of weapons being nearly broken when their tempering tier is degrading

[WL-575](https://ultimateskyrim.atlassian.net/browse/WL-575) Blacksmiths do not have hide lace, and seemingly do not make leather from pelts either. Generally ensure they can make all basic materials

**Solution**: Added Hide Lace to common materials, and patched Honed Metal tanning rack to use our tanning rack keyword (for pelt processing).

[WL-573](https://ultimateskyrim.atlassian.net/browse/WL-573) Crafting Medicinal Salve at a Forge \(only tested in Dawnstar\) contributes to leveling Smithing.

**Solution**: added NoCraftingExperience keywords 

[WL-570](https://ultimateskyrim.atlassian.net/browse/WL-570) CTD: possibly related to Adrianne Avenicci

**Solution**:  I have not been able to replicate this issue, but I am hoping it is related to either the CCOR crafting categories (which have been disabled), or oddness with the old version of Honed Metal (which has been updated). Moving to testing.

[WL-568](https://ultimateskyrim.atlassian.net/browse/WL-568) Weird pathing of NPC´s in Whiterun. Looks like there is a little party behind the house.

**Solution**: Adjusted navmesh to exclude this area; hopefully NPC’s stop using it

[WL-565](https://ultimateskyrim.atlassian.net/browse/WL-565) Honed metal: user confusion. Can the wording  be changed from "can you upgrade" to "can you temper"

**Solution**: Changed the wording to “Can you repair/temper my equipment?”

[WL-563](https://ultimateskyrim.atlassian.net/browse/WL-563) A missive to deliver a weapon from Ulfbert War-bear to Cedric of Rorikstead, but Cedric is nowhere to be found once I have the weapon in hand.

**Solution**: Added Cedric to missives forbidden list. I’m not sure why Cedric’s cell is inaccessible, but it appears to be.

[WL-562](https://ultimateskyrim.atlassian.net/browse/WL-562) I was in the Falkreath Inn and looked down at the central hearth and pressed the crafting hotkey and froze for a few seconds before crashing to desktop.

**Solution**: I have not been able to replicate this issue, but I am hoping it is related to either the CCOR crafting categories (which have been disabled), or oddness with the old version of Honed Metal (which has been updated). Moving to testing.

[WL-560](https://ultimateskyrim.atlassian.net/browse/WL-560) Shadow Stone daily power notified me that it was ready, but it is still greyed out and unusable.

**Solution**:  I removed SkySA AIO’s power cooldown feature

[WL-557](https://ultimateskyrim.atlassian.net/browse/WL-557) \[Crafting\] empty bottles from craft menu and attempted to refill them at multiple sources. Waterskins refilled normally, but not the "Glass Bottle \(Empty\)" items.

**Solution**: Added bottle refill script to all varieties of empty bottle, should allow them to refill 

[WL-556](https://ultimateskyrim.atlassian.net/browse/WL-556 )	[Crafting] So there's a confusingly large list of additional items in my forge menu, outside of the Complete Crafting menu options. (jester armor and commoner's clothes.)	

**Solution**:	Addition of crafting tools greatly reduces this list

[WL-555](https://ultimateskyrim.atlassian.net/browse/WL-555 )	In the Crafting Menu (Right Shift) I searched a recipe, typed 'b' and it caused the follower framework window to pop-up. I have not tested if other hotkeys producing command prompts are still enabled in the crafting menu, but they should be.	

**Solution**:	Dylan Demonstrated this had been fixed on stream

[WL-554](https://ultimateskyrim.atlassian.net/browse/WL-554) Muiri at the Silverblood Inn is missing hair textures

**Solution**: Dunno why EasyNPC fails to grab the proper hair for Bijin Muiri, but no biggie - it was kind of weird anyway. Just rerouted her to be Markarth Side Refine instead

[WL-553](https://ultimateskyrim.atlassian.net/browse/WL-553) ESF Companions - Cannot progress - user done 12 radients but next stage isnt starting

**Solution**: Since at this point we’re only using ESF Companions to edit the required amount of radiant quests, I’ve replaced ESF with  More Radiant Quests for the Companions, which simply edits the amount of radiant quests needed for each stage. (I have edited the requirements to 10 for Trial, 5 for Circle, and 5 for Kodlak.)

[WL-551](https://ultimateskyrim.atlassian.net/browse/WL-551) Cannot disable the sneak eye even if hide UI using the x key

**Solution**: Luca has updated his mod to use this new framework, so the old version has been replaced. See linked issue

[WL-549](https://ultimateskyrim.atlassian.net/browse/WL-549) \[Gameplay\] Holding/Conjuring a weapon to left hand and attempting to Attack with left click does not work.

**Solution**:  Installed Dual Wield Block, should be fixed

[WL-546](https://ultimateskyrim.atlassian.net/browse/WL-546) \[Gameplay\] At Heartwood Mill \(west of Riften\), when you enter the mill the door you enter through is not interactable to get back out. Instead, there's a door on the opposite wall that you must exit through.

**Solution**: Landscape and Water Fixes adjusted the location, which was being overwritten by Requiem. Forwarded proper location

[WL-545](https://ultimateskyrim.atlassian.net/browse/WL-545) \[CTD\] Wildlander will launch but consistently crashed to desktep during the "finilizing" phase.

**Solution**: Added some Utility.Wait()'s to the FISS loading operations in the Wildlander startup script. There are still FISS operations in Hunterborn and MoreHUD that this would not account for, but this padding will hopefully be enough to prevent the issue.

[WL-540](https://ultimateskyrim.atlassian.net/browse/WL-540 )	Missing honed metal receipe - Balimund smith in Riften (and maybe more smiths) can't craft Fur Plates (more notes inside)	

**Solution**:	Fixes to crafting have corrected this issue.

[WL-539](https://ultimateskyrim.atlassian.net/browse/WL-539) \[Quest\] Valdr not accepting Potion of Restore Health \(crafted\)

**Unable to reproduce** Tested quest using 1.1 build and doesnt occur.

[WL-538](https://ultimateskyrim.atlassian.net/browse/WL-538 )	First perk of "Morrowind smithing" does not add any crafting recipes. I don't know if it's a bug or a feature but i want to give you a heads up	

**Solution**:	Removed the Requirement to have started dragonborn from the Morrowind smithing recipes

[WL-535](https://ultimateskyrim.atlassian.net/browse/WL-535 )	No roads on map. I see in Mod Organiser that A quality world map with main roads is installed but It doesn't seem to be visible in game	

**Solution**:	Map has been corrected

[WL-534](https://ultimateskyrim.atlassian.net/browse/WL-534) \[Missing texture\] Missing hair texture from #177 in RaceMenu, specifically KS Hairdos \(0Dawn\)

**Solution**: My guess is that foregoing the EasyNPC generation has “fixed” this

[WL-524](https://ultimateskyrim.atlassian.net/browse/WL-524) \[quest\] In my quest journal i have oen quest 'A requim for better times'. description is 'requim is installing'.

**Solution**: Adjusted startup script to complete the quest.

[WL-523](https://ultimateskyrim.atlassian.net/browse/WL-523) \[Customsaition\] Racemenu options not working, All the features are there but some of them do anything at all.

**Solution**: Issue has been resolved in the 

[WL-500](https://ultimateskyrim.atlassian.net/browse/WL-500) During the companions quest where Farkas transforms he was invisible as a werewolf, and Aela was invisible too when receiving the blood. The PC was not invisible and Skiors dead werewolf body was not invisible.

**Solution**: As provided by ImUrGreg. The “SkinNaked” armor added by EasyNPC did not contain the requisite Vampire Lord and Werewolf armor addons, causing these transformations to appear invisible. The armor addons have been added to the record in Wildlander.esp.

[WL-489](https://ultimateskyrim.atlassian.net/browse/WL-489 )	[Clip] Tree going through some kind of overhang in Riverwood. Behind the Sleeping Giant Inn.	

**Solution**:	Removed tree from Goat pen

[WL-476](https://ultimateskyrim.atlassian.net/browse/WL-476 )	[Clip] FalkreathTree growing into Rear of dead man's drink (-9, -22)	

**Solution**:	Changing to happy little trees has removed this glitch

[WL-469](https://ultimateskyrim.atlassian.net/browse/WL-469) \[Tuning required\] the first two Sunhelm perks in the Campfire menu increase your carry weight by 50 each, and they're really easy to get.

**Solution**: Adjusted Perks to 15/30.

[WL-464](https://ultimateskyrim.atlassian.net/browse/WL-464) Horses do not have manes. Remeber seeing them on a stream but missing for me!

**Solution**:  the default horse mesh was hidden for some reason. Unhid Requiem’s instance, appears to be working

[WL-460](https://ultimateskyrim.atlassian.net/browse/WL-460 )	[Clip] Grass clipping through one of the bedrolls in the camp just outside Riverwood	

**Solution**:	Removed Grass and rocks from affected tent

[WL-438](https://ultimateskyrim.atlassian.net/browse/WL-438) \[Sounds\] Chirping birds heard inside the Stumbling Sabrecat inn.

**Solution**: the “wilderness interior day loop” from Sounds of Skyrim had the annoying 5 second bird loop. This has been nullified in the sound marker.

[WL-437](https://ultimateskyrim.atlassian.net/browse/WL-437) \[z fighting\] on the base of the statue of Ysgramor in Whiterun

**Solution**: z-fight resolved.

[WL-436](https://ultimateskyrim.atlassian.net/browse/WL-436 )	[Missing texture] The Necromancer's Amulet is invisible when worn.	

**Solution**:	Reverted Necromacers amulet to use Requiems Texture - as CCOR's is missing a mesh

[WL-428](https://ultimateskyrim.atlassian.net/browse/WL-428) The Auxillary Barracks section of Fort Hraagstad has missing exterior meshes.

**Solution**: Caused by a conflict with No Snow under the roof. Reverted the meshes from 

[WL-427](https://ultimateskyrim.atlassian.net/browse/WL-427) \[Gameplay\] Unable to start the Thieves Guild quest line.  

**Solution**: Updated to V5 of Thieves guild requirements which resolves this issue.

[WL-423](https://ultimateskyrim.atlassian.net/browse/WL-423) Unable to "roast meat" in Sleeping giant inn's firepit 

**Solution**: Added Embers XD proprietary static records to the campfire fire detection formID list

[WL-421](https://ultimateskyrim.atlassian.net/browse/WL-421) \[Racemenu\] Female breton preset 2 - cannot remove facepaint

**Solution**: Reverted facepaints for presets to vanilla

[WL-375](https://ultimateskyrim.atlassian.net/browse/WL-375) \{from Livestream\) Bersi Honey-hand in Riften has wrong beard

**Solution**: Corrected Faceparts.

[WL-359](https://ultimateskyrim.atlassian.net/browse/WL-359) \[MCM\] 3 new menus have placeholder names

**Solution**: Manually changed the name via an override for the config quests. The MCM’s themselves still display strings, but I don’t care nearly enough to fix that whole mess

[WL-354](https://ultimateskyrim.atlassian.net/browse/WL-354) Wooden chopping blocks. Logs are no longer positioned on the block. Happens at every one i've tested

**Solution**: Position Corrected

[WL-350](https://ultimateskyrim.atlassian.net/browse/WL-350) \[Livestream Chat\] How to do a "diseased" character start, E.G vampire or Werewolf like you can in LE.

**Solution**: Can now press f10 to do a completely bespoke start during the setup process.

[WL-347](https://ultimateskyrim.atlassian.net/browse/WL-347) \[Livestream\] Solitude refuge - Fences dont spawn when you first enter the refuge. but do spawn after you load a save - Found fix

**Solution**: Removed ELE + Outlaw Refuges patch. NPC’s are spawning as normal.

[WL-329](https://ultimateskyrim.atlassian.net/browse/WL-329) \[Functionality\] Solitude outlaw refuge vendor had no inventory. Also name was different in console.

**Solution**: For whatever reason, having his buy/sell list set to VendorItemsInnkeeper was not populating his inventory (maybe because he didn’t belong to the innkeeper faction?) In any case, selecting a different vendor list allowing food seems to have done the job

[WL-35](https://ultimateskyrim.atlassian.net/browse/WL-35) Speed Trees snow pines do not have snow running up the bark	

**Solution:** 	Speedtrees has been removed


</details>


### Functionality
<details>
  <summary>Click to expand!</summary>

[WL-1259](https://ultimateskyrim.atlassian.net/browse/WL-1259) Ultrawide resolution support \(2560 x 1080 and 3440 x 1440\)

**Solution**: 

[WL-1255](https://ultimateskyrim.atlassian.net/browse/WL-1255) Edit Immersive Speechcraft options and menu to be more immersive

**Solution**: 

[WL-1205](https://ultimateskyrim.atlassian.net/browse/WL-1205) Campfire craftable spinning wheel

**Solution**: Added Campfire Placeable version of the spinning wheel.

[WL-1095](https://ultimateskyrim.atlassian.net/browse/WL-1095) Give hunters more powerful combat perks

**Solution**: Added Jenassa-equivalent combat perks to all Hunter npc’s and templates.

[WL-1068](https://ultimateskyrim.atlassian.net/browse/WL-1068) Add customization executables

**Solution**: Added to Mod Organiser

[WL-1055](https://ultimateskyrim.atlassian.net/browse/WL-1055) Add portable enchanting supplies to general and wizard vendors

**Solution**: Added to merchant lists.

[WL-1052](https://ultimateskyrim.atlassian.net/browse/WL-1052) Give players Apple Cabbage Stew by default

**Solution**: Added to starting script.

[WL-895](https://ultimateskyrim.atlassian.net/browse/WL-895) Boss loot chests in need of a buff / more interesting loot

**Solution**: Buffed all boss chests with loot pertinent to the enemy type

[WL-678](https://ultimateskyrim.atlassian.net/browse/WL-678) Add more paper to general goods merchant stocks, also wizards

**Solution**:  Turns out that for some reason, Spell Research does not give every wizard the wizard merchant list. I gave it to every wizard, which means far more paper and other wizard stuff

[WL-647](https://ultimateskyrim.atlassian.net/browse/WL-647) Add torches to survival essentials LVLI for general goods merchants

**Solution**:  Added torches to Lvli_Survival

</details>

## Mod changes
### Added Mods
<details>
  <summary>Click to expand!</summary>

* [Skin] -   FAL Skin Shaved Version SE
* 3rd Person Walk Fix
* AddItemMenu -   Ultimate Mod Explorer
* All Thieves Guild Jobs Concurrently
* Animations from   Skyrim Horse Renewal - Horse Only
* Base Object Swapper
* Better Thieves Guild   Practice Locks SSE
* Chillwind Depths CTD Fix
* College of Winterhold   Doorbell
* Complete Widescreen Fix - Dummy
* Cuyi's Bosmeri   Antlers - SSE
* Deceive Degaine
* Disable Fast Travel   SKSE - No Janky Map UI
* Double Wide Quick Light
* Dovah Sonaak Dragon   Priest Masks
* Dual Wield Block
* Dynamic Things   Alternative - Base Object Swapper
* ENB Input Disabler
* Equip Enchantment Fix
* Favorite Misc Items
* Fish Anywhere With   Water
* High Poly Vanilla Hair
* Honed Metal
* Horses Simply Turn Better
* Immersive Animations
* Immersive Equipment Displays
* Improved Camera
* Landscape   Identification by Terrain Texture
* More Radiant Quests for the Companions
* NPC Lookup
* NPCs use Potions
* Quick Light SE
* ReCleaned Menu
* Requiem - Common   Clothes and Armors
* Requiem - GIST Patch
* Requiem - Skyrim   Sewers
* Shaders of Solstheim - Ash and Moss
* Simple Dual Sheath
* Simplicity of Snow
* Skeleton Replacer HD
* Skyland Skyhaven Temple
* Snazzy Weapon Racks   (Noble Texture Version)
* Spell Research Patch Compendium Redux 357 patches
* SSE Terrain Tamriel   Extend
* Sunhelm Survival Patch for Hearthfire Extended
* Superior   Lore-Friendly Hair - HD textures rough
* The Eyes Of Beauty Dawnguard Update
* The Soul Cairn
* Trad Requiem Patch - CC Fishing and CC Rare Curios
* Train and Study -   Requiem Patch
* Ultimate Immersion Toggle - UI Toggle - Hide Your   HUD - Rebuild
* UNP Underwear   Replacement
* VioLens - A Killmove Mod SE
* VioLens - A Killmove   Mod SE - Legacy Settings Loader
* Water Effects Brightness and Reflection Fix
* Wet and Cold Breath   Texture for ENB (and R.A.S.S)
* WIDeadBodyCleanupScript Crash Fix
* XPMSSE - Nemesis -   Papyrus Stack Fix

</details>

### Updated 
<details>
  <summary>Click to expand!</summary>

* A Quality World Map - Classic   with All Roads
* Annoying cicada and   insect sound replace
* ApachiiSkyHair SSE - Females
* ApachiiSkyHair SSE -   Males
* Beards of Power Sons of Skyrim 
* Blended Roads Redone   SE - Bridges 2k
* Blood and Silver - Cidhna Mine Expanded
* Bug Fixes SSE
* Complete Crafting Overhaul Remastered - PRUFEI CTD   Hotfix
* Elegant Elven   Followers SSE - Dummy
* ENB Helper SE Shader Bundle
* Enhanced Blood   Textures - ENB Alpha Fix
* Followers Hirelings and Housecarls SSE - Dummy
* Frankly HD Miraak   [SSE] - Hotfix
* Fuz Ro D-oh - Alternate Silent Voice Files
* Glorious Doors of   Skyrim (GDOS) SE - 1.04 Update
* Heart of the Beast - Alpha Werewolf Model
* Hearthfire Extended -   CFTO Patch
* Honed Metal Additional Materials
* Honed Metal Revoiced
* Immersive Dragon Sounds SSE Port - USSEP Hotfix
* Immersive Horses 2K   Horse Textures
* Immersive Laundry - Replacer ESP for JK and DoS
* Improved Camera
* Jaxonz Positioner   Converted - Updated Script
* JK's Skyrim - ETaC -   CFTO Patch
* JK's Skyrim - ETaC - NSUTR Patch
* JK's Skyrim + DoS +   ETaC + Holidays Patch
* JK's Skyrim + DoS +   Outlaw Refuges + Sewers Patch
* Kala's Eyes - Beast   Races (Standalone Variants)
* Kala's Eyes - Elves   (Standalone Variants)
* Kala's Eyes - Orsimer   (Standalone Variants)
* Kala's Eyes - Orsimer   (Standalone Variants) ESL
* Kala's Eyes - Orsimer   (Vanilla Replacer)
* Kala's Eyes AIO   Update 1.2
* Kala's Eyes AIO   Update 1.2 ESL
* Landscape Fixes For   Grass Mods - Riverbed Edge Fix
* Landscape Fixes For   Grass Mods - Vanilla Military Camps
* Majestic Mountains - DynDOLOD 3.0 LOD Pack
* Majestic Mountains -   Mesh Tangent Space Fixes
* Markarth Side Refine 
* More Informative   Console
* Northbourne NPCs of   Haafingar 
* Northbourne NPCs of   Whiterun Hold 
* Northbourne NPCs of   Winterhold 
* powerofthree's   Papyrus Extender for SSE
* powerofthree's Tweaks
* powerofthree's Tweaks   INI File
* Properties Without   Pestering
* Requiem
* Requiem - CCOR Patch
* Requiem - Dragonborn   Patch
* Requiem - WACCF and ACE Patch
* Rudy HQ - More Lights   for ENB SE - Deathbells and Nirnroots
* Scrambled Bugs
* Simple Children -   Updated Textures
* Sky Haven Temple   Gardens - JK's Skyrim Patch
* SkyHUD Fixed
* Skyrim 3D Misc - Butterchurn
* Skyrim 3D Misc -   Chopping Block and Axe
* Skyrim 3D Misc -   Dining Set
* Skyrim 3D Misc -   Giant Mortar and Pestle
* Skyrim 3D Misc -   Mammoth Cheese
* Skyrim 3D Misc -   Markarth Cage
* Skyrim 3D Misc -   Traps
* Skyrim 3D Misc -   Winterhold Gate
* Skyrim 3D Misc -   Woven Fence
* Skyrim Special   Edition Upscaled Textures (SSEUT) - Armor
* Skyrim Special   Edition Upscaled Textures (SSEUT) - Plants
* SkyUI AIO Survival   (SAS)
* Sounds of Skyrim   Complete SE - Fox Hotfix
* Spell Research -   Requiem 5 patch
* SSE Engine Fixes (Part 1)
* Stormcloak Rebellion   Refine 
* The Eyes Of Beauty SSE - Elves
* Thieves Guild   Requirements SE
* True Directional Movement
* Unofficial Material   Fix - High Poly Project patch
* UNP Female Body Mesh
* Water for ENB
* Whiterun Hold Refine   



</details>

### Removed Mods
<details>
  <summary>Click to expand!</summary>

* alduins wall retexture - concept   art
* All Geared Up   Derivative SE - AllGUD
* AllGUD Conditions Fix
* Arvak - Legendary   Edition
* Better Dynamic Snow SE
* Better Men of Skyrim   SE
* Better Men of Skyrim SE - Plugin Fix
* Bijin AIO UNP   NeverNude Patch
* Bijin NPCs SE
* Bijin Warmaidens SE
* Bijin Wives SE
* Borgut1337's Dual   Wield Parrying Non-SKSE Random Attacks (Oldrim conversion)
* CleverCharff's Soul Cairn 2K - Voeille's Version
* Column3
* Courageous Women of Skyrim AIO
* Dandy Husbands
* Disable Cinematic Kills
* Dovah Sonaak Dragon   Priest Masks
* Dynamic Things Alternative
* Enchantment Reload   Fix SE
* Enhanced Skyrim Factions - The Companions Guild
* EulogySC NPCs - Full   version
* FadingSignal's Hide UI - Improved
* Fresh Faces - SSE
* High Quality Tintmasks for 3DNPCs
* High Quality   Tintmasks for Immersive World Encounters
* High Quality Tintmasks for JKs Skyrim
* High Quality   Tintmasks for Relationship Dialogue Overhaul
* High Quality Tintmasks for Vanilla NPCs
* Housecarl Companions   Refine
* Immersive Animations
* Improved Bards -   Special Edition
* Jarls Re-Imagined Redux
* Kalilies NPCs 4.2
* Majestic Mountains - BDS With LOD Fix
* Male Npc Overhaul SE
* Males of Skyrim
* No More Creation Club   News
* Not Quite Vanilla NPC Overhaul - Argonians
* Not So Fast - Mage   Guild
* PAN_Brelyna
* Pandorable's   Black-Briar Ladies
* Pandorable's Initiates
* Pandorable's Lethal   Ladies
* Pandorable's NPCs
* Pandorable's NPCs -   Males
* Pandorable's NPCs - Males - Faendal Hotfix
* Pandorable's NPCs -   Males 2
* Pandorable's NPCs Dawnguard
* Pandorable's NPCs   Dragonborn
* Pandorable's Valerica
* Pandorable's Warrior   Women
* Project Clarity - Creature Textures Redone
* Project Clarity -   Vanilla Armor Textures Redone
* Remove Enemies from Compass
* Shield Sisters   Re-Imagined SE
* Shield Sisters Re-Imagined SE - Iona Jordis Illia   Hotfix
* SkyHaven HD by   CleverCharff 2K
* Skyrim Realistic Overhaul 1.8 Update
* Skyrim Realistic   Overhaul Part 1
* Skyrim Realistic Overhaul Part 2
* Skyrim Realistic   Overhaul Part 3
* Spell Research - Patch Compendium
* Spell Research -   Realistic Trading Stocks of Skyrim (with DnD Spellcasting Service) patch
* Taarie and Endarie Re-Imagined
* Taarie and Endarie   Re-Imagined - Reduced Tintmasks
* Taarie and Endarie Re-Imagined Plugin Hotfix
* The Eyes of Beauty   SSE - Vampires
* The Ordinary Women SSE
* The Ordinary Women   SSE - USSEP ESP
* TM Thalmor Overhaul SSE
* Underwater Treasure   SSE (Sea Rivers and Lakes version)
* Vahdin - Female Npc Replacer
* Wearable Lanterns
* Wearable Lanterns - SE and VR Patch
* WICO - Windsong   Immersive Chracter Overhaul

</details>

### Download folder cleanup - Can be done pre release
<details>

* Wildlander-Output-Full_1-0-0
* Wildlander-Output-NPC_1-0-0
* Wildlander-Output-Core_1-0-0
* Wildlander_1-0-0
* All files starting Skyrim_Realistic_Overhaul
* All files starting Bijin 
* All files starting Bijin 
* All files starting PAN
* All files starting Pandorable
* All files starting ESFCompanions
* All files starting DynDOLOD Resources SE 
* All files starting Shield Sisters Re-Imagined
* All files starting The Ordinary Women
* All files starting Water for ENB-37061
* all files starting Northbourne NPCs
* Elwaps SpeedTree
* Courageous Women - AIO-50812-1-3-1623989902
* Jarls Re-Imagined Redux-49229-1-1-1619705097
* WICO Special Edition - UNP 0.9f-2136-0-9f
* Kalilies NPCs-30247-2-4-1613495939
* Better Men of Skyrim-18976-4-1-1594738270
* EulogySC NPCs - Full version-37195-1-6-1612424110
* Heljarchen Farm Revamped - V2.02-4108-V2-02-1607815767
* SkyHaven HD by CleverCharff 2K-34359-1-0-1586040136
* Wearable Lanterns - VR Patch-19348-1
* Wearable Lanterns 4.0.3 Release-7560-4-0-3
* True Directional Movement-51614-1-4-3-1632340170
* TM Thalmor Overhaul NPC REPLACER and FOLLOWER CLONES SSE-1-0.7z-31242-1-0-1577299987
* Thieves Guild Requirements - FISS Version-33256-4-0-1584196877
* Taarie and Endarie Re-Imagined UNP-44277-1-0-1610457821
* Taarie and Endarie Re-Imagined Plugin Hotfix-44277-hotfix1-1610490485
* Scrambled Bugs-43532-14-1633526767
* Obscure's Faces of Winterhold-25691-1-2-4-1578532390

</details>