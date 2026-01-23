
### Why is the list showing "in maintenance on Wabbajack"

#### What does it mean?

When a mod is updated, hidden or taken offline, any lists using that mod will automatically be put into maintenance mode to prevent users from downloading a incomplete install.

If Skyrim updates - this will also force the list into maintenance as it will need to be checked and recompiled using the new source files. 

#### How long does maintenance last?
As long as necessary. No one can give you a ETA - It will take as long as it takes. Please don't give our support staff a migraine asking for a update.

On discord, You can subscribe to the !notifyme bot command to be notified when it is released. On Reddit, Dylan will post a official post to say when it is available.

#### Can I download the list anyway?

No - Forcing the list into Maintenance mode is a last resort. 

It will either resolve itself when the mod causing the issue is unhidden, or for Skyrim updates - need Dylan's intervention to resolve.

#### Can I download the other mods in the list?

If you want to do it manually via the list manifest on the Wabbajack website, sure. Automatically, no.

#### My install was in progress, Can't someone just give me the missing file(s)?

No, Wildlander respects all mod author permissions. If a mod or file has been taken down, and  has not allowed redistribution from another source, we will not provide you a link. 

Asking for one anyway is a violation of rules. (Even if you ask staff in a private chat) Sharing a link "you found" or reuploading a file is strictly prohibited unless you can prove you have permission to do so.

#### Can't I just manually install / Is there a "Manual Installation" guide?

Not any more - As Wabbajack is a more reliable install method which requires little user interactions and produces a consistent install every time - the manual installation guide was removed.

#### Can I edit the Wabbajack file so it installs anyway?

No. Wabbajack files are compiled and cannot be manually edited. 

---------

### Wabbajack browser not loading anything on the login to Nexus Page.

Please install WebView2 by using the installer from this link: <a href="https://developer.microsoft.com/en-us/microsoft-edge/webview2/" target="_blank" rel="noopener noreferrer">Evergreen Standalone Installer <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

If you already have it - uninstall and reinstall

----

### Wabbajack Finds no results.

Typically caused by network management software "Killer control panel" which comes pre-installed with some laptops and PC's. (It may also be called Killer Intelligence Center or it's a K icon in your system tray)


To resolve, disable the Prioritization Center and  Auto Bandwidth. Then restart Wabbajack.

![image](https://user-images.githubusercontent.com/26418143/210167325-998f3644-447e-43f5-8aad-49209c20edd2.png)


----

### Wabbajack fails to start with a "Unknown Error".

Delete Wabbajack.exe, Redownload from <a href="http:\\Wabbajack.org" target="_blank" rel="noopener noreferrer">Wabbajack <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>.

----
### Wabbajack fails to start "You Cannot run as a Admin".

Wabbajack cannot be run as an Admin. 

If you are not manually running the game as an Admin, check your windows UAC settings and make sure that UAC is not "off" as this will run everything as an admin.

![image](https://wiki.wildlandermod.com/Assets/UAC.webp)

Reboot your PC after making this change.

#### If you have installed a custom version of windows and cannot turn on UAC (or you have and it doesnt work)


1. Create a basic user account (Accounts -> Other users then add other user, click on Users, more actions and create new user.
1. login to that account - start Skyrim to add the registry entries for that user.
1. Log back into your primary account.
1. Then Holding shift, right click the .exe which will give a "Run as different user" command, select your created basic user and if that user is not administrator it should work

---------

### Do I have to install both game and downloads to same drive

No, you can have them on separate drives - just make sure you point your Download location to where you want the zip files to live.

you can even share download folders between multiple modlists.

----------

### How much drive space do I need

Around 135gb

----------

### How many mods do I need to Download?

521

----------

### Do I need to download everything if I plan on playing potato 

Yes - Wabbajack won't install unless it has all mods, creating a list for potato users only is not easy to do and would require a completely separate Wabbajack Modlist.

----------


### Can I just download the Graphics only

No, again this would be a completely separate list which would need its own separate Wabbajack Modlist.

----

### Wabbajack fails to find Skyrimse.exe.

There are several causes of this:-
1. You haven't ran it. Fix: Close Wabbajack, Make sure you run skyrim directly to the menu.
1. You don't own a Steam/GOG version. Wabbajack does not support Gamepass, Xbox or Epic Game store versions.
1. You have moved your skyrim folder from where it was originally installed and you didnt use the steam "move install" option to do it. Fix: Move it back to the original location and use the steam move tool to move the game to a different library on your computer. You can use <https://github.com/LostDragonist/steam-library-setup-tool/wiki/Usage-Guide> to create new steam libraries on your primary hard drive.
1. There is a problem with your steam install which is prevening the "gamefinder" library that wabbajack uses to identify installed games from finding the library skyrim is installed in. Fix: Consult with Wabbajack staff, Wildlander staff cannot help with this issue.
1. You have a Cracked version of skyrim. Fix: Buy the game.

----

## Wabbajack is asking me to login but isn't displaying the captcha

Go to the settings menu, log out and then log back in - this page should display the captcha correctly.


----------
### Wabbajack freezes with error Outside of Standard Install folder Or Does not start downloading mods.

Typically caused by a corrupted cache file.

Fix: Reset your Wabbajack installation

1. To completely reset your Wabbajack settings, start off by closing Wabbajack if it is open.
2. Afterwards, press Windows + R on your keyboard and type in %localappdata%. 
3. You should see a Windows Explorer window pop up, find and delete the folder called Wabbajack inside. 
4. restart wabbajack, log back in again and restart your installation.

### Every Nexus mod fails download.

This is caused by your API token expiring. It can be resolved by logging out and logging back in.

![image](https://wiki.wildlandermod.com/Assets/WJ_Login.png)

### Wabbajack fails to download mods or hangs for a long time.

Check Task manager, if Wabbajack is not using any network resources, its likely the download has failed/timed out - then please use the suggestions below.

1. If you log shows "Wabbajack.Networking.Http.HttpException: Http Error Unauthorized - Unauthorized" This means your Nexus API token has expired and you need to log out and log back in from the wabbajack settings menu.
1. Close and restart Wabbajack - Start the Wildlander install process again, entering same criteria as originally. Wabbajack will CRC check your existing files and should resume where it failed & complete the install without any further intervention.
1. If that does not resolve the issue, try using a VPN service such as Cloudflare WARP or ProtonVPN. (Wildlander is not affiliated with and does not endorse any specific VPN service. We do not provide user support for VPN services. Use at your own discretion.)

#### If above fails then manually download the file using the following procedure:-
    
If these files hang, manually download and add to your Wabbajack specified download folder (still zipped)

** If Manually downloading all these files will have to be manually downloaded**

* DVLAS <https://www.nexusmods.com/skyrimspecialedition/mods/44483/?tab=files&file_id=187402>
* Argonians Enhanced Textures Simple <https://www.nexusmods.com/skyrimspecialedition/mods/48346/?tab=files&file_id=197218>
* Argonian Mouth Remastered <https://www.nexusmods.com/skyrimspecialedition/mods/48346/?tab=files&file_id=197213>
* HD Nostril Tint Mask <https://www.nexusmods.com/skyrimspecialedition/mods/48346/?tab=files&file_id=197215>
* HD Scars Vanilla <https://www.nexusmods.com/skyrimspecialedition/mods/48346/?tab=files&file_id=197217>
* Nordic tent <https://www.nexusmods.com/skyrimspecialedition/mods/19627/?tab=files&file_id=64444>
* ETaC SSE <https://www.nexusmods.com/skyrimspecialedition/mods/13552/?tab=files&file_id=79876>

**High Poly Head**

<https://drive.google.com/uc?id=15_0njBUjHKidNnJPmLXEygzGVWsA3Zbq&export=download> 

Mirror

<https://build.wabbajack.org/authored_files/direct_link/High_Poly_Head_v1.4_(SE).zip_8ff93290-e8b8-45ed-979b-6c5f41f31a6b>

**Wildlander Resources**

This file is quite large - and on slower Internet connections' may timeout.

In the event of this occurring for you you can try downloading <a href="https://www.nexusmods.com/skyrimspecialedition/mods/70016? " target="_blank" rel="noopener noreferrer">Resources - Wildlander Full <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a> from nexus manually, and placing it in your downloads folder still zipped.


**Nexus mods in general**

you may need to use a VPN and/or different browsers to download these files. We are not sure why nexus is blocking access. Premium users can try this 

If you are experiencing issues with Nexus downloads, please try switching your preferred Nexus download server to something close to your location in the account settings.

You can access this area by clicking on your account in the top right, and selecting site preferences.

<https://www.nexusmods.com/>

![img](https://wiki.wildlandermod.com/Assets/cdn.webp)

**Direct Download Links**

Search the following link for the mod(s) and manually download.

<a href="https://github.com/Wabbajack-tools/mod-lists/blob/master/reports/Wildlander/wildlander/status.md" target="_blank" rel="noopener noreferrer">Modlist links <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a> 

----------

### Getting a download failed on Original Skyrim files

If you get the following error - Make sure Skyrim is installed in English, validate your game files in Steam. then check the language is set to english in Steam > Right Click > Properties > Language tab

- Unable to download Skyrim_Default.ini

![image](https://i.imgur.com/PwCNDF5.png)

For any other default Skyrim file, Wildlander requires  a specific version of the Anniversary edition update of skyrim SE (version 1.6.1170 at time of writing) on steam. If you are running a older version of skyrim - E.G (1.5.97) you will need to update to the current version before you can install. We do not support GOG, Epic games or Gamepass versions of skyrim.

If Skyrim has updated recently - it will require the list to be recompiled to cope with these changes. 

#### To update to current version.

![image](https://user-images.githubusercontent.com/26418143/169777545-a0377c57-60bc-4271-929c-5707c7b8277a.png)

----------

### Wabbajack won't download the Wildlander installer.

This is typically caused by a mis-configured firewall between your PC and the Wabbajack build server.

If you are unable to download it though Wabbajack, then visit <a href="https://www.nexusmods.com/skyrimspecialedition/mods/70016?tab=files" target="_blank" rel="noopener noreferrer">here <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a> and download the Install File Backup.

Once downloaded Navigate to the Wabbajack folder and find the downloaded_mod_lists folder. unzip the backup into this location.

Start Wabbajack - then select "install from disk" Point it at the Wabbajack file you just unzipped.

![image](https://user-images.githubusercontent.com/26418143/210167336-ab3c1a56-54c4-40ec-88a0-ae28f4025c28.png)

----
