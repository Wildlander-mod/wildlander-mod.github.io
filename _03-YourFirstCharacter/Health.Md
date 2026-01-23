---
layout: default
title: Health Management
has_toc: true
nav_order: 6
description: Health Management
---


Wildlander has passive health regeneration set to 0%. You will not heal from your wounds by "sleeping it off" or waiting like in vanilla. 

When you get hurt fighting - the only ways to heal are :-

- Restoration spells (for the living)
- Conjouration spells (for the undead)
- Health potions (For undead, only max level healing potions (superlative) will work.)
- Healing Poultice (see note below) 
- Alchemy Perk
- Raw Ingredients
- Enchantments
- Engraved bones (Kynareth): gives passive health regen for the duration.

## Health regeneration Calculations

There are several actor values involved in calculating total health regeneration:

1. The players's maximum Health.
1. The HealRate.  expresses the percentage of maximum health that is regenerated per second, real time. This is set to 2%
1. The HealRateMult. expresses a percentage modifier to the base HealRate. This is the value modified by most sources of +health regen enchants, items and potions. This is set to 0% by default
1. The CombatHealthRegenMult. expresses an additional multiplier that is only active while in combat. This is set to 7%

This equates to this passive health regeneration formula:

HealthPerSecond = MaximumHealth * HealRate% * HealRateMult% * (IsInCombat ? CombatHealthRegenMult : 1.0)

Changes made to the HealRateMult actor value in wildlander are additive, E.g. using a 5% enchant and a 100% potion will increase your "HealRateMult" to 105%  (0% base + 5% + 100%)


## Healing Poultice 

Healing poultices are SLOW action healers, but heal for a lot. If you engage in combat or sprint while the effect is active, it will be suspended for the duration of said combat or sprint action, and reactivate a few seconds after. It is therefore recommended that you only use healing poultices in a safe place, and that you wait for at least an hour for the effect to work.

To Craft:- 

```
Requirements:-
* Alchemy Lore (Rank 1) Perk or Craftmanship Perk.
* 5 Medicinal Salve.
* 1 Bandage.
* Survivalists toolkit.
```

All items are crafted From the “Right Shift” craft menu.

Medicinal Salve can be crafted from any ingredient with Restore Health (e.g  Blue Mountain Flower). Requires Alchemy Lore Perk (Rank 1) or Craftmanship Perk and Survivalists toolkit.

Bandages can be crafted from any cotton or linen cloth using a Survivalists toolkit. You can also breakdown cotton/linen Cloth items into Bandages from the breakdown menu.





