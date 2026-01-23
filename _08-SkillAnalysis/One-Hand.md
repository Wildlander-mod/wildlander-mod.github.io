---
layout: default
title: One-handed Analysis
nav_order: 13
has_children: false
description: One-handed skill tree analysis, combat mechanics, and perk progression.
---

## --Mechanics--

### [ Attack Stamina Cost ]

In Requiem, attacks with weapons cost a bit of stamina. The cost differs wih 1H / 2H, and scales with weight of the weapon. Meaning, a dagger will cost less stamina per swing than a mace.

Depending on your One-handed skill level, the Stamina cost for attacks with One-handed weapons will decrease more : at 100 One-handed skill, it will cost 1/4 of what it takes at 0 One-handed skill.

### [ Perk Bonus Calculation ]

Attack Speed bonuses are additive for each perks. If you have Flurry (Rank 2) and Sword Focus (Rank 3), the bonus is : 25% (Flurry) + 24% (Sword Focus) = 49% faster attack speed.

Power Attack damage bonuses are multiplicative for each perks. If you have Powerful Strikes and Storm of Steel, Power Attacks do : 1.2 (Powerful Strikes) * 1.25 (Storm of Steel) = 1.5 --> 50% more Power Attack damage.

Power Attack cost reduction bonuses are multiplicative for each perks. If you have Penetrating Strikes and Dexterity (in Evasion skill, when wearing no heavy armor), Power Attacks cost : 0.5 * 0.76 = 0.38 --> 62% less Power Attack Stamina cost (38% of original cost).

### [ Armor Penetration when Dual-Wielding ]

When Dual-Wielding different types of One-handed weapons, One-handed Armor Penetration given from Focus perks are halved for each weapon. So if you have unperked weapon in one hand, you'll have even less Armor Penetration than when single-handed.

When Dual-Wielding, Armor Penetration is shared for both hands. So if you have perked Sword and Dagger in your hand, they will have same Armor Penetration.

If you have 14 Armor Penetration for your sword and 30 Armor Penetration for your mace, you will get (14+30)/2 = 22 Armor Penetration.

Exact mechanics: holding any 1h weapon type, 50% of the corresponding focus perk AP is active, the other half is only applied when the other hand holds either nothing (empty) a shield, a magic spell, a scroll or a torch (should be nearly always the case).

### [ Abbreviations ]

* 1H : One-handed (the skill or the weapon type)
* DW : Dual-Wield
* AP : Armor Penetration
* AR : Armor Rating

## --Damage Types--

Damage Types implemented by Requiem. Weapons are assigned one damage type, and Creatures are Sometimes given extra Damage Type Resistances that function as extra Armor Rating against each damage types.

|Type |	Default Source |
|--|--|
|Slashing |Sword, War Axe
|Blunt 	|Mace
|Pierce |Dagger

|Rank |Bonus Armor|
|--|--|
|1 |60
|2 |120
|3 |180
|4 |240
|5 |300

## --Perk Analysis--
![image](https://user-images.githubusercontent.com/26418143/157974906-3927905b-d6d6-4615-9f1a-1d76cfce46b6.png)

**Weapon Mastery**

Rank 1 Diligent practice bolsters the damage and ease of your one-handed and unarmed attacks.

Rank 2 Improved fighting techniques bolster the damage and ease of your one-handed and unarmed attacks.

Level Required : 0/0

Perk Required : None/ Weapon Mastery (Rank I)

_Effect_ :

Rank 1: Damage x 120%, -50% weapon weight penalties.

Rank 2: Damage x 140%, -50% weapon weight penalties.

---

**Martial Arts**

You're a passionate pugilist. 

Level Required : 0

Perk Required : None

_Effect_ :

Unarmed power attacks deal 30 more damage and cost 66% less stamina.

---

**Penetrating Strikes**

One-handed power attacks are easier to execute, and further penetrate enemy armor.

Level Required : 20

Perk Required : Weapon Mastery (Rank I)

_Effect_ :

-50% power attack stamina cost, +5 armor penetration

---

**Dagger Focus**

Rank I - Your basic dagger skill increases sneak attack damage and expertise.

Rank II - Your advanced dagger skill increases sneak attack damage and expertise.

Rank III - You have mastered the deadly art of the dagger.

Level Required : 25/50/75

Perk Required : Penetrating Strikes / Dagger Focus Rank 1 / Dagger Focus Rank 2

_Effect_ :

Each rank gives +10 armor penetration if you have a dagger in hand (decreases to +5 if your other hand contains another 1 handed weapon type) 

Rank I - Irresistible sneak attack damage +25%

Rank II -  Irresistible sneak attack damage increased from +25% to +55%

Rank III - Irresistible sneak attack damage increased from +55% to +100%

---
**War Axe Focus**

Rank I - Your basic war axe skill increases damage and armor penetration with one-handed chopping weapons.

Rank II - Your advanced war axe skill further increases damage and armor penetration with one-handed chopping weapons.

Rank III - Your masterful skill with one-handed War Axes further enhances your attacks.

Level Required : 25/50/75

Perk Required : Penetrating Strikes / War Axe Focus Rank 1 /  War Axe Focus Rank 2

_Effect_ :

Each rank gives +10 armor penetration if you have a War Axe in hand (decreases to +5 if your other hand contains another 1 handed weapon type) 

War Axe Focus I -  Base Damage increased by 5%

War Axe Focus II - Base Damage increased from 5% to 15%

War Axe Focus III - Base Damage increased from 15% to 30%

---

**Mace Focus**

Rank I - Your basic skill with one-handed maces enhances armor penetration.

Rank II - Your advanced skill with one-handed maces further enhances armor penetration.

Rank III -  Your masterful with one-handed maces renders enemy armor almost useless.

Level Required : 25/50/75

Perk Required : Penetrating Strikes / Mace Focus Rank 1 /  Mace Focus Rank 2

_Effect_ :

Each rank gives +15 armor penetration if you have a Mace in hand (decreases to +7.5 if your other hand contains another 1 handed weapon type) 

Mace Focus I - Power attack damage  increased by 5% 

Mace Focus II - Power attack damage  increased from 5% to 10%

Mace Focus III - Power attack damage increased from 10% to 15%

---

**Sword Focus**

Rank I - Your basic skill with one-handed blades enhances your attacks.

Rank II - Your improving skill with one-handed blades further enhances your attacks.

Rank III -  Your masterful skill with one-handed blades further enhances your attacks.

Level Required : 25/50/75

Perk Required : Penetrating Strikes / Sword Focus Rank 1 /  Sword Focus Rank 2

_Effect_ :

Each rank gives +7 armor penetration if you have a Sword in hand (decreases to +3.5 if your other hand contains another 1 handed weapon type) 

Sword Focus I - +8% attack speed per sword equipped

Sword Focus II - +8% attack speed per sword equipped in addition to rank 1.

Sword Focus III - +8% attack speed per sword equipped  in addition to rank 2.

---

**Powerful Strike** 

Your one-handed and unarmed power attacks shatter bone and sinew.

Level Required : 50

Perk Required : Penetrating Strikes

_Effect_ :

Power attack damage x 1.2

---

**Powerful Charge** 

Your sprinting power attack propels you through the air and deals terrifying damage.

Level Required : 50

Perk Required : Penetrating Strikes

_Effect_ :

Unlocks sprinting power attack, -25% weapon weight penalties

---

**Stunning Charge** 

Your expertly utilize your weight and momentum during forward power attacks.

Level Required : 100

Perk Required : Powerful Strike / Powerful Charge

_Effect_ :

Forward power attacks can knock down

---

**Flurry** 

When fighting with one-handed weapons or fists, you are able to attack faster than normal

Level Required : 25

Perk Required : Weapon Mastery (Rank I) / FLurry 1

_Effect_ :

 Tier 1 One-handed and unarmed attacks are 10% faster.

 Tier 2 One-handed and unarmed attacks are 25% faster.

---

**Storm of Steel** 

You've become very skilled in wielding two weapons at once.

Level Required : 75

Perk Required : Flurry 1

_Effect_ :

Power attacks deal 25% more damage when dual-wielding one-handed weapons.
