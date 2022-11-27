---
layout: default
title: Immersive Equipment Display
has_toc: false
has_children: false
parent: Deep Dives
---

# Immersive Equipment Display

### If you're here just to find out how to turn off displaying favorited equipment and do not wish to use the mod.
Ctrl+Backspace to open the menu > Tools > Settings > Displays > Player Gear Toggle Keys > Make a hotkey w/ or w/o a modifier and you can turn that feature on/off as you like.


![image](https://user-images.githubusercontent.com/88904551/177073913-a0c72891-d64e-41ed-9d63-ca28d8750ac9.png)

Immersive Equipment Display, or IED for short, is a fantastic mod that allows you to display almost anything you can think of on your character. Weapons, potions, scrolls, and more can be displayed.

Unlike similar mods such as AllGUD, IED doesn't mess with mass, equipping and unequipping items as the moment dictates and risking any mass-related scripts to have a stroke.

IED places a 3D model of the item in question to display, with options available to show, change, and hide under various circumstances.

The purpose of this guide isn't to explore every option the mod has, it is instead meant to give you an understanding of how to display and position various items on your character as you see fit.

If I don't go over an option or a menu, assume that it isn't needed for the vast majority of users, if I don't know what an option does I will mention so where appropriate.

As I learn more about this mod I will endeavor to update the guide appropriately. Currently there aren't any in-depth guides available that go over everything, so the *vast* majority of this guide is me exploring it.

Think I've missed something or gotten it wrong? Please tag me @3DJutsu in Discord and lemme know what needs fixed or added!



## THE GUIDE

<details>
<summary>FAQ</summary>
<br>


> Are there preset available to save time on setup?
* There are, actually, but until customization is opened installing a preset will void your access to official support unless you can replicate the issue on an unmodified Wildlander list. When customization opens I plan to update the guide with presets and more!

> More?
* Yes! There's a number of additional mods that play into IED and combined they're really cool! Can't wait to show you. =]

> Why isn't item XYZ upgrading based on my inventory?
* When setting your list of additional item models to draw on, you've either missed a model or you've goofed the priority of the model you're after.

> Why can't I locate Two-Handed Hammers in the filters?
* They fall under the Two-Handed Axe filter for some reason.

> Why is my Weapon jumping around when I equip it? It won't stay where I want it to!
* You edited it through View>Equipment instead of View>Gear Positioning. Editing through the former only affects the display, use the latter to affect the actual equipment. Edit both to possess so the gear stays in the assigned spot whether or not it's equipped.

> Why don't the animations match up?
* Because to do so requires FNIS, and we use Nemesis which seems to be incompatible for whatever reason. 

However many matching animations can be assigned in XPMSE, so if you edit the position of any given display in IED with a node available in XPMSE remember to set it in there as well. Otherwise your back-worn sword will still be drawn from your hips! 

> The MCM won't open up!
* As many people possess a non-standard keyboard, it's (usually) the key between [=] and [Insert]

![image](https://user-images.githubusercontent.com/88904551/177057693-0332bb42-8786-4d0b-8462-c3861b02e645.png)

> My character is stuck blocking after I exit the IED menu.
* The last thing the game "remembers" is that you pressed Left Control, which is the hotkey for Dual Wield Block. Press it again to go back to normal.

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>

<details>
<summary>MCM</summary>
<br>

![image](https://user-images.githubusercontent.com/88904551/177034722-6c6598de-7e04-4b86-a89a-885d091e8b3f.png)

IED doesn't have a traditional MCM. Instead it possesses its own in-game menu that is shown with L-Ctrl+Backspace, allowing you to see your changes in real-time.

For those with a different keyboard, you're looking for this.

![image](https://user-images.githubusercontent.com/88904551/177057728-797b1e9e-558d-4e73-bb96-331cd44a5e3f.png)

Even though many of the settings have an accompanying [?] to inform you of its purpose, I still advise against messing with any of them unless you're certain you know what you're doing and are willing to accept the consequences thereof. 

You have been warned! [*cue spooky echo*]

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>

<details>
<summary>VIEW</summary>
<br>

![image](https://user-images.githubusercontent.com/88904551/177027447-36896d7d-a4f1-4f6b-a7eb-beb1165ba4a8.png)
![image](https://user-images.githubusercontent.com/88904551/177027401-5a5a019e-b71f-4365-97ff-2a3a7fa1c413.png)
![image](https://user-images.githubusercontent.com/88904551/177028004-12c646c1-c70b-422d-a7c6-6d695d1c7ed1.png)

Displays the tabs and filters for:
* Equipment - *Weapons and Shields. This affects displayed, but not equipped, models.*
* Custom - *Anything that typically isn't equipped and you want to display.*
* Gear Positioning - *Weapons and Shields. This affects displayed AND equipped models. If you want the gear you use in combat to stay in its displayed spot you'll need to edit the position both here AND in the aforementioned Equipment section.*

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>

<details>
<summary>TOOLS</summary>
<br>

![image](https://user-images.githubusercontent.com/88904551/177028430-d3188847-71e6-4f7d-a8d6-1f831604dff4.png)
![image](https://user-images.githubusercontent.com/88904551/177029612-73c03af2-bad2-4297-84e7-1192948ebd15.png)

The only two tools the average user will need to worry about using are:
* Preset Editor - *Modify the values of Presets in terms of Equipment or Custom items.*
* Settings - *Alter various mod settings here such as various UI elements.*

![image](https://user-images.githubusercontent.com/88904551/177030436-eb8e9795-62c7-451d-8881-c3f6df112e1f.png)

Of which, the only two you need to mess with are Displays and UI.

![image](https://user-images.githubusercontent.com/88904551/177029627-0638d639-d356-4373-9a5b-45798390073c.png)
 
* Keep equipped items loaded - *Essentially hides a displayed items 3D model instead of unloading it, preventing any potential issues that result from asset loading when switching between items. Uses more memory.*
* Keep player gear loaded when toggled off - *The same as above, but used with toggling the entire display on/off.*
* Player gear toggle keys - *Hotkey (with or w/o modifier) to turn the entire display on/off. Perhaps to take screenshots without a small platoons worth of gear on your back?*
* Disable NPC equipment displays - *Toggles what it says.*
* Remove favorited restriction - *With this checked, if it's in your inventory, it gets displayed.*

![image](https://user-images.githubusercontent.com/88904551/177029638-58e8a408-9ed8-4966-909e-7061c61df064.png)

* Style - *Color-scheme of the MCM. Do yourself a favor and don't select light unless you want to bleed from your eyeballs!*
* Alpha - *Controls transparency of the entire MCM.*
* BG Alpha - *Controls transparency of the MCM but not text.*
* Close on Esc - *Does exactly what is says.*
* Enable Restrictions - *Prevents the menu from opening during certain situations.*
* Control Lock - *Effectively locks out most of the controls, deselecting this will enable you to move around and operate the camera as normal.*
* Freeze Time - *Stops time when the menu is open, handy if you don't want to be snuck up on or want days passing while you readjust your gear.*
* Select Crosshair Actor - *Automatically selects the actor/npc/race in your crosshairs.*

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>

<details>
<summary>TABS</summary>
<br>

![image](https://user-images.githubusercontent.com/88904551/177023953-8d499d05-d921-418d-9df0-ae353f2960e1.png)

Near the top there are four different tabs, these will determine what you're altering the look of and are as follows:
* Global - *Affects all actors, split between PCs and NPCs.*
* Actor - *Affects a specific NPC (i.e. Rinina, the Imperial Soldier).*
* NPC - *Affects a general 'class' of NPCs (i.e. Imperial Soldiers).*
* Race - *Affects all members of the given race.*

Under each tab are a few options:
* Male - *Affects only male members of the chosen tab.*
* Female - *Affects only female members of the chosen tab*
* Sync - *Affects both male* and *female members of the chosen tab but only when directly editing a value.*
* Propagate to Overrides - *Propagate changes to equipment overrides, but only when directly editing a value (still trying to figure out what this means).*

![image](https://user-images.githubusercontent.com/88904551/177023945-84f80828-5789-4a18-b5ae-3715f9e79f1a.png)

Within each of those is a Preset drop menu:
* Preset drop menu - *Select your desired preset from here.*
* Save - *Save the current settings to the selected preset.*
* Merge - *Merge your current settings into the selected preset.*
* Apply - *Apply the selected preset, altering the current settings.*
* New - *Create a new preset based on the current settings.*

![image](https://user-images.githubusercontent.com/88904551/177030954-2ee2a70b-25b8-4775-a485-c53a5839ebc3.png)

Finally, we have the filters. Which show the various items you can alter for all the above.

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>

<details>
<summary>EQUIPMENT</summary>
<br>

![image](https://user-images.githubusercontent.com/88904551/177056173-be5c779f-e6e7-4322-814c-5e812ec387d1.png)

This section will cover displaying equipment, more specifically weapons and shields. Do note that you have a limited number of slots to modify, only one of each weapon can be displayed at a time, with off-hand variants allowed an extra slot. 

To begin navigate to View>Gear Positioning, from here you will select the item in question that you want to modify. For this example we'll reposition a 1H sword and dagger combo.

![image](https://user-images.githubusercontent.com/88904551/177055770-2ef38259-97cc-4056-8bbf-26d50c56b9ed.png)

Let's begin with the sword. Select "Sword Back".

![image](https://user-images.githubusercontent.com/88904551/177055802-2b1b0fcb-e36e-4f86-a38f-49a858ea9592.png)

Now since we're working with an off-hand Dagger, use the Dagger Left drop tab and select "Dagger Back Hip Left".

Looks kinda silly unsheathing weapons from our hips of their on our back, right? Let's fix that. 

Esc > Mod Configuration > XPMSE > Styles

Set Sword Style to "Sword on Back" and Dagger Style (Left) to "Dagger on Back Hip". Remember to apply this to the Player drop tabs, and use the NPC drop tabs when applying them to NPCs (note that ALL NPCs will use these animations, regardless of what you have their individuals weapons set to in IED.

Do remember though that not all IED Nodes have XPMSE Animations and not all animations have nodes. Set them where appropriate and available as well as setting the same positions in the Equipment section. 

This allows your weapons to stay in their equipped (but sheathed) locations when using other weapons. If you don't replicate the settings (by hand, naturally, can't copy them) then when with the above setup when I go to equip a bow my Sword is put back where it naturally rests on the hip.

Additionally, this is SPECIFICALLY for a weapon in a given slot. If you decide to MH the Dagger and OH the Sword your displayed models will be at the default for MH dagger and OH Sword.

Below are before and after setting the same placement for each weapon the same in both IED and XPMSE, a noticeable and immersive difference. 

![image](https://user-images.githubusercontent.com/88904551/177056216-3e54874b-2c78-4761-946e-b75c79b3c0c3.png)
![image](https://user-images.githubusercontent.com/88904551/177056242-32889a02-14b2-4d93-8c37-75a8103c5914.png)

Ta-da! Easy, right? 

Keep in mind that this only affects gear you actually equip and you cannot alter its placement beyond the above. If you have gear that you want displayed, but don't plan on actually equipping (say, a hunting knife in a 'shoulder sheath') then please refer to the Placement tab.

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>

<details>
<summary>CUSTOM</summary>
<br>

Here we will explore how to display items that aren't normally equipped (in the same context as weapons anyways); potions, scrolls, soul gems, and more! 
To my knowledge, there isn't a hard limit on what you can display. So long as you have the memory to spare you can show a great many things! Why, a Wildlander that is dedicated (and bored) enough could probably make a suit of armor made entirely of soul gems!

![image](https://user-images.githubusercontent.com/88904551/177058373-24e939c0-81bf-45b4-8ce2-287f9d9510c9.png)
![image](https://user-images.githubusercontent.com/88904551/177058366-25141eb5-2419-4d54-9899-fb32df0c8b98.png)


View>Custom then Actions>New to get things going.

![image](https://user-images.githubusercontent.com/88904551/177058405-a9a33fab-c11f-4ae5-9472-53536c6b2743.png)
![image](https://user-images.githubusercontent.com/88904551/177058426-8c7361d8-04dd-47b3-aa01-838ffec68801.png)


Every adventurer needs a health potion starting out, right? Click 'OK' and open your new drop tab.

![image](https://user-images.githubusercontent.com/88904551/177060280-5cffa043-a708-4aaa-9f3e-ed04f3cd7560.png)
![image](https://user-images.githubusercontent.com/88904551/177058564-6f0aea8d-3dcd-4915-919e-6da0ca5154c7.png)
![image](https://user-images.githubusercontent.com/88904551/177060250-e97b18b8-ccf7-41bb-bf8c-18537ce24532.png)

Select a Potion of Restore Health (Remarkable).

![image](https://user-images.githubusercontent.com/88904551/177059989-b020cb2f-90b6-4a4a-8cb5-5893feee416a.png)

Quick side note: You can search for an item by Category Tab, or by using the FormID or Name search boxes.

![image](https://user-images.githubusercontent.com/88904551/177060334-248e6224-198b-49b1-9a06-47ea290c6082.png)

Want the potion model to alter based on what you've got in your inventory? We can do that too!

The only option I would concern yourself with here is whether or not you want to require the item to be saved as a Favorite in order to show.

![image](https://user-images.githubusercontent.com/88904551/177060319-42348ca3-90ed-441c-9c61-004d156de00d.png)
![image](https://user-images.githubusercontent.com/88904551/177060444-7c8c24c2-7930-4013-b2cb-44b82dcbc781.png)


Let's add a priority list for our health potions! Click on "Browse" and select all the potions you want to show in that slot based on inventory availability. For now we're going to add in all available "Restore Health" potions.

![image](https://user-images.githubusercontent.com/88904551/177060386-0f10eccd-e2d2-4db3-a349-c4ee963913bb.png)
![image](https://user-images.githubusercontent.com/88904551/177060478-52204372-86ac-4308-a547-5c0dd74b7a3c.png)


Confirm your selection at the bottom of the panel and you should have the above first screen. We want our potions to show from most powerful to least, so we'll use the arrows on the left side to reorder the list to our liking so it comes out like the second picture. Now, if we have stronger potions in our inventory, they'll be displayed over the others.

![image](https://user-images.githubusercontent.com/88904551/177059311-deeb3715-5836-4ecb-a91c-fb90382d0c0a.png)

You can also get models to show based on min/max item count, but I've not fiddled with this just yet.

![image](https://user-images.githubusercontent.com/88904551/177060603-9806180b-2fb0-4034-ab98-29124a0a4ec5.png)

Time to attach our potions to a general area! Select Lower Spine and don't worry, it's not gone. Look behind you!

Please reference the next tab to determine its final placement.

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>



<details>
<summary>PLACEMENT</summary>
<br>

![image](https://user-images.githubusercontent.com/88904551/177060637-e9782b62-54a8-4ee1-ae0c-a06983904ca0.png)

Now comes the tedious part. Placement. This section applies to both equipment and custom items as the process is the same either way.
* Position - *The increments at which the item moves left/right, up/down, or forward/back.*
* Rotation - *This is done in 'degrees', i.e. inputting a value of 360 will essentially do nothing as you've made the mode do a full 360°, inputting a value of 90 will rotate the object 90° in the chosen direction.*

This table explains the placement in normal, positive values (+), or negative values (-), direction is referenced as though you were the 'node'. The nodes left is your left, which mean things get weird when using nodes at odd angles. This is one of the more annoying aspects of the mod, as there isn't a slider or buttons to use, you can only input numbers using the top of your keyboard, NumPad doesn't work! Without presets you're largely on your own for this one.

| Left(-)/Right(+) | Backward(-)/Forward(+) | Down(-)/Up(+) | Position | 
| --- | --- | --- | --- |
| Counterclockwise(-)/Clockwise(+) Vertically | Counterclockwise(-)/Clockwise(+) Horizontally | Rotates top of item Away(-)/Towards(+) Node| Rotation |

Scale controls the size of the object.

![image](https://user-images.githubusercontent.com/88904551/177067241-a1e3658d-cc5e-4d9c-a0e5-aaf339f2ab26.png)

You can, however, use my coordinates to get you started with potions and the like!

![image](https://user-images.githubusercontent.com/88904551/177067331-83718bea-dfc2-49e3-81dc-ad720b2774cd.png)
![image](https://user-images.githubusercontent.com/88904551/177067366-48c7c1c3-10d2-422d-be9c-089118f80e2f.png)

As you can see, as I drop the higher tier potions the weaker potion models take effect thanks to the conditional inventory settings we applied earlier.

![image](https://user-images.githubusercontent.com/88904551/177067504-a80d9665-5b7d-41c4-b3a4-48316cd1e7fa.png)

Below Scale, you'll find what are called Equipment Overrides. (Pretty sure this is what Propagate Overrides is targeting, to what end though is still beyond me.)
These allow you to apply conditions to your model displays based on the selected criteria. For instance, it makes sense that our armor may have some kind of 'potion belt' attached to it, but what about when we take off the armor? You'll see the potions stay put, breaking immersion. So lets apply some restrictions!

![image](https://user-images.githubusercontent.com/88904551/177067837-a51c9058-23e4-45ca-bc4e-8e005cbe0619.png)

With the above options (make sure Disable is ticked on the lower half, otherwise it won't work) you'll find that when you take your armor/robes off, so too do your potions!

![image](https://user-images.githubusercontent.com/88904551/177067979-7a7b48fc-3fce-4f5f-9c18-3ac2bdd229ab.png)
![image](https://user-images.githubusercontent.com/88904551/177068004-27b02875-5b49-41a2-b27d-8671f085aa04.png)
![image](https://user-images.githubusercontent.com/88904551/177068036-0e071d24-54eb-42d1-9ac9-6e36b61a2304.png)
![image](https://user-images.githubusercontent.com/88904551/177068063-8aa39b94-12c0-4c97-9418-de3cd66eaabf.png)

Note how the potion persists through armor swapping until I remove it, but the hunting knife stays put regardless. That is the effect of not having the restrictions in place.
There you have it, you're ready to get to making all sorts of awesomeness! Like these fantabulous potion earrings!

![image](https://user-images.githubusercontent.com/88904551/177070636-d9dcb469-ef30-44e9-b469-8572fb9f8517.png)

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>

<details>
<summary>TL;DR</summary>
<br>

![image](https://user-images.githubusercontent.com/88904551/177074144-3dcf9bca-ec04-4f82-ba4c-ffb25faf8459.png)

There isn't one you peanut! "Gearing up" will go faster the more you mess with IED, but ultimately you'll need to go over at least some of the guide to get going. 

I'm still fumbling around with it but it only took a bit of time over a few days to really get dug in. 

I don't know when custom support get released but when it does I'll update the guide as soon as reasonably possible to include the presets so you can get that drip you've been after!

[top](https://wildlander-mod.github.io/11-Mod-Deep-Dives/Immersive-Equipment-Display.html#the-guide)

</details>