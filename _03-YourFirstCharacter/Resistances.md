---
layout: default
title: Armor Resistances, Penetration & Weapon Types
nav_order: 9
description: Understand armor resistances, weapon penetration, damage types, and how to overcome enemy defenses
has_toc: true
---

## Table of contents
{: .no_toc .text-delta }

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

---

# Armor Resistances, Penetration & Weapon Types

Damage is not just about weapon power—it's about armor, resistance, and penetration. In Wildlander, every enemy has defenses, and every weapon has different ways to overcome them. Understanding these mechanics will transform you from a frustrated novice into an effective combatant.

**Key principle:** Not all weapons work equally against all enemies. Choose the right tool for the job.

---

## Armor & Physical Resistance

### How Armor Rating Works

- **1 point of Armor Rating (AR) reduces incoming physical damage by 0.1%**
- Maximum AR effectiveness: **80% damage reduction** (cap)
- 800 AR = 80% damage reduction (reaching the cap)
- Example: Heavy Daedric armor gives ~800 AR = 80% damage reduction

### Armor Penetration (AP)

Armor penetration bypasses enemy defenses based on attack type:

- **Ranged attacks & melee power attacks**: 1 AP bypasses 1% of target's AR
- **Standard melee attacks**: 1 AP bypasses 0.5% of target's AR
- **Maximum bypass**: Can never bypass more than 80% of target's AR
- Example: Striking an enemy with 500 AR using 10 AP gives effective AR of 450 (not 500)

**Practical application:** 
- Use power attacks against heavily armored enemies
- Ranged weapons are more effective at armor penetration
- Different weapons have different penetration values

---

## Resistances by Type

All resistances have a **90% cap** (except physical damage at 80%), meaning resistances over that threshold don't provide additional protection.

| Resistance Type | Maximum Cap |
|--|--|
| Armor Rating (Physical) | 80% |
| Poison | 90% |
| Fire | 90% |
| Frost | 90% |
| Shock | 90% |
| Magic | 90% |

---

## Elemental & Magic Resistance

### Magic Resistance

- Protects against **all magic damage**, including elemental magic (fire, frost, shock)
- Protects against **shouts, fears, and non-elemental spells** (illusion, etc.)
- NPCs can have both elemental and magic resistances simultaneously (unlike vanilla)
- **Multiplicative effect:** Resistances stack multiplicatively, not additively
  - Example: 90% magic resistance + 90% fire resistance = 99% total fire resistance (10% × 10% = 1% unresisted)
  - At high values, your effective resistance increases exponentially

### Elemental Resistances (Fire, Frost, Shock)

- These combine multiplicatively with magic resistance
- Higher individual resistances create dramatically higher combined protection
- Combined with magic resistance, becomes very powerful

### Poison Resistance

- **Reduces poison damage** by the stated percentage (up to 90% cap)
- Must be active **before poison damage is applied** (including DoT effects)
- Taking a Resist Poison potion only protects from new poison attacks, not active damage-over-time effects
- **Paralyze protection:** High poison resistance (45%+) prevents most paralyze attacks
  - 45% is enough to stop all but the strongest creatures (large frostbite spiders, falmer)
- **Poison shouts** (poison dragons, afflicted) ignore initial poison resistance but are still affected by DoT resistance

---

## Weapon Damage Types

In Wildlander (using Requiem), all weapons deal one specific damage type. Creatures often have special resistances or vulnerabilities to specific damage types.

### The Four Damage Types

| Damage Type | Weapons | Notes |
|--|--|--|
| **Slashing** | Sword, War Axe, Greatsword, Battleaxe | Most common weapon type |
| **Blunt** | Mace, Warhammer | Effective against armored foes |
| **Pierce** | Dagger | High armor penetration |
| **Ranged** | Bow, Crossbow | Modified by ammunition type |

### Enemy Damage Type Resistances

Some creatures have damage type resistances as **bonus armor rating** against specific weapon types:

| Resistance Tier | Bonus Armor Rating |
|--|--|
| Tier 1 | +60 AR |
| Tier 2 | +120 AR |
| Tier 3 | +180 AR |
| Tier 4 | +240 AR |
| Tier 5 | +300 AR |

**Impact:** A creature with Tier 3 blunt resistance takes an additional 180 AR worth of protection against maces and warhammers, making them nearly immune unless you have high armor penetration.

---

## Damage Reductions

Many creatures have **percentage-based damage reductions** against specific weapon types. This multiplies on top of armor ratings.

**How it works:** A 75% damage reduction means a weapon deals only 75% of its stated damage.

### Examples

- **Warhammer (100 damage) vs. 75% blunt reduction enemy**: 100 × 0.75 = 75 damage dealt
- **Sword (100 damage) vs. 85% slashing reduction enemy**: 100 × 0.85 = 85 damage dealt

**Practical impact:** Some weapon types are dramatically less effective against specific enemies, even with high base damage.

---

## Material Protection & Vulnerabilities

Certain enemies have **material-based resistances or vulnerabilities** based on weapon material:

### Common Examples

**Undead creatures:**
- Vulnerable to silver weapons (take additional damage)
- Especially susceptible to silver melee weapons

**Draugr:**
- Immune to conventional metal arrows (iron, steel, etc.)
- Arrow damage reduced to **10% of stated damage** against them
- With weak metals: effectively 3-5 damage per arrow
- Solution: Use higher-quality arrow materials or switch to melee

**Other material vulnerabilities:**
- Daedric creatures resist certain materials
- Specific creature types have specific protections

**Key takeaway:** If a weapon type isn't working, try a different material.

---

## Strategic Application

### Choosing Your Weapons

1. **Against heavy armor:**
   - Use weapons with high armor penetration (ranged, piercing)
   - Use power attacks (100% AP bonus vs standard attacks)
   - Consider using blunt weapons to bypass slashing-resistant enemies

2. **Against magic users:**
   - Build magic resistance (boots, body armor, spells)
   - Close distance quickly to prevent casting
   - Use interrupting power attacks

3. **Against specific creatures:**
   - Research creature resistances before engaging
   - Carry multiple weapon types for different situations
   - Don't rely on only one damage type

4. **Armor choice:**
   - Heavy armor reaches 80% damage reduction cap
   - Evasion (light armor) provides mobility
   - Different creatures resist different damage types based on armor materials

---

## Next Steps

You now understand how to calculate damage and armor effectiveness. Continue learning:

1. **Read [Basic Combat Mechanics](https://wiki.wildlandermod.com/_03-YourFirstCharacter/basic-combat-mechanics/)** - Apply resistance knowledge to combat strategy
2. **Read [Carry Weight Management](https://wiki.wildlandermod.com/_03-YourFirstCharacter/carry-weight/)** - Learn how to carry varied weapons for different situations
3. **Read [Levelling Up](https://wiki.wildlandermod.com/_03-YourFirstCharacter/levelling-up/)** - Perks that improve armor penetration and damage types
4. **Read [Health Management](https://wiki.wildlandermod.com/_03-YourFirstCharacter/health/)** - Manage damage taken through resistances and potions

**Remember:** Armor doesn't stop damage—it reduces it. Understanding resistances means better survival.
