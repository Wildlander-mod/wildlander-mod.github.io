---
layout: default
title: Armor
nav_order: 1
description: Armor types, ratings, and effectiveness analysis.
---

What armor is the best? Is a question I get asked a lot. 

The answer to this depends on 3 factors.

### Base Armor

This is the value you see in game is your base armor, and every 10 armor rating is 1% incoming damage negation (up to 80%).

Armor, be it light or heavy, plays a key role in surviving combat. All armors now grant significantly higher armor ratings than in vanilla Skyrim.
Especially heavy armor grants a lot of protection, allowing you to often shrug off several melee attacks and is almost impenetrable for standard arrows, despite Requiem’s high weapon damage.

### Resistances

Weapons are assigned one damage type, and Creatures are Sometimes given extra Damage Type Resistances that function as extra Armor Rating against each damage types. 

Every chest armor has a pre-defined set of resistances against specific weapon types.

|Type |	Default Source |
|--|--|
|Slashing |Sword, War Axe, Greatsword, Battleaxe
|Blunt 	|Mace, Warhammer
|Pierce |Dagger
|Ranged |Bow, Crossbow

Every armor resistance has a tier which assigns bonus armor against that weapons type.

|Tier |Bonus Armor|
|--|--|
|1 |60
|2 |120
|3 |180
|4 |240
|5 |300

If you are debating between armor which has high slash or one which has moderate blunt and slash - ask yourself what weapons your enemies are likely to be carrying. 

### Weight/Mass

Armor weight no longer only eats up a part of your carry weight, it also actively affects your combat performance. 

The more weight your worn equipment has, the more difficult it will become to knock you to the ground, while your own knockdown attacks are more likely to succeed. However, being as massively armored tank also has some disadvantages:
1. Your movement speed reduces proportionally to your armor weight and you make more noises, making sneaking more and more difficult
1. Your spell casting costs increase with the weight of your armor, especially for heavy ones the consequences can be dramatic for the apprentice mage
1. Your falling damage increases with the weight of your armor
1. The stamina costs for normal attacks also increase with the weight of your armor
1. Executing power attacks in heavy armor costs you extra until you have the respective perk

### Armor Spreadsheet

**AR = Armor Resistance** - The resistance rating for each damage type (Ranged, Pierce, Blunt, Slash) on specific armor pieces.

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

function filterArmorTable() {
  const searchTerm = document.getElementById('armorSearch').value.toLowerCase();
  const typeFilter = document.getElementById('armorTypeFilter').value;
  
  const table = document.querySelector('.armor-table table');
  if (!table) {
    console.error('Armor table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  let visibleCount = 0;
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const setName = (cells[1]?.textContent || '').toLowerCase();
    const type = (cells[0]?.textContent || '').trim();
    
    const searchMatch = !searchTerm || setName.includes(searchTerm);
    const typeMatch = !typeFilter || type === typeFilter;
    
    const isVisible = searchMatch && typeMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateArmorFilterCount(visibleCount, rows.length);
}

function updateArmorFilterCount(visible, total) {
  const counter = document.getElementById('armorFilterResultCount');
  if (counter) {
    counter.textContent = `Showing ${visible} of ${total} armor sets`;
  }
}

function clearArmorFilters() {
  document.getElementById('armorSearch').value = '';
  document.getElementById('armorTypeFilter').value = '';
  filterArmorTable();
}

function initArmorFilters() {
  const searchInput = document.getElementById('armorSearch');
  const typeFilter = document.getElementById('armorTypeFilter');
  const clearBtn = document.getElementById('armorClearFilters');
  
  if (!searchInput || !typeFilter || !clearBtn) {
    console.error('Filter elements not found');
    return;
  }
  
  searchInput.addEventListener('keyup', filterArmorTable);
  clearBtn.addEventListener('click', clearArmorFilters);
  
  // Populate Type filter
  const table = document.querySelector('.armor-table table');
  if (!table) {
    console.error('Table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const typeSet = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const type = (cells[0]?.textContent || '').trim();
    if (type) typeSet.add(type);
  });
  
  Array.from(typeSet).sort().forEach(type => {
    const option = document.createElement('option');
    option.value = type;
    option.textContent = type;
    typeFilter.appendChild(option);
  });
  
  typeFilter.addEventListener('change', filterArmorTable);
  
  filterArmorTable();
}

$(document).ready(function(){
  setTimeout(function() {
    initArmorFilters();
  }, 100);
});

</script>

<div class="armor-controls">
  <input type="text" id="armorSearch" placeholder="Search armor sets..." />
  <select id="armorTypeFilter">
    <option value="">All Types</option>
  </select>
  <button id="armorClearFilters" onclick="clearArmorFilters()">Clear Filters</button>
  <div id="armorFilterResultCount" class="filter-result-count-armor"></div>
</div>

<div class="armor-table" markdown="1">

| Type | Set Name | Full Set AR* | Set Wt | Ranged AR | Pierce AR | Blunt AR | Slash AR | Chest AR | Helmet AR | Gloves AR | Boots AR | Shield AR | Ranged Tier | Blunt Tier | Pierce Tier | Slash Tier |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|:---:|:---:|:---:|:---:|
| Heavy | Daedric | 1200 | 100 | 1500 | 1380 | 1200 | 1440 | 600 | 240 | 180.0 | 180.0 | 360 | 5 | 0 | 3 | 4 |
| Heavy | Stalhrim Heavy | 900 | 61 | 1140 | 1020 | 900 | 1080 | 450 | 180 | 135.0 | 135.0 | 0 | 4 | 0 | 2 | 3 |
| Heavy | Aetherium | 900 | 74 | 1140 | 900 | 900 | 1200 | 450 | 180 | 135.0 | 135.0 | 270 | 4 | 0 | 0 | 5 |
| Heavy | Ebony | 900 | 74 | 1140 | 900 | 900 | 1200 | 450 | 180 | 135.0 | 135.0 | 270 | 4 | 0 | 0 | 5 |
| Heavy | Dragonplate | 900 | 64 | 1140 | 900 | 1020 | 1080 | 450 | 180 | 135.0 | 135.0 | 270 | 4 | 2 | 0 | 3 |
| Heavy | Dwarven | 780 | 70 | 960 | 780 | 900 | 960 | 390 | 156 | 117.0 | 117.0 | 234 | 3 | 2 | 0 | 3 |
| Heavy | Nordic | 780 | 60 | 960 | 720 | 900 | 900 | 390 | 156 | 117.0 | 117.0 | 216 | 3 | 2 | 0 | 2 |
| Heavy | Circle | 720 | 50 | 1020 | 720 | 720 | 900 | 360 | 144 | 108.0 | 108.0 | 216 | 5 | 0 | 0 | 3 |
| Heavy | Orcish | 720 | 60 | 900 | 720 | 720 | 1020 | 360 | 144 | 108.0 | 108.0 | 216 | 3 | 0 | 0 | 5 |
| Heavy | Steel Plate | 720 | 60 | 1020 | 720 | 720 | 900 | 360 | 144 | 108.0 | 108.0 | 216 | 5 | 0 | 0 | 3 |
| Heavy | Vigilant | 720 | 60 | 1020 | 720 | 720 | 900 | 360 | 144 | 108.0 | 108.0 | 216 | 5 | 0 | 0 | 3 |
| Heavy | Falmer Hardened/Heavy | 720 | 60 | 900 | 720 | 720 | 1020 | 360 | 144 | 108.0 | 108.0 | 216 | 3 | 0 | 0 | 5 |
| Heavy | Wolf | 720 | 50 | 1020 | 720 | 720 | 900 | 360 | 144 | 108.0 | 108.0 | 216 | 5 | 0 | 0 | 3 |
| Heavy | Ulfrics | 720 | 60 | 900 | 720 | 720 | 840 | 360 | 144 | 108.0 | 108.0 | 216 | 3 | 0 | 0 | 2 |
| Heavy | Iron Guard's | 506 | 40 | 746 | 626 | 506 | 686 | 250 | 102 | 77.0 | 77.0 | 153 | 4 | 0 | 2 | 3 |
| Heavy | Dawnguard | 700 | 55 | 940 | 700 | 760 | 700 | 350 | 140 | 105.0 | 105.0 | 210 | 4 | 1 | 0 | 0 |
| Heavy | Blade | 700 | 50 | 940 | 760 | 700 | 760 | 350 | 140 | 105.0 | 105.0 | 210 | 4 | 0 | 1 | 1 |
| Heavy | Steel | 600 | 50 | 840 | 600 | 600 | 600 | 300 | 120 | 90.0 | 90.0 | 180 | 4 | 0 | 0 | 0 |
| Heavy | Stormcloak Officer | 600 | 51 | 840 | 660 | 600 | 600 | 300 | 120 | 90.0 | 90.0 | 0 | 4 | 0 | 1 | 0 |
| Heavy | Imperial  | 600 | 50 | 840 | 600 | 600 | 600 | 300 | 120 | 90.0 | 90.0 | 180 | 4 | 0 | 0 | 0 |
| Heavy | Chitin  | 600 | 34 | 780 | 720 | 600 | 720 | 300 | 120 | 90.0 | 90.0 | 180 | 3 | 0 | 2 | 2 |
| Heavy | Bonemold | 600 | 51 | 780 | 600 | 600 | 660 | 300 | 120 | 90.0 | 90.0 | 180 | 3 | 0 | 0 | 1 |
| Heavy | Iron | 510 | 40 | 750 | 510 | 510 | 510 | 254 | 102 | 77.0 | 77.0 | 153 | 4 | 0 | 0 | 0 |
| Light | Stahlrim Light | 480 | 27 | 720 | 600 | 480 | 660 | 240 | 96 | 72.0 | 72.0 | 144 | 4 | 0 | 2 | 3 |
| Light | Glass | 480 | 14 | 660 | 480 | 480 | 600 | 240 | 96 | 72.0 | 72.0 | 144 | 3 | 0 | 0 | 2 |
| Light | Dragonscale | 480 | 20 | 720 | 480 | 600 | 660 | 240 | 96 | 72.0 | 72.0 | 144 | 4 | 2 | 0 | 3 |
| Light | Chitin Morag Tong Elite | 435 | 11 | 615 | 435 | 435 | 495 | 211 | 84 | 70.8 | 70.8 | 0 | 3 | 0 | 0 | 1 |
| Light | Elven/Elven Light | 360 | 14 | 480 | 360 | 360 | 540 | 180 | 72 | 54.0 | 54.0 | 108 | 2 | 0 | 0 | 3 |
| Light | Stormcloak | 300 | 14 | 420 | 420 | 300 | 480 | 150 | 60 | 45.0 | 45.0 | 90 | 2 | 0 | 2 | 3 |
| Light | Guard | 300 | 14 | 420 | 420 | 300 | 480 | 150 | 60 | 45.0 | 45.0 | 90 | 2 | 0 | 2 | 3 |
| Light | ChitinLight | 360 | 14 | 540 | 360 | 360 | 420 | 180 | 72 | 54.0 | 54.0 | 108 | 3 | 0 | 0 | 1 |
| Light | Scaled | 360 | 10 | 420 | 540 | 540 | 360 | 180 | 72 | 54.0 | 54.0 | 108 | 1 | 3 | 3 | 0 |
| Light | DawnguardLight | 360 | 14 | 420 | 360 | 420 | 420 | 180 | 72 | 54.0 | 54.0 | 108 | 1 | 1 | 0 | 1 |
| Light | Nightingale | 360 | 10 | 480 | 360 | 360 | 420 | 180 | 72 | 54.0 | 54.0 | 108 | 2 | 0 | 0 | 1 |
| Light | Falmer | 310 | 10 | 490 | 310 | 310 | 310 | 155 | 62 | 46.5 | 46.5 | 93 | 3 | 0 | 0 | 0 |
| Light | Penitus Oculatus | 360 | 12 | 480 | 360 | 540 | 420 | 180 | 72 | 54.0 | 54.0 |  | 2 | 3 | 0 | 1 |
| Light | Ancient Shrouded | 360 | 11 | 420 | 360 | 360 | 420 | 180 | 72 | 54.0 | 54.0 | 108 | 1 | 0 | 0 | 1 |
| Light | Master Thief | 360 | 11 | 420 | 360 | 360 | 420 | 180 | 72 | 54.0 | 54.0 | 108 | 1 | 0 | 0 | 1 |
| Light | Imperial Studded | 350 | 12 | 410 | 350 | 350 | 410 | 175 | 70 | 52.5 | 52.5 | 105 | 1 | 0 | 0 | 1 |
| Light | ImperialLight | 300 | 10 | 360 | 300 | 300 | 360 | 150 | 60 | 45.0 | 45.0 | 90 | 1 | 0 | 0 | 1 |
| Light | Linwe | 300 | 10 | 360 | 300 | 300 | 360 | 150 | 60 | 45.0 | 45.0 | 90 | 1 | 0 | 0 | 1 |
| Light | Leather | 300 | 10 | 360 | 300 | 300 | 360 | 150 | 60 | 45.0 | 45.0 | 90 | 1 | 0 | 0 | 1 |
| Light | Shrouded | 300 | 10 | 360 | 300 | 300 | 360 | 150 | 60 | 45.0 | 45.0 | 90 | 1 | 0 | 0 | 1 |
| Light | Thief | 300 | 10 | 360 | 300 | 300 | 360 | 150 | 60 | 45.0 | 45.0 | 90 | 1 | 0 | 0 | 1 |
| Light | Fur Guard | 290 | 13 | 350 | 410 | 290 | 470 | 150 | 50 | 45.0 | 45.0 | 75 | 1 | 0 | 2 | 3 |
| Light | Forsworn | 250 | 9 | 310 | 250 | 250 | 250 | 124 | 50 | 38.0 | 38.0 | 75 | 1 | 0 | 0 | 0 |
| Light | Fur | 250 | 9 | 310 | 250 | 250 | 250 | 130 | 50 | 38.0 | 38.0 | 75 | 1 | 0 | 0 | 0 |
| Light | Hide | 250 | 9 | 250 | 250 | 250 | 250 | 124 | 50 | 38.0 | 38.0 | 75 | 0 | 0 | 0 | 0 |

</div>
