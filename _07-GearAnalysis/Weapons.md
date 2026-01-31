---
layout: default
title: Weapons
nav_order: 2
description: Weapon types, damage scaling, and comparative analysis.
---

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  initWeaponsFilters();
});

function initWeaponsFilters() {
  document.getElementById('weaponsSearch').addEventListener('keyup', filterWeaponsTable);
  document.getElementById('weaponsClearFilters').addEventListener('click', clearWeaponsFilters);
  filterWeaponsTable();
}

function filterWeaponsTable() {
  const searchTerm = document.getElementById('weaponsSearch').value.toLowerCase();
  
  const table = document.querySelector('.weapons-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const weaponName = cells[0]?.textContent.toLowerCase() || '';
    
    const isVisible = weaponName.includes(searchTerm);
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateWeaponsFilterCount(visibleCount, rows.length);
}

function updateWeaponsFilterCount(visible, total) {
  const counter = document.getElementById('weaponsFilterResultCount');
  if (counter) {
    counter.textContent = `Showing ${visible} of ${total} weapons`;
  }
}

function clearWeaponsFilters() {
  document.getElementById('weaponsSearch').value = '';
  filterWeaponsTable();
}
</script>


<a class="btn btn-pink" href="https://docs.google.com/spreadsheets/d/1Xp1LE79R4uHC2yP7KkA2p1sS-l_TkaRAQfdHV4t0aOM/edit#gid=0" target="_blank" rel="noopener noreferrer">Direct link <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>

Note: Swing speed is defined as the amount of swings the weapon can do in a second,  the higher number the faster the weapon.

<div class="weapons-controls">
  <input type="text" id="weaponsSearch" placeholder="Search weapons by name..." />
  <button id="weaponsClearFilters" onclick="clearWeaponsFilters()">Clear Filters</button>
  <div id="weaponsFilterResultCount" class="filter-result-count-weapons"></div>
</div>

<div class="weapons-table" markdown="1">

FULL Name|Base Damage (excluding perks)|Value|Weight|Swing Speed|Reach|Damage Per Second (Not including Enchants)
--|--|--|--|--|--|--|
Aegisbane|114|60|24|0.6|0.91|68
Aetherial Staff|0|1250|8|1|1.3|0
Akaviri Katana|66|315|10|1|0.7|66
Alessandra's Dagger|24|10|2|1.3|0.49|31
Alik'ri Fishing Rod|24|75|2|1.2|0.7|29
Ancient Nordic Battleaxe|108|35|22|0.7|0.91|76
Ancient Nordic Dagger|30|5|3.5|1.3|0.49|39
Ancient Nordic Greatsword|102|30|18|0.75|0.91|77
Ancient Nordic Hero Battleaxe|126|665|22|0.7|0.91|88
Ancient Nordic Hero Dagger|48|210|2|1.3|0.49|62
Ancient Nordic Hero Greatsword|120|625|18|0.8|0.91|96
Ancient Nordic Hero Heavy Bow|70|635|9|0.3704|1|26
Ancient Nordic Hero Heavy Crossbow|85|750|24|0.4445|1|38
Ancient Nordic Hero Mace|78|390|13|0.8|0.7|62
Ancient Nordic Hero Sword|66|310|11|1|0.7|66
Ancient Nordic Hero War Axe|72|365|13|0.9|0.7|65
Ancient Nordic Hero Warhammer|132|660|24|0.6|0.91|79
Ancient Nordic Honed Battleaxe|126|65|22|0.7|0.91|88
Ancient Nordic Honed Dagger|48|9|3.5|1.3|0.49|62
Ancient Nordic Honed Greatsword|120|60|18|0.8|0.91|96
Ancient Nordic Honed Heavy Bow|60|80|9|0.3704|1|22
Ancient Nordic Honed Mace|78|31|15|0.8|0.7|62
Ancient Nordic Honed Sword|66|30|11|1|0.7|66
Ancient Nordic Honed War Axe|72|35|13|0.9|0.7|65
Ancient Nordic Honed Warhammer|138|76|26|0.6|0.91|83
Ancient Nordic Light Bow|23|45|12|0.4167|1|10
Ancient Nordic Mace|60|17|15|0.8|0.7|48
Ancient Nordic Pickaxe|30|500|10|0.9|0.7|27
Ancient Nordic Sword|48|15|11|1|0.7|48
Ancient Nordic Sword - Ceremonial|48|35|11|1|0.7|48
Ancient Nordic War Axe|54|20|13|0.9|0.7|49
Ancient Nordic War Axe - Ceremonial|54|45|13|0.9|0.7|49
Ancient Nordic Warhammer|114|42|26|0.6|0.91|68
Angi's Light Bow|20|50|5|0.4167|1|8
Argonian Fishing Rod|24|55|3.5|1.2|0.7|29
Auriel's Bow|80|25000|7|0.4167|1|33
Auriel's Bow Replica|320|490|7|0.3704|1|119
Axe of Eastmarch|21|600|22|0.7|1.3|15
Axe of Hjaalmarch|21|600|22|0.7|1.3|15
Axe of Whiterun|12|330|13|0.9|1|11
Axe of Winterhold|12|330|13|0.9|1|11
Balgruuf's Greatsword|102|90|17|0.75|0.91|77
Blade of Falkreath|20|540|18|0.8|1.3|16
Blade of Haafingar|11|270|11|1|1|11
Blade of Markarth|11|270|11|1|1|11
Blade of Sacrifice|60|720|5|1.3|0.49|78
Blade of Sacrifice Replica|60|290|5|1.3|0.49|78
Blade of the Pale|20|540|18|0.8|1.3|16
Blade of the Rift|11|270|11|1|1|11
Blade of the Rourken|132|2500|15|0.7|0.91|92
Blade of Woe|72|500|3|1.3|0.49|94
Blade of Woe Awakened|78|2500|3|1.3|0.49|101
Blade of Woe Replica|72|290|3|1.3|0.49|94
Bloodscythe|78|1800|13|1|0.7|78
Bloodskal Blade|126|2250|16|0.8|0.91|101
Bloodskal Blade Replica|126|1250|16|0.8|0.91|101
Bloodthorn|30|18|2.5|1.3|0.49|39
Bolar's Oathblade|66|360|10|1|0.7|66
Bone Divining Knife|6|1|0.25|1.3|0.49|8
Bone Hunting Knife|6|2|0.5|1.3|0.49|8
Bone Masterwork Sword|54|110|10|1|0.7|54
Bone Masterwork War Axe|78|200|12|0.7|0.7|55
Bone Staff|0|35|8|1|1.3|0
Bone Sword|30|17|10|1|0.7|30
Bone War Axe|48|30|10|0.9|0.7|43
Borvir's Dagger|36|55|1.5|1.3|0.49|47
Bouncer|72|1000|16|0.8|0.7|58
Bound Adept Hunting Knife|42|0|0|1.3|0.49|55
Bound Apprentice Hunting Knife|30|0|0|1.3|0.49|39
Bound Battleaxe|114|0|0|0.7|0.91|80
Bound Dagger|36|0|0|1.3|0.49|47
Bound Expert Hunting Knife|66|0|0|1.3|0.49|86
Bound Heavy Bow|75|0|0|0.3704|1|28
Bound Master Hunting Knife|60|0|0|1.3|0.49|78
Bound Mystic Battleaxe|144|0|0|0.7|0.91|101
Bound Mystic Bow|105|0|0|0.3704|1|39
Bound Mystic Dagger|60|0|0|1.3|0.49|78
Bound Mystic Sword|84|0|0|1|0.7|84
Bound Novice Hunting Knife|24|0|0|1.3|0.49|31
Bound Sword|54|0|0|1|0.7|54
Bow of the Hunt|10|175|7|0.9375|1|9
Champion's Cudgel|144|1100|27|0.6|0.91|86
Champion's Cudgel Replica|144|1100|27|0.6|0.91|86
Chillrend|78|5000|8|1|0.7|78
Chillrend Replica|78|450|8|1|0.7|78
Daedric Battleaxe|150|10000|28|0.7|0.91|105
Daedric Battlestaff|138|9250|40|0.9|1.05|124
Daedric Dagger|72|1800|6|1.3|0.49|94
Daedric Greatsword|144|9000|24|0.75|0.91|108
Daedric Heavy Bow|100|9000|21|0.3704|1|37
Daedric Heavy Crossbow|120|13500|31.5|0.4445|1|53
Daedric Hunting Knife|66|4500|10|1.3|0.49|86
Daedric Mace|102|6500|21|0.8|0.7|82
Daedric Sword|90|4500|17|1|0.7|90
Daedric War Axe|96|5500|19|0.9|0.7|86
Daedric Warhammer|162|11000|32|0.6|0.91|97
Dark Brotherhood Heavy Crossbow|100|1650|16|0.4445|1|44
Dawnbreaker|78|78500|10|1|0.7|78
Dawnbreaker Replica|78|500|10|1|0.7|78
Dawnguard Improved Light Crossbow|78|500|12|0.5333|1|42
Dawnguard Light Crossbow|60|300|12|0.5333|1|32
Dawnguard Rune War Axe|78|3300|13|0.9|0.7|70
Dawnguard Rune War Axe Replica|78|175|13|0.9|0.7|70
Dawnguard Rune Warhammer|144|6600|26|0.6|0.91|86
Dawnguard Rune Warhammer Replica|132|350|26|0.6|0.91|79
Dawnguard War Axe|66|330|13|0.9|0.7|59
Dawnguard Warhammer|132|660|26|0.6|0.91|79
Dragon Priest Dagger|36|9|5|1.3|0.49|47
Dragonbane|84|5000|14|1|0.7|84
Dragonbone Battleaxe|144|8000|27|0.7|0.91|101
Dragonbone Dagger|66|1440|5.5|1.3|0.49|86
Dragonbone Greatsword|138|7200|23|0.75|0.91|104
Dragonbone Heavy Bow|90|7000|20|0.3704|1|33
Dragonbone Heavy Crossbow|108|10500|30|0.4445|1|48
Dragonbone Hunting Knife|60|450|5|1.3|0.49|78
Dragonbone Mace|96|5200|20|0.8|0.7|77
Dragonbone Sword|84|3600|16|1|0.7|84
Dragonbone War Axe|90|4400|18|0.9|0.7|81
Dragonbone Warhammer|156|8800|31|0.6|0.91|94
Dravin's Light Bow|20|50|5|0.4167|1|8
Dwarven Battleaxe|126|500|25|0.7|0.91|88
Dwarven Dagger|48|90|4.5|1.3|0.49|62
Dwarven Fishing Rod|30|110|6|1|0.7|30
Dwarven Greatsword|120|450|21|0.75|0.91|90
Dwarven Heavy Black Bow of Fate|80|2950|9|0.4167|1|33
Dwarven Heavy Bow|60|270|9|0.3704|1|22
Dwarven Heavy Crossbow|72|300|13.5|0.4445|1|32
Dwarven Hunting Knife|30|27|2.5|1.3|0.49|39
Dwarven Improved Light Crossbow|90|1000|16|0.5333|1|48
Dwarven Mace|78|325|18|0.8|0.7|62
Dwarven Masterwork Light Crossbow|108|1500|16|0.5333|1|58
Dwarven Sword|66|225|14|1|0.7|66
Dwarven War Axe|72|275|16|0.9|0.7|65
Dwarven Warhammer|138|550|29|0.6|0.91|83
Ebony Battleaxe|138|4000|26|0.7|0.91|97
Ebony Battlestaff|108|2800|20|0.9|1.05|97
Ebony Blade|132|96000|19|0.75|0.91|99
Ebony Blade Replica|132|1520|19|0.75|0.91|99
Ebony Dagger|60|720|5|1.3|0.49|78
Ebony Greatsword|132|3600|22|0.75|0.91|99
Ebony Heavy Bow|75|2950|16|0.3704|1|28
Ebony Heavy Crossbow|90|4425|24|0.4445|1|40
Ebony Hunting Knife|54|800|4.5|1.3|0.49|70
Ebony Mace|90|2600|19|0.8|0.7|72
Ebony Sword|78|1800|15|1|0.7|78
Ebony War Axe|84|2200|17|0.9|0.7|76
Ebony Warhammer|150|4400|30|0.6|0.91|90
Eduj|66|270|11|1|0.7|66
Elven Battleaxe|114|300|19|0.7|0.91|80
Elven Dagger|36|55|1.5|1.3|0.49|47
Elven Greatsword|108|270|15|0.75|0.91|81
Elven Hunting Knife|36|63|1|1.3|0.49|47
Elven Light Bow|28|470|7|0.4167|1|12
Elven Light Crossbow|33|705|10.5|0.5333|1|18
Elven Mace|66|195|12|0.8|0.7|53
Elven Sword|54|135|8|1|0.7|54
Elven War Axe|60|165|10|0.9|0.7|54
Elven Warhammer|126|330|23|0.6|0.91|76
Falmer Heavy Bow|45|15|8|0.3704|1|17
Falmer Honed Light Bow|30|25|10|0.4167|1.3|13
Falmer Honed Sword|60|25|10|1|0.7|60
Falmer Honed War Axe|66|30|12|0.9|0.7|59
Falmer Sword|42|10|10|1|0.7|42
Falmer War Axe|48|15|12|0.9|0.7|43
Fang of Haynekhtnamet|66|2000|5.5|1.3|0.49|86
Firiniel's End|52|500|12|0.3704|1|19
Forsworn Light Bow|25|120|11|0.4167|1|10
Forsworn Sword|36|10|8|1|0.7|36
Forsworn War Axe|42|10|10|0.9|0.7|38
Froki's Heavy Bow|24|150|5|0.3704|1|9
Gauldur Blackblade|66|30|11|1|0.7|66
Gauldur Blackbow|30|1800|18|0.3704|1|11
Gauldur Heavy Blackbow|60|1800|18|0.3704|1|22
General Tullius' Sword|78|1800|15|1|0.7|78
Ghostblade|66|300|0|1|0.7|66
Giant Club|30|1|18|0.6|0.91|18
Giant Club|480|1|18|0.6|0.91|288
Glass Battleaxe|132|2500|18|0.7|0.91|92
Glass Battlestaff|84|1900|14|0.9|1.05|76
Glass Dagger|54|450|1|1.3|0.49|70
Glass Greatsword|126|2250|14|0.75|0.91|95
Glass Hunting Knife|48|675|1.5|1.3|0.49|62
Glass Light Bow|33|1900|8|0.4167|1|14
Glass Light Bow of the Stag Prince|33|1900|9|0.4167|1|14
Glass Light Crossbow|39|2850|12|0.5333|1|21
Glass Mace|84|1625|11|0.8|0.7|67
Glass Sword|72|1125|7|1|0.7|72
Glass War Axe|78|1375|9|0.9|0.7|70
Glass Warhammer|144|2750|22|0.6|0.91|86
Gorak's Troll Gutting Knife|60|1000|13|1|0.7|60
Greatsword of Soulreaping|20|60|18|0.8|1.3|16
Grimsever|126|2250|14|0.75|0.91|95
Harkon's Sword|102|7500|7|0.875|0.735|89
Harkon's Sword Replica|102|750|7|0.875|0.735|89
Harrald's Steel Sword|48|45|10|1|0.7|48
Heavy Bow of Soulreaping|60|235|9|0.3704|1|22
Hoarfrost|30|500|10|0.9|0.7|27
Honorblade of Whiterun|72|1000|10|1|0.7|72
Horksbane|10|250|14|0.8|1|8
Imperial Dagger|30|25|2.5|1.3|0.49|39
Imperial Heavy Bow|50|90|8|0.3704|1|19
Imperial Heavy Crossbow|60|145|12|0.4445|1|27
Imperial Mace|60|85|14|0.8|0.7|48
Imperial Shortsword|42|60|9|1.15|0.63|48
Imperial Sword|48|60|10|1|0.7|48
Irkngthand War Axe|84|2200|16|0.9|0.7|76
Iron Battleaxe|102|55|20|0.7|0.91|71
Iron Battlestaff|48|50|12|0.9|1.05|43
Iron Dagger|24|10|2|1.3|0.49|31
Iron Fork|6|1|0.2|1.3|0.49|8
Iron Greatsword|96|50|16|0.75|0.91|72
Iron Headsman's Axe|102|100|18|0.7|1.05|71
Iron Heavy Crossbow|48|90|9|0.4445|1|21
Iron Hunting Knife|18|9|1.5|1.3|0.49|23
Iron Knife|12|1|0.2|1.3|0.49|16
Iron Mace|54|35|13|0.8|0.7|43
Iron Pickaxe|30|35|9|0.9|0.7|27
Iron Shiv|30|5|1|1.3|0.49|39
Iron Sword|42|25|9|1|0.7|42
Iron War Axe|48|30|11|0.9|0.7|43
Iron Warhammer|114|60|24|0.6|0.91|68
Iron Woodcutter's Axe|36|15|10|0.9|0.7|32
Jon's Heavy Crossbow|60|200|14|0.4445|1|27
Jon's Twohander|96|50|16|0.75|0.91|72
Kahvozein's Fang|36|9|5|1.3|0.49|47
Karliah's Heavy Bow|75|5|12|0.3704|1|28
Keening|84|96500|7|1.3|0.49|109
Keening Replica|84|95|7|1.3|0.49|109
Mace of Molag Bal|102|50000|23|0.8|0.7|82
Mace of Molag Bal Replica|102|2000|23|0.8|0.7|82
Mammoth Bone Club|108|45|25|0.6|0.91|65
Mammoth Bone Masterwork Club|126|270|25|0.6|0.91|76
Mehrunes' Razor|72|80000|6|1.3|0.49|94
Mehrunes' Razor Replica|72|600|6|1.3|0.49|94
Miraak's Staff|0|850|8|1|1.3|0
Miraak's Sword|90|9000|15|1|0.7|90
Miraak's Sword Replica|90|1250|15|1|0.7|90
Mournbringer|126|2500|15|0.7|0.91|88
Necromantic Staff|17|5|8|1|1.3|17
Nettlebane|60|2000|5|1.3|0.49|78
Nightingale Blade|84|1250|11|1|0.7|84
Nightingale Bow|75|2500|12|0.3704|1|28
Nordic Battleaxe|126|650|23|0.7|0.91|88
Nordic Dagger|48|115|3.5|1.3|0.49|62
Nordic Greatsword|120|585|19|0.75|0.91|90
Nordic Heavy Bow|70|580|11|0.3704|1|26
Nordic Heavy Crossbow|84|850|11|0.4445|1|37
Nordic Mace|78|410|16|0.8|0.7|62
Nordic Sword|66|290|12|1|0.7|66
Nordic War Axe|72|350|14|0.9|0.7|65
Nordic Warhammer|138|700|27|0.6|0.91|83
Notched Pickaxe|30|150|10|1.3|0.49|39
Okin|72|330|13|0.9|0.7|65
Orcish Battleaxe|120|400|23|0.7|0.91|84
Orcish Dagger|42|70|3.5|1.3|0.49|55
Orcish Greatsword|114|360|19|0.75|0.91|86
Orcish Heavy Bow|65|300|10|0.3704|1|24
Orcish Heavy Crossbow|78|350|15|0.4445|1|35
Orcish Hunting Knife|42|86|3.5|1.3|0.49|55
Orcish Mace|72|260|16|0.8|0.7|58
Orcish Sword|60|180|12|1|0.7|60
Orcish War Axe|66|220|14|0.9|0.7|59
Orcish Warhammer|132|440|27|0.6|0.91|79
Phantom Sword|6|0|0|1|0.7|6
Poacher's Axe|36|15|10|0.9|0.7|32
Queen Freydis' Sword|48|45|10|1|0.7|48
Ragnok's Toothpick|48|45|10|1|0.7|48
Red Eagle's Bane|66|1000|9|1.075|0.7525|71
Red Eagle's Fury|54|500|10|1.05|0.735|57
Rocksplinter|30|35|10|1.3|0.49|39
Rueful Axe|150|15000|23|0.7|0.91|105
Rueful Axe Replica|150|720|23|0.7|0.91|105
Rundi's Dagger|30|18|2.5|1.3|0.49|39
Sanguine Rose|0|25000|10|1|1.3|0
Shardsword|78|1000|10|1|0.7|78
Sild's Staff|17|5|8|1|1.3|17
Silver Battlestaff|60|120|12|0.9|1.05|54
Silver Greatsword|102|260|15|0.75|0.91|77
Silver Sword|48|160|8|1|0.7|48
Skull of Corruption|2|87000|10|1|1.3|2
Skyforge Steel Battleaxe|126|700|21|0.7|0.91|88
Skyforge Steel Dagger|48|125|2.5|1.3|0.49|62
Skyforge Steel Dagger|48|125|2.5|1.3|0.49|62
Skyforge Steel Greatsword|120|630|17|0.75|0.91|90
Skyforge Steel Heavy Bow|70|705|8|0.3704|1|26
Skyforge Steel Mace|78|450|14|0.8|0.7|62
Skyforge Steel Sword|66|315|10|1|0.7|66
Skyforge Steel War Axe|72|385|12|0.9|0.7|65
Skyforge Steel Warhammer|138|745|25|0.6|0.91|83
Soulrender|78|1000|13|1|0.7|78
Spider Control Rod|1|25|8|1|1.3|1
Stalhrim Battleaxe|138|6000|25|0.7|0.91|97
Stalhrim Battlestaff|90|2800|19|0.9|1.05|81
Stalhrim Dagger|60|1080|4.5|1.3|0.49|78
Stalhrim Greatsword|132|5400|21|0.75|0.91|99
Stalhrim Heavy Crossbow|95|5525|23|0.4445|1|42
Stalhrim Light Bow|38|4800|8|0.4167|1|16
Stalhrim Mace|90|3900|18|0.8|0.7|72
Stalhrim Sword|78|2700|14|1|0.7|78
Stalhrim War Axe|84|3300|16|0.9|0.7|76
Stalhrim Warhammer|150|4500|26|0.6|0.91|90
Steel Battleaxe|108|100|21|0.7|0.91|76
Steel Battlestaff|60|90|13|0.9|1.05|54
Steel Crossbow of Banishing|60|200|12|0.4445|1|27
Steel Dagger|30|18|2.5|1.3|0.49|39
Steel Greatsword|102|90|17|0.75|0.91|77
Steel Heavy Crossbow|60|135|12|0.4445|1|27
Steel Hunting Knife|24|16|2|1.3|0.49|31
Steel Mace|60|65|14|0.8|0.7|48
Steel Scimitar|66|90|10|1.05|0.49|69
Steel Sword|48|45|10|1|0.7|48
Steel War Axe|54|55|12|0.9|0.7|49
Steel Warhammer|120|110|25|0.6|0.91|72
Stone Hatchet|30|10|7|0.9|0.7|27
Stone Hunting Knife|12|4|1.5|1.3|0.49|16
Stormcloak Heavy Crossbow|60|145|12|0.4445|1|27
Stormfang|102|500|17|0.8|0.91|82
Sword of Soulreaping|11|30|11|1|1|11
The Longhammer|126|90|18|0.8|0.91|101
The Pale Blade|72|425|11|1|0.7|72
The Warhammer of Inebriation|138|700|27|0.6|0.91|83
The Woodsman's Friend|102|55|20|0.7|0.91|71
Thieves Guild Light Crossbow|32|350|11|0.4445|1|14
Trollsbane|120|110|25|0.6|0.91|72
Tsun's Battleaxe|144|2000|28|0.7|0.91|101
Tsun's Battleaxe|120|500|24|0.7|0.91|84
Tsun's Battleaxe|156|3000|30|0.7|0.91|109
Tsun's Battleaxe|132|1000|32|0.7|0.91|92
Tyranus' Greatsword|17|180|15|0.75|1.3|13
Unenchanted Forsworn Staff|0|500|8|1|1.3|0
Unenchanted Staff of Alteration|0|500|8|1|1.3|0
Unenchanted Staff of Conjuration|0|500|8|1|1.3|0
Unenchanted Staff of Destruction|0|500|8|1|1.3|0
Unenchanted Staff of Illusion|0|500|8|1|1.3|0
Unenchanted Staff of Restoration|0|500|8|1|1.3|0
Valdr's Lucky Dagger|30|25|2.5|1.3|0.49|39
Volendrung|162|75000|37|0.6|0.91|97
Volendrung Replica|162|4275|37|0.6|0.91|97
Wabbajack|27|96640|10|1|1.3|27
War Axe of Soulreaping|12|35|13|0.9|1|11
Windshear|66|305|11|1|0.7|66
Wooden Battlestaff|36|30|7|0.9|1.05|32
Wooden Fishing Rod|18|10|3|1.2|0.7|22
Wooden Heavy Bow|40|60|6|0.3704|1|15
Wooden Light Bow|20|50|5|0.4167|1|8
Wooden Light Bow|20|50|5|0.4167|1|8
Wooden Light Crossbow|21|75|7.5|0.5333|1|11
Wooden Sword|12|10|3|1|0.7|12
Wuuthrad|150|15269|25|0.7|0.91|105
Wuuthrad Replica|138|1585|26|0.7|0.91|97
Zephyr|60|550|10|0.48152|1|29
</div>