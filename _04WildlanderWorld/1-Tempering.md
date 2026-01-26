---
layout: default
title: Tempering
nav_order: 1
description: Tempering weapons and armor to improve their effectiveness
---

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

## Introduction

Both Armor and weapons durability within wildlander make tempering your equipment relevant. 

The higher the durability on the weapon, the more damage it does. 

The higher the durability on the Armor, the more protection it gives. 

Tempering is shown in your inventory with a Tier description. ( currently disabled by default in 1.1.11 - see known issues below for a fix) 

![image](https://user-images.githubusercontent.com/26418143/156928089-14acb6eb-fff6-4755-b51b-908b8e7ee454.png)


You can temper/repair your own weapons with your smithing skills at the grindstone, and armor at the armor workbench. You can also ask the blacksmiths to “upgrade your equipment”. In order to repair your damaged weapons and armor back to “standard” temper, you need to have the perk for the material the piece is made from and sufficient skill in smithing. The Minimum skill to enable tempering is 15 smithing. If your smithing skill is lower than this, then you cannot temper at all. Likewise if your only just have enough skill to "unlock" a material perk, you might not be able to temper it until you improve your skills. This is especially the case with "found gear" as it can already come pre-tempered (up to just below High-grade).

Iequip icons on your UI can be edited to give a visual representation of how close your weapon is to dropping a temper tier.

![image](https://user-images.githubusercontent.com/26418143/162575241-b21c12f0-6c18-471f-b919-4bcdf9cfb0a1.png)

### In Summary 

The way tempering works is to increase the durability number of the item. The higher your smithing skill, the higher the durability number you can get. A newly crafted item will always have a durability number of 100. Using the item will decrease the durability, tempering it returns it back to the maximum durability your (or the blacksmith's) Skill allows. Tempering durability is divided into tiers to show the approximate state of your durability from the UI.

The Maximum durability is affected by your current blacksmith skill and nothing else. 

The loss of durability is by the materiel its made from, better materiels degrade slower.

Even with 100 smithing skill, you won't be able to temper a item if you don't have the item's material perk.

## Known issues

**SkyUI group hotkeys not working after weapon is tempered**

This is caused by a mod conflict -  For this function to work properly, you need to disable (from MO2) the mod "Improvement Names Customized SSE". Simply untick this mod in MO2, it is in the left side.

What this will do
* Allow tempered weapon / armor Skyui groups to work.
* re-enable tempered tier descriptions (e.g Well-made)

What it will not do
* Keep items in groups when you temper or they drop a tier - you will simply need to re add them to the group.
* Show the "numeric" durability of the weapon/armor 


## Temper Tiers

Temper tiers is based on the % durability of your item, when compared to a newly crafted weapon at 100% durability. Unless you are willing to utilize spell research to craft fortify Smithing potions (from elixers), and have specific smithing gear enchanted with fortify smithing, and are at 100 Smithing skill - you should not expect masterwork or legendary temper tiers .

Low%|High%|Label| Damage/protection of item
|--|--|--|--|
0|20|Ruined   | Item Has No Damage/Armor
21|40|Broken  | 20% of base
41|60|Damaged | 40% of base
61|80|Chipped | 60% of base
81|95|Blemished | 80% of base
95|100|Normal | Base 
101|210|Well Made| 0-11 Bonus Damage/Armor
211|330|High Grade|12-23 Bonus Damage/Armor
331|450|First Rate|24-35 Bonus Damage/Armor
451|570|Exquisite| 36-47 Bonus Damage/Armor
571|690|Master Work|48-59 Bonus Damage/Armor 
700|Onwards|Legendary| 60 Bonus Damage/Armor Minimum

How do you improve Temper tiers that you can do?
* Improve your Smithing skill.
* Pick up the smithing perk for the materiel you are working with.
* Use Elixirs of fortify smithing & enchanted gear.
* have the advanced blacksmith perk.

## Degrade Rules 

* On hit a random piece of armor is degraded.
* Shields only degrade when blocking
* Weapons degrade on contact with anything (not just enemies).
* Daedric items do not degrade.
* The better the materiel the slower it degrades
* Durability loss for weapons is calulated by the base Weapon hit 0.2% or power attack hit of 3% multiplied by the Weapon materiel table below.
* Durability loss for armor is calulated by the Armor type Multiplied by 0.2% Weapon hit multiplied by the Armor materiel table below.

E.g Hide cuiass

* 1(light armor) * 2.5(Animal Hide)  * 0.2% = 0.5% Durability loss per standard attack

E.g Orcish Weapon

* 1.3(Orcish)  * 0.2% = 0.26% Durability loss per standard attack
* 1.3(Orcish)  * 3%   = 3.9% Durability loss per Power attack

#### Armor Type

|Materiel| Multiplier| 
|--|--|
Light|1|
Heavy|0.7|

#### Armor Material

|Materiel| Multiplier| 
|--|--|
Missing Material|2.5| 
Forsworn|2.5|
Animal Hide|2.5|
Hide|2.5|
Studded|2.5|
Imperial Studded|2.3|
Imperial Light|2.3|
Dawnguard|2.1|
Vampire|2.1|
Falmer Hardened|1.85|
Leather|1.8|
Bear Stormcloak|1.8|
Thieves Guild|1.6|
Chitin Light|1.6|
Elven|1.6|
Scaled|1.3|
Elven Gilded|1.1|
Thieves Guild Leader|1|
Stalhrim Light|0.9|
Glass|0.85|
Dragonscale|0.8|
Nightingale|0.8|
Iron|2.5|
Iron Banded|2.5|
Imperial Heavy|2.3|
Steel|2|
Bonemold|1.9|
Falmer Heavy|1.85|
Dwarven|1.75|
Steel Plate|1.6|
Nordic|1.6|
Blades|1.6|
Orcish|1.3|
Ebony|1|
Stalhrim Heavy|0.9|
Dragonplate|0.85|
Daedric|0.8|

#### Weapon Material

|Materiel| Multiplier| 
|--|--|
Draugr|2.5|
Iron|2.5|
Falmer|2.5|
Imperial|2.2|
Steel|2|
Elven|1.9|
Dwarven|1.75|
Nordic|1.6|
Orcish|1.3|
Ebony|1|
Stalhrim|0.9|
Glass|0.85|
Daedric|0.8|
Dragonbone|0.8|

---

## Next Steps

1. **Read [The Economy](https://wiki.wildlandermod.com/_04WildlanderWorld/2-The-Economy/)** - Learn regional pricing and trade routes
2. **Read [Essential Adventuring & Travel Gear](https://wiki.wildlandermod.com/_04WildlanderWorld/3-Essential-adventuring-and-travel-gear/)** - Prepare for survival beyond settlements
3. **Read [The Divines & Daedra](https://wiki.wildlandermod.com/_04WildlanderWorld/4-The-Divines/)** - Understand religion and blessings

**Remember:** Better tempered gear means better damage, better armor, and a better chance of survival.


