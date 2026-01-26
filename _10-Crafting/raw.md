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

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/_10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- Quantity produced
- Perks and toolkit requirements
- All materials needed
- Workstation location

Use the search bar and filters below to find specific recipes by toolkit or perks needed.

---

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
    toolkitsRequired: cells[3]?.textContent || '',
    proximity: cells[4]?.textContent || '',
    itemsRequired: cells[5]?.textContent || ''
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
    <div><strong>Toolkits Required:</strong> ${data.toolkitsRequired}</div>
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
  const toolkits = new Set();
  const perks = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 3) {
      const toolkitText = cells[3].textContent.trim();
      const perksText = cells[2].textContent.trim();
      
      if (toolkitText) toolkits.add(toolkitText);
      if (perksText) perks.add(perksText);
    }
  });
  
  const toolkitFilter = document.getElementById('rawToolkitFilter');
  const perksFilter = document.getElementById('rawPerksFilter');
  
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
  
  document.getElementById('rawMaterialsSearch').addEventListener('input', filterRawMaterialsTable);
  document.getElementById('rawToolkitFilter').addEventListener('change', filterRawMaterialsTable);
  document.getElementById('rawPerksFilter').addEventListener('change', filterRawMaterialsTable);
  initRawMaterialstooltips();
  updateFilterCountRaw();
}

function filterRawMaterialsTable() {
  const searchTerm = document.getElementById('rawMaterialsSearch').value.toLowerCase();
  const toolkitFilter = document.getElementById('rawToolkitFilter').value;
  const perksFilter = document.getElementById('rawPerksFilter').value;
  
  const table = document.querySelector('.raw-materials-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[5]?.textContent.toLowerCase() || '';
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const toolkitMatch = !toolkitFilter || cells[3]?.textContent.trim() === toolkitFilter;
    const perksMatch = !perksFilter || cells[2]?.textContent.trim() === perksFilter;
    
    const isVisible = searchMatch && toolkitMatch && perksMatch;
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
  document.getElementById('rawToolkitFilter').value = '';
  document.getElementById('rawPerksFilter').value = '';
  filterRawMaterialsTable();
}

initRawMaterialsFilters();

});
</script>

<div class="raw-materials-controls">
  <input type="text" id="rawMaterialsSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="rawToolkitFilter">
    <option value="">All Toolkits</option>
  </select>
  <select id="rawPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersRaw" onclick="clearRawMaterialsFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-raw" id="filterResultCountRaw"></div>

<div class="raw-materials-table" markdown="1">| Produced Item | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required |
|:---|:---:|:---|:---|:---|:---|
| Building Glass | 1 | Craftsmanship | Builders,Alchemists | Smelter | 20 Fragment: Building Glass |
| Charcoal | 1 |  | N/A | Smelter | 1 Arrow: Practice |
| Charcoal | 5 |  | N/A | Smelter | 1 Toolkit: Tailor's |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Broom |
| Charcoal | 5 |  | N/A | Smelter | 1 Toolkit: Brewer's |
| Charcoal | 2 |  | N/A | Smelter | 1 Wooden Bellows |
| Charcoal | 2 |  | N/A | Smelter | 1 Wooden Heavy Bow |
| Charcoal | 2 |  | N/A | Smelter | 1 Wooden Well Bucket |
| Charcoal | 2 |  | N/A | Smelter | 1 Wooden Roped Bucket |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Spigot |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Drum |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Torch (Bright) |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Flute |
| Charcoal | 5 |  | N/A | Smelter | 1 Toolkit: Survivalist's |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Bowl |
| Charcoal | 3 |  | N/A | Smelter | 1 Iron Pickaxe |
| Charcoal | 2 |  | N/A | Smelter | 1 Wooden Lute |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Pitchfork |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Ladle |
| Charcoal | 2 |  | N/A | Smelter | 1 Wooden Light Bow |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Plate |
| Charcoal | 5 |  | N/A | Smelter | 1 Toolkit: Alchemist's |
| Charcoal | 1 |  | N/A | Smelter | 1 Iron Pitchfork |
| Charcoal | 1 |  | N/A | Smelter | 1 Wooden Torch |
| Charcoal | 2 |  | N/A | Smelter | 1 Wooden Fishing Rod |
| Ingot: Calcinium | 1 | Elven Blacksmithing | N/A | Smelter | 6 Fragment: Corundum 14 Fragment: Moonstone |
| Ingot: Calcinium | 6 | Elven Blacksmithing | N/A | Smelter | 2 Ingot: Corundum 4 Ingot: Moonstone |
| Ingot: Calcinium | 1 | Elven Blacksmithing | N/A | Smelter | 20 Fragment: Calcinium |
| Ingot: Calcinium | 5 | Elven Blacksmithing | N/A | Smelter | 100 Fragment: Calcinium |
| Ingot: Calcinium | 3 | Elven Blacksmithing | N/A | Smelter | 1 Ingot: Corundum 2 Ingot: Moonstone |
| Ingot: Calcinium | 10 | Elven Blacksmithing | N/A | Smelter | 200 Fragment: Calcinium |
| Ingot: Corundum | 10 | Craftsmanship | N/A | Smelter | 30 Ore: Corundum |
| Ingot: Corundum | 20 | Craftsmanship | N/A | Smelter | 60 Ore: Corundum |
| Ingot: Corundum | 5 | Craftsmanship | N/A | Smelter | 25 Ore: Corundum |
| Ingot: Corundum | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Corundum |
| Ingot: Corundum | 1 | Craftsmanship | N/A | Smelter | 3 Ore: Corundum |
| Ingot: Corundum | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Corundum |
| Ingot: Corundum | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Corundum |
| Ingot: Corundum | 20 | Craftsmanship | N/A | Smelter | 100 Ore: Corundum |
| Ingot: Corundum | 1 | Craftsmanship | N/A | Smelter | 5 Ore: Corundum |
| Ingot: Corundum | 10 | Craftsmanship | N/A | Smelter | 50 Ore: Corundum |
| Ingot: Corundum | 5 | Craftsmanship | N/A | Smelter | 15 Ore: Corundum |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | N/A | Smelter | 1 Any Dwarven scrap metal |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | N/A | Smelter | 20 Fragment: Dwarven |
| Ingot: Dwarven | 5 | Dwarven Blacksmithing | N/A | Smelter | 100 Fragment: Dwarven |
| Ingot: Dwarven | 10 | Dwarven Blacksmithing | N/A | Smelter | 200 Fragment: Dwarven |
| Ingot: Ebony | 5 | Ebony Blacksmithing | N/A | Smelter | 15 Ore: Ebony |
| Ingot: Ebony | 10 | Ebony Blacksmithing | N/A | Smelter | 200 Fragment: Ebony |
| Ingot: Ebony | 5 | Ebony Blacksmithing | N/A | Smelter | 25 Ore: Ebony |
| Ingot: Ebony | 5 | Ebony Blacksmithing | N/A | Smelter | 100 Fragment: Ebony |
| Ingot: Ebony | 1 | Ebony Blacksmithing | N/A | Smelter | 20 Fragment: Ebony |
| Ingot: Ebony | 10 | Ebony Blacksmithing | N/A | Smelter | 30 Ore: Ebony |
| Ingot: Ebony | 1 | Ebony Blacksmithing | N/A | Smelter | 3 Ore: Ebony |
| Ingot: Ebony | 1 | Ebony Blacksmithing | N/A | Smelter | 5 Ore: Ebony |
| Ingot: Ebony | 10 | Ebony Blacksmithing | N/A | Smelter | 50 Ore: Ebony |
| Ingot: Galatite | 1 | Craftsmanship | N/A | Smelter | 14 Fragment: Steel 6 Fragment: Quicksilver |
| Ingot: Galatite | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Galatite |
| Ingot: Galatite | 3 | Craftsmanship | N/A | Smelter | 2 Ingot: Steel 1 Ingot: Quicksilver |
| Ingot: Galatite | 6 | Craftsmanship | N/A | Smelter | 4 Ingot: Steel 2 Ingot: Quicksilver |
| Ingot: Galatite | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Galatite |
| Ingot: Galatite | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Galatite |
| Ingot: Gold | 10 | Advanced Blacksmithing | N/A | Smelter | 200 Fragment: Gold |
| Ingot: Gold | 5 | Advanced Blacksmithing | N/A | Smelter | 15 Ore: Gold |
| Ingot: Gold | 5 | Advanced Blacksmithing | N/A | Smelter | 100 Fragment: Gold |
| Ingot: Gold | 10 | Advanced Blacksmithing | N/A | Smelter | 30 Ore: Gold |
| Ingot: Gold | 1 | Advanced Blacksmithing | N/A | Smelter | 3 Ore: Gold |
| Ingot: Gold | 5 | Advanced Blacksmithing | N/A | Smelter | 25 Ore: Gold |
| Ingot: Gold | 1 | Advanced Blacksmithing | N/A | Smelter | 20 Fragment: Gold |
| Ingot: Gold | 10 | Advanced Blacksmithing | N/A | Smelter | 50 Ore: Gold |
| Ingot: Gold | 1 | Advanced Blacksmithing | N/A | Smelter | 5 Ore: Gold |
| Ingot: Iron | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Iron |
| Ingot: Iron | 5 | Craftsmanship | N/A | Smelter | 15 Ore: Iron |
| Ingot: Iron | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Iron |
| Ingot: Iron | 5 | Craftsmanship | N/A | Smelter | 25 Ore: Iron |
| Ingot: Iron | 10 | Craftsmanship | N/A | Smelter | 30 Ore: Iron |
| Ingot: Iron | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Iron |
| Ingot: Iron | 20 | Craftsmanship | N/A | Smelter | 60 Ore: Iron |
| Ingot: Iron | 1 | Craftsmanship | N/A | Smelter | 3 Ore: Iron |
| Ingot: Iron | 1 | Craftsmanship | N/A | Smelter | 5 Ore: Iron |
| Ingot: Iron | 20 | Craftsmanship | N/A | Smelter | 100 Ore: Iron |
| Ingot: Iron | 10 | Craftsmanship | N/A | Smelter | 50 Ore: Iron |
| Ingot: Malachite | 10 | Glass Blacksmithing | N/A | Smelter | 30 Ore: Malachite |
| Ingot: Malachite | 5 | Glass Blacksmithing | N/A | Smelter | 15 Ore: Malachite |
| Ingot: Malachite | 1 | Glass Blacksmithing | N/A | Smelter | 20 Fragment: Malachite |
| Ingot: Malachite | 1 | Glass Blacksmithing | N/A | Smelter | 5 Ore: Malachite |
| Ingot: Malachite | 10 | Glass Blacksmithing | N/A | Smelter | 50 Ore: Malachite |
| Ingot: Malachite | 5 | Glass Blacksmithing | N/A | Smelter | 25 Ore: Malachite |
| Ingot: Malachite | 5 | Glass Blacksmithing | N/A | Smelter | 100 Fragment: Malachite |
| Ingot: Malachite | 1 | Glass Blacksmithing | N/A | Smelter | 3 Ore: Malachite |
| Ingot: Malachite | 10 | Glass Blacksmithing | N/A | Smelter | 200 Fragment: Malachite |
| Ingot: Moonstone | 5 | Elven Blacksmithing | N/A | Smelter | 15 Ore: Moonstone |
| Ingot: Moonstone | 1 | Elven Blacksmithing | N/A | Smelter | 5 Ore: Moonstone |
| Ingot: Moonstone | 1 | Elven Blacksmithing | N/A | Smelter | 20 Fragment: Moonstone |
| Ingot: Moonstone | 5 | Elven Blacksmithing | N/A | Smelter | 25 Ore: Moonstone |
| Ingot: Moonstone | 10 | Elven Blacksmithing | N/A | Smelter | 50 Ore: Moonstone |
| Ingot: Moonstone | 1 | Elven Blacksmithing | N/A | Smelter | 3 Ore: Moonstone |
| Ingot: Moonstone | 10 | Elven Blacksmithing | N/A | Smelter | 30 Ore: Moonstone |
| Ingot: Moonstone | 10 | Elven Blacksmithing | N/A | Smelter | 200 Fragment: Moonstone |
| Ingot: Moonstone | 5 | Elven Blacksmithing | N/A | Smelter | 100 Fragment: Moonstone |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | N/A | Smelter | 100 Fragment: Orichalcum |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | N/A | Smelter | 200 Fragment: Orichalcum |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | N/A | Smelter | 25 Ore: Orichalcum |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | N/A | Smelter | 15 Ore: Orichalcum |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | N/A | Smelter | 3 Ore: Orichalcum |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | N/A | Smelter | 5 Ore: Orichalcum |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | N/A | Smelter | 20 Fragment: Orichalcum |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | N/A | Smelter | 50 Ore: Orichalcum |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | N/A | Smelter | 30 Ore: Orichalcum |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | N/A | Smelter | 100 Fragment: Quicksilver |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | N/A | Smelter | 3 Ore: Quicksilver |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | N/A | Smelter | 25 Ore: Quicksilver |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | N/A | Smelter | 15 Ore: Quicksilver |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | N/A | Smelter | 5 Ore: Quicksilver |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | N/A | Smelter | 20 Fragment: Quicksilver |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | N/A | Smelter | 50 Ore: Quicksilver |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | N/A | Smelter | 200 Fragment: Quicksilver |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | N/A | Smelter | 30 Ore: Quicksilver |
| Ingot: Silver | 1 | Advanced Blacksmithing | N/A | Smelter | 20 Fragment: Silver |
| Ingot: Silver | 5 | Advanced Blacksmithing | N/A | Smelter | 25 Ore: Silver |
| Ingot: Silver | 5 | Advanced Blacksmithing | N/A | Smelter | 100 Fragment: Silver |
| Ingot: Silver | 10 | Advanced Blacksmithing | N/A | Smelter | 200 Fragment: Silver |
| Ingot: Silver | 5 | Advanced Blacksmithing | N/A | Smelter | 15 Ore: Silver |
| Ingot: Silver | 1 | Advanced Blacksmithing | N/A | Smelter | 5 Ore: Silver |
| Ingot: Silver | 10 | Advanced Blacksmithing | N/A | Smelter | 30 Ore: Silver |
| Ingot: Silver | 10 | Advanced Blacksmithing | N/A | Smelter | 50 Ore: Silver |
| Ingot: Silver | 1 | Advanced Blacksmithing | N/A | Smelter | 3 Ore: Silver |
| Ingot: Steel | 10 | Craftsmanship | N/A | Smelter | 10 Ingot: Iron 10 Charcoal |
| Ingot: Steel | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Steel |
| Ingot: Steel | 50 | Craftsmanship | N/A | Smelter | 50 Ingot: Iron 50 Charcoal |
| Ingot: Steel | 25 | Craftsmanship | N/A | Smelter | 25 Ingot: Iron 25 Charcoal |
| Ingot: Steel | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Steel |
| Ingot: Steel | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Steel |
| Ingot: Steel | 1 | Craftsmanship | N/A | Smelter | 1 Ingot: Iron 1 Charcoal |
| Kindling | 5 |  | N/A | Smelter | 1 Iron Woodcutter's Axe |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Poor) |
| Fur Plate | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat |
| Fur Plate | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Poor) |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Goat (Poor) |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Poor) |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Poor) |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Poor) |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar |
| Fur Plate | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Fox (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Ice Wolf (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Poor) |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Wolf (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Skeever |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Poor) |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Poor) |
| Fur Plate | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Snow Fox |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Skeever (Poor) |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |
| Fur Plate | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Fox |
| Fur Plate | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll |
| Fur Plate | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Poor) |
| Hide Lace | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ruined |
| Hide Lace | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Poor) |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Poor) |
| Leather | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |
| Leather | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Poor) |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat |
| Leather | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf |
| Leather | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |
| Leather | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow |
| Leather | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Poor) |
| Leather | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf |
| Leather | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf |
| Leather | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar |
| Leather | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Poor) |
| Leather | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section |
| Leather | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Poor) |
| Leather | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Skeever |
| Leather | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat |
| Leather | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk |
| Leather | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll |
| Leather | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear |
| Leather | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer |
| Leather Strips | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Poor) |
| Leather Strips | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox (Poor) |
| Leather Strips | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Poor) |
| Leather Strips | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ruined |
| Leather Strips | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Poor) |
| Leather Strips | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Skeever (Poor) |
| Leather Strips | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Poor) |
| Leather Strips | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Poor) |
| Leather Strips | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox |
| Leather Strips | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |
| Leather Strips | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Poor) |
| Leather Strips | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat (Poor) |
| Leather Strips | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox |
| Leather Strips | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf (Poor) |
| Leather Strips | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Poor) |
| Leather Strips | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Poor) |
| Leather Strips | 4 | Craftsmanship | N/A | Tanning Rack | 1 Leather |
| Leather Strips | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |
| Leather Strips | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Poor) |
| Leather: Dark | 5 | Craftsmanship | N/A | Tanning Rack | 5 Ore: Iron 5 Leather |
| Leather: Dark | 1 | Craftsmanship | N/A | Tanning Rack | 1 Ore: Iron 1 Leather |
| Leather: Red | 5 | Craftsmanship | N/A | Tanning Rack | 10 Creep Cluster 5 Leather |
| Leather: Red | 1 | Craftsmanship | N/A | Tanning Rack | 2 Creep Cluster 1 Leather |
| Pelt: Bear | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Fine) |
| Pelt: Bear (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Bear (Flawless) |
| Pelt: Boar | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Fine) |
| Pelt: Boar (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Boar (Flawless) |
| Pelt: Cave Bear | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Fine) |
| Pelt: Cave Bear (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Cave Bear (Flawless) |
| Pelt: Cow | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Fine) |
| Pelt: Cow (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Cow (Flawless) |
| Pelt: Deer | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Fine) |
| Pelt: Deer (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Deer (Flawless) |
| Pelt: Elk | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Fine) |
| Pelt: Elk (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Elk (Flawless) |
| Pelt: Fox | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox (Fine) |
| Pelt: Fox (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Fox (Flawless) |
| Pelt: Frost Troll | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Fine) |
| Pelt: Frost Troll (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Frost Troll (Flawless) |
| Pelt: Goat | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat (Fine) |
| Pelt: Goat (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Goat (Flawless) |
| Pelt: Horse | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Fine) |
| Pelt: Horse (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Horse (Flawless) |
| Pelt: Ice Wolf | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Fine) |
| Pelt: Ice Wolf (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Flawless) |
| Pelt: Mammoth Section | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Fine) |
| Pelt: Mammoth Section (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Flawless) |
| Pelt: Sabre Cat | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Fine) |
| Pelt: Sabre Cat (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Flawless) |
| Pelt: Skeever | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Skeever (Fine) |
| Pelt: Skeever (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Skeever (Flawless) |
| Pelt: Snow Bear | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Fine) |
| Pelt: Snow Bear (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Snow Bear (Flawless) |
| Pelt: Snow Fox | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Fine) |
| Pelt: Snow Fox (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Snow Fox (Flawless) |
| Pelt: Snowy Sabre Cat | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Fine) |
| Pelt: Snowy Sabre Cat (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Flawless) |
| Pelt: Troll | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Fine) |
| Pelt: Troll (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Troll (Flawless) |
| Pelt: Vale Deer | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Fine) |
| Pelt: Vale Deer (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Vale Deer (Flawless) |
| Pelt: Vale Sabre Cat | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Fine) |
| Pelt: Vale Sabre Cat (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Flawless) |
| Pelt: Werewolf | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Fine) |
| Pelt: Werewolf (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Werewolf (Flawless) |
| Pelt: Wolf | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf (Fine) |
| Pelt: Wolf (Fine) | 2 |  | N/A | Tanning Rack | 1 Pelt: Wolf (Flawless) |

</div>
