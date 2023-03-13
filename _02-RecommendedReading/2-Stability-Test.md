---
layout: default
title: Stability Test
has_toc: true
nav_order: 2
description: Stability test
---

_As the great quote goes: “Better be Safe than 15 hours in-sorry”_ 😝

_This guide has been created for new users in mind that want to stress test the stability of their game after downloading **base** Wildlander._

**Steps For Initial Stress Test**

1.  Start a New Game Skip through all the options.
1.  Open MCM Menu (press Escape, Scroll down to mod configuration)
1.  Find “Sunhelm” and **Disable**
1.  Find “Frostfall” and **Disable**
1.  Open Console by pressing '~' “Tilde” Key is below ESC*
1.  type: tgm   (Enter)  *  This Enables "The God Mode"
1.  player.setav speedmult 1200 (Enter) *This adjusts your characters speed*
1.  set timescale to 1000 (Enter) *This adjusts your worlds timescale*
1.  coc whiterun (Enter) *This teleports you to Whiterun*
1.  Your goal now is to run from Whiterun to Solitude Docks
    - You will get some stutter, maybe even a lot - that is fine. You just don't want to CTD.
    - Stay on the road the best you can while also trying to complete this as fast as you can
    - This may make you motion-sick - but this is Unavoidable as we are trying to force skyrim to load as much as possible
          as fast as possible.
1.  Run to Solitude Docks
1.  Once at the end of the docks (There is a _boat on your right_ ), spin and generally move around erratically
1.  If you do not experience any crashes during this process, your installation should be fine and you have a stable game - 

{: .important}
>
> **Make sure to Exit and Restart Skyrim COMPLETELY before creating your first character to prevent script contaimination from the stability test.**

**Congratulations! You’ve finished the Stress Test!!** 🎉🎉🎉🎉

## Troubleshooting

### I Crashed Jumping and Spinning at The Solitude Docks, Now What?
If you make it to Solitude Docks **but** crashed while there/spinning

     Test again with a lower ENB shader
         
### I Crashed On The Way To Solitude!
Your Wildlander graphics settings are too high!

     Test again with a lower Graphics preset
	 
### I Crashed during character creation!

This could indicate a problem/corruption with the install OR you selected too much for your PC to handle.

1. Firstly Make sure you have setup the page file as recommended <https://wiki.wildlandermod.com/02-RecommendedReading/1-BeforeYouBegin/#page-files>
1. Then create a character using both of the following tests
```
	Test with the lowest settings, (Potato Graphics, No shaders, Performance list.)
	Repeat with the lowest settings, (Potato Graphics, No shaders, Standard list.)
```	
If both tests pass - then you were probably running too high for what your PC was capable of running or you had insufficient page-file. You can now increase the settings on the launcher until you find one that your PC can play.

If you continue to crash - Please consult with Staff on discord who will take a look at your crash logs to suggest corrective action.





