---
layout: default
title: IEquip Deep Dive
nav_order: 3
has_children: false
description: iEquip mod equipment management, weapon cycling, potion management, and quick functions.
---

## What Is IEquip?

Skyrim's menu system is notoriously inefficient. You pause the game, open your inventory, find a potion, consume it, close the menu, and resume—all while combat rages around you. IEquip removes this friction entirely by allowing you to switch weapons, spells, shouts, potions, and countless other items without opening a single menu.

Instead of pausing to equip your shield, you press a hotkey. Instead of digging through your inventory for a healing potion mid-combat, you hold a hotkey and IEquip administers the exact potion you need. No interruption. No menu. Pure immersive gameplay where your character stays focused on the fight rather than frantically searching their bags.

The system revolves around **four main hotkeys**—one for your left hand, one for your right hand, one for shouts and powers, and one for consumables and poisons. Each hotkey responds to different press types: single tap, double tap, triple tap, and hold. This gives you unparalleled control over your equipment without requiring a memorized keyboard map or extensive configuration. Gamepad players benefit equally from these hotkey combinations, making IEquip fully accessible to all playstyles.

## Building Your Equipment Queues

At the heart of IEquip is the concept of **queues**—organized lists of your favorite weapons, spells, and items that cycle with each hotkey press.

When you equip an item directly (through inventory, magic menu, or another hotkey system), IEquip automatically adds it to the appropriate queue. Your swords go to the right hand queue, your shield to the left, your flames spell to the spell queue. Over time, your queues fill with your most-used items, ready for instant access.

You can also manually manage your queues through the **Queue Management Menu**, accessible in-game. Here you can reorder items, remove weapons you've outgrown, or clear everything and start fresh. If you accidentally added an item to your queue, mark it as blacklisted so it won't auto-add again if you equip it later.

IEquip respects your choices. Two-handed weapons and ranged weapons lock to the right hand. Shields and ward spells lock to the left. Your most-used items stay at the top of the queue, so cycling through your weapons finds your sword, axe, and bow in seconds.

## Cycling Through Weapons and Spells

Combat in Wildlander demands flexibility. You might need a shield one moment and a spell the next. IEquip makes switching instantaneous.

{: .note}
**Wildlander Configuration Note**: By default, Wildlander disables left and right hand weapon cycling through the main hotkeys because repeated cycling can impact performance. However, the cycling feature remains available and fully functional if you wish to enable it through IEquip's MCM settings. The information below describes how weapon cycling works for reference, or if you choose to activate this feature.

Press your left hand hotkey and cycle through shields, 1H weapons, or torches without breaking stride. Press your right hand hotkey and switch between swords, axes, bows, and spells. Each press cycles to the next item in your queue. Hold the Utility Key while cycling and move backward through your queue instead—useful when you overshoot your intended weapon.

Double-tap your right hand hotkey while a spell is equipped, and IEquip instantly equips that same spell in both hands ready for dual casting. For synchronized spell combinations like flame and frost, or restoration and protection, this single action makes devastating spellcasting combinations accessible without cycling through every spell in your queue.

Your shouts and powers cycle individually—shouts equip immediately when you cycle to them, ready to use. As you learn additional howls in werewolf form, you cycle between them just like normal shouts, keeping all your transformations fluid and responsive.

## Ammo Management

Archery becomes genuinely strategic with IEquip's ammo system. When you equip a ranged weapon, your left hand slot becomes an ammo cycler. Press your left hotkey and cycle through your available arrows—fire, frost, explosive, daedric—selecting exactly what you need for the shot ahead.

You can configure IEquip to automatically prioritize your best ammo (by damage), your most abundant ammo (by quantity), or your most recent ammo (by name). Some configurations even keep your best ammunition automatically selected so you never waste powerful arrows on weak enemies.

For hunters and archers who prioritize stealth, IEquip supports enchanted ammo fully, with special handling so enchanted arrows take priority over base arrows. Imagine cycling to your last poison arrow just as an archer rounds the corner—perfect timing, every time.

The ammo system includes an advanced mode that lets you keep a secondary item in the left hand queue (like a dagger for close-quarters combat) that instantly re-equips when you put your bow away. Draw bow, shoot, lower bow, dagger appears in hand—all with smooth, logical item switching.

## Potion Management and Smart Consumption

IEquip revolutionizes potion use. Instead of opening your inventory and drinking randomly, you actively manage your health, stamina, and magicka through IEquip's intelligent system.

Press your consumable hotkey to cycle through your potion queue—healing, magicka restoration, stamina enhancement. Hold the same hotkey and drink the displayed potion immediately. This simple action/hold pattern gives you complete control over which potion you consume and when.

But IEquip gets smarter the more you use it. The **Smart Select** feature automatically identifies when you're in combat and low on health, and can be configured to consume a healing potion for you without you explicitly doing anything. Configure your thresholds—do you want healing at 50% health or 25%? IEquip remembers and acts accordingly.

The system groups potions intelligently. All restoration potions gather in one group, fortification potions in another. IEquip shows you how many healing potions you have remaining and warns you when supplies run low—a visual indicator changes color when your healing potions dwindle below your configured threshold. It even checks for active potion effects, preventing you from double-dosing on buffs you already have active.

For mage characters, the potion system integrates with spell management. If you'd rather cast a healing spell than drink a potion, you can configure IEquip to equip a healing spell first, then fall back to potions only if magic isn't available.

## Weapon Enchantments and Soul Gems

Carrying soulgems for weapon recharging has always been tedious. IEquip streamlines this through the **recharge system**.

Your currently equipped weapon displays its enchantment charge status—a meter, a progress bar, or a dynamic soulgem showing remaining charge. When that meter dips below your configured threshold, a warning displays. When you're ready to recharge, hold your left or right hand hotkey and IEquip automatically selects the ideal soulgem for the job.

You can configure IEquip to use the smallest adequate soulgem first (efficient, no wasted soul energy) or to use the largest soulgem (faster inventory management). You can even prevent "oversized" soulgem use, ensuring a grand soulgem never recharges an iron dagger's enchantment.

For advanced mage setups with GIST—Genuinely Intelligent Soul Trap—IEquip recognizes partially-filled soulgems and handles them intelligently, letting you use up fragmented souls before cracking open new ones.

## Quick Functions: Combat Decision-Making

IEquip includes specialized **Quick Functions** triggered by triple-tapping hotkeys, giving you instant access to exactly what you need in heat-of-battle scenarios.

**Quick Shield**: Triple-tap your left hand hotkey and IEquip finds the optimal shield or ward spell. If you're wielding a 2H weapon, it equips a shield and 1H weapon in one action, ready for defense. Casting spells? It equips a ward instead.

**Quick Ranged**: Triple-tap your right hand hotkey to instantly equip your preferred ranged weapon. If you've already equipped ranged, triple-tap again to switch back to your melee weapons seamlessly.

**Quick Restore & Quick Buff**: Triple-tap your consumable hotkey and IEquip assesses your character's status. Low health? It consumes a healing potion (or equips a healing spell if you've configured that preference). Low stamina? It drinks a stamina restoration potion. Low magicka? Magicka restoration activates. Multiple deficits at once? IEquip can intelligently consume up to nine potions with one activation, prioritizing the most critical needs first.

**Quick Dualcast**: Configure IEquip to automatically equip specific spell schools in both hands. Devastating fireballs, dual wards, or synchronized elemental combinations—all accessible without manual cycling.

**Preselect Mode**: Triple-tap your shout/power hotkey to enter Preselect Mode, revealing three additional item slots alongside your normal left, right, and shout slots. Cycle through these preselected items without equipping them, allowing you to queue up your next weapon combination while staying focused on current combat. When ready, double-tap to equip your preselected weapon, or hold to equip an entire set of items at once. This feature is perfect for complex loadouts that change frequently—warrior one moment, archer the next.

## Poisons and Weapon Enhancement

Beyond just equipping weapons, IEquip manages poison application and weapon modification.

Double-tap your left or right hand hotkey while your consumable hotkey displays a poison, and that poison instantly applies to your equipped weapon. The widget shows you exactly which poison is currently applied and how many charges remain. You can stack multiple doses of the same poison (building to high charge counts) or swap poisons mid-fight, replacing the old poison with a fresh one.

IEquip fully supports advanced mods like Complete Alchemy & Cooking Overhaul, recognizing special poisons, waxes, and oils with their appropriate charge counts and effects.

## Torch Management and Light

IEquip includes a dedicated torch system that transforms torch usage from an afterthought into a managed mechanic.

Assign a **QuickLight hotkey** and press it to instantly equip a torch or the Candlelight spell—your choice, toggled between them. Unlike vanilla torches that reset their timer every time you unequip them (an exploit), IEquip's **Finite Torch Life** system tracks remaining torch life even when the torch is in your inventory. A torch that's been burning for three minutes stays burned for three minutes, whether equipped or sheathed.

Watch your torch burn down through an immersive **Burn Out system**—as the final 30 seconds approach, the torch' light radius gradually decreases, casting your character into deeper shadow until the torch extinguishes completely. Your character's vision genuinely darkens as the light dies, creating tension and atmosphere.

If you need darkness to escape pursuers, drop your lit torch with a quick action, and it continues burning on the ground where you left it, gradually dimming. Alternatively, configure IEquip to automatically equip a fresh torch when your current one extinguishes, maintaining light without manual action.

## Beast Form Transformation

IEquip's support for **werewolf and vampire transformations** keeps immersion intact even in beast form.

When you transform into a werewolf, IEquip switches to displaying claw icons and howl switching. If you've learned multiple howls, cycling your shout/power hotkey switches between them. Transform back to human and your weapon queues reappear exactly where you left them.

For **Dawnguard's Vampire Lord** form, your human spells and powers automatically become available in the queue. Powers, left hand spells (like Drain Health), and right hand spells all cycle normally. When you land from flight, IEquip automatically adjusts your equipment configuration—walking combat priorities differ from airborne combat.

**Undeath mod's Lich form** receives the same treatment: all spells, powers, and abilities remain accessible through your normal cycling hotkeys, making transformation forms feel like natural combat states rather than menu-locked limitations.

## Configuration and Customization

IEquip comes with an extensive **Edit Mode** accessible through the in-game Utility Menu. In this mode, every widget element is individually customizable:

- Position items anywhere on your screen
- Scale elements larger or smaller
- Adjust transparency for subtle or prominent display
- Rotate elements for artistic preference
- Change text colors to match your aesthetic
- Align text left, center, or right

Six optional widget backgrounds let you match your preferred visual style—from minimal and clean to detailed and immersive. Fadeout options let your widget disappear during non-combat moments, keeping your screen uncluttered.

The **MCM configuration** provides deep control over behavior:

- Adjust multi-tap and hold delays to match your reflexes
- Configure which souls get used for recharging
- Set potion consumption thresholds and priorities
- Choose ammo sorting methods (damage, quantity, or name)
- Enable or disable specific features entirely
- Toggle Quick Functions on or off individually

## Integration and Compatibility

IEquip fully supports **Gamepad++** for gamepad users, providing unprecedented controller access to normally keyboard-dependent features. What keyboard users accomplish with hotkeys, gamepad players accomplish through carefully designed button combinations.

The mod integrates with popular overhauls like **Complete Alchemy & Cooking Overhaul** (recognizing grenades, special potions, and oils), **Throwing Weapons Lite**, and other item-expanding mods, ensuring that all your custom items integrate seamlessly into the cycling system.

## The Immersive Alternative

IEquip represents a fundamental reimagining of inventory management. Instead of treating equipment as a menu system, it treats it as a real-time action system. Your character doesn't stop to think about which weapon to grab—they simply draw their next weapon from their prepared selections, ready to fight.

For characters on expeditions, merchants on the road, and adventurers exploring dangerous dungeons, IEquip keeps the action flowing and the experience immersive. You focus on combat decisions, not inventory management. You stay in the world, not paused in a menu. That's what IEquip delivers.

<div align="center">
	<img src="https://i.imgur.com/5qCylD9.png">
</div>

* Individual cycler queues for left and right hand items, shouts and powers, potions and consumables, and poisons
* Support for all equippable item types including staffs, scrolls, throwing weapons, etc
* Support for all mod added items and spells
* Support for tempered, enchanted and renamed items including keeping track of any changes
* Bound weapon support
* Ammo switching when a ranged weapon is equipped with sorting options and enchanted ammo support
* Select and consume potions, food and drink
* Health, stamina and magicka potion grouping with intelligent selection
* Beast form transformation support including Werewolf, Vampire Lord (Dawnguard) and Lich (Undeath) with power, spell and howl switching
* Torch features including non-exploitable finite torch life, remaining time meter, realistic re-equip, reducing light radius and more
* Feature-packed SkyUI HUD widget with full WYSIWYG Edit Mode
* Display currently applied poison with remaining charge count and hotkey poison application
* Display current enchantment charge as meters or dynamic soulgems, with low charge warnings and hotkey recharging with intelligent soul selection
* Display temper level and degradation information 

<div align="center">
	<img src="https://imgur.com/7HbPnEd.png">
</div>

## The Controls
-  Four main gameplay hotkeys - one each for left and right hand, one for shouts/powers, and one controlling both the consumables and poison slots
-  Multiple controls per key - press, double press, triple press, hold - each with different functions
-  Configurable multi-tap and hold delays
-  Utility Key gives access to the in-game Utility Menu, and acts as a combo key allowing reverse cycling and more
-  Utility Menu gives access to the Queue Management Menu, Edit Mode and the in-game Help Menu
-  Optional Extended Keyboard Controls giving direct access to many of the multitap features, plus an additional QuickLight hotkey
-  Full integration with Gamepad++ giving an unprecedented level of control to gamepad players


<iframe class="youtube_video" src="https://www.youtube.com/embed/c5TScewkZLA" allowfullscreen="1" frameborder="0">
</iframe>


## The Widget
- Advanced, animated SkyUI HUD Widget
- Real Time WYSIWYG Edit Mode - every individual element is fully customisable (position, scale, transparency, rotation, text colour and alignment)
- Five widget 'slots' - Left Hand, Right Hand, Shouts/Powers, Consumables (beneficial potions, food and drink), and Poisons
- Option to disable shout/power, consumable and poison slots and all associated features
- Ammo display when ranged weapon equipped with ammo count and choice of three ammo icon styles
- Health/Magicka/Stamina Potion Groups with Potion Type Selector and early warning system for number of Restore potions remaining
- Enchantment charge display - customisable meters or dynamic-fill soulgems
- Poison info display - currently applied poison names and remaining charge counts with several display options
- Temper level display - dynamic % based icons with poor condition warning, and various textual display options
- Customisable widget &amp; text fadeout with contextual display options
- Choice of six optional widget background styles
- Many other visual tweaks and options


<iframe class="youtube_video" src="https://www.youtube.com/embed/L41cvw8ervg" allowfullscreen="1" frameborder="0">
</iframe>

## MANAGING THE QUEUES 

- Add items to your queues from within your Inventory and Magic menus by highlighting them and pressing your main hotkeys
- Auto-Add items to your queues when equipping directly, either through the menus or other hotkey methods
- 2H weapons, ranged weapons (including bound ranged weapon spells) and 2H spells restricted to right hand queue
- Shields, ward spells and torches restricted to left hand queue
- Choose to restrict single 1H items to one queue, or allow to be added to both (with option to allow hand to hand switching)
- All mod added items and spells supported
- Queue Management menu accessed through the in-game Utility Menu so you can re-order the queues, remove items or clear the queue completely
- Optional blacklist so items previously removed are not auto-added if subsequently equipped
- Removed item caching - items are removed from the queues when stored/disarmed/etc and re-added to the previous queue when added back into your inventory
- Allow queues to grow dynamically or set a hard limit on number of items per queue
- Optional Queue Position Indicators which adapt automatically to queue length, displaying equipped item and current cycling positions


<iframe class="youtube_video" src="https://www.youtube.com/embed/pSgBUyodsyg" allowfullscreen="1" frameborder="0">
</iframe>


## Switching Weapons, Spells, Shouts & Other Items

- Tap main hotkeys to cycle the left, right, shout/power and consumable slots
- Double tap consumable key to cycle poison slot
- Hold the Utility Key while cycling to cycle backwards through the queues
- Configurable Equip On Pause delay allows continuous cycling with nothing being equipped until you pause on an item
- Disabling Equip On Pause forces each item to be equipped immediately on cycling
- Shouts and Powers are equipped immediately when cycling
- Cycling to items in the consumable and poison slots makes the displayed item available for consumption or application
- Option to skip auto-added items while cycling
- With any 'either hand' spell equipped, double tap that hand key to automatically equip the same spell in the other hand ready for dual casting
- Optional attribute icons give a quick indication while cycling that items are enchanted and/or poisoned
- Unique identification system handles multiple items of the same type, guaranteeing the correct item is always equipped
- Enchantment charge level, temper level, poison info and item names update automatically each time an item is equipped
- Destruction spell type display (fire, frost, shock)
- Integrated support with custom icons for Complete Alchemy &amp; Cooking Overhaul grenades, Throwing Weapons Lite and other popular mods
- 'Unarmed' shortcut in right hand queue to allow you to quickly disarm both hands ready for brawling
- Disarm protection - if disarmed or weapon breaks the next item in the queue will equip automatically.-  In the case of ranged weapons and shields iEquip will search the queue for a like for like replacement first, then fall back on something else if no direct replacement found
- Full bound spell support with animated switching from spell school to bound weapon icons when spell is successfully cast and back again when sheathed


## Ranged Ammo

-  Left slot becomes cycleable ammo queue when a ranged weapon is equipped
-  Option to sort ammo queue by damage (and always equip best ammo), name (always equip last ammo) or quantity (always equip most plentiful ammo)
-  Simple Ammo Mode - Only ranged weapon and ammo are displayed
-  Advanced Ammo Mode - Additional cycleable slot shows item to be re-equipped in left hand when switching back from ranged weapon
-  In Advanced Ammo Mode single tap on left key cycles ammo, double tap cycles next left hand item
-  Enchanted ammo support with enchantment type display, with higher priority sorting (by damage) than base ammo
-  Various options for what to do when last ammo for current ranged weapon is used up, including switching ranged weapon type, equipping another weapon, or doing nothing and waiting for more ammo to be found

## Using Poisons

-  Double tap consumable key to cycle poison queue
-  Double tap left or right key to apply displayed poison to currently equipped weapon
-  Option to allow 'topping up' current poison - charges stack
-  Option to 'clean off' current poison and apply displayed poison (if different)
-  Integrated support for Complete Alchemy &amp; Cooking Overhaul waxes, and Smithing Oils oils with 10 charges applied
-  Optional sliders for Charges Per Vial and Concentrated Poison perk multiplier
-  Optional poisoning messages

## Recharging

-  Optional fully configurable enchantment charge meters or dynamic fill soulgems
-  Low charge warnings
-  Hold left/right key to recharge currently equipped weapon
-  Intelligent soul selection
-  Option to use largest soul required to recharge, or use up smaller souls first
-  Option to disallow use of oversized souls (no wastage)
-  Integrated support for GIST - Genuinely Intelligent Soul Trap, including option to disallow use of partially filled soul gems

## Potions and Consumables

-  Single press to cycle consumable queue, hold to consume displayed item
-  Health, Magicka and Stamina Potion Groups with group counts, containing all relevant potions sorted into separate Restore/Fortify/Regen Rate sub-queues
-  Intelligent, customisable 'Smart Select' so you can define when and which potions should be consumed
-  Potion Type Selector with contextual display options and individual potion type counts allows you to cycle and consume potion types with each group
-  Low Restore potion count early warning system alters text colour of Potion Group count as restore potions run low
-  Active effect checking blocks consumption if potion effect (buff or restore over time) already active on player, reducing wastage

## QuickLight & Torches

- Dedicated QuickLight hotkey allowing you to instantly equip either a torch or the Candlelight spell, and press again to switch back to previous item(s)
- Fully customisable torch life meter displaying remaining torch life
- Finite Torch Life toggle - removes vanilla infinite torch exploit where unequipping and re-equipping resets the torch life timer. Now remaining torch life will be remembered no matter how many times you unequip and re-equip a torch. Timer only resets when a torch is removed from your inventory.
- Option to adjust how long torches last for, from default value (eg 4 minutes in vanilla, 30 minutes in Requiem) down to just one minute- 
- 'Burn Out' system allows torches to gradually burn out (light radius reduces in stages) during the final 30s of torch life
- Option to automatically equip another torch when current one expires, with configurable Realistic Re-Equip delay
- Integrated Simple Drop Lit Torches function (double tap left to drop lit torch), courtesy of Snotgurg, with several options for what happens when you drop a torch, including drop another, cycle the left hand, equip a shield, etc.
- If a torch is dropped during 'Burn Out', the dropped torch retains reduced light radius and burns out completely after 30 seconds

## Beast Form
 
- Werewolf transformation support including claw icons and howl switching (shout slot) once multiple howls learnt
- Dawnguard Vampire Lord transformation support with power and left hand spell switching, and dynamic switching on land/take off
- Undeath Lich transformation support with power and left hand spell switching
- Path of Transcendence Bone Tyrant transformation support with power and spell switching
- For all transformations, all howls, spells and powers are automatically added to the queues the first time they are equipped normally, including through the Undeath spell selection menu.-  Only spells and powers normally available in these forms are added, no cheaty exploits here allowing weapon equipping!
- Support for all mod-added Werewolf and Vampire Lord spells and powers


<iframe class="youtube_video" src="https://www.youtube.com/embed/ejYMi24oAJA" allowfullscreen="1" frameborder="0">
</iframe>


<div align="center">
<img src="https://i.imgur.com/OtPnbGm.png">
</div>

A suite of fully configurable 'heat of battle' features designed to give you quick access to exactly what you need, when you need it most.

## QUICK SHIELD

-  Triple tap left key to automatically equip the first shield (or ward spell) found in the left hand queue.-  If nothing is found in the queue then iEquip will scan your wider inventory for something suitable.
-  Option to always 'Prefer Magic' in which case look for ward first, then shield
-  Otherwise check current right hand item and match shield for weapon, or ward for spell
-  If 2H weapon equipped then equip a shield and 1H weapon, or ward and spell from preferred school

## QUICK RANGED

-  Triple tap right key to automatically equip first of preferred ranged weapon type or ranged bound weapon spell found in right hand queue.If nothing is found in the queue then iEquip will scan your wider inventory for something suitable.
-  Various options for what to switch back to on second right key triple tap

## QUICK RESTORE & QUICK BUFF

-  Triple tap consumable key to automatically consume restore and/or buff potions for enabled stats as required
-  Fully configurable activation thresholds and intelligent 'Smart Select' with active effect and combat state checking
-  Allows intelligent smart selection and consumption of up to nine potions with a single activation
-  Option to 'Prefer Magic' for Healing, in which case a healing spell will be equipped (with option to dual cast) rather than consuming a healing potion. If magic preferred but no spell found then a potion will be consumed, if potion preferred but none found then optionally a healing spell will be equipped if found.-  If spells are equipped then triple tapping again will switch back to the previous items, with an option to automatically consume a restore magicka potion.

## QUICK DUALCAST

-  When equipping 'either hand' spells from the chosen schools always equip them in both hands ready for dual casting
-  Option to only allow QuickDualCast if the spell has been added to both queues
-  Differs from the regular double tap to dual cast feature in that spells will always be dual equipped based on the QuickDualCast settings without the need for an additional action 

## PRESELECT - MODE

-  Triple tap shout/power key to activate Preselect Mode
-  Three additional slots will be displayed alongside left, right and shout/power slots
-  Tapping to cycle will no cycle the preselect slots, leaving the current items equipped, allowing you to queue up next item or group of items
-  Double tap left, right or shout/power key to equip the preselected item
-  Hold left or right key to equip both hands at the same time, or hold shout to equip all three preselected items at once (dynamic equip sets)
-  Option when equipping the preselected item to either swap with current item, or equip and cycle the preselect slot on one position
-  Option to toggle back out of Preselect Mode when equipping all items
-  QuickShield/QuickRanged options to equip or preselect when Preselect Mode active.
