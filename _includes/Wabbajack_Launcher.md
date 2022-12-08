

## Wildlander and Antiviruses

Several Anti-virus programs are known to cause issues with launching list, Some cause issues with Wabbajack itself, others with running the list once installed.

If you are experiencing problems running Wabbajack such as the exe being deleted or no progress during the installation phase, try adding your Wabbajack folder (where the executable is located) and your selected modlist installation location to exclusions in your anti-virus of choice. Find out how to via [Here](https://lmgtfy.app/?q=how+to+add+exclusions+to+antivirus)

{: .warning}
If you're using a 3rd party anti-virus (such as AVG, Avast, BitDefender, Webroot, Kaspersky, Norton, McAfee etc.) it's likely that adding the folders to exclusions will not be enough and you may need to disable or uninstall your 3rd party AV as they can incorrectly mark files like usvfs_proxy_x86.exe (required for MO2), The launcher or SKSE itself as a virus.

We recommend doing so anyway as Windows Defender is likely much better at stopping threats, according to data from [av-test.org](https://www.av-test.org/en/antivirus/home-windows/).

For Specific issues with individual Anti-virus software, Please see below.

### Bitdefender


#### It does not like Wabbajack's Downgrading routine and can cause corruption, preventing the game to launch.

 1. Disable Bitdefender 
 1. Delete game-files\Stock game
 1. Reinstall Wildlander from Wabbajack, choosing Overwrite installation and wait for install to complete.
 1. you should now be able to launch.


#### It causes crashes to desktop while saving.

Recommendations: Disable Bitdefender during Wabbajack install. Apply the following fixes after install to prevent crash on save
 1. Easy solution - Turn off Advance Threat Defense when playing Wildlander

 Or 

 1. proper Solutions - Add a ADT exception for Wildlander\game-files\Stock Game\SkyrimSE.exe
 1. If you also have "Ransom-ware Remediation" on Add Wildlander\game-files\ModOrganizer.exe       

---


### Webroot

  Webroot Anti-virus is completely incompatible with the .net Crash logging mod we use in the pack. It will cause a crash on Startup. 

  To play, you need to shut down the anti-virus completely from the system tray. 

  There are no options you can tick, and no exclusions you can apply to make this anti-virus play nice.

 ![img](https://media.discordapp.net/attachments/881254575640838254/937500500360851466/unknown.png) 

---


### McAfee Antivirus.

 It is known to cause a corruption in the Skyrim downgrade during installation process from Wabbajack

1. Disable McAfee 
1. Delete game-files\Stock game
1. Reinstall Wildlander from Wabbajack, choosing Overwrite installation and wait for install to complete.
1. you should now be able to launch.

---


 ### Norton
 If using Norton, and it blocks the launcher for intrusive activity (During start up - while it's checking for updates) you may want to configure  [these settings](https://support.norton.com/sp/en/uk/home/current/solutions/v15471442/) to exclude a URL or domain rom monitoring URL: https://github.com/Wildlander-mod/Launcher/releases. Please note - Support are not able to assist you in how to apply these settings - we dont have Norton installed.

 If you are still unable to run after performing these steps, then unfortunately - you will be unable to use the launcher unless you uninstall Norton. Your only method of playing Wildlander would be to use Mod organizer to launch and manually install the ENB in the stock game folder.

----

 ### Avast
 Is known to flag launcher as a false positive for spy-ware. Our launcher is open source, you can check for yourself that it is free of spy-ware. As Avast is known to be Spy-ware in its own right and sensible people un-installed this years ago. Even stock windows offers better protection, without selling your Internet browsing history to the highest bidder.  [Source](https://antivirus-review.com/blog/avast-programs-spy-on-their-users)

 Should you wish to keep using Avast.
 
 1. Disable Avast 
 1. Delete game-files\Stock game
 1. Reinstall Wildlander from Wabbajack, choosing Overwrite installation and wait for install to complete.
 1. you should now be able to launch using the launcher.
 1. Shutdown Avast running whenever you want to play


## What do the Dropdowns mean

### Modlist Drop down

* Standard- Everything on.
* Performance - All graphics mods turned off.

### Quality Drop down

These are your standard Skyrim parameters. The Graphics dropdown determines the quality of basic graphical elements, such as the draw distance of grass and shadows, the number of effects visible at once, and the quality of distant objects. These elements use a mix of CPU and GPU.

* Ultra - Everything on, All the bells and whistles - For "beast" PC's
* High - Reduced Draw distances compared to Ultra, but still the full mod package.
* Medium - Reduced Draw distances compared to High, but still the full mod package.
* Low - No grass, no shadows, but still the full mod package.
* Potato - Stripped down graphics for PC's which were built when oldrim was first released.

### Shaders Drop down

These control the level of ENB Shaders being applied. The Shaders' dropdown determines the quality of post-processing effects, such as environment lighting, particle lighting, ambient occlusion, sun rays, and water effects. These elements are very heavy on the GPU.

* Ultra - Default Zangdar's ENB Everything on, All the bells and whistles plus grass collision
* High  - Default Zangdar's ENB Everything on, All the bells and whistles
* Low   - Zangdar ENB Performance preset 
* No ENB - Run without shaders at all


----------
## Trampoline Error

![image](..\Assets\TrampolineError.png)

This error is caused by your "My documents" folder being managed by OneDrive.

The only fix for this issue is to sever the link between OneDrive and your "my documents" folder. Adding the folder to the exceptions simply doesn't work, neither does disabling OneDrive.

The following guide will assist you in the method to do so. [Guide](https://steamcommunity.com/app/489830/discussions/0/2263565217515804221/)

----------
## Error launching game Error: Unsupported type of line: [1] Error

This means that Mod Organizer Crashed during Boot up and wiped its files. a reinstall (overwrite) using wabbajack of the list will resolve this issue.

----------
## Get-cimInstance Error on launch of game
![image](https://user-images.githubusercontent.com/26418143/162614762-bc1ea263-2e61-4e68-9669-c580f157dac8.png)

This error occurs when the winmgmt service is corrupt or crashed. It can be simply repaired by

Open Command prompt and typing the following 3 commands

{: .note}
>
>net stop winmgmt (and y if prompted)
>
>Winmgmt /resetrepository 
>
>Winmgmt /verifyrepository should say it's consistent.


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
1.  Make sure your content folder contains usvfs_proxy_x64.exe & usvfs_proxy_x86.exe. If these files are missing, it's likely your antivirus has moved them to the virus vault.    
1.  Restore missing files from Mod Organiser Zip file in your Wildlander\download directory if you cannot find them in the virus vault

----
##  Launcher locks for Skyrimse.exe and immediately unlocks (game doesn't start)

V1.0 issue only.

You may see a dialog pop-up saying preparing VFS and/or a command window.

Firstly - Make sure you are logged into the steam account which owns Skyrim.

If you are - You are missing a prerequisite from the installation guide. https://www.wildlandermod.com/download#before-we-begin

Download [c++](https://aka.ms/vs/16/release/vc_redist.x64.exe)

AND [Desktop runtime](https://download.visualstudio.microsoft.com/download/pr/bf058765-6f71-4971-aee1-15229d8bfb3e/c3366e6b74bec066487cd643f915274d/windowsdesktop-runtime-6.0.1-win-x64.exe)

AND [Dotnet runtime](https://download.visualstudio.microsoft.com/download/pr/fccf43d2-3e62-4ede-b5a5-592a7ccded7b/6339f1fdfe3317df5b09adf65f0261ab/dotnet-runtime-5.0.13-win-x64.exe)

Install ALL THREE. Yes, even the one which says consoles. Yes, we are SURE you need it. 

If you have them - repair them anyway. Make sure you reboot.

----

## Update/Install of launcher is Hanging  

Firstly—try a PC reboot, it's possible that one of the files we use is locked by a crashed session of Wildlander.

Un-install the launcher from Add-remove programs, then download and manually install the most recent from [here](https://github.com/Wildlander-mod/Launcher/releases/)

If you are using Norton, please see the [Wildlander and Antivirus section.](Faq.html#norton)

