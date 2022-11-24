---
layout: default
title: Before You Begin
nav_order: 9
has_children: false
has_toc: true
parent: Recommended Reading
grand-parent: Getting Started - The Basics
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

GEFORCE® GTX 9 SERIES or Equivalent cards, potato/low Graphics No shaders. Depending on Ram and CPU Can push this to a Medium graphics.

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
Otherwise, set a custom size for the drive it's currently on and increase the maximum size to be at least 20GB.

Important note: The Pagefile is different to System Ram.

The Pagefile is often used for spill over for the GPU VRAM (as GPU's don't have DMA - they can't use System ram as a overflow) and it is also used like a staging area for assets from disk. Having 32/64 GB of System ram does not mean that you may not experience page file related issues.

## Anti-virus software

Several Antivirus programs are known to cause issues with the list.

**1) BitDefender**

* Does not like Wabbajack's Downgrading routine and can cause corruption preventing the game to launch.
* Causes crashes while saving.

Recommendations: Disable BitDefender during wabbajack install. Apply the following fixes after install to prevent crash on save
      a) Easy solution - Turn off Advance Threat Defence when playing wildlander
      b) proper Solutions Add a ADT exception for Wildlander\game-files\Stock Game\SkyrimSE.exe

If you also have "Ransomware Remediation" on Add Wildlander\game-files\ModOrganizer.exe       

**2) Webroot**

*  Webroot Antivirus is completely incompatible with the .net Crash logging mod we use in the pack. It will cause a crash on Startup. 
   To Play you need to shut down the antivirus completely from the system tray. 
   There are no options you can tick, and no exclusions you can apply to make this antivirus play nice.

![img](https://media.discordapp.net/attachments/881254575640838254/937500500360851466/unknown.png) 

**3) Norton**

* Causes Intermittent problems starting the launcher for updates, Falsely flagging it for intrusive activity

Recommend the following guide to Configure Intrusion Prevention settings
https://support.norton.com/sp/en/uk/home/current/solutions/v15471442/

