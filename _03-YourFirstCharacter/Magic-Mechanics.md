---
layout: default
title: Magic Analysis
nav_order: 11
description: Magic Analysis
---

## Quick Reference (TL;DR)

{: .highlight}
**Most Important Rule:** Perks matter more than skill level. You can have 100 magic skill, but without the matching perks, your spells will be weak and expensive.

---

## Core Magic System Changes

Wildlander makes significant changes to how magic works compared to vanilla Skyrim. Here are the key differences:

### Perks are Essential

- **Skill level alone does nothing** - Your magic skill only determines which perks you can unlock
- **Perks unlock spells** - Each tier (Novice, Apprentice, Adept, Expert, Master) grants you free spells when you learn the perk
- **Perks reduce costs** - Without perks in a school, spells cost much more to cast
- **Example:** Casting Novice spells without the Novice perk costs 2x as much magicka

### Spell Research

Instead of only buying or finding spell books, you can now learn spells through [Spell Research](https://wiki.wildlandermod.com/11Deep-Dives/Spell-Research/). You discover spells by:
- Researching discovered thesis
- Combining different research topics
- Studying enemies and effects in the world

### Empowered Spells (Dual-Casting)

Vanilla "dual-casting" has been redesigned as "Empowered spells":
- **Much more powerful** - Empowered spells have completely new effects, not just stronger versions
- **Higher cost** - Costs scale from 130% (Novice) to 170% (Master) of base cost
- **Worth the investment** - The extra power is significant enough to justify the cost

### Spell Upkeep Costs

Some spells now drain magicka continuously while active:
- Upkeep increases with more powerful spells
- **Cannot be reduced** by items that reduce spell costs (only by magicka regen)
- Plan ahead before casting long-duration spells

---

## Illusion Spells and Resistance

Illusion spells work differently in Requiem - enemies can break free from your spells based on their willpower.

### How Break-Free Chance Works

When you cast an offensive illusion spell, the game calculates if the enemy can resist it:

1. **Comparison:** Your illusion skill vs the enemy's willpower
2. **Dice Roll:** Every 2 seconds, a 100-sided die is rolled  
3. **Success/Failure:** If roll exceeds break-free chance, spell continues; otherwise enemy breaks free
4. **Tier Bonus:** Master spells are much harder to resist than Novice spells

![image](https://user-images.githubusercontent.com/26418143/160236172-3d312939-14e8-4de5-b9df-4606ac6dcb3b.png)

{: .note}
Spell specific value is defined as: Novice=1, Adept=5, Apprentice=10, Expert=15, Master=20

Practical effects shown below:

![image](https://user-images.githubusercontent.com/26418143/160236228-5a2ca016-8293-45a4-9f4c-939826855661.png)

---

## Spell Costs - Four Main Factors

### 1. Perks (Most Important)

**Example:** Candlelight (Novice spell, base 150 magicka)
- No Novice perk: 150 magicka  
- With Novice perk: 82.5 magicka

### 2. Stamina Level

Below 20% stamina doubles your spell costs.

### 3. Armor Weight (Biggest Impact)

Heavy armor causes massive spell cost increases!

#### Practical Examples

When casting Candlelight (base 150 magicka) with no perks while wearing 50 kg of gear:

- **Clothing only:** 150 × 1.25 = **187.5 magicka**
- **Light Armor:** 150 × 2.1 = **315 magicka**  
- **Heavy Armor:** 150 × 7.5 = **1,125 magicka!**

With appropriate Light/Heavy Armor perks, penalties reduce one tier (heavy→light, light→clothing).

Reference chart:

![image](https://user-images.githubusercontent.com/26418143/160237232-239e2388-b843-492a-b750-62948403c58a.png)

### 4. Skill Level

Your skill in the school increases spell duration and effectiveness (scales 1% per skill point).

---

## Summary: What Increases Spell Costs?

Spells cost more when you:

1. **Lack perks** - Don't have the appropriate tier perk for your spell (Novice spells without Novice perk cost much more)
2. **Wear armor** - Any armor adds cost multipliers, especially heavy armor
3. **Wear heavy equipment** - Total equipment weight dramatically increases costs
4. **Low on stamina** - Below 20% stamina doubles spell costs

To minimize costs as a mage: **Get perks, wear robes, and manage your stamina carefully.**

---

## Managing Magicka

### Best Methods to Restore Magicka

| Method | Effect |
|--------|--------|
| **Soups** | 2 hours magicka regen |
| **Magicka Potions** | Instant restore |
| **Cooked Foods** | 1-2 magicka/sec out of combat |
| **Enchantments** | Fortify Magicka Regen |

### Tips for Mages

- Wear mage robes instead of armor to reduce costs
- Invest in Alchemy for cheaper potions
- Pre-cast potions before difficult encounters
- Stay out of melee to keep stamina high

Whenever an offensive illusion spell is cast, the game calculates a ”break-free chance” for the victim. 

The calculation of the break-free chance is a comparison between the caster’s spell power, determined by her illusion skill, and the willpower of the target, determined by level, magicka pool, illusion skill and magic resistance. Once this break free chance has been calculated, then a 100-sided dice is thrown in game to on the initial cast and every two seconds afterwards. If the initial dice throw is less than the break free chance, the spell fails and the victim is unaffected completed, otherwise the victim suffers the effects until the next dice throw.  If the target does not break free from the spell on the next dice throw, the effect continues until the victim breaks free or its duration expires.

The specific calculation is below (heavy math - i know)

---

## Next Steps

You now understand the fundamentals of magic in Wildlander. Continue your learning:

1. **Read [Needs & Survival](https://wiki.wildlandermod.com/_03-YourFirstCharacter/Needs/)** - Understand how survival needs affect your ability to cast spells
2. **Read [Derived Attributes](https://wiki.wildlandermod.com/_03-YourFirstCharacter/DA/)** - Learn how Magicka investment improves your magical power and resistances
3. **Read [NPC Crafting and Enchanting Services](https://wiki.wildlandermod.com/_03-YourFirstCharacter/npc-services/)** - Discover how to enchant your gear with magical effects

**Remember:** Perks are more important than skill levels. Prioritize unlocking perks in your chosen magic schools over raw skill grinding.
