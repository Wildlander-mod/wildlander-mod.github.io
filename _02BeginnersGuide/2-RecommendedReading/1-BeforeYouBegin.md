---
layout: default
title: Before You Begin
has_toc: true
parent: Recommended Reading
nav_order: 1
description: Before You Begin Playing
---

------
# Before you Begin

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


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

GEFORCE® GTX 9 SERIES or Equivalent cards (or worse), potato/low Graphics No shaders. Depending on Ram and CPU Can push this to a Medium graphics.

GEFORCE® GTX 10 SERIES up to 1060 GTX or Equivalent cards, Medium graphics, No shaders. Depending on Ram and CPU Can push this to a high graphics.

GEFORCE® GTX 10 SERIES from  1070 GTX or Equivalent cards, High graphics, No shaders. Depending on Ram and CPU Can push this to a Low shaders.

GEFORCE® GTX 20 SERIES up to 2060 GTX or Equivalent cards, High Graphics, Low shaders. Depending on Ram and CPU Can push this to high shaders.

GEFORCE® GTX 20 SERIES from  2070 GTX or Equivalent cards, High graphics, high shaders. Depending on Ram and CPU Can push this to a Ultra Graphics.

GEFORCE® GTX 30 SERIES up to 3060 GTX or Equivalent cards, Ultra Graphics, high shaders.  Depending on Ram and CPU Can push this to ultra shaders.

Anything better than a 3060 GTX - Knock yourself out with whatever takes your fancy.