---
title: Spell Research Cheat Sheet
layout: default
nav_order: 4
has_children: true
description: Alchemy, Artifacts, Elixirs, and Spells reference
---

## Table of contents
{: .no_toc }
<details markdown="block">
<summary>
   Expand to view
</summary>
{: .text-delta }
1. TOC
{:toc}
</details>

Spell Research extends the alchemy/spell system with the introduction of magical liquids (solutions) that are produced by breaking down ingredients, potions, or enchanted artifacts, using an alembic or a cauldron.

---

## Alchemy

Alchemy can be a much quicker way to gain experience about spell archetypes, however, it notoriously requires a large amount of material.

{: .important}
> **Spell research alchemy is currently bugged in the main release (versions 1.1.11 or earlier).** You can fix it by unzipping the patch contents into `Game-files\mods\Wildlander\scripts` replacing existing files.
>
> [Download Patch](https://wiki.wildlandermod.com/Assets/Downloads/SR_QuestScript.zip) - If expired, check the Discord server in #patches-and-bugfixes

### Getting Started

**Tools needed:**

- **Alembic**: Required for analyzing or mixing magical liquids. Breaks down small quantities of ingredients into liquids. Crafted at a forge (1x steel ingot + 5x building glass + Craftsmanship perk).
- **Cauldron**: Breaks down large quantities of ingredients, potions, and enchanted artifacts into magical liquids. Requires fuel to work. Crafted at a forge (8x iron ingots + Craftsmanship perk).

Both can be purchased from apothecaries or commissioned at smithies. Spell vendors sometimes carry alembics.

**Obtaining materials:**

You will need a large supply of ingredients or potions. The gardening system from Hearthfire is useful here.

**Basic process:**

1. Use your alembic → select "Dissolve Items"
2. Place ingredients, potions, or artifacts to dissolve
3. Alembics dissolve small amounts (field tools); use Cauldrons for larger quantities
4. Place Cauldron in inventory and use it to place it in front of you
5. Fuel with ingredients/potions that have "Weakness" effects
6. Note: Cauldrons lose fuel when moved

**Processing liquids:**

Once you have liquids, you can:
- Select "Analyze Liquids" to gain spell archetype and alchemy experience
- Select "Mix Ingredients" to combine 3 liquids into alchemical ingredients (elixirs)

{: .hint}
> See [Elixirs section](#elixirs) for recipes to mass-produce powerful potions

Analyzing liquids grants elemental archetype XP and alchemy XP.

### Solutions Reference

There are many different kinds of liquids - one for each elemental archetype. Naming format: `<name> sa <potency>`

| Name | Archtype | Translation |
|--|--|--|
| Agea | Magicka | (n.) lore, knowledge [Ayleid] |
| Agea Arden | Resistances | literal translation "knowledge shield" [Ayleid and Dwemeri] |
| Aka ry Relleis | Time | literal translation "dragon of streams" [Aldmeri and Ayleid] |
| Altadoon | Weapons | (N.) weapon. [Ehlnofex] |
| Altadoon ry Bet | Diseases | Literally translated to 'Weapon as Beast' [Ehlnofex] |
| Arden | Shield | From vvarden- - (n.) strong shield. [Dwemeri] |
| Ayammis | Life | (n.) life. [Ayleid] |
| Ayammis Malata | Souls | literal translation "Life truth" [Ayleid] |
| Bal | Earth | (n.) stone. [Ehlnofex] |
| Betaltadoon | Poisons | literally translates to 'Beast-Weapon' [Aldmeri and Ayleid] |
| Betayammis | Creatures | literally translates to 'Beast-Life' [Aldmeri and Ayleid] |
| Dunayammis | Undead | literally translates to 'Cursed-Life' [Aldmeri and Ayleid] |
| Dunruhn | Trap | literally translates to 'Cursed-home' [Aldmeri and Dunmari] |
| Ghartok | Stamina | (n.) hand(s). [Ehlnofex] |
| Karan | Armor | (n.) armor. [Ayleid] |
| Karen Kogo | Force | literal translation "Armor unbreakable" [Ayleid and Dunmari] |
| Karan ry Ayammis | Health | literal translation "Armor of life" [Ayleid] |
| Latta | Light | (n.) light. [Ayleid] |
| Latta Loria | Shadow | literal translation "light darkens" [Ayleid] |
| Mafre | Frost | (n.) frost. [Ayleid] |
| Mallari | Metal | (n.) gold. [Ayleid] |
| Malatu Magicka | Arcane Energy | Literally translated "truth magic." [Ayleid] |
| Mer Ayammis | Mortals | Literally translated "People Life" [Aldmeri] |
| Mer ry Wel | Apparitions | Literally translated "People as Sky" [Aldmeri and Ayleid] |
| Mer Garlas | Flesh | Literally translated "People caverns" [Aldmeri and Ayleid] |
| Molag | Fire | (n.) fire. [Aldmeri] |
| Mora | Nature | (n.) forest, wood. [Aldmeri] |
| Pellenni Ayammis | Daedra | Literally translated "Outsides Life" [Ayleid] |
| Relleis | Water | (n.) streams [Ayleid] |
| Rellers ry Molag | Acid | Literally translated "streams as fire" [Ayleid and Aldmeri] |
| Varla ye Wel | Sun | Literally translated "star as sky" [Ayleid] |
| Volen Magicka | Magical Constructs | Literally translated "hammer magic." [Dwemeri and Ayleid] |
| Wel | Air | (n.) sky. [Ayleid] |
| Wel sa bell | Shock | Literally translated "Sky thunderous" [Ayleid] |

### Solution Ranks

Solutions are categorized into six tiers based on potency.

| Potions Equivalent | Suffix (weakest to strongest) | Translation | Rank |
|--|--|--|--|
| Dilute | sa Haelia | (adj.) So terrible. [Ayleid] | 0 |
| Weak | sa Goria | (adj.) So ugly. [Aylied] | 1 |
| Mild | sa Gravia | (adj.) So obscure [Ayleid] | 2 |
| Strong | sa Baune | (adj.) So mighty. [Ayleid] | 3 |
| Potent | sa Adonai | (adj.) So lordly. [Ayleid] | 4 |
| Concentrated | sa Sila | (v.) So shiny. [Ayleid] | 5 |

Each can be upgraded or downgraded using an alembic (Mix ingredients menu):
- Upgrading: Mix 3 of the same kind to produce one stronger liquid
- Downgrading: Reduce each to 2 weaker liquids

Example: 3× Relleis sa Goria → 1× Relleis sa Baune

### Ingredient Yield

Each ingredient produces two different strengths of solutions:
1. Solutions based on item effects
2. Solutions from ingredient base characteristics

**Item Effects**
- Solutions received depend on the archetype appearing on more than one item effect
- Strength calculation: `Strength = ((Sum of effect Magnitudes / 10) + (Sum of effect Durations / 300))`

**Ingredient Base Characteristics**
- Characteristics defined in import script (you always get all of these)
- Strength is hard-coded

**Quantities**

Number of solutions = `1 + random number of (your alchemy skill / 25)`

Examples:
- 10 skill = 1 solution
- 26 skill = 1-2 solutions
- 51 skill = 2-3 solutions
- 76 skill = 2-4 solutions
- 100 skill = 2-5 solutions

You always get the same types when breaking down a material, just in differing quantities.

### Potions

Solutions from potions are calculated based on potion effects:
- Solutions received depend on the archetype appearing in 1/2 of the potion effects
- Strength calculation: `Strength = Round(((Sum of effect Magnitudes / (Total effects × 25)) + (Sum of effect Durations / (Total effects × 120))))`

Example: Potion with 2 effects, one for 150 seconds at 10 magnitude, one at 150 seconds for 15 magnitude:
- `Strength = round((25 / (2 × 25)) + (300s / (2 × 120))) = round(1.75) = 2 - Gravia strength solutions`

#### Effect View
Shows archetypes of solutions from potions with specific effects.

**[View Effect View Page](https://wiki.wildlandermod.com/12Cheat-Sheets/Effect View/)** - Interactive reference for potion effect solutions

#### Ingredient View
Shows solutions from dissolving each ingredient.

**[View Ingredient View Page](https://wiki.wildlandermod.com/12Cheat-Sheets/Ingredient View/)** - Interactive reference for ingredient solutions

#### Solutions View
Shows which ingredients to dissolve for specific solutions.

**[View Solutions View Page](https://wiki.wildlandermod.com/12Cheat-Sheets/Solutions-View/)** - Interactive reference for ingredient to solution mapping

---

## Artifacts

This document contains a list of all artifacts in the game which can be examined by spell research.

<details markdown="block">
<summary>
   Expand to view
</summary>

| Artifacts | Archetypes |
|--|--|
| Ancient veller's Skull | Frost, Mortal, Stamina |
| Ancient Vampire Arm | Flesh, Undead |
| Ancient Vampire Hands | Flesh, Undead |
| Ancient Vampire Head | Flesh, Undead |
| Ancient Vampire Leg | Flesh, Undead |
| Ancient Vampire Ribcage | Flesh, Undead |
| Arvak's Skull | Creatures, Soul, Undead |
| Ash Spawn Sample | Constructs, Earth, Fire, Life |
| Attunement Sphere | Constructs, Earth, Fire, Life |
| Azura's Star | Daedra, Soul, Infusing, Siphoning |
| Bee in a Jar | Creature, Air |
| Blank Lexicon | Arcane, Construct, Infusing, Siphoning |
| Bloodstone Chalice | Flesh, Health, Undead, Strengthen |
| Bloodstone Chalice Filled | Flesh, Health, Undead, Strengthen |
| Bone Hawk Claw | Stoneflesh |
| Bone Hawk Feathers | Air, Creatures, Undead, Armor |
| Broken Azura's Star | Daedra, Mortal, Soul, Infusing, Siphoning |
| Butterfly in a Jar | Creature, Air |
| Canticle Bark | Nature, Time, Sensing |
| Centurion Dynamo Core | Construct, Metal |
| Control Cube | Arcane, Constructs, Controlling, Siphoning |
| Cracked White Phial | Arcane, Water, Infusing, Transforming |
| Damaged Albino Spider Pod | Creatures, Infusing |
| Death Hound Collar | Creatures, Frost, Metal, Undead |
| Diamond Paragon | Construct, Light, Summoning |
| Dragonfly in a Jar | Creature, Air |
| Eldergleam Sap | Life, Nature |
| Eldergleam Sapling | Life, Nature |
| Emerald Paragon | Construct, Light, Summoning |
| Enchanted Iron Mace Handle | Metal, Weapon |
| Enchanted Iron Mace Head | Metal, Weapon |
| Enchanted Iron Sword Blade | Metal, Weapon |
| Enchanted Iron Sword Handle | Metal, Weapon |
| Enchanted Iron War Axe Handle | Metal, Weapon |
| Enchanted Iron War Axe Head | Metal, Weapon |
| Enchanted Steel Battle Axe Handle | Metal, Weapon |
| Enchanted Steel Battle Axe Head | Metal, Weapon |
| Enchanted Steel Greatsword Handle | Metal, Weapon |
| Enchanted Steel Sword Blade | Metal, Weapon |
| Enchanted Steel Sword Handle | Metal, Weapon |
| Enchanted Steel Warhammer Handle | Metal, Weapon |
| Enchanted Steel Warhammer Head | Metal, Weapon |
| Heartstone | Earth, Fire, Cursing, Strengthening |
| Hilt of Mehrunes' Razor | Daedra, Health, Weapon, Cursing |
| Imbued Deer Skull | Creature |
| Imbued Deer Skull (horns) | Creature, Weapon |
| Imbued Eyeball | Flesh, Sensing |
| Imbued Goat Head | Creature, Flesh |
| Imbued Hagraven Head | Arcane, Creature, Flesh, Mortal, Transforming |
| Imbued Human Bones | Mortal |
| Imbued Human Hip Bone | Mortal |
| Imbued Human Remains | Flesh, Mortal |
| Imbued Human Ribcage | Mortal |
| Imbued Human Skull | Mortal |
| Imbued Skeever Head | Creature, Disease, Flesh |
| Imbued Troll Skull | Creature, Strengthening |
| Kaarstaag's Skull | Creatures, Strengthening |
| Kolbjorn Skull | Arcane, Fire, Mortal, Infusing |
| Lexicon | Arcane, Construct, Magicka, Infusing, Siphoning |
| Meridia's Beacon | Light, Controlling |
| Moth in a Jar | Creature, Air |
| Pelagius' Hip Bone | Fear, Frenzy, Mortal |
| Pommel Stone of Mehrunes' Razor | Daedra, Health, Weapon, Cursing |
| Potema's Skull | Undead |
| Quill of Gemination | Sensing |
| Reaper Fragments | Daedra, Soul, Undead |
| Resonance Gems | Light, Constructs, Controlling |
| Ruby Paragon | Construct, Light, Summoning |
| Runed Lexicon | Arcane, Construct, Magicka, Infusing, Siphoning |
| Sapphire Paragon | Construct, Light, Summoning |
| Scabbard of Mehrunes' Razor | Daedra, Health, Weapon, Cursing |
| Shards of Mehrunes' Razor | Daedra, Health, Weapon, Cursing |
| Sigil Stone | Daedra, Conjuration, Summoning |
| Soaked Taproot | Constructs, Life, Nature, Resistance, Water, Curing |
| Stalhrim | Arcane, Frost, Cloaking |
| The Black Star | Daedra, Soul, Infusing, Siphoning |
| Torchbug in a Jar | Creature, Air |
| Unmelting Snow | Air, Frost, Water |
| Vale Deer Hide | Creatures, Light |
| Vale Sabercat Hide | Creatures, Light |
| Weystone Focus | Arcane, Force, Shield, Controlling |
| White Phial (Empty) | Arcane, Water, Infusing, Transforming |

</details>

---

## Elixirs

There are six tiers of elixirs you can craft using the glass alembic.

To create an elixir of a specific tier with a specific effect, use the listed ingredients with the corresponding suffix.

**Example:** To create a 'Mild Elixir' with 'Damage Magicka' effect, use: Agea sa Gravia + Betaltadoon sa Gravia + Betayammis sa Gravia

### Elixir Tiers

| Elixir Prefix | Ingredient Suffix |
|--|--|
| Dilute | sa Haelia |
| Weak | sa Goria |
| Mild | sa Gravia |
| Strong | sa Baune |
| Potent | sa Adonai |
| Concentrated | sa Sila |

### Elixirs Database

**[View Elixirs Database](https://wiki.wildlandermod.com/12Cheat-Sheets/Elixir View/)** - Interactive reference for all 341 elixir recipes organized by effect

---

## Spells & Archetypes

Spell research allows you to create spells from discovered archetypes.

{: .important}
> **Notes:** Please check the Notes field before reporting bugs. Some spells cannot be created in the current version of Wildlander, others have incorrect spell levels or casting methods.

<details markdown="block">
<summary>
   Expand to view
</summary>

**[View Spells & Archetypes Database](https://wiki.wildlandermod.com/12Cheat-Sheets/Spells View/)** - Interactive reference for all 231 spells organized by school and level

</details>
