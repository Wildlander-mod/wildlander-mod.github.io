---
title: Sharpening Wheel
layout: default
nav_order: 5
has_children: false
description: Sharpening wheel crafting and mechanics.
---

## Weapon Maintenance and Repair

The sharpening wheel allows you to maintain and repair your weapons. Use a **Sharpening Wheel** workstation to access these recipes.

**Available crafting includes:**
- Weapon sharpening for enhanced damage
- Broken weapon repairs
- Blade maintenance

**Tip:** Regular weapon maintenance is essential in Requiem to keep your combat effectiveness high as you progress.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/_10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- Quantity produced per craft
- Perks and toolkit requirements
- Crafting location
- Complete list of materials needed
- Any additional requirements

Use the search bar and filters below to find specific sharpening wheel recipes by toolkit or perks needed.

---

## Sharpening Wheel Recipes Data

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initSharpeningWheeltooltips() {
  const table = document.querySelector('.sharpening-wheel-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showSharpeningWheeltooltip(e, row));
    itemCell.addEventListener('mousemove', updateSharpeningWheeltooltipPosition);
    itemCell.addEventListener('mouseleave', hideSharpeningWheeltooltip);
  });
}

function showSharpeningWheeltooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    qtyMade: cells[1]?.textContent || '',
    perksNeeded: cells[2]?.textContent || '',
    toolkitsRequired: cells[3]?.textContent || '',
    proximity: cells[4]?.textContent || '',
    itemsRequired: cells[5]?.textContent || '',
    additionalRequirements: cells[6]?.textContent || ''
  };
  
  let tooltip = document.getElementById('sharpening-wheel-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'sharpening-wheel-tooltip';
    tooltip.className = 'sharpening-wheel-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Qty Made:</strong> ${data.qtyMade}</div>
    <div><strong>Perks Needed:</strong> ${data.perksNeeded}</div>
    <div><strong>Toolkits Required:</strong> ${data.toolkitsRequired}</div>
    <div><strong>Proximity:</strong> ${data.proximity}</div>
    <div><strong>Items Required:</strong> ${data.itemsRequired}</div>
    <div><strong>Additional Requirements:</strong> ${data.additionalRequirements}</div>
  `;
  tooltip.style.display = 'block';
  updateSharpeningWheeltooltipPosition(event);
}

function updateSharpeningWheeltooltipPosition(event) {
  const tooltip = document.getElementById('sharpening-wheel-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideSharpeningWheeltooltip() {
  const tooltip = document.getElementById('sharpening-wheel-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initSharpeningWheelFilters() {
  const table = document.querySelector('.sharpening-wheel-recipes-table table');
  if (!table) {
    console.warn('Sharpening Wheel Recipes table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const toolkits = new Set();
  const perks = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 4) {
      const toolkitText = cells[3].textContent.trim();
      const perksText = cells[2].textContent.trim();
      
      if (toolkitText && toolkitText !== '') {
        toolkitText.split(',').forEach(toolkit => {
          const trimmed = toolkit.trim();
          if (trimmed) toolkits.add(trimmed);
        });
      }
      if (perksText && perksText !== '') {
        perksText.split(',').forEach(perk => {
          const trimmed = perk.trim();
          if (trimmed) perks.add(trimmed);
        });
      }
    }
  });
  
  const toolkitFilter = document.getElementById('sharpeningWheelToolkitFilter');
  const perksFilter = document.getElementById('sharpeningWheelPerksFilter');
  
  Array.from(toolkits).sort().forEach(toolkit => {
    const option = document.createElement('option');
    option.value = toolkit;
    option.textContent = toolkit;
    toolkitFilter.appendChild(option);
  });
  
  Array.from(perks).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perksFilter.appendChild(option);
  });
  
  document.getElementById('sharpeningWheelSearch').addEventListener('input', filterSharpeningWheelRecipes);
  document.getElementById('sharpeningWheelToolkitFilter').addEventListener('change', filterSharpeningWheelRecipes);
  document.getElementById('sharpeningWheelPerksFilter').addEventListener('change', filterSharpeningWheelRecipes);
  initSharpeningWheeltooltips();
  updateFilterCountSharpeningWheel();
}

function filterSharpeningWheelRecipes() {
  const searchTerm = document.getElementById('sharpeningWheelSearch').value.toLowerCase();
  const toolkitFilter = document.getElementById('sharpeningWheelToolkitFilter').value;
  const perksFilter = document.getElementById('sharpeningWheelPerksFilter').value;
  
  const table = document.querySelector('.sharpening-wheel-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[5]?.textContent.toLowerCase() || '';
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const toolkitCellText = cells[3]?.textContent.trim() || '';
    const toolkitList = toolkitCellText.split(',').map(t => t.trim());
    const toolkitMatch = !toolkitFilter || toolkitList.includes(toolkitFilter);
    const perksCellText = cells[2]?.textContent.trim() || '';
    const perksList = perksCellText.split(',').map(p => p.trim());
    const perksMatch = !perksFilter || perksList.includes(perksFilter);
    
    const isVisible = searchMatch && toolkitMatch && perksMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountSharpeningWheel();
  initSharpeningWheeltooltips();
}

function updateFilterCountSharpeningWheel() {
  const table = document.querySelector('.sharpening-wheel-recipes-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountSharpeningWheel');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearSharpeningWheelFilters() {
  document.getElementById('sharpeningWheelSearch').value = '';
  document.getElementById('sharpeningWheelToolkitFilter').value = '';
  document.getElementById('sharpeningWheelPerksFilter').value = '';
  filterSharpeningWheelRecipes();
}

initSharpeningWheelFilters();

});
</script>

<div class="sharpening-wheel-recipes-controls">
  <input type="text" id="sharpeningWheelSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="sharpeningWheelToolkitFilter">
    <option value="">All Toolkits</option>
  </select>
  <select id="sharpeningWheelPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersSharpeningWheel" onclick="clearSharpeningWheelFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-sharpening-wheel" id="filterResultCountSharpeningWheel"></div>

<div class="sharpening-wheel-recipes-table" markdown="1">

| Produced Item Name | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---|:---|:---|:---|
| Aegisbane |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Akaviri Katana |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Battleaxe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ancient Nordic Dagger |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Ancient Nordic Greatsword |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ancient Nordic Hero Battleaxe |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Dagger |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Greatsword |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Heavy Bow |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum 2 Hide Lace |  |
| Ancient Nordic Hero Heavy Crossbow |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Mace |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Sword |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Hero War Axe |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Warhammer |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Battleaxe |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Dagger |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Ancient Nordic Honed Greatsword |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Mace |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Ancient Nordic Honed Sword |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Warhammer |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Ancient Nordic Light Bow |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ancient Nordic Mace |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Ancient Nordic Pickaxe |  | Advanced Blacksmithing |  |  | 1 Ingot: Iron |  |
| Ancient Nordic Sword |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ancient Nordic Sword - Ceremonial |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ancient Nordic War Axe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ancient Nordic War Axe - Ceremonial |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ancient Nordic Warhammer |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Angi's Light Bow |  | Craftsmanship |  |  | 1 Ingot: Steel 2 Hide Lace |  |
| Auriel's Bow |  | Legendary Blacksmithing |  |  | 1 Ingot: Moonstone 2 Hide Lace |  |
| Auriel's Bow Replica |  | Elven Blacksmithing |  |  | 1 Ingot: Moonstone |  |
| Blade of Sacrifice |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Blade of Sacrifice Replica |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Blade of the Rourken |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Blade of Woe |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Blade of Woe Awakened |  | Advanced Blacksmithing |  |  | 1 Ingot: Steel |  |
| Blade of Woe Replica |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Bloodscythe |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Bloodskal Blade |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Bloodskal Blade Replica |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Bloodthorn |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Bolar's Oathblade |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Bone Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Animal Bone (Large) |  |
| Bouncer |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Bow of the Hunt |  | Craftsmanship |  |  | 1 Ingot: Steel 2 Hide Lace |  |
| Champion's Cudgel |  | Advanced Blacksmithing |  |  | 1 Ingot: Steel |  |
| Champion's Cudgel Replica |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Chillrend |  | Glass Blacksmithing |  |  | 1 Frost Salts |  |
| Chillrend Replica |  | Advanced Blacksmithing |  |  | 1 Frost Salts |  |
| Daedric Battleaxe |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric Battlestaff |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric Dagger |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric Greatsword |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric Heavy Bow |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric Heavy Crossbow |  | Daedric Smithing |  |  | 1 Ingot: Ebony 2 Silk Thread |  |
| Daedric Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Daedric Mace |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric Sword |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric War Axe |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Daedric Warhammer |  | Daedric Smithing |  |  | 1 Daedra Heart |  |
| Dark Brotherhood Heavy Crossbow |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Dawnbreaker |  | Legendary Blacksmithing |  |  | 1 Ingot: Silver |  |
| Dawnbreaker Replica |  | Advanced Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Dawnguard Improved Light Crossbow |  | Craftsmanship |  |  | 1 Ingot: Steel 2 Hide Lace | Read Improved Crossbow Schematic |
| Dawnguard Light Crossbow |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Dawnguard Rune War Axe |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Dawnguard Rune War Axe Replica |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Dawnguard Rune Warhammer |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Dawnguard Rune Warhammer Replica |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Dawnguard War Axe |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Dawnguard Warhammer |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Dragon Priest Dagger |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Dragonbane |  | Craftsmanship |  |  | 1 Ingot: Corundum |  |
| Dragonbone Battleaxe |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Dragonbone Dagger |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Dragonbone Greatsword |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Dragonbone Heavy Bow |  | Draconic Blacksmithing |  |  | 1 Dragon Bone 2 Hide Lace |  |
| Dragonbone Heavy Crossbow |  | Draconic Blacksmithing |  |  | 1 Dragon Bone 2 Hide Lace |  |
| Dragonbone Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Dragon Bone |  |
| Dragonbone Mace |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Dragonbone Sword |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Dragonbone War Axe |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Dragonbone Warhammer |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Dwarven Battleaxe |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Dwarven Dagger |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Dwarven Greatsword |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Dwarven Heavy Black Bow of Fate |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony 2 Hide Lace |  |
| Dwarven Heavy Bow |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Dwarven Improved Light Crossbow |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Mace |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Dwarven Masterwork Light Crossbow |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Sword |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Dwarven War Axe |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Dwarven Warhammer |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Ebony Battleaxe |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Battlestaff |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Blade |  | Legendary Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Blade Replica |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Dagger |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Greatsword |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Heavy Bow |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Heavy Crossbow |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Mace |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Sword |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony War Axe |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ebony Warhammer |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Eduj |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Elven Battleaxe |  | Elven Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Elven Dagger |  | Elven Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Elven Greatsword |  | Elven Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Elven Light Bow |  | Elven Blacksmithing |  |  | 2 Hide Lace 1 Ingot: Calcinium |  |
| Elven Light Crossbow |  | Elven Blacksmithing |  |  | 1 Ingot: Moonstone 1 Hide Lace |  |
| Elven Mace |  | Elven Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Elven Sword |  | Elven Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Elven War Axe |  | Elven Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Elven Warhammer |  | Elven Blacksmithing |  |  | 1 Ingot: Calcinium |  |
| Falmer Heavy Bow |  | Craftsmanship |  |  | 1 Chaurus Chitin 2 Hide Lace |  |
| Falmer Honed Light Bow |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Falmer Honed Light Bow |  | Advanced Blacksmithing |  |  | 1 Chaurus Chitin |  |
| Falmer Honed Sword |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Falmer Honed War Axe |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Falmer Sword |  | Craftsmanship |  |  | 1 Chaurus Chitin |  |
| Falmer War Axe |  | Craftsmanship |  |  | 1 Chaurus Chitin |  |
| Fang of Haynekhtnamet |  | Draconic Blacksmithing |  |  | 1 Dragon Bone |  |
| Firiniel's End |  | Elven Blacksmithing |  |  | 1 Hide Lace 1 Ingot: Calcinium |  |
| Forsworn Light Bow |  | Craftsmanship |  |  | 1 Ingot: Steel 2 Hide Lace |  |
| Forsworn Sword |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Forsworn War Axe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Forsworn War Axe |  | Advanced Blacksmithing |  |  | 1 Quarried Stone |  |
| Froki's Heavy Bow |  | Craftsmanship |  |  | 1 Wood 2 Hide Lace |  |
| Gauldur Blackblade |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Gauldur Heavy Blackbow |  | Craftsmanship |  |  | 1 Ingot: Steel 2 Hide Lace |  |
| General Tullius' Sword |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Ghostblade |  | Arcane Craftsmanship |  |  | 1 Ectoplasm |  |
| Glass Battleaxe |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass Battlestaff |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass Dagger |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass Greatsword |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass Light Bow |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Bow of the Stag Prince |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Crossbow |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Mace |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass Sword |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass War Axe |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Glass Warhammer |  | Glass Blacksmithing |  |  | 1 Ingot: Malachite |  |
| Gorak's Troll Gutting Knife |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Harkon's Sword |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Harkon's Sword Replica |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Hoarfrost |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Honorblade of Whiterun |  | Advanced Blacksmithing |  |  | 1 Ingot: Steel |  |
| Horksbane |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Imperial Heavy Bow |  | Craftsmanship |  |  | 1 Ingot: Steel 2 Hide Lace |  |
| Imperial Heavy Crossbow |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Imperial Sword |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Irkngthand War Axe |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Iron Battleaxe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Battlestaff |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Dagger |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Greatsword |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Headsman's Axe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Heavy Crossbow |  | Craftsmanship |  |  | 1 Ingot: Iron 2 Hide Lace |  |
| Iron Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Iron |  |
| Iron Mace |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Pickaxe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Shiv |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Sword |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron War Axe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Iron Warhammer |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Jon's Heavy Crossbow |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Jon's Twohander |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Kahvozein's Fang |  | Advanced Blacksmithing |  |  | 1 Ingot: Steel |  |
| Keening |  | Legendary Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Keening Replica |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven |  |
| Mace of Molag Bal |  | Legendary Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Mace of Molag Bal Replica |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Mehrunes' Razor |  | Legendary Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Mehrunes' Razor Replica |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Miraak's Sword |  | Legendary Blacksmithing |  |  | 1 Daedra Heart 1 Ingot: Ebony |  |
| Miraak's Sword Replica |  | Legendary Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Mournbringer |  | Advanced Blacksmithing |  |  | 1 Ingot: Silver |  |
| Nettlebane |  | Ebony Blacksmithing |  |  | 1 Spriggan Sap |  |
| Nightingale Blade |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Nightingale Blade |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Nightingale Bow |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Nightingale Bow |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony 2 Hide Lace |  |
| Nordic Battleaxe |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Nordic Dagger |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Nordic Greatsword |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Nordic Heavy Bow |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Nordic Heavy Crossbow |  | Nordic Blacksmithing |  |  | 1 Ingot: Quicksilver 1 Hide Lace |  |
| Nordic Mace |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Nordic Sword |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Nordic War Axe |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Nordic Warhammer |  | Nordic Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Notched Pickaxe |  | Craftsmanship |  |  | 1 Gem: Diamond |  |
| Okin |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Orcish Battleaxe |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Orcish Dagger |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Orcish Greatsword |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Orcish Heavy Bow |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Orcish Mace |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Orcish Sword |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Orcish War Axe |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Orcish Warhammer |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| Poacher's Axe |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Ragnok's Toothpick |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Red Eagle's Bane |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Red Eagle's Fury |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Rocksplinter |  | Advanced Blacksmithing |  |  | 1 Ingot: Iron |  |
| Rueful Axe |  | Legendary Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Rueful Axe Replica |  | Advanced Blacksmithing |  |  | 1 Ingot: Steel |  |
| Shardsword |  | Advanced Blacksmithing |  |  | 1 Ingot: Steel |  |
| Silver Battlestaff |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Silver Greatsword |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Silver Sword |  | Craftsmanship |  |  | 1 Ingot: Silver |  |
| Skyforge Steel Battleaxe |  | Advanced Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Skyforge Steel Dagger |  | Craftsmanship |  |  | 1 Ingot: Galatite |  |
| Skyforge Steel Greatsword |  | Advanced Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Skyforge Steel Heavy Bow |  | Advanced Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Skyforge Steel Mace |  | Advanced Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Skyforge Steel Sword |  | Advanced Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Skyforge Steel War Axe |  | Advanced Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Skyforge Steel Warhammer |  | Advanced Blacksmithing |  |  | 1 Ingot: Galatite |  |
| Soulrender |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Stalhrim Battleaxe |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim Battlestaff |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim Dagger |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim Greatsword |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim Heavy Crossbow |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim Light Bow |  | Stalhrim Smithing |  |  | 1 Hide Lace 1 Stalhrim |  |
| Stalhrim Mace |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim Sword |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim War Axe |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Stalhrim Warhammer |  | Stalhrim Smithing |  |  | 1 Stalhrim |  |
| Steel Battleaxe |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel Battlestaff |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel Crossbow of Banishing |  | Advanced Blacksmithing |  |  | 1 Ingot: Silver 2 Leather Strips |  |
| Steel Dagger |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel Greatsword |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel Heavy Crossbow |  | Craftsmanship |  |  | 1 Ingot: Steel 2 Hide Lace |  |
| Steel Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Ingot: Steel |  |
| Steel Mace |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel Scimitar |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel Sword |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel War Axe |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Steel Warhammer |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Stone Hunting Knife |  | Advanced Blacksmithing |  |  | 1 Sharp Rock |  |
| Stormcloak Heavy Crossbow |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Stormfang |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| The Longhammer |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| The Pale Blade |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| The Warhammer of Inebriation |  | Orcish Blacksmithing |  |  | 1 Ingot: Orichalcum |  |
| The Woodsman's Friend |  | Craftsmanship |  |  | 1 Ingot: Iron |  |
| Thieves Guild Light Crossbow |  | Advanced Blacksmithing |  |  | 1 Ingot: Corundum |  |
| Trollsbane |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Valdr's Lucky Dagger |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Volendrung |  | Legendary Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Volendrung Replica |  | Advanced Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Windshear |  | Craftsmanship |  |  | 1 Ingot: Steel |  |
| Wooden Battlestaff |  | Craftsmanship |  |  | 1 Wood |  |
| Wooden Heavy Bow |  | Craftsmanship |  |  | 1 Wood 2 Hide Lace |  |
| Wooden Light Bow |  | Craftsmanship |  |  | 1 Wood 2 Hide Lace |  |
| Wooden Light Bow |  | Craftsmanship |  |  | 1 Hide Lace |  |
| Wooden Light Crossbow |  | Craftsmanship |  |  | 1 Wood 1 Hide Lace |  |
| Wooden Sword |  | Craftsmanship |  |  | 1 Wood |  |
| Wuuthrad |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Wuuthrad Replica |  | Ebony Blacksmithing |  |  | 1 Ingot: Ebony |  |
| Zephyr |  | Dwarven Blacksmithing |  |  | 1 Ingot: Dwarven 2 Hide Lace |  |

</div>