---
layout: default
title: Heavy Armor Analysis
nav_order: 8
has_children: false
description: Heavy armor skill tree analysis, armor mechanics, and perk progression.
---

## Introduction

### Mass of Equipped gear

Requiem has a complex for calculating penalties, the authors have dubbed it 'The Mass Effect' system, where higher weight typically means higher cost. They use a formula that is difficult to type out, if you have a decent understanding of math you can find it in the Requiem Manual. It affects mobility, spell casting and combat effectiveness. (Outdated-Requiem-Manual p122-133 Located in game-files\Mods\Requiem\Documentation)

#### Stamina Drain

Without having perks in Heavy Armor, you are penalized for wearing it at all and have your stamina drained.

#### Magic Cost

Spell costs in Requiem are based on your weight in a complex formula, you can read about it [here](https://wiki.wildlandermod.com/03-YourFirstCharacter/Magic-Mechanics/#spell-costs).

In Summary - The Spell cost depends on the mass of of the equipment you are wearing. The heavier the equipment the more a spell will cost. Taking the casting perks for heavy armor, offset up to 51% of the penalties for the mass of your gear

#### Speed Modifiers

Without certain perks in Heavy Armor, you are penalized for wearing it and move slower.

#### Attack Speed Modifiers

Without certain perks in Heavy Armor, you are penalized for wearing it and attack slower.

### Leveling

In addition to the vanilla Skyrim XP system for Heavy Armor, There is also a script that adds experience to Heavy Armor (and Light Armor) while you are running (this is how you normally are moving), but if you are sprinting (Holding shift by default) said XP is doubled.

## --Perk Analysis--

![image](https://user-images.githubusercontent.com/26418143/157921477-e9a2e4b6-b731-4a40-a5a6-47003dae882f.png)

### Protection Branch

These perks make you more effective while wearing Heavy Armor.

---

**Conditioning**

After some basic training, stamina drain from wearing heavy armor is negated. Mass of Equipped gear are reduced.

Level Required : 0

Perk Required : None

_Effect_ :

Removes the penalty:  If you are wearing Heavy Armor, 1 Stamina loss per second for every piece of armor tagged with 'HeavyArmor' equipped, this penalty goes up to 5 stamina per second (4 armor pieces plus shield). 

Reduces Mass of Equipped gear by 5%

---

**Relentless Onslaught**

You can sprint in heavy armor at no stamina penalty. Mass of Equipped gear are further reduced. Sprinting in a full set of heavy armor allows you to deflect 80% of all incoming melee damage. 

Level Required : 20

Perk Required : Conditioning

_Effect_ :

Removes the penalty: If sprinting you will take 5 stamina loss per second for every piece of armor tagged with 'HeavyArmor' equipped, this penalty goes up to 20 stamina per second.

Further Reduces Mass of Equipped gear  by 15%

---

**Combat Training**

Heavy armor power attacks require less stamina to execute, and your heavy gauntlets improve unarmed damage based on material. Mass of Equipped gear are further reduced.

Level Required : 25

Perk Required : Conditioning

_Effect_ :

Removes the stamina cost inflation from wearing Heavy Armor and executing a power attack. In a full set of Heavy Armor this translates into half stamina cost for power attacks. 

Adds 10-18 unarmed damage depending on what gauntlets you have equipped, the lowest benefit is Iron, and the highest comes from Daedric.

Further Reduces Mass of Equipped gear  by 15%

---

**Fortitude**

You receive a permanent bonus of 40 stamina and 20 carry weight. Mass of Equipped gear are further reduced.

Level Required : 50

Perk Required : Combat Training

_Effect_ :

Fortify Stamina +40

Fortify Carry Weight + 20

Further Reduces Mass of Equipped gear  by 20%

---

**Power of the Combatant**

Once a day, you can use Power of the Combatant to restore 100 stamina instantly and 25 stamina per second for 30 seconds. Mass of Equipped gear are further reduced.

Level Required : 75

Perk Required : Fortitude

_Effect_ :

Adds a once a day power that when used immediately restores 100 stamina and adds 25 stamina regen per second for 30 seconds.


Further Reduces Mass of Equipped gear by 10%

---

**Juggernaut**

Armor rating is increased by 10%, weight is reduced by 15%, and incoming stagger effects are reduced by 90%, provided you are wearing a full set of heavy armor. Mass of Equipped gear are also further reduced.

Level Required : 100

Perk Required : Power of the Combatant

_Effect_ :

Increases Heavy Armor rating by 10%

Reduces incoming stagger damage to 1/10 of its original value (Requires at least 3 pieces of Heavy Armor to be worn), 

Decreases Heavy Armor weight by 15%. Does not get applied to shields.

Further Reduces Mass of Equipped gear by 10%

---

### Battlemage Branch

This branch makes you more effective at casting spells while wearing Heavy Armor.

---

**Combat Casting**

Your concentration is less affected by heavy armor, reducing penalties for Novice and Apprentice spells.

Level Required : 25

Perk Required : Conditioning

_Effect_ :

Reduces the cost of Novice and Apprentice spells by 51% for each piece of Heavy Armor you are wearing. 

---

**Combat Trance**

You are less distracted while wearing Heavy Armor, allowing you to cast Adept spells at almost no penalty.

Level Required : 50

Perk Required : Combat Casting

_Effect_ :

Reduces the cost of Adept spells by 51% for each piece of Heavy Armor you are wearing. 

---

**Combat Meditation**

You barely notice your heavy armor. Casting penalties are reduced for Expert spells.

Level Required : 75

Perk Required : Combat Trance

_Effect_ :

Reduces the cost of Expert spells by 51% for each piece of Heavy Armor you are wearing. 

---

**Battle Mage**

Your heavy armor is like a second skin. Casting penalties for Master spells are significantly reduced. Magicka cost for all spells is reduced by 15% while wearing a full set of heavy armor.

Level Required : 100

Perk Required : Combat Meditation

_Effect_ :

Reduces the cost of Master spells by 51% for each piece of Heavy Armor you are wearing. 

---