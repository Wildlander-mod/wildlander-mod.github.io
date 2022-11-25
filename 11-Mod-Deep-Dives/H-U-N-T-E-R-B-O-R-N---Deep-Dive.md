A mod for the hunter who has nothing.

## Introduction

Hunterborn changes the simple routine of kill-and-loot on animals into something more immersive.  The most significant change Hunterborn makes to the game is taking away the loot window from most wildlife. Instead, you must first choose whether to dress it (clean the carcass and prepare it for processing) where it lies, or pick up the carcass and take it back to your camp / lair / nearest vendor. When you drop the "carcass" from your inventory, the original animal's body will appear at your feet, where again you have the choice to dress it, or pick it back up.

Note: Carcasses are heavy. While you can easily pick up several rabbits, foxes, skeevers and the like, you will struggle to carry more than just one elk carcass, and you may not be able to lift a bear or a cow at all. 

After dressing a carcass, you're able to skin it, harvest it for ingredients like antlers, eyes, teeth, even hearts, and also butcher it for meat.

By default each of these actions takes time, and requires practice to improve proficiency. 

You can optionally smith, buy or have a blacksmith craft hunting knife(s) for yourself to get better results when skinning, harvesting, and butchering. The hunting knife is meant to represent a tool specific to the job - not a replacement for a combat dagger - and some of the higher quality knives also give bonuses or... other effects. By default a hunting knife isn't required since it puts a little more load on the scripting system. See the hunting knives section for more information.

Hunterborn includes two other notable features: Monster Hunter, and Foraging. With Monster Hunter, you can apply the same process for animals to monster-type creatures, like trolls and even dragons. For monsters, you have the additional options to sometimes extract blood or venom, and search the corpse for treasure. Forage is a skill (ability) that can provide useful materials from your surroundings, depending on the kind of terrain you're in; you may forage up some edible wild plants, or local alchemy ingredients, or firewood, and so on. You can even gain proficiency in foraging and choose to search for specific resources, for a truly nomadic style of play: Carry only the essentials with you, and find or hunt whatever else you need, wherever your adventures may take you.


## MCM options

Hunterborn is designed to be highly configurable, but you can also run it without having to configure anything. Just open the MCM, start Hunterborn, and go hunting.

Want less meat? Want the material drops from a different mod? Want your pelts to sell for more with Economics of Skyrim configured for Inconceivable? Read on...

[ Features ]

Time
----
By default when you field dress, skin, harvest, or butcher an animal, it will take time to complete. How much time is determined by a formula and you do get faster with experience (see the sections below), but if you'd rather that one or more of these actions never takes any time at all, you can toggle each of them with these options. Foraging can also be toggled; when on, using the Forage ability takes 1 game hour.

Small game
----------
You can take away the Hunterborn interface for various small animals, here. For example, if you consider it more of a hassle than a feature to pluck and butcher a chicken, just uncheck that option. Note however that, with the exception of chickens, Hunterborn does add new processed goods to each of these animals - and some of them could be quite useful.

[ Tweaks ]

Default actions
---------------
When clicking on ("activating") a carcass, Hunterborn by default shows you a menu of options. You can change this default behavior, and use a different default behavior when you're sneaking, with these options. The first two control the default action for a newly-slain, "fresh" carcass. The second two options control the default action for a carcass you have "cleaned" by field dressing it.

The option to "Process" is available for a dressed kill. This conveniently combines skinning, harvesting, and butchering; but be cautious with this option at lower levels, since a large amount of game time may pass when processing bigger carcasses. If your default action is Process and you click / activate a carcass that has been completely processed, the carcass will be disposed.

Note that for monsters (see Monster Hunter, below), most of these options have no effect. The Process action can be used as a substitute for Search.

Presets
-------
Here you can change options for the goods that animals yield, as well as one for hunting knives:
* Pelt values: If you have a mod that boosts or reduces merchant trading prices, it may help to configure pelt values accordingly.
* Material yield: If you want more or less miscellaneous materials from animals, like teeth and claws and bones, change this option to suit.
* Meat yield: Hunterborn can give you a realistic amount of meat from a carcass, down to just a single cut of meat. You can even pick a custom %, based on animal weight.
* Knives at merchants: If you want to buy hunting knives from various merchants, you can adjust how easy they are to find (including the more powerful versions).

Realism
-------
Several options that are intended to make Hunterborn more 'realistic'. They may just be more hassle than they're worth for some players, though, so Hunterborn lets you toggle each on or off.

* Re-weight vanilla meat: Sets the weights of default raw meats, like beef, to something more realistic. (Beef goes from 0.2 to 2.0.) Naturally, this affects how many individual cuts of meat you receive when butchering.

* Remove Manual Loot option: Normally when you first activate an animal carcass (before cleaning it) you'll have an option on the menu to manually loot it - this is a safeguard in case there's a quest item on the animal or you just want a way to access loot in case of problems with the mod. You can remove this option from the menu for immersion purposes, here. Note that you do not need to use manual loot to retrieve spent arrows from a carcass; field dressing the carcass does this automatically.

* Prevent oversize stashing: When this option is checked, you cannot "stash" a carcass (put it into any container) if the animal is bigger than a certain size. Hunterborn can't determine the size of a container, so it's still possible to store a fox inside a jewelbox, if you wished.

* Prevent overburden pickup: This option does two things, both affecting when you can "pick up" an animal carcass. First, if you are already overburdened you will not be able to pick up any carcasses. This is different from Skyrim's own default burden rules, which allow you to keep piling on loot with no limit, only at the cost of limited speed. Second, you will never be able to pick up any carcass that weighs more than your burden limit x 1.5. So for example, if your carry limit is 200, you cannot pick up a carcass weighing more than 300.

* Prevent use in combat: Normally Hunterborn will not present its menu if Skyrim detects you are in combat or enemies are nearby. This prevents an unexpected loophole: Since time passes when you dress / skin / harvest / butcher (if you have those options configured), you can escape combat by using these actions on a carcass. You may need to turn this option off temporarily if you are "stuck" in a combat state, though. This option also controls the Forage and Player Crafting menus.

* Require cookbook for obscure recipes: This option removes the requirement to find and read a certain book to gain access to a set of unusual recipes. (See the spoiler readme if you want full disclosure!)

* Require hunting knife: This option is off by default to improve script performance. Turning it on and using higher level hunting knives will definitely improve your results (as well as immersion!) so it's recommended if you have a machine powerful enough to run the game on its high settings. See the special notes for Frostfall near the top of this guide for advice on scripting performance, and see the section on hunting knives below for more information on how they work.

* Claws work as hunting knife: If you've got the above option checked, you can also instruct Hunterborn to treat Khajiit and Argonian claws as a crude form of hunting knife. This can be very useful for a starting character of these races, since you can begin skinning and harvesting immediately without having to buy or forage for a tool.

* Show screen blood: Certain actions on a carcass will throw a little blood onto the screen with this option on. Tidy hunters may toggle it off.

* Use animation for actions: On by default, this option causes your character to run a short 3rd-person animation whenever dressing, skinning, etc. Also applies to Monster Hunter. Note that Skyrim's animation system can get "stuck" when two different scripts (or mods) are trying to control animation at the same time. Try turning this option off if your character can't attack or sheathe / unsheathe after working on a carcass. Turning this option off may also slightly improve scripting performance.

* Enable bounty perk of foraging: At foraging level 5 and higher, this built-in perk provides a chance at extra ingredients from flora (like flowers and mushrooms, but also nests, hanging rabbits, and so on). This option is disabled by default since many other mods also provide similar functionality, but it's a recommended feature otherwise!

A note on "stashing": When you store an animal carcass inside of a container - for example, if you put a rabbit carcass into a chest at your camp - Hunterborn will no longer link that carcass to its original slain animal. Most of the time this won't matter and you shouldn't worry about storing small carcasses for later processing or sale. However, you will not be able to retrieve arrows from that carcass or use "manual loot" on it for any other custom loot that it had; it will revert to having the default loot for its species.

[ Hotkeys ]
I do not recommend anything in this section be changed as in wildlander some features have been reused for other functionality.

[ Stats ]

Proficiency
-----------
Hunterborn has three different "skills" which you can level up: Skinning, Harvesting, and Foraging. (There is a fourth, "hidden" system for Strange Brew, you can find details about it in the spoiler readme if you so choose!) Your current level in each is listed here, as well as how many total animals you have cleaned (with field dress). More cleans mean you work faster (dressing / skinning / harvesting / butchering), simply because of hands-on experience. Your Skinning level also makes you faster at skinning, and gives you a better chance at a higher quality pelt. Your Harvesting level makes you faster at harvesting, and gives you a better chance at higher quality materials - it is also used as a requirement in several Player Crafting recipes (see below). Your Foraging level does not make you faster at foraging (you will always spend 1 hour of time foraging), but does increase your chances of finding any materials (even in harsh terrain) and allows you to forage for specific resources, like firewood or alchemy ingredients from local flora. If you use Sense Direction, your sense gets more accurate with levels in foraging, as well.

Times
-----
This shows an example of how long it would take your character to dress, skin, harvest and butcher an average-size carcass - a deer. As noted above, these times go down as you accrue cleans and levels; see the sections below for more information. These estimates take into account your current hunting knife, if you've turned that requirement on.

Experience
----------
Use this feature if you've decided your character has a background in hunting and should have several levels in Skinning / Harvesting / Foraging already. You can also use this feature to experiment, then reset yourself back to zero with the "Novice" choice.

[ Monster Hunter ]

Monster list
------------
If you want to use Monster Hunter but only for certain monster types, toggle them on and off here. Dragons in particular may be troublesome with Monster Hunter, depending on other mods you have installed.

Options
-------
Tweaks for Monster Hunter. Currently there's only one:

* Corporeal dragons: When toggled on (requiring that you have dragons enabled on the monster list), you can extract blood, butcher meat, and harvest fleshy parts (eyes, heart) from dead dragons. This may seem a little unusual in the default game, where dragons are reduced to skeletons when slain - though there is at least one mod which keep the dragon's original appearance, named Dragon Remains. These additional components, particularly Dragon's Blood, can be fairly powerful: They are balanced with high-risk mods like Deadly Dragons in mind.


## Field dressing

The first step in rendering down an animal for its goods is to "dress", or "clean", the carcass. This is a simple process that eliminates the most common causes of meat spoilage, and usually involves exsanguination. When first started, Hunterborn assumes that you are a novice hunter with no experience, so the first time you field dress a carcass, it will take a lot of time, especially if it's a larger carcass.

You'll get faster at dressing every single time you complete the action, until after a couple dozen repetitions it will take only minutes (of game time) to get it done on even an elk.

The other variable that affects how long it takes to dress is your knife. 
- With no knife at all, it will take much longer to dress a carcass, even with experience.
- If you are a Khajiit or Argonian, you can use your claws to defer this penalty, by turning on another option in the MCM.
- Crafting or buying a hunting knife is your best option, since these knives also assist with skinning, harvesting, and butchering.

As a last resort (or as a "bootstrap" option), if you are stranded in the wilderness with no supplies, use Forage until you discover a sharp rock. This will be your "knife" until you can get something better.

See the hunting knives section for more information.

The time required to dress / skin / harvest / butcher a carcass has two components.

First, you receive a penalty equal to 3 * (20 - total cleans). This represents extra time needed due to inexperience, and comes down to zero at 20 or more cleans completed. If using a sharp rock, an additional 30 minute penalty applies. If using no tool at all (no claws, no rock, no knife) an additional 45 minute penalty applies - but only if you have turned on the hunting knife requirement. With the hunting knife requirement turned off (the default), Hunterborn always uses a baseline of the iron hunting knife.

Second, the size of the animal determines how long the action itself takes.

Sizes
-----
Size 1: Chicken, hare, mudcrab, skeever, slaughterfish.
Size 2: Deer, dog, elk female, fox, goat, giant mudcrab, wolf.
Size 3: Bear, elk male, horse, sabre cat. Chaurus, frostbite spider.
Size 4: Cow (due to bulk).
Size 5: Cave bear, snow bear, horker (due to bulk). Giant frostbite spider, troll, werewolf.
Size 7: Mammoth. Dragon.


## Skinning

After dressing the carcass, usually the next step is to skin it - though you can choose these actions in any order, and skip any of them as well.

Skinning will also take time, and again you will get faster as you dress more animals. You will also gain experience that Hunterborn tracks as your "skinning level" (shown in the MCM), and your skinning level also makes you faster at skinning. Additionally, it improves your chances of getting a better quality pelt. At levels 9 and 10, if you are using a very high quality hunting knife, you have a chance to skin a flawless pelt. These can have *very* high values, meant as trophy merchandise rather than crafting fodder.

The same caveats apply with hunting knives, as noted above for field dressing.

Use the tanning rack to turn poor quality pelts into leather straps. Fine pelts can be turned into two of the standard quality pelt - this is mainly for compatibility with quests and other mods (especially Frostfall) where you may need the pelt specifically, not leather, to craft certain goods. With the Frostfall patch, you can also render pelts (of any quality) into cleaned hides, using Survival Skills.


## Harvesting

Besides the pelt and the meat of the carcass, all animals will have valuable materials that you can harvest from them. Most of these materials are alchemy ingredients, and Hunterborn adds many new custom ingredients for you to harvest and use in the creation of poisons and potions - and the effects on these custom ingredients have been designed to be specifically useful for hunter-style play. Some of them are even unique to Hunterborn; you can get all the information on these new effects in the tips and spoilers readme.

Just like skinning, harvesting takes less time after you have dressed down more carcasses, and you will get better (higher quality, and more) results as your harvesting level increases. Again, a hunting knife can also make a difference if you've turned that feature on.

Most animals will also give you bones, which aren't an alchemy ingredient for a item you can use to craft primative weapons.


## Butchering

Hunterborn adds new custom meat types for all of the hunting game in Skyrim - and even for monstrous creatures like chaurus and dragons, if you have Monster Hunter enabled. Elk will have a distinct kind of venison, foxes and wolves have their own meat, and even mudcrabs and slaughterfish can now be a source of sustenance. 

Hunterborn also provides you with as much meat as you deem necessary from your kills, which you can configure in the MCM. At the "realistic" setting, you will receive ~50% of the animal's weight in meat. For a deer, that's 100 "pounds" of meat! The realistic setting is definitely worth trying if you'd like to fully immerse yourself in the hunter's experience, since managing all of that extra meat (probably selling off what you don't need) becomes part of that play style.

For animals that yield a lot of meat, Hunterborn will break apart the butchering process into sections. Each section will be a maximum of about two in-game hours, and your butchering results will be however much meat you were able to process in that much time. Again, you get faster as you dress down more animals, and certain hunting knives will also make you faster (but not "better", since there is no "quality" of meat in Hunterborn) at butchering.

If you want to butcher only the first section of the animal, just dispose of the carcass after you're done. In effect, you're leaving the remains for the wolves... wolves have got to eat too, right?


## Foraging

Use this ability to search the surrounding terrain for useful materials - which can include edible plants, local alchemy ingredients, animal bones, and some miscellaneous items such as wood. The materials you find will be based on the environment - herbs and edibles are plentiful in the south, while north and at higher elevations it will be difficult to find much of anything.

Foraging is a skill in Hunterborn, like skinning and harvesting, so that when you first attempt to forage, your chance of success is pretty low. As your skill rises (to a maximum of level 10), you're more likely to scrounge up useful goods, though your chances are always much lower in harsh (snowy) terrain. Foraging takes one hour of game time, you don't get any faster at it as your level goes up, you just make better use of your time. You cannot forage in cities or indoor locations, though some caves are considered "outdoors" (usually they're open to the sky) and can be foraged.

After you gain your first level in foraging, you'll be prompted for specific resources to look for. At first you won't have many options - just firewood - but you'll have more choices are your forage level goes up. From about level 5 and on, you'll also have a chance to find superior results that can include rare alchemy ingredients, precious animal bones, and edibles that are nourishing enough to completely replace a carnivorous diet!

Note that if your foraging succeeds, there is a fair chance you will also turn up a sharp rock, which will be a necessary (if crude) tool for dressing and skinning, if you are lost in the wilderness without even a dagger or hunting knife.

There are two additional perks to leveling up foraging: Bounty, and Botany. Bounty is disabled by default but can be enabled in the MCM. It provides a chance for extra ingredients when harvesting from flora in the game world. Botany's effects start at foraging level 6, and work identically to the Experimenter perk: Foraging 6 allows you to learn two effects when consuming an ingredient, foraging 8 is three effects, and foraging 10 is all four effects.


## Player Crafting

This is a crafting system unique to Hunterborn and been expanded upon in wildlander, intended to provide multiple uses for the bones you harvest from animal (or monster) carcasses. Although there are not a great many Player Crafting recipes, the items you can craft can be very useful at low levels, especially in a game configured for less loot and a tough economy. Consequently, most items are not very powerful and won't make you a lot of money, although at higher levels (in your Harvest skill) you will be able to craft a few more potent weapons and arrows.

Using the ability doesn't require any furniture like a forge or tanning rack, but does require that you have one of the Hunterborn hunting knives in your inventory if you've made knives non-optional in the MCM. Thus, the easiest way to get started is to craft or purchase an iron hunting knife. However, if you're stranded in a remote area or have no access to the materials or septims you'd need for an iron knife, forage until you've found a sharp rock; use this for scrimshaw, with which you can subsequently craft a bone or stone hunting knife.

Which items you can craft depends on your harvesting level, which represents your skill and knowledge with the bones and organs of animals, and to a certain extent your manual dexterity in working with them. There are several categories of items you can craft with scrimshaw: Bone bits, arrows, weapons, hunting knives, engraved bones, bone amulets, and bone rings. Outside of these categories, there are also cache markers, the flute (merely a flavor item in the vanilla game), and Frostfall's own mortar and pestle.

Some additional crafting recipes only show up in Player Crafting under the right conditions. Check the spoilers readme for full details, or try experimenting!

Bone bits are a material requirement for other Player Crafting items, including most of the metal-based hunting knives at a forge, though with Player Crafting itself you can craft a bone or stone hunting knife as a crude basic necessity. Bone arrows also use bone bits for the heads.

Bone arrows can be created using either firewood or larger animal bones; the latter recipe is specifically for Bosmer characters who have a taboo against using wood, but it's also suitable if you just don't have any firewood on hand. The first bone arrows you create will be inferior even to iron arrows, but as your harvesting skill rises the quality of your arrows does too, until at a "perfect" level they rival even elven craftsmanship and stopping power.

Bone weapons - axes, swords, and bows - are initially crude, and no more powerful than the Forsworn variety they mimic. The most powerful of them, perhaps, is a massive bludgeon crafted from the bone of a mammoth. These are all apprentice level recipes. However, at higher levels you can craft Masterwork versions of these weapons, which are suitable for mid-level characters. Bone weapons cannot be tempered.

Engraved bones, accessible even to a novice hunter, are crude objects of worship and sacrifice to the gods. In the wilderness, these can be used almost like the shrines you find in cities, capable of bestowing bonuses or removing certain diseases - but the gods are not apt to cure a disease not in their domain of oversight, and even the right god isn't always listening to the prayers of mere mortals!

Bone amulets and rings are similar in purpose to the enchanted amulets and rings you are more likely to encounter at higher levels. These are much weaker and more ordinary, and are bound to be replaced as your gear is upgraded. Apprentice levels in harvesting are needed to gain access to these recipes.

You can also Roast Food, It needs no furniture, although you must be standing close to a heat source - almost all of the game's fires should count (should you find any which don't work - please submit a bug report).

When you're first starting out or if circumstances become particularly dire, you may not have a ready means of cooking food in the wilderness. You need to have a cookpot (crafted at a forge using steel, or purchased from a merchant) before you can feed yourself at all, although you can take your chances with raw meat. Primitive cooking needs only a fire, although you'll be limited mostly to seared meat that isn't as nourishing (or appetizing, after a few days).


## Hunting knives

Using a hunting knife for dressing, skinning, harvesting, and butchering is recommended in Hunterborn, but it isn't required. By default, Hunterborn uses a baseline assumption (equivalent to an iron hunting knife) for any operation that uses a hunting knife. The information below only applies if you've turned the hunting knife requirement on, in the MCM.

As a Khajiit or Argonian, you can use your claws as a substitute knife, by checking the relevant option in the MCM. Claws are actually just as good as a steel hunting knife for skinning and harvesting, better than iron, because of the dexterity and experience your character will have with their own claws. However, you can't use claws for scrimshaw.

If you're starting with nothing (and have no claws), you should forage until you find a sharp rock. The rock won't have any bonuses or penalties, though it will require extra time to dress, skin, harvest, and butcher.

Without even a sharp rock, you will incur a heavy penalty for skinning and harvesting, and often end up with useless results. Butchering, though, won't be affected.

You don't need to choose which knife Hunterborn will use - it will automatically pick the best from your inventory.

Note that hunting knives have inferior damage compared to their combat dagger equivalents - they also aren't as valuable, making them inferior as a crafting commodity. The hunting knives range in quality from bone to stone to iron to steel to dwarven / elven to orcish to glass to ebony to daedric to dragonbone. All of these can be crafted (bone and stone with scrimshaw), and require the corresponding smithing perks. They can also usually be purchased from Hunters and from blacksmiths (honed metal will also allow you to commission these for production).

Knife    	|Skinning	        |Harvesting	|Other Effects|
|--|--|--|--|
Claws		|10			|0			|
Sharp rock	|0			|0			|+30 minutes to D/S/H/B
Bone		|0			|0			|25% chance to break when used.
Stone		|0			|0			|
Iron		|0			|0			|
Steel		|10			|0			|
Dwarven		|10			|10			|
Elven		|20			|-10			|
Orcish		|-10			|20			|Butchers twice as fast.
Glass		|0			|0			|50% chance of doubled pelt / mats. (Including eyes, heart.)
Ebony		|30			|0			|10% chance summon Shade of Hircine when skinning.
Daedric		|30			|20			|5% summon Aspect of Hircine when skinning / harvesting.
Dragonbone	|40			|40			|Butchers twice as fast.