---
title: Blacksmith Recipes
layout: default
nav_order: 5
has_children: false
description: Blacksmith crafting recipes and materials.
---

## Metal Weapon and Armor Crafting

Forge weapons and metal armor at a **Blacksmith Forge** workstation. Create the backbone of your combat effectiveness through metalworking.

**Available crafting includes:**
- Weapon creation (swords, axes, maces, daggers, etc.)
- Metal armor pieces (helm, cuirass, gauntlets, boots, etc.)
- Specialized combat gear
- Unique metal items

**Tip:** Blacksmithing is one of the most important crafts in Requiem. Invest in this skill early to create better gear as you progress.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/_10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- Perks and toolkit requirements
- Quantity produced per craft
- Complete list of materials needed
- Additional crafting requirements and conditions

Use the search bar and filters below to find specific forge recipes by toolkit or perks needed.

---

## Forge Recipes Data

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initForgetooltips() {
  const table = document.querySelector('.forge-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showForgetooltip(e, row));
    itemCell.addEventListener('mousemove', updateForgetooltipPosition);
    itemCell.addEventListener('mouseleave', hideForgetooltip);
  });
}

function showForgetooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    perksNeeded: cells[1]?.textContent || '',
    toolkitsRequired: cells[2]?.textContent || '',
    proximity: cells[3]?.textContent || '',
    qtyMade: cells[4]?.textContent || '',
    itemsRequired: cells[5]?.textContent || '',
    additionalRequirements: cells[6]?.textContent || ''
  };
  
  let tooltip = document.getElementById('forge-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'forge-tooltip';
    tooltip.className = 'forge-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Perks Needed:</strong> ${data.perksNeeded}</div>
    <div><strong>Toolkits Required:</strong> ${data.toolkitsRequired}</div>
    <div><strong>Proximity:</strong> ${data.proximity}</div>
    <div><strong>Qty Made:</strong> ${data.qtyMade}</div>
    <div><strong>Items Required:</strong> ${data.itemsRequired}</div>
    <div><strong>Additional Requirements:</strong> ${data.additionalRequirements}</div>
  `;
  tooltip.style.display = 'block';
  updateForgetooltipPosition(event);
}

function updateForgetooltipPosition(event) {
  const tooltip = document.getElementById('forge-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideForgetooltip() {
  const tooltip = document.getElementById('forge-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initForgeFilters() {
  const table = document.querySelector('.forge-recipes-table table');
  if (!table) {
    console.warn('Forge Recipes table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const toolkits = new Set();
  const perks = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 3) {
      const toolkitText = cells[2].textContent.trim();
      const perksText = cells[1].textContent.trim();
      
      if (toolkitText && toolkitText !== '') {
        toolkits.add(toolkitText);
      }
      if (perksText && perksText !== '') {
        perks.add(perksText);
      }
    }
  });
  
  const toolkitFilter = document.getElementById('forgeToolkitFilter');
  const perksFilter = document.getElementById('forgePerksFilter');
  
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
  
  document.getElementById('forgeSearch').addEventListener('input', filterForgeRecipes);
  document.getElementById('forgeToolkitFilter').addEventListener('change', filterForgeRecipes);
  document.getElementById('forgePerksFilter').addEventListener('change', filterForgeRecipes);
  initForgetooltips();
  updateFilterCountForge();
}

function filterForgeRecipes() {
  const searchTerm = document.getElementById('forgeSearch').value.toLowerCase();
  const toolkitFilter = document.getElementById('forgeToolkitFilter').value;
  const perksFilter = document.getElementById('forgePerksFilter').value;
  
  const table = document.querySelector('.forge-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[5]?.textContent.toLowerCase() || '';
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const toolkitMatch = !toolkitFilter || cells[2]?.textContent.trim().includes(toolkitFilter);
    const perksMatch = !perksFilter || cells[1]?.textContent.trim() === perksFilter;
    
    const isVisible = searchMatch && toolkitMatch && perksMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountForge();
  initForgetooltips();
}

function updateFilterCountForge() {
  const table = document.querySelector('.forge-recipes-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountForge');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearForgeFilters() {
  document.getElementById('forgeSearch').value = '';
  document.getElementById('forgeToolkitFilter').value = '';
  document.getElementById('forgePerksFilter').value = '';
  filterForgeRecipes();
}

initForgeFilters();

});
</script>

<div class="forge-recipes-controls">
  <input type="text" id="forgeSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="forgeToolkitFilter">
    <option value="">All Toolkits</option>
  </select>
  <select id="forgePerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersForge" onclick="clearForgeFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-forge" id="filterResultCountForge"></div>

<div class="forge-recipes-table" markdown="1">

| Produced Item Name | Perks Needed | Toolkits Required | Proximity | Qty Made | Items Required | Additional Requirements |
|:---|:---|:---|:---|:---:|:---|:---|
| Steel Plate Shield | Advanced Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips |  |
| Akaviri Katana | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Alchemist's Crown |  | Smiths,Jewelers | Forge | 1 | 1 Infused Ingot 3 Rubyluce |  |
| Alik'ri Fishing Rod | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 | 1 Ingot: Quicksilver 1 Wood | Fishing - Unlocked Alikri Rod |
| Ancient Nordic Battleaxe | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 3 Leather Strips |  |
| Ancient Nordic Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Ancient Nordic Boots | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Bear 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Bear 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Ancient Nordic Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Linen Wrap 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Greatsword | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Ancient Nordic Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Doe Antlers 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Hero Battleaxe | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 2 Ingot: Corundum 1 Ancient Nordic Honed Battleaxe 3 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cave Bear 1 Ancient Nordic Boots 3 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ancient Nordic Boots 3 Ingot: Steel 2 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ancient Nordic Cuirass 1 Pelt: Cave Bear 4 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ancient Nordic Cuirass 4 Ingot: Steel 3 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Dagger | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Ancient Nordic Honed Dagger | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ancient Nordic Gauntlets 2 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Greatsword | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Greatsword 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Bow | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 1 Ancient Nordic Honed Heavy Bow 2 Hide Lace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Crossbow | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 2 Ingot: Corundum 1 Leather 4 Hide Lace |  |
| Ancient Nordic Hero Helm | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Mace | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Ancient Nordic Honed Mace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Sword | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Sword 1 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero War Axe | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed War Axe 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Warhammer | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 3 Leather Strips 1 Ancient Nordic Honed Warhammer | Currently Uncraftable - Global Disabled |
| Ancient Nordic Honed Battleaxe | Craftsmanship | Smiths | Forge | 1 | 1 Ancient Nordic Battleaxe 2 Ingot: Corundum |  |
| Ancient Nordic Honed Greatsword | Craftsmanship | Smiths | Forge | 1 | 1 Ancient Nordic Greatsword 2 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | Craftsmanship | Smiths | Forge | 1 | 1 Ancient Nordic Light Bow 2 Ingot: Corundum |  |
| Ancient Nordic Honed Sword | Craftsmanship | Smiths | Forge | 1 | 1 Ancient Nordic Sword 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | Craftsmanship | Smiths | Forge | 1 | 1 Ancient Nordic War Axe 1 Ingot: Corundum |  |
| Ancient Nordic Light Bow | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Ancient Nordic Sword | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic War Axe | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Argonian Fishing Rod | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 | 1 Ingot: Orichalcum 1 Wood | Fishing - Unlocked Argonian Rod |
| Arrow: Ancient Nordic | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Iron 1 Wood |  |
| Arrow: Ancient Nordic Hero | Advanced Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Steel 1 Ingot: Corundum 1 Wood | Currently Uncraftable - Global Disabled |
| Arrow: Bone (Crude) | Craftsmanship | Smiths,Survivalists | N/A | 5 | 1 Wood 3 Fragment: Bone | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Bone (Crude) | Craftsmanship | Smiths,Survivalists | N/A | 5 | 3 Fragment: Bone 1 Animal Bone (Large) | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Daedric | Daedric Smithing | Smiths | Forge | 150 | 150 Arrow: Ebony 1 Soul Gem: Black 1 Daedra Heart |  |
| Arrow: Daedric Fire | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 | 15 Arrow: Daedric 1 Fire Salts |  |
| Arrow: Daedric Ice | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 | 15 Arrow: Daedric 1 Frost Salts |  |
| Arrow: Daedric Shock | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 | 15 Arrow: Daedric 1 Void Salts |  |
| Arrow: Dragonbone | Draconic Blacksmithing | Smiths | Forge | 15 | 1 Dragon Bone 1 Wood |  |
| Arrow: Dragonbone Fire | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Ice | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Shock | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Arrow: Dragonbone |  |
| Arrow: Dwarven | Dwarven Blacksmithing | Smiths | Forge | 15 | 1 Wood 1 Ingot: Dwarven |  |
| Arrow: Dwarven Fire | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Dwarven 1 Fire Salts |  |
| Arrow: Dwarven Ice | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Dwarven 1 Frost Salts |  |
| Arrow: Dwarven Shock | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Dwarven 1 Void Salts |  |
| Arrow: Ebony | Ebony Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Ebony 1 Wood |  |
| Arrow: Ebony Fire | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Ebony 1 Fire Salts |  |
| Arrow: Ebony Ice | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Ebony 1 Frost Salts |  |
| Arrow: Ebony Shock | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Ebony 1 Void Salts |  |
| Arrow: Elven | Elven Blacksmithing | Smiths | Forge | 15 | 1 Wood 1 Ingot: Calcinium |  |
| Arrow: Elven Fire | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Elven 1 Fire Salts |  |
| Arrow: Elven Ice | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Elven 1 Frost Salts |  |
| Arrow: Elven Shock | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Elven 1 Void Salts |  |
| Arrow: Falmer | Craftsmanship | Smiths | Forge | 24 | 1 Chaurus Chitin 1 Wood |  |
| Arrow: Forsworn | Craftsmanship | Smiths,Survivalists | N/A | 24 | 1 Doe Antlers 1 Wood |  |
| Arrow: Glass | Glass Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Malachite 1 Wood |  |
| Arrow: Glass Fire | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Glass 1 Fire Salts |  |
| Arrow: Glass Ice | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Glass 1 Frost Salts |  |
| Arrow: Glass Shock | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Glass 1 Void Salts |  |
| Arrow: Iron | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Iron 1 Wood |  |
| Arrow: Iron Fire | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 15 Arrow: Iron 1 Fire Salts |  |
| Arrow: Iron Ice | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 15 Arrow: Iron 1 Frost Salts |  |
| Arrow: Iron Shock | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 15 Arrow: Iron 1 Void Salts |  |
| Arrow: Nordic | Nordic Blacksmithing | Smiths | Forge | 15 | 1 Wood 1 Ingot: Galatite |  |
| Arrow: Nordic Fire | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Frost | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Shock | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Arrow: Nordic |  |
| Arrow: Orcish | Orcish Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Orichalcum 1 Wood |  |
| Arrow: Orcish Fire | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Orcish 1 Fire Salts |  |
| Arrow: Orcish Ice | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Orcish 1 Frost Salts |  |
| Arrow: Orcish Shock | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 | 15 Arrow: Orcish 1 Void Salts |  |
| Arrow: Silver | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Arrow: Silver Fire | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Arrow: Silver |  |
| Arrow: Silver Ice | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Arrow: Silver |  |
| Arrow: Silver Shock | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Arrow: Silver |  |
| Arrow: Skyforge Steel | Advanced Blacksmithing | Smiths | Forge | 15 | 1 Wood 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Arrow: Stalhrim | Stalhrim Smithing | Smiths | Forge | 15 | 1 Wood 1 Stalhrim | A New Source of Stalhrim |
| Arrow: Stalhrim Fire | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 15 | 1 Fire Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Frost | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 15 | 1 Frost Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Shock | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 15 | 1 Void Salts 15 Arrow: Stalhrim |  |
| Arrow: Steel | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Steel 1 Wood |  |
| Arrow: Steel Fire | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 15 Arrow: Steel 1 Fire Salts |  |
| Arrow: Steel Ice | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 15 Arrow: Steel 1 Frost Salts |  |
| Arrow: Steel Shock | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 15 Arrow: Steel 1 Void Salts |  |
| Arrow: Stone (Crude) | Craftsmanship | Smiths,Survivalists | N/A | 5 | 1 Wood 1 Sharp Rock | Animal Harvesting Skill Less or Equal to 2 |
| Auriel's Bow Replica | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Auriel's Shield Replica | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Moonstone 2 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Blade of Sacrifice Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - Boethiahs Calling |
| Blade of Woe Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Dark Brotherhood - Death Incarnate Complete |
| Blades Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather | Main Quest - Alduins Wall Complete |
| Blades Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Helmet | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Shield | Advanced Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Bloodskal Blade Replica | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Silver 2 Leather Strips 3 Ingot: Galatite | Dragonborn - The Final Decent Complete |
| Bolt: Ancient Nordic Hero | Advanced Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Corundum 1 Wood |  |
| Bolt: Ancient Nordic Hero Fire | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Frost | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Shock | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Daedric | Daedric Smithing | Smiths | Forge | 150 | 1 Soul Gem: Black 1 Daedra Heart 150 Bolt: Ebony |  |
| Bolt: Daedric Fire | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Ice | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Shock | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Daedric |  |
| Bolt: Dark Brotherhood | Ebony Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Dark Brotherhood Fire | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Frost | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Shock | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 25 | 1 Void Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dawnguard | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Silver 1 Wood |  |
| Bolt: Dawnguard Fire | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Frost | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Shock | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Dawnguard |  |
| Bolt: Dragonbone | Draconic Blacksmithing | Smiths | Forge | 15 | 1 Dragon Bone 1 Wood |  |
| Bolt: Dragonbone Fire | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Ice | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Shock | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Dragonbone |  |
| Bolt: Dwarven | Dwarven Blacksmithing | Smiths | Forge | 15 | 1 Wood 1 Ingot: Dwarven |  |
| Bolt: Dwarven Fire | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Fireburst | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Fire Schematic |
| Bolt: Dwarven Ice | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Iceburst | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Ice Schematic |
| Bolt: Dwarven Shock | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Shockburst | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Shock Schematic |
| Bolt: Ebony | Ebony Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Ebony Fire | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Ice | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Shock | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Ebony |  |
| Bolt: Elven | Elven Blacksmithing | Smiths | Forge | 15 | 1 Wood 1 Ingot: Calcinium |  |
| Bolt: Elven Fire | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Elven |  |
| Bolt: Elven Ice | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Elven |  |
| Bolt: Elven Shock | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Elven |  |
| Bolt: Glass | Glass Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Malachite 1 Wood |  |
| Bolt: Glass Fire | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Glass |  |
| Bolt: Glass Ice | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Glass |  |
| Bolt: Glass Shock | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Glass |  |
| Bolt: Imperial | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Steel 1 Wood |  |
| Bolt: Imperial Fire | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Frost | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Shock | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Imperial |  |
| Bolt: Iron | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Iron 1 Wood |  |
| Bolt: Iron Fire | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Iron |  |
| Bolt: Iron Ice | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Iron |  |
| Bolt: Iron Shock | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Iron |  |
| Bolt: Orcish | Orcish Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Orichalcum 1 Wood |  |
| Bolt: Orcish Fire | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Ice | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Shock | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Orcish |  |
| Bolt: Silver | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Bolt: Silver Fire | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Silver |  |
| Bolt: Silver Ice | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Silver |  |
| Bolt: Silver Shock | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Silver |  |
| Bolt: Stalhrim | Stalhrim Smithing | Smiths | Forge | 15 | 1 Stalhrim | A New Source of Stalhrim |
| Bolt: Stalhrim Fire | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Frost | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Shock | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Stalhrim |  |
| Bolt: Steel | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Steel 1 Wood |  |
| Bolt: Steel Fire | Arcane Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Steel |  |
| Bolt: Steel Ice | Arcane Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Steel |  |
| Bolt: Steel Shock | Arcane Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Steel |  |
| Bolt: Stormcloak | Craftsmanship | Smiths | Forge | 15 | 1 Ingot: Steel 1 Wood |  |
| Bolt: Stormcloak Fire | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Frost | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Shock | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Stormcloak |  |
| Bolt: Thieves Guild | Advanced Blacksmithing | Smiths | Forge | 15 | 1 Ingot: Steel 1 Wood |  |
| Bolt: Thieves Guild Fire | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 15 | 1 Fire Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Frost | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 15 | 1 Frost Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Shock | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 15 | 1 Void Salts 15 Bolt: Thieves Guild |  |
| Bone Divining Knife |  | Smiths,Survivalists | N/A | 1 | 1 Leather Strips 3 Fragment: Bone | Animal Harvesting Skill Greater or Equal to 3 |
| Bone Hunting Knife |  | Smiths,Survivalists | N/A | 1 | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Masterwork Sword |  | Smiths,Survivalists | N/A | 1 | 2 Hawk Feathers 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Masterwork War Axe |  | Smiths,Survivalists | N/A | 1 | 2 Hide Lace 3 Wolf Claws 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 3 |
| Bone Staff |  | Smiths,Survivalists | N/A | 1 | 2 Leather Strips 1 Animal Bone (Large) 2 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 4 |
| Bone Sword |  | Smiths,Survivalists | N/A | 1 | 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone War Axe |  | Smiths,Survivalists | N/A | 1 | 2 Leather Strips 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 1 |
| Bonemold Boots | Morrowind Smithing 1 | Smiths | Forge | 1 | 6 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Cuirass | Morrowind Smithing 1 | Smiths | Forge | 1 | 8 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Gauntlets | Morrowind Smithing 1 | Smiths | Forge | 1 | 4 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet | Morrowind Smithing 1 | Smiths | Forge | 1 | 6 Bone Meal 1 Ingot: Iron 1 Leather Strips 1 Netch Leather |  |
| Bonemold Improved Boots | Morrowind Smithing 1 | Smiths | Forge | 1 | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Cuirass | Morrowind Smithing 1 | Smiths | Forge | 1 | 8 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Gauntlets | Morrowind Smithing 1 | Smiths | Forge | 1 | 4 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet | Morrowind Smithing 1 | Smiths | Forge | 1 | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 1 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Pauldroned Cuirass | Morrowind Smithing 1 | Smiths | Forge | 1 | 10 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Shield | Morrowind Smithing 1 | Smiths | Forge | 1 | 8 Bone Meal 2 Salt 1 Ingot: Iron 2 Powdered Mammoth Tusk 2 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Pauldroned Cuirass | Morrowind Smithing 1 | Smiths | Forge | 1 | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass - Guard's | Morrowind Smithing 1 | Smiths | Forge | 1 | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Shield | Morrowind Smithing 1 | Smiths | Forge | 1 | 8 Bone Meal 1 Ingot: Iron 1 Netch Leather |  |
| Champion's Cudgel Replica | Advanced Light Smithing,Orcish Blacksmithing | Smiths | Forge | 1 | 3 Leather Strips 5 Ingot: Galatite | Dragonborn - March Of The Dead Complete,Civil War - Joined Imperials |
| Chillrend Replica | Glass Blacksmithing | Smiths | Forge | 1 | 1 Frost Salts 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium | TG - The Pursuit Complete |
| Chitin Heavy Boots | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Cuirass | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Corundum 4 Leather Strips 2 Netch Leather 6 Chitin Plate |  |
| Chitin Heavy Gauntlets | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Heavy Helmet | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 1 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Light Boots | Morrowind Smithing 2 | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Netch Leather 2 Chitin Plate |  |
| Chitin Light Bracers | Morrowind Smithing 2 | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 1 Netch Leather 2 Chitin Plate |  |
| Chitin Light Cuirass | Morrowind Smithing 2 | Smiths | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 3 Netch Leather 4 Chitin Plate |  |
| Chitin Light Helmet | Morrowind Smithing 2 | Smiths | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Light Shield | Morrowind Smithing 2 | Smiths | Forge | 1 | 1 Ingot: Steel 1 Netch Leather 4 Chitin Plate |  |
| Circle Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Leather Strips 1 Leather 3 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 4 Leather Strips 2 Leather 5 Ingot: Galatite 6 Fur Plate | Companions - Silver Hand Complete |
| Circle Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Pelt: Snow Bear 4 Leather Strips 2 Leather 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 2 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Leather Strips 1 Leather 2 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Helmet | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Shield | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Leather Strips 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Copper Circlet | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 | 1 Ingot: Corundum |  |
| Daedric Battleaxe | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Battleaxe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Battlestaff | Daedric Smithing | Smiths | Forge | 1 | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Battlestaff |  |
| Daedric Boots | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Boots 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Cuirass | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Cuirass 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Dagger | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Dagger 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Gauntlets | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Gauntlets 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Greatsword | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Greatsword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Bow | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Heavy Bow 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Crossbow | Daedric Smithing | Smiths | Forge | 1 | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Heavy Crossbow 4 Silk Thread |  |
| Daedric Helmet | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Helmet 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Hunting Knife | Daedric Smithing | Smiths,Survivalists | Forge | 1 | 1 Daedra Heart 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Daedric Mace | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Mace 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Shield | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Shield 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Sword | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Sword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric War Axe | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony War Axe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Warhammer | Daedric Smithing | Smiths | Forge | 1 | 1 Ebony Warhammer 1 Soul Gem: Black 1 Daedra Heart |  |
| Dark Brotherhood Heavy Crossbow | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 2 Ingot: Ebony 2 Wood 1 Leather 4 Hide Lace |  |
| Dawnbreaker Replica | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 3 Ingot: Calcinium | Daedra -  The Break of Dawn |
| Dawnguard Heavy Boots | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Black | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Grey | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Grey | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Shield | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips 1 Leather | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Improved Light Crossbow | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Corundum 1 Dawnguard Light Crossbow | Read Improved Crossbow Schematic |
| Dawnguard Light Boots | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Crossbow | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 3 Wood 4 Hide Lace | Dawnguard - A New Order complete and spoken to Sorine about crossbow construction |
| Dawnguard Light Cuirass - Black | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass - Red | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Dye - Red | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Gauntlets | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Reinforced Light Cuirass - Blue | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Blue | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Rune Shield Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 1 Ingot: Ebony 2 Leather Strips | DawnGuard - Lost Relic Complete |
| Dawnguard Rune War Axe Replica | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Warhammer Replica | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard War Axe | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dragon Priest Dagger | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Corundum 1 Leather Strips |  |
| Dragonbone Battleaxe | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 3 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Dagger | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Greatsword | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Heavy Bow | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Heavy Crossbow | Draconic Blacksmithing | Smiths | Forge | 1 | 3 Dragon Bone 2 Ingot: Ebony 4 Hide Lace |  |
| Dragonbone Hunting Knife | Draconic Blacksmithing | Smiths,Survivalists | Forge | 1 | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Dragonbone Mace | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Sword | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone War Axe | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Warhammer | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 4 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonplate Bearskin Hood - Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Black |  |
| Dragonplate Bearskin Hood - Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Brown |  |
| Dragonplate Bearskin Hood - Ornate Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonplate Bearskin Hood - Ornate Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonplate Bearskin Hood - Ornate White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonplate Bearskin Hood - Trimmed Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonplate Bearskin Hood - Trimmed Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonplate Bearskin Hood - Trimmed White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonplate Bearskin Hood - White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - White |  |
| Dragonplate Boots | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Cuirass | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 1 Dragon Scales 4 Dragon Bone 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Dragonplate Gauntlets | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Helmet | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Dragonplate Shield | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 4 Dragon Bone 2 Ingot: Ebony 2 Leather Strips |  |
| Dragonplate Wolfskin Hood - Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Black |  |
| Dragonplate Wolfskin Hood - Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonplate Wolfskin Hood - Light Trimmed Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonplate Wolfskin Hood - Light Trimmed Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Light Trimmed White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonplate Wolfskin Hood - Noble Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonplate Wolfskin Hood - Noble Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonplate Wolfskin Hood - Noble White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonplate Wolfskin Hood - Ornate Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonplate Wolfskin Hood - Ornate Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonplate Wolfskin Hood - Ornate White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonplate Wolfskin Hood - White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - White |  |
| Dragonscale Bearskin Hood - Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Black |  |
| Dragonscale Bearskin Hood - Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Brown |  |
| Dragonscale Bearskin Hood - Ornate Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonscale Bearskin Hood - Ornate Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonscale Bearskin Hood - Ornate White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonscale Bearskin Hood - Trimmed Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonscale Bearskin Hood - Trimmed Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonscale Bearskin Hood - Trimmed White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonscale Bearskin Hood - White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - White |  |
| Dragonscale Boots | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 1 | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Cuirass | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 1 | 3 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Dragonscale Gauntlets | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 1 | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Helmet | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 1 | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Dragonscale Shield | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 1 | 2 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 2 Leather Strips |  |
| Dragonscale Wolfskin Hood - Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Black |  |
| Dragonscale Wolfskin Hood - Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonscale Wolfskin Hood - Light Trimmed Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonscale Wolfskin Hood - Light Trimmed Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Light Trimmed White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonscale Wolfskin Hood - Noble Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonscale Wolfskin Hood - Noble Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonscale Wolfskin Hood - Noble White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonscale Wolfskin Hood - Ornate Black | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonscale Wolfskin Hood - Ornate Brown | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonscale Wolfskin Hood - Ornate White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonscale Wolfskin Hood - White | Draconic Blacksmithing | Smiths | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - White |  |
| Dwarven Battleaxe | Dwarven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 3 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Boots | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Cuirass | Dwarven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 2 Leather 5 Ingot: Dwarven |  |
| Dwarven Dagger | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven |  |
| Dwarven Fishing Rod | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 | 1 Ingot: Steel 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Rod |
| Dwarven Gauntlets | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 1 Leather 2 Ingot: Dwarven |  |
| Dwarven Greatsword | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Heavy Bow | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | Dwarven Blacksmithing | Smiths | Forge | 1 | 3 Wood 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Helmet | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Hunting Knife | Dwarven Blacksmithing | Smiths,Survivalists | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven 1 Fragment: Bone |  |
| Dwarven Improved Light Crossbow | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 4 Ingot: Dwarven | Read Dwemer Crossbow Schematic |
| Dwarven Mace | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Masterwork Light Crossbow | Dwarven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 1 Dwarven Improved Light Crossbow | Improved Dwemer Crossbow Schematic |
| Dwarven Shield | Dwarven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Sword | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven War Axe | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven Warhammer | Dwarven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 3 Leather Strips 4 Ingot: Dwarven |  |
| Ebony Battleaxe | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Battlestaff | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 2 Ingot: Quicksilver |  |
| Ebony Blade Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - The Whispering Door |
| Ebony Boots | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Boots - Silvered | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Silver 3 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Cuirass | Ebony Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Gilded | Ebony Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Dagger | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Gauntlets | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Silvered | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Silver 2 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Greatsword | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Heavy Bow | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Hide Lace |  |
| Ebony Heavy Crossbow | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 2 Ingot: Quicksilver 4 Hide Lace |  |
| Ebony Helmet | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Gilded | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Gold 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Silver 3 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Ebony Hunting Knife | Ebony Blacksmithing | Smiths,Survivalists | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Fragment: Bone |  |
| Ebony Mace | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Mail Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica - Gilded | Ebony Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | Ebony Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Silver 4 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Shield | Ebony Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Shield - Gilded | Ebony Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips |  |
| Ebony Shield - Silvered | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Silver 4 Ingot: Ebony 2 Leather Strips |  |
| Ebony Sword | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony War Axe | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Warhammer | Ebony Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Elven Battleaxe | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 3 Leather Strips 3 Ingot: Calcinium |  |
| Elven Boots | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Cuirass | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Gold 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Gold 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Dagger | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium |  |
| Elven Gauntlets | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Greatsword | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Helmet | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Hunting Knife | Elven Blacksmithing | Smiths,Survivalists | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Elven Light Boots | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Bow | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Crossbow | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Cuirass | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Gauntlets | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Helmet | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Mace | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Shield | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Gilded | Advanced Light Smithing | Smiths | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | Advanced Light Smithing | Smiths | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Sword | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 2 Ingot: Calcinium |  |
| Elven War Axe | Elven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 2 Ingot: Calcinium |  |
| Elven Warhammer | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 3 Leather Strips 4 Ingot: Calcinium |  |
| Falmer Boots | Craftsmanship | Smiths | Forge | 1 | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Bracers | Craftsmanship | Smiths | Forge | 1 | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Cuirass | Craftsmanship | Smiths | Forge | 1 | 3 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Hardened Boots | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Cuirass | Ebony Blacksmithing | Smiths | Forge | 1 | 5 Chaurus Chitin 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Falmer Hardened Gauntlets | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Helmet | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Chaurus Chitin 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Falmer Heavy Boots | Dwarven Blacksmithing | Smiths | Forge | 1 | 3 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Bow | Craftsmanship | Smiths | Forge | 1 | 3 Chaurus Chitin 3 Leather Strips |  |
| Falmer Heavy Cuirass | Dwarven Blacksmithing | Smiths | Forge | 1 | 5 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Gauntlets | Dwarven Blacksmithing | Smiths | Forge | 1 | 2 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Helmet | Dwarven Blacksmithing | Smiths | Forge | 1 | 3 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Helmet | Craftsmanship | Smiths | Forge | 1 | 2 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Honed Light Bow | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Falmer Heavy Bow 2 Ingot: Ebony |  |
| Falmer Honed Sword | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Falmer Sword 1 Ingot: Ebony |  |
| Falmer Honed War Axe | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Falmer War Axe 1 Ingot: Ebony |  |
| Falmer Shield | Craftsmanship | Smiths | Forge | 1 | 4 Chaurus Chitin 2 Leather Strips |  |
| Falmer Sword | Craftsmanship | Smiths | Forge | 1 | 2 Chaurus Chitin 1 Leather Strips |  |
| Falmer War Axe | Craftsmanship | Smiths | Forge | 1 | 2 Chaurus Chitin 2 Leather Strips |  |
| Forsworn Boots | Craftsmanship | Smiths | N/A | 1 | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Boots | Craftsmanship | Smiths | N/A | 1 | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Cuirass | Craftsmanship | Smiths | N/A | 1 | 2 Hagraven Feathers 4 Pelt: Goat 4 Leather Strips |  |
| Forsworn Cuirass | Craftsmanship | Smiths | N/A | 1 | 2 Hagraven Feathers 4 Leather Strips 2 Fur Plate |  |
| Forsworn Gauntlets | Craftsmanship | Smiths | N/A | 1 | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Gauntlets | Craftsmanship | Smiths | N/A | 1 | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Headdress | Craftsmanship | Smiths | N/A | 1 | 1 Hagraven Feathers 1 Doe Antlers 2 Fur Plate |  |
| Forsworn Headdress | Craftsmanship | Smiths | N/A | 1 | 1 Hagraven Feathers 1 Pelt: Goat 1 Doe Antlers |  |
| Forsworn Light Bow | Craftsmanship | Smiths | Forge | 1 | 1 Doe Antlers 2 Wood 5 Leather Strips 1 Hawk Feathers |  |
| Forsworn Sword | Craftsmanship | Smiths | Forge | 1 | 6 Sabre Cat Tooth 2 Wood 4 Leather Strips |  |
| Forsworn War Axe | Craftsmanship | Smiths | Forge | 1 | 1 Sabre Cat Tooth 3 Wood 5 Leather Strips 1 Quarried Stone |  |
| Fur Boots | Craftsmanship | Survivalists,Smiths | N/A | 1 | 2 Hide Lace 2 Fur Plate |  |
| Fur Bracers | Craftsmanship | Survivalists,Smiths | N/A | 1 | 2 Hide Lace 2 Fur Plate |  |
| Fur Cuirass | Craftsmanship | Survivalists,Smiths | N/A | 1 | 4 Hide Lace 5 Fur Plate |  |
| Fur Gauntlets | Craftsmanship | Survivalists,Smiths | N/A | 1 | 2 Hide Lace 2 Fur Plate |  |
| Fur Guard's Boots | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Guard's Boots | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Cuirass - Falkreath | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Haafingar | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Hjaalmarch | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Reach | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Rift | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Whiterun | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Winterhold | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Gauntlets | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Gauntlets | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Helmet | Craftsmanship | Survivalists,Smiths | N/A | 1 | 1 Hide Lace 2 Fur Plate |  |
| Fur Kilt | Craftsmanship | Survivalists,Smiths | N/A | 1 | 3 Hide Lace 2 Fur Plate |  |
| Fur Mantled Kilt | Craftsmanship | Survivalists,Smiths | N/A | 1 | 3 Hide Lace 3 Fur Plate |  |
| Fur Shoes | Craftsmanship | Survivalists,Smiths | N/A | 1 | 2 Hide Lace 1 Fur Plate |  |
| Fur Sleeveless Cuirass | Craftsmanship | Survivalists,Smiths | N/A | 1 | 4 Hide Lace 4 Fur Plate |  |
| Furred Robes - Dark | Craftsmanship | Smiths | N/A | 1 | 3 Fur Plate 2 Linen Cloth - Black 4 Linen Thread |  |
| Furred Robes - Pale | Craftsmanship | Smiths | N/A | 1 | 3 Fur Plate 4 Linen Thread 2 Linen Cloth |  |
| Glass Battleaxe | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Battlestaff | Glass Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Moonstone 2 Ingot: Malachite 2 Ingot: Calcinium |  |
| Glass Boots | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Boots - Thalmor | Glass Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Boots - Vvardenfell | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Bottle (Empty) | Craftsmanship | Alchemists,Survivalists,Builders,Brewers,Smiths | Forge | 1 | 5 Building Glass |  |
| Glass Cuirass | Glass Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Calcinium |  |
| Glass Cuirass - Thalmor | Glass Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Corundum 5 Ingot: Malachite 4 Leather Strips 2 Leather |  |
| Glass Cuirass - Vvardenfell | Glass Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Galatite |  |
| Glass Dagger | Glass Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Gauntlets | Glass Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Gauntlets - Thalmor | Glass Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 2 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Gauntlets - Vvardenfell | Glass Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Greatsword | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Helmet | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Helmet - Thalmor | Glass Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Malachite 1 Leather Strips 1 Leather |  |
| Glass Helmet - Vvardenfell | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Hunting Knife | Glass Blacksmithing | Smiths,Survivalists | Forge | 1 | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Glass Light Bow | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 2 Hide Lace 1 Ingot: Calcinium |  |
| Glass Light Crossbow | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 2 Hide Lace 2 Ingot: Calcinium |  |
| Glass Mace | Glass Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | Glass Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield - Thalmor | Glass Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 4 Ingot: Malachite 2 Leather Strips |  |
| Glass Shield - Vvardenfell | Glass Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Galatite |  |
| Glass Sword | Glass Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass War Axe | Glass Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Warhammer | Glass Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Gold Circlet | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 | 1 Ingot: Gold |  |
| Gold Necklace | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 | 4 Fragment: Gold |  |
| Gold Necklace (5) | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 | 1 Ingot: Gold |  |
| Gold Ring | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 | 2 Fragment: Gold |  |
| Gold Ring (10) | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 | 1 Ingot: Gold |  |
| Harkon's Sword Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Killed Harkon |
| Helm of Yngol Replica | Craftsmanship | Smiths | Forge | 1 | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Sidequest - Escape Yngols Barrow Complete,Currently Uncraftable - Global Disabled |
| Hide Boots | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather |  |
| Hide Boots | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather 2 Fur Plate |  |
| Hide Boots | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Elk 2 Leather Strips 2 Leather |  |
| Hide Bracers | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 1 Leather |  |
| Hide Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 4 Leather Strips 3 Leather 2 Fur Plate |  |
| Hide Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Elk 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Furred Cuirass | Craftsmanship | Smiths | N/A | 1 | 3 Leather 4 Hide Lace 2 Fur Plate |  |
| Hide Helmet | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Hide Lace | Craftsmanship | Smiths,Tailors,Survivalists,Jewelers | N/A | 4 | 1 Fur Plate |  |
| Hide Shield | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 4 Leather |  |
| Hide Skaal Boots | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Boots | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | Craftsmanship | Smiths | N/A | 1 | 5 Leather Strips 6 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | Craftsmanship | Smiths | N/A | 1 | 2 Pelt: Elk 5 Leather Strips 4 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Elk 1 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | Craftsmanship | Smiths | N/A | 1 | 1 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Horse Armor: Big Game Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Troll Skull 1 Mammoth Tusk 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Big Game Saddle - Adorned | Craftsmanship | Smiths | Forge | 1 | 1 Rueful Axe 1 Horse Armor: Big Game Saddle |  |
| Horse Armor: Black Hand Barding and Saddle | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ancient Nordic War Axe 1 Wooden Lute 1 Horse Armor: Black Hand Barding and Saddle |  |
| Horse Armor: Cleric Barding and Saddle | Elven Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Daedric Barding and Saddle | Daedric Smithing | Smiths | Forge | 1 | 1 Daedra Heart 1 Ingot: Steel 10 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Dawnguard Barding and Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | Craftsmanship | Smiths | Forge | 1 | 1 Steel Heavy Crossbow 8 Bolt: Steel 1 Dawnguard War Axe 1 Dawnguard Heavy Shield 1 Horse Armor: Dawnguard Barding and Saddle | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Divine Aegis Barding and Saddle | Glass Blacksmithing | Smiths | Forge | 1 | 2 Briar Heart 2 Ingot: Gold 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Dragonbone Barding and Saddle | Draconic Blacksmithing | Smiths | Forge | 1 | 2 Dragon Scales 8 Dragon Bone 1 Ingot: Steel 10 Leather Strips 6 Leather |  |
| Horse Armor: Dwarven Barding and Saddle | Dwarven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 10 Leather Strips 6 Leather 8 Ingot: Dwarven |  |
| Horse Armor: Ebony Barding and Saddle | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle - Mail | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Amber | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Dusk | Elven Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Frost Aegis Barding and Saddle | Glass Blacksmithing | Smiths | Forge | 1 | 2 Frost Salts 2 Ingot: Quicksilver 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Fur Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 2 Leather |  |
| Horse Armor: Hunter's Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 1 Pelt: Fox 3 Leather |  |
| Horse Armor: Hunter's Saddle - Adorned | Craftsmanship | Smiths | Forge | 1 | 8 Arrow: Steel 1 Horse Armor: Hunter's Saddle |  |
| Horse Armor: Imperial Barding and Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | Craftsmanship | Smiths | Forge | 1 | 1 Iron Sword 1 Imperial Heavy Shield 1 Imperial Heavy Bow 8 Arrow: Iron 1 Horse Armor: Imperial Barding and Saddle |  |
| Horse Armor: Imperial Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 2 Wood 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle - Adorned | Craftsmanship | Smiths | Forge | 1 | 1 Steel Helmet 1 Steel Shield 1 Steel Greatsword 1 Steel Sword 1 Horse Armor: Knight's Saddle |  |
| Horse Armor: Leather Barding and Saddle | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Minstrel's Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 6 Leather Strips 1 Wooden Lute 3 Leather |  |
| Horse Armor: Minstrel's Saddle - Adorned | Craftsmanship | Smiths | Forge | 1 | 8 Arrow: Steel 1 Horse Armor: Minstrel's Saddle |  |
| Horse Armor: Nordic Barding and Saddle | Advanced Blacksmithing | Smiths | Forge | 1 | 8 Ingot: Steel 2 Ingot: Corundum 10 Leather Strips 6 Leather |  |
| Horse Armor: Ornate Barding and Saddle | Craftsmanship | Smiths | Forge | 1 | 6 Linen Wrap 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Shadowmere's Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Bear 2 Ingot: Iron 10 Leather Strips 7 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | Craftsmanship | Smiths | Forge | 1 | 1 Iron Sword 8 Arrow: Iron 1 Wooden Light Bow 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Horse Armor: Traveler's Saddle | Craftsmanship | Smiths | Forge | 1 | 2 Linen Wrap 1 Corundum Flagon 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Imperial Crested Heavy Helmet | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial General Cuirass | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Heavy Boots | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 3 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Bow | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 3 Wood 3 Hide Lace | Civil War - Joined Imperials |
| Imperial Heavy Bracers | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Crossbow | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Imperial Heavy Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Heavy Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Shield | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 2 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Light Boots | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Bracers | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Cuirass | Craftsmanship | Smiths | N/A | 1 | 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Light Helmet | Craftsmanship | Smiths | N/A | 1 | 1 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Shield | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 4 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Officer Heavy Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Outcast Boots | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Imperial Outcast Bracers | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Elk 2 Leather Strips |  |
| Imperial Outcast Bracers | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Fur Plate |  |
| Imperial Outcast Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Imperial Outcast Helmet | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Iron 1 Leather Strips |  |
| Imperial Studded Cuirass | Advanced Light Smithing | Smiths | Forge | 1 | 1 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Sword | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Imperials |
| Irkngthand War Axe | Ebony Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Ebony 3 Leather Strips 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Axe |
| Iron Banded Cuirass | Craftsmanship | Smiths | Forge | 1 | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | Craftsmanship | Smiths | Forge | 1 | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Masterwork Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Shield | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Shield | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Battleaxe | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Battlestaff | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 4 Wood 2 Leather Strips |  |
| Iron Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots - Engraved | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots (Engraved) | Craftsmanship | Smiths | N/A | 1 | 1 Iron Boots |  |
| Iron Cauldron | Craftsmanship | Smiths,Alchemists | Forge | 1 | 8 Ingot: Iron |  |
| Iron Cooking Pot | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron |  |
| Iron Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Dagger | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Fittings | Craftsmanship | Smiths,Builders | Forge | 1 | 1 Ingot: Iron |  |
| Iron Fittings | Craftsmanship | Smiths,Builders | Forge | 10 | 10 Ingot: Iron |  |
| Iron Fittings | Craftsmanship | Smiths,Builders | Forge | 5 | 5 Ingot: Iron |  |
| Iron Furred Cuirass | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 4 Hide Lace 2 Fur Plate |  |
| Iron Gauntlets | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Greatsword | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 2 Leather Strips |  |
| Iron Guard's Cuirass - Eastmarch | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Iron Guard's Cuirass - Falkreath | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Ingot: Corundum 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Haafingar | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Hjaalmarch | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Pale | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Reach | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 3 Leather 3 Ingot: Dwarven | Thane of Hold |
| Iron Guard's Cuirass - The Rift | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 6 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Whiterun | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Winterhold | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Hammer | Craftsmanship | Smiths,Builders | Forge | 1 | 1 Ingot: Iron 1 Wood |  |
| Iron Headsman's Axe | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Headsman's Axe | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Heavy Crossbow | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 3 Wood 2 Hide Lace |  |
| Iron Heavy Shield | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 2 Wood 2 Leather Strips |  |
| Iron Heavy Shield | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 1 Iron Dented Shield |  |
| Iron Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Engraved | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Ram | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Ram | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Hinge | Craftsmanship | Smiths,Builders | Forge | 2 | 1 Ingot: Iron |  |
| Iron Hinge | Craftsmanship | Smiths,Builders | Forge | 20 | 10 Ingot: Iron |  |
| Iron Hinge | Craftsmanship | Smiths,Builders | Forge | 10 | 5 Ingot: Iron |  |
| Iron Hunting Knife | Craftsmanship | Smiths,Survivalists | Forge | 1 | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Lantern | Craftsmanship | Smiths,Thieves,Survivalists | Forge | 1 | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Falkreath | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Hjaalmarch | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Pale | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Reach | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Rift | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Whiterun | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Shield - Eastmarch | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Falkreath | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Haafingar | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Hjaalmarch | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Pale | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Rift | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Whiterun | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Lock | Craftsmanship | Smiths,Builders | Forge | 1 | 1 Ingot: Iron 1 Ingot: Corundum |  |
| Iron Lock | Craftsmanship | Smiths,Builders | Forge | 10 | 10 Ingot: Iron 10 Ingot: Corundum |  |
| Iron Lock | Craftsmanship | Smiths,Builders | Forge | 5 | 5 Ingot: Iron 5 Ingot: Corundum |  |
| Iron Mace | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Masterwork Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Masterwork Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Masterwork Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Masterwork Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Helmet | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Masterwork Shield | Advanced Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Nails | Craftsmanship | Smiths,Builders | Forge | 100 | 10 Ingot: Iron |  |
| Iron Nails | Craftsmanship | Smiths,Builders | Forge | 10 | 1 Ingot: Iron |  |
| Iron Nails | Craftsmanship | Smiths,Builders | Forge | 50 | 5 Ingot: Iron |  |
| Iron Pickaxe | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Wood |  |
| Iron Quality Boots | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Quality Gauntlets | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Quality Shield | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Reinforced Armor (Engraved) | Craftsmanship | Smiths | N/A | 1 | 1 Iron Banded Cuirass |  |
| Iron Robed Cuirass - Dark | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Iron Robed Cuirass - Pale | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 4 Linen Thread 3 Linen Cloth |  |
| Iron Sword | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Leather Strips |  |
| Iron Tongs | Craftsmanship | Smiths,Builders | Forge | 1 | 1 Ingot: Iron |  |
| Iron War Axe | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Warhammer | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Woodcutter's Axe | Craftsmanship | Smiths,Survivalists | Forge | 1 | 1 Ingot: Iron 2 Deadwood |  |
| Iron Woodcutter's Axe | Craftsmanship | Smiths,Survivalists | Forge | 1 | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | Craftsmanship | Smiths,Survivalists | Forge | 1 | 1 Ingot: Iron 1 Wood |  |
| Jagged Crown Replica | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather | Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete,Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete |
| Jarl of Eastmarch Armguards | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armor | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark 4 Fur Plate |  |
| Jarl of Eastmarch Armor | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark |  |
| Keening Replica | Dwarven Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Dwarven Gyro 1 Ingot: Dwarven | College - Arniels Endeavor  Complete |
| Leather Bearskin Hood - Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Black |  |
| Leather Bearskin Hood - Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Brown |  |
| Leather Bearskin Hood - Ornate Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Ornate Black |  |
| Leather Bearskin Hood - Ornate Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Ornate Brown |  |
| Leather Bearskin Hood - Ornate White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Ornate White |  |
| Leather Bearskin Hood - Trimmed Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Trimmed Black |  |
| Leather Bearskin Hood - Trimmed Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Leather Bearskin Hood - Trimmed White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - Trimmed White |  |
| Leather Bearskin Hood - White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Bearskin Hood - White |  |
| Leather Boots | Craftsmanship | Smiths | N/A | 1 | 3 Leather Strips 4 Leather |  |
| Leather Bracers | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather |  |
| Leather Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Leather Doublet | Craftsmanship | Smiths | N/A | 1 | 2 Leather 2 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Doublet - Dark | Craftsmanship | Smiths | N/A | 1 | 2 Leather 3 Linen Cloth - Black 4 Linen Thread |  |
| Leather Executioner's Boots | Craftsmanship | Smiths | N/A | 1 | 1 Pelt: Ice Wolf 3 Leather Strips |  |
| Leather Executioner's Boots | Craftsmanship | Smiths | N/A | 1 | 3 Leather Strips 1 Fur Plate |  |
| Leather Executioner's Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark 2 Fur Plate |  |
| Leather Executioner's Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Ice Wolf 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark |  |
| Leather Executioner's Gloves | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Ice Wolf 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Leather Executioner's Gloves | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark 1 Fur Plate |  |
| Leather Executioner's Hood | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Dark |  |
| Leather Helmet | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Leather Hood | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather |  |
| Leather Hood - Black | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Dark |  |
| Leather Strips | Craftsmanship | Smiths,Tailors,Survivalists,Jewelers | N/A | 4 | 1 Leather |  |
| Leather Wolfskin Hood - Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Black |  |
| Leather Wolfskin Hood - Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Brown |  |
| Leather Wolfskin Hood - Dark Trimmed Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Leather Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Leather Wolfskin Hood - Dark Trimmed White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Leather Wolfskin Hood - Light Trimmed Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Leather Wolfskin Hood - Light Trimmed Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Leather Wolfskin Hood - Light Trimmed White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Leather Wolfskin Hood - Noble Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Noble Black |  |
| Leather Wolfskin Hood - Noble Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Noble Brown |  |
| Leather Wolfskin Hood - Noble White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Noble White |  |
| Leather Wolfskin Hood - Ornate Black | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Ornate Black |  |
| Leather Wolfskin Hood - Ornate Brown | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Leather Wolfskin Hood - Ornate White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - Ornate White |  |
| Leather Wolfskin Hood - White | Craftsmanship | Smiths | N/A | 1 | 1 Leather Helmet 1 Wolfskin Hood - White |  |
| Leather: Dark | Craftsmanship | Smiths | N/A | 5 | 5 Ore: Iron 5 Leather |  |
| Leather: Dark | Craftsmanship | Smiths | N/A | 1 | 1 Ore: Iron 1 Leather |  |
| Leather: Red | Craftsmanship | Smiths | N/A | 1 | 2 Creep Cluster 1 Leather |  |
| Leather: Red | Craftsmanship | Smiths | N/A | 5 | 10 Creep Cluster 5 Leather |  |
| Linen Alik'r Boots - Dark | Craftsmanship | Smiths | N/A | 1 | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Alik'r Boots - Tan | Craftsmanship | Smiths | N/A | 1 | 1 Leather 3 Linen Cloth - Tan 2 Linen Thread |  |
| Linen Alik'r Garb - Red | Craftsmanship | Smiths | N/A | 1 | 1 Linen Cloth - Red 2 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Alik'r Garb - White | Craftsmanship | Smiths | N/A | 1 | 1 Leather 1 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Alik'r Hood - Blue | Craftsmanship | Smiths | N/A | 1 | 3 Linen Cloth - Blue 1 Linen Thread |  |
| Linen Alik'r Hood - Red | Craftsmanship | Smiths | N/A | 1 | 3 Linen Cloth - Red 1 Linen Thread |  |
| Lockpick | Cheap Tricks,Craftsmanship | Smiths,Thieves,Survivalists | Forge | 1 | 4 Fragment: Iron |  |
| Lockpick | Cheap Tricks,Craftsmanship | Smiths,Thieves,Survivalists | Forge | 5 | 1 Ingot: Iron |  |
| Mace of Molag Bal Replica | Daedric Smithing | Smiths | Forge | 1 | 1 Daedra Heart 3 Ingot: Ebony 2 Leather Strips | Daedra - The House of Horrors |
| Mail and Hide | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Jacket | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Leather Surcoat | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Linen Cloth - Black |  |
| Mail and Leathers | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Pauldroned Leather | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather 2 Hide Lace |  |
| Mail and Surcoat | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Tunic | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mammoth Bone Club |  | Smiths,Survivalists | N/A | 1 | 3 Leather Strips 1 Animal Bone (Enormous) | Animal Harvesting Skill Greater or Equal to 1 |
| Mammoth Bone Masterwork Club |  | Smiths,Survivalists | N/A | 1 | 3 Troll Fat 3 Hide Lace 1 Animal Bone (Enormous) | Animal Harvesting Skill Greater or Equal to 4 |
| Masque of Clavicus Vile Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | Daedra - A Daedras Best Friend |
| Mehrunes' Razor Replica | Daedric Smithing | Smiths | Forge | 1 | 1 Daedra Heart 1 Ingot: Steel 1 Ingot: Ebony 1 Leather Strips | Daedra - Pieces of the Past |
| Miraak's Sword Replica | Daedric Smithing | Smiths | Forge | 1 | 1 Daedra Heart 2 Ingot: Ebony 1 Netch Leather | Killed Miraak |
| Nightingale Armor | Advanced Light Smithing | Smiths | N/A | 1 | 1 Void Salts 6 Leather Strips 5 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Blade | Daedric Smithing | Smiths | Forge | 1 | 1 Void Salts 2 Ingot: Ebony 1 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Boots | Advanced Light Smithing | Smiths | N/A | 1 | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Bow | Daedric Smithing | Smiths | Forge | 1 | 1 Void Salts 3 Ingot: Ebony 2 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Gloves | Advanced Light Smithing | Smiths | N/A | 1 | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Hood | Advanced Light Smithing | Smiths | N/A | 1 | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nordic Battleaxe | Nordic Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 3 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Cuirass - Black | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cave Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Nordic Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Snow Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Nordic Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Dagger | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 1 Leather Strips 1 Ingot: Galatite |  |
| Nordic Gauntlets - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Black | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Greatsword | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Bow | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Crossbow | Nordic Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Quicksilver |  |
| Nordic Helmet - Black | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 1 Leather Strips 1 Leather 3 Ingot: Galatite |  |
| Nordic Mace | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Shield - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Black | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Black | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Sword | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 1 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | Nordic Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Warhammer | Nordic Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Orichalcum 3 Leather Strips 4 Ingot: Galatite |  |
| Oiled Mail and Hide | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Flammable Oil |  |
| Oiled Mail and Jacket | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Tunic | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Orcish Battleaxe | Orcish Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 3 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Boots | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Cuirass | Orcish Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Corundum 5 Ingot: Orichalcum 4 Leather Strips 2 Leather |  |
| Orcish Dagger | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Gauntlets | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 2 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Greatsword | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Heavy Bow | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | Orcish Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Helmet | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Orichalcum 1 Leather Strips 1 Leather |  |
| Orcish Hunting Knife | Orcish Blacksmithing | Smiths,Survivalists | Forge | 1 | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips 1 Fragment: Bone |  |
| Orcish Mace | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Corundum 4 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Sword | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 2 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish War Axe | Orcish Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Steel 2 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Warhammer | Orcish Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 4 Ingot: Orichalcum 3 Leather Strips |  |
| Orichalc Circlet | Orcish Blacksmithing | Jewelers,Smiths | Forge | 1 | 1 Ingot: Orichalcum |  |
| Robed Mail | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Brown 4 Linen Thread |  |
| Rueful Axe Replica | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Silver 4 Ingot: Steel 3 Leather Strips | Daedra - A Daedras Best Friend |
| Savior's Hide Replica | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Cave Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Snow Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Scaled Boots | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather |  |
| Scaled Boots | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Boots | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Bracers | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Cuirass | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate 1 Goat Horns |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Smiths | Forge | 1 | 1 Pelt: Sabre Cat 1 Pelt: Goat 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Goat Horns |  |
| Scaled Helmet | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Scaled Helmet | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Shellbug Helmet | Ebony Blacksmithing | Smiths | Forge | 1 | 1 Ingot: Ebony 1 Leather Strips 1 Leather 2 Shellbug Chitin |  |
| Shield of Ysgramor Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 4 Ingot: Ebony 2 Leather Strips 1 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Shrouded Boots | Craftsmanship | Smiths | N/A | 1 | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl - Maskless | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cuirass | Craftsmanship | Smiths | N/A | 1 | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cuirass | Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 5 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Gloves | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Hand Wraps | Craftsmanship | Smiths | N/A | 1 | 2 Silk Thread 1 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Robes | Craftsmanship | Smiths | N/A | 1 | 4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Shoes | Craftsmanship | Smiths | N/A | 1 | 2 Silk Thread 2 Silk Cloth - Black | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Sleeveless Cuirass | Craftsmanship | Smiths | N/A | 1 | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Supple Boots | Advanced Light Smithing | Smiths | N/A | 1 | 3 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 3 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl - Maskless | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 3 Leather: Dark | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Gloves | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 1 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Veil | Craftsmanship | Smiths,Tailors | N/A | 1 | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Boots | Craftsmanship | Smiths | N/A | 1 | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl - Maskless | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cuirass | Craftsmanship | Smiths | N/A | 1 | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Gloves | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Silver Battlestaff | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Silver 2 Ingot: Steel 1 Gem: Amethyst |  |
| Silver Circlet | Craftsmanship | Jewelers,Smiths | Forge | 1 | 1 Ingot: Silver |  |
| Silver Greatsword | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips |  |
| Silver Necklace | Craftsmanship | Jewelers,Smiths | Forge | 1 | 4 Fragment: Silver |  |
| Silver Necklace (5) | Craftsmanship | Jewelers,Smiths | Forge | 1 | 1 Ingot: Silver |  |
| Silver Ring | Craftsmanship | Jewelers,Smiths | Forge | 1 | 2 Fragment: Silver |  |
| Silver Ring (10) | Craftsmanship | Jewelers,Smiths | Forge | 1 | 1 Ingot: Silver |  |
| Silver Sword | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Silver 2 Ingot: Steel 1 Leather Strips |  |
| Skyforge Steel Aegis | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Wood 2 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Battleaxe | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Dagger | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Greatsword | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Heavy Bow | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Wood 3 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Mace | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Sword | Advanced Blacksmithing | Smiths | Forge | 1 | 1 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel War Axe | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Warhammer | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Leather Strips 5 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Snow Elf Boots | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Circlet | Advanced Light Smithing | Smiths | Forge | 1 | 1 Snow Elf Crown | DawnGuard - Touching the Sky Complete |
| Snow Elf Crown | Advanced Light Smithing | Smiths | Forge | 1 | 3 Ingot: Moonstone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Cuirass | Advanced Light Smithing | Smiths | Forge | 1 | 5 Ingot: Moonstone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Gauntlets | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Spellbreaker Replica | Orcish Blacksmithing,Advanced Blacksmithing | Smiths | Forge | 1 | 1 Soul Gem: Grand 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Dwarven 2 Ingot: Calcinium | Daedra - The Only Cure Complete |
| Stalhrim Battleaxe | Stalhrim Smithing | Smiths | Forge | 1 | 3 Leather Strips 1 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battlestaff | Stalhrim Smithing | Smiths | Forge | 1 | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Dagger | Stalhrim Smithing | Smiths | Forge | 1 | 1 Leather Strips 1 Ingot: Galatite 1 Stalhrim | A New Source of Stalhrim |
| Stalhrim Greatsword | Stalhrim Smithing | Smiths | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Boots | Stalhrim Smithing | Smiths | Forge | 1 | 2 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Crossbow | Stalhrim Smithing | Smiths | Forge | 1 | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Cuirass | Stalhrim Smithing | Smiths | Forge | 1 | 4 Leather Strips 2 Leather 2 Ingot: Galatite 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Gauntlets | Stalhrim Smithing | Smiths | Forge | 1 | 2 Leather Strips 1 Leather 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | Stalhrim Smithing | Smiths | Forge | 1 | 1 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Boots | Stalhrim Smithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Bow | Stalhrim Smithing | Smiths | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Cuirass | Stalhrim Smithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Gauntlets | Stalhrim Smithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Helmet | Stalhrim Smithing | Smiths | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Shield | Stalhrim Smithing | Smiths | Forge | 1 | 2 Ingot: Quicksilver 2 Leather Strips 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Mace | Stalhrim Smithing | Smiths | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Sword | Stalhrim Smithing | Smiths | Forge | 1 | 1 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim War Axe | Stalhrim Smithing | Smiths | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Warhammer | Stalhrim Smithing | Smiths | Forge | 1 | 3 Leather Strips 2 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Steel Battleaxe | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Battlestaff | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 4 Wood 2 Leather Strips |  |
| Steel Bearskin Hood - Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Black |  |
| Steel Bearskin Hood - Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Brown |  |
| Steel Bearskin Hood - Ornate Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Ornate Black |  |
| Steel Bearskin Hood - Ornate Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Ornate Brown |  |
| Steel Bearskin Hood - Ornate White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Ornate White |  |
| Steel Bearskin Hood - Trimmed Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Trimmed Black |  |
| Steel Bearskin Hood - Trimmed Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Steel Bearskin Hood - Trimmed White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - Trimmed White |  |
| Steel Bearskin Hood - White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Bearskin Hood - White |  |
| Steel Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Ice Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Braced Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 4 Hide Lace 2 Fur Plate |  |
| Steel Bracers | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Ice Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Dagger | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Steel 1 Leather Strips |  |
| Steel Furred Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Furred Plate Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Ice Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Greatsword | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips |  |
| Steel Greaves | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Heavy Crossbow | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 3 Wood 2 Hide Lace |  |
| Steel Helmet | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet - White | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet - White | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Ice Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Horned Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Steel Horned Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Hunting Knife | Craftsmanship | Smiths,Survivalists | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Fragment: Bone |  |
| Steel Mace | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Pauldroned Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Wolf 5 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Pauldroned Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Pauldroned Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass - White | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Plate Boots | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Cuirass | Advanced Blacksmithing | Smiths | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Steel Plate Gauntlets | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Helmet | Advanced Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather |  |
| Steel Scimitar | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips |  |
| Steel Shield | Craftsmanship | Smiths | Forge | 1 | 4 Ingot: Steel 2 Wood 2 Leather Strips |  |
| Steel Sword | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 1 Leather Strips |  |
| Steel War Axe | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Warhammer | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Wolfskin Hood - Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Black |  |
| Steel Wolfskin Hood - Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Brown |  |
| Steel Wolfskin Hood - Dark Trimmed Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Steel Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Steel Wolfskin Hood - Dark Trimmed White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Steel Wolfskin Hood - Light Trimmed Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Steel Wolfskin Hood - Light Trimmed Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Steel Wolfskin Hood - Light Trimmed White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Steel Wolfskin Hood - Noble Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Noble Black |  |
| Steel Wolfskin Hood - Noble Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Noble Brown |  |
| Steel Wolfskin Hood - Noble White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Noble White |  |
| Steel Wolfskin Hood - Ornate Black | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Ornate Black |  |
| Steel Wolfskin Hood - Ornate Brown | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Steel Wolfskin Hood - Ornate White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - Ornate White |  |
| Steel Wolfskin Hood - White | Craftsmanship | Smiths | N/A | 1 | 1 Steel Helmet 1 Wolfskin Hood - White |  |
| Stone Hatchet | Craftsmanship | Smiths,Survivalists | N/A | 1 | 2 Deadwood 1 Sharp Rock |  |
| Stone Hatchet | Craftsmanship | Smiths,Survivalists | N/A | 1 | 1 Wood 1 Sharp Rock |  |
| Stone Hunting Knife |  | Smiths,Survivalists | N/A | 1 | 1 Sharp Rock 1 Bone Hunting Knife | Animal Harvesting Skill Greater or Equal to 1 |
| Stormcloak General Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Stormcloak Heavy Crossbow | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Stormcloak Heavy Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Light Cuirass | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Officer Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Bracers | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cave Bear 3 Ingot: Steel 4 Leather Strips 4 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Helmet | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cave Bear 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Sleeved Heavy Cuirass | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 5 Leather | Civil War - Joined Stormcloaks |
| Studded Cuirass | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Elk 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Iron 4 Leather Strips 4 Leather 2 Fur Plate |  |
| Studded Furred Cuirass | Craftsmanship | Smiths | Forge | 1 | 4 Leather 4 Hide Lace 2 Fur Plate |  |
| Tanning Rack | Craftsmanship | Tailors,Survivalists,Builders,Smiths | N/A | 1 | 3 Wood 2 Hide Lace |  |
| Tanning Rack | Craftsmanship | Tailors,Survivalists,Builders,Smiths | N/A | 1 | 3 Wood 1 Leather Strips |  |
| Thieves Guild Boots | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Boots - Grey | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cowl | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cowl - Grey | Craftsmanship | Smiths | N/A | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cuirass | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cuirass - Grey | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Gloves | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Gloves - Grey | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Hood | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Hood - Grey | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots | Advanced Light Smithing | Smiths | N/A | 1 | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots - Grey | Advanced Light Smithing | Smiths | N/A | 1 | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass | Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass - Grey | Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves - Grey | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Hood | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Hood - Grey | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Sleeveless Cuirass - Grey | Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Light Crossbow | Advanced Blacksmithing | Smiths | Forge | 1 | 2 Ingot: Steel 2 Ingot: Corundum 2 Wood 1 Leather: Dark 4 Hide Lace |  |
| Thieves Guild Master's Boots | Advanced Light Smithing | Smiths | N/A | 1 | 3 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cowl | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cuirass | Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 8 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Gloves | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Hood | Advanced Light Smithing | Smiths | N/A | 1 | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Sleeveless Cuirass | Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 6 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Sleeveless Cuirass | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Cuirass - Grey | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Improved Cuirass | Advanced Light Smithing | Smiths | N/A | 1 | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Vampire Boots | Advanced Light Smithing | Smiths | Forge | 1 | 1 Ingot: Iron 3 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Dark | Advanced Light Smithing | Smiths | N/A | 1 | 5 Leather Strips 5 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Grey | Advanced Light Smithing | Smiths | N/A | 1 | 5 Leather Strips 5 Leather 1 Dye - Grey | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Red | Advanced Light Smithing | Smiths | N/A | 1 | 5 Leather Strips 5 Leather: Red | DawnGuard - Prophet (Vampire) Complete |
| Vampire Gauntlets | Advanced Light Smithing | Smiths | Forge | 1 | 1 Ingot: Iron 2 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Royal Cuirass | Advanced Light Smithing | Smiths | Forge | 1 | 2 Ingot: Steel 5 Leather Strips 6 Leather: Dark | DawnGuard - Prophet (Vampire) Complete,DawnGuard - Killed Harkon |
| Volendrung Replica | Daedric Smithing | Smiths | Forge | 1 | 1 Daedra Heart 4 Ingot: Ebony 3 Leather Strips | Daedra - The Cursed Tribe Complete |
| Wolf Boots | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Boots | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cave Bear 3 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 2 Leather 6 Fur Plate | Companions - Proving Honor Complete |
| Wolf Cuirass | Craftsmanship | Smiths | Forge | 1 | 2 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather | Companions - Proving Honor Complete |
| Wolf Gauntlets | Craftsmanship | Smiths | Forge | 1 | 1 Pelt: Cave Bear 2 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Gauntlets | Craftsmanship | Smiths | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Helmet | Craftsmanship | Smiths | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Shield | Craftsmanship | Smiths | Forge | 1 | 5 Ingot: Steel 2 Leather Strips | Companions - Proving Honor Complete |
| Wooden Battlestaff | Craftsmanship | Smiths,Survivalists | N/A | 1 | 5 Wood |  |
| Wooden Fishing Rod | Craftsmanship | Smiths,Survivalists,Alchemists | Forge | 1 | 1 Ingot: Iron 1 Wood | Fishing - Unlocked Dwarven Rod |
| Wooden Heavy Bow | Craftsmanship | Smiths,Survivalists | N/A | 1 | 4 Hide Lace 2 Deadwood |  |
| Wooden Heavy Bow | Craftsmanship | Smiths,Survivalists | N/A | 1 | 3 Wood 2 Hide Lace |  |
| Wooden Light Bow | Craftsmanship | Smiths,Survivalists | N/A | 1 | 2 Wood 2 Hide Lace |  |
| Wooden Light Crossbow | Craftsmanship | Smiths | Forge | 1 | 1 Ingot: Iron 4 Wood 2 Hide Lace |  |
| Wooden Sword | Craftsmanship | Smiths,Survivalists | N/A | 1 | 2 Wood |  |
| Wuuthrad Replica | Ebony Blacksmithing | Smiths | Forge | 1 | 3 Ingot: Ebony 3 Leather Strips 2 Ingot: Galatite | Companions - Glory of the Dead Complete |


</div>
