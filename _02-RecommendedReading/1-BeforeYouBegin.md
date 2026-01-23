---
layout: default
title: Before You Begin
has_toc: true
nav_order: 2
description: Before You Begin Playing
---

## Table of contents
{: .no_toc }
<details markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>


You should not be starting Skyrim from steam, you should not be running SKSE, you should not be running mod organizer.  Instead, you should be using our dedicated launcher which allows you to customize the Screen resolution, Graphics settings and ENB shaders.

![image](https://user-images.githubusercontent.com/26418143/156929221-ffad3b5a-3ff2-4ce8-ab34-051760b33e50.png)

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

{: .important} 
> The Pagefile is different to System Ram.

The Pagefile is often used for spill over for the GPU VRAM (as GPU's don't have DMA - they can't use System ram as a overflow) and it is also used like a staging area for assets from disk. Having 32/64 GB of System ram does not mean that you may not experience page file related issues.


{% include Wabbajack_AV.md %}


## Suggestions for various GFX cards


{: .NoTitleYellow}
> These are recommendations for running at a average of 60FPS @ 1080p with the assumption that you do not have anything running on your PC with the exception to the Wildlander Launcher and Skyrim Itself.
> 
> Performance will vary if you are running on 4K or Ultrawide resolutions, and you may need experiment with settings to get optimum performance. Likewise if you have Firefox with 50 tabs, Spotify and god knows what else running at the same time. 
>
> These are intended for **guidance only**, and it is the responsibility of the user to work out what works best for your setup. Yelling at staff that you don't get the performance you want and demanding "we" fix it for you will not be tolerated.


| Card        | Graphics        | Shaders | Comments |
|:-------------|:------------------:|:------:|------|
| Cards with 4GB Vram GDDR5 GTX 9 series equivalent or worse | Potato/Low | None  | Depending on Ram and CPU Can push this to a Medium graphics. Performance modlist Essential|
| Cards with 6GB Vram GDDR5 E.G `GTX 1060` or equivalent | Medium | None | Depending on generation, RAM and CPU, can push this to a high graphics. Performance modlist Essential|
| Cards with 8GB Vram GDDR5 E.G `GTX 1070` or equivalent | High | None | Depending on generation, RAM and CPU, can push this to a low shaders. Performance modlist Recommended |
| Cards with 6GB of GDDR6 Vram. E.G `RTX 2060/3050/4050` or equivalent | High | Low | Depending on generation, RAM and CPU, can push this to ultra graphics |
| Cards with 8GB of GDDR6 Vram. E.G `RTX 2070/4060` or equivalent | High | High | Depending on generation, RAM and CPU, can push this to ultra graphics |
| Cards with 12GB of GDDR6 Vram. E.G `RTX 3060/4070/3080` or equivalent | Ultra | High | Depending on generation, RAM and CPU, can push this to ultra shaders |
| Cards with More than 16GB of GDDR6 Vram E.G `RTX 3090/4080/4090` | Any | Any | Knock yourself out with whatever takes your fancy |
---

**Next in Recommended Reading:** [Stability Test →](2-Stability-Test)
