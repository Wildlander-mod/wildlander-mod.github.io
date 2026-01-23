---
layout: default
title: Horses & Herds
nav_order: 13
description: Horses, herds, and mount management
---

## Introduction

A horse is one of the best early investments in the game as it's essentially a mobile chest. It's always worth having a 12-hour fire’s worth of wood and a tent store inside in case of an emergency blizzard. 

{: .important}
Your horse is not immortal by default, so it is good advise to place down a crafted chest, and remove the inventory from your horse into this chest if you are leaving your horse unattended. As your horse can be killed while you are inside buildings/dungeons/caves/forts if you haven't checked the area for hostiles before entering.




## Horse Management

#### Guide by: Just plain old Crispy

Managing your own herd of horses in Wildlander can certainly be a challenge.  The support staff even goes so far as to state that it doesn't recommend you even allow your followers to ride their own horses, despite the fact that the game actually does support this feature because its **extremely** difficult to get working reliably .  This guide will serve to help ease the process and to illustrate that it's quite viable to indeed maintain your own loyal herd of steeds, but also to be able to (relatively) reliably have all of your followers ride along with you.

The first thing to know about the subject is that it's not perfect.  Immersive Horses, the mod behind Wildlander's support of herds and of followers being able to ride with you, is quite complex.  In fact, most aspects of it have been disabled by Dylan and the Wildlander team, probably in an effort to avoid trouble.  But, after plenty of experimentation and trial-and-error, I've been able to work out most of the kinks and get it working to my satisfaction.

Before diving into that, here are some basic things to cover first:

1. In order to obtain your first horse, you need to either purchase one at a local stable (the cities of Whiterun, Riften, Markarth, Windhelm, and Solitude all have one) or you need to "procure" one.  I won't be going into the latter method at all, since it comes with its own set of challenges (bugs).  Consider asking about it in the Wildlander Discord.  You can, however, rarely, actually encounter abandoned horses whose previous owners have been killed.  You can "adopt" such stray horses by crouching near them, hitting the 'E' key, then selecting Adopt. If the ‘adopt’ option is not available, ride the horse approximately 100 meters and try again. 

1. With your first horse, you now have access to a very valuable resource, its own inventory.  Horses can generally carry a lot of items; the exact weight limit they can deal with varies by horse, but its value can be accessed through the Immersive Horses menu under that horse's Stats section.  A convenient way to quickly access your horse's inventory is to be relatively close to it then to hit the 'U' key.  You can even store your own storage containers (barrels, chests) in your horse's inventory, which is especially handy when it comes to the weight of all those thousands of Septims you've earned.  As far as I know, horse inventory is completely safe (with the exceptions to potions which the horse will use if low on health or stamina), AS LONG AS YOUR HORSE IS SAFE.  So be careful when leaving it out in the wilderness.

1.  Adding more horses to your own herd is as simple as repeating the above process.  I do recommend buying all of your mounts, because as far as I know the purchasable horses are probably more reliable, but it's not required.  In any case, it is highly recommended, once you do own more than one horse, to go into those additional horses' Immersive Horses menu (crouch, hit 'E') and set the following:
* Under Manage Horses, then (Your new horse's name), Change Ownership, set the ownership of your new horse to My Team.  This allows any of your followers to be able to ride it once you mount up.
* Also under Manage Horses, change your horse's Aggression to Unaggressive 			(highly recommended)
* Check to make sure Confidence is set to Average.  This prevents your horse 			from bolting as soon as you encounter a mudcrab.

1. I also highly recommend NOT EVER RIDING ANY HORSES IN YOUR HERD OTHER THAN YOUR OWN.  This prevents odd bugs from creeping in, like weird shared inventory, disappearing saddles, etc.  In fact, don't even bother accessing any of your additional horses' inventories at all.  If you need that much carrying capacity, go get some strong potions or something.

---

### Horses and Followers

Now that you've got your very own equestrian collection, let's talk a little about the most trouble-free ways of getting your followers to ride with you on adventures.

FollowerLivePackage does include a option to have followers have horses, however investigations have found that this causes CTD's of type "6441D0". Therefore this option should never under any circumstances be used. Therefore the only mechanics available is to buy a horse, and add it to your herd, then allocating it to "my team" as above.

The mounting of their horses by your followers (you do have one horse per follower, right?) is a little clunky.  Depending on how far away from his or her chosen horse your follower is, them mounting up may take a second or up to ten seconds or more.  Just be patient.  Eventually all your followers will "find" a horse in your collection, mount up, and start following you.  You did remember to set each of your additional horses' Ownership to My Team, right?  It appears that the actual combination of who mounts whom (ahem) is random; I don't think there's any way to permanently assign Erandur to Cinnamon, for example.

Regarding following distance, your fellow riders are generally terrible in their horsemanship skills.  Once you halt, they'll almost every time gallop right up into you moving you and your beast out of their way.  Eventually you'll master your positioning as you (frequently) halt and turn to face your followers catching up to you.  They do tend to navigate the terrain fairly well, but don't count on them being able to off-road on their horses as well as you probably can; similarly to when on-foot, often your followers will take the path of least resistance to catch up.

If you do manage to get too far ahead of your posse, you're going to notice that your follower(s) will teleport, sans horse, to your location.  This is quite jarring and irritating, because it forces you to stop, dismount, access your Immersive Horses menu, then Summon Herd from the Management menu.  It looks best visually to do this from third-person perspective, by the way, since it will trigger an animation of your character pulling out and blowing a horn.  Roll back your mouse wheel or just hit 'F' before performing the Summoning process.  Do this as often as you need to in order to keep your riders and their horses together, but if you get sick of it, just keep riding until you reach your destination, then Summon your herd from there.  I don't recommend letting your horses get left behind, however, because it's a harsh world out there.  They could freeze to death, get mauled by a sabre cat, or something else too horrible to contemplate.

To help alleviate the above situation, there is a value in the FollowerLivePackage MCM menu that you may want to consider adjusting:  I changed the Distance to Warp value (applies to all your followers) to 10,000 which reduces the frequency of my followers magically dismounting and popping into existence without their mount beneath them.  Adjusting that value may alter your experience with your followers in other scenarios such as in dangerous (large) dungeons, so adjust according to your own best judgment.

---

### Some other miscellaneous things to bear in mind:

Does riding your horse while in first-person perspective make you motion sick?  Me too!  Just get into the habit of hitting 'F' every time you ride, then adjust third-person distance according to taste using your mousewheel.  Eminently better.

Sometimes, when dismounting, especially near other horses in your herd, your perspective in the game will turn exactly 90 degrees.  This indicates, due to a bug, that you've just spawned slightly below the ground's surface.  If you see this, just jump.  That should nearly immediately alleviate the condition and everything should be fine.  To avoid this, I tend to dismount when nothing is too close to me.  Again, with practice, your own horsemanship skills will improve, which includes spacing from the rest of your team.

For convenience, I adjusted the hotkey that is used in the Immersive Horses MCM for Herd Menu to 'NumLock'.  This allows you to be able to perform the Summon Herd procedure (and other things) without having to crouch near one of your horses and hitting 'E' first.  Very handy.  Don't forget to switch to third-person perspective first if you don't want to recoil in horror as to what Summoning your herd looks like in first-person view.

You can quickly call your horses (not the same as Summoning them) with the 'H' key.

You can rename your horses.  Do this from the Management screen in the Immersive Horses menu for each horse.

I do not recommend altering any of the values in Immersive Horses for Swapping Positions nor for Rideable Workspaces.  Leave those values alone.

In case you're curious, yes, generally, your horse (I think almost any horse in the game) has near-infinite Stamina when it comes to sprinting (if they are carrying stamina potions then they defiantly will use these to keep their stamina high). It simply will never get tired.  Bear in mind, however, the next time you get into a race with your other party members, that their horses do NOT always sprint.  So, if you get too far ahead of them (10,000 units of distance if you followed my suggestion about Warping distance, above), one or more of your followers will appear next to you out of thin air without Sea Biscuit underneath them.

If you ever get a particularly friendly (or thirsty) horse in your herd that somehow wanders its way into an inn with you, or even into a dungeon entrance, just go back outside, switch to third-person, then Summon your herd.  It should appear along with the rest of your saddled buddies near you, probably after having ordered a mead.

Did you know you can fight and cast spells while mounted in Wildlander?  The particulars are a little different than on-foot, and can be a bit mysterious, but try testing it.  It's quite amusing (and satisfying) to see your well-armed follower(s) slice a pesky wolf in half while still mounted, then casually sheathe their weapons.  Casting spells while mounted features no animation at all (due to a game engine limitation), but, generally, works for most spells.  Experiment!

---

That's it for my horses guide.  I hope you found it useful and to you I wish good horsemanship.  Ride!

