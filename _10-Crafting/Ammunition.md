---
title: Ammunition Recipes
layout: default
nav_order: 3
has_children: false
description: Ammunition crafting recipes and materials.
---

## Arrow and Projectile Crafting

Craft arrows and bolts for ranged weapons at a **Blacksmith Forge**. Essential for archers and crossbow users.

**Available crafting includes:**
- Arrow creation (iron, steel, daedric, ebony, etc.)
- Bolt crafting for crossbows
- Specialized projectiles

**Tip:** Archers should regularly craft ammunition to maintain a steady supply. Ammunition is lightweight and can be crafted quickly for good XP.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/_10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- Quantity produced
- All perks and toolkit requirements
- Complete list of items required
- Additional requirements and conditions

Use the search bar and filters below to find specific ammunition recipes by toolkit or perks needed.

---

## Ammunition Recipes Data

<style>
#ammunition-tooltip {
  background-color: #2a2a2a;
  border: 2px solid #50098a;
  border-radius: 4px;
  padding: 10px;
  color: #e6e6e6;
  font-size: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.5);
  max-width: 300px;
  word-wrap: break-word;
}

#ammunition-tooltip div {
  margin: 4px 0;
}

#ammunition-tooltip strong {
  color: #f77ef1;
}

.ammunition-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initAmmunitiontooltips() {
  const table = document.querySelector('.ammunition-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showAmmunitiontooltip(e, row));
    itemCell.addEventListener('mousemove', updateAmmunitiontooltipPosition);
    itemCell.addEventListener('mouseleave', hideAmmunitiontooltip);
  });
}

function showAmmunitiontooltip(event, row) {
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
  
  let tooltip = document.getElementById('ammunition-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'ammunition-tooltip';
    tooltip.className = 'ammunition-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Item:</strong> ' + data.itemName + '</div>' +
    '<div><strong>Qty Made:</strong> ' + data.qtyMade + '</div>' +
    '<div><strong>Perks Needed:</strong> ' + data.perksNeeded + '</div>' +
    '<div><strong>Toolkits Required:</strong> ' + data.toolkitsRequired + '</div>' +
    '<div><strong>Proximity:</strong> ' + data.proximity + '</div>' +
    '<div><strong>Items Required:</strong> ' + data.itemsRequired + '</div>' +
    '<div><strong>Additional Requirements:</strong> ' + data.additionalRequirements + '</div>';
  tooltip.style.display = 'block';
  updateAmmunitiontooltipPosition(event);
}

function updateAmmunitiontooltipPosition(event) {
  const tooltip = document.getElementById('ammunition-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideAmmunitiontooltip() {
  const tooltip = document.getElementById('ammunition-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initAmmunitionFilters() {
  const table = document.querySelector('.ammunition-table table');
  if (!table) {
    console.warn('Ammunition table not found');
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
      
      if (toolkitText && toolkitText !== 'N/A') {
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
  
  const toolkitFilter = document.getElementById('ammunitionToolkitFilter');
  const perksFilter = document.getElementById('ammunitionPerksFilter');
  
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
  
  document.getElementById('ammunitionSearch').addEventListener('input', filterAmmunitionTable);
  document.getElementById('ammunitionToolkitFilter').addEventListener('change', filterAmmunitionTable);
  document.getElementById('ammunitionPerksFilter').addEventListener('change', filterAmmunitionTable);
  initAmmunitiontooltips();
  updateFilterCountAmmunition();
}

function filterAmmunitionTable() {
  const searchTerm = document.getElementById('ammunitionSearch').value.toLowerCase();
  const toolkitFilter = document.getElementById('ammunitionToolkitFilter').value;
  const perksFilter = document.getElementById('ammunitionPerksFilter').value;
  
  const table = document.querySelector('.ammunition-table table');
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
  
  updateFilterCountAmmunition();
  initAmmunitiontooltips();
}

function updateFilterCountAmmunition() {
  const table = document.querySelector('.ammunition-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountAmmunition');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearAmmunitionFilters() {
  document.getElementById('ammunitionSearch').value = '';
  document.getElementById('ammunitionToolkitFilter').value = '';
  document.getElementById('ammunitionPerksFilter').value = '';
  filterAmmunitionTable();
}

initAmmunitionFilters();

});
</script>

<div class="ammunition-controls">
  <input type="text" id="ammunitionSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="ammunitionToolkitFilter">
    <option value="">All Toolkits</option>
  </select>
  <select id="ammunitionPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersAmmunition" onclick="clearAmmunitionFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-ammunition" id="filterResultCountAmmunition"></div>

<div class="ammunition-table" markdown="1">

| Produced Item Name | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---|:---|:---|:---|
| Arrow: Ancient Nordic | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Ancient Nordic Hero | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Wood | Currently Uncraftable - Global Disabled |
| Arrow: Bone (Crude) | 5 | Craftsmanship | Smiths,Survivalists | N/A | 1 Wood 3 Fragment: Bone | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Bone (Crude) | 5 | Craftsmanship | Smiths,Survivalists | N/A | 3 Fragment: Bone 1 Animal Bone (Large) | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Daedric | 150 | Daedric Smithing | Smiths | Forge | 150 Arrow: Ebony 1 Soul Gem: Black 1 Daedra Heart |  |
| Arrow: Daedric Fire | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Fire Salts |  |
| Arrow: Daedric Ice | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Frost Salts |  |
| Arrow: Daedric Shock | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Void Salts |  |
| Arrow: Dragonbone | 15 | Draconic Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Wood |  |
| Arrow: Dragonbone Fire | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Ice | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Shock | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Arrow: Dragonbone |  |
| Arrow: Dwarven | 15 | Dwarven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Arrow: Dwarven Fire | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Fire Salts |  |
| Arrow: Dwarven Ice | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Frost Salts |  |
| Arrow: Dwarven Shock | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Void Salts |  |
| Arrow: Ebony | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Arrow: Ebony Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Fire Salts |  |
| Arrow: Ebony Ice | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Frost Salts |  |
| Arrow: Ebony Shock | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Void Salts |  |
| Arrow: Elven | 15 | Elven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Arrow: Elven Fire | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Fire Salts |  |
| Arrow: Elven Ice | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Frost Salts |  |
| Arrow: Elven Shock | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Void Salts |  |
| Arrow: Falmer | 24 | Craftsmanship | Smiths | Forge | 1 Chaurus Chitin 1 Wood |  |
| Arrow: Forsworn | 24 | Craftsmanship | Smiths,Survivalists | N/A | 1 Doe Antlers 1 Wood |  |
| Arrow: Glass | 15 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Wood |  |
| Arrow: Glass Fire | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Fire Salts |  |
| Arrow: Glass Ice | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Frost Salts |  |
| Arrow: Glass Shock | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Void Salts |  |
| Arrow: Iron | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Iron Fire | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Fire Salts |  |
| Arrow: Iron Ice | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Frost Salts |  |
| Arrow: Iron Shock | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Void Salts |  |
| Arrow: Nordic | 15 | Nordic Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Galatite |  |
| Arrow: Nordic Fire | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Frost | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Shock | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Arrow: Nordic |  |
| Arrow: Orcish | 15 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Arrow: Orcish Fire | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Fire Salts |  |
| Arrow: Orcish Ice | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Frost Salts |  |
| Arrow: Orcish Shock | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Void Salts |  |
| Arrow: Silver | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Arrow: Silver Fire | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Arrow: Silver |  |
| Arrow: Silver Ice | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Arrow: Silver |  |
| Arrow: Silver Shock | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Void Salts 15 Arrow: Silver |  |
| Arrow: Skyforge Steel | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Arrow: Stalhrim | 15 | Stalhrim Smithing | Smiths | Forge | 1 Wood 1 Stalhrim | A New Source of Stalhrim |
| Arrow: Stalhrim Fire | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Frost | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Shock | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Void Salts 15 Arrow: Stalhrim |  |
| Arrow: Steel | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Arrow: Steel Fire | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Fire Salts |  |
| Arrow: Steel Ice | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Frost Salts |  |
| Arrow: Steel Shock | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Void Salts |  |
| Arrow: Stone (Crude) | 5 | Craftsmanship | Smiths,Survivalists | N/A | 1 Wood 1 Sharp Rock | Animal Harvesting Skill Less or Equal to 2 |
| Bolt: Ancient Nordic Hero | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 1 Wood |  |
| Bolt: Ancient Nordic Hero Fire | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Frost | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Shock | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Daedric | 150 | Daedric Smithing | Smiths | Forge | 1 Soul Gem: Black 1 Daedra Heart 150 Bolt: Ebony |  |
| Bolt: Daedric Fire | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Ice | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Shock | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Void Salts 15 Bolt: Daedric |  |
| Bolt: Dark Brotherhood | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Dark Brotherhood Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Frost | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Shock | 25 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dawnguard | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Wood |  |
| Bolt: Dawnguard Fire | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Frost | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Shock | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Dawnguard |  |
| Bolt: Dragonbone | 15 | Draconic Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Wood |  |
| Bolt: Dragonbone Fire | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Ice | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Shock | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dragonbone |  |
| Bolt: Dwarven | 15 | Dwarven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Bolt: Dwarven Fire | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Fireburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Fire Schematic |
| Bolt: Dwarven Ice | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Iceburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Ice Schematic |
| Bolt: Dwarven Shock | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Shockburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Shock Schematic |
| Bolt: Ebony | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Ebony Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Ice | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Shock | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Ebony |  |
| Bolt: Elven | 15 | Elven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Bolt: Elven Fire | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Elven |  |
| Bolt: Elven Ice | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Elven |  |
| Bolt: Elven Shock | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Elven |  |
| Bolt: Glass | 15 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Wood |  |
| Bolt: Glass Fire | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Glass |  |
| Bolt: Glass Ice | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Glass |  |
| Bolt: Glass Shock | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Glass |  |
| Bolt: Imperial | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Imperial Fire | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Frost | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Shock | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Imperial |  |
| Bolt: Iron | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Bolt: Iron Fire | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Iron |  |
| Bolt: Iron Ice | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Iron |  |
| Bolt: Iron Shock | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Iron |  |
| Bolt: Orcish | 15 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Bolt: Orcish Fire | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Ice | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Shock | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Orcish |  |
| Bolt: Silver | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Bolt: Silver Fire | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Silver |  |
| Bolt: Silver Ice | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Silver |  |
| Bolt: Silver Shock | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Silver |  |
| Bolt: Stalhrim | 15 | Stalhrim Smithing | Smiths | Forge | 1 Stalhrim | A New Source of Stalhrim |
| Bolt: Stalhrim Fire | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Frost | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Shock | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Void Salts 15 Bolt: Stalhrim |  |
| Bolt: Steel | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Steel Fire | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Steel |  |
| Bolt: Steel Ice | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Steel |  |
| Bolt: Steel Shock | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Steel |  |
| Bolt: Stormcloak | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Stormcloak Fire | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Frost | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Shock | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Stormcloak |  |
| Bolt: Thieves Guild | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Thieves Guild Fire | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Frost | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Shock | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Thieves Guild |  |


</div>
