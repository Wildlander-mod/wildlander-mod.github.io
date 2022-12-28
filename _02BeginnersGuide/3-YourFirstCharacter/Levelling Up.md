---
layout: default
title: Leveling your Character
has_toc: true
nav_order: 3

parent: Your First Character
description: Leveling up Your Character
---

# Leveling your Character

Once you have the basics of food/water/cleanliness/warmth and shelter covered. You can now focus on leveling your skills.
 
Wildlander is a deleveled world - The importance of understanding this can not be overrated, and people misunderstanding it are a constant source for the kind of question I'm trying to answer with this guide. A very common occurrence is people who think they understand the concept, and promptly ask, why they get their butt handed to them at bleak falls barrow when they try it at level 1. The answer is simply:-

{: .NoTitleGreen }
> If it kicks you in the teeth for the 20th time, it's above your paygrade. 

Confronted with this, a lot of people ask what they are supposed to do on Lv 1-5, then. The answer is: anything. Save often, try to run from a fight when you start losing, hunt, chop wood, collect ingredients and mix potions, mine ore, craft stuff. Anything. As long as it gets you gold and/or level-ups do it! Following on from that - Training your skills and armor.

---

## Vanilla Skills

Some skills will only increase when there is an active component associated with them:

* Sneak will only increase if you are within range of and are avoiding detection by an entity that would otherwise be aware of your presence, or escaping from one that has detected you. You do not need to move for the skill to increase, though completing actions that are more difficult will increase the skill faster, such as moving and, more notably, completing sneak attacks.
* Pickpocketing increases proportionally to the total value of lifted goods, assuming you are not caught.
* Lock-picking will gain a small increase for every broken pick, and a substantial increase that varies based on lock level versus skill and perk level for every successfully-picked lock. However, if you successfully pick a lock that you have picked before, there is no XP reward (with the exception to training chests in thieves guild).
* Smithing, Alchemy, and Enchanting give skill increases based on the value of the crafting.

---

### Weapon/Block/Armor XP

The formula is ( Factor * Skill Usage Multiplier)

Factor is defined as:-
* Weapons skills increase by a percentage of the damage done.
* Armor skills increase by a percentage of the damage blocked, or by simply moving in the armor 
* Block increases by a percentage of raw damage blocked, or by shield bashing.

Note: 
* The % of damage done is calculated at engine level and is identical to vanilla. I am unable to find a exact figure for this component.

---

### Spell XP

With the exception to Illusion spells, XP is calculated in general terms much the same as vanilla.

```
For Targeted Spells from destruction and restorations trees, your skills increase based upon how much raw damage you cause/heal

XP = (Base Magic Cost * Skill Usage Multiplier) + (% of Damage Done * Skill Usage Multiplier) 

otherwise

XP = (Base Magic Cost * Skill Usage Multiplier), 

The Base Cost will either be the CK auto-calculated spell cost for the Magic Effects or the fixed Requiem spell cost, whichever is lower. It will not be reduced by any perks you have which affect magic costs or any armor you are wearing which increases the costs - it simply uses the base.
```

Notes:
* if in the CK a spell would cost 30 magicka when auto-calced, but Requiem makes it cost 200 magicka you only get the xp as if the cost was 30. It can also be limited the other way, so if a spell auto cost was 200, but Requiem had the manual cost as 50, you would only get 50 magicka as the cost for the calculation.
* Dual Casting does not increase XP gain.
* Destruction from runes will only increase if the runes are triggered. Other Destruction spells require a valid target, either a creature or an NPC.
* Restoration will only increase if it is replenishing lost life (with a few exceptions) and will level up faster when in combat. It will also increase when casting damaging Sun spells on undead targets
* Alteration derived from Detect Life will only increase if you are actually detecting life forms with the spell.

Notes - Conjuration:
* When summoning creatures, you don't have to be engaged in combat at the time of casting to gain experience in Conjuration, as long as you encounter a hostile enemy before the summons vanishes.
* The quickest way to level up your conjuration is by getting the spell Bound Weapon, starting a fight (Mudcrabs are the best opponents for this), casting the spell (one or two hands), when hearing the sound which comes right after you've launched the spell, cancel (so you don't have to wait for the weapons to appear), repeat. Damage done by bound weapons increases the weapon's Skill - not Conjuration.
* Banishing your own summoned creatures grants experience. Banishing conjured familiars grant experience.



Illusion on the other hand, will gain XP for targeted spells depending on the target, the higher the level, and the longer you keep the spell on a target the more XP you'll gain. Also XP are granted not per cast like in vanilla, but instead a continuous stream of XP while they remain active. For spells such as dark-vision, this is as long you can keep the spell active though its upkeep. for mind control spells, this is as long as the target remains afflicted and doesn't break free.

```
For targeted spells
	 XPRate = 0.25 + (NPCLevel * sqrt(NPCLevel)) + ((0.01 * (Breakfreechance/2.0)) * sqrt(Breakfreechance/2.0)) 

For passive Spells
	Predefined XP per second - E.g Darkvision grants 0.1/s

```
 
Notes:
* The calculation of the break-free chance is a comparison between the caster’s spell power, determined by her illusion skill, and the willpower of the target, determined by level, magicka pool, illusion skill and magic resistance. This is explained further [here](../6-MechanicsAnaylsis/Magic-Mechanics.html#resistance-versus-illusion-spells)
* The field NPC Level is the NPC's level Divided by 10

---

### Skill Usage Table

Skill	|Skill Use Mult	| Sources of XP/Notes|
|--|--|--|
Speech	|0.36	|1 base XP per gold used in transactions. <br> 75 * Speech level base XP for passing Speech checks.
Alchemy	|0.75	|1 base XP per gold value created. <br> 1 additional base XP for each successfully created potion.
Smithing	|1	|Please see [Crafting system - XP gain](http://wiki.wildlandermod.com/10-Crafting/1.1-Crafting-System.html#xp-gain)
Destruction	|1.35	|Base Magicka Cost of the Spell. <br> Base XP Damage inflicted 
Restoration	|2	|Base XP damage healed by healing spells. <br> 1 base XP per Magicka used on non-healing spells. <br> Base XP Damage inflicted when using Sun spells on Undead
Conjuration	|2.1	|Base Magicka Cost of the Spell.
Alteration	|3	|Base Magicka Cost of the Spell.
Heavy Armor	|3.8	|1 base XP per raw damage received. <br> Additional XP for moving while wearing armor 
Evasion Armor	|4	|1 base XP per raw damage received. <br> Additional XP for moving while wearing armor 
Illusion	|4.6	|How long you can warp the targets mind Vs how resistant the target is to your magic (see above section)
Two-Handed	|5.95	|Base Weapon Damage
One-Handed	|6.3	|Base Weapon Damage
Block	|8.1	|1 base XP per raw damage blocked. <br> 5 base XP for a shield bash.
Pickpocket	|8.1	|1 base XP per gold value stolen.
Archery (Marksman)	|9.3|	Base Weapon Damage of the Bow
Sneak	|11.25	|2.5 base XP for becoming hidden within ~45 feet. <br> 0.625 base XP per second hidden within ~45 feet. <br> 30 base XP for a melee sneak attack. <br> 2.5 base XP for a ranged sneak attack.
Lockpicking	|45	|0.25 base XP for a broken pick. <br> 2, 3, 5, 8, or 13 base XP for successfully picking a lock.
Enchanting	|900	|1 base XP per item enchanted. <br> 1 base XP per 400 enchantment gold value of items disenchanted. <br> 0.05(Petty), 0.1(Lesser), 0.2(Common), 0.4(Greater), or 0.6(Grand) base XP for recharging a weapon.

----

 
## Camping

Every campfire you build and tent you pitch will level these skills up. The skills menu accessible when using a campfire will allow you to build a fire quicker in harsher environments. Upgrading a campfire to maximum will give you a 6 hour 5% XP gain buff - so you should do this first thing in the morning, and every time the buff expires.

Building a campfire and using the skills menu is how you allocate perks from the camping and sunhelm mods.
 
## Foraging

Using the skill will level this up. Higher levels are able to specify what to look for.
 
## Crafting 

Crafting is based on selling price, so anything crafted at a forge for low cost materials, high sell price can level this. Smithing XP has diminishing returns so first craft will generate 3X base XP and second craft will generate 2X. You should always craft everything at least twice.

## Endurance

Run around in cold area's to passively leave this up.

## Survival

When you get any of your needs to their max value, your survival skill will increase.

## Butchering

Processing dead animals levels this skill up.

---
# None combat methods of training

## Skill books.

Skill books in your inventory can be studied. These will give you training for however long you study for. 

## Research

Spell research journal will allow you to train up magic skills. Simply place a spell in either hand. Use the spell research journal. Select Research option. Wait for it to initialize, then you can either cast the spells or use the research book again to study them for a period of time.

Once you have finished research, activate journal again to exist research mode. Then find a bed to sleep away your fatigue (1 hour of study, 2 hours of sleep)

## Training dummies

You can "use" a training dummy to train with a weapon or spell equipped to train for a period of time. Then find a bed to sleep away your fatigue (1 hour of study, 2 hours of sleep)

{: .hint }
If your skill is at zero, it will not level via a book or a dummy unless you train the skill to level 1 at a trainer first.



---

# I’ve finished training - Now what?

Firstly - and always when in a major city - check the missive boards for quests which require “easy” kills (mudcrab, wolf or skeever parts are examples of such). You can also pick up quests for the easier item retrievals or dungeon cleans. Even if you’re not quite ready yet to take on the challenge or retrievals or clears you can pick them up as most don't have a time limit. 

Early on, scavenging from battles is an excellent way to get starter equipment, gold and smithing materials. If you run across a big skirmish between Imperials / Stormcloaks, strip-search those battlefields and keep what you can use, disassemble or sell the rest.
 
The next section covers combat tactics in detail, but once you have a few levels and more importantly perks under your belt you can start to pick off wildlife. A good place to start killing is in the Whiterun sewers where the first few rooms contain level 1 and 2 mudcrabs and a few skeevers - Be careful about venturing too deeply as there are a few surprises lurking. Once you're comfortable with whiterun sewers, you can venture to Markarth, solitude or windhelm which also have sewer systems. If you don't want to go north yet - then you can pick off the mudcrabs around the whiterun area, but this is significantly more dangerous with level 10+ sabercats/bears also in the area.

Get a Crossbow, Aas fast as possible - make sure you are not in combat when you equip it, and load it to that its ready for use. Ideally you want one that doesn't break from damage - Dawnguard is a good example. Crossbows make short work of lots of the wildlife and bandits that will make your life a big problem.
 
After the wildlife has been beaten into submission, you are ready to tackle more intelligent competition in the form of the open world bandit camps. And after those, you can move into the bandit camp inside of dungeons - Helgen, Embershard mine and halted stream camp are recommended “Starter” dungeons for you to test your capabilities. 

In order of difficulty for starting content :-
* Animals 
* Bandits 
* Forsworn (unless Hagravens are present) 
* Draugr (unless Dragon priests are present)  
* Giant 
* Mage 
* Everything else.
 
The final advice regarding early dungeons is that you should not attempt bleak falls barrow or any other draugr areas without decent tempered ‘silver’ weapons and perks in both of your armor and weapon at skill- level 50 at bare minimum! 




