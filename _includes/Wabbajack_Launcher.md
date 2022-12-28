
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

If you are using Norton, please see the [Wildlander and Antivirus section.](http://wiki.wildlandermod.com/01Support/Faq/#wildlander-and-antiviruses)

