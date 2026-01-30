---
layout: default
title: Health Management
nav_order: 6
description: Learn how to heal wounds and manage health in Wildlander
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

# Health Management

In Wildlander, **there is no passive health regeneration**. You will not heal by resting or waiting like in vanilla Skyrim. If you get hurt, you must actively heal yourself or you will die.

Understanding how to heal efficiently and keep yourself alive is essential to survival.

---

## The Critical Difference: No Resting Heals

**Vanilla Skyrim:** Sleep or wait → automatically heal all wounds
**Wildlander:** Sleep or wait → nothing happens. You stay wounded (unless you have enchantments, food, or other ways to increase health regen from zero).

This fundamental change means:

- Combat wounds persist until you actively heal them
- Getting caught in extended fights without healing items is fatal
- Healing is a resource you must manage
- Planning escape routes and healing opportunities becomes critical

---

## Your Healing Options

### For the Living (All Races)

| Method | Speed | Effectiveness | Notes |
|--------|-------|-----------------|-------|
| **Restoration Spells** | Fast | Scales with skill | Requires magicka; scales with Restoration skill |
| **Health Potions** | Instant | Varies by strength | Can be expensive; easiest backup |
| **Healing Poultice** | Very slow (1+ hours) | High per-second regen | Safe-only; used before risky areas |
| **Raw Ingredients** | Moderate | Low but steady | Instant restoration; always available in wilderness |
| **Cooked Meat/Food** | Moderate | Low but steady | Out-of-combat healing; slower than raw |
| **Fortify Health Enchantments** | Passive | Scales with gear | Fortify Health or Health Regen enchantments |
| **Engraved Bones (Kynareth)** | Passive | 1-2 HP/sec | Permanent item; passive regen while carried |

### For Vampires (Vampire Races)

**Only superlative-level (highest potency) healing potions work on vampires.** This means:
- Restoration spells don't work on you
- Regular health potions are useless
- You must rely on potions and other methods
- Plan accordingly before becoming a vampire

---

## Your Health Pool

Your maximum health is determined by:

| Factor | Impact | Notes |
|--------|--------|-------|
| **Base Health** | Varies | Determined by starting race in character creation |
| **Health Attribute Investments** | +5 HP per point | You allocate points at level-up |
| **Fortify Health Enchantments** | +20 per piece | Increases max health on enchanted gear |
| **Perks** | Variable | Some perks increase max health |

**Early Game Reality:** Your health varies based on race. Enemies deal 10-30 damage per hit depending on their level. **This is why avoiding damage matters more than healing.**

---

## Healing Methods Explained

### Method 1: Restoration Spells (Best for Mages)

- Spell costs magicka but scales with your Restoration skill
- Higher Restoration skill = larger heals
- Works instantly in combat
- Requires you to have learned the spells and have enough magicka

**How to Get Started:**
1. Hire a Restoration trainer or buy spells from mages
2. Cast Heal Self during or after combat
3. Higher levels get spells like Greater Heal Self, Grand Heal Self

### Method 2: Health Potions (Universal Backup)

- Instant full heal (depending on potion strength)
- Works on all races (except undead need superlative-level potions)
- Can be expensive to buy; crafting is cheaper
- Perfect emergency backup when injured

**Which Potions to Carry:**
- Early game: Moderate healing potions (covers 20-40 HP)
- Mid game: Strong healing potions (covers 50-80 HP)
- Late game: Superlative potions (full heal, 100+ HP)

### Method 3: Healing Poultice (Best Long-Term)

Healing Poultices are **slow but powerful sustained healers**:

- Heal 1-2 HP/second for **1+ hours**
- **Cannot be used in combat** - Engaging in combat or sprinting cancels the effect
- **Use in safe locations only** - Before entering dangerous areas or after escaping combat
- Must wait for the full duration to work

**How to Craft Healing Poultice:**

{: .note}
Healing Poultice is **pure player crafting**—no workstation required, just your inventory and a Survivalist's Toolkit.

| Requirement | Notes |
|-------------|-------|
| Alchemy Lore (Rank 1) or Craftsman Perk | Alchemy skill unlocks crafting |
| 5 × Medicinal Salve | Craft from Restore Health ingredients (Blue Mountain Flower, etc.) |
| 1 × Bandage | Craft from cotton/linen cloth |
| Survivalist's Toolkit | Required for advanced player crafting anywhere |

**Crafting from Right Shift Menu:**
1. Medicinal Salve: From any ingredient with "Restore Health" property
2. Bandages: From cotton or linen cloth (or breakdown cloth items)
3. Healing Poultice: 5 Medicinal Salve + 1 Bandage

**When to Use:**
- After escaping combat and reaching a safe location
- At camp before sleeping

---

### Method 4: Raw Ingredients (Emergency Healing)

- Only specific raw ingredients with "Restore Health" properties work
- Restores 1-2 HP when eaten in combat
- Always findable in nature (mushrooms, flowers, etc.)
- Low per-second but better than nothing in a pinch
- Doesn't require crafting perks

**Best Early-Game Restore Health Ingredients:**
- **Raw meat** (only for strong stomach races: Argonian, Khajiit, Orc, Wood Elf)
- Blue Mountain Flower
- Blisterwort
- Imp Stool
- Blue Dartwing
- Swamp Fungal Pod
- Wheat
- Rock Warbler Egg
- Sabre Cat Eye

---

### Method 5: Passive Health Regeneration

#### Enchantments (Long-Term Investment)

- **Fortify Health**: Permanently increases max health 
- **Fortify Health Regen (Healing Rate)**: Increases health regeneration 
- Craft on: Boots, gloves, rings, chest piece

#### Engraved Bones (Kynareth)

- Passive health regen item (+1-2 HP/sec while carried)
- Permanent benefit; highly valuable early game
- Seek these out if you find them

---

## Combat Healing Strategy

### Before Combat

- Carry **3-5 health potions** minimum
- Carry **Healing Poultice** for afterward
- Know your retreat route
- Scout enemy positions before engaging

### During Combat

| Situation | Action |
|-----------|--------|
| Taking repeated hits | Retreat to safe distance, heal, return |
| Below 25% health | Use healing potion immediately or retreat |
| Surrounded | Retreat, use Healing Poultice or potions in safe spot |
| Low magicka (mages) | Switch to healing potions; find safe location to regenerate |

### After Combat

- Use Healing Poultice in safe location if available
- Wait 1+ hour for full effect if using Poultice

---

## Advanced: Health Regeneration Formula

If you're curious how passive regeneration works in Wildlander:

**HealthPerSecond = MaxHealth × HealRate% × HealRateMult% × (InCombat ? CombatHealthRegenMult : 1.0)**

Where:
- **MaxHealth** = Your current maximum health pool
- **HealRate%** = Base regen (2% of max health per second)
- **HealRateMult%** = Modifier from enchants/potions (additive; starts at 0%)
- **CombatHealthRegenMult** = In-combat modifier (7% during active combat)

**Example:** If you have 150 max health with a 50% enchant regen modifier:
- Out of combat: 150 × 2% × 50% = 1.5 HP/sec
- In combat: 150 × 2% × 50% × 7% = 0.1 HP/sec (much lower)

---

## Key Principles

1. **Avoid damage is better than healing damage** - Defensive play saves resources
2. **Always carry backup healing** - Potions + spells + poultices
3. **Don't tank hits** - Sidestep, block, retreat when low
4. **Healing Poultice is your friend** - Use before risky areas
5. **Raw food is free emergency healing** - Pick ingredients as you travel

---

## Next Steps

You now understand health management and have healing strategies for every playstyle. Continue your journey:

1. **Read [Basic Combat Mechanics](https://wiki.wildlandermod.com/_03-YourFirstCharacter/basic-combat-mechanics/)** - Master enemy AI and positioning
2. **Read [Carry Weight Management](https://wiki.wildlandermod.com/_03-YourFirstCharacter/carry-weight/)** - Learn to carry healing supplies without overencumbering
3. **Read [Camping & Campfire Perks](https://wiki.wildlandermod.com/_03-YourFirstCharacter/camping/)** - Prepare healing supplies at camp before dangerous journeys

**Remember:** Health is a resource. Manage it wisely, heal proactively, and you'll survive.





