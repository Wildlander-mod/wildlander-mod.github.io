# Magic in Wildlander

There are lots of expansions to the magic systems in wildlander, the biggest change being that your skill in magic means nothing without perks. you can have 100 skill in a specific school, and casting a novice tier spell will do the same damage, and cost the same as if you were at level one if you have no perks in that specific tree. Learning specific perks (novice, apprentice, adept, expert and master perks)  also grants you free spells from that tier.  

In addition to this, with the introduction of [spell research](https://github.com/Wildlander-mod/Support/wiki/Spell-Research) you are no longer restricted to gaining spells though buying or finding spell books, you can learn spells simpky though researching and combining thesis based on your studies.

Enemy resistances to your illusion spells has also been introduced, when you cast a spell, your skill in that tree is compared to the enemy mental resistance, and can break free of your spells based on that resistance value - more on this in the next section.

Some Spells now have a upkeep magicka drain which will slowly drain magic for as long as the spell is in effect. This upkeep value increases with the more powerful your spells become, and is unaffected by items which reduce spell costs.

Duel-casting from vanilla has been overhauled to "Empowered spells" Instead of multiplying all magnitudes and durations by a given factor, empowered spells have all new effects, making the spell often way more powerful than its common version. In contrast to dualcasted spells, empowered spells also have a tier-dependent cost-factor, ranging from 130% for Novice spells up to 170% for master level spells.

## Resistance versus illusion spells

Whenever an offensive illusion spell is cast, the game calculates a ”break-free chance” for the victim. 

The calculation of the break-free chance is a comparison between the caster’s spellpower, determined by her illusion skill, and the willpower of the target, determined by level, magicka pool, illusion skill and magic resistance. Once this break free chance has been calculated, then a 100-sided dice is thrown in game to on the initial cast and every two seconds afterwards. If the initial dice throw is less than the break free chance, the spell fails and the victim is unaffected completed, otheriwse the victim suffers the effects until the next dice throw.  If the target does not break free from the spell on the next dice throw, the effect continues until the victim breaks free or its duration expires.

The specific calulation is below (heavy math - i know)

![image](https://user-images.githubusercontent.com/26418143/160236172-3d312939-14e8-4de5-b9df-4606ac6dcb3b.png)

Note: Spell specific value is defined as  1 for Novice spells, 5 for Adept spells, 10 for Apprentice spells, 15 for expert spells and 20 for master spells.


Since this formula might not be very enlightening to people who do not deal with mathematics every day, this image illustrates the practical effect of the above formula for a few enemies and appropriate spell tiers

![image](https://user-images.githubusercontent.com/26418143/160236228-5a2ca016-8293-45a4-9f4c-939826855661.png)


## Spell costs

Spell costs are calculated based on several factors. The Base cost of the spell, the weight of your gear, the perks you have and your current stamina.

Take a basic Candlelight spell (The caster creates a bright hovering light that lasts for 300 seconds.) - the base cost of this spell is 150 magicka. If you are completely naked, at full stamina with 0 skill & perks in alteration - this is how much it would cost to cast.

If everything else remains the same, but your stamina was below 20% the magika cost would be 300.

Taking the Novice Alteration perk (Novice spells cost 55% less magicka, and improve 1% per skill level.) - would reduce the base spell cost to 82.5 magicka, and the duration of the spell would increase 1% for every skill point you have.

The final factor which determines spell cost is the weight and type of your equiped items. 

Assuming you have no perks in the respective armor trees  :- 
* Wearing pure clothing  the spell cost is multipled by 1 (at 10 kilos) and up to 2.2 (at 150 kilos) spell cost increase depending on the total weight of your equiped gear.
* Wearing light Armor the spell cost is multipled by 1.1 (at 10 kilos) and up to 6.1 (at 150 kilos) spell cost increase depending on the total weight of your equiped gear.
* Wearing heavy armor applies the harshest penalties and the spell cost is multipled by 1.5 (at 10 kilos) and up to 20 (at 82 kilos or greater) spell cost increase depending on the total weight of your equiped gear.

Once you get the appropiate perks then, light armor reduces to the clothing tier, and heavy reduces to the light. the below image shows the spell multiplication cost factor Vs weight. 

![image](https://user-images.githubusercontent.com/26418143/160237232-239e2388-b843-492a-b750-62948403c58a.png)

Taking the candlelight example again (with no perks and wearing 50 kilos)
* Wearing pure clothing the spell cost is multipled by 1.25 = spell cost 187.5
* Wearing light Armor the spell cost is multipled by 2.1 = spell cost 315
* Wearing heavy armor the spell cost is multipled by 7.5 = spell cost 1125

In summary spells cost more if you :-
* don't have high enough level perks for the spells you are casting (ie. you get penalties casting novice-level spells without novice-level perks)
* wear armor when casting 
* wear heavy equiptment
* are low on stamina (sub 20%).



