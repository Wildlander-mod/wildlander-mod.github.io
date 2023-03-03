
----------
### Trampoline Error

![image](..\..\Assets\TrampolineError.png)

This error is caused by your "My documents" folder being managed by OneDrive.

The only fix for this issue is to sever the link between OneDrive and your "my documents" folder. Adding the folder to the exceptions simply doesn't work, neither does disabling OneDrive.

The following guide will assist you in the method to do so. <a href="https://steamcommunity.com/app/489830/discussions/0/2263565217515804221/" target="_blank" rel="noopener noreferrer">Guide <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

----------
### Error launching game Error: Unsupported type of line: [1] Error OR Any message starting "TypeError:" 

This means that Mod Organizer Crashed during Boot up or Shutdown and wiped its INI files. A reinstall (overwrite) using Wabbajack of the list will resolve this issue.

1. Start up Wabbajack, search the Modlist and click the Download Button again.
2. I choose the Installation and download location to match your original install path
3. In bottom right - toggle Overwrite Installation
4. Hit the start/play Button.

An issue has been raised with launcher team to implement a backup and restore function for this file to prevent user's having to perform this action.

----------
### Get-cimInstance Error on launch of game
![image](https://user-images.githubusercontent.com/26418143/162614762-bc1ea263-2e61-4e68-9669-c580f157dac8.png)

This error occurs when the winmgmt service is corrupt or crashed. It can be simply repaired by

Open Command prompt and typing the following 3 commands

```
net stop winmgmt (and y if prompted)
Winmgmt /resetrepository 
Winmgmt /verifyrepository should say it's consistent.

```

----------
### A JavaScript error in spawning the main process

![image](https://user-images.githubusercontent.com/26418143/166228493-43f26798-a7d4-4d04-84e1-e1a8a5ce0c47.png)

Generally this is caused by an Environment variable fault with PowerShell not in the “System Variables” 'PSmodulePath' or the 'Path' Environment variables (it needs to be in both).

Type “envir” in the “Search the web and Windows” box and selected “Edit environment variables for your account” under the “Best Match”.

Path should contain an entry for your equivalent of `C:\windows\System32\WindowsPowerShell\v1.0\`

PSmodulePath should contain an entry for `%SystemRoot%\system32\WindowsPowerShell\v1.0\Modules` and `%ProgramFiles%\WindowsPowerShell\Modules`

----------

### Assertion failed in Drivers\Render.CPP

Unfortunatly this error is not related to the wildlander modlist itself as users who have this issue also have the same problems running other modlists with a enb. This message indicates that the ENB is failing to hook into Direct X which is a possible indication of a more serious problem with your PC.

The known causes of this issue:-

1. Overactive antivirus blocking the process. (Webroot is known to do this)
1. the use of a 'Debloater' on your windows install which has removed key files needed to hook into direct-X
1. Windows itself has issues with its system files which are preventing the connection.

Your options to resolve :-

1. Run Wildlander without using a ENB (No shaders from the launcher)
1. Identify the antivirus process blocking the ENB and add a exception or disable while running wildlander.
1. Repair/reinstall Windows.


----------
### Game doesn't boot when launching SKSE / Cannot Start SKSE_Loader Error

[![image of SKSE Error](https://camo.githubusercontent.com/d1e2036affcaac1d9ca807db293176917ba048b5d0a53ad07c718ddef81618ad/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3334383537393439353533373830333237342f3738343630333430313939353638313739342f436170747572652e504e47)](https://camo.githubusercontent.com/d1e2036affcaac1d9ca807db293176917ba048b5d0a53ad07c718ddef81618ad/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3334383537393439353533373830333237342f3738343630333430313939353638313739342f436170747572652e504e47)

Ensure the following:

1.  Check that your Antivirus is not flagging SKSE or any Skyrim related files, the best Solution is to add Antivirus exceptions to the Wildlander Directory and sub-directories.   
1.  Make sure your content folder contains usvfs_proxy_x64.exe & usvfs_proxy_x86.exe. If these files are missing, it's likely your antivirus has moved them to the virus vault.    
1.  Restore missing files from Mod Organizer Zip file in your Wildlander\download directory if you cannot find them in the virus vault

----
###  Launcher locks for Skyrimse.exe and immediately unlocks (game doesn't start)

You may see a dialog pop-up saying preparing VFS and/or a command window.

This is typically caused by Antivirus interference in the installation process. Please check [Wildlander and Antiviruses](#wildlander-and-antiviruses) for specific guidance on your Anti-virus

----

### Update/Install of launcher is Hanging  

Firstly—try a PC reboot, it's possible that one of the files we use is locked by a crashed session of Wildlander.

Un-install the launcher from Add-remove programs, then download and manually install the most recent from <a href="https://github.com/Wildlander-mod/Launcher/releases/" target="_blank" rel="noopener noreferrer">here <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

If you are using Norton, please see the [Wildlander and Antivirus section.](..\..\01Support/Faq/#wildlander-and-antiviruses)

