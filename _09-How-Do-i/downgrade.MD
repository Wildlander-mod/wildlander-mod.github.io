---
layout: default
title:  How Do I Downgrade Skyrim?
has_toc: false
has_children: false
description:  How Do I Downgrade Skyrim so I can (re)install the list? 
---

If your Skyrim is up to date, you will NOT be able to install some modpacks until you downgrade Skyrim. 

<!-- 
### Option 1:

Using a 3rd party downgrading tool. 

Before doing this make sure to verify your files on steam
1. Open steam
2. Right click on Skyrim special edition and select properties
3. Go to local files tab
4. Click verify integrity game files.

Next we need to download a tool, configure it for your Skyrim install location and run it.

1. Download file <https://www.nexusmods.com/skyrimspecialedition/mods/106403?tab=description>
2. Unzip to a folder - doesn't matter what its called. C:\Downgrade is a good idea.
3. IMPORTANT - If your Skyrim is not installed in c:\ program files(x86) you will have to edit the Downpatch.bat (right click> edit  (windows  11 Right click > more options> edit)) file to point at where Skyrim is installed.
4. Run the batch file. You may need to run as Administrator depending on if your steam library is in a windows protected folder.

Note: Its normal to get some error's if you don't own the AE DLC (or its not installed) 

### Option 2:

If you dont trust a 3rd party tool, you can use steam itself to download a older version. however the drawbacks to doing this is its slow, and if a file fails you have to redownload the entire depot.-->

1. Open a command window "Run" by pressing «Win + R» and then enter the command: steam://open/console, and then press Enter.
this will open console tab on your Steam

2. On the bottom will have a space for you to enter the code. Enter these codes, one at a time, and **WAIT FOR THEM TO CONFIRM THAT THEY ARE DONE DOWNLOADING** before entering the next one
> download_depot 489830 489831 3660787314279169352
>
> download_depot 489830 489832 2756691988703496654
>
> download_depot 489830 489833 5291801952219815735

3. Check each depot has downloaded successfully, It will download the files to your "\Steam\steamapps\content\app_489830\" folder. If you cannot find it, just search on the steam folder: "depot 489831" "depot 489832" and "depot 489833" after download is done. If you are missing files - simply redo the depot command until you have all the files. **DO NOT SKIP THIS CHECKING STEP**
> depot 489831 should contain 16 files
>
> depot 489832 should contain 26 files
>
> depot 489833 should just contain Skyrim's exe


4. Replace your "steamapps\common\Skyrim Special Edition" files with the ones in "depot 489831" "depot 489832" and "depot 489833" in that order. Copy the contents and paste them into your steam installation folder, overwriting files which are already there (Do not copy the depot folders themselves - Just their contents)


---

Once you have downgraded, Restart Wabbajack. Enter the same criteria as you did the first time and tick "Overwrite Install".

<!-- **If option 1 didn't downgrade everything, use option 2 to get and replace the files you are missing.**-->

---

**Do not** under any circumstances use Halgari's download patcher as it currently doesn't work on downgrading from 1.6.1170.