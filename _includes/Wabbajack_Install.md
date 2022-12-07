
## Why is the list showing "in maintenance on wabbajack"

### What does it mean?

When a mod is updated, hidden or taken offline, any lists using that mod will automatically be put into maintenance mode to prevent users from downloading a incompletable Wabbajack install.

If Skyrim updates - this will also force the list into maintenance as it will need to be checked and recompiled using the new source files. 

### How long does maintenance last?
As long as necessary. No one can give you a ETA - It will take as long as it takes. Please don't give our support staff a migraine asking for a update.

On discord, You can subscribe to the !notifyme bot command to be notified when it is released. On Reddit, Dylan will post a official post to say when it is available.

### Can I download the list anyway?

No - Forcing the list into Maintenance mode is a last resort. 

It will either resolve itself when the mod causing the issue is unhidden, or for Skyrim updates - need Dylan's intervention to resolve.

### Can I download the other mods in the list?

If you want to do it manually via the list manifest on the Wabbajack website, sure. Automatically, no.

### My install was in progress, Can't someone just give me the missing file(s)?

No, Wildlander respects all mod author permissions. If a mod or file has been taken down, and  has not allowed redistribution from another source, we will not provide you a link. 

Asking for one anyway is a violation of rules. (Even if you ask staff in a private chat) Sharing a link "you found" or reuploading a file is strictly prohibited unless you can prove you have permission to do so.

### Can't I just manually install / Is there a "Manual Installation" guide?

Not any more - As wabbajack is a more reliable install method which requires little user interactions and produces a consistent install every time - the manual installation guide was removed.

### Can I edit the Wabbajack file so it installs anyway?

No. Wabbajack files are compiled and cannot be manually edited. 

---------

## Wabbajack browser not loading anything on the login to Nexus Page.

Please install WebView2 by using the installer from this link: [Evergreen Standalone Installer](https://developer.microsoft.com/en-us/microsoft-edge/webview2/)

If you already have it - uninstall and reinstall

----

## Wabbajack fails to start with a "Unknown Error".

Delete Wabbajack.exe, Redownload from [Wabbajack](http:\\Wabbajack.org).

----
## Wabbajack fails to start "You Cannot run as a Admin".

Wabbajack cannot be run as an Admin. 

If you are not manually running the game as an Admin, check your windows UAC settings and make sure that UAC is not "off" as this will run everything as an admin.

[![img](https://cdn.discordapp.com/attachments/666599178788536331/1041355863832678500/image.png)

Reboot your PC after making this change.

### If you have installed a custom version of windows and cannot turn on UAC (or you have and it doesnt work)

{: .save}
> Create a basic user account (Accounts -> Other users then add other user, click on Users, more actions and create new user.
> 
> login to that account - start Skyrim to add the registry entries for that user.
> 
> Log back into your primary account.
> 
> Then Holding shift, right click the .exe which will give a "Run as different user" command, select your created basic user and if that user is not administrator it should work

---------

## Do I have to install both game and downloads to same drive

No, you can have them on separate drives - just make sure you point your Download location to where you want the zip files it live.

----------

## How much drive space do I need

Around 135gb

----------

## How many mods do I need to Download?

521

----------

## Do I need to download everything if I plan on playing potato 

Yes - Wabbajack wont install unless it has all mods, creating a list for potato users only is not easy to do and would require a completely separate wabbajack installer.

----------


## Can I just download the Graphics only

No, again this would be a completely separate list which would need its own separate wabbajack installer.

----------

## Wabbajack fails to download mods or hangs for a long time.

Check Task manager, if wabbajack is not using any network resources, its likely the download has failed/timed out - then please use the suggestions below.

1.  Close and restart Wabbajack - Start the Wildlander install process again, entering same criteria as originally. Wababjack will CRC check your existing files and should resume where it failed & complete the install without any further intervention.
2.  If you are experiencing issues with Wabbajack repeatedly failing to download one or more files (same files every time), try enabling the Network Workaround in Wabbajack settings.

[![img](https://camo.githubusercontent.com/72d29a1cda8ff5fa29f42ff8232ea890764cbae1c17344c50a8deea51645cf3c/68747470733a2f2f696d616765732d6578742d322e646973636f72646170702e6e65742f65787465726e616c2f4f506f423576314f734e516c3749315f592d2d636a3967527567553759734f4655536b47633234345753632f68747470732f692e6962622e636f2f4644504472666b2f446973636f72642d56504e2e706e67)](https://camo.githubusercontent.com/72d29a1cda8ff5fa29f42ff8232ea890764cbae1c17344c50a8deea51645cf3c/68747470733a2f2f696d616765732d6578742d322e646973636f72646170702e6e65742f65787465726e616c2f4f506f423576314f734e516c3749315f592d2d636a3967527567553759734f4655536b47633234345753632f68747470732f692e6962622e636f2f4644504472666b2f446973636f72642d56504e2e706e67)

3.  If that does not resolve the issue, try using a VPN service such as Cloudflare WARP or ProtonVPN. (Wildlander is not affiliated with and does not endorse any specific VPN service. We do not provide user support for VPN services. Use at your own discretion.)
    
4.  If above fails then manually download the file using the following procedure:-
    
If these files hang, manually download and add to your wabbajack specified download folder (still zipped)

**Wildlander Resources**

This file is quite large - and on slower internet connections' may timeout.

In the event of this occuring for you you can try downloading [Resources - Wildlander Full](https://www.nexusmods.com/skyrimspecialedition/mods/70016? ) from nexus manually, and placing it in your downloads folder still zipped.

**Nexus mods in general**

you may need to use a VPN and/or different browsers to download these files. We are not sure why nexus is blocking access. Premium users can try this 

![img](https://cdn.discordapp.com/attachments/881254575640838254/929341753885085738/unknown.png)

For any failed mods which are not mentioned above Search the following link for the mod(s) and manually download.

[Modlist links](https://github.com/wabbajack-tools/mod-lists/blob/master/reports/wildlander/status.md) 

----------

## Getting a download failed on Original Skyrim files

If you get the following error - Make sure Steam is installed in English, validate your game files in Steam. Steam > Right Click > Properties > Language tab
- Unable to download Skyrim_Default.ini

![image](https://user-images.githubusercontent.com/26418143/169777216-29de696c-b3bc-4829-9bf4-05a571a7aab7.png)

Wildlander requires Anniversary edition, If you get any of the following - update your Skyrim. If you have used Halgari's downgrade patcher - you will need to validate your game fields from Steam > Right Click > Properties > Local files tab.

If Skyrim has updated recently - then it might require the list to be recompiled to cope with these changes. Staff will typically put the list into maintenance if this is the case.

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

![image](https://user-images.githubusercontent.com/26418143/169777545-a0377c57-60bc-4271-929c-5707c7b8277a.png)
