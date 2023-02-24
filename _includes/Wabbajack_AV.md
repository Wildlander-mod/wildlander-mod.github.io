
### Wildlander and Antiviruses

Several Anti-virus programs are known to cause issues with launching list, Some cause issues with Wabbajack itself, others with running the list once installed.

If you are experiencing problems running Wabbajack such as the exe being deleted or no progress during the installation phase, try adding your Wabbajack folder (where the executable is located) and your selected modlist installation location to exclusions in your anti-virus of choice. Find out how to via <a href="https://lmgtfy.app/?q=how+to+add+exclusions+to+antivirus" target="_blank" rel="noopener noreferrer">Here <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

{: .warning}
If you're using a 3rd party anti-virus (such as AVG, Avast, BitDefender, Webroot, Kaspersky, Norton, McAfee etc.) it's likely that adding the folders to exclusions will not be enough and you may need to disable or uninstall your 3rd party AV as they can incorrectly mark files like usvfs_proxy_x86.exe (required for MO2), The launcher or SKSE itself as a virus.

We recommend doing so anyway as Windows Defender is likely much better at stopping threats, according to data from <a href="https://www.av-test.org/en/antivirus/home-windows/" target="_blank" rel="noopener noreferrer">av-test.org <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>.

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

 It is known to cause a corruption in the Skyrim downgrade during installation process from Wabbajack - even when the antivirus has finished its subscription. If it's still installed (even expired) it can and DOES cause issues.

1. Disable McAfee (if its expired, for your sanity - just uninstall the thing)
1. Delete game-files\Stock game
1. Reinstall Wildlander from Wabbajack, choosing Overwrite installation and wait for install to complete.
1. you should now be able to launch.

---


### Norton
If using Norton, and it blocks the launcher for intrusive activity (During start up - while it's checking for updates) you may want to configure  <a href="https://support.norton.com/sp/en/uk/home/current/solutions/v15471442/" target="_blank" rel="noopener noreferrer">these settings <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a> to exclude a URL or domain from monitoring URL: `https://github.com/Wildlander-mod/Launcher/releases`. Please note - Support are not able to assist you in how to apply these settings - we dont have Norton installed.

 If you are still unable to run after performing these steps, then unfortunately - you will be unable to use the launcher unless you uninstall Norton. Your only method of playing Wildlander would be to use Mod organizer to launch and manually install the ENB in the stock game folder.

----

### Avast
Is known to flag launcher as a false positive for spy-ware. Our launcher is open source, you can check for yourself that it is free of spy-ware. As Avast is known to be Spy-ware in its own right and sensible people un-installed this years ago. Even stock windows offers better protection, without selling your Internet browsing history to the highest bidder.  <a href="https://antivirus-review.com/blog/avast-programs-spy-on-their-users" target="_blank" rel="noopener noreferrer">Source <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

 Should you wish to keep using Avast.
 
 1. Disable Avast 
 1. Delete game-files\Stock game
 1. Reinstall Wildlander from Wabbajack, choosing Overwrite installation and wait for install to complete.
 1. you should now be able to launch using the launcher.
 1. Shutdown Avast running whenever you want to play

---

### What do the Dropdowns mean

#### Modlist Drop down

* Standard- Everything on.
* Performance - All graphics mods turned off.

#### Quality Drop down

These are your standard Skyrim parameters. The Graphics dropdown determines the quality of basic graphical elements, such as the draw distance of grass and shadows, the number of effects visible at once, and the quality of distant objects. These elements use a mix of CPU and GPU.

* Ultra - Everything on, All the bells and whistles - For "beast" PC's
* High - Reduced Draw distances compared to Ultra, but still the full mod package.
* Medium - Reduced Draw distances compared to High, but still the full mod package.
* Low - No grass, no shadows, but still the full mod package.
* Potato - Stripped down graphics for PC's which were built when oldrim was first released.

#### Shaders Drop down

These control the level of ENB Shaders being applied. The Shaders' dropdown determines the quality of post-processing effects, such as environment lighting, particle lighting, ambient occlusion, sun rays, and water effects. These elements are very heavy on the GPU.

* Ultra - Default Zangdar's ENB Everything on, All the bells and whistles plus grass collision
* High  - Default Zangdar's ENB Everything on, All the bells and whistles
* Low   - Zangdar ENB Performance preset 
* No ENB - Run without shaders at all