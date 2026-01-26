---
layout: default
title: Derived Attributes
nav_order: 13
description: Derived Attributes
---



Your character's true power isn't determined by base attributes alone—it's determined by **derived attributes (DAs)**, which are calculated from your Health, Stamina, and Magicka investments. Understanding how these formulas work helps you plan leveling strategy for your build.

## How Derived Attributes Work

Every time you level up and invest points in Health, Stamina, or Magicka (+5 per level), you increase not only the base values but also 11 derived attributes:

* Magic resistance
* Magicka regeneration
* Disease resistance
* Poison resistance
* Stamina regeneration
* Unarmed Strength
* Movement speed
* Carry weight
* One-handed damage (excluding daggers)
* Two-handed damage
* Bow/dagger/unarmed damage

**Key principle:** Each derived attribute has a **threshold**—a minimum base value before bonuses start calculating. For example, you need 150 base Magicka before Magic Resistance begins increasing. Below the threshold, the formula returns 0.

## Derived Attributes Formula Table

| Derived Attribute | Formula | Based On | Breakpoints | Bonus Tiers |
|---|---|---|---|---|
| **Magic Resistance** | sqrt(Z - 150) | Magicka | 175 / 250 / 375 | 5% / 10% / 15% |
| **Magicka Regeneration** | 8× sqrt(Z - 100) | Magicka | 125 / 200 / 325 | 40% / 80% / 120% |
| **Stamina Regeneration** | 8× sqrt(Z - 100) | Stamina | 125 / 200 / 325 | 40% / 80% / 120% |
| **Movement Speed** | (3/4)× sqrt(Z - 125) | 20% Health + 80% Stamina | 141 / 190 / 270 / 381 | 3% / 6% / 9% / 12% |
| **1H Damage** | 4× sqrt(Z - 150) | 50% Health + 50% Stamina | 175 / 250 / 375 | 20% / 40% / 60% |
| **2H Damage** | 4× sqrt(Z - 150) | 80% Health + 20% Stamina | 175 / 250 / 375 | 20% / 40% / 60% |
| **Bow/Crossbow/Dagger/Unarmed Damage** | 4× sqrt(Z - 150) | 20% Health + 80% Stamina | 175 / 250 / 375 | 20% / 40% / 60% |
| **Unarmed Strength** | 4× sqrt(Z - 110) | 50% Health + 50% Stamina | 135 / 210 / 335 | +20 / +40 / +60 (flat) |
| **Carry Weight** | 4× sqrt(Z - 110) | 80% Health + 20% Stamina | 135 / 210 / 335 | +20 / +40 / +60 |
| **Poison Resistance** | 4× sqrt(Z - 140) | 60% Health + 40% Stamina | 165 / 240 / 365 | 20% / 40% / 60% |
| **Disease Resistance** | 4× sqrt(Z - 100) | 40% Health + 60% Stamina | 125 / 200 / 325 | 20% / 40% / 60% |

**Formula notes:**
- Z = the weighted average of your attributes (shown in "Based On" column)
- sqrt() = square root function
- Breakpoints show the Z values where you reach each bonus tier (linear growth between breakpoints)
- The table shows bonuses **in addition to** your base value

## Understanding Build Impact

The "Based On" column is crucial for build planning:

- **Stamina-heavy builds** (archer, melee) get more movement speed and 2H/bow damage
- **Health-heavy builds** get more carry weight (80% Health) but trade offense for defense
- **Magicka builds** get magic resistance and magicka regeneration, but less physical damage
- **Balanced builds** scale moderately in all damage types

You can calculate your exact bonuses in the interactive calculator below, or check your current values in-game via Requiem's MCM menu.


# Calculator

The Wildlander team has created an interactive calculator to work out your exact Derived Attributes for any character state.

{: .important}
**Use "Make a Copy"** from the file menu to create your own editable version before experimenting!

<a class="btn btn-pink" href="https://docs.google.com/spreadsheets/d/10AUNfoiFYwpAHNHgkAmDXLxQdlAVKSJmm5O5fqHXfio/edit#gid=0" target="_blank" rel="noopener noreferrer">Calculator <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

## Next Steps

You've completed the core mechanics guide! Continue your journey:

- [NPC Crafting and Enchanting Services](https://wiki.wildlandermod.com/_03-YourFirstCharacter/npc-services/) — Learn how to use NPCs for crafting, tempering, and enchanting
- [Start Here in Wildlander World](https://wiki.wildlandermod.com/04-WildlanderWorld/0-Start-Here/) — Explore the broader Wildlander world and advanced topics