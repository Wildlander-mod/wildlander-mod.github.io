---
title: Raw Materials
layout: default
nav_order: 11
has_children: false
description: Raw materials and resources.
---

## Ore Processing and Hide Tanning

Process raw ores into usable ingots and tan animal hides into leather and fur plates. Access these recipes at a **Smelter** or **Tanning Rack** workstation. Most reciepes are available in player crafting.

**Available crafting includes:**
- Ore smelting into ingots (iron, steel, ebony, orichalcum, etc.)
- Hide tanning into leather
- Fur tanning into fur plates
- Metal and hide processing

**Tip:** Ore smelting and hide tanning are essential for blacksmithing and armor crafting. These recipes are easy to execute and provide good XP returns.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- Quantity produced
- Perks and toolkit requirements
- All materials needed
- Workstation location

Use the search bar and filters below to find specific recipes by toolkit or perks needed.

---

## Raw Materials Data

<style>
#raw-materials-tooltip {
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

#raw-materials-tooltip div {
  margin: 4px 0;
}

#raw-materials-tooltip strong {
  color: #f77ef1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initRawMaterialstooltips() {
  const table = document.querySelector('.raw-materials-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showRawMaterialstooltip(e, row));
    itemCell.addEventListener('mousemove', updateRawMaterialstooltipPosition);
    itemCell.addEventListener('mouseleave', hideRawMaterialstooltip);
  });
}

function showRawMaterialstooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    qtyMade: cells[1]?.textContent || '',
    perksNeeded: cells[2]?.textContent || '',
    proximity: cells[3]?.textContent || '',
    itemsRequired: cells[4]?.textContent || ''
  };
  
  let tooltip = document.getElementById('raw-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'raw-tooltip';
    tooltip.className = 'raw-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Qty Made:</strong> ${data.qtyMade}</div>
    <div><strong>Perks Needed:</strong> ${data.perksNeeded}</div>
    <div><strong>Proximity:</strong> ${data.proximity}</div>
    <div><strong>Items Required:</strong> ${data.itemsRequired}</div>
  `;
  tooltip.style.display = 'block';
  updateRawMaterialstooltipPosition(event);
}

function updateRawMaterialstooltipPosition(event) {
  const tooltip = document.getElementById('raw-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideRawMaterialstooltip() {
  const tooltip = document.getElementById('raw-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initRawMaterialsFilters() {
  const table = document.querySelector('.raw-materials-table table');
  if (!table) {
    console.warn('Raw Materials table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const perks = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 3) {
      const perksText = cells[2].textContent.trim();
      
      if (perksText) {
        perksText.split(',').forEach(perk => {
          const trimmed = perk.trim();
          if (trimmed) perks.add(trimmed);
        });
      }
    }
  });
  
  const perksFilter = document.getElementById('rawPerksFilter');
  
  Array.from(perks).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perksFilter.appendChild(option);
  });
  
  document.getElementById('rawMaterialsSearch').addEventListener('input', filterRawMaterialsTable);
  document.getElementById('rawPerksFilter').addEventListener('change', filterRawMaterialsTable);
  initRawMaterialstooltips();
  updateFilterCountRaw();
}

function filterRawMaterialsTable() {
  const searchTerm = document.getElementById('rawMaterialsSearch').value.toLowerCase();
  const perksFilter = document.getElementById('rawPerksFilter').value;
  
  const table = document.querySelector('.raw-materials-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[4]?.textContent.toLowerCase() || '';
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const perksCellText = cells[2]?.textContent.trim() || '';
    const perksList = perksCellText.split(',').map(p => p.trim());
    const perksMatch = !perksFilter || perksList.includes(perksFilter);
    
    const isVisible = searchMatch && perksMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountRaw();
  initRawMaterialstooltips();
}

function updateFilterCountRaw() {
  const table = document.querySelector('.raw-materials-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountRaw');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearRawMaterialsFilters() {
  document.getElementById('rawMaterialsSearch').value = '';
  document.getElementById('rawPerksFilter').value = '';
  filterRawMaterialsTable();
}

initRawMaterialsFilters();

});
</script>

<div class="raw-materials-controls">
  <input type="text" id="rawMaterialsSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="rawPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersRaw" onclick="clearRawMaterialsFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-raw" id="filterResultCountRaw"></div>

<div class="raw-materials-table" markdown="1">

| Produced Item | Qty Made | Perks Needed | Proximity | Items Required |
|:---|:---:|:---|:---|:---|
| Building Glass | 3 | Glass Blacksmithing | Smelter | 4 Salt 1 Ingot: Malachite |
| Charcoal | 2 |  | Smelter | 1 Wooden Fishing Rod |
| Glass Bottle (Empty) | 1 | Craftsmanship | Smelter | 5 Building Glass |
| Ingot: Steel | 5 | Craftsmanship | Smelter | 100 Fragment: Steel |
| Ingot: Steel | 10 | Craftsmanship | Smelter | 200 Fragment: Steel |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Silver |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Silver |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Quicksilver |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Quicksilver |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 100 Fragment: Orichalcum |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 200 Fragment: Orichalcum |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 100 Fragment: Moonstone |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 200 Fragment: Moonstone |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 100 Fragment: Malachite |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 200 Fragment: Malachite |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 100 Fragment: Iron |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 200 Fragment: Iron |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Gold |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Gold |
| Ingot: Galatite | 5 | Craftsmanship | Smelter | 100 Fragment: Galatite |
| Ingot: Galatite | 10 | Craftsmanship | Smelter | 200 Fragment: Galatite |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 100 Fragment: Ebony |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 200 Fragment: Ebony |
| Ingot: Dwarven | 5 | Dwarven Blacksmithing | Smelter | 100 Fragment: Dwarven |
| Ingot: Dwarven | 10 | Dwarven Blacksmithing | Smelter | 200 Fragment: Dwarven |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 100 Fragment: Corundum |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 200 Fragment: Corundum |
| Ingot: Calcinium | 5 | Elven Blacksmithing | Smelter | 100 Fragment: Calcinium |
| Ingot: Calcinium | 10 | Elven Blacksmithing | Smelter | 200 Fragment: Calcinium |
| Ingot: Galatite | 1 | Craftsmanship | Smelter | 20 Fragment: Galatite |
| Ingot: Calcinium | 1 | Elven Blacksmithing | Smelter | 20 Fragment: Calcinium |
| Ingot: Steel | 1 | Craftsmanship | Smelter | 20 Fragment: Steel |
| Building Glass | 1 | Craftsmanship | Smelter | 20 Fragment: Building Glass |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Silver |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Quicksilver |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 20 Fragment: Orichalcum |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 20 Fragment: Moonstone |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 20 Fragment: Malachite |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 20 Fragment: Iron |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Gold |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 20 Fragment: Ebony |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 20 Fragment: Corundum |
| Charcoal | 3 |  | Smelter | 1 Iron Pickaxe |
| Kindling | 5 |  | Smelter | 1 Iron Woodcutter's Axe |
| Charcoal | 1 |  | Smelter | 1 Wooden Torch (Bright) |
| Charcoal | 2 |  | Smelter | 1 Wooden Lute |
| Charcoal | 1 |  | Smelter | 1 Wooden Flute |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | Smelter | 1 Any Dwarven scrap metal |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | Smelter | 20 Fragment: Dwarven |
| Ingot: Galatite | 6 | Craftsmanship | Smelter | 4 Ingot: Steel 2 Ingot: Quicksilver |
| Ingot: Galatite | 3 | Craftsmanship | Smelter | 2 Ingot: Steel 1 Ingot: Quicksilver |
| Ingot: Calcinium | 6 | Elven Blacksmithing | Smelter | 2 Ingot: Corundum 4 Ingot: Moonstone |
| Ingot: Calcinium | 3 | Elven Blacksmithing | Smelter | 1 Ingot: Corundum 2 Ingot: Moonstone |
| Charcoal | 1 |  | Smelter | 1 Arrow: Practice |
| Charcoal | 1 |  | Smelter | 1 Wooden Torch |
| Charcoal | 2 |  | Smelter | 1 Wooden Light Bow |
| Charcoal | 1 |  | Smelter | 1 Wooden Drum |
| Charcoal | 1 |  | Smelter | 1 Wooden Ladle |
| Charcoal | 1 |  | Smelter | 1 Wooden Spigot |
| Charcoal | 1 |  | Smelter | 1 Wooden Pitchfork |
| Charcoal | 1 |  | Smelter | 1 Iron Pitchfork |
| Charcoal | 2 |  | Smelter | 1 Wooden Well Bucket |
| Charcoal | 2 |  | Smelter | 1 Wooden Roped Bucket |
| Charcoal | 1 |  | Smelter | 1 Wooden Broom |
| Charcoal | 2 |  | Smelter | 1 Wooden Bellows |
| Charcoal | 1 |  | Smelter | 1 Wooden Plate |
| Charcoal | 1 |  | Smelter | 1 Wooden Bowl |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Silver |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Silver |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Silver |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Quicksilver |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Quicksilver |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Quicksilver |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 30 Ore: Orichalcum |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 15 Ore: Orichalcum |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 3 Ore: Orichalcum |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 30 Ore: Moonstone |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 15 Ore: Moonstone |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 3 Ore: Moonstone |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 30 Ore: Iron |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 30 Ore: Malachite |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 15 Ore: Malachite |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 3 Ore: Malachite |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 15 Ore: Iron |
| Ingot: Iron | 20 | Craftsmanship | Smelter | 60 Ore: Iron |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 3 Ore: Iron |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Gold |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Gold |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Gold |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 30 Ore: Ebony |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 15 Ore: Ebony |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 3 Ore: Ebony |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 30 Ore: Corundum |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 15 Ore: Corundum |
| Ingot: Corundum | 20 | Craftsmanship | Smelter | 60 Ore: Corundum |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 3 Ore: Corundum |
| Ingot: Steel | 10 | Craftsmanship | Smelter | 10 Ingot: Iron 10 Charcoal |
| Ingot: Steel | 50 | Craftsmanship | Smelter | 50 Ingot: Iron 50 Charcoal |
| Ingot: Steel | 25 | Craftsmanship | Smelter | 25 Ingot: Iron 25 Charcoal |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Silver |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Silver |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Quicksilver |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Quicksilver |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 50 Ore: Orichalcum |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 25 Ore: Orichalcum |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 50 Ore: Moonstone |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 25 Ore: Moonstone |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 50 Ore: Malachite |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 25 Ore: Malachite |
| Ingot: Iron | 20 | Craftsmanship | Smelter | 100 Ore: Iron |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 50 Ore: Iron |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 25 Ore: Iron |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Gold |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Gold |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 50 Ore: Ebony |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 25 Ore: Ebony |
| Ingot: Corundum | 20 | Craftsmanship | Smelter | 100 Ore: Corundum |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 50 Ore: Corundum |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 25 Ore: Corundum |
| Charcoal | 2 |  | Smelter | 1 Wooden Heavy Bow |
| Ingot: Galatite | 1 | Craftsmanship | Smelter | 14 Fragment: Steel 6 Fragment: Quicksilver |
| Ingot: Calcinium | 1 | Elven Blacksmithing | Smelter | 6 Fragment: Corundum 14 Fragment: Moonstone |
| Ingot: Steel | 1 | Craftsmanship | Smelter | 1 Ingot: Iron 1 Charcoal |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Silver |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Quicksilver |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 5 Ore: Orichalcum |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 5 Ore: Malachite |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 5 Ore: Moonstone |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Gold |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 5 Ore: Ebony |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 5 Ore: Corundum |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 5 Ore: Iron |
| Pelt: Horse (Fine) | 2 |  | Tanning Rack | 1 Pelt: Horse (Flawless) |
| Pelt: Goat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Goat (Flawless) |
| Pelt: Cow (Fine) | 2 |  | Tanning Rack | 1 Pelt: Cow (Flawless) |
| Pelt: Ice Wolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Ice Wolf (Flawless) |
| Pelt: Wolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Wolf (Flawless) |
| Pelt: Werewolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Werewolf (Flawless) |
| Pelt: Frost Troll (Fine) | 2 |  | Tanning Rack | 1 Pelt: Frost Troll (Flawless) |
| Pelt: Troll (Fine) | 2 |  | Tanning Rack | 1 Pelt: Troll (Flawless) |
| Pelt: Skeever (Fine) | 2 |  | Tanning Rack | 1 Pelt: Skeever (Flawless) |
| Pelt: Vale Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Vale Sabre Cat (Flawless) |
| Pelt: Snowy Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Flawless) |
| Pelt: Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Sabre Cat (Flawless) |
| Pelt: Mammoth Section (Fine) | 2 |  | Tanning Rack | 1 Pelt: Mammoth Section (Flawless) |
| Pelt: Snow Fox (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snow Fox (Flawless) |
| Pelt: Fox (Fine) | 2 |  | Tanning Rack | 1 Pelt: Fox (Flawless) |
| Pelt: Elk (Fine) | 2 |  | Tanning Rack | 1 Pelt: Elk (Flawless) |
| Pelt: Vale Deer (Fine) | 2 |  | Tanning Rack | 1 Pelt: Vale Deer (Flawless) |
| Pelt: Deer (Fine) | 2 |  | Tanning Rack | 1 Pelt: Deer (Flawless) |
| Pelt: Boar (Fine) | 2 |  | Tanning Rack | 1 Pelt: Boar (Flawless) |
| Pelt: Snow Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snow Bear (Flawless) |
| Pelt: Cave Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Cave Bear (Flawless) |
| Pelt: Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Bear (Flawless) |
| Pelt: Werewolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Fine) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Poor) |
| Pelt: Troll | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Fine) |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Troll |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Poor) |
| Pelt: Frost Troll | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Fine) |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Poor) |
| Pelt: Boar | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Fine) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Poor) |
| Hide Lace | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ruined |
| Pelt: Ice Wolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf (Fine) |
| Pelt: Wolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf (Fine) |
| Pelt: Skeever | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Skeever (Fine) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Skeever |
| Pelt: Snowy Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Fine) |
| Pelt: Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Fine) |
| Pelt: Mammoth Section | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Fine) |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section |
| Pelt: Horse | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Fine) |
| Pelt: Goat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Goat (Fine) |
| Pelt: Snow Fox | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Fine) |
| Pelt: Fox | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Fox (Fine) |
| Pelt: Elk | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Fine) |
| Pelt: Deer | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Fine) |
| Pelt: Cow | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Fine) |
| Pelt: Snow Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Fine) |
| Pelt: Cave Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Fine) |
| Pelt: Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Fine) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Ice Wolf (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Wolf (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Skeever (Poor) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Goat (Poor) |
| Hide Lace | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Fox (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Poor) |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Poor) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Poor) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Poor) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Poor) |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Boar |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Poor) |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Poor) |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Poor) |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Troll |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Poor) |
| Pelt: Vale Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Fine) |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |
| Pelt: Vale Deer | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Fine) |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Poor) |
| Leather | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Skeever |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf (Poor) |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf (Poor) |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Skeever (Poor) |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |
| Leather Strips | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Poor) |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat (Poor) |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Poor) |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Fox (Poor) |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Poor) |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Poor) |
| Leather Strips | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Poor) |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Poor) |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Poor) |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Poor) |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ruined |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Poor) |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat |
| Hide Lace | 4 | Craftsmanship | Tanning Rack | 1 Fur Plate |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Snow Fox |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Fox |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Bear |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Fox |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Leather |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Bear |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat |




