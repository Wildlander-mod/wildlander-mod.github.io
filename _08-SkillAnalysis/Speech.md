---
layout: default
title: Speech Analysis
has_toc: false
has_children: false
---

![image](https://user-images.githubusercontent.com/26418143/157977949-8848f8b7-d310-4220-abaa-42f03c2651a6.png)

# --Perk Analysis--
## Merchant branch

### Haggling

Your convincing appraisals net you better prices for goods.

Level Required : 0

Perk Required : None

_Effect_ :

Buy and sell prices are improved 1% per your Speech level.

---

### Silver Tongue

You sure know how to pose an argument. Prices are 10% better with the opposite gender,<br>and you're 3x more intimidating in conversation.

Level Required : 25

Perk Required : Haggling

_Effect_ :

* Player intimidation multiplied by 3.
* Sell/buy prices improved by 10% when you're trading with opposite gender.

---

### Merchant

You're a natural trader! Merchants will buy anything from you except stolen goods.<br>Selling prices are 15% better, and you can invest in shops to permanently increase their available gold.

Level Required : 50

Perk Required : Haggling

_Effect_ :

* Sell prices increased by 15%.
* Player now can give 500 gold to merchant to increase his gold.
* Every merchant will buy anything (not stolen) regardless of his profession.


***

### Fence

It's all about who you know. You can sell stolen goods to almost any merchant.

Level Required : 100

Perk Required : Merchant

_Effect_ :

* Stolen items can be sold to any merchant.

---

### Leadership

You inspire those who fight by your side. Followers deal 20% more damage, block 75% more damage, and cast spells for 15% less magicka.<br> Their magicka and stamina are increased by 100 and regenerate 50% faster. Carry weight is increased by 50.

Level Required : 75

Perk Required : Silver Tongue

_Effect_ :

Your followers gain following bonuses:
* Damage with all weapons increased by 20%.
* Conjuration, Alteration, Restoration, Destruction spells cost 15% less mana. 
* Amount of blocking damage increased by 75%.
* Magicka and Stamina increased by 100.
* Magicka and Stamina regeneration increased by 50%.
* Carry Weight increased by 50.

### Masquerade

Rank 1: You can wear faction-specific armor to try to blend in and become undetectable. Success depends on the number of enemies near you. <br>Works for Forsworn (Breton PC only), Imperials, Necromancers, Stormcloaks, Thalmor (Altmer PC only), and Warlock factions.

Rank 2: There is no role you cannot play. Enemies are less suspicious now<br> and don't check your affiliation every few seconds.

Level Required : 50/100

Perk Required : Silver tongue / Masquerade 1

_Effect_ :

Rank 1: Allows the Player to wear other faction armor to become undetected. 

Rank 2: Improves Success chance

<li>Exact mechanics are hidden in the scripts, but I found that following factions are referenced: Forsworn, Imperial, Necromancer, Stormcloak, Thalmor, Warlock.</li>
<li>Found that for Thalmor there are referenced only body and head items, so wearing chest piece and headgear could count as disguise (this is a speculation though).</li>
<li>When I look at disguise in CK it seems that only Thalmor are covered with the custom message player gets when being successfully disguised, along with chest + head reference..</li>

## Dragonborn branch

### Lore of the Thu'um

Your diligent study of the Thu'um reduces shout cooldown by 10%.

Level Required : 0

Perk Required : None however requires 'The Way of the Voice' to be completed.

_Effect_ :

Improves Shout recovery by 10%.

---

### Destructive Urge

Level Required : 0

Perk Required : Lore of the Thu'um, Must have completed "Alduin's Wall" quest

_Effect_ :

All your shouts have magnitude increased by 15%.

---

### Indomitable Force

Damage from enemy shouts is reduced by 50%.

Level Required : 0

Perk Required : Lore of the Thu'um, Requires "The Horn of Jurgen Windcaller" completing

_Effect_ :
You receive 50% damage from enemy shouts. Also, duration of enemy shouts is reduced by 50%.

---

### Spiritual Equilibrium

Level Required : 0

Perk Required : Lore of the Thu'um, Requires "Throat of the world" completing

_Effect_ :

Duration of your shouts is improved by 15%.

---

### The Way of the Voice

Level Required : 0

Perk Required : Lore of the Thu'um, Requires "Throat of the world" completing

_Effect_ :

<li>Gives you the power, which allows you once a day to shout without cooldown. The power lasts 5 seconds.</li>
<li>As the power is identical to the Nord racial, if you&#39;re a Nord it seems that this perk will double the duration of your racial. So it would mean 10 seconds of shouting without cooldown.</li>

--- 

### Tongue's Insight

Level Required : 0

Perk Required : Lore of the Thu'um

_Effect_ :

By taking this perk, you exchange it for free Dragon Soul. You can repeat the process as long as you have perk points to spend.

---



<h2 id="wiki_other_useful_info_about_shouts">Other useful info about Shouts</h2>
<p>There&#39;s been a confusion about taking Indomitable Force perk. Some people though that it will make you immune to Unrelenting Force. Unfortunately that&#39;s not the case. However, it is possible to gain such immunity, and as it turns out - also immunity to Disarm Shouts. There are 3 ranks of each shout, depending on type of enemy. In my experience, strongest Unrelenting Force is found rather in the end-game, places like Skuldafn or Soul Cairn. <strong>Below are the stats requirements to make you immune to those shouts.</strong></p>

---

### Unrelenting Force

* Rank 1 - knocks you down and deals 20 damage when you have 25 magic resist or less AND 250 health or less. It means that when you get either 26 magic resist OR 251 current health (not base), you will stop the effect.
* Rank 2 - deals 40 damage, needs more than 35% magic resist or more than 400 health to be resisted.
* Rank 3 - deals 60 damage, needs more than 50% magic resist or more than 600 health to be resisted.

---

### Disarm Shout

* Rank 1 - needs more than 25% magic resist or more than 250 current stamina to be resisted.
* Rank 2 - needs more than 35% magic resist or more than 400 current stamina to be resisted.
* Rank 3 - needs more than 50% magic resist or more than 600 current stamina to be resisted (apparently this version is not used by Dragons; they seem to have separate disarm which cannot be resisted. It works though for Draugr/Wrathmans and the like).
