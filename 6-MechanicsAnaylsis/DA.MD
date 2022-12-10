---
layout: default
title: Derived Attributes
nav_order: 5
has_toc: true
has_children: false
parent: Mechanic Analysis
---


# Derived Attributes

The following player attributes are calculated from your Health, Stamina or Magicka.  By investing level up points in the three main attributes, the player increases, not only the base value of these by 5 units at a time, but also the so-called derived attributes (DAs) by a certain amount. The current value of the DAs of a character can be seen in-game in Requiem's MCM menu.

* Magic resistance
* Magicka regeneration
* Disease resistance
* Poison resistance
* Stamina regeneration
* Unarmed damage
* Movement speed
* Carry weight 
* One-handed damage
* Two-handed damage
* Bow/dagger/unarmed damage

Each attribute has a Threshold before the calculation of bonuses start to apply. E.g you need 150 base Magicka before the Magic resistance Attribute is calculated.

In the table below: M, H, S stand for base magicka, health and stamina, respectively, while Z represents a weighted average. Also, sqrt{} stands for the square-root. Should you want to skip the heavy math - the next section includes a calculator which you can copy and play with yourself.

<table >
<thead>
<tr>
	<th>Derived Attribute</th>
	<th>Formula</th>
	<th>Attribute 'Z'</th>
	<th>'Z' Break Points</th>
	<th>Bonus to DA</th>
</tr>
</thead>
<tbody>
<tr>
	<td><strong>Magic Resistance</strong></td>
	<td>sqrt{Z - 150}</td>
	<td>M</td>
	<td>175 --- 250 --- 375</td>
	<td>5% --- 10% --- 15%</td>
</tr>
<tr>
	<td><strong>Magicka Regeneration</strong></td>
	<td>8x sqrt{Z - 100}</td>
	<td>M</td>
	<td>125 --- 200 --- 325</td>
	<td>40% --- 80% --- 120%</td>
</tr>
<tr>
	<td><strong>Stamina Regeneration</strong></td>
	<td>8x sqrt{Z - 100}</td>
	<td>S</td>
	<td>125 --- 200 --- 325</td>
	<td>40% --- 80% --- 120%</td>
</tr>
<tr>
	<td><strong>Movement Speed</strong></td>
	<td>(3/4)x sqrt{Z - 125}</td>
	<td>(20% H +  80% S) </td>
	<td>141 --- 190 --- 270 --- 381</td>
	<td>3% --- 6% ---   9% --- 12%</td>
</tr>
<tr>
	<td><strong>1H Damage</strong></td>
	<td>4x sqrt{Z - 150}</td>
	<td>(50% H + 50% S)</td>
	<td>175 --- 250 --- 375</td>
	<td>20% --- 40% --- 60%</td>
</tr>
<tr>
	<td><strong>2H Damage</strong></td>
	<td>4x sqrt{Z - 150}</td>
	<td>(80% H + 20% S) </td>
	<td>175 --- 250 --- 375</td>
	<td>20% --- 40% --- 60%</td>
</tr>
<tr>
	<td><strong>Bow/Xbow Damage</strong></td>
	<td>4x sqrt{Z - 150}</td>
	<td>(20% H + 80% S) </td>
	<td>175 --- 250 --- 375</td>
	<td>20% --- 40% --- 60%</td>
</tr>
<tr>
	<td><strong>Unarmed Damage</strong></td>
	<td>4x sqrt{Z - 110}</td>
	<td>(50% H + 50% S) </td>
	<td>135 --- 210 --- 335</td>
	<td>20 --- 40 --- 60 (no %)</td>
</tr>
<tr>
	<td><strong>Carry Weight</strong></td>
	<td>4x sqrt{Z - 110}</td>
	<td>(80% H + 20% S) </td>
	<td>135 --- 210 --- 335</td>
	<td>20 --- 40 --- 60</td>
</tr>
<tr>
	<td><strong>Poison Resistance</strong></td>
	<td>4x sqrt{Z - 140}</td>
	<td>(60% H +  40% S) </td>
	<td>165 --- 240 --- 365</td>
	<td>20% --- 40% --- 60%</td>
</tr>
<tr>
	<td><strong>Disease Resistance</strong></td>
	<td>4x sqrt{Z - 100}</td>
	<td>(40% H + 60% S) </td>
	<td>125 --- 200 --- 325</td>
	<td>20% --- 40% --- 60%</td>
</tr>
</tbody>
</table>


# Calculator

The Wildlander team have created a calculator to allow you to work out what Attributes you get from the various calculations.

IMPORTANT: use the Make a copy from the file menu to edit your own version!!!!!

[Calculator](https://docs.google.com/spreadsheets/d/10AUNfoiFYwpAHNHgkAmDXLxQdlAVKSJmm5O5fqHXfio/edit#gid=0){: .btn .btn-pink }