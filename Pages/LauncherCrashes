---
layout: default
title: Launcher and CTD's
nav_order: 6
parent: Support
---


# Navigation Structure
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

# Launcher Issues

##  Update/startup of launcher is Hanging  

Firstly - try a PC reboot. 

if that doesn't work Uninstall the launcher from Add-remove programs, then download and manually install the most recent from https://github.com/Wildlander-mod/Launcher/releases/

if using Norton and it blocks the launcher for intrusive activity (During startup - while its checking for updates) you may want to configure these settings https://support.norton.com/sp/en/uk/home/current/solutions/v15471442/ to Exclude a URL or domain from monitoring URL: https://github.com/Wildlander-mod/Launcher/releases

## **Launcher locks for Skyrim and immediately unlocks**  

### All versions
Several Antivirus programs are known to cause issues with the list.

1) BitDefender

        * Does not like Wabbajack's Downgrading routine and can cause corruption preventing the game to launch.
        * Causes crashes while saving.

        Recommendations: Disable BitDefender during wabbajack install. Apply the following fixes after install to prevent crash on save
              a) Easy solution - Turn off Advance Threat Defence when playing wildlander
              b) proper Solutions Add a ADT exception for Wildlander\game-files\Stock Game\SkyrimSE.exe

              If you also have "Ransomware Remediation" on Add Wildlander\game-files\ModOrganizer.exe       

2) Webroot

        *  Webroot Antivirus is completely incompatible with the .net Crash logging mod we use in the pack. It will cause a crash on Startup. 
           To Play you need to shut down the antivirus completely from the system tray. 
           There are no options you can tick, and no exclusions you can apply to make this antivirus play nice.

![img](https://media.discordapp.net/attachments/881254575640838254/937500500360851466/unknown.png) 

3) Mcaffee Antivirus is known to cause a corruption in the Skyrim downgrade during installation.

         1) Disable Mcaffee 
         2) Delete game-files\Stock game
         3) Rerun Step 2 - Wildlander.wabbajack, choosing Overwrite installation and wait for install to complete.
         4) you should now be able to launch.

### Version 1.0 Only

You *may* see a dialog popup saying preparing VFS and/or a command window.

Firstly - Make sure you are logged into the steam account which owns skyrim.

If you are - You are most likely missing a prerequisite from the install guide. <https://www.wildlandermod.com/download#before-we-begin>

Download 
1) https://aka.ms/vs/16/release/vc_redist.x64.exe
2) https://download.visualstudio.microsoft.com/download/pr/bf058765-6f71-4971-aee1-15229d8bfb3e/c3366e6b74bec066487cd643f915274d/windowsdesktop-runtime-6.0.1-win-x64.exe
3) https://download.visualstudio.microsoft.com/download/pr/fccf43d2-3e62-4ede-b5a5-592a7ccded7b/6339f1fdfe3317df5b09adf65f0261ab/dotnet-runtime-5.0.13-win-x64.exe

Install ALL THREE. Yes, even the one which says consoles. Yes, we are SURE you need it. 

if you have them - repair them anyway. Make sure you reboot.

## Launcher Errors

### A JavaScript error in spawning the main process 

![image](https://user-images.githubusercontent.com/26418143/166228493-43f26798-a7d4-4d04-84e1-e1a8a5ce0c47.png)

Generally that's a Environment variable fault with powershell not in the "System Variables" 'PSmodulePath' or the 'Path' Environment variables (it needs to be in both).

type "envir" in the "Search the web and Windows" box and selected "Edit environment variables for your account" under the "Best Match".

Path should contain a entry for your equivalent of "C:\windows\System32\WindowsPowerShell\v1.0\"

PSmodulePath should contain a entry for "%SystemRoot%\system32\WindowsPowerShell\v1.0\Modules" and "%ProgramFiles%\WindowsPowerShell\Modules"

### 'Get-CimInstance -className win32_process | select Name,ProcessId,ParentProcessId,CommandLine,ExecutablePath' terminated with code: 1

![image](https://user-images.githubusercontent.com/26418143/166230804-eb9716c8-91aa-4d6c-a05f-c95a3c0cb9c9.png)

The issue is caused by users having a corrupt Windows management repository. Apparently this can happen when migrating from Windows 7 to 10.

In a Administrator command prompt Run `net stop winmgmt` (and y if prompted), `Winmgmt /resetrepository` and then `Winmgmt /verifyrepository` should say it's consistent.

# Crashing while Playing

Skyrin with wildlander creates crashlogs. You can access these crashlogs by using the button on the advanced page of the launcher. 

The first line of the Crash indicates the Crash code - and the process which crashes. E.g 
* Unhandled native exception occurred at 0x7FFEF914CE66 (skse64_1_5_97.dll+5CE66) on thread 7360!
* Unhandled native exception occurred at 0x7FF6C59F2BEF (SkyrimSE.exe+132BEF) on thread 1552!
* Unhandled native exception occurred at 0x7FFD09DC23A0 (atidxx64.dll+523A0) on thread 6944!
* Unhandled native exception occurred at 0x7FF8DEA95E07 (nvwgf2umx.dll+265E07) on thread 27128!

![image](https://user-images.githubusercontent.com/26418143/184343479-0bbafd85-3e81-4411-8c0b-dff9620de663.png)


If your crash isn't listed here - you can raise a issue on this github attaching your crash log.

## Any Crash related to atidxx64.dll Or nvwgf2umx.dll

This crash is associated with your Graphics card drivers. Make sure they are up to date. If that doesn't work, try updating your windows drivers. Some have also said this can occur if you P.C doesn't fill out all the requirements needed to run Skyrim(P.C too weaksauce). Only assume this after trying out all stated options.

## Crash to Desktop on save when using the BitDefender Antivirus.

Crashlogs usually start with Unhandled native exception occurred at 0x7FF8C00004FA (other numbers may occur) ! But no "Skyrim.exe Crash code"

The clue for this crash is the below.

>Possible relevant objects (2)
>
>{
>
>  [ 161]    BGSProjectile(FormId: 0007326E, File: `Skyrim.esm`)
>
>  [ 161]    GrenadeProjectile(FormId: 851F0CEC, File: `Fozars_Dragonborn_-_Requiem_Patch.esp`, BaseForm: BGSProjectile(FormId: 0007326E, File: `Skyrim.esm`))
>
>}



1) This is a settings issue with BitDefender
2) BitDefender cannot work with mod organiser
3) a) Easy solution - Turn off Advanced Threat Defence when playing Wildlander

   b) Proper Solution - Add an ADT exception for Wildlander\game-files\Stock Game\SkyrimSE.exe

If you also have "Ransomware Remediation" on Add Wildlander\game-files\ModOrganizer.exe

---
## Crash to Desktop when entering a building or on "finalising setup" Error code fiss.dll+4481 or SkyrimSE.exe+D6DDDA (Stack: BSResource::anonymous_namespace::LooseFileStream* OR BSResource::ArchiveStream* OR BSResource::CompressedArchiveStream** mentioned somewhere)

Generally caused by your Pagefile running out.

Bigger Skyrim modlists need a lot of memory, and when there is not enough available it may fail allocating more. To fix this, you'll want to have a bigger pagefile.

A pagefile is a file on your disk Windows will use when there is not enough RAM available.

Never disable the pagefile - this may lead to various issues on your system, such as this Skyrim crash.

If you've never touched the pagefile, try performing the following steps:
1. Press Windows + R on your keyboard and enter sysdm.cpl ,3
2. Under the Performance section, press 'Settings'
3. Go to the Advanced tab at the top, and at the Virtual memory section press 'Change...'
4. Disable 'Automatically manage paging file size for all drives'
5. a) If you have more than one drive, try enabling it for at least one more drive as a backup (make sure it has a decent bit of free space, like 15GB). Set the size to 'System managed size'.

   b) Otherwise, set a custom size for the drive it's currently on and increase the maximum size to be at least 20GB.

---

## When using a crossbow for the first time Crash code SkyrimSE.exe+7BEC84  (only affects Version 1.0)

 - The crossbow mod needs to initialise and cannot do this while in combat causing the CTD. 

Fix: When you get your crossbow - equip and unsheathe it right away (unless you obtain while in combat).

---

## When mounting horse with a follower SkyrimSE.exe+6441D0 (affects Version 1.1 - 1.1.5)

In follower Live package MCM - there's a option which says followers summon horses - turn this off.

---

## Entering Windpeak Inn in dawnstar while on quest  "Rise in the East"  SkyrimSE.exe+C28E26 (only affects Version 1.0)

NPC Irlof is causing the game to bomb out. Fortunately he is just a "flavor" NPC so can be safely deleted. 

Fix: Use the following console commands to make him go away.

   - prid 0005226B
   - markfordelete
   - disable

---
## Crash on save with crash code (skse64_1_5_97.dll+5CE66)

Fortunately rare - This is under investigation - but believed to be caused by saving while some form of headtracking is in use (E.g Lock on in True directional movement).

---
## Crash on trying to edit Iequip SkyrimSE.exe+C28C8B

This is caused by a conflict between consoleutil and Iequip. If you want to edit the Iequip screen, then you need to Disable consoleutil in mod organiser, make your changes, then re-enable it afterwards

---

## Crash on save with crash code making no reference to skyrimSe.exe (e.g Unhandled native exception occurred at 0x0 on thread) AKA the coffin crash

Caused by a City NPC dying while wearing cold weather gear (e.g cloaks, gloves, facemasks). 

In the example below you can see a Coffin object (may also be a burial Urn) - each NPC has a unique hall of the dead object. 

You will need to use a save cleaner and terminate the offending script (WIDeadBodyCleanupScript) causing the issue moving the NPC to the coffin.

- using ReSaver from FallrimTools: https://www.nexusmods.com/skyrimspecialedition/mods/5031/
- Loaded the savegame > Active Scripts > WIDeadBodyCleanupScript 
- Located ScriptInstance: WIDeadBodyCleanupScript: *refID=DEFAULT: Followed by the NPC Reference id causing issues (if you don't know which NPC - its safe to remove all WIDeadBodyCleanupScript)
- terminate the script

Possible relevant objects (5)
   
  [  24]    TESObjectREFR(FormId: 000DEFB5, File: `Skyrim.esm`, BaseForm: TESObjectCONT(Name: `Coffin`, FormId: 000F6891, File: `Requiem for the Indifferent.esp <- Requiem Record Fixes.esm <- Unofficial Skyrim Special Edition Patch.esp <- Skyrim.esm`))
  
  [  34]    TESObjectARMO(Name: `Wolfskin Cloak - Light Trimmed Black`, FormId: 76002348, File: `Requiem for the Indifferent.esp <- Wildlander.esp <- 1nivWICCloaks.esp`)

Note: you may also be able to fix this by locating the coffin in the hall of the dead of the city where the NPC died and manually removing the offending item from the coffin

---

### Noble with Bodyguard crash (SkyrimSE.exe+10B9F52) (only affects Version 1.0)

This crash is caused by a random roadside spawn of a NPC with a bodyguard. The Noble has a bad facegen. This bug will be fixed in 1.1.

Fix: none, however avoiding the area where the crash occurred for 24 hours normally "rerolls" the encounter.

---
### Honed Metal Random Crash (SkyrimSE.exe+DDB796)

This we believe to be caused by scrolling though the honed metal blacksmith menu too quickly, causing skyrim to fail to load item previews.

This typically happens around the Saddle's - we are not sure if this is the cause or just a co-incidence.


---

### Unidentified Random Crash (SkyrimSE.exe+C2A5F3)

This crash basically means something went wrong somewhere. Every report we have received is for different "relevant objects". It is not reproducible on demand.

Fix: reload and redo.
                                                                                                
---    

### Save corruption (SkyrimSE.exe+12DC5B)  

This crash means your save has corrupted - there is no fix. Any save you make after will have the same issue. Typical cause is "save-scumming"

Symptom: cant load any save after the initial load into the game (attempting causes a CTD). You may be able to "continue" from main menu, but not load specific save from  main menu, or visa versa.

Only solution is to roll back saves until you find one which works correctly.

Recommendations to reduce chance of issue occuring
* Don't save more than one a minute
* Never save in combat
* Avoid saving right after entering a building/cave/dungeon. 
* If you have re-enabled autosaves - turn them off.
 
---

                       
