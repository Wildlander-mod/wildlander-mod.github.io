---
layout: default
title: Before You Begin
has_toc: true
parent: Recommended Reading
grand_parent: Getting Started
nav_order: 1
description: Before You Begin Playing
---

------
# Before you Begin

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


You should not be starting Skyrim from steam, you should not be running SKSE, you should not be running mod organizer.  Instead, you should be using our dedicated launcher which allows you to customize the Screen resolution, Graphics settings and ENB shaders.

![image](https://user-images.githubusercontent.com/26418143/156929221-ffad3b5a-3ff2-4ce8-ab34-051760b33e50.png)

## Modlist Drop down

* Standard- Everything on.
* Performance - All graphics mods turned off.


## Graphics Drop down

These are your standard Skyrim parameters. The Graphics dropdown determines the quality of basic graphical elements, such as the draw distance of grass and shadows, the number of effects visible at once, and the quality of distant objects. These elements use a mix of CPU and GPU.

* Ultra - Everything on, All the bells and whistles - For "beast" PC's
* High - Reduced Draw distances compared to Ultra, but still the full mod package.
* Medium - Reduced Draw distances compared to High, but still the full mod package.
* Low - No grass, no shadows, but still the full mod package.
* Potato - Stripped down graphics for PC's which were built when oldrim was first released.


## Shaders Drop down

These control the level of ENB Shaders being applied. The Shaders dropdown determines the quality of post-processing effects, such as environment lighting, particle lighting, ambient occlusion, sun rays, and water effects. These elements are very heavy on the GPU.

* Ultra - Default Zangdar's ENB Everything on, All the bells and whistles plus grass collision
* High  - Default Zangdar's ENB Everything on, All the bells and whistles
* Low   - Zangdar ENB Performance preset 
* No ENB - Run without shaders at all



## Suggestions for various GFX cards

GEFORCE® GTX 9 SERIES or Equivalent cards (or worse), potato/low Graphics No shaders. Depending on Ram and CPU Can push this to a Medium graphics.

GEFORCE® GTX 10 SERIES or Equivalent cards, Medium graphics, No shaders. Depending on Ram and CPU Can push this to a high graphics.

GEFORCE® GTX 20 SERIES or Equivalent cards, High Graphics, Low shaders. Depending on Ram and CPU Can push this to high shaders.

GEFORCE® GTX 30 SERIES up to 3060 GTX or Equivalent cards, Ultra Graphics, high shaders.  Depending on Ram and CPU Can push this to ultra shaders.

Anything better than a 3060 GTX - Knock yourself out with whatever takes your fancy.

## Page Files

Bigger Skyrim modlists need a lot of memory, and when there is not enough available it may fail allocating more causing a crash, or when running low cause Stutters. To fix this, you'll want to have a bigger page file.

A pagefile is a file on your disk Windows will use when there is not enough memory available.

Never disable the pagefile - this may lead to various issues on your system, such as this Skyrim crash.

If you've never touched the pagefile, try performing the following steps:
1. Press Windows + R on your keyboard and enter sysdm.cpl ,3
2. Under the Performance section, press 'Settings'
3. Go to the Advanced tab at the top, and at the Virtual memory section press 'Change...'
4. Disable 'Automatically manage paging file size for all drives'
5. If you have more than one drive, try enabling it for at least one more drive as a backup (make sure it has a decent bit of free space, like 15GB). Set the size to 'System managed size'.
Otherwise, set a custom size for the drive it's currently on and increase the maximum size to be at least 20GB (Minimum size can be set as your current usage).

Important note: The Pagefile is different to System Ram.

The Pagefile is often used for spill over for the GPU VRAM (as GPU's don't have DMA - they can't use System ram as a overflow) and it is also used like a staging area for assets from disk. Having 32/64 GB of System ram does not mean that you may not experience page file related issues.

## Anti-virus software

Several Antivirus programs are known to cause issues with the list.

#### Bitdefender

{: .save}
> * Does not like Wabbajack's Downgrading routine and can cause corruption, preventing the game to launch.

1. Disable Bitdefender 
1. Delete game-files\Stock game
1. Reinstall Wildlander from wabbajack, choosing Overwrite installation and wait for install to complete.
1. you should now be able to launch.

{: .save}
> * Causes crashes while saving.

 Recommendations: Disable Bitdefender during Wabbajack install. Apply the following fixes after install to prevent crash on save
1. Easy solution - Turn off Advance Threat Defense when playing Wildlander

OR 

1. proper Solutions - Add a ADT exception for Wildlander\game-files\Stock Game\SkyrimSE.exe
1. If you also have "Ransomware Remediation" on Add Wildlander\game-files\ModOrganizer.exe       

#### Webroot

{: .save}
>  Webroot Anti-virus is completely incompatible with the .net Crash logging mod we use in the pack. It will cause a crash on Startup. 
>
>  To play, you need to shut down the anti-virus completely from the system tray. 
>
>  There are no options you can tick, and no exclusions you can apply to make this anti-virus play nice.
 
 ![img](https://media.discordapp.net/attachments/881254575640838254/937500500360851466/unknown.png) 

#### McAfee Antivirus.

{: .save}
> It is known to cause a corruption in the Skyrim downgrade during installation process from wabbajack

1. Disable McAfee 
1. Delete game-files\Stock game
1. Reinstall Wildlander from wabbajack, choosing Overwrite installation and wait for install to complete.
1. you should now be able to launch.

#### Norton

{: .save}
> If using Norton, and it blocks the launcher for intrusive activity (During start up - while it's checking for updates) you may want to configure [these settings](https://support.norton.com/sp/en/uk/home/current/solutions/v15471442/) to exclude a URL or domain from monitoring URL: https://github.com/Wildlander-mod/Launcher/releases. Please note - Support are not able to assist you in how to apply these settings - we dont have Norton installed.
>
> If you are still unable to run after performing these steps, then unfortunately - you will be unable to use the launcher unless you uninstall Norton. Your only method of playing Wildlander would be to use Mod organizer to launch and manually install the ENB in the stock game folder.

#### Avast

{: .save}
> Is known to flag launcher as a false positive for spyware. Our launcher is open source, you can check for yourself that it is free of spyware. As Avast is known to be Spyware in its own right [Source](https://antivirus-review.com/blog/avast-programs-spy-on-their-users) and sensible people uninstalled this years ago. Even stock windows offers better protection, without selling your internet browsing history to the highest bidder. 
>
> Should you wish to keep using Avast.

1. Disable Avast 
1. Delete game-files\Stock game
1. Reinstall Wildlander from wabbajack, choosing Overwrite installation and wait for install to complete.
1. you should now be able to launch using the launcher.
1. Shutdown Avast running whenever you want to play

