---
layout: default
title:  Resistances & Weapon Types
has_toc: true
nav_order: 8

parent: Your First Character
description:  Resistances & Weapon Types
---

## Resistances & Weapon Types

### Resistances List

List of basic resistances used in Skyrim.

|Type 	|	Cap|
|--|--|
|Damage (Armor Rating)| 	 	80%
|Poison| 	 	90%
|Fire  |	 	90%
|Frost |	 	90%
|Shock |	 	90%
|Magic |	 	90%

About AR (Armor Resistance) Values
-  1 point reduces incoming physical damage by 0.1%. So 800 AR will reach the 80% cap when not considering Armor Penetration.
-  1 point of Armor Penetration (AP) effectively reduces target AR by 1%. This means striking target with 500 AR with 10 AP makes the effective AR 450, making the target take 45% reduced damage not 50%.
-  The AR cap applies after applying AP.

About AP (Armor Penetration) Values
Melee attacks and ranged attacks can penetrate armor, which reduces the effective armor rating and thus damage reduction of the target.

- Per point of armor penetration will bypass 1% of the target's armor rating with ranged attacks and melee power attacks. Standard melee attacks will bypass 0.5% of the target's armor rating per point of armor penetration. The maximum which can be bypassed at most 80% of the target's armor rating. 

- In ranged combat the ammunition used plays a key role for armor penetration. You can see the arrow guide <a href="https://docs.google.com/spreadsheets/d/1Xp1LE79R4uHC2yP7KkA2p1sS-l_TkaRAQfdHV4t0aOM/edit#gid=0" target="_blank" rel="noopener noreferrer">here <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

About Magic/Elemental Resistances Values.
- Magic Resistance protects against all magic damage including elemental magic such as fire, frost and Shock .
- The effect of magic resistance is  multiplicative when combined with elemental resistance. Let's say you have 90% magic and fire resist. This will mean that you only receive (100%-90%) * (100%-90%)= (10% * 10%) = 1% fire damage, which is equal to 99% fire resistance. This also means that your effective resistances raises exponential as your resistance %'s become higher.
- Magic resistance protects you from Shouts, Fears and other none elemental spells E.g those in the illusion tree. 
- Unlike Vanilla, NPC's can have both elemental resistance and magic resistances.
 
### Damage Types

Damage Types implemented by Requiem. Weapons are assigned one damage type, and Creatures are Sometimes given extra Damage Type Resistances that function as extra Armor Rating against each damage types.

|Type |	Default Source |
|--|--|
|Slashing |Sword, War Axe, Greatsword, Battleaxe
|Blunt 	|Mace, Warhammer
|Pierce |Dagger
|Ranged |Bow, Crossbow

|Rank |Bonus Armor|
|--|--|
|1 |60
|2 |120
|3 |180
|4 |240
|5 |300