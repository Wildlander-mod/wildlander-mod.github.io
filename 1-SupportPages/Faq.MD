---
layout: default
title: FAQ
nav_order: 3
parent: Support
---
![Image](https://user-images.githubusercontent.com/26418143/144291957-c00567fb-bc21-44e7-b36d-6e8453d277d7.png)

------
# Navigation Structure
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

------
# What is Wildlander?

Wildlander is the new name for "Ultimate Skyrim SE". We chose to rebrand the project to separate it from the Ultimate Skyrim list and reduce confusion.

The Wildlander mod list is a complete rebuild from the ground up so some of the features you maybe used to are not available because they haven't been converted to SE and/or it was too complex for us to do so. An example of this is "Atronoch Crossing" Additionally, some of the mods which ARE available for SE have major changes which would require rebalancing, such as "Hjarchen Farm," or simply don't work such as in the case of "Dark Dungeons," "Locked City Gates," and the full version of "Enhanced Skyrim Factions: The Companions."

This isn't to say some of these features won't return in some fashion in the next few builds, just that they didn't make the deadline for compatibility for this one. 

You can download and install from [here](https://www.wildlandermod.com/download)

----
# How do I donate to the project?

If you would like to buy your friendly neighborhood support person a drink of [KO-FI](https://ko-fi.com/wildlanderteam)

Or support Dylan himself on [Patreon](https://www.patreon.com/dylanbperry )

----------
# Wildlander and Antiviruses

Several Antivirus programs are known to cause issues with the list.

1) Bitdefender

{: .save}
> * Does not like Wabbajack's Downgrading routine and can cause corruption, preventing the game to launch.
> * Causes crashes while saving.
> 
> Recommendations: Disable Bitdefender during Wabbajack install. Apply the following fixes after install to prevent crash on save
> 1. Easy solution - Turn off Advance Threat Defense when playing Wildlander
> 1. proper Solutions Add a ADT exception for Wildlander\game-files\Stock Game\SkyrimSE.exe
> 1. If you also have "Ransomware Remediation" on Add Wildlander\game-files\ModOrganizer.exe       

2) Webroot
{: .save}
> *  Webroot Antivirus is completely incompatible with the .net Crash logging mod we use in the pack. It will cause a crash on Startup. 
> To play, you need to shut down the antivirus completely from the system tray. 
> There are no options you can tick, and no exclusions you can apply to make this antivirus play nice.
> ![img](https://media.discordapp.net/attachments/881254575640838254/937500500360851466/unknown.png) 

3) McAfee Antivirus is known to cause a corruption in the Skyrim downgrade during installation.

         1) Disable McAfee 
         2) Delete game-files\Stock game
         3) Rerun Step 2 - Wildlander.Wabbajack, choosing Overwrite installation and wait for install to complete.
         4) you should now be able to launch.

4) Norton

If using Norton, and it blocks the launcher for intrusive activity (During start up - while it's checking for updates) you may want to configure these settings: https://support.norton.com/sp/en/uk/home/current/solutions/v15471442/ to exclude a URL or domain from monitoring URL: https://github.com/Wildlander-mod/Launcher/releases


----------

# Do I need to uninstall Ultsky?

Not unless you're short of hard drive space - Ultsky uses Oldrim, Wildlander uses new.

----------

# What version of Special Edition is needed?

The Steam version of Elder Scrolls V: Skyrim Special Edition - Update 1.6.640 (AKA the free Anniversary update) installed in English (https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/). You do **not** need Elder Scrolls V: Skyrim Anniversary Upgrade, which is a DLC made available at the same time

If you have downgraded back to Special edition version 1.5.97, you will need to verify game files.



----------

# Do I need to buy The Elder Scrolls V: Skyrim Anniversary Upgrade DLC?

No. It is not required to play Wildlander. 

We use an installation method called stock game, which copies the Skyrim files we need to the Wildlander directory. This method allows you to have Wildlander, and a separate steam installation of Skyrim.

If you already have the DLC, you can still install the content, as we will simply ignore it during the installation process and not copy it over. 

----------

# Can I add the Creation Club content / Anniversary Edition DLC to my Wildlander install?

No, This content counts as customization. It is Unsupported and Untested. Some of them are known to conflict and cause CTD's with other mods in the list.

----------

# I already have Skyrim: Legendary Edition, why do I need to buy Special Edition?

Special Edition is a completely different version of game engine (64 bit instead of 32 bit). Wildlander requires the 64-bit game engine, as it uses mods which require the 64bit version of SKSE. Therefore, Wildlander cannot be installed on Legendary Edition.

----------

# When is Ultimate Skyrim returning?

It won't be returning to the Wabbajack gallery. The Wabbajack file, along with install instructions, are currently pinned in the Ultsky Support channel on Discord.

I have no further information as to if it will be formally re-released on the Wildlander website.

----------

# How long to download without Nexus Premium?

There have been reports of anywhere from 4 hours to 4 days, depending on how much attention you are paying to the Wabbajack downloader and the speeds you are getting from your ISP. Times may also differ based on whether you are downloading to an SSD or an HDD.

----------


# Can I see the mod lists?

> Full: (https://loadorderlibrary.com/lists/wildlander-11-official-standard-mods)
> 
> Potato: (https://loadorderlibrary.com/lists/wildlander-11-official-potato-mods)

----------

# Can I see the differences between Ultimate Skyrim and Wildlander?

Yes - Click [Here](..\2-RecommendedReading\6-Changes-From-Ultsky.html)

----------

# Does this mod pack support other languages?

No, and if you try, then SKSE crashes from Mod Organizer. You will need to install English Skyrim - Special Edition to play this modpack.

----------

# How do I update to the current version?

Backup any changes you have made to the modpack since your original install, as these will be lost. If you want to keep any mods you've added to your personal install, rename those mods to start with `[NoDelete]` to force Wabbajack to skip those files. Note that support still won't be officially provided; use this feature at your own discretion. 

Then follow the instructions [here](..\16-OtherResources\How-to-update.html)

The latest version will always be available [here](https://www.wildlandermod.com/download) for clean installations

Please Note: Some updates will require a brand-new game and are not save compatible.

----------

# Do I have to update?

No. All updates require you to manually run Wabbajack to download and install the latest mods for the new build.



----------

# How do I uninstall?

We're sorry to see you leave!

Uninstalling Wildlander is a simple matter of deleting the installation folder.

Uninstalling the launcher requires you to use Windows “Add / remove program” functionality.

----------

# Can I remove the downloads' folder?

Yes, but if you want to install an update, or repair your install, you would need to redownload all 500+ mods.

You can however safely move your download folder to another hard drive.

----------


# Wabbajack Installation Issues

## Do I have to install both game and downloads to same drive?

No. You can have them on separate drives. Just make sure you point your Download location to where you want the zip files to live.

----------

## How much drive space do I need?

Around 120gb.

----------

## How many mods?

521

----------

# Do I need to download everything if I plan on playing potato?

Yes. Wabbajack won't install unless it has all mods. Creating a list for potato users only is not easy to do and would require a completely separate Wabbajack installer.

----------


# Can I just download the Graphics only?

No. Again, this would be a completely separate list which would need its own separate Wabbajack installer.

----------
# **Installation Issues**

## Wabbajack fails to start with a "Unknown Error".

Delete Wabbajack.exe, Redownload from http:\\Wabbajack.org.

----
## Wabbajack fails to start "You Cannot run as a Admin".

Wabbajack cannot be run as an Admin. 

If you are not manually running the game as an Admin, check your windows UAC settings and make sure that UAC is not "off" as this will run everything as an admin.

[![img](https://cdn.discordapp.com/attachments/666599178788536331/1041355863832678500/image.png)

Reboot your PC after making this change.

Note: If you have installed a custom version of windows and cannot turn on UAC (or you have and it doesnt work)

Create a basic user account (Accounts -> Other users then add other user, click on Users, more actions and create new user.

login to that account - start Skyrim to add the registry entries for that user.

Log back into your primary account.

Then Holding shift, right click the .exe which will give a "Run as different user" command, select your created basic user and if that user is not administrator it should work

----

## Wabbajack fails to download mods or hangs for a long time.

Check Task Manager. If Wabbajack is not using any network resources, it is likely the download has failed/timed out. If this is the case, then please use the suggestions below:

1.  Close and restart Wabbajack. Start the Wildlander install process again, entering the same criteria as originally. Wababjack will CRC check your existing files and should resume where it failed and complete the installation without any further intervention.
2.  If you are experiencing issues with Wabbajack repeatedly failing to download one or more files (same files every time), try enabling the Network Workaround in Wabbajack settings.

[![img](https://camo.githubusercontent.com/72d29a1cda8ff5fa29f42ff8232ea890764cbae1c17344c50a8deea51645cf3c/68747470733a2f2f696d616765732d6578742d322e646973636f72646170702e6e65742f65787465726e616c2f4f506f423576314f734e516c3749315f592d2d636a3967527567553759734f4655536b47633234345753632f68747470732f692e6962622e636f2f4644504472666b2f446973636f72642d56504e2e706e67)](https://camo.githubusercontent.com/72d29a1cda8ff5fa29f42ff8232ea890764cbae1c17344c50a8deea51645cf3c/68747470733a2f2f696d616765732d6578742d322e646973636f72646170702e6e65742f65787465726e616c2f4f506f423576314f734e516c3749315f592d2d636a3967527567553759734f4655536b47633234345753632f68747470732f692e6962622e636f2f4644504472666b2f446973636f72642d56504e2e706e67)

3) If that does not resolve the issue, try using a VPN service such as Cloudflare WARP or ProtonVPN. (Wildlander is not affiliated with and does not endorse any specific VPN service. We do not provide user support for VPN services. Use at your own discretion.)

4) If the above suggestions fail, then manually download the file using the following procedure:

If these files hang, manually download that file, or files, and add them to your Wabbajack specified download folder while it is still zipped.

You may need to use a VPN and/or different browsers to download these files. We are not sure why nexus is blocking access. Premium users can try this

![img](https://cdn.discordapp.com/attachments/881254575640838254/929341753885085738/unknown.png)

Search this for the failing mod(s) https://github.com/wabbajack-tools/mod-lists/blob/master/reports/Wildlander/wildlander/status.md  Manually download and copy the files, still zipped into your Wildlander download folder. Once done—restart Wabbajack install process one last time.

----------

## Getting a download failed on Original Skyrim files

If you get the following error—Make sure Steam is installed in English, validate your game files in Steam. Steam > Right Click > Properties > Local files tab
 - Unable to download Skyrim_Default.ini

Wildlander requires an up-to-date steam installation of special edition (also known as the Anniversary Edition - Update 1.6.353), If you get any of the following—update your Skyrim (or verify your install).

- Unable to download Skyrim.ccc
- Unable to download SkyrimSE.exe 
- Unable to download Data_Dawnguard.esm 
- Unable to download Data_Dragonborn.esm 
- Unable to download Data_HearthFires.esm 
- Unable to download Data_Skyrim - Animations.bsa 
- Unable to download Data_Skyrim - Interface.bsa
- Unable to download Data_Skyrim - Meshes0.bsa
- Unable to download Data_Skyrim - Meshes1.bsa 
- Unable to download Data_Skyrim - Misc.bsa 
- Unable to download Data_Skyrim - Shaders.bsa 
- Unable to download Data_Skyrim - Sounds.bsa 
- Unable to download Data_Skyrim.esm
- Unable to download Data_Update.esm 
- Unable to download Data_Skyrim - Textures3.bsa 
- Unable to download Data_Skyrim - Textures5.bsa 
- Unable to download Data_Skyrim - Textures7.bsa
- Unable to download Data_Skyrim - Textures8.bsa 
- Unable to download Data_Skyrim - Textures2.bsa 
- Unable to download Data_Skyrim - Textures4.bsa 
- Unable to download Data_Skyrim - Textures0.bsa 

---
# **Launcher Issues**

## What do the Dropdowns mean

Quality Drop down

These are your standard Skyrim parameters. The Graphics dropdown determines the quality of basic graphical elements, such as the draw distance of grass and shadows, the number of effects visible at once, and the quality of distant objects. These elements use a mix of CPU and GPU.

- Ultra  - Everything on, All the bells and whistles—For “beast” PC's
- High   - Reduced Draw distances compared to Ultra, but still the full mod package.
- Medium - Reduced Draw distances compared to High, but still the full mod package.
- Low    - No grass, no shadows, but still the full mod package.
- Potato - Stripped down lists for PCs which were build when oldrim was first released. 

Shaders Drop down

These control the level of ENB Shaders being applied. The Shaders' dropdown determines the quality of post-processing effects, such as environment lighting, particle lighting, ambient occlusion, sun rays, and water effects. These elements are very heavy on the GPU.

- Ultra  - Default Zangdar's ENB Everything on, All the bells and whistles with grass collision
- High   - Default Zangdar's ENB Everything on, All the bells and whistles 
- Low    - Zangdar ENB Performance pre-set W/o Ambient Occlusion 
- No ENB - Run without shaders at all

----------
## Trampoline Error

![image](..\Assets\TrampolineError.png)

This error is caused by your "My documents" folder being managed by OneDrive.

The only fix for this issue is to sever the link between OneDrive and your "my documents" folder. Adding the folder to the exceptions simply doesn't work, neither does disabling OneDrive.

The following guide will assist you in the method to do so. https://steamcommunity.com/app/489830/discussions/0/2263565217515804221/

----------
## Error launching game Error: Unsupported type of line: [1] Error

This means that Mod Organizer Crashed during Boot up and wiped its files. a reinstall (overwrite) using wabbajack of the list will resolve this issue.

----------
## Get-cimInstance Error on launch of game
![image](https://user-images.githubusercontent.com/26418143/162614762-bc1ea263-2e61-4e68-9669-c580f157dac8.png)

This error occurs when the winmgmt service is corrupt or crashed. It can be simply repaired by

Open Command prompt and typing the following 3 commands

```
net stop winmgmt (and y if prompted)
Winmgmt /resetrepository 
Winmgmt /verifyrepository should say it's consistent.
```

----------
## A JavaScript error in spawning the main process

![image](https://user-images.githubusercontent.com/26418143/166228493-43f26798-a7d4-4d04-84e1-e1a8a5ce0c47.png)

Generally this is caused by an Environment variable fault with PowerShell not in the “System Variables” 'PSmodulePath' or the 'Path' Environment variables (it needs to be in both).

Type “envir” in the “Search the web and Windows” box and selected “Edit environment variables for your account” under the “Best Match”.

Path should contain an entry for your equivalent of “C:\windows\System32\WindowsPowerShell\v1.0\”

PSmodulePath should contain an entry for “%SystemRoot%\system32\WindowsPowerShell\v1.0\Modules” and “%ProgramFiles%\WindowsPowerShell\Modules”

----------
## Game doesn't boot when launching SKSE / Cannot Start SKSE_Loader Error

[![image of SKSE Error](https://camo.githubusercontent.com/d1e2036affcaac1d9ca807db293176917ba048b5d0a53ad07c718ddef81618ad/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3334383537393439353533373830333237342f3738343630333430313939353638313739342f436170747572652e504e47)](https://camo.githubusercontent.com/d1e2036affcaac1d9ca807db293176917ba048b5d0a53ad07c718ddef81618ad/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3334383537393439353533373830333237342f3738343630333430313939353638313739342f436170747572652e504e47)

Ensure the following:

1.  Check that your Antivirus is not flagging SKSE or any Skyrim related files, the best Solution is to add Antivirus exceptions to the Wildlander Directory and subdirectories.
    
2.  Make sure your content folder contains usvfs_proxy_x64.exe & usvfs_proxy_x86.exe. If these files are missing, it's likely your antivirus has moved them to the virus vault.
    
3.  Restore missing files from Mod Organiser Zip file in your Wildlander\download directory if you cannot find them in the virus vault

----
##  Launcher locks for Skyrimse.exe and immediately unlocks (game doesn't start)

V1.0 issue only.

You may see a dialog pop-up saying preparing VFS and/or a command window.

Firstly - Make sure you are logged into the steam account which owns Skyrim.

If you are - You are missing a prerequisite from the installation guide. https://www.wildlandermod.com/download#before-we-begin

Download https://aka.ms/vs/16/release/vc_redist.x64.exe

AND https://download.visualstudio.microsoft.com/download/pr/bf058765-6f71-4971-aee1-15229d8bfb3e/c3366e6b74bec066487cd643f915274d/windowsdesktop-runtime-6.0.1-win-x64.exe

AND https://download.visualstudio.microsoft.com/download/pr/fccf43d2-3e62-4ede-b5a5-592a7ccded7b/6339f1fdfe3317df5b09adf65f0261ab/dotnet-runtime-5.0.13-win-x64.exe

Install ALL THREE. Yes, even the one which says consoles. Yes, we are SURE you need it. 

If you have them - repair them anyway. Make sure you reboot.


----

## Update/Install of launcher is Hanging  

Firstly—try a PC reboot, it's possible that one of the files we use is locked by a crashed session of Wildlander.

Uninstall the launcher from Add-remove programs, then download and manually install the most recent from https://github.com/Wildlander-mod/Launcher/releases/ 

----

# **Customization Questions**

## I'm nosey, There are Errors in mod organizer, why is this stuff disabled?

1) Reporting files in overwrite folder: These are your crash logs.
2) All the NPC overhauls are disabled: They are supposed to be, as they are just dummy files to ensure the authors get download credit. Hence “DEV RESOURCES” label.
3) There are mods with Red X's: These are merged into the Wildlander ESP. It is perfectly normal.
4) Mod XXX is out of date: Perfectly normal for mod lists to have older versions of mods. Some mods update several times a month and the list won't ever be able to keep up.

Finally, you should be using the launcher to play. Entering mod organizer is NOT NECESSARY unless you are running Window 7.

---------

## Mod X has been updated, can I install that?

No. For stability reasons, only the versions installed by Wabbajack are supported.

----------

## Can i edit MCM settings?

The answer to this is support strongly recommend that you leave them alone.  Everything is setup how it is intended to play. We didn't "accidentally" forgot to turn on some settings (Wildcat only exists for its AI not for all the other features). 

We are not responsible for any errors or bugs which occur if you edit them.

FLP MCM should be treated as though it doesn't exist - No seriously -  Touch nothing in here unless you enjoy for followers picking up random shit and running around in circles while you are fighting for your life.

----------

## Can I remove/disable mod X

Many mods have a Mod Configuration Menu (MCM) where they can be turned off. You cannot disable anything completely from Mod Organizer, and doing so will deny you access to support.

----------

## Can I add additional mods?

Currently, we are not supporting any form of modification of Wildlander.

Any modifications are done at your own risk and will deny you access to support.

Changing the mod list (Even simple changes) can break mod lists in surprising ways. Requiem touches all parts of Skyrim and generally requires patches to add anything.

If you want to do it anyway: I will give this free advice DO NOT run LOOT, it will break the mod list any mods should be added and ordered manually. Remember that, again, this WILL deny you access to support.

---
##  But I want CBBE/UNP nudes

Answer is still no. Go straight to horny jail. Do not pass go. Do not collect 200 Septims.

---
# **Gameplay Questions**

## Can I see a list of Known issues

Sure. Here's a [link](Known-Issues.html)

----------

## How can I see the keybindings?

The in-game hotkey F11 will bring up a Game pad / keyboard layout of all key bindings. F11 again will hide it.

----------

## My keybindings don't work

Dylan is based in the US, so the key bindings were based on a standard QWERTY US keyboard.

For any other types of keyboards you will need to rebind the keys yourself from the MCM menus.

There is an appropriate guide [here](..\2-RecommendedReading\8-Keybindings.html) 

----------

### How Do I do a customized start (vampire, werewolf, no perks)

When you get the message that Wildlander is finalizing and have clicked OK, hit F10.

Wildlander will then go into manual configuration mode.

Once you get the message warning you that you hit F10. Hit 'OK', then 'escape.'

Then go to Mod Configuration Menu and Skyrim. From there you can use 'Skyrim Unbound Reborn' MCM and customize how you want to start exactly.

----------
## Some sounds aren't playing! How do I fix this?

If you are unable to hear most of the combat sounds such as sword swings, spell useage (ex: flame, heal, etc.), opening a container, footsteps, etc but are able to hear NPC dialogue, drawing or sheathing a sword and wolves in the distance:

If you are willing to customise (and know how to use mod organiser to install mods) https://www.nexusmods.com/skyrimspecialedition/mods/71567?tab=description may fix the issue.

If not check first to see if your Skyrim install is in the 'C' drive (C:). Installing Skyrim outside the C: has been known to cause this issue. If you do not want to reinstall the game to C:, a quick fix originally posted by Kepache may be attempted:

1) First download and install Link Shell Extension, which can be found here: http://schinagl.priv.at/nt/hardlinkshellext/linkshellextension.html.
2) Navigate to your Skyrim/Data folder and look for a file named Skyrim - Sounds.bsa. Copy this file and paste it somewhere on your main drive (I suggest creating a folder for this purpose).
3) Delete Skyrim - Sounds.bsa from the Data folder.
4) Go back to where you copied Skyrim - Sounds.bsa on your main drive. Right click on it, and you should see an option that says “Pick Link Source”. Click that.
5) Go back to your Skyrim/Data folder. Right click anywhere and choose “Drop As” and then “Symbolic Link”. You will see your sounds file with a shortcut symbol.

You also need to do the above for Skyrim - Voices_en0.bsa also found in the Skyrim Data folder

You may need to do it for the following 3 folders. Some people do, some don't:

1) Audio Overhaul Skyrim for SE sound folder found in Game-files\mods\Audio Overhaul for Skyrim SE—All files in sound subdirectory
2) Immersive Sound – Compendium sound folder found in Game-files\mods\Immersive Sounds – Compendium – All Files in sound subdirectory
3) Unofficial High Definition Audio Project – all BSA files in all three folders found in Game-files\mods

----------

## Why can't I learn the first crafting perk?

This only affects version 1.0.

You need a book called The Craftsman's Manual in your inventory. It can be purchased from most blacksmiths. Most of the Requiem crafting perks require their own books, some of which can be bought while others must be found in the world.

For 1.1 onwards: If you want to re-enable this functionality, then you can do so from the Requiem MCM.

----------

## Why can't I run or Why is my stamina going down for no reason?

Requiem applies a stamina draining effect when you run, and when you wear armor without the first perk in the Heavy Armor/Evasion tree. Running is the normal speed you move as if you aren't sprinting or specifically holding down the “walk” button. To combat this, make sure to buy food with a “Regenerate 1 stamina per second for 'X' seconds” effect and keep that buff up at all times. The wiki page [Stamina Management](..\3-Your-First-Character\stamina.html) provides more detailed information.

**NO, YOU CANNOT DISABLE IT, PLEASE DON'T ASK!**

----------

## Why can't I get a blessing at a shrine?

Requiem's gods are unforgiving of crime. Too much crime, or an outstanding bounty and they will no longer bless you or heal you! Please see the wiki page [Religion & The Divines](..\4-wildlanderworld\4-The-Divines.html) for more information.

----------

## Why am I not healing?

Wildlander has no passive health regeneration. You will not heal from your wounds by "sleeping it off".

When you get hurt fighting - the only ways to heal are :-

* Restoration spells (for the living)
* Conjuration spells (for the undead)
* Health potions (For undead, only max level healing potions (superlative) will work.)
* [Healing Poultice](..\3-YourFirstCharacter\health.html#healing-poultice)
* Alchemy Perk
* Raw Ingredients
* Enchantments

----------

## Lights are flickering on and off?

It's most noticeable in Breezehome and the entrance to Riverwood at night, but this can happen everywhere.

This is caused by Skyrim's engine limitation of 4 "shadow casting" light sources in an area. When you look in an area with more than 4 light sources, they alternate/cycle and turn on and off. Turn off your lantern or put away your torch to potentially alleviate this to some degree.

----------

## Why is everything so expensive in shops?

There are several possible reasons:
 
1) You're NAKED! Put some clothes on, ya filthy animal!
2) You're covered in BLOOD and/or MUD!  Honestly! Traipsing mud over my clean floors! I am gonna charge you a cleaning fee! Go take a BATH!
3) You may also be hated by the community or the shopkeeper for... reasons you likely remember, but won't tell anyone about! Grease those palms with the Speechcraft menu and give that shopkeeper a little gift, such as gems or coin off the cuff! That should help lower the prices...
4) You may also just suck at talking. Level your Speechcraft so you're not tripping over your words like a milkdrinker fresh to the local inn. You can't honestly expect to sell your wares for a decent price when your best sales pitch is 'Unga-bunga!' 

----------

## My character's animations are stuck!

This is a vanilla Skyrim bug, which is exacerbated by the scripted mods in Wildlander. If jumping doesn't fix the animation, try the following console commands:

```
Pushactoraway 14 1
SetPlayerAIDriven 0
```

----

## Why can't I 'Fast Travel' ?

Because we disable it 🙂 There are multiple methods of moving around the map quickly without editing these settings – There are boats near most large area of water, and Carriage drivers at the cities.

You will need to edit the following in-game MCM settings to reenabled fast travel:
1) Frostfall
2) Requiem 
3) Sunhelm 

In addition in 1.1.X – A SKSE mod disables fast travel around the map. This can be turned off in game-files\mods\Disable Fast Travel SKSE - No Janky Map UI\SKSE\Plugins\DisableFastTravel.ini

----------

## My game freezes during loading screens.

The game will pause if you are alt-tabbed out, including some load screens. Make sure Skyrim window has focus!

Can also be caused by :
- Your PC being below the minimum requirements to play the pack as shown on the installation README. You can try running without a ENB from the launcher.
- Wildlander folders (or subfolders) being read-only.
- Wildlander being on a different drive to Skyrim: It is recommended that you have Wildlander and Skyrim on the same drive. 
- Wildlander being installed inside of program files: Move the Wildlander folder outside of program files.
- Additional mods in Skyrim/data folder from previous modding or workshop subscriptions are causing a conflict.
- Conflict between AMD drivers and the ENB: The only resolution to this is to either roll back until you find working AMD drivers or disable ENB graphics until a working driver is available.
- A corrupt Skyrim installation: To check, launch Skyrim from steam and see if it crashes on loading screen. If it crashes, the installation is corrupted.
- Antivirus real-time scanning your Wildlander folders: Make sure you add it to your exceptions.
- You have lost permissions to write to “My Documents\My Games\Skyrim” or Wildlander install folder
- OneDrive and/or Dropbox is Syncing your “my documents\My Games\Skyrim” or Wildlander install folder
- Can be caused by a corrupt save. You can try using a previous save or start a new game.

----------

## How do I change the difficulty?

The in-game difficulty sliders do not work with Wildlander. Please use the Change Difficulty hotkey instead (Right-CTRL).

----------

## Help! I'm being attacked by Anorath & Uthgard the Unbroken in Whiterun for no reason!

You have somehow picked up a bounty in Whiterun hold which does not show on the UI, also known as a 'Hidden Bounty.' What have you been doing in secret, HMMM?

No matter. The following console command will clear it:

```
paycrimegold 0 0

```
----------

## I contracted Sanguinare Vampiris, and now I can't sleep!

This is a 'Requiem' change that prevents weak characters from acquiring Vampirism. You must survive for 3 days while Sanguinare Vampiris slowly drains health and negates natural healing, at which point you will become a Vampire. You better hope you can afford healing potions or haven't made enemies of temple healers!

You cannot Wait or Sleep to pass the time, however spell research and training do work.

----------

## Can I remove Block/Parry from control

Yes! The keybinding for this is in Dual Wield Block. Lizzy (being the sensible player that she is) switches it to 'C' and moves crouch using the Skyrim standard controls back to the default key bind.

----------

## How do I put my shield on my back

Go to game-files\mods\Simple Dual Sheath\SKSE\Plugins\SimpleDualSheath.ini and edit the flags on the below section:

```
    [ShieldOnBack]
    # Add 'Player' or 'NPC' flags to enable.
    Flags=
```

Save and next time you boot the game. Your shield will now be on your back, you 🐢 cosplayer! 

----------
## Night eye is too dark

Note: performance modlist does not allow the ENB to show Nightvision correctly. Should you wish to use nightvision, you must either use "standard modlist" or No shaders (to apply vanilla nightvision)

Hit Shift+Enter to bring up the ENB, in the center panel expand ENB effect and scroll down until you find the below section:

![image](https://user-images.githubusercontent.com/26418143/175901531-69ed7701-e295-4a8f-933a-5cbb85dc85c4.png)

These are the settings which control the brightness. It is my personal preference to change only 'Technique' to 'CW variant 3.'

then to scroll down and adjust the following settings 

![image](https://user-images.githubusercontent.com/26418143/197895203-bf895835-7dbc-44e8-ae8e-dae5e650e3d1.png)


Once you are happy with the settings, in the top right section click on “save configuration,” then hit shift+enter again to hide the ENB window.

----------

## How Do I Enable Permadeath

Are you MAD? Skyrim will kill you just for sneezing on a rock wrong and you want...?

No, but there is a serious, technical reason! There is no enforced permadeath mode because all mods pertaining to this feature are known to cause issues. So, instead of a 'permadeath mod' the player, upon dying, is presented with the Requiem death dialog telling you to load a save. If you wish to be permadeath, then you should exit and restart Skyrim at this point, then create a new character.

Think of it as... an exercise in self-discipline, if you like!

NOTE: Creating a new character without restarting Skyrim is known to cause script issues in several mods. Many options during character creation may be missing! Spells and gear during the start-up will not be correctly assigned, and you may get pop-up's from Trade and Barter due to it not initializing correctly, so make sure you restart Skyrim COMPLETELY, through the launcher, before attempting to create a new character!

------
---
## Why are kill-moves disabled?

Requiem kill moves have been edited from vanilla settings. They can now be performed on the Player, by enemies. and they can now be performed on any enemy - not just the last.

Below are a few reasons why:

- You are attacked by a melee opponent. You plan to 🛡️ the attack and will survive it, but the game engine decides otherwise and plays a kill move. Under standard Requiem, kill moves can be performed on the player. The result is now you are eating dirt when you should be bashing skulls! (the same if you plan to evade the attack).
- You are sneaking and aim an arrow on a mage. This will one-shot the mage. The kill move plays, the mage becomes aware of you, suddenly it's no longer a sneak attack, the mage lives and turns you into one of three elemental flavors of magically prepared rump roast. 
- You sneak behind a bandit, you plan to one-shot him with a dagger attack. The attack succeeds, the kill move plays, nobody detects you, but the bandit didn't die, is still full health turns around, says ~~"Omae wa, mou shindaeru..."~~ and kills you.
- You are sniping with a bow. Every arrow will kill a bandit. Every time you release the arrow, a kill-move plays. But thanks to the kill move, every arrow lands on the ground before it reaches the bandit, therefore the bandit didn't die, and now instead of being 'Legolas' you have become 'Legless' thanks to that big bandit with the greatsword.
- You are attacking a group of enemies with a 2-handed Axe and mid-fight a kill move fires (as in Requiem they can happen on any enemy), and his friends kill you while the cinematic plays, because you are not in fact Neo from blockbuster hit 'The Matrix.'
- You are sneaking on a ridge above Valheim Towers and shoot arrows to the bandits below you. All arrows hit and one-shot, except the one from the kill move, which collides with the invisible barrier of the ridge. You are now detected. You proceed to beat your keyboard into a fine pulp, then craft it into a sword because archery is now for pansies.
- You are shooting ⚡ from your fingertips like some kind of unspecified villain in a space opera. It has been an intense battle, and you are about to win. You channel your last reserves of magic at your foe, and the kill camera activates, missing your target and attacking the aggressive invisible ant which threatens to nibble your toes. The vampire mage you almost slew then summons a Storm Atronach, which proceeds to turn you into an ad-hoc Christmas tree in approximately three seconds. As a reward for your heroism, Todd Howard grants you the sight of another kill cam, this time of the aformentioned Storm Atronach putting little a wreathe around your neck while the vampire dances on your twitching, electrified corpse.

Kill moves literally mean that when such a move plays, 90% of the time it kills you, the other 10% of the time nothing happens. 

**Will it break anything if I turn them on anyway**

Possibly your mouse, controller or keyboard when you throw them from frustration from the 5th time one of the above events happens to you?

---

# **Questing Questions**

## How do I start the main quest

Kill a dragon. It's not as simple as it sounds. In Wildlander, Dragons are the heavily armored flying tanks with elemental shouts or worse, such as those which drain vitality or other attributes. This turns them into the legitimate threat they should have always been, so stack magic resistances, enchants, and maybe even a good shield! Good luck in not becoming a crispy-critter~!

----------

## Why can't I obtain the Dragonstone?

This quest is auto completed when you kill a dragon. Also, there will be a book on 'Racial Phylogeny' inside the crypt, so make sure you bring that to Farengar. He needs it for... research.

----------

## How do I Become Thane of Whiterun?

There is a new way of becoming a Thane of Whiterun:

Complete “The Blessings of Nature” quest (Danica by the Gildrergreen tree to start) and talk to Jarl Balgruuf when the Gildergreen tree is repaired or the sapling blooms (note: this requires you to complete any other quest outside of whiterun itself to simulate the passing of time). He'll thank you and allow you to do the standard thane quest (help the people of the hold).

Note: You can buy Breezehome before this at a much more expensive price, but unless you are thane you do not get a housecarl.

----------

## I can't start the Thieves Guild through Brynjolf?

Thieves Guild Requirements is included in the list, which requires 25 pockets picked and 250 items stolen. So get to it, Robin Hood! They don't just let ANYBODY into the Thieves Guild these days (Even though attendance is low and they aren't exactly in a spot to BE picky...)!

----------

## How do I start the Dragonborn quest line?

Dragonborn content is available after completing “A Blade in the Dark” during the Main Quest.

----------
## How do I progress The Companions storyline?

You need to do 5 radiant quests for members of the Circle in between each faction quest.


# **Crafting Questions**

## How do I craft Snowberry Extract

Snowberry Extract is made directly from a cookpot, or by using the player crafting menu when in proximity to a cookpot

The extract requires the following items/tools:

    - A survivalist's or alchemist's toolkit
    - Alchemical Lore 1 (perk)
    - 20 Snowberries

----------

## How do I craft Healing Poultice?

The Healing poultice [Guide](..\3-YourFirstCharacter\health.html#healing-poultice) explains the crafting method and requirements.
