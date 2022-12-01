---
title: Spell Research (Alchemy) 
layout: default
nav_order: 1
description: Spell Research (Alchemy) 
parent: Cheat Sheets
---

# Spell Research (Alchemy) 

Spell Research extends the alchemy/spell system with the introduction of magical liquids (solutions) that are produced by breaking down ingredients, potions, or enchanted artifacts, using an alembic or a cauldron.

Alchemy can be a much quicker way to gain experience about spell archetypes, however, it notoriously requires a large amount of material.

# Getting started

To start you will need one (or both) of the tools below
- Alembic: Required for analyzing or mixing magical liquids. Can break down (dissolve) small quantities of ingredients into liquids. Can crafted at a forge using 1x steel ingot + 5x building glass + Craftsmanship perk.
- Cauldron: Used to break down large quantities of ingredients, potions [v2.0+], and enchanted artifacts, into magical liquids. Requires fuel to work. Any ingredients or poisons that have a ‘weakness’ effect can fuel the cauldron (e.g. Salt pies). Can be crafted at a forge using 8x Iron Ingots + Craftsmanship perk.

Both of these items can be bought from apothecaries, or commissioned at a smith if you cannot craft it yourself. Also, spell vendors sometimes carry alembics for sale.

You will also need a large supply of ingredients or potions The gardening system from Hearthfire may actually be useful here.

Once you have enough materials you can start dissolving.

Use your alembic, then select "Dissolve Items", you can then place in your alembic ingredients, potions, or artifacts to dissolve.

However, alembics can only dissolve a small amount of material at a time. So they are often used as field tools.

To dissolve larger amounts at a time, you need to use a Cauldron.
* Once you have acquired a cauldron, you need to place it. 
* Simply use it in your inventory, and it will be placed in front of you.
* For a cauldron to dissolve items, you need to supply it with fuel.
* It is fueled with ingredients and potions that have "Weakness" effects.
* Cauldrons lose any remaining fuel when they are moved, keep that in mind when you place them.

Dissolving items will give you a large amount of bizarre liquids, which you can then use in your alembic.

You can either select "Analyze Liquids", which will have you perform some tests on these liquids, which will in turn give you some experience in spell archetypes. This also gives you some experience in your Alchemy skill.

You can also select "Mix Ingredients". This will allow to mix together three of these liquids to create alchemical ingredients (elixirs) to be used in the vanilla alchemy system. You can also create rare vanilla ingredients and other useful materials if you find the required materials.

Liquids can be mixed into potent elixirs (a type of ingredient), and different salts, e.g. void/fire/frost salts. Please see the [Elixers cheat sheet](..\12-cheat-sheets\Spell-Research-Cheat-Sheet-(Elixers).html) for recipes

If you manage to find the right recipes (or use the cheat sheet) you can mass produce a large amount of powerful potions.

Analyzing liquids with an alembic grants elemental archetype XP and some alchemy XP.

There are a lot different kinds of liquids - one for each elemental archetype. They are categorized into six tiers based on potency. The naming of the liquids is < name > sa < potency >

* Agea - Magicka 
* Agea Arden - Resistances
* Aka ry Relleis - Time
* Altadoon - Weapons
* Altadoon ry Bet - Diseases
* Arden - Sheild
* Ayammis - Life 
* Ayammis Malata - Souls
* Bal - Earth
* Betaltadoon - Poisons
* Betayammis - Creatures
* Dunayammis - Undead
* Dunruhn - Trap
* Ghartok - Stamina 
* Karan - Armor
* Karen Kogo - Force
* Karan ry Ayammis - Health 
* Latta - Light
* Latta Loria - Shadow
* Mafre - Frost
* Mallari - Metal
* Malatu Magicka - Arcane Energy
* Mer Ayammis - Mortals
* Mer ry Wel - Apparitions
* Mer Garlas - Flesh
* Molag - Fire
* Mora - Nature
* Pellenni Ayammis - Daedra
* Relleis - Water
* Rellers ry Molag - Acid
* Varla ye Wel - Sun
* Volen Magicka - Magical Constructs
* Wel - Air
* Wel sa bell - Shock

*Ranks* 

Potions Equivilent | Suffix (weakest to strongest)
-- | --
Dilute | sa Haelia
Weak | sa Goria
Mild | sa Gravia
Strong | sa Baune
Potent | sa Adonai
Concentrated | sa Sila

Each one can be upgraded or downgraded using an alembic (Mix ingredients menu). Upgrading liquids requires 3 of the same kind to produce one stronger liquid, or each one can be reduced to 2 weaker liquids.

For example a liquid called Relleis sa Goria would be a medium strength water archtype liquid. Mixing 3 of these will produce Relleis sa Baume, and so on.

## Ingredient 

Each ingredient has two Strengths of Solutions which can be generated
* One which is affected by the Item effects 
* One which comes from the Ingredient characteristics 

Item effects 
* The item Effect Solutions received depend on the Archetype appearing on more than one item effect for a Ingredient
* The Strength of the potions for Effects is calculation based on the total magnitude and total durations of the effects.

        Strength  = ((Sum of effect Magnitudes / (10)) + (Sum of effect Durations/(300)))
        Note: If the Strength of the potion is greater than 5 - you get no solutions for the Effects.


Ingredient characteristics
* The item characteristics are Solutions items defined in the import script - you will always get every one of these
* Strength of the potions for characteristics is hardcoded


Quantities

The number of solutions for each of the above is  1 + (random number of you your alchemy skill / 25)

You will always get the same Solutions when you break down a materiel, just in differing quantities.

## Potions

Solutions are calculated based on Potions effects 
* The item Effect Solutions received depend on the Archetype appearing 1/2 of the Potion effects.
* The Strength of the potions for Effects is a calculation 

        Strength  = Round(((Sum of effect Magnitudes / (Total number of effects * 25 )) + 
                           (Sum of effect Durations/(Total number of effects * 120))))

E.g a potion which has 2 effects, One for 150 seconds at 10 magnitude, and one and 150 seconds for 15 magnitude

        Strength  = round((25 / (2 * 25 )) + (300s /(2 * 120)))
                  = round(1.75) 
                  = 2 - Gravia strength solutions


**In Progress Effects and Ingredient Spreadsheet**

[Link](https://docs.google.com/spreadsheets/d/1sNWiM32s9iA1pUlxBmPh13sd1e2DYMjHn17gqjkvO0U/edit?usp=sharing)
