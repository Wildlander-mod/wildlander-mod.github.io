---
title: Crafting Spreadsheet
layout: default
nav_order: 1
parent: Introduction to the Toolkit Crafting System
has_children: false
description: Comprehensive crafting spreadsheet reference.
---

## Complete Crafting Reference

This comprehensive spreadsheet contains all 6,186 crafting recipes across all toolkits in Wildlander. Use the search box and filters below to find recipes by:

- **Crafting Workbench** - Filter by toolkit (Alchemy, Breakdown, Blacksmithing, Cooking, Enchanting, Jewelry, etc.)
- **Search** - Find recipes by item name or ingredient

---

## How to Use This Page

**Hover over any Item Name** to see the complete details including:
- Quantity produced
- Perks and toolkit requirements
- Proximity when player crafting
- All ingredients needed
- Special conditions and quest requirements

Use the search bar and filters below to find specific recipes by workbench type.

---

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
let filterTimeout;

$(document).ready(function(){
  initAllRecipesFilters();
  // Delay tooltip initialization to ensure table is fully rendered
  setTimeout(initAllRecipesTooltips, 100);
});

function initAllRecipesFilters() {
  const workbenches = new Set();
  const table = document.querySelector('.crafting-spreadsheet-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const workbenchCell = row.querySelector('td:nth-child(2)');
    if (workbenchCell) {
      workbenches.add(workbenchCell.textContent.trim());
    }
  });
  
  const select = document.getElementById('allrecipesWorkbenchFilter');
  Array.from(workbenches).sort().forEach(bench => {
    const option = document.createElement('option');
    option.value = bench;
    option.textContent = bench;
    select.appendChild(option);
  });
  
  document.getElementById('allrecipesSearch').addEventListener('keyup', debounceFilter);
  select.addEventListener('change', filterAllRecipesTable);
  document.getElementById('allrecipesClearFilters').addEventListener('click', clearAllRecipesFilters);
}

function debounceFilter() {
  clearTimeout(filterTimeout);
  filterTimeout = setTimeout(filterAllRecipesTable, 300);
}

function filterAllRecipesTable() {
  const searchTerm = document.getElementById('allrecipesSearch').value.toLowerCase();
  const workbenchFilter = document.getElementById('allrecipesWorkbenchFilter').value;
  
  const table = document.querySelector('.crafting-spreadsheet-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const workbench = cells[1]?.textContent.trim() || '';
    const itemsRequired = cells[6]?.textContent.toLowerCase() || '';
    
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const filterMatch = !workbenchFilter || workbench === workbenchFilter;
    
    const isVisible = searchMatch && filterMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateAllRecipesFilterCount(visibleCount, rows.length);
}

function updateAllRecipesFilterCount(visible, total) {
  const counter = document.getElementById('allrecipesFilterResultCount');
  if (counter) {
    counter.textContent = `Showing ${visible} of ${total} recipes`;
  }
}

function clearAllRecipesFilters() {
  document.getElementById('allrecipesSearch').value = '';
  document.getElementById('allrecipesWorkbenchFilter').value = '';
  
  const table = document.querySelector('.crafting-spreadsheet-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  rows.forEach(row => row.style.display = '');
  
  updateAllRecipesFilterCount(rows.length, rows.length);
}

function initAllRecipesTooltips() {
  const table = document.querySelector('.crafting-spreadsheet-table table');
  if (!table) {
    console.warn('Crafting Spreadsheet table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  console.log(`Initializing tooltips for ${rows.length} rows`);
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    if (!itemCell) return;
    
    itemCell.style.cursor = 'pointer';
    itemCell.style.color = '#f77ef1';
    itemCell.style.fontWeight = '500';
    itemCell.addEventListener('mouseenter', (e) => showAllRecipesTooltip(e, row));
    itemCell.addEventListener('mouseleave', hideAllRecipesTooltip);
  });
}

function showAllRecipesTooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    workbench: cells[1]?.textContent || '',
    qtyMade: cells[2]?.textContent || '',
    perksNeeded: cells[3]?.textContent || '',
    toolkitsReq: cells[4]?.textContent || '',
    proximity: cells[5]?.textContent || '',
    itemsRequired: cells[6]?.textContent || '',
    additionalReqs: cells[7]?.textContent || ''
  };
  
  let tooltip = document.getElementById('allrecipes-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'allrecipes-tooltip';
    tooltip.className = 'allrecipes-tooltip';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Workbench:</strong> ${data.workbench || 'N/A'}</div>
    <div><strong>Qty:</strong> ${data.qtyMade || 'N/A'}</div>
    <div><strong>Perks:</strong> ${data.perksNeeded || 'None'}</div>
    <div><strong>Toolkits:</strong> ${data.toolkitsReq || 'N/A'}</div>
    <div><strong>Proximity:</strong> ${data.proximity || 'N/A'}</div>
    <div><strong>Items Required:</strong> ${data.itemsRequired || 'N/A'}</div>
    <div><strong>Additional:</strong> ${data.additionalReqs || 'None'}</div>
  `;
  tooltip.style.display = 'block';
  tooltip.style.left = event.pageX + 10 + 'px';
  tooltip.style.top = event.pageY + 10 + 'px';
}

function hideAllRecipesTooltip() {
  const tooltip = document.getElementById('allrecipes-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}
</script>

<div class="crafting-spreadsheet-controls">
  <input type="text" id="allrecipesSearch" placeholder="Search by item name or ingredients..." />
  <select id="allrecipesWorkbenchFilter">
    <option value="">All Workbenches</option>
  </select>
  <button id="allrecipesClearFilters" onclick="clearAllRecipesFilters()">Clear Filters</button>
  <div id="allrecipesFilterResultCount" class="filter-result-count">Showing 6186 of 6186 recipes</div>
</div>

<div class="crafting-spreadsheet-table" markdown="1">

| Produced Item Name | Crafting Workbench | Qty Made | Perks Needed | Toolkits Req. | Proximity | Items Required | Additional Reqs |
|:---|:---|:---:|:---|:---|:---|:---|:---|
| Aetherial Crown | Aetherium Forge | 1 |  | N/A | Aetherium Forge | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherial Crown | Aetherium Forge | 1 |  | N/A | Aetherium Forge | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Shield | Aetherium Forge | 1 |  | N/A | Aetherium Forge | 2 Ingot: Malachite 4 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Shield | Aetherium Forge | 1 |  | N/A | Aetherium Forge | 2 Ingot: Malachite 4 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherial Staff | Aetherium Forge | 1 |  | N/A | Aetherium Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Staff | Aetherium Forge | 1 |  | N/A | Aetherium Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Alchemist's Crown | Forge | 1 |  | Smiths,Jewelers | Forge | 1 Infused Ingot 3 Rubyluce |  |
| Alchemist's Crown | Player Crafting | 1 |  | Smiths,Jewelers | Forge | 1 Infused Ingot 3 Rubyluce |  |
| Ale | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 4 Wheat |  |
| Ale | Player Crafting | 2 |  | Brewers | Brewing Barrel | 4 Wheat |  |
| Ale Braised Sabre Cat | Cook pot | 1 |  | Chefs | Cook pot | 1 Ale 1 Raw Sabre Cat Meat |  |
| Ale Braised Sabre Cat | Player Crafting | 1 |  | Chefs | Cook pot | 1 Ale 1 Raw Sabre Cat Meat |  |
| Apple Cabbage Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water) |  |
| Apple Cabbage Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water) |  |
| Apple Dumpling | Oven | 4 |  | Chefs | Oven | 2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter |  |
| Apple Dumpling | Player Crafting | 4 |  | Chefs | Oven | 2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter |  |
| Apple Pie | Player Crafting | 1 |  | Chefs | Oven | 1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter |  |
| Apple Pie | Oven | 1 |  | Chefs | Oven | 1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter |  |
| Ashfire Mead | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 1 Juniper Berries 1 Honey 1 Ashen Grass Pod | Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete |
| Ashfire Mead | Player Crafting | 2 |  | Brewers | Brewing Barrel | 1 Juniper Berries 1 Honey 1 Ashen Grass Pod | Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Indigo |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Brown |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Blue |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Red |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Orange |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Tan |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Green |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Yellow |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Grey |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Black |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Orange |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Tan |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Tan |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Purple |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Black |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Yellow |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Purple |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Tan |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Orange |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Yellow |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Green |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Indigo |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Red |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Indigo |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Grey |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Purple |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Black |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Indigo |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Red |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Blue |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Grey |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Orange |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Green |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Brown |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Blue |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Grey |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cloth - Purple |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Red |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Blue |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Cotton Cloth - Brown |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Yellow |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Green |  |
| Bandage | Player Crafting | 1 |  | N/A | N/A | 1 Linen Cloth - Brown |  |
| Bandage | Breakdown | 1 |  | N/A | N/A | 1 Linen Cloth - Black |  |
| Barrel | Furniture Workbench | 2 |  | N/A | Furniture Workbench | 5 Wood 1 Iron Nails |  |
| Bear and Bear Chowder | Player Crafting | 2 |  | Chefs | Cook pot | 1 Ale 1 Goat Cheese Slice 1 Blue Mountain Flower 1 Bottled Milk 1 Raw Bear Meat |  |
| Bear and Bear Chowder | Cook pot | 2 |  | Chefs | Cook pot | 1 Ale 1 Goat Cheese Slice 1 Blue Mountain Flower 1 Bottled Milk 1 Raw Bear Meat |  |
| Bear Carrot Stew | Player Crafting | 2 |  | Chefs | Cook pot | 1 Carrot 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Bear Carrot Stew | Cook pot | 2 |  | Chefs | Cook pot | 1 Carrot 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Bear Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Bear Meat |  |
| Bear Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Bear Meat |  |
| Beef Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Beef |  |
| Beef Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Beef |  |
| Beef Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Carrot 1 Raw Beef 1 Glass Bottle (Water) |  |
| Beef Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Carrot 1 Raw Beef 1 Glass Bottle (Water) |  |
| Beggar's Broth | Cook pot | 2 |  | Chefs | Cook pot | 1 Raw Horse Meat 2 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Beggar's Broth | Player Crafting | 2 |  | Chefs | Cook pot | 1 Raw Horse Meat 2 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Bestial Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Raw Salmon Steak 1 Bottled Milk 1 Wolf Heart 3 Raw Wolf Meat |  |
| Bestial Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Raw Salmon Steak 1 Bottled Milk 1 Wolf Heart 3 Raw Wolf Meat |  |
| Black-Briar Reserve | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 4 Wheat |  |
| Black-Briar Reserve | Player Crafting | 2 |  | Brewers | Brewing Barrel | 4 Wheat |  |
| Blood of the Hunt (Strange Brew) | Player Crafting | 1 |  | Alchemists | Cook pot | 1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart | Brewing Skill Greater or Equal to 2 |
| Blood of the Hunt (Strange Brew) | Cook pot | 1 |  | Alchemists | Cook pot | 1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart | Brewing Skill Greater or Equal to 2 |
| Bloody Rags | Breakdown | 2 |  | N/A | N/A | 1 Linen Tunic - Belted Black, Bloody |  |
| Boar Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Boar Meat |  |
| Boar Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Boar Meat |  |
| Boar Leek Stew | Cook pot | 2 |  | Chefs | Cook pot | 1 Leek 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boar Leek Stew | Player Crafting | 2 |  | Chefs | Cook pot | 1 Leek 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boar Potato Stew | Cook pot | 2 |  | Chefs | Cook pot | 1 Potato 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boar Potato Stew | Player Crafting | 2 |  | Chefs | Cook pot | 1 Potato 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boiled Cabbage and Mammoth | Cook pot | 2 |  | Chefs | Cook pot | 1 Cabbage 1 Raw Mammoth Meat |  |
| Boiled Cabbage and Mammoth | Player Crafting | 2 |  | Chefs | Cook pot | 1 Cabbage 1 Raw Mammoth Meat |  |
| Boiled Skeever Tail | Player Crafting | 1 |  | Alchemists | N/A | 1 Skeever Tail | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Beaver Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Buck Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Flower Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Harvest Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Hunter's Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Long Night | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Pink Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Snow Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Strawberry Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Sturgeon Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Wolf Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Worm Moon | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Divining Knife | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 1 Leather Strips 3 Fragment: Bone | Animal Harvesting Skill Greater or Equal to 3 |
| Bone Hawk Claw | Breakdown | 3 |  | N/A | N/A | 1 Bone Hawk Ring |  |
| Bone Hawk Feathers | Breakdown | 6 |  | N/A | N/A | 1 Bone Hawk Amulet |  |
| Bone Hunting Knife | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Idol of the Elm Rite (Strange Brew) | Player Crafting | 1 |  | Survivalists | N/A | 1 Elm Ritual Bone | Animal Harvesting Skill Greater or Equal to 7 |
| Bone Idol of the Oak Rite (Strange Brew) | Player Crafting | 1 |  | Survivalists | N/A | 1 Oak Ritual Bone | Animal Harvesting Skill Greater or Equal to 9 |
| Bone Idol of the Yew Rite (Strange Brew) | Player Crafting | 1 |  | Survivalists | N/A | 1 Yew Ritual Bone | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Jagged Ring | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Lucky Ring | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Masterwork Sword | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 2 Hawk Feathers 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Masterwork War Axe | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 2 Hide Lace 3 Wolf Claws 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 3 |
| Bone Meal | Player Crafting | 1 |  | Alchemists | N/A | 3 Fragment: Bone | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Ring of the Elm Rite | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Strange Bear Claw | Animal Harvesting Skill Greater or Equal to 7 |
| Bone Ring of the Oak Rite | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Strange Cat Claw | Animal Harvesting Skill Greater or Equal to 9 |
| Bone Ring of the Yew Rite | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Strange Wolf Claw | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Silvered Ring (Strange Brew) | Player Crafting | 1 |  | Survivalists,Jewelers | Forge | 1 Animal Bone (Small) 8 Fragment: Silver | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 2 |
| Bone Silvered Ring (Strange Brew) | Forge | 1 |  | Survivalists,Jewelers | Forge | 1 Animal Bone (Small) 8 Fragment: Silver | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 2 |
| Bone Smooth Ring | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Staff | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 2 Leather Strips 1 Animal Bone (Large) 2 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 4 |
| Bone Sword | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Thorned Ring | Player Crafting | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone War Axe | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 2 Leather Strips 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 1 |
| Bonesap | Player Crafting | 1 |  | Alchemists | N/A | 1 Bone Meal 1 Spriggan Sap | Animal Harvesting Skill Greater or Equal to 3 |
| Braided Bread | Oven | 1 |  | Chefs | Oven | 1 Salt 2 Flour 1 Glass Bottle (Water) |  |
| Braided Bread | Player Crafting | 1 |  | Chefs | Oven | 1 Salt 2 Flour 1 Glass Bottle (Water) |  |
| Bread Loaf | Player Crafting | 1 |  | Chefs | Oven | 1 Salt 1 Flour 1 Glass Bottle (Water) |  |
| Bread Loaf | Oven | 1 |  | Chefs | Oven | 1 Salt 1 Flour 1 Glass Bottle (Water) |  |
| Breaded Elk Cutlet | Cook pot | 2 |  | Chefs | Cook pot | 1 Chicken's Egg 1 Bread Loaf 1 Raw Elk Meat |  |
| Breaded Elk Cutlet | Player Crafting | 2 |  | Chefs | Cook pot | 1 Chicken's Egg 1 Bread Loaf 1 Raw Elk Meat |  |
| Butter | Butter Churn | 1 |  | N/A | Butter Churn | 1 Bottled Milk |  |
| Butter | Player Crafting | 1 |  | Chefs | Butter Churn | 1 Bottled Milk |  |
| Cabbage Potato Soup | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Cabbage 1 Potato 1 Leek 1 Glass Bottle (Water) |  |
| Cabbage Potato Soup | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Cabbage 1 Potato 1 Leek 1 Glass Bottle (Water) |  |
| Cabbage Soup | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Cabbage 1 Glass Bottle (Water) |  |
| Cabbage Soup | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Cabbage 1 Glass Bottle (Water) |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Arrow: Practice |  |
| Charcoal | Smelter | 5 |  | N/A | Smelter | 1 Toolkit: Tailor's |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Broom |  |
| Charcoal | Breakdown | 3 |  | N/A | N/A | 1 Forsworn Sword |  |
| Charcoal | Smelter | 5 |  | N/A | Smelter | 1 Toolkit: Brewer's |  |
| Charcoal | Smelter | 2 |  | N/A | Smelter | 1 Wooden Bellows |  |
| Charcoal | Smelter | 2 |  | N/A | Smelter | 1 Wooden Heavy Bow |  |
| Charcoal | Breakdown | 3 |  | N/A | N/A | 1 Forsworn Light Bow |  |
| Charcoal | Smelter | 2 |  | N/A | Smelter | 1 Wooden Well Bucket |  |
| Charcoal | Smelter | 2 |  | N/A | Smelter | 1 Wooden Roped Bucket |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Spigot |  |
| Charcoal | Breakdown | 5 |  | N/A | N/A | 1 Forsworn War Axe |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Drum |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Torch (Bright) |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Flute |  |
| Charcoal | Breakdown | 3 |  | N/A | N/A | 1 Iron Woodcutter's Axe |  |
| Charcoal | Smelter | 5 |  | N/A | Smelter | 1 Toolkit: Survivalist's |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Bowl |  |
| Charcoal | Breakdown | 1 |  | N/A | N/A | 1 Wooden Sword |  |
| Charcoal | Smelter | 3 |  | N/A | Smelter | 1 Iron Pickaxe |  |
| Charcoal | Smelter | 2 |  | N/A | Smelter | 1 Wooden Lute |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Pitchfork |  |
| Charcoal | Breakdown | 1 |  | N/A | N/A | 1 Imperial Heavy Bow |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Ladle |  |
| Charcoal | Smelter | 2 |  | N/A | Smelter | 1 Wooden Light Bow |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Plate |  |
| Charcoal | Smelter | 5 |  | N/A | Smelter | 1 Toolkit: Alchemist's |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Iron Pitchfork |  |
| Charcoal | Smelter | 1 |  | N/A | Smelter | 1 Wooden Torch |  |
| Charcoal | Smelter | 2 |  | N/A | Smelter | 1 Wooden Fishing Rod |  |
| Charred Hawk Beak | Player Crafting | 1 |  | Alchemists | N/A | 1 Hawk Beak |  |
| Charred Skeever Hide | Player Crafting | 1 |  | Alchemists | N/A | 1 Pelt: Skeever (Poor) |  |
| Chaurus Jerky | Cook pot | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Chaurus Meat |  |
| Chaurus Jerky | Player Crafting | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Chaurus Meat |  |
| Chaurus Pie | Player Crafting | 1 |  | Chefs | Oven | 2 Salt 1 Red Apple 1 Carrot 1 Potato 1 Tomato 1 Honeycomb 1 Raw Chaurus Meat |  |
| Chaurus Pie | Oven | 1 |  | Chefs | Oven | 2 Salt 1 Red Apple 1 Carrot 1 Potato 1 Tomato 1 Honeycomb 1 Raw Chaurus Meat |  |
| Chaurus Venom (Good) | Player Crafting | 1 |  | Alchemists | Cook pot | 2 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 2 |
| Chaurus Venom (Good) | Cook pot | 1 |  | Alchemists | Cook pot | 2 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 2 |
| Chaurus Venom (Great) | Cook pot | 1 |  | Alchemists | Cook pot | 1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 4 |
| Chaurus Venom (Great) | Player Crafting | 1 |  | Alchemists | Cook pot | 1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 4 |
| Chaurus Venom (Superlative) | Player Crafting | 1 |  | Alchemists | Cook pot | 1 Chaurus Eggs 1 Chaurus Venom (Great) | Animal Harvesting Skill Greater or Equal to 6 |
| Chaurus Venom (Superlative) | Cook pot | 1 |  | Alchemists | Cook pot | 1 Chaurus Eggs 1 Chaurus Venom (Great) | Animal Harvesting Skill Greater or Equal to 6 |
| Cheesy Potato Mammoth | Cook pot | 2 |  | Chefs | Cook pot | 1 Nord Mead 1 Goat Cheese Slice 1 Potato 1 Bottled Milk 1 Raw Mammoth Meat |  |
| Cheesy Potato Mammoth | Player Crafting | 2 |  | Chefs | Cook pot | 1 Nord Mead 1 Goat Cheese Slice 1 Potato 1 Bottled Milk 1 Raw Mammoth Meat |  |
| Chest | Furniture Workbench | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Chest | Furniture Workbench | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Chest | Furniture Workbench | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Chicken Dumpling | Player Crafting | 2 |  | Chefs | Oven | 1 Salt 1 Garlic 2 Leek 2 Raw Chicken Breast 1 Flour |  |
| Chicken Dumpling | Oven | 2 |  | Chefs | Oven | 1 Salt 1 Garlic 2 Leek 2 Raw Chicken Breast 1 Flour |  |
| Chicken Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Chicken Breast |  |
| Chicken Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Chicken Breast |  |
| Child's Chest | Furniture Workbench | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Child's Chest | Furniture Workbench | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Cinnabar Beer | Brewing Barrel | 1 |  | N/A | Brewing Barrel | 1 Ale 1 Jazbay Grapes 1 Creep Cluster | Sidequest - On Hogithum Complete |
| Cinnabar Beer | Player Crafting | 1 |  | Brewers | Brewing Barrel | 1 Ale 1 Jazbay Grapes 1 Creep Cluster | Sidequest - On Hogithum Complete |
| Clam Chowder | Cook pot | 1 |  | Chefs | Cook pot | 1 Potato 1 Raw Clam Meat 1 Glass Bottle (Water) |  |
| Clam Chowder | Player Crafting | 1 |  | Chefs | Cook pot | 1 Potato 1 Raw Clam Meat 1 Glass Bottle (Water) |  |
| Cliff Racer | Player Crafting | 4 |  | Brewers | Brewing Barrel | 1 Firebrand Wine 1 Cyrodilic Brandy 1 Flin 1 Sujamma |  |
| Cliff Racer | Brewing Barrel | 4 |  | N/A | Brewing Barrel | 1 Firebrand Wine 1 Cyrodilic Brandy 1 Flin 1 Sujamma |  |
| Cooked Angelfish | Cook pot | 1 |  | N/A | Cook pot | 1 Angelfish |  |
| Cooked Angelfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Angelfish |  |
| Cooked Angler | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Angler |  |
| Cooked Angler | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Angler |  |
| Cooked Angler Larvae | Cook pot | 1 |  | N/A | Cook pot | 1 Angler Larvae |  |
| Cooked Angler Larvae | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Angler Larvae |  |
| Cooked Arctic Char | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Arctic Char |  |
| Cooked Arctic Char | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Arctic Char |  |
| Cooked Arctic Grayling | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Arctic Grayling |  |
| Cooked Arctic Grayling | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Arctic Grayling |  |
| Cooked Bear Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Bear Meat |  |
| Cooked Bear Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Bear Meat |  |
| Cooked Beef | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Beef |  |
| Cooked Beef | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Beef |  |
| Cooked Brook Bass | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Brook Bass |  |
| Cooked Brook Bass | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Brook Bass |  |
| Cooked Carp | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Carp |  |
| Cooked Carp | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Carp |  |
| Cooked Catfish | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Catfish |  |
| Cooked Catfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Catfish |  |
| Cooked Chaurus Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Chaurus Meat |  |
| Cooked Chaurus Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Chaurus Meat |  |
| Cooked Chicken Breast | Cook pot | 1 |  | N/A | Cook pot | 2 Raw Chicken Breast |  |
| Cooked Chicken Breast | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Chicken Breast |  |
| Cooked Cod | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Cod |  |
| Cooked Cod | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Cod |  |
| Cooked Direfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Direfish |  |
| Cooked Direfish | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Direfish |  |
| Cooked Dog Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Dog Meat |  |
| Cooked Dog Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Dog Meat |  |
| Cooked Dragon Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Dragon Meat |  |
| Cooked Dragon Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Dragon Meat |  |
| Cooked Elk Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Elk Meat |  |
| Cooked Elk Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Elk Meat |  |
| Cooked Fat | Cook pot | 1 |  | N/A | Cook pot | 1 Animal Fat |  |
| Cooked Fat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Animal Fat |  |
| Cooked Fox Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Fox Meat |  |
| Cooked Fox Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Fox Meat |  |
| Cooked Glass Catfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Glass Catfish |  |
| Cooked Glass Catfish | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Glass Catfish |  |
| Cooked Glassfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Glassfish |  |
| Cooked Glassfish | Cook pot | 1 |  | N/A | Cook pot | 1 Glassfish |  |
| Cooked Goat Leg | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Goat Leg |  |
| Cooked Goat Leg | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Goat Leg |  |
| Cooked Goat Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Goat Meat |  |
| Cooked Goat Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Goat Meat |  |
| Cooked Goldfish | Cook pot | 1 |  | N/A | Cook pot | 1 Goldfish |  |
| Cooked Goldfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Goldfish |  |
| Cooked Horker Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Horker Meat |  |
| Cooked Horker Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Horker Meat |  |
| Cooked Horse Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Horse Meat |  |
| Cooked Horse Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Horse Meat |  |
| Cooked Juvenile Mudcrab | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Juvenile Mudcrab |  |
| Cooked Juvenile Mudcrab | Cook pot | 1 |  | N/A | Cook pot | 1 Juvenile Mudcrab |  |
| Cooked Leeks | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Leek |  |
| Cooked Leeks | Cook pot | 1 |  | N/A | Cook pot | 1 Leek |  |
| Cooked Lyretail Anthias | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Lyretail Anthias |  |
| Cooked Lyretail Anthias | Cook pot | 1 |  | N/A | Cook pot | 1 Lyretail Anthias |  |
| Cooked Mammoth Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Mammoth Meat |  |
| Cooked Mammoth Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Mammoth Meat |  |
| Cooked Mammoth Snout | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Mammoth Snout |  |
| Cooked Mammoth Snout | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Mammoth Snout |  |
| Cooked Mudcrab | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Mudcrab Meat |  |
| Cooked Mudcrab | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Mudcrab Meat |  |
| Cooked Mudcrab Legs | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Mudcrab Legs |  |
| Cooked Mudcrab Legs | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Mudcrab Legs |  |
| Cooked Pearlfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Pearlfish |  |
| Cooked Pearlfish | Cook pot | 1 |  | N/A | Cook pot | 1 Pearlfish |  |
| Cooked Pheasant Breast | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Pheasant Breast |  |
| Cooked Pheasant Breast | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Pheasant Breast |  |
| Cooked Pogfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Pogfish |  |
| Cooked Pogfish | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Pogfish |  |
| Cooked Potatoes | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Potato |  |
| Cooked Potatoes | Cook pot | 1 |  | N/A | Cook pot | 1 Potato |  |
| Cooked Pygmy Sunfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Pygmy Sunfish |  |
| Cooked Pygmy Sunfish | Cook pot | 1 |  | N/A | Cook pot | 1 Pygmy Sunfish |  |
| Cooked Rabbit Leg | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Rabbit Leg |  |
| Cooked Rabbit Leg | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Rabbit Leg |  |
| Cooked Rabbit Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Rabbit Meat |  |
| Cooked Rabbit Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Rabbit Meat |  |
| Cooked Sabre Cat Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Sabre Cat Meat |  |
| Cooked Sabre Cat Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Sabre Cat Meat |  |
| Cooked Salmon Steak | Player Crafting | 2 |  | N/A | Any Fire Source,Cook pot | 1 Raw Salmon |  |
| Cooked Salmon Steak | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Salmon Steak |  |
| Cooked Salmon Steak | Cook pot | 2 |  | N/A | Cook pot | 1 Raw Salmon |  |
| Cooked Salmon Steak | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Salmon Steak |  |
| Cooked Scorpion Fish | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Scorpion Fish |  |
| Cooked Scorpion Fish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Scorpion Fish |  |
| Cooked Skeever Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Skeever Meat |  |
| Cooked Skeever Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Skeever Meat |  |
| Cooked Slaughterfish | Cook pot | 3 |  | N/A | Cook pot | 1 Raw Slaughterfish |  |
| Cooked Slaughterfish | Player Crafting | 3 |  | N/A | Any Fire Source,Cook pot | 1 Raw Slaughterfish |  |
| Cooked Spadefish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Spadefish |  |
| Cooked Spadefish | Cook pot | 1 |  | N/A | Cook pot | 1 Spadefish |  |
| Cooked Spider Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Spider Meat |  |
| Cooked Spider Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Spider Meat |  |
| Cooked Tripod Spiderfish | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Tripod Spiderfish |  |
| Cooked Tripod Spiderfish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Tripod Spiderfish |  |
| Cooked Troll Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Troll Meat |  |
| Cooked Troll Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Troll Meat |  |
| Cooked Vampire Fish | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Vampire Fish |  |
| Cooked Vampire Fish | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Vampire Fish |  |
| Cooked Venison | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Venison |  |
| Cooked Venison | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Venison |  |
| Cooked Wolf Meat | Player Crafting | 1 |  | N/A | Any Fire Source,Cook pot | 1 Raw Wolf Meat |  |
| Cooked Wolf Meat | Cook pot | 1 |  | N/A | Cook pot | 1 Raw Wolf Meat |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Yellow |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Green |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Grey |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Tan |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Brown |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Indigo |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Black |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Orange |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Purple |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Blue |  |
| Cotton Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Cotton Cloth - Red |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Jester's Gloves |  |
| Cotton Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Cotton Robes - Thalmor |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cuffed Boots |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Hood of Apprentice Regeneration |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Jester's Gloves |  |
| Cotton Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Cotton Quilted Clothes - Black and White |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Hood - Embellished |  |
| Cotton Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Cotton Robes - Thalmor |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Gloves - Thalmor |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Boots - Thalmor |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Focusing Gloves |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Jester's Boots |  |
| Cotton Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Cotton Jester's Boots |  |
| Cotton Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Robes of Novice Regeneration |  |
| Cotton Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Robes - Embellished |  |
| Cotton Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Cotton Fur-Mantled Clothes - Blue |  |
| Cotton Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Cotton Reclamations Temple Robes |  |
| Cotton Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Cotton Reclamations Temple Robes |  |
| Cotton Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Robes - Common |  |
| Cotton Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Cotton Reclamations Temple Hood |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Robes - Embroidered |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Hood - Embroidered |  |
| Cotton Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Cotton Cultist Robes |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cultist Gloves |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Cultist Boots |  |
| Cotton Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Cotton Quilted Clothes - Orange |  |
| Cotton Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Cotton Quilted Clothes - Brown and Orange |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Hood of Adept Magicka |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Merchant's Hat |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Fine Shoes |  |
| Cotton Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Cotton Quilted Clothes - Brown and White |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Telvanni Shoes of Shock Resistance |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Reclamations Temple Boots |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Telvanni Shoes |  |
| Cotton Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Cotton Fine Clothes - Brown |  |
| Cotton Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Cotton Cultist Robes |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Shoes - Mythic Dawn |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Fine Hat |  |
| Cotton Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Cotton Fine Boots |  |
| Cotton Cloth - Green | Breakdown | 2 |  | N/A | N/A | 1 Cotton Fur-Mantled Clothes - Green |  |
| Cotton Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Greybeard's Hood |  |
| Cotton Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Boots - Embellished |  |
| Cotton Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Greybeard's Robes |  |
| Cotton Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Boots - Common |  |
| Cotton Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Greybeard's Shoes |  |
| Cotton Cloth - Indigo | Breakdown | 2 |  | N/A | N/A | 1 Cotton Fine Clothes - Indigo |  |
| Cotton Cloth - Indigo | Breakdown | 1 |  | N/A | N/A | 1 Cotton Quilted Clothes - Blue |  |
| Cotton Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Cotton Quilted Clothes - Orange and Black |  |
| Cotton Cloth - Purple | Breakdown | 2 |  | N/A | N/A | 1 Cotton Vaermina Robes |  |
| Cotton Cloth - Red | Breakdown | 2 |  | N/A | N/A | 1 Cotton Jester's Clothes - Red |  |
| Cotton Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Cotton Gloves - Mythic Dawn |  |
| Cotton Cloth - Red | Breakdown | 2 |  | N/A | N/A | 1 Cotton Robes - Mythic Dawn |  |
| Cotton Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Cotton Telvanni Robes of Resurgence |  |
| Cotton Cloth - Red | Breakdown | 2 |  | N/A | N/A | 1 Cotton Jester's Clothes |  |
| Cotton Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Cotton Hood - Mythic Dawn |  |
| Cotton Cloth - Red | Breakdown | 2 |  | N/A | N/A | 1 Cotton Robes - Mythic Dawn |  |
| Cotton Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Cotton Telvanni Robes |  |
| Cotton Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Cotton Jester's Hat - Red |  |
| Cotton Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Cotton Jester's Hat |  |
| Cotton Cloth - Red | Breakdown | 2 |  | N/A | N/A | 1 Silk Wedding Finery |  |
| Cotton Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Hood - Common |  |
| Cotton Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Cotton Mage Hood of Novice Regeneration |  |
| Cotton Cloth - Tan | Breakdown | 2 |  | N/A | N/A | 1 Cotton Tall Boots |  |
| Cotton Thread | Breakdown | 2 |  | N/A | N/A | 1 Cotton Cloth |  |
| Crab Cakes | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Flour 1 Raw Mudcrab Meat |  |
| Crab Cakes | Oven | 1 |  | Chefs | Oven | 1 Salt 1 Flour 1 Raw Mudcrab Meat |  |
| Crab Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Garlic 1 Potato 1 Leek 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Crab Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Garlic 1 Potato 1 Leek 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Creamy Crab Bisque | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Flour 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Creamy Crab Bisque | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Flour 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Cured Skeever Hide | Player Crafting | 1 |  | Alchemists | N/A | 1 Salt 1 Pelt: Skeever | Animal Harvesting Skill Greater or Equal to 1 |
| Decorative War Horn | Player Crafting | 1 |  | Builders | N/A | 1 Ingot: Iron 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 3 |
| Deviled Chaurus | Player Crafting | 1 |  | Chefs | Cook pot | 1 Thistle Branch 1 Bleeding Crown 1 Raw Chaurus Meat |  |
| Deviled Chaurus | Cook pot | 1 |  | Chefs | Cook pot | 1 Thistle Branch 1 Bleeding Crown 1 Raw Chaurus Meat |  |
| Dog Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Dog Meat |  |
| Dog Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Dog Meat |  |
| Dragon Blood Pudding | Player Crafting | 1 |  | Chefs | Cook pot | 1 Jazbay Grapes 1 Moon Sugar 1 Dragon's Blood |  |
| Dragon Blood Pudding | Cook pot | 1 |  | Chefs | Cook pot | 1 Jazbay Grapes 1 Moon Sugar 1 Dragon's Blood |  |
| Dragon Bone | Breakdown | 3 |  | N/A | N/A | 1 Horse Armor: Dragonbone Barding and Saddle |  |
| Dragon Heart Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Ale 1 Fire Salts 1 Potato 1 Tomato 1 Dragon Heart |  |
| Dragon Heart Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Ale 1 Fire Salts 1 Potato 1 Tomato 1 Dragon Heart |  |
| Dragon Jerky | Cook pot | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Dragon Meat |  |
| Dragon Jerky | Player Crafting | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Dragon Meat |  |
| Dragon Stuffed Rabbit | Player Crafting | 1 |  | Chefs | Cook pot | 2 Dragon's Tongue 1 Raw Rabbit Meat |  |
| Dragon Stuffed Rabbit | Cook pot | 1 |  | Chefs | Cook pot | 2 Dragon's Tongue 1 Raw Rabbit Meat |  |
| Dragon Vegetable Stew | Player Crafting | 2 |  | Chefs | Cook pot | 2 Carrot 2 Potato 1 Raw Dragon Meat 1 Glass Bottle (Water) |  |
| Dragon Vegetable Stew | Cook pot | 2 |  | Chefs | Cook pot | 2 Carrot 2 Potato 1 Raw Dragon Meat 1 Glass Bottle (Water) |  |
| Dragon's Blood Poison (Crude) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 1 |
| Dragon's Blood Poison (Crude) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 1 |
| Dragon's Blood Poison (Decent) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Poison (Decent) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Poison (Good) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Poison (Good) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Poison (Great) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Poison (Great) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Poison (Remarkable) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Poison (Remarkable) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Potion (Decent) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Potion (Decent) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Potion (Good) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Potion (Good) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Potion (Great) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Potion (Great) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Potion (Remarkable) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Potion (Remarkable) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Breath Mead | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 2 Dragon's Tongue 1 Honey |  |
| Dragon's Breath Mead | Player Crafting | 2 |  | Brewers | Brewing Barrel | 2 Dragon's Tongue 1 Honey |  |
| Dragon's Elixir of Firebloom | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Firebloom | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Furious Speed | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Furious Speed | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Ghostly Passage | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Ghostly Passage | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Kyne's Peace | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Kyne's Peace | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Slowed Time | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Slowed Time | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Swiftness | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Swiftness | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Living Circle | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Living Circle | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Shade | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Shade | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Storm | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Storm | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Unseen | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Unseen | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Death | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Death | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Disarming | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Disarming | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Explosive Force | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Explosive Force | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Terrible Frost | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Terrible Frost | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Torpor | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Torpor | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Dark Trimmed White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Ornate Brown |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Brown |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Trimmed Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Ornate Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Ornate Brown |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Light Trimmed Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Ornate White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Dark Trimmed Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Ornate Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Light Trimmed Brown |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Brown |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Trimmed White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Bearskin Hood - Trimmed Brown |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Ornate White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Light Trimmed White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Noble Black |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Noble White |  |
| Dragonplate Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonplate Wolfskin Hood - Noble Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Light Trimmed White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Light Trimmed Black |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Noble White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Trimmed Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Black |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Ornate White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Noble Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Noble Black |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Dark Trimmed Black |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Ornate Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Ornate Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Trimmed Black |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Trimmed White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Ornate Black |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Dark Trimmed White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Light Trimmed Brown |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Black |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Bearskin Hood - Ornate White |  |
| Dragonscale Helmet | Breakdown | 1 |  | N/A | N/A | 1 Dragonscale Wolfskin Hood - Ornate Black |  |
| Dried Salmon Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Salmon Steak |  |
| Dried Salmon Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Salmon Steak |  |
| Dried Slaughterfish Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Slaughterfish |  |
| Dried Slaughterfish Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Slaughterfish |  |
| Dyed Hawk Feathers | Player Crafting | 3 |  | Alchemists | N/A | 3 Hawk Feathers 1 Dye - Black | Animal Harvesting Skill Greater or Equal to 1 |
| Ebony Mail | Player Crafting | 1 |  | N/A | N/A | 1 Ebony Mail |  |
| Ebony Mail | Player Crafting | 1 |  | N/A | N/A | 1 Ebony Mail |  |
| Eidar Cheese Slice | Breakdown | 2 |  | N/A | N/A | 1 Eidar Cheese Wedge |  |
| Eidar Cheese Wedge | Breakdown | 3 |  | N/A | N/A | 1 Eidar Cheese Wheel |  |
| Elf Eared Elk | Player Crafting | 1 |  | Chefs | Cook pot | 2 Elves Ear 1 Raw Elk Meat |  |
| Elf Eared Elk | Cook pot | 1 |  | Chefs | Cook pot | 2 Elves Ear 1 Raw Elk Meat |  |
| Elsweyr Fondue | Player Crafting | 1 |  | Chefs | Cook pot | 1 Ale 6 Eidar Cheese Slice 1 Leek 1 Moon Sugar |  |
| Elsweyr Fondue | Cook pot | 1 |  | Chefs | Cook pot | 1 Ale 6 Eidar Cheese Slice 1 Leek 1 Moon Sugar |  |
| Engraved Bone of Hircine | Player Crafting | 1 |  | Survivalists | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Engraved Bone of Julianos | Player Crafting | 1 |  | Survivalists | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Engraved Bone of Kynareth | Player Crafting | 1 |  | Survivalists | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Farmer's Breakfast | Cook pot | 1 |  | Chefs | Cook pot | 1 Tomato 1 Mora Tapinella 1 Raw Boar Meat |  |
| Farmer's Breakfast | Player Crafting | 1 |  | Chefs | Cook pot | 1 Tomato 1 Mora Tapinella 1 Raw Boar Meat |  |
| Fatty Fin Fry | Player Crafting | 1 |  | Chefs | Cook pot | 1 Garlic 1 Raw Horker Meat 1 Grass Pod |  |
| Fatty Fin Fry | Cook pot | 1 |  | Chefs | Cook pot | 1 Garlic 1 Raw Horker Meat 1 Grass Pod |  |
| Fish with Crab Sauce | Player Crafting | 2 |  | Chefs | Cook pot | 1 Alto Noir Wine 1 Raw Slaughterfish 1 Raw Mudcrab Meat |  |
| Fish with Crab Sauce | Cook pot | 2 |  | Chefs | Cook pot | 1 Alto Noir Wine 1 Raw Slaughterfish 1 Raw Mudcrab Meat |  |
| Flaming Dragon | Player Crafting | 2 |  | Chefs | Cook pot | 1 Red Mountain Flower 1 Mulled Wine 1 Raw Dragon Meat |  |
| Flaming Dragon | Cook pot | 2 |  | Chefs | Cook pot | 1 Red Mountain Flower 1 Mulled Wine 1 Raw Dragon Meat |  |
| Flammable Oil | Cook pot | 1 |  | N/A | Cook pot | 2 Animal Fat |  |
| Flammable Oil | Player Crafting | 1 |  | N/A | Cook pot | 2 Animal Fat |  |
| Flare Coating | Cook pot | 1 |  | Alchemists | Cook pot | 3 Torchbug Thorax | Animal Harvesting Skill Greater or Equal to 1 |
| Flare Coating | Player Crafting | 1 |  | Alchemists | Cook pot | 3 Torchbug Thorax | Animal Harvesting Skill Greater or Equal to 1 |
| Flour | Grain Mill | 1 |  | N/A | Grain Mill | 2 Wheat |  |
| Fox Apple Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Green Apple 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox Apple Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Green Apple 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox Herb Cutlet | Cook pot | 2 |  | Chefs | Cook pot | 2 Frost Mirriam 1 Raw Fox Meat |  |
| Fox Herb Cutlet | Player Crafting | 2 |  | Chefs | Cook pot | 2 Frost Mirriam 1 Raw Fox Meat |  |
| Fox in a Hole | Cook pot | 1 |  | Chefs | Cook pot | 1 Carrot 1 Potato 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox in a Hole | Player Crafting | 1 |  | Chefs | Cook pot | 1 Carrot 1 Potato 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Fox Meat |  |
| Fox Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Fox Meat |  |
| Fragment: Bone | Breakdown | 150 |  | N/A | N/A | 5 Mammoth Tusk (Superlative) |  |
| Fragment: Bone | Breakdown | 2 |  | N/A | N/A | 1 Horker Tusk |  |
| Fragment: Bone | Breakdown | 20 |  | N/A | N/A | 5 Bull Horn |  |
| Fragment: Bone | Breakdown | 2 |  | N/A | N/A | 1 Doe Antlers |  |
| Fragment: Bone | Breakdown | 25 |  | N/A | N/A | 5 Animal Bone (Superlative) |  |
| Fragment: Bone | Breakdown | 3 |  | N/A | N/A | 1 Troll Skull |  |
| Fragment: Bone | Breakdown | 30 |  | N/A | N/A | 1 Mammoth Tusk (Superlative) |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Falmer |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 3 Canine Tooth |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 1 Human Skull |  |
| Fragment: Bone | Breakdown | 4 |  | N/A | N/A | 1 Bull Horn |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 3 Wolf Claws |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 1 Animal Bone (Superlative) |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 2 Sabre Cat Claws |  |
| Fragment: Bone | Breakdown | 15 |  | N/A | N/A | 5 Animal Bone (Large) |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 10 Bear Tooth |  |
| Fragment: Bone | Breakdown | 2 |  | N/A | N/A | 1 Engraved Bone of Hircine (Drained) |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 15 Wolf Claws |  |
| Fragment: Bone | Breakdown | 10 |  | N/A | N/A | 5 Doe Antlers (Superlative) |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 5 Animal Bone (Small) |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 10 Sabre Cat Claws |  |
| Fragment: Bone | Breakdown | 2 |  | N/A | N/A | 1 Engraved Bone of Kynareth (Drained) |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 1 Animal Bone (Small) |  |
| Fragment: Bone | Breakdown | 2 |  | N/A | N/A | 1 Engraved Bone of Julianos (Drained) |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 10 Bear Claws |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Forsworn |  |
| Fragment: Bone | Breakdown | 20 |  | N/A | N/A | 5 Buck Antlers |  |
| Fragment: Bone | Breakdown | 3 |  | N/A | N/A | 1 Doe Antlers (Superlative) |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 1 Buck Antlers (Superlative) |  |
| Fragment: Bone | Breakdown | 3 |  | N/A | N/A | 1 Animal Bone (Large) |  |
| Fragment: Bone | Breakdown | 20 |  | N/A | N/A | 1 Mammoth Tusk |  |
| Fragment: Bone | Breakdown | 30 |  | N/A | N/A | 1 Animal Bone (Enormous) |  |
| Fragment: Bone | Breakdown | 20 |  | N/A | N/A | 5 Buck Antlers (Superlative) |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 1 Sabre Cat Tooth |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 2 Bear Claws |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 15 Canine Tooth |  |
| Fragment: Bone | Breakdown | 1 |  | N/A | N/A | 2 Bear Tooth |  |
| Fragment: Bone | Breakdown | 10 |  | N/A | N/A | 5 Doe Antlers |  |
| Fragment: Bone | Breakdown | 100 |  | N/A | N/A | 5 Mammoth Tusk |  |
| Fragment: Bone | Breakdown | 10 |  | N/A | N/A | 5 Horker Tusk |  |
| Fragment: Bone | Breakdown | 5 |  | N/A | N/A | 5 Sabre Cat Tooth |  |
| Fragment: Bone | Breakdown | 4 |  | N/A | N/A | 1 Buck Antlers |  |
| Fragment: Building Glass | Breakdown | 3 |  | N/A | N/A | 1 Glass Bottle (Empty) |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Dawnbreaker Replica |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Helmet - Gilded |  |
| Fragment: Calcinium | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Elven |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Helmet - Thalmor Gilded |  |
| Fragment: Calcinium | Breakdown | 60 |  | N/A | N/A | 1 Elven Shield - Thalmor |  |
| Fragment: Calcinium | Breakdown | 80 |  | N/A | N/A | 1 Elven Cuirass |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Boots - Thalmor Gilded |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Boots - Thalmor |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Mace |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Light Helmet - Thalmor |  |
| Fragment: Calcinium | Breakdown | 60 |  | N/A | N/A | 1 Elven Shield - Gilded |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Sword |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Light Boots - Thalmor |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Light Helmet |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven War Axe |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Light Bow |  |
| Fragment: Calcinium | Breakdown | 80 |  | N/A | N/A | 1 Elven Cuirass - Thalmor Gilded |  |
| Fragment: Calcinium | Breakdown | 60 |  | N/A | N/A | 1 Elven Warhammer |  |
| Fragment: Calcinium | Breakdown | 80 |  | N/A | N/A | 1 Elven Cuirass - Gilded |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Light Boots |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Gauntlets |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Helmet - Thalmor |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Boots - Gilded |  |
| Fragment: Calcinium | Breakdown | 60 |  | N/A | N/A | 1 Elven Shield - Thalmor Gilded |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Battleaxe |  |
| Fragment: Calcinium | Breakdown | 60 |  | N/A | N/A | 1 Elven Shield |  |
| Fragment: Calcinium | Breakdown | 60 |  | N/A | N/A | 1 Elven Light Cuirass - Thalmor |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Light Crossbow |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Gauntlets - Thalmor Gilded |  |
| Fragment: Calcinium | Breakdown | 10 |  | N/A | N/A | 1 Amulet of Mara Replica |  |
| Fragment: Calcinium | Breakdown | 10 |  | N/A | N/A | 1 Elven Dagger |  |
| Fragment: Calcinium | Breakdown | 80 |  | N/A | N/A | 1 Elven Cuirass - Thalmor |  |
| Fragment: Calcinium | Breakdown | 60 |  | N/A | N/A | 1 Elven Light Cuirass |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Light Gauntlets - Thalmor |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Boots |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Gauntlets - Gilded |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Gauntlets - Thalmor |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Helmet |  |
| Fragment: Calcinium | Breakdown | 10 |  | N/A | N/A | 1 Elven Hunting Knife |  |
| Fragment: Calcinium | Breakdown | 40 |  | N/A | N/A | 1 Elven Greatsword |  |
| Fragment: Calcinium | Breakdown | 20 |  | N/A | N/A | 1 Elven Light Gauntlets |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Corundum Jug |  |
| Fragment: Corundum | Breakdown | 40 |  | N/A | N/A | 1 Ancient Nordic Helmet |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Hero Battleaxe |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Amulet of Dibella Replica |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Corundum Amphora |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Hero Heavy Crossbow |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Hero Greatsword |  |
| Fragment: Corundum | Breakdown | 5 |  | N/A | N/A | 1 Corundum Goblet |  |
| Fragment: Corundum | Breakdown | 1 |  | N/A | N/A | 1 Corundum Pot |  |
| Fragment: Corundum | Breakdown | 1 |  | N/A | N/A | 1 Corundum Vase |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Hero Gauntlets |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Corundum Bowl |  |
| Fragment: Corundum | Breakdown | 40 |  | N/A | N/A | 1 Thieves Guild Light Crossbow |  |
| Fragment: Corundum | Breakdown | 12 |  | N/A | N/A | 1 Amulet of Stendarr Replica |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Copper Onyx Circlet |  |
| Fragment: Corundum | Breakdown | 55 |  | N/A | N/A | 1 Ancient Nordic Salvaged Cuirass |  |
| Fragment: Corundum | Breakdown | 40 |  | N/A | N/A | 1 Ancient Nordic Hero Helm |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Corundum Bowl |  |
| Fragment: Corundum | Breakdown | 5 |  | N/A | N/A | 1 Corundum Flagon |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Amulet of Akatosh Replica |  |
| Fragment: Corundum | Breakdown | 80 |  | N/A | N/A | 1 Ancient Nordic Hero Cuirass |  |
| Fragment: Corundum | Breakdown | 5 |  | N/A | N/A | 1 Corundum Plate |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Copper Ruby Circlet |  |
| Fragment: Corundum | Breakdown | 15 |  | N/A | N/A | 1 Ancient Nordic Hero Mace |  |
| Fragment: Corundum | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Ancient Nordic Hero |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Honed War Axe |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Amulet of Arkay Replica |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Honed Battleaxe |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Honed Sword |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Hero Warhammer |  |
| Fragment: Corundum | Breakdown | 1 |  | N/A | N/A | 1 Dragon Priest Dagger |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Honed Heavy Bow |  |
| Fragment: Corundum | Breakdown | 15 |  | N/A | N/A | 1 Ancient Nordic Hero War Axe |  |
| Fragment: Corundum | Breakdown | 40 |  | N/A | N/A | 1 Ancient Nordic Hero Boots |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Copper Opal Circlet |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Copper Circlet |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Honed Greatsword |  |
| Fragment: Corundum | Breakdown | 15 |  | N/A | N/A | 1 Ancient Nordic Hero Sword |  |
| Fragment: Corundum | Breakdown | 10 |  | N/A | N/A | 1 Ancient Nordic Hero Dagger |  |
| Fragment: Corundum | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Hero Heavy Bow |  |
| Fragment: Corundum | Breakdown | 2 |  | N/A | N/A | 1 Corundum Cup |  |
| Fragment: Dwarven | Breakdown | 180 |  | N/A | N/A | 1 Dwarven Large Strut |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Dwarven Improved Light Crossbow |  |
| Fragment: Dwarven | Breakdown | 10 |  | N/A | N/A | 1 Dwarven Bent Scrap |  |
| Fragment: Dwarven | Breakdown | 2 |  | N/A | N/A | 1 Dwarven Cup |  |
| Fragment: Dwarven | Breakdown | 60 |  | N/A | N/A | 1 Dwarven Heavy Crossbow |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Dwarven Helmet |  |
| Fragment: Dwarven | Breakdown | 80 |  | N/A | N/A | 1 Dwarven Cuirass |  |
| Fragment: Dwarven | Breakdown | 210 |  | N/A | N/A | 1 Dwarven Decorated Strut |  |
| Fragment: Dwarven | Breakdown | 20 |  | N/A | N/A | 1 Dwarven Boots |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Dwarven Battleaxe |  |
| Fragment: Dwarven | Breakdown | 1 |  | N/A | N/A | 1 Dwarven Fork |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Dwarven Mace |  |
| Fragment: Dwarven | Breakdown | 1 |  | N/A | N/A | 1 Dwarven Spoon |  |
| Fragment: Dwarven | Breakdown | 5 |  | N/A | N/A | 1 Dwarven Scrap Metal |  |
| Fragment: Dwarven | Breakdown | 10 |  | N/A | N/A | 1 Dwarven Gyro |  |
| Fragment: Dwarven | Breakdown | 15 |  | N/A | N/A | 1 Dwarven Pan |  |
| Fragment: Dwarven | Breakdown | 1 |  | N/A | N/A | 1 Dwarven Knife |  |
| Fragment: Dwarven | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Dwarven |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Spellbreaker Replica |  |
| Fragment: Dwarven | Breakdown | 10 |  | N/A | N/A | 1 Dwarven Fishing Rod |  |
| Fragment: Dwarven | Breakdown | 20 |  | N/A | N/A | 1 Dwarven Handled Pan |  |
| Fragment: Dwarven | Breakdown | 5 |  | N/A | N/A | 1 Dwarven Small Lever |  |
| Fragment: Dwarven | Breakdown | 80 |  | N/A | N/A | 1 Dwarven Urn |  |
| Fragment: Dwarven | Breakdown | 15 |  | N/A | N/A | 1 Dwarven Cog |  |
| Fragment: Dwarven | Breakdown | 20 |  | N/A | N/A | 1 Dwarven Gauntlets |  |
| Fragment: Dwarven | Breakdown | 10 |  | N/A | N/A | 1 Dwarven Lever |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Dwarven Heavy Bow |  |
| Fragment: Dwarven | Breakdown | 10 |  | N/A | N/A | 1 Dwarven Shallow Bowl |  |
| Fragment: Dwarven | Breakdown | 30 |  | N/A | N/A | 1 Dwarven Small Plate Metal |  |
| Fragment: Dwarven | Breakdown | 20 |  | N/A | N/A | 1 Dwarven Sword |  |
| Fragment: Dwarven | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Dwarven Barding and Saddle |  |
| Fragment: Dwarven | Breakdown | 10 |  | N/A | N/A | 1 Dwarven Plate |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Dwarven Greatsword |  |
| Fragment: Dwarven | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Dwarven |  |
| Fragment: Dwarven | Breakdown | 150 |  | N/A | N/A | 1 Dwarven Solid Metal |  |
| Fragment: Dwarven | Breakdown | 60 |  | N/A | N/A | 1 Dwarven Pot |  |
| Fragment: Dwarven | Breakdown | 55 |  | N/A | N/A | 1 Dwarven Salvaged Cuirass |  |
| Fragment: Dwarven | Breakdown | 5 |  | N/A | N/A | 1 Dwarven Gear |  |
| Fragment: Dwarven | Breakdown | 60 |  | N/A | N/A | 1 Dwarven Shield |  |
| Fragment: Dwarven | Breakdown | 12 |  | N/A | N/A | 1 Dwarven Bowl |  |
| Fragment: Dwarven | Breakdown | 1 |  | N/A | N/A | 1 Dwarven Dagger |  |
| Fragment: Dwarven | Breakdown | 12 |  | N/A | N/A | 1 Dwarven Medium Bowl |  |
| Fragment: Dwarven | Breakdown | 15 |  | N/A | N/A | 1 Dwarven Engraved Bowl |  |
| Fragment: Dwarven | Breakdown | 60 |  | N/A | N/A | 1 Dwarven Warhammer |  |
| Fragment: Dwarven | Breakdown | 20 |  | N/A | N/A | 1 Dwarven War Axe |  |
| Fragment: Dwarven | Breakdown | 60 |  | N/A | N/A | 1 Dwarven Large Plate Metal |  |
| Fragment: Dwarven | Breakdown | 60 |  | N/A | N/A | 1 Dwarven Masterwork Light Crossbow |  |
| Fragment: Dwarven | Breakdown | 10 |  | N/A | N/A | 1 Dwarven Hunting Knife |  |
| Fragment: Dwarven | Breakdown | 40 |  | N/A | N/A | 1 Dwarven Masterwork Light Crossbow |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Daedric Hunting Knife |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Shield |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Ebony Mail Replica |  |
| Fragment: Ebony | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Ebony |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Boots - Silvered |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Mail Replica |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Daedric Battlestaff |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Ebony Sword |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Dragonbone Heavy Crossbow |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Ebony Gauntlets |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Daedric Cuirass |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Ebony Gauntlets - Silvered |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Nightingale Bow |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Dragonbone Dagger |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Irkngthand War Axe |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Heavy Bow |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Ebony Barding and Saddle |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Horse Armor: Ebony Barding and Saddle - Mail |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Ebony Cuirass - Silvered |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Daedric Helmet |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Helmet - Gilded |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Battleaxe |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Dragonplate Shield |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Dragonbone Battleaxe |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Daedric Heavy Crossbow |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Ebony War Axe |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Ebony Cuirass - Gilded |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Daedric Boots |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Dragonbone Sword |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Boots - Gilded |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Wuuthrad Replica |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Dragonbone Hunting Knife |  |
| Fragment: Ebony | Breakdown | 80 |  | N/A | N/A | 1 Ebony Cuirass |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Boots |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Warhammer |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Masque of Clavicus Vile Replica |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Dragonbone Heavy Bow |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Helmet - Silvered |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Ebony Hunting Knife |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Ebony Gauntlets - Gilded |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Harkon's Sword Replica |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Shield of Ysgramor Replica |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Shield - Silvered |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Dragonbone Warhammer |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Mace |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Ebony Blade Replica |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Greatsword |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Daedric Barding and Saddle |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Battlestaff |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Daedric Shield |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Dragonbone Greatsword |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Dragonplate Cuirass |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Ebony Dagger |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Dragonbone Mace |  |
| Fragment: Ebony | Breakdown | 10 |  | N/A | N/A | 1 Dragonbone War Axe |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Heavy Crossbow |  |
| Fragment: Ebony | Breakdown | 60 |  | N/A | N/A | 1 Ebony Shield - Gilded |  |
| Fragment: Ebony | Breakdown | 40 |  | N/A | N/A | 1 Ebony Helmet |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Nightingale Blade |  |
| Fragment: Ebony | Breakdown | 20 |  | N/A | N/A | 1 Daedric Gauntlets |  |
| Fragment: Galatite | Breakdown | 40 |  | N/A | N/A | 1 Circle Boots |  |
| Fragment: Galatite | Breakdown | 60 |  | N/A | N/A | 1 Circle Shield |  |
| Fragment: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Skyforge Steel |  |
| Fragment: Galatite | Breakdown | 40 |  | N/A | N/A | 1 Bloodskal Blade Replica |  |
| Fragment: Galatite | Breakdown | 40 |  | N/A | N/A | 1 Circle Helmet |  |
| Fragment: Galatite | Breakdown | 12 |  | N/A | N/A | 1 Amulet of Talos Replica |  |
| Fragment: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Nordic |  |
| Fragment: Galatite | Breakdown | 20 |  | N/A | N/A | 1 Circle Gauntlets |  |
| Fragment: Galatite | Breakdown | 10 |  | N/A | N/A | 1 Skyforge Steel Dagger |  |
| Fragment: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Nordic Dagger |  |
| Fragment: Galatite | Breakdown | 80 |  | N/A | N/A | 1 Circle Cuirass |  |
| Fragment: Gold | Breakdown | 20 |  | N/A | N/A | 1 Jewelled Dibella Statue |  |
| Fragment: Gold | Breakdown | 1 |  | N/A | N/A | 1 Gold Ring |  |
| Fragment: Gold | Breakdown | 5 |  | N/A | N/A | 1 Amulet of Julianos Replica |  |
| Fragment: Gold | Breakdown | 2 |  | N/A | N/A | 1 Gold Necklace |  |
| Fragment: Gold | Breakdown | 20 |  | N/A | N/A | 1 Dibella Statue |  |
| Fragment: Gold | Breakdown | 20 |  | N/A | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Gold | Breakdown | 10 |  | N/A | N/A | 1 Gold Circlet |  |
| Fragment: Gold | Breakdown | 20 |  | N/A | N/A | 1 Ebony Cuirass - Gilded |  |
| Fragment: Gold | Breakdown | 20 |  | N/A | N/A | 1 Elven Cuirass - Thalmor Gilded |  |
| Fragment: Gold | Breakdown | 20 |  | N/A | N/A | 1 Elven Cuirass - Gilded |  |
| Fragment: Gold | Breakdown | 20 |  | N/A | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Gold | Breakdown | 10 |  | N/A | N/A | 1 Gold Emerald Circlet (Flawless) |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Iron Robed Cuirass - Pale |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - Haafingar |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Iron Braced Vagabond Cuirass |  |
| Fragment: Iron | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Ancient Nordic |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Ancient Nordic Greatsword |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Iron Makeshift Cuirass |  |
| Fragment: Iron | Breakdown | 5 |  | N/A | N/A | 1 Iron Hammer |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Boots |  |
| Fragment: Iron | Breakdown | 80 |  | N/A | N/A | 1 Iron Warhammer |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Leather Surcoat |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - The Rift |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Quality Cuirass |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Battleaxe |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Studded Cuirass |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Mace |  |
| Fragment: Iron | Breakdown | 25 |  | N/A | N/A | 1 Iron Torture Tools |  |
| Fragment: Iron | Breakdown | 80 |  | N/A | N/A | 1 Iron Banded Quality Cuirass |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - Whiterun |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Surcoat |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Oiled Mail and Tunic |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Masterwork Shield |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - Winterhold |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Shovel |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Pickaxe |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Lantern |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Masterwork Helmet |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - The Pale |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Helmet |  |
| Fragment: Iron | Breakdown | 80 |  | N/A | N/A | 1 Iron Banded Cuirass |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - The Reach |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Greatsword |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - The Pale |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - Eastmarch |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Ancient Nordic Helmet - Antlers |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - The Rift |  |
| Fragment: Iron | Breakdown | 80 |  | N/A | N/A | 1 Iron Banded Masterwork Cuirass |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Ancient Nordic Cuirass |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Battlestaff |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Hunting Knife |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Oiled Mail and Jacket |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Quality Shield |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Quality Gauntlets |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Ancient Nordic Battleaxe |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Large Shovel |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Banded Quality Shield |  |
| Fragment: Iron | Breakdown | 5 |  | N/A | N/A | 1 Iron Sword Hilt |  |
| Fragment: Iron | Breakdown | 6 |  | N/A | N/A | 1 Iron Lock |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - Winterhold |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Masterwork Cuirass |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Pitchfork |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - The Reach |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - Falkreath |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - Winterhold |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - Whiterun |  |
| Fragment: Iron | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Iron |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Leathers |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Ancient Nordic Boots |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Stormcloak Heavy Helmet |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Stormcloak Light Cuirass |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Heavy Shield |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Quality Boots |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron War Axe Hilt |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Stormcloak Sleeved Heavy Cuirass |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Dagger |  |
| Fragment: Iron | Breakdown | 5 |  | N/A | N/A | 1 Iron Tongs |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Sword |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Helmet - Ram |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Gauntlets - Engraved |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Fittings |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Quality Helmet |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Sword Blade |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron War Axe Head |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Banded Shield |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Jacket |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Iron Vagabond Cuirass |  |
| Fragment: Iron | Breakdown | 5 |  | N/A | N/A | 1 Iron Hinge |  |
| Fragment: Iron | Breakdown | 7 |  | N/A | N/A | 1 Iron Serving Dish |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - Falkreath |  |
| Fragment: Iron | Breakdown | 5 |  | N/A | N/A | 1 Iron Embalming Drill |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - Whiterun |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Oiled Mail and Hide |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Cuirass |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - Hjaalmarch |  |
| Fragment: Iron | Breakdown | 80 |  | N/A | N/A | 1 Iron Banded Cuirass - Engraved |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - Haafingar |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Iron Robed Cuirass - Dark |  |
| Fragment: Iron | Breakdown | 1 |  | N/A | N/A | 1 Iron Nails |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Gauntlets |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Gauntlets |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Boots - Engraved |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Masterwork Boots |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Light Guard's Shield - Hjaalmarch |  |
| Fragment: Iron | Breakdown | 60 |  | N/A | N/A | 1 Iron Cuirass - Engraved |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Hide |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Imperial Outcast Boots |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - Falkreath |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - Haafingar |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Heavy Crossbow |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron War Axe |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - The Pale |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Light Bow |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Clothes Press |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Woodcutter's Axe |  |
| Fragment: Iron | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Iron |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Light Guard's Helmet - The Rift |  |
| Fragment: Iron | Breakdown | 120 |  | N/A | N/A | 1 Iron Cauldron |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Pot |  |
| Fragment: Iron | Breakdown | 1 |  | N/A | N/A | 1 Iron Fork |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Iron Furred Cuirass |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Mace Head |  |
| Fragment: Iron | Breakdown | 1 |  | N/A | N/A | 1 Iron Knife |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic War Axe |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - The Reach |  |
| Fragment: Iron | Breakdown | 25 |  | N/A | N/A | 1 Iron Large Pot |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Headsman's Axe |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Ancient Nordic Sword |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Pauldroned Leather |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Iron Dish |  |
| Fragment: Iron | Breakdown | 2 |  | N/A | N/A | 1 Iron Tankard |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Masterwork Gauntlets |  |
| Fragment: Iron | Breakdown | 1 |  | N/A | N/A | 1 Lockpick |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Iron Mace Hilt |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Tunic |  |
| Fragment: Iron | Breakdown | 20 |  | N/A | N/A | 1 Fur Guard's Cuirass - Hjaalmarch |  |
| Fragment: Iron | Breakdown | 10 |  | N/A | N/A | 1 Imperial Dagger |  |
| Fragment: Iron | Breakdown | 40 |  | N/A | N/A | 1 Iron Helmet - Engraved |  |
| Fragment: Iron | Breakdown | 120 |  | N/A | N/A | 1 Iron Kettle |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Mail and Rugged Leather |  |
| Fragment: Iron | Breakdown | 55 |  | N/A | N/A | 1 Robed Mail |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Mace |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Helmet - Vvardenfell |  |
| Fragment: Malachite | Breakdown | 20 |  | N/A | N/A | 1 Glass Gauntlets |  |
| Fragment: Malachite | Breakdown | 60 |  | N/A | N/A | 1 Glass Warhammer |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Battleaxe |  |
| Fragment: Malachite | Breakdown | 60 |  | N/A | N/A | 1 Glass Shield - Thalmor |  |
| Fragment: Malachite | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Divine Aegis Barding and Saddle |  |
| Fragment: Malachite | Breakdown | 20 |  | N/A | N/A | 1 Glass War Axe |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Boots - Thalmor |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Battlestaff |  |
| Fragment: Malachite | Breakdown | 60 |  | N/A | N/A | 1 Glass Shield - Vvardenfell |  |
| Fragment: Malachite | Breakdown | 20 |  | N/A | N/A | 1 Glass Gauntlets - Thalmor |  |
| Fragment: Malachite | Breakdown | 10 |  | N/A | N/A | 1 Glass Hunting Knife |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Helmet - Thalmor |  |
| Fragment: Malachite | Breakdown | 80 |  | N/A | N/A | 1 Glass Cuirass |  |
| Fragment: Malachite | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Glass |  |
| Fragment: Malachite | Breakdown | 20 |  | N/A | N/A | 1 Glass Gauntlets - Vvardenfell |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Boots - Vvardenfell |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Light Bow |  |
| Fragment: Malachite | Breakdown | 80 |  | N/A | N/A | 1 Glass Cuirass - Thalmor |  |
| Fragment: Malachite | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Glass |  |
| Fragment: Malachite | Breakdown | 20 |  | N/A | N/A | 1 Chillrend Replica |  |
| Fragment: Malachite | Breakdown | 10 |  | N/A | N/A | 1 Glass Dagger |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Light Crossbow |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Boots |  |
| Fragment: Malachite | Breakdown | 60 |  | N/A | N/A | 1 Glass Shield |  |
| Fragment: Malachite | Breakdown | 80 |  | N/A | N/A | 1 Glass Cuirass - Vvardenfell |  |
| Fragment: Malachite | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Frost Aegis Barding and Saddle |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Helmet |  |
| Fragment: Malachite | Breakdown | 40 |  | N/A | N/A | 1 Glass Greatsword |  |
| Fragment: Malachite | Breakdown | 20 |  | N/A | N/A | 1 Glass Sword |  |
| Fragment: Moonstone | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Cleric Barding and Saddle |  |
| Fragment: Moonstone | Breakdown | 40 |  | N/A | N/A | 1 Auriel's Shield Replica |  |
| Fragment: Moonstone | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Elven Barding and Saddle - Amber |  |
| Fragment: Moonstone | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Elven |  |
| Fragment: Moonstone | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Elven Barding and Saddle - Dusk |  |
| Fragment: Orichalcum | Breakdown | 10 |  | N/A | N/A | 1 Orichalc Circlet |  |
| Fragment: Orichalcum | Breakdown | 20 |  | N/A | N/A | 1 Orcish War Axe |  |
| Fragment: Orichalcum | Breakdown | 10 |  | N/A | N/A | 1 Orichalc Sapphire Circlet |  |
| Fragment: Orichalcum | Breakdown | 20 |  | N/A | N/A | 1 Orcish Sword |  |
| Fragment: Orichalcum | Breakdown | 40 |  | N/A | N/A | 1 Orcish Boots |  |
| Fragment: Orichalcum | Breakdown | 40 |  | N/A | N/A | 1 Orcish Greatsword |  |
| Fragment: Orichalcum | Breakdown | 20 |  | N/A | N/A | 1 Orcish Gauntlets |  |
| Fragment: Orichalcum | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Orcish |  |
| Fragment: Orichalcum | Breakdown | 40 |  | N/A | N/A | 1 Orcish Heavy Bow |  |
| Fragment: Orichalcum | Breakdown | 10 |  | N/A | N/A | 1 Orcish Hunting Knife |  |
| Fragment: Orichalcum | Breakdown | 40 |  | N/A | N/A | 1 Orcish Battleaxe |  |
| Fragment: Orichalcum | Breakdown | 80 |  | N/A | N/A | 1 Orcish Cuirass |  |
| Fragment: Orichalcum | Breakdown | 60 |  | N/A | N/A | 1 Orcish Shield |  |
| Fragment: Orichalcum | Breakdown | 10 |  | N/A | N/A | 1 Orcish Dagger |  |
| Fragment: Orichalcum | Breakdown | 40 |  | N/A | N/A | 1 Orcish Mace |  |
| Fragment: Orichalcum | Breakdown | 40 |  | N/A | N/A | 1 Orcish Helmet |  |
| Fragment: Orichalcum | Breakdown | 60 |  | N/A | N/A | 1 Orcish Warhammer |  |
| Fragment: Orichalcum | Breakdown | 40 |  | N/A | N/A | 1 Orcish Heavy Crossbow |  |
| Fragment: Orichalcum | Breakdown | 10 |  | N/A | N/A | 1 Argonian Fishing Rod |  |
| Fragment: Orichalcum | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Orcish |  |
| Fragment: Quicksilver | Breakdown | 10 |  | N/A | N/A | 1 Alik'ri Fishing Rod |  |
| Fragment: Quicksilver | Breakdown | 10 |  | N/A | N/A | 1 Amulet of the Kynareth Replica |  |
| Fragment: Quicksilver | Breakdown | 20 |  | N/A | N/A | 1 Dragonscale Cuirass |  |
| Fragment: Quicksilver | Breakdown | 20 |  | N/A | N/A | 1 Dragonscale Shield |  |
| Fragment: Silver | Breakdown | 6 |  | N/A | N/A | 1 Silver Adorned Bowl |  |
| Fragment: Silver | Breakdown | 4 |  | N/A | N/A | 1 Silver Large Goblet |  |
| Fragment: Silver | Breakdown | 12 |  | N/A | N/A | 1 Silver Ewer |  |
| Fragment: Silver | Breakdown | 10 |  | N/A | N/A | 1 Silver Greatsword |  |
| Fragment: Silver | Breakdown | 7 |  | N/A | N/A | 1 Silver Candlestick |  |
| Fragment: Silver | Breakdown | 20 |  | N/A | N/A | 1 Ebony Cuirass - Silvered |  |
| Fragment: Silver | Breakdown | 20 |  | N/A | N/A | 1 Silver Platter |  |
| Fragment: Silver | Breakdown | 5 |  | N/A | N/A | 3 Silver Sword |  |
| Fragment: Silver | Breakdown | 7 |  | N/A | N/A | 1 Silver Plate |  |
| Fragment: Silver | Breakdown | 10 |  | N/A | N/A | 1 Silver Emerald Circlet |  |
| Fragment: Silver | Breakdown | 10 |  | N/A | N/A | 1 Silver Circlet |  |
| Fragment: Silver | Breakdown | 2 |  | N/A | N/A | 1 Silver Necklace |  |
| Fragment: Silver | Breakdown | 3 |  | N/A | N/A | 1 Silver Goblet |  |
| Fragment: Silver | Breakdown | 10 |  | N/A | N/A | 1 Silver Triple Candlestick |  |
| Fragment: Silver | Breakdown | 10 |  | N/A | N/A | 1 Silver Sapphire Circlet (Flawless) |  |
| Fragment: Silver | Breakdown | 5 |  | N/A | N/A | 1 Silver Bowl |  |
| Fragment: Silver | Breakdown | 20 |  | N/A | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Silver | Breakdown | 1 |  | N/A | N/A | 1 Silver Ring |  |
| Fragment: Silver | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Silver |  |
| Fragment: Silver | Breakdown | 10 |  | N/A | N/A | 1 Silver Ruby Circlet |  |
| Fragment: Silver | Breakdown | 7 |  | N/A | N/A | 1 Silver Candlestick |  |
| Fragment: Silver | Breakdown | 20 |  | N/A | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Silver | Breakdown | 20 |  | N/A | N/A | 1 Silver Candelabrum |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard Heavy Shield |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard Reinforced Light Cuirass - Blue |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Plate Gauntlets |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Imperial Heavy Cuirass |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Steel Sword Hilt |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Chef's |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Steel Battleaxe |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard War Axe |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Steel Saw |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Gauntlets |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial Heavy Boots |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Blades Gauntlets |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard Light Crossbow |  |
| Fragment: Steel | Breakdown | 55 |  | N/A | N/A | 1 Steel Braced Cuirass |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Horned Helmet |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Steel Warhammer Head |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Dawnguard Light Boots |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Dawnguard Barding and Saddle |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Helmet - White |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial Sword |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Battlestaff |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Silver Sword |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Dawnguard Rune Warhammer Replica |  |
| Fragment: Steel | Breakdown | 55 |  | N/A | N/A | 1 Steel Furred Cuirass |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Savior's Hide Replica - Black |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Stormcloak Officer Boots |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Steel Pauldroned Cuirass |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Scaled Bracers |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Stormcloak |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Stormcloak Officer Cuirass |  |
| Fragment: Steel | Breakdown | 35 |  | N/A | N/A | 1 Steel Warhammer Hilt |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Wolf Cuirass |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial Heavy Helmet |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Boots |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Steel Warhammer |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Boots - White |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Blades Shield |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Plate Boots |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Blades Cuirass |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel War Axe |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial Shortsword |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Savior's Hide Replica |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Steel Plate Cuirass |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Helm of Yngol Replica |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Dark Brotherhood |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Dawnguard Heavy Gauntlets |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Gauntlets - White |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Dawnguard |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Wolf Gauntlets |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Sword |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Silver Battlestaff |  |
| Fragment: Steel | Breakdown | 2 |  | N/A | N/A | 1 Steel Buckles |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Thieves' |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial Mace |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Scaled Cuirass |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Dawnguard Heavy Cuirass - Black |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Amulet of Zenithar Replica |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Imperial Barding and Saddle |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Heavy Crossbow |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Steel Shield |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Blades Boots |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Silver Greatsword |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Scimitar |  |
| Fragment: Steel | Breakdown | 25 |  | N/A | N/A | 1 Steel Greatsword Hilt |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Builder's |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Sword Blade |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Death Hound Collar |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Jarl of Eastmarch Armor |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Dawnguard Light Gauntlets |  |
| Fragment: Steel | Breakdown | 4 |  | N/A | N/A | 1 Steel Shears |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Smith's |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard Heavy Helmet |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Dawnguard Light Cuirass - Black |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard Rune War Axe Replica |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Battleaxe Hilt |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial Heavy Bracers |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Wolf Boots |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Steel Dagger |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Steel Greatsword Blade |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Rueful Axe Replica |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Mace |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Wolf Helmet |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Dawnguard Light Helmet |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Imperial Heavy Crossbow |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Steel Cuirass |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Dawnguard Barding and Saddle - Adorned |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Imperial Heavy Shield |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Scaled Cuirass - Horned |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Dawnguard Heavy Cuirass - Grey |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Imperial Heavy Bow |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Scaled Helmet |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Imperial Officer Heavy Helmet |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Thieves Guild |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Wolf Shield |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Imperial Crested Heavy Helmet |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Steel Bracers |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Scaled Boots |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Black Hand Barding and Saddle |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial General Cuirass |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Greaves |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Steel Pauldroned Cuirass - White |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Blades Helmet |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Imperial |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Jarl of Eastmarch Armguards |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Dawnguard Light Cuirass - Red |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Plate Helmet |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Dawnguard Reinforced Light Cuirass - Blue |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Nordic Barding and Saddle |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Dawnguard Light Cuirass - Red |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Ancient Nordic Hero |  |
| Fragment: Steel | Breakdown | 2 |  | N/A | N/A | 1 Steel Scalpel |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Akaviri Katana |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Steel |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Jeweler's |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Stormcloak Officer Helmet |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Steel Battleaxe Head |  |
| Fragment: Steel | Breakdown | 2 |  | N/A | N/A | 1 Steel Embalming Pick |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Steel |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Stormcloak General Boots |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard Improved Light Crossbow |  |
| Fragment: Steel | Breakdown | 55 |  | N/A | N/A | 1 Steel Furred Plate Cuirass |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Dawnguard Heavy Boots |  |
| Fragment: Steel | Breakdown | 20 |  | N/A | N/A | 1 Imperial Light Shield |  |
| Fragment: Steel | Breakdown | 1 |  | N/A | N/A | 1 Stormcloak Officer Bracers |  |
| Fragment: Steel | Breakdown | 10 |  | N/A | N/A | 1 Steel Hunting Knife |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Stormcloak Heavy Crossbow |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Greatsword |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dark Brotherhood Heavy Crossbow |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Dawnguard Warhammer |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Savior's Hide Replica - White |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Dawnguard Rune Shield Replica |  |
| Fragment: Steel | Breakdown | 60 |  | N/A | N/A | 1 Horse Armor: Black Hand Barding and Saddle - Adorned |  |
| Fragment: Steel | Breakdown | 40 |  | N/A | N/A | 1 Steel Helmet |  |
| Fragment: Steel | Breakdown | 80 |  | N/A | N/A | 1 Steel Cuirass - White |  |
| Fur Large Tent | Player Crafting | 1 |  | Survivalists | N/A | 1 Fur Large Tent (Two Bedrolls) |  |
| Fur Large Tent (Three Bedrolls) | Player Crafting | 1 |  | Survivalists | N/A | 1 Fur Large Tent (Four Bedrolls) |  |
| Fur Large Tent (Two Bedrolls) | Player Crafting | 1 |  | Survivalists | N/A | 1 Fur Large Tent (Three Bedrolls) |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Ornate White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Forsworn Cuirass |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Noble Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Backpack - Black |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Fur Sleeveless Cuirass |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Vagabond Cuirass |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Rags - Pale |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Ornate White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Light Trimmed White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Dark Trimmed Black |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Ornate Brown |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Brown |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Trimmed White |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Dark Trimmed Brown |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Tattered Cuirass |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Bracers |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Light Trimmed Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Ornate Brown |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Ornate White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Forsworn Headdress |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Forsworn Gauntlets |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Tattered Cuirass - Pale |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Noble White |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Makeshift Cuirass |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Light Trimmed Brown |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Forsworn Boots |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Trimmed Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Kilt |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Trimmed Brown |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Ornate Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Trimmed White |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Scrap Cuirass |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Rags - Dark |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Light Trimmed White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Dark Trimmed White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - White |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Trimmed Brown |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Light Trimmed Brown |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Brown |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Boots |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Trimmed Black |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - White |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Fur Cuirass |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Imperial Outcast Bracers |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Ornate Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Shoes |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Backpack - Brown |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Ornate Brown |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Noble Brown |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Dark Trimmed Black |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Furred Robes - Dark |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Ornate Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Helmet |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Imperial Outcast Helmet |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Brown |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Brown |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Furred Robes - Pale |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Backpack - White |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Rugged Cuirass |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Ornate Brown |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - Black |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Mantled Kilt |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Black |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Black |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Wolfskin Hood - White |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Fur Gauntlets |  |
| Fur Plate | Breakdown | 1 |  | N/A | N/A | 1 Bearskin Hood - Ornate Black |  |
| Fur Plate | Breakdown | 3 |  | N/A | N/A | 1 Bearskin Cloak - Ornate White |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Fur Bedroll |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Light Trimmed Black |  |
| Fur Plate | Breakdown | 2 |  | N/A | N/A | 1 Wolfskin Cloak - Dark Trimmed White |  |
| Fur Small Tent | Player Crafting | 1 |  | Survivalists | N/A | 1 Fur Small Tent (Two Bedrolls) |  |
| Garlic Boar | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Raw Boar Meat |  |
| Garlic Boar | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Raw Boar Meat |  |
| Garlic Bread | Player Crafting | 2 |  | Chefs | Oven | 1 Garlic 1 Bread Loaf 1 Butter |  |
| Garlic Bread | Oven | 2 |  | Chefs | Oven | 1 Garlic 1 Bread Loaf 1 Butter |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Glass Bottle (Water) |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Jessica's Wine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 White-Gold Tower |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Nord Mead |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Flin |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Ale |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Ashfire Mead |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Argonian Bloodwine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Cliff Racer |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Black-Briar Reserve |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Ale |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Black-Briar Mead |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Juniper Berry Mead |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Argonian Ale |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Sadri's Sujamma |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Cinnabar Beer |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Dragon's Breath Mead |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Alto Blanc Wine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Honningbrew Mead |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Cyrodilic Brandy |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Village Red Wine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Sujamma |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Firebrand Wine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Stros M'Kai Rum |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Velvet LeChance |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Bottled Milk |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Mazte |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Shein |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Emberbrand Wine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Mulled Wine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Village White Wine |  |
| Glass Bottle (Empty) | Breakdown | 1 |  | N/A | N/A | 1 Alto Noir Wine |  |
| Glass Bottle (Water) | Player Crafting | 1 |  | N/A | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Glass Bottle (Water) | Cook pot | 1 |  | N/A | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Glazed Goat Loin | Cook pot | 1 |  | Chefs | Cook pot | 2 Snowberries 1 Honey 1 Raw Goat Meat |  |
| Glazed Goat Loin | Player Crafting | 1 |  | Chefs | Cook pot | 2 Snowberries 1 Honey 1 Raw Goat Meat |  |
| Goat and Potato Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Potato 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Goat and Potato Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Potato 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Goat Cheese Slice | Breakdown | 2 |  | N/A | N/A | 1 Goat Cheese Wedge |  |
| Goat Cheese Wedge | Breakdown | 3 |  | N/A | N/A | 1 Goat Cheese Wheel |  |
| Goat Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Goat Leg |  |
| Goat Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Goat Meat |  |
| Goat Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Goat Leg |  |
| Goat Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Goat Meat |  |
| High King's Stew | Cook pot | 2 |  | Chefs | Cook pot | 1 Carrot 1 Leek 1 Raw Dragon Meat |  |
| High King's Stew | Player Crafting | 2 |  | Chefs | Cook pot | 1 Carrot 1 Leek 1 Raw Dragon Meat |  |
| Honeyed Mammoth Roast | Cook pot | 1 |  | Chefs | Cook pot | 1 Honey 1 Raw Mammoth Meat |  |
| Honeyed Mammoth Roast | Player Crafting | 1 |  | Chefs | Cook pot | 1 Honey 1 Raw Mammoth Meat |  |
| Honningbrew Mead | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 2 Green Apple 1 Honey |  |
| Honningbrew Mead | Player Crafting | 2 |  | Brewers | Brewing Barrel | 2 Green Apple 1 Honey |  |
| Horker and Ash Yam Stew | Player Crafting | 2 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Raw Horker Meat 3 Ash Yam 1 Glass Bottle (Water) |  |
| Horker and Ash Yam Stew | Cook pot | 2 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Raw Horker Meat 3 Ash Yam 1 Glass Bottle (Water) |  |
| Horker Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Horker Meat |  |
| Horker Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Horker Meat |  |
| Horker Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Garlic 1 Lavender 1 Tomato 1 Raw Horker Meat 1 Glass Bottle (Water) |  |
| Horker Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Garlic 1 Lavender 1 Tomato 1 Raw Horker Meat 1 Glass Bottle (Water) |  |
| Horse Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Horse Meat |  |
| Horse Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Horse Meat |  |
| Hot Honey Horker | Player Crafting | 1 |  | Chefs | Cook pot | 1 Raw Horker Meat 1 Honey |  |
| Hot Honey Horker | Cook pot | 1 |  | Chefs | Cook pot | 1 Raw Horker Meat 1 Honey |  |
| Hunter's Hearty Stew | Player Crafting | 2 |  | Chefs | Cook pot | 1 Cabbage 1 Potato 1 Raw Venison 1 Raw Elk Meat 1 Glass Bottle (Water) |  |
| Hunter's Hearty Stew | Cook pot | 2 |  | Chefs | Cook pot | 1 Cabbage 1 Potato 1 Raw Venison 1 Raw Elk Meat 1 Glass Bottle (Water) |  |
| Ingot: Galatite | Breakdown | 4 |  | N/A | N/A | 1 Nordic Cuirass - Brown |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Boots - Brown |  |
| Ingot: Galatite | Breakdown | 4 |  | N/A | N/A | 1 Champion's Cudgel Replica |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Nordic War Axe |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Skyforge Steel Heavy Bow |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Boots - White |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Helmet - Black |  |
| Ingot: Galatite | Breakdown | 3 |  | N/A | N/A | 1 Skyforge Steel Battleaxe |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Skyforge Steel Greatsword |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Nordic Sword |  |
| Ingot: Galatite | Breakdown | 3 |  | N/A | N/A | 1 Skyforge Steel Aegis |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Skyforge Steel War Axe |  |
| Ingot: Galatite | Breakdown | 3 |  | N/A | N/A | 1 Nordic Shield - Black |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Skyforge Steel Sword |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Boots - Black |  |
| Ingot: Galatite | Breakdown | 4 |  | N/A | N/A | 1 Skyforge Steel Warhammer |  |
| Ingot: Galatite | Breakdown | 3 |  | N/A | N/A | 1 Nordic Shield - Brown |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Nordic Gauntlets - Black |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Greatsword |  |
| Ingot: Galatite | Breakdown | 4 |  | N/A | N/A | 1 Nordic Cuirass - White |  |
| Ingot: Galatite | Breakdown | 3 |  | N/A | N/A | 1 Nordic Shield - White |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Nordic Gauntlets - Brown |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Battleaxe |  |
| Ingot: Galatite | Breakdown | 1 |  | N/A | N/A | 1 Nordic Gauntlets - White |  |
| Ingot: Galatite | Breakdown | 4 |  | N/A | N/A | 1 Nordic Cuirass - Black |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Mace |  |
| Ingot: Galatite | Breakdown | 2 |  | N/A | N/A | 1 Nordic Heavy Bow |  |
| Ingot: Galatite | Breakdown | 3 |  | N/A | N/A | 1 Nordic Warhammer |  |
| Ingot: Moonstone | Breakdown | 2 |  | N/A | N/A | 1 Auriel's Bow Replica |  |
| Ingot: Moonstone | Breakdown | 1 |  | N/A | N/A | 1 Snow Elf Crown |  |
| Ingot: Moonstone | Breakdown | 2 |  | N/A | N/A | 1 Snow Elf Boots |  |
| Ingot: Moonstone | Breakdown | 1 |  | N/A | N/A | 1 Snow Elf Gauntlets |  |
| Ingot: Moonstone | Breakdown | 4 |  | N/A | N/A | 1 Snow Elf Cuirass |  |
| Ingot: Quicksilver | Breakdown | 1 |  | N/A | N/A | 1 Nordic Heavy Crossbow |  |
| Item Name | Crafting WorkBench |  |  | Toolkits | Proximity(When Player Crafting) | Components | Requirements |
| Jazbay Crostata | Oven | 2 |  | Chefs | Oven | 10 Jazbay Grapes 1 Honey 1 Flour 1 Butter |  |
| Jazbay Crostata | Player Crafting | 2 |  | Chefs | Oven | 10 Jazbay Grapes 1 Honey 1 Flour 1 Butter |  |
| Juniper Berry Crostata | Oven | 2 |  | Chefs | Oven | 10 Juniper Berries 1 Honey 1 Flour 1 Butter |  |
| Juniper Berry Crostata | Player Crafting | 2 |  | Chefs | Oven | 10 Juniper Berries 1 Honey 1 Flour 1 Butter |  |
| Juniper Berry Mead | Player Crafting | 2 |  | Brewers | Brewing Barrel | 2 Juniper Berries 1 Honey |  |
| Juniper Berry Mead | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 2 Juniper Berries 1 Honey |  |
| Juniper Tea | Cook pot | 1 |  | Chefs | Cook pot | 3 Juniper Berries 1 Honeycomb 1 Glass Bottle (Water) |  |
| Juniper Tea | Player Crafting | 1 |  | Chefs | Cook pot | 3 Juniper Berries 1 Honeycomb 1 Glass Bottle (Water) |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Dark Brotherhood |  |
| Kindling | Breakdown | 4 |  | N/A | N/A | 1 Wooden Roped Bucket |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Dwarven |  |
| Kindling | Breakdown | 3 |  | N/A | N/A | 1 Wooden Heavy Bow |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Wooden Ladle |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Glass |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Stormcloak |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Wooden Plate |  |
| Kindling | Breakdown | 6 |  | N/A | N/A | 1 Wooden Drum |  |
| Kindling | Breakdown | 3 |  | N/A | N/A | 1 Wooden Light Bow |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Ancient Nordic |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Orcish |  |
| Kindling | Player Crafting | 2 |  | Survivalists | N/A | 1 Deadwood |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Ancient Nordic Hero |  |
| Kindling | Breakdown | 10 |  | N/A | N/A | 5 Wooden Battlestaff |  |
| Kindling | Breakdown | 4 |  | N/A | N/A | 1 Wooden Bellows |  |
| Kindling | Smelter | 5 |  | N/A | Smelter | 1 Iron Woodcutter's Axe |  |
| Kindling | Breakdown | 6 |  | N/A | N/A | 1 Wooden Lute |  |
| Kindling | Player Crafting | 4 |  | Survivalists | N/A | 1 Wood |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Ancient Nordic Hero |  |
| Kindling | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Alchemist's |  |
| Kindling | Breakdown | 4 |  | N/A | N/A | 1 Wooden Pitchfork |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Glass |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Elven |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Silver |  |
| Kindling | Breakdown | 2 |  | N/A | N/A | 1 Wooden Torch |  |
| Kindling | Breakdown | 2 |  | N/A | N/A | 1 Wooden Fishing Rod |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Iron |  |
| Kindling | Breakdown | 2 |  | N/A | N/A | 1 Wooden Torch (Bright) |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Falmer |  |
| Kindling | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Brewer's |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Ebony |  |
| Kindling | Breakdown | 4 |  | N/A | N/A | 1 Wooden Well Bucket |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Wooden Bowl |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Steel |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Nordic |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Thieves Guild |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Iron |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Dawnguard |  |
| Kindling | Breakdown | 5 |  | N/A | N/A | 1 Iron Pickaxe |  |
| Kindling | Player Crafting | 1 |  | Survivalists | N/A | 1 Branches |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Bolt: Imperial |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Elven |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Orcish |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Forsworn |  |
| Kindling | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Survivalist's |  |
| Kindling | Breakdown | 10 |  | N/A | N/A | 1 Wooden Light Crossbow |  |
| Kindling | Breakdown | 2 |  | N/A | N/A | 1 Wooden Broom |  |
| Kindling | Breakdown | 10 |  | N/A | N/A | 1 Toolkit: Tailor's |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Skyforge Steel |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Steel |  |
| Kindling | Breakdown | 2 |  | N/A | N/A | 1 Wooden Flute |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Arrow: Dwarven |  |
| Kindling | Breakdown | 1 |  | N/A | N/A | 1 Wooden Spigot |  |
| Knucklebones (Strange Brew) | Player Crafting | 1 |  | Survivalists | N/A | 3 Fragment: Bone | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 3 |
| Lavender Honey Dumpling | Player Crafting | 2 |  | Chefs | Oven | 6 Lavender 1 Moon Sugar 1 Honey 1 Flour |  |
| Lavender Honey Dumpling | Oven | 2 |  | Chefs | Oven | 6 Lavender 1 Moon Sugar 1 Honey 1 Flour |  |
| Lavender Tea | Player Crafting | 1 |  | Chefs | Cook pot | 2 Lavender 3 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Lavender Tea | Cook pot | 1 |  | Chefs | Cook pot | 2 Lavender 3 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Leather Doublet |  |
| Leather | Breakdown | 3 |  | N/A | N/A | 1 Studded Furred Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Scrap Robes |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Vagabond Robes - Dark |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Leather Boiled Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Leather Vagabond Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Scrap Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Furred Vagabond Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Tattered Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Leather Rugged Cuirass - Pale |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Makeshift Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Roughspun Tunic |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Rugged Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Furred Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Leather Rugged Cuirass - Dark |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Leather Doublet - Dark |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Vagabond Robes - Pale |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Vagabond Cuirass |  |
| Leather | Breakdown | 2 |  | N/A | N/A | 1 Hide Vagabond Robes - Dark |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Ornate White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Dark Trimmed Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Dark Trimmed White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Noble White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Ornate Black |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Trimmed Black |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Ornate Black |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Ornate White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Light Trimmed Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Black |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Ornate Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Light Trimmed White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Trimmed White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Ornate Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Noble Black |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Black |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Noble Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - Trimmed Brown |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Light Trimmed Black |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Bearskin Hood - White |  |
| Leather Helmet | Breakdown | 1 |  | N/A | N/A | 1 Leather Wolfskin Hood - Dark Trimmed Black |  |
| Leather Large Tent | Player Crafting | 1 |  | Survivalists | N/A | 1 Leather Large Tent (Two Bedrolls) |  |
| Leather Large Tent (Two Bedrolls) | Player Crafting | 1 |  | Survivalists | N/A | 1 Leather Large Tent (Three Bedrolls) |  |
| Leather Small Tent | Player Crafting | 1 |  | Survivalists | N/A | 1 Leather Small Tent (Two Bedrolls) |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Executioner's Hood |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Hood |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Thieves Guild Sleeveless Improved Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Improved Gloves - Grey |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Thieves Guild Improved Sleeveless Cuirass - Grey |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Boots |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Leather Barding and Saddle |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Hunter's Saddle |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Knight's Saddle |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Shrouded Worn Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Hide Helmet |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Vampire Gauntlets |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Imperial Saddle |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Gloves |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Ornate Barding and Saddle |  |
| Leather Strips | Breakdown | 2 |  | N/A | N/A | 1 Hide Bracers |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Summerset Shadows Gloves |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - The Pale |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Summerset Shadows Hood |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Imperial Studded Cuirass |  |
| Leather Strips | Breakdown | 5 |  | N/A | N/A | 1 Noble Gilded Wristguards |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Summerset Shadows Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Gloves - Grey |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - Haafingar |  |
| Leather Strips | Breakdown | 5 |  | N/A | N/A | 1 Shrouded Supple Cowl - Maskless |  |
| Leather Strips | Breakdown | 3 |  | N/A | N/A | 1 Fur Guard's Boots |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Hood |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Fur Saddle |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - Winterhold |  |
| Leather Strips | Breakdown | 5 |  | N/A | N/A | 1 Hide Shield |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Thieves Guild Cuirass |  |
| Leather Strips | Breakdown | 6 |  | N/A | N/A | 1 Thieves Guild Master's Hood |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Cowl |  |
| Leather Strips | Breakdown | 6 |  | N/A | N/A | 1 Thieves Guild Master's Gloves |  |
| Leather Strips | Breakdown | 6 |  | N/A | N/A | 1 Vampire Hood |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Minstrel's Saddle |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Gloves |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Cowl |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Improved Gloves |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Hood - Black |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Vampire Cuirass - Grey |  |
| Leather Strips | Breakdown | 5 |  | N/A | N/A | 1 Shrouded Supple Gloves |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Imperial Outcast Cuirass |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Shrouded Cuirass |  |
| Leather Strips | Breakdown | 6 |  | N/A | N/A | 1 Thieves Guild Master's Cowl |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Vampire Royal Cuirass |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Studded Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Improved Boots - Grey |  |
| Leather Strips | Breakdown | 6 |  | N/A | N/A | 1 Thieves Guild Master's Boots |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Stormcloak Light Cuirass |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Thieves Guild Sleeveless Cuirass - Grey |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Imperial General Cuirass |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Hide Cuirass |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Vampire Lord Robes |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Imperial Light Bracers |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Vampire Boots |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - The Rift |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Improved Hood - Grey |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - The Reach |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Leather Executioner's Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Worn Boots |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Leather Cuirass |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Imperial Light Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Boots |  |
| Leather Strips | Breakdown | 3 |  | N/A | N/A | 1 Fur Guard's Gauntlets |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - Hjaalmarch |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - Whiterun |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Cowl - Maskless |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Boots |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Shrouded Sleeveless Cuirass |  |
| Leather Strips | Breakdown | 7 |  | N/A | N/A | 1 Noble Armguards |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Leather Barding and Saddle - Mail |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Worn Cowl - Maskless |  |
| Leather Strips | Breakdown | 5 |  | N/A | N/A | 1 Shrouded Supple Cowl |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Big Game Saddle |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Summerset Shadows Boots |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Thieves Guild Improved Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Hide Boots |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Cowl - Grey |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Vampire Cuirass - Red |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Shrouded Sleeveless Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Hood - Grey |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Stormcloak Officer Cuirass |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Thieves Guild Sleeveless Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Worn Cowl |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Silk Fur-Trimmed Clothes |  |
| Leather Strips | Breakdown | 16 |  | N/A | N/A | 1 Thieves Guild Master's Cuirass |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Shrouded Cuirass |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Bracers |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Helmet |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Improved Hood |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Stormcloak Sleeved Heavy Cuirass |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Thieves Guild Master's Sleeveless Cuirass |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Traveler's Saddle |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Worn Gloves |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Imperial Light Boots |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Thieves Guild Improved Cuirass - Grey |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Executioner's Boots |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Leather Executioner's Gloves |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Imperial Light Helmet |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Vampire Cuirass - Dark |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Scaled Cuirass - Horned |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Scaled Cuirass |  |
| Leather Strips | Breakdown | 12 |  | N/A | N/A | 1 Thieves Guild Cuirass - Grey |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Linen Moth Priest Sandals |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Improved Boots |  |
| Leather Strips | Breakdown | 8 |  | N/A | N/A | 1 Fur Guard's Cuirass - Falkreath |  |
| Leather Strips | Breakdown | 5 |  | N/A | N/A | 1 Shrouded Supple Boots |  |
| Leather Strips | Breakdown | 4 |  | N/A | N/A | 1 Thieves Guild Boots - Grey |  |
| Leather Strips | Breakdown | 10 |  | N/A | N/A | 1 Horse Armor: Shadowmere's Saddle |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Grey |  |
| Linen Cloth | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Tunic - White and Orange |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Red |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Purple |  |
| Linen Cloth | Breakdown | 1 |  | N/A | N/A | 1 Linen Head Bandages |  |
| Linen Cloth | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - White |  |
| Linen Cloth | Breakdown | 2 |  | N/A | N/A | 1 Linen Barkeep's Clothes - White |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Yellow |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Tan |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Orange |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Black |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Brown |  |
| Linen Cloth | Breakdown | 1 |  | N/A | N/A | 1 Linen Miner's Clothes - White |  |
| Linen Cloth | Breakdown | 1 |  | N/A | N/A | 1 Linen Chef's Hat |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Green |  |
| Linen Cloth | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Tunic - White and Brown |  |
| Linen Cloth | Breakdown | 1 |  | N/A | N/A | 1 Linen Arm Bandages |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Blue |  |
| Linen Cloth | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Tunic - White and Quilted Brown |  |
| Linen Cloth | Breakdown | 1 |  | N/A | N/A | 1 Linen Headscarf |  |
| Linen Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Linen Cloth - Indigo |  |
| Linen Cloth | Breakdown | 2 |  | N/A | N/A | 1 Linen Chef's Tunic |  |
| Linen Cloth | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Tunic - White, Green, and Brown |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Black and Green |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Hood - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Black and Orange |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Leather Clothes - Black and Brown |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Black and Brown |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Black, Brown, and Green |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Black, Grey, and Tan |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Surcoat - Black and Brown |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Leather Clothes - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Surcoat - Black and Green |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Mourner's Clothes |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Work Boots - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Leather Quilted Clothes - Black |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Tunic - Indigo and Green |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Gloves - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Robes - Black and Grey |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Skirt - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Black, Brown, and Grey |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Mourner's Headscarf |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Garb - Red |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Monk Boots - Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Black, Tan, and White |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Robes - Black and White |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Black |  |
| Linen Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Necromancer |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Tunic - Belted Black |  |
| Linen Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Necromancer's |  |
| Linen Cloth - Blue | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Blue |  |
| Linen Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Linen Gloves - Blue |  |
| Linen Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Linen Tunic - Blue and Orange |  |
| Linen Cloth - Blue | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Tunic - Blue and Quilted Brown |  |
| Linen Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Blue |  |
| Linen Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Hood - Blue |  |
| Linen Cloth - Blue | Breakdown | 1 |  | N/A | N/A | 1 Linen Dunmer Tunic - Blue |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Robes - Brown and White |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Child's Skaal Shoes |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Brown |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Monk Boots - Brown |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Brown and Grey |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Dunmer Hood - Brown |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Stitched Boots |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Child's Linen Shoes |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Dunmer Boots |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Gloves - Brown |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Doublet - Brown and Tan |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Shoes - Brown |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Orange |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Skirt - Quilted Brown |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Miner's Clothes - Brown |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Brown |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Dunmer Tunic - Brown |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Tunic - Belted Red |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Barkeep's Clothes - Brown |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Boots - Dark |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Brown, Grey, and Tan |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Doublet - Brown and Green |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Collared Brown and Orange |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Blacksmith's Shoes |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Brown and Grey |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Leather Tiled Clothes - Brown |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Cap |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Doublet - Brown and Grey |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Brown and White |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Brown, White, and Tan |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Brown and Tan |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Brown, Tan, and White |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Farm Boots |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Garb - White |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Robes - Brown and Tan |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Tunic - Tan |  |
| Linen Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Leather Tiled Clothes - Brown and Black |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Boots - Dark |  |
| Linen Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Linen Work Boots - Brown |  |
| Linen Cloth - Green | Breakdown | 1 |  | N/A | N/A | 1 Linen Miner's Boots |  |
| Linen Cloth - Green | Breakdown | 1 |  | N/A | N/A | 1 Linen Gloves - Green |  |
| Linen Cloth - Green | Breakdown | 1 |  | N/A | N/A | 1 Linen Hood - Green |  |
| Linen Cloth - Green | Breakdown | 1 |  | N/A | N/A | 1 Linen Tunic - Belted Green |  |
| Linen Cloth - Green | Breakdown | 2 |  | N/A | N/A | 1 Linen Tunic - Adorned Green |  |
| Linen Cloth - Green | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Robes - Green and Tan |  |
| Linen Cloth - Green | Breakdown | 2 |  | N/A | N/A | 1 Linen Skirt - Green and Black |  |
| Linen Cloth - Green | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Green |  |
| Linen Cloth - Green | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Green |  |
| Linen Cloth - Green | Breakdown | 1 |  | N/A | N/A | 1 Linen Tavern Clothes |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Mantled Grey and Orange |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Grey |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Grey and Brown |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Miner's Clothes - Grey and Tan |  |
| Linen Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Linen Gloves - Grey |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Tunic - Grey and Brown |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Doublet - Tan, Grey, and White |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Moth Priest Robes |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Tunic - Grey and Black |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Grey and Red |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Doublet - Tan and Grey |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Mantled Grey and Brown |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Mantled Grey and Red |  |
| Linen Cloth - Grey | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Grey and Orange |  |
| Linen Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Grey |  |
| Linen Cloth - Indigo | Breakdown | 2 |  | N/A | N/A | 1 Linen Skirt - Indigo and Black |  |
| Linen Cloth - Indigo | Breakdown | 1 |  | N/A | N/A | 1 Linen Dunmer Hood - Blue |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Mantled Orange and Brown |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Orange |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Orange, White, and Brown |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Miner's Clothes - Orange and Black |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Mantled Orange |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Orange and Brown |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Orange, Grey, and Tan |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Plain Robes - Orange |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Miner's Clothes - Orange and Brown |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Collared Orange and White |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Skirt - Orange and Black |  |
| Linen Cloth - Orange | Breakdown | 2 |  | N/A | N/A | 1 Linen Clothes - Orange, White, and Tan |  |
| Linen Cloth - Orange | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Orange |  |
| Linen Cloth - Purple | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Purple, Orange, and White |  |
| Linen Cloth - Purple | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Purple |  |
| Linen Cloth - Purple | Breakdown | 2 |  | N/A | N/A | 1 Linen Traveler Robes - Purple, Tan, and White |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Dunmer Tunic - Red |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Red |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Hood - Red |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Gloves - Red |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Blacksmith's Apron - Red |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Dunmer Hood - Red |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Hood - Red |  |
| Linen Cloth - Red | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Garb - Red |  |
| Linen Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Linen Tunic - Belted Tan |  |
| Linen Cloth - Tan | Breakdown | 2 |  | N/A | N/A | 1 Linen Doublet - Tan |  |
| Linen Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Linen Miner's Clothes - Tan |  |
| Linen Cloth - Tan | Breakdown | 2 |  | N/A | N/A | 1 Linen Mage Robes - Tan and White |  |
| Linen Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Linen Alik'r Boots - Tan |  |
| Linen Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Linen Miner's Shirt |  |
| Linen Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Linen Cuffed Boots |  |
| Linen Cloth - Yellow | Breakdown | 1 |  | N/A | N/A | 1 Linen Tunic - Embroidered Brown |  |
| Linen Cloth - Yellow | Breakdown | 1 |  | N/A | N/A | 1 Linen Cowl - Yellow |  |
| Linen Cloth - Yellow | Breakdown | 2 |  | N/A | N/A | 1 Linen Miner's Clothes - Yellow and Brown |  |
| Linen Head Bandages | Player Crafting | 1 |  | Tailors | N/A | 2 Linen Cloth |  |
| Linen Robes - Blue | Breakdown | 1 |  | N/A | N/A | 1 Linen Robes of Regeneration - Blue |  |
| Linen Thread | Breakdown | 4 |  | N/A | N/A | 1 Linen Moth Priest Blindfold |  |
| Linen Thread | Breakdown | 2 |  | N/A | N/A | 1 Linen Robes - Red |  |
| Linen Thread | Breakdown | 2 |  | N/A | N/A | 1 Linen Blacksmith's Apron - White |  |
| Linen Thread | Breakdown | 2 |  | N/A | N/A | 1 Linen Cloth |  |
| Linen Wrap | Breakdown | 1 |  | N/A | N/A | 1 Linen Ragged Cap |  |
| Linen Wrap | Breakdown | 1 |  | N/A | N/A | 1 Linen Roughspun Tunic |  |
| Linen Wrap | Breakdown | 1 |  | N/A | N/A | 1 Linen Footwraps |  |
| Linen Wrap | Breakdown | 1 |  | N/A | N/A | 1 Linen Ragged Boots |  |
| Linen Wrap | Breakdown | 2 |  | N/A | N/A | 1 Linen Ragged Robes |  |
| Linen Wrap | Breakdown | 1 |  | N/A | N/A | 1 Linen Prisoner's Rags |  |
| Mammoth Balls | Player Crafting | 6 |  | Chefs | Cook pot | 1 Garlic 1 Tomato 1 Raw Mammoth Meat |  |
| Mammoth Balls | Cook pot | 6 |  | Chefs | Cook pot | 1 Garlic 1 Tomato 1 Raw Mammoth Meat |  |
| Mammoth Bone Club | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 3 Leather Strips 1 Animal Bone (Enormous) | Animal Harvesting Skill Greater or Equal to 1 |
| Mammoth Bone Masterwork Club | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 3 Troll Fat 3 Hide Lace 1 Animal Bone (Enormous) | Animal Harvesting Skill Greater or Equal to 4 |
| Mammoth Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Mammoth Snout |  |
| Mammoth Jerky | Player Crafting | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Mammoth Meat |  |
| Mammoth Jerky | Cook pot | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Mammoth Meat |  |
| Mammoth Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Mammoth Snout |  |
| Mammoth Tomato Stew | Cook pot | 2 |  | Chefs | Cook pot | 2 Tomato 1 Raw Mammoth Meat 1 Glass Bottle (Water) |  |
| Mammoth Tomato Stew | Player Crafting | 2 |  | Chefs | Cook pot | 2 Tomato 1 Raw Mammoth Meat 1 Glass Bottle (Water) |  |
| Marinated Mammoth in Elsweyr Sauce | Player Crafting | 1 |  | Chefs | Cook pot | 2 Honningbrew Mead 1 Moon Sugar 1 Raw Mammoth Meat |  |
| Marinated Mammoth in Elsweyr Sauce | Cook pot | 1 |  | Chefs | Cook pot | 2 Honningbrew Mead 1 Moon Sugar 1 Raw Mammoth Meat |  |
| Mashed Troll | Cook pot | 1 |  | Chefs | Cook pot | 1 Garlic 1 Potato 1 Raw Troll Meat |  |
| Mashed Troll | Player Crafting | 1 |  | Chefs | Cook pot | 1 Garlic 1 Potato 1 Raw Troll Meat |  |
| Mead Braised Bear | Player Crafting | 1 |  | Chefs | Cook pot | 1 Nord Mead 1 Raw Bear Meat |  |
| Mead Braised Bear | Cook pot | 1 |  | Chefs | Cook pot | 1 Nord Mead 1 Raw Bear Meat |  |
| Meat Pie | Oven | 1 |  | Chefs | Oven | 1 Salt 1 Raw Beef 1 Bottled Milk 1 Flour 1 Butter |  |
| Meat Pie | Player Crafting | 1 |  | Chefs | Oven | 1 Salt 1 Raw Beef 1 Bottled Milk 1 Flour 1 Butter |  |
| Mild Acid | Player Crafting | 1 |  | Alchemists | Cook pot | 1 Chaurus Venom (Crude) |  |
| Mild Acid | Player Crafting | 1 |  | Alchemists | Cook pot | 5 Spider Egg |  |
| Mild Acid | Cook pot | 1 |  | Alchemists | Cook pot | 1 Chaurus Venom (Crude) |  |
| Mild Acid | Player Crafting | 1 |  | Alchemists | Cook pot | 2 Spider Venom (Crude) |  |
| Mild Acid | Cook pot | 1 |  | Alchemists | Cook pot | 2 Spider Venom (Crude) |  |
| Mild Acid | Cook pot | 1 |  | Alchemists | Cook pot | 5 Spider Egg |  |
| Minced Marinated Bear | Cook pot | 2 |  | Chefs | Cook pot | 1 Salt 2 Juniper Berries 1 Raw Bear Meat |  |
| Minced Marinated Bear | Player Crafting | 2 |  | Chefs | Cook pot | 1 Salt 2 Juniper Berries 1 Raw Bear Meat |  |
| Moon Dance Tea | Player Crafting | 1 |  | Chefs | Cook pot | 2 Luna Moth Wing 1 Moon Sugar 1 Glass Bottle (Water) |  |
| Moon Dance Tea | Cook pot | 1 |  | Chefs | Cook pot | 2 Luna Moth Wing 1 Moon Sugar 1 Glass Bottle (Water) |  |
| Mortar and Pestle | Player Crafting | 1 |  | Survivalists,Alchemists | N/A | 1 Animal Bone (Small) 1 Animal Bone (Large) | Animal Harvesting Skill Greater than 0 |
| Morthal Mudders | Cook pot | 1 |  | Chefs | Cook pot | 1 Ale 1 Swamp Fungal Pod 1 Raw Mudcrab Meat |  |
| Morthal Mudders | Player Crafting | 1 |  | Chefs | Cook pot | 1 Ale 1 Swamp Fungal Pod 1 Raw Mudcrab Meat |  |
| Mountain Flower Tea | Player Crafting | 1 |  | Chefs | Cook pot | 1 Blue Mountain Flower 1 Red Mountain Flower 1 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Mountain Flower Tea | Cook pot | 1 |  | Chefs | Cook pot | 1 Blue Mountain Flower 1 Red Mountain Flower 1 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Mudcrab Chowder | Player Crafting | 1 |  | Chefs | Cook pot | 1 Potato 1 Bottled Milk 1 Raw Mudcrab Meat |  |
| Mudcrab Chowder | Cook pot | 1 |  | Chefs | Cook pot | 1 Potato 1 Bottled Milk 1 Raw Mudcrab Meat |  |
| Mudcrab Egg Scramble | Player Crafting | 1 |  | Chefs | Cook pot | 1 Chicken's Egg 1 Raw Mudcrab Meat |  |
| Mudcrab Egg Scramble | Cook pot | 1 |  | Chefs | Cook pot | 1 Chicken's Egg 1 Raw Mudcrab Meat |  |
| Mudcrab Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Mudcrab Legs |  |
| Mudcrab Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Mudcrab Meat |  |
| Mudcrab Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Mudcrab Legs |  |
| Mudcrab Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Mudcrab Meat |  |
| Mullwine Braised Mammoth | Cook pot | 1 |  | Chefs | Cook pot | 1 Mulled Wine 1 Raw Mammoth Meat |  |
| Mullwine Braised Mammoth | Player Crafting | 1 |  | Chefs | Cook pot | 1 Mulled Wine 1 Raw Mammoth Meat |  |
| Nirn Spring Tea | Cook pot | 1 |  | Chefs | Cook pot | 1 Nirnroot 1 Sleeping Tree Sap 1 Glass Bottle (Water) |  |
| Nirn Spring Tea | Player Crafting | 1 |  | Chefs | Cook pot | 1 Nirnroot 1 Sleeping Tree Sap 1 Glass Bottle (Water) |  |
| Nord Mead | Player Crafting | 2 |  | Brewers | Brewing Barrel | 1 Honey |  |
| Nord Mead | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 1 Honey |  |
| Ocean's Kiss | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Raw Clam Meat |  |
| Ocean's Kiss | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Raw Clam Meat |  |
| Paper Roll | Breakdown | 2 |  | N/A | N/A | 1 Ruined Book |  |
| Pelt: Bear (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Bear (Flawless) |  |
| Pelt: Bear (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Bear (Flawless) |  |
| Pelt: Boar (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Boar (Flawless) |  |
| Pelt: Boar (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Boar (Flawless) |  |
| Pelt: Cave Bear (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Cave Bear (Flawless) |  |
| Pelt: Cave Bear (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Cave Bear (Flawless) |  |
| Pelt: Cow (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Cow (Flawless) |  |
| Pelt: Cow (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Cow (Flawless) |  |
| Pelt: Deer (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Deer (Flawless) |  |
| Pelt: Deer (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Deer (Flawless) |  |
| Pelt: Elk (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Elk (Flawless) |  |
| Pelt: Elk (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Elk (Flawless) |  |
| Pelt: Fox (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Fox (Flawless) |  |
| Pelt: Fox (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Fox (Flawless) |  |
| Pelt: Frost Troll (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Frost Troll (Flawless) |  |
| Pelt: Frost Troll (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Frost Troll (Flawless) |  |
| Pelt: Goat (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Goat (Flawless) |  |
| Pelt: Goat (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Goat (Flawless) |  |
| Pelt: Horse (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Horse (Flawless) |  |
| Pelt: Horse (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Horse (Flawless) |  |
| Pelt: Ice Wolf (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Flawless) |  |
| Pelt: Ice Wolf (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Flawless) |  |
| Pelt: Mammoth Section (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Flawless) |  |
| Pelt: Mammoth Section (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Flawless) |  |
| Pelt: Sabre Cat (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Flawless) |  |
| Pelt: Sabre Cat (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Flawless) |  |
| Pelt: Skeever (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Skeever (Flawless) |  |
| Pelt: Skeever (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Skeever (Flawless) |  |
| Pelt: Snow Bear (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Snow Bear (Flawless) |  |
| Pelt: Snow Bear (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Snow Bear (Flawless) |  |
| Pelt: Snow Fox (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Snow Fox (Flawless) |  |
| Pelt: Snow Fox (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Snow Fox (Flawless) |  |
| Pelt: Snowy Sabre Cat (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Flawless) |  |
| Pelt: Snowy Sabre Cat (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Flawless) |  |
| Pelt: Troll (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Troll (Flawless) |  |
| Pelt: Troll (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Troll (Flawless) |  |
| Pelt: Vale Deer (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Vale Deer (Flawless) |  |
| Pelt: Vale Deer (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Vale Deer (Flawless) |  |
| Pelt: Vale Sabre Cat (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Flawless) |  |
| Pelt: Vale Sabre Cat (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Flawless) |  |
| Pelt: Werewolf (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Werewolf (Flawless) |  |
| Pelt: Werewolf (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Werewolf (Flawless) |  |
| Pelt: Wolf (Fine) | Player Crafting | 2 |  | N/A | Tanning Rack | 1 Pelt: Wolf (Flawless) |  |
| Pelt: Wolf (Fine) | Tanning Rack | 2 |  | N/A | Tanning Rack | 1 Pelt: Wolf (Flawless) |  |
| Pet Bait: Fox (Strange Brew) | Cook pot | 1 |  | Chefs | Cook pot | 1 Raw Chicken Breast 1 Strange Brew | Brewing Skill Greater or Equal to 2 |
| Pet Bait: Fox (Strange Brew) | Player Crafting | 1 |  | Chefs | Cook pot | 1 Raw Chicken Breast 1 Strange Brew | Brewing Skill Greater or Equal to 2 |
| Pet Bait: Rabbit (Strange Brew) | Player Crafting | 1 |  | Chefs | Cook pot | 1 Carrot 1 Strange Brew | Brewing Skill Greater or Equal to 1 |
| Pet Bait: Rabbit (Strange Brew) | Cook pot | 1 |  | Chefs | Cook pot | 1 Carrot 1 Strange Brew | Brewing Skill Greater or Equal to 1 |
| Pet Bait: Wolf (Strange Brew) | Player Crafting | 1 |  | Chefs | Cook pot | 1 Raw Venison 1 Strange Brew | Brewing Skill Greater or Equal to 0 |
| Pet Bait: Wolf (Strange Brew) | Cook pot | 1 |  | Chefs | Cook pot | 1 Raw Venison 1 Strange Brew | Brewing Skill Greater or Equal to 0 |
| Pet Bait: Wolf (Strange Brew) | Player Crafting | 1 |  | Chefs | Cook pot | 1 Strange Brew 1 Raw Elk Meat | Brewing Skill Greater or Equal to 0 |
| Pet Bait: Wolf (Strange Brew) | Cook pot | 1 |  | Chefs | Cook pot | 1 Strange Brew 1 Raw Elk Meat | Brewing Skill Greater or Equal to 0 |
| Pheasant Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Pheasant Breast |  |
| Pheasant Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Pheasant Breast |  |
| Poison of Fear (Remarkable) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Poison of Fear (Remarkable) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Poisoner's Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Nightshade 1 Raw Chaurus Meat 1 Chaurus Venom (Crude) |  |
| Poisoner's Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Nightshade 1 Raw Chaurus Meat 1 Chaurus Venom (Crude) |  |
| Polished Bear Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Bear Eye | Animal Harvesting Skill Greater or Equal to 3 |
| Polished Boar Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Boar Eye | Animal Harvesting Skill Greater or Equal to 2 |
| Polished Dragon Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Dragon Eye | Animal Harvesting Skill Greater or Equal to 5 |
| Polished Fox Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Fox Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Hare Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Hare Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Mammoth Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Mammoth Eye | Animal Harvesting Skill Greater or Equal to 4 |
| Polished Sabre Cat Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Sabre Cat Eye | Animal Harvesting Skill Greater or Equal to 2 |
| Polished Slaughterfish Scales | Player Crafting | 1 |  | Alchemists | N/A | 1 Slaughterfish Scales | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Troll Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Troll Eye | Animal Harvesting Skill Greater or Equal to 4 |
| Polished Werewolf Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Werewolf Eye | Animal Harvesting Skill Greater or Equal to 3 |
| Polished Wolf Eye | Player Crafting | 1 |  | Alchemists | N/A | 1 Wolf Eye | Animal Harvesting Skill Greater or Equal to 2 |
| Potato Bread | Oven | 1 |  | Chefs | Oven | 1 Salt 1 Potato 1 Flour 1 Glass Bottle (Water) |  |
| Potato Bread | Player Crafting | 1 |  | Chefs | Oven | 1 Salt 1 Potato 1 Flour 1 Glass Bottle (Water) |  |
| Potato Crab Chowder | Player Crafting | 1 |  | Chefs | Cook pot | 1 Potato 1 Bottled Milk 1 Butter 1 Raw Mudcrab Meat |  |
| Potato Crab Chowder | Cook pot | 1 |  | Chefs | Cook pot | 1 Potato 1 Bottled Milk 1 Butter 1 Raw Mudcrab Meat |  |
| Potato Soup | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Potato 1 Glass Bottle (Water) |  |
| Potato Soup | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Potato 1 Glass Bottle (Water) |  |
| Potion of Arcane Metabolisis | Player Crafting | 2 |  | Alchemists | Cook pot | 2 Polished Fox Eye 1 Dragon's Blood | Animal Harvesting Skill Greater or Equal to 3 |
| Potion of Arcane Metabolisis | Cook pot | 2 |  | Alchemists | Cook pot | 2 Polished Fox Eye 1 Dragon's Blood | Animal Harvesting Skill Greater or Equal to 3 |
| Potion of Boneblood | Cook pot | 1 |  | Alchemists | Cook pot | 10 Bone Meal 1 Blood of the Hunt (Strange Brew) | Animal Harvesting Skill Greater or Equal to 1 |
| Potion of Boneblood | Player Crafting | 1 |  | Alchemists | Cook pot | 10 Bone Meal 1 Blood of the Hunt (Strange Brew) | Animal Harvesting Skill Greater or Equal to 1 |
| Potion of Hircine's Agony (Strange Brew) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative) | Brewing Skill Greater or Equal to 0 |
| Potion of Hircine's Agony (Strange Brew) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative) | Brewing Skill Greater or Equal to 0 |
| Potion of Hircine's Cloak (Strange Brew) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Wolf Heart 2 Polished Sabre Cat Eye | Brewing Skill Greater or Equal to 1 |
| Potion of Hircine's Cloak (Strange Brew) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Wolf Heart 2 Polished Sabre Cat Eye | Brewing Skill Greater or Equal to 1 |
| Powdered Mammoth Tusk | Player Crafting | 1 |  | Alchemists | N/A | 1 Mammoth Tusk |  |
| Powdered Mudcrab Chitin | Player Crafting | 2 |  | Alchemists | N/A | 1 Large Mudcrab Chitin | Animal Harvesting Skill Greater or Equal to 1 |
| Predator's Price | Player Crafting | 4 |  | Chefs | Cook pot | 1 Garlic 1 Raw Venison 1 Raw Bear Meat 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Predator's Price | Cook pot | 4 |  | Chefs | Cook pot | 1 Garlic 1 Raw Venison 1 Raw Bear Meat 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Rabbit Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Rabbit Leg |  |
| Rabbit Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Rabbit Leg |  |
| Rabbit Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Rabbit Meat |  |
| Rabbit Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Rabbit Meat |  |
| Rabbit Mushroom Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Mora Tapinella 1 Raw Rabbit Meat 1 Glass Bottle (Water) |  |
| Rabbit Mushroom Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Mora Tapinella 1 Raw Rabbit Meat 1 Glass Bottle (Water) |  |
| Rarebit Ragout | Player Crafting | 1 |  | Chefs | Cook pot | 1 Goat Cheese Slice 1 Bread Half-Loaf 1 Raw Rabbit Meat |  |
| Rarebit Ragout | Cook pot | 1 |  | Chefs | Cook pot | 1 Goat Cheese Slice 1 Bread Half-Loaf 1 Raw Rabbit Meat |  |
| Raw Salmon Steak | Cook pot | 2 |  | Chefs,Survivalists | Cook pot | 1 Raw Salmon |  |
| Raw Salmon Steak | Player Crafting | 2 |  | Chefs,Survivalists | N/A | 1 Raw Salmon |  |
| Reachman Soup | Cook pot | 1 |  | Chefs | Cook pot | 1 Sabre Cat Tooth 2 Edible Mushroom 2 Edible Root 1 Glass Bottle (Water) |  |
| Reachman Soup | Player Crafting | 1 |  | Chefs | Cook pot | 1 Sabre Cat Tooth 2 Edible Mushroom 2 Edible Root 1 Glass Bottle (Water) |  |
| Roasted Tomato Crab Bisque | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Tomato 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Roasted Tomato Crab Bisque | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Tomato 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Root Bear (Strange Brew) | Cook pot | 2 |  | Chefs | Cook pot | 1 Nirnroot 2 Bear Tooth 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Root Bear (Strange Brew) | Player Crafting | 2 |  | Chefs | Cook pot | 1 Nirnroot 2 Bear Tooth 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Sabre Cat Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Sabre Cat Meat |  |
| Sabre Cat Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Sabre Cat Meat |  |
| Sabre Cat Pot Roast | Cook pot | 1 |  | Chefs | Cook pot | 1 Leek 1 Gourd 1 Raw Sabre Cat Meat |  |
| Sabre Cat Pot Roast | Player Crafting | 1 |  | Chefs | Cook pot | 1 Leek 1 Gourd 1 Raw Sabre Cat Meat |  |
| Salmon Bake | Cook pot | 1 |  | Chefs | Cook pot | 1 Thistle Branch 2 Raw Salmon Steak 1 Honey |  |
| Salmon Bake | Player Crafting | 1 |  | Chefs | Cook pot | 1 Thistle Branch 2 Raw Salmon Steak 1 Honey |  |
| Salt | Player Crafting | 1 |  | N/A | Cook pot | 1 Waterskin (Salt Water) |  |
| Salt | Player Crafting | 1 |  | N/A | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Salt | Cook pot | 1 |  | N/A | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Salt | Cook pot | 1 |  | N/A | Cook pot | 1 Waterskin (Salt Water) |  |
| Salty Sabre Stew | Player Crafting | 1 |  | Chefs | Cook pot | 2 Salt 1 Canis Root 1 Raw Sabre Cat Meat 1 Glass Bottle (Water) |  |
| Salty Sabre Stew | Cook pot | 1 |  | Chefs | Cook pot | 2 Salt 1 Canis Root 1 Raw Sabre Cat Meat 1 Glass Bottle (Water) |  |
| Sausaged Skeever | Cook pot | 2 |  | Chefs | Cook pot | 1 Garlic 1 Skeever Tail 1 Raw Skeever Meat |  |
| Sausaged Skeever | Player Crafting | 2 |  | Chefs | Cook pot | 1 Garlic 1 Skeever Tail 1 Raw Skeever Meat |  |
| Sauteed Dog and Mushrooms | Cook pot | 1 |  | Chefs | Cook pot | 2 Garlic 1 Fly Amanita 1 White Cap 1 Raw Dog Meat |  |
| Sauteed Dog and Mushrooms | Player Crafting | 1 |  | Chefs | Cook pot | 2 Garlic 1 Fly Amanita 1 White Cap 1 Raw Dog Meat |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Blue |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Red |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Tan |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Black |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Indigo |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Green |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Yellow |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Grey |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Orange |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Purple |  |
| Silk Cloth | Player Crafting | 1 |  | Tailors | N/A | 1 Salt 1 Silk Cloth - Brown |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Shrouded Hood |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Shrouded Robes |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Miraak's Robes |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Silk Nocturnal Robes |  |
| Silk Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Emperor's Robes |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Silk Nocturnal Hood |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Shrouded Robes |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Shrouded Shoes |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Sheogorath's Boots |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Shrouded Veil |  |
| Silk Cloth - Black | Breakdown | 2 |  | N/A | N/A | 1 Silk Mage Robes - Ornate |  |
| Silk Cloth - Black | Breakdown | 1 |  | N/A | N/A | 1 Shrouded Shoes |  |
| Silk Cloth - Blue | Breakdown | 2 |  | N/A | N/A | 1 Silk Embroidered Raiment - Blue |  |
| Silk Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Silk Pleated Boots |  |
| Silk Cloth - Brown | Breakdown | 2 |  | N/A | N/A | 1 Archmage's Robes |  |
| Silk Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Silk Psijic Gloves |  |
| Silk Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Silk Fur-Embellished Robes - Tan |  |
| Silk Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Miraak's Boots |  |
| Silk Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Archmage's Boots |  |
| Silk Cloth - Brown | Breakdown | 1 |  | N/A | N/A | 1 Miraak's Gloves |  |
| Silk Cloth - Green | Breakdown | 1 |  | N/A | N/A | 1 Silk Fur-Embellished Robes - Green |  |
| Silk Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Silk Cuffed Boots |  |
| Silk Cloth - Grey | Breakdown | 1 |  | N/A | N/A | 1 Silk Mage Boots - Ornate |  |
| Silk Cloth - Indigo | Breakdown | 1 |  | N/A | N/A | 1 Silk Fur-Embellished Robes - Indigo |  |
| Silk Cloth - Purple | Breakdown | 1 |  | N/A | N/A | 1 Sheogorath's Garb |  |
| Silk Cloth - Red | Breakdown | 2 |  | N/A | N/A | 1 Silk Embroidered Raiment - Red |  |
| Silk Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Silk Mage Robes - Fine |  |
| Silk Cloth - Tan | Breakdown | 1 |  | N/A | N/A | 1 Silk Fur-Lined Boots |  |
| Silk Cloth - Yellow | Breakdown | 1 |  | N/A | N/A | 1 Silk Psijic Robes |  |
| Silk Cloth - Yellow | Breakdown | 1 |  | N/A | N/A | 1 Silk Psijic Hood |  |
| Silk Cloth - Yellow | Breakdown | 1 |  | N/A | N/A | 1 Silk Psijic Boots |  |
| Silk Thread | Breakdown | 2 |  | N/A | N/A | 1 Silk Cloth |  |
| Silk Thread | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Hand Wraps |  |
| Silk Thread | Breakdown | 4 |  | N/A | N/A | 1 Shrouded Hand Wraps |  |
| Skeevender Stew | Cook pot | 1 |  | Chefs | Cook pot | 2 Lavender 2 Raw Skeever Meat 1 Glass Bottle (Water) |  |
| Skeevender Stew | Player Crafting | 1 |  | Chefs | Cook pot | 2 Lavender 2 Raw Skeever Meat 1 Glass Bottle (Water) |  |
| Skeever Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Skeever Meat |  |
| Skeever Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Skeever Meat |  |
| Skeever Scramble | Player Crafting | 1 |  | Chefs | Cook pot | 1 Chicken's Egg 1 Leek 1 Raw Skeever Meat |  |
| Skeever Scramble | Cook pot | 1 |  | Chefs | Cook pot | 1 Chicken's Egg 1 Leek 1 Raw Skeever Meat |  |
| Skewered Skeever | Player Crafting | 2 |  | Chefs | Cook pot | 1 Red Apple 1 Goat Cheese Slice 1 Raw Skeever Meat |  |
| Skewered Skeever | Cook pot | 2 |  | Chefs | Cook pot | 1 Red Apple 1 Goat Cheese Slice 1 Raw Skeever Meat |  |
| Slaughterfish Scales | Player Crafting | 5 |  | Alchemists | N/A | 1 Raw Slaughterfish |  |
| Small Chest | Furniture Workbench | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Small Chest | Furniture Workbench | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Smoked Elk Roast | Cook pot | 2 |  | Chefs | Cook pot | 1 Salt 1 Raw Elk Meat |  |
| Smoked Elk Roast | Player Crafting | 2 |  | Chefs | Cook pot | 1 Salt 1 Raw Elk Meat |  |
| Snowberry Crostata | Player Crafting | 2 |  | Chefs | Oven | 10 Snowberries 1 Honey 1 Flour 1 Butter |  |
| Snowberry Crostata | Oven | 2 |  | Chefs | Oven | 10 Snowberries 1 Honey 1 Flour 1 Butter |  |
| Snowberry Tea | Cook pot | 1 |  | Chefs | Cook pot | 3 Snowberries 2 Red Mountain Flower 1 Glass Bottle (Water) |  |
| Snowberry Tea | Player Crafting | 1 |  | Chefs | Cook pot | 3 Snowberries 2 Red Mountain Flower 1 Glass Bottle (Water) |  |
| Snowbery Wolf Chop | Cook pot | 1 |  | Chefs | Cook pot | 2 Snowberries 1 Raw Wolf Meat |  |
| Snowbery Wolf Chop | Player Crafting | 1 |  | Chefs | Cook pot | 2 Snowberries 1 Raw Wolf Meat |  |
| Soul Tomato: Common | Player Crafting | 1 |  | Alchemists | N/A | 1 Soul Gem: Lesser 1 Tomato |  |
| Soul Tomato: Corrupted | Player Crafting | 1 |  | Alchemists | N/A | 1 Soul Gem: Grand 1 Tomato |  |
| Soul Tomato: Grand | Player Crafting | 1 |  | Alchemists | N/A | 1 Soul Gem: Greater 1 Tomato |  |
| Soul Tomato: Greater | Player Crafting | 1 |  | Alchemists | N/A | 1 Soul Gem: Common 1 Tomato |  |
| Soul Tomato: Lesser | Player Crafting | 1 |  | Alchemists | N/A | 1 Soul Gem: Petty 1 Tomato |  |
| Soul Tomato: Petty | Player Crafting | 1 |  | Alchemists | N/A | 1 Tomato |  |
| Spiced Diced Goat | Player Crafting | 1 |  | Chefs | Cook pot | 1 Purple Mountain Flower 1 Creep Cluster 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Spiced Diced Goat | Cook pot | 1 |  | Chefs | Cook pot | 1 Purple Mountain Flower 1 Creep Cluster 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Spider Fry | Player Crafting | 2 |  | Chefs | Cook pot | 1 Ale 2 Salt 1 Raw Spider Meat |  |
| Spider Fry | Cook pot | 2 |  | Chefs | Cook pot | 1 Ale 2 Salt 1 Raw Spider Meat |  |
| Spider Jerky | Cook pot | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Spider Meat |  |
| Spider Jerky | Player Crafting | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Spider Meat |  |
| Spider Soup | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Potato 1 Raw Spider Meat 1 Glass Bottle (Water) |  |
| Spider Soup | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Potato 1 Raw Spider Meat 1 Glass Bottle (Water) |  |
| Spider Surprise | Cook pot | 1 |  | Chefs | Cook pot | 1 Leek 1 Spider Egg 1 Bottled Milk 1 Raw Spider Meat |  |
| Spider Surprise | Player Crafting | 1 |  | Chefs | Cook pot | 1 Leek 1 Spider Egg 1 Bottled Milk 1 Raw Spider Meat |  |
| Spider Venom (Good) | Player Crafting | 1 |  | Alchemists | Cook pot | 2 Spider Venom (Crude) | Animal Harvesting Skill Greater or Equal to 1 |
| Spider Venom (Good) | Cook pot | 1 |  | Alchemists | Cook pot | 2 Spider Venom (Crude) | Animal Harvesting Skill Greater or Equal to 1 |
| Spider Venom (Great) | Cook pot | 1 |  | Alchemists | Cook pot | 3 Bleeding Crown 1 Spider Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Spider Venom (Great) | Player Crafting | 1 |  | Alchemists | Cook pot | 3 Bleeding Crown 1 Spider Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Spider Venom (Superlative) | Cook pot | 1 |  | Alchemists | Cook pot | 1 Spider Egg 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 3 |
| Spider Venom (Superlative) | Player Crafting | 1 |  | Alchemists | Cook pot | 1 Spider Egg 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 3 |
| Spotted Wolf Meat | Player Crafting | 1 |  | Chefs | Cook pot | 1 Ale 1 Jazbay Grapes 1 Raw Wolf Meat |  |
| Spotted Wolf Meat | Cook pot | 1 |  | Chefs | Cook pot | 1 Ale 1 Jazbay Grapes 1 Raw Wolf Meat |  |
| Spriggan Sap | Player Crafting | 1 |  | Alchemists | N/A | 1 Taproot | Animal Harvesting Skill Greater or Equal to 2 |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Battlestaff |  |
| Stalhrim | Breakdown | 2 |  | N/A | N/A | 1 Stalhrim Warhammer |  |
| Stalhrim | Breakdown | 2 |  | N/A | N/A | 1 Stalhrim Light Cuirass |  |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Light Bow |  |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Greatsword |  |
| Stalhrim | Breakdown | 5 |  | N/A | N/A | 1 Stalhrim Heavy Crossbow |  |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Light Helmet |  |
| Stalhrim | Breakdown | 2 |  | N/A | N/A | 1 Stalhrim Light Shield |  |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Heavy Helmet |  |
| Stalhrim | Breakdown | 2 |  | N/A | N/A | 1 Stalhrim Battleaxe |  |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Heavy Boots |  |
| Stalhrim | Breakdown | 3 |  | N/A | N/A | 1 Stalhrim Heavy Cuirass |  |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Light Boots |  |
| Stalhrim | Breakdown | 1 |  | N/A | N/A | 1 Stalhrim Mace |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Ornate Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Brown |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Noble White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Dark Trimmed White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Ornate White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Light Trimmed Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Noble Brown |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Brown |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Ornate Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Noble Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Ornate White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Ornate Brown |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Trimmed Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Ornate Brown |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Light Trimmed White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Dark Trimmed Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Trimmed White |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Black |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Light Trimmed Brown |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Wolfskin Hood - Dark Trimmed Brown |  |
| Steel Helmet | Breakdown | 1 |  | N/A | N/A | 1 Steel Bearskin Hood - Trimmed Brown |  |
| Stone Hunting Knife | Player Crafting | 1 |  | Smiths,Survivalists | N/A | 1 Sharp Rock 1 Bone Hunting Knife | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | Cook pot | 1 |  | Survivalists,Alchemists | Cook pot | 2 Nightshade 1 Nord Mead 1 Wolf Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | Player Crafting | 3 |  | Survivalists,Alchemists | Cook pot | 2 Nightshade 1 Sleeping Tree Sap 2 Mora Tapinella | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | Player Crafting | 1 |  | Survivalists,Alchemists | Cook pot | 2 Nightshade 1 Nord Mead 1 Wolf Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | Cook pot | 3 |  | Survivalists,Alchemists | Cook pot | 2 Nightshade 1 Sleeping Tree Sap 2 Mora Tapinella | Animal Harvesting Skill Greater or Equal to 1 |
| Strong Acid | Cook pot | 1 |  | Alchemists | Cook pot | 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | Player Crafting | 1 |  | Alchemists | Cook pot | 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | Player Crafting | 1 |  | Alchemists | Cook pot | 3 Chaurus Eggs | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | Cook pot | 1 |  | Alchemists | Cook pot | 3 Chaurus Eggs | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | Cook pot | 1 |  | Alchemists | Cook pot | 1 Chaurus Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | Player Crafting | 1 |  | Alchemists | Cook pot | 1 Chaurus Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Sweetroll | Oven | 6 |  | Chefs | Oven | 1 Chicken's Egg 1 Salt 1 Honey 1 Bottled Milk 1 Flour 1 Butter |  |
| Sweetroll | Player Crafting | 6 |  | Chefs | Oven | 1 Chicken's Egg 1 Salt 1 Honey 1 Bottled Milk 1 Flour 1 Butter |  |
| Sweetwolf (Strange Brew) | Player Crafting | 1 |  | Chefs | Cook pot | 1 Red Apple 1 Honey 1 Raw Wolf Meat |  |
| Sweetwolf (Strange Brew) | Cook pot | 1 |  | Chefs | Cook pot | 1 Red Apple 1 Honey 1 Raw Wolf Meat |  |
| Ten Dragons Tea | Player Crafting | 1 |  | Chefs | Cook pot | 10 Dragon's Tongue 1 Glass Bottle (Water) |  |
| Ten Dragons Tea | Cook pot | 1 |  | Chefs | Cook pot | 10 Dragon's Tongue 1 Glass Bottle (Water) |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Green |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Yellow |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Kindling |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Brown |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Red |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Tan |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Indigo |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Purple |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Black |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Blue |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Northern Flax |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Grey |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Wrap |  |
| Tinder (Crude) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Cloth - Orange |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Purple |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Canis Root |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Black |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Tan |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Brown |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Mora Tapinella |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Red |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Blue |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Green |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Indigo |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Orange |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Yellow |  |
| Tinder (Decent) | Player Crafting | 1 |  | Survivalists | N/A | 1 Silk Cloth - Grey |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Blue |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Green |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Tundra Cotton |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Purple |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Hanging Moss |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Indigo |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Brown |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Yellow |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Tan |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Tree Bark |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Paper Roll |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Grey |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Red |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Black |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Animal Fat |  |
| Tinder (Good) | Player Crafting | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Orange |  |
| Tinder (Great) | Player Crafting | 1 |  | Survivalists | N/A | 1 Straw |  |
| Tinder (Great) | Player Crafting | 1 |  | Survivalists | N/A | 1 Beehive Husk |  |
| Tinder (Superlative) | Player Crafting | 1 |  | Survivalists | N/A | 1 Dwarven Oil |  |
| Tinder (Superlative) | Player Crafting | 1 |  | Survivalists | N/A | 1 Flammable Oil |  |
| Tomato Soup | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Tomato Soup | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Garlic 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Troll Jerky | Cook pot | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Troll Meat |  |
| Troll Jerky | Player Crafting | 4 |  | Chefs | Cook pot | 6 Salt 1 Raw Troll Meat |  |
| Troll's Blood Poison (Crude) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Poison (Crude) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Poison (Decent) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Poison (Decent) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Poison (Good) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Poison (Good) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Poison (Great) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Poison (Great) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Poison (Remarkable) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Poison (Remarkable) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Potion (Crude) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Potion (Crude) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Potion (Decent) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Potion (Decent) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Potion (Good) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Potion (Good) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Potion (Great) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Potion (Great) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Potion (Remarkable) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Potion (Remarkable) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Greater or Equal to 5 |
| Tundra Cotton | Breakdown | 6 |  | N/A | N/A | 1 Floral Head Wreath |  |
| Vegetable Soup | Player Crafting | 1 |  | Chefs | Cook pot | 1 Cabbage 1 Potato 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Vegetable Soup | Cook pot | 1 |  | Chefs | Cook pot | 1 Cabbage 1 Potato 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Velvet Slaughterfish | Cook pot | 1 |  | Chefs | Cook pot | 1 Velvet LeChance 1 Raw Slaughterfish |  |
| Velvet Slaughterfish | Player Crafting | 1 |  | Chefs | Cook pot | 1 Velvet LeChance 1 Raw Slaughterfish |  |
| Venison Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Venison |  |
| Venison Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Venison |  |
| Venison Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Elk Meat |  |
| Venison Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Elk Meat |  |
| Venison Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Salt 1 Potato 1 Raw Venison 1 Leek 1 Glass Bottle (Water) |  |
| Venison Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Salt 1 Potato 1 Raw Venison 1 Leek 1 Glass Bottle (Water) |  |
| Venison Tenderloin | Cook pot | 2 |  | Chefs | Cook pot | 1 Ale 1 Raw Venison |  |
| Venison Tenderloin | Player Crafting | 2 |  | Chefs | Cook pot | 1 Ale 1 Raw Venison |  |
| Watermelon Gazpacho | Cook pot | 3 |  | Chefs | Cook pot | 1 Salt 1 Elves Ear 1 Goat Cheese Slice 1 Tomato 1 Watermelon |  |
| Watermelon Gazpacho | Player Crafting | 3 |  | Chefs | Cook pot | 1 Salt 1 Elves Ear 1 Goat Cheese Slice 1 Tomato 1 Watermelon |  |
| Waterskin (3/3) | Player Crafting | 1 |  | N/A | Cook pot | 1 Waterskin (Salt Water) |  |
| Waterskin (3/3) | Cook pot | 1 |  | N/A | Cook pot | 1 Waterskin (Salt Water) |  |
| Werebear's Blood Poison (Crude) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 1 |
| Werebear's Blood Poison (Crude) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 1 |
| Werebear's Blood Poison (Decent) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Poison (Decent) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Poison (Good) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Poison (Good) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Poison (Great) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Poison (Great) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Poison (Remarkable) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Poison (Remarkable) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Decent) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Potion (Decent) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Potion (Good) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Potion (Good) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Potion (Great) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Potion (Great) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Potion (Remarkable) | Cook pot | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Remarkable) | Player Crafting | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Wheat Boon Tea | Cook pot | 1 |  | Chefs | Cook pot | 3 Wheat 1 Hanging Moss 1 Glass Bottle (Water) |  |
| Wheat Boon Tea | Player Crafting | 1 |  | Chefs | Cook pot | 3 Wheat 1 Hanging Moss 1 Glass Bottle (Water) |  |
| White-Gold Tower | Player Crafting | 2 |  | Brewers | Brewing Barrel | 1 Nord Mead 1 Lavender 1 Dragon's Tongue 1 Bottled Milk |  |
| White-Gold Tower | Brewing Barrel | 2 |  | N/A | Brewing Barrel | 1 Nord Mead 1 Lavender 1 Dragon's Tongue 1 Bottled Milk |  |
| Wolf Cabbage Stew | Cook pot | 1 |  | Chefs | Cook pot | 1 Cabbage 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Wolf Cabbage Stew | Player Crafting | 1 |  | Chefs | Cook pot | 1 Cabbage 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Wolf Jerky | Player Crafting | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Wolf Meat |  |
| Wolf Jerky | Cook pot | 3 |  | Chefs | Cook pot | 6 Salt 1 Raw Wolf Meat |  |
| Wood | Breakdown | 3 |  | N/A | N/A | 1 Wooden Common Table |  |
| Wood | Breakdown | 3 |  | N/A | N/A | 1 Wooden Barrel |  |
| Wood | Breakdown | 2 |  | N/A | N/A | 1 Wooden Common Chair |  |
| Wood | Breakdown | 3 |  | N/A | N/A | 1 Wooden Common Bed |  |
| Wood | Breakdown | 5 |  | N/A | N/A | 1 Furniture Workbench |  |
| Wood | Breakdown | 4 |  | N/A | N/A | 1 Spinning Wheel |  |
| Wood | Breakdown | 3 |  | N/A | N/A | 1 Wooden Chest |  |
| Wooden Torch | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Wrap 1 Wood 1 Flammable Oil |  |
| Wooden Torch (5) | Player Crafting | 1 |  | Survivalists | N/A | 5 Linen Wrap 5 Wood 5 Flammable Oil |  |
| Wooden Torch (10) | Player Crafting | 1 |  | Survivalists | N/A | 10 Linen Wrap 10 Wood 10 Flammable Oil |  |
| Wooden Torch (Bright) | Player Crafting | 1 |  | Survivalists | N/A | 1 Linen Wrap 1 Wood 1 Dwarven Oil |  |
| Wooden Torch (Bright) (5) | Player Crafting | 1 |  | Survivalists | N/A | 5 Linen Wrap 5 Wood 5 Dwarven Oil |  |
| Wooden Walking Stick | Player Crafting | 1 |  | Survivalists | N/A | 2 Wood 2 Leather Strips |  |
| Wooden Walking Stick | Player Crafting | 1 |  | Survivalists | N/A | 2 Leather Strips 4 Deadwood |  |
| Wyrm and Chips | Cook pot | 2 |  | Chefs | Cook pot | 1 Salt 2 Potato 1 Raw Dragon Meat |  |
| Wyrm and Chips | Player Crafting | 2 |  | Chefs | Cook pot | 1 Salt 2 Potato 1 Raw Dragon Meat |  |
| Aegisbane | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Akaviri Katana | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Amulet of Zenithar Replica | Forge | 1 | Craftsmanship | Jewelers | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Amulet of Zenithar Replica | Player Crafting | 1 | Craftsmanship | Jewelers | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Ancient Nordic Amulet | Forge | 1 | Craftsmanship | Jewelers | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Amulet | Player Crafting | 1 | Craftsmanship | Jewelers | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Battleaxe | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 3 Leather Strips |  |
| Ancient Nordic Battleaxe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Battleaxe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 3 Leather Strips |  |
| Ancient Nordic Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Ancient Nordic Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Bear 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Bear 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Ancient Nordic Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Bear 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Bear 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Ancient Nordic Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Ancient Nordic Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Dagger | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Linen Wrap 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Linen Wrap 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Greatsword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Greatsword | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic Greatsword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Ancient Nordic Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Ancient Nordic Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Helmet - Antlers | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Doe Antlers 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Helmet - Antlers | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Doe Antlers 1 Leather Strips 1 Leather |  |
| Ancient Nordic Honed Battleaxe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Battleaxe | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Battleaxe 2 Ingot: Corundum |  |
| Ancient Nordic Honed Battleaxe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Battleaxe 2 Ingot: Corundum |  |
| Ancient Nordic Honed Dagger | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Honed Greatsword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Greatsword 2 Ingot: Corundum |  |
| Ancient Nordic Honed Greatsword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Greatsword | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Greatsword 2 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Light Bow 2 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Light Bow 2 Ingot: Corundum |  |
| Ancient Nordic Honed Mace | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Honed Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Sword 1 Ingot: Corundum |  |
| Ancient Nordic Honed Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Sword 1 Ingot: Corundum |  |
| Ancient Nordic Honed Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic War Axe 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic War Axe 1 Ingot: Corundum |  |
| Ancient Nordic Honed Warhammer | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Light Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Light Bow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Ancient Nordic Light Bow | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Ancient Nordic Mace | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Necklace | Forge | 1 | Craftsmanship | Jewelers | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic Sword - Ceremonial | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic War Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic War Axe | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic War Axe - Ceremonial | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Warhammer | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Angi's Light Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Archmage's Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Brown | College - The Eye of Magnus Complete |
| Archmage's Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Bear 2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan | College - The Eye of Magnus Complete |
| Archmage's Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan | College - The Eye of Magnus Complete |
| Armor of the Old Gods | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Arrow: Ancient Nordic | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Ancient Nordic | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Bone (Crude) | Player Crafting | 5 | Craftsmanship | Smiths,Survivalists | N/A | 1 Wood 3 Fragment: Bone | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Bone (Crude) | Player Crafting | 5 | Craftsmanship | Smiths,Survivalists | N/A | 3 Fragment: Bone 1 Animal Bone (Large) | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Falmer | Player Crafting | 24 | Craftsmanship | Smiths | Forge | 1 Chaurus Chitin 1 Wood |  |
| Arrow: Falmer | Forge | 24 | Craftsmanship | Smiths | Forge | 1 Chaurus Chitin 1 Wood |  |
| Arrow: Forsworn | Player Crafting | 24 | Craftsmanship | Smiths,Survivalists | N/A | 1 Doe Antlers 1 Wood |  |
| Arrow: Iron | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Iron | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Silver | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Arrow: Silver | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Arrow: Steel | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Arrow: Steel | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Arrow: Stone (Crude) | Player Crafting | 5 | Craftsmanship | Smiths,Survivalists | N/A | 1 Wood 1 Sharp Rock | Animal Harvesting Skill Less or Equal to 2 |
| Bearskin Cloak - Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Ornate Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Trimmed Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Hood - Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Cave Bear 1 Leather Strips |  |
| Bearskin Hood - Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Bear 1 Leather Strips |  |
| Bearskin Hood - Ornate Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Cave Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Snow Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Trimmed Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Cave Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Snow Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Snow Bear 1 Leather Strips |  |
| Blade of Woe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Blades Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Corundum |  |
| Blades Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Corundum |  |
| Blades Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Corundum |  |
| Blades Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Corundum |  |
| Blades Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Corundum |  |
| Bloodskal Blade | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Bloodskal Blade Replica | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Bloodthorn | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Bolar's Oathblade | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Bolt: Dawnguard | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Wood |  |
| Bolt: Dawnguard | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Wood |  |
| Bolt: Imperial | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Imperial | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Iron | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Bolt: Iron | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Wood |  |
| Bolt: Silver | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Bolt: Silver | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Bolt: Steel | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Steel | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Stormcloak | Player Crafting | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Stormcloak | Forge | 15 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Boots of the Old Gods | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Bow of the Hunt | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Building Glass | Player Crafting | 1 | Craftsmanship | Builders,Alchemists | Smelter | 20 Fragment: Building Glass |  |
| Building Glass | Smelter | 1 | Craftsmanship | Builders,Alchemists | Smelter | 20 Fragment: Building Glass |  |
| Champion's Cudgel Replica | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Child's Doll | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Tundra Cotton 1 Leather Strips 2 Linen Cloth |  |
| Cotton Boots - Thalmor | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Cloth | Spinning Wheel | 1 | Craftsmanship | N/A | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Cloth | Player Crafting | 1 | Craftsmanship | Tailors,Survivalists | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Cloth - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Black |  |
| Cotton Cloth - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Blue |  |
| Cotton Cloth - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Brown |  |
| Cotton Cloth - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Green |  |
| Cotton Cloth - Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Grey |  |
| Cotton Cloth - Indigo | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Indigo |  |
| Cotton Cloth - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Orange |  |
| Cotton Cloth - Purple | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Purple |  |
| Cotton Cloth - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Red |  |
| Cotton Cloth - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Tan |  |
| Cotton Cloth - Yellow | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 1 Dye - Yellow |  |
| Cotton Cuffed Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Cultist Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Cultist Gloves | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Bone Meal 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Cultist Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Bone Meal 4 Leather 4 Cotton Thread 5 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Fine Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 6 Gold 1 Leather 2 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Clothes - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Grey |  |
| Cotton Fine Clothes - Indigo | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Indigo |  |
| Cotton Fine Hat | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather Strips 1 Pelt: Snow Fox 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Hat | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather Strips 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Shoes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown |  |
| Cotton Fur-Mantled Clothes - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo |  |
| Cotton Fur-Mantled Clothes - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Bear 2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo |  |
| Cotton Fur-Mantled Clothes - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green |  |
| Cotton Fur-Mantled Clothes - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Bear 4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green |  |
| Cotton Gloves - Mythic Dawn | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Red | Daedra - Pieces of the Past |
| Cotton Gloves - Thalmor | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Thread 2 Cotton Cloth - Black |  |
| Cotton Hood - Mythic Dawn | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Thread 3 Cotton Cloth - Red | Daedra - Pieces of the Past |
| Cotton Jester's Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Jester's Clothes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather Strips 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Red |  |
| Cotton Jester's Gloves | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Thread 2 Cotton Cloth - Black |  |
| Cotton Jester's Hat | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Thread 1 Cotton Cloth - Black 2 Cotton Cloth - Red |  |
| Cotton Mage Boots - Common | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Cotton Thread 1 Cotton Cloth - Blue 2 Cotton Cloth - Grey |  |
| Cotton Mage Boots - Embellished | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Cotton Thread 1 Cotton Cloth - Brown 2 Cotton Cloth - Grey |  |
| Cotton Merchant's Hat | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Quilted Clothes - Black and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Quilted Clothes - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 2 Cotton Cloth - Blue 3 Cotton Cloth - Indigo |  |
| Cotton Quilted Clothes - Brown and Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Cotton Thread 3 Cotton Cloth - Brown 2 Cotton Cloth - Orange |  |
| Cotton Quilted Clothes - Brown and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Quilted Clothes - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Tan |  |
| Cotton Quilted Clothes - Orange and Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Orange |  |
| Cotton Reclamations Temple Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown 1 Cotton Cloth - Grey | Dragonborn - Clean Sweep Complete |
| Cotton Reclamations Temple Hood | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Thread 3 Cotton Cloth - Blue | Dragonborn - Clean Sweep Complete |
| Cotton Reclamations Temple Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Netch Leather 4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Blue 2 Cotton Cloth - Grey | Dragonborn - Clean Sweep Complete |
| Cotton Robes - Mythic Dawn | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Cotton Thread 4 Cotton Cloth - Red 1 Cotton Cloth - Yellow | Daedra - Pieces of the Past |
| Cotton Robes - Thalmor | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Cotton Thread 5 Cotton Cloth - Black |  |
| Cotton Shoes - Mythic Dawn | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Daedra - Pieces of the Past |
| Cotton Tall Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Cotton Thread 4 Cotton Cloth - Tan |  |
| Cotton Telvanni Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Netch Leather 4 Cotton Thread 1 Cotton Cloth - Black 3 Cotton Cloth - Red 1 Cotton Cloth - Yellow | Dragonborn -  Old Friends Complete |
| Cotton Telvanni Shoes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn -  Old Friends Complete |
| Cotton Thread | Player Crafting | 4 | Craftsmanship | Tailors,Survivalists | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Thread | Spinning Wheel | 4 | Craftsmanship | N/A | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Vaermina Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Cotton Thread 5 Cotton Cloth - Purple | Daedra - Waking Nightmare |
| Dawnguard Heavy Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Cuirass - Black | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Cuirass - Black | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Cuirass - Grey | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Grey | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Grey | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Grey | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips 1 Leather | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips 1 Leather | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Improved Light Crossbow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Corundum 1 Dawnguard Light Crossbow | Read Improved Crossbow Schematic |
| Dawnguard Improved Light Crossbow | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Corundum 1 Dawnguard Light Crossbow | Read Improved Crossbow Schematic |
| Dawnguard Improved Light Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace | Read Improved Crossbow Schematic |
| Dawnguard Light Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Crossbow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 3 Wood 4 Hide Lace | Dawnguard - A New Order complete and spoken to Sorine about crossbow construction |
| Dawnguard Light Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Dawnguard Light Crossbow | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 3 Wood 4 Hide Lace | Dawnguard - A New Order complete and spoken to Sorine about crossbow construction |
| Dawnguard Light Cuirass - Black | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass - Black | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Cuirass - Red | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Cuirass - Red | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Dye - Red | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass - Red | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Dye - Red | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Reinforced Light Cuirass - Blue | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Blue | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Reinforced Light Cuirass - Blue | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Reinforced Light Cuirass - Blue | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Blue | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Rune Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Dawnguard Rune War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Dawnguard Rune War Axe Replica | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Dawnguard Rune War Axe Replica | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune War Axe Replica | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Warhammer | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Dawnguard Rune Warhammer Replica | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Warhammer Replica | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Dawnguard Rune Warhammer Replica | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard War Axe | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Dawnguard War Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Dragon Priest Dagger | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Dragon Priest Dagger | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Dragon Priest Dagger | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Dragonbane | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Dragonplate Bearskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Dark Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Light Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Light Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Light Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Noble Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Noble Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Noble White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Dark Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Light Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Light Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Light Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Noble Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Noble Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Noble White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Dragon Scales |  |
| Emperor's Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood Main Quest Complete |
| Emperor's Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood Main Quest Complete |
| Falmer Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Bracers | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Bracers | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Bow | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Chaurus Chitin 3 Leather Strips |  |
| Falmer Heavy Bow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Chaurus Chitin 3 Leather Strips |  |
| Falmer Heavy Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Chaurus Chitin 2 Hide Lace |  |
| Falmer Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Chaurus Chitin 2 Leather Strips |  |
| Falmer Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Chaurus Chitin 2 Leather Strips |  |
| Falmer Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Chaurus Chitin |  |
| Falmer Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Chaurus Chitin 1 Leather Strips |  |
| Falmer Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Chaurus Chitin 1 Leather Strips |  |
| Falmer War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Chaurus Chitin |  |
| Falmer War Axe | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Chaurus Chitin 2 Leather Strips |  |
| Falmer War Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Chaurus Chitin 2 Leather Strips |  |
| Floral Head Wreath | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 12 Tundra Cotton |  |
| Focusing Gloves | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Cotton Thread 2 Cotton Cloth - Black | College - Out Of Balance Complete |
| Forsworn Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Forsworn Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Hagraven Feathers 4 Pelt: Goat 4 Leather Strips |  |
| Forsworn Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Forsworn Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Hagraven Feathers 4 Leather Strips 2 Fur Plate |  |
| Forsworn Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Forsworn Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Headdress | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Forsworn Headdress | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Hagraven Feathers 1 Doe Antlers 2 Fur Plate |  |
| Forsworn Headdress | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Hagraven Feathers 1 Pelt: Goat 1 Doe Antlers |  |
| Forsworn Light Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Forsworn Light Bow | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Doe Antlers 2 Wood 5 Leather Strips 1 Hawk Feathers |  |
| Forsworn Light Bow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Doe Antlers 2 Wood 5 Leather Strips 1 Hawk Feathers |  |
| Forsworn Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 6 Sabre Cat Tooth 2 Wood 4 Leather Strips |  |
| Forsworn Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Forsworn Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 6 Sabre Cat Tooth 2 Wood 4 Leather Strips |  |
| Forsworn War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Forsworn War Axe | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Sabre Cat Tooth 3 Wood 5 Leather Strips 1 Quarried Stone |  |
| Forsworn War Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Sabre Cat Tooth 3 Wood 5 Leather Strips 1 Quarried Stone |  |
| Fragment: Building Glass | Breakdown | 20 | Craftsmanship | N/A | N/A | 1 Building Glass |  |
| Fragment: Corundum | Breakdown | 20 | Craftsmanship | N/A | N/A | 1 Ingot: Corundum |  |
| Fragment: Galatite | Breakdown | 20 | Craftsmanship | N/A | N/A | 1 Ingot: Galatite |  |
| Fragment: Iron | Breakdown | 20 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Fragment: Steel | Breakdown | 20 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Froki's Heavy Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Wood 2 Hide Lace |  |
| Fur Backpack - Black | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Backpack - Brown | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Backpack - White | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Bedroll | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Boots | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Bracers | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Cuirass | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 4 Hide Lace 5 Fur Plate |  |
| Fur Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Gauntlets | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Guard's Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Guard's Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Cuirass - Falkreath | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Falkreath | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Falkreath | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Haafingar | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Haafingar | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Haafingar | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Hjaalmarch | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Hjaalmarch | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Hjaalmarch | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - The Reach | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - The Reach | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Reach | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Rift | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - The Rift | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Rift | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Whiterun | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Whiterun | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Whiterun | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Winterhold | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Winterhold | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Winterhold | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Fur Guard's Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Helmet | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 1 Hide Lace 2 Fur Plate |  |
| Fur Kilt | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 3 Hide Lace 2 Fur Plate |  |
| Fur Kilt | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Large Tent | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 4 Wood 2 Leather 12 Fur Plate 1 Fur Bedroll |  |
| Fur Large Tent (Four Bedrolls) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Large Tent (Three Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Three Bedrolls) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Large Tent (Two Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Two Bedrolls) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Large Tent 1 Fur Bedroll |  |
| Fur Mantled Kilt | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 3 Hide Lace 3 Fur Plate |  |
| Fur Mantled Kilt | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Goat (Poor) |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Fur Plate | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Fur Plate | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Fur Plate | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Fur Plate | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Goat (Poor) |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer |  |
| Fur Plate | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Snow Fox |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Fox (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Ice Wolf (Poor) |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer |  |
| Fur Plate | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Wolf (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Skeever |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Skeever (Poor) |  |
| Fur Plate | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Skeever |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Snow Fox |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Ice Wolf (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Skeever (Poor) |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Fox (Poor) |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Fur Plate | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear |  |
| Fur Plate | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Fox |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 3 Pelt: Fox |  |
| Fur Plate | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll |  |
| Fur Plate | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Wolf (Poor) |  |
| Fur Plate | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Fur Plate | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Fur Plate | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Fur Shoes | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Shoes | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 2 Hide Lace 1 Fur Plate |  |
| Fur Sleeveless Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Fur Plate |  |
| Fur Sleeveless Cuirass | Player Crafting | 1 | Craftsmanship | Survivalists,Smiths | N/A | 4 Hide Lace 4 Fur Plate |  |
| Fur Small Tent | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 2 Wood 2 Leather 6 Fur Plate 1 Fur Bedroll |  |
| Fur Small Tent (Two Bedrolls) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Small Tent 1 Fur Bedroll |  |
| Furred Robes - Dark | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Fur Plate 2 Linen Cloth - Black 4 Linen Thread |  |
| Furred Robes - Pale | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Fur Plate 4 Linen Thread 2 Linen Cloth |  |
| Gauldur Blackblade | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Gauldur Heavy Blackbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Gauntlets of the Old Gods | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| General Carius' Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| General Tullius' Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Glass Alembic | Forge | 1 | Craftsmanship | Alchemists | Forge | 1 Ingot: Steel 5 Building Glass |  |
| Glass Alembic | Player Crafting | 1 | Craftsmanship | Alchemists | Forge | 1 Ingot: Steel 5 Building Glass |  |
| Glass Bottle (Empty) | Forge | 1 | Craftsmanship | Alchemists,Survivalists,Builders,Brewers,Smiths | Forge | 5 Building Glass |  |
| Glass Bottle (Empty) | Player Crafting | 1 | Craftsmanship | Alchemists,Survivalists,Builders,Brewers,Smiths | Forge | 5 Building Glass |  |
| Gloves of the Pugilist | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Gorak's Troll Gutting Knife | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Greybeard's Hood | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Cotton Thread 3 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Greybeard's Robes | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 4 Cotton Thread 5 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Greybeard's Shoes | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Leather 2 Cotton Thread 3 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Harkon's Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Helm of Yngol | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Corundum |  |
| Helm of Yngol Replica | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Sidequest - Escape Yngols Barrow Complete,Currently Uncraftable - Global Disabled |
| Helm of Yngol Replica | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Sidequest - Escape Yngols Barrow Complete,Currently Uncraftable - Global Disabled |
| Helmet of the Old Gods | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Hide Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Hide Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather |  |
| Hide Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather 2 Fur Plate |  |
| Hide Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Elk 2 Leather Strips 2 Leather |  |
| Hide Boots - Movarth's | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Hide Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Hide Bracers | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 1 Leather |  |
| Hide Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather 2 Fur Plate |  |
| Hide Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Elk 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather 2 Fur Plate |  |
| Hide Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Hide Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Elk 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Furred Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Leather 4 Hide Lace 2 Fur Plate |  |
| Hide Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Hide Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Hide Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Hide Lace | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Hide Lace | Player Crafting | 4 | Craftsmanship | Smiths,Tailors,Survivalists,Jewelers | N/A | 1 Fur Plate |  |
| Hide Lace | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ruined |  |
| Hide Lace | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ruined |  |
| Hide Lace | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Hide Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Hide Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 4 Leather |  |
| Hide Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 4 Leather |  |
| Hide Skaal Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 5 Leather Strips 6 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Pelt: Elk 5 Leather Strips 4 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Elk 1 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hoarfrost | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Horksbane | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Horse Armor: Big Game Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Troll Skull 1 Mammoth Tusk 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Big Game Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Troll Skull 1 Mammoth Tusk 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Big Game Saddle - Adorned | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Rueful Axe 1 Horse Armor: Big Game Saddle |  |
| Horse Armor: Big Game Saddle - Adorned | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Rueful Axe 1 Horse Armor: Big Game Saddle |  |
| Horse Armor: Dawnguard Barding and Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Horse Armor: Dawnguard Barding and Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Steel Heavy Crossbow 8 Bolt: Steel 1 Dawnguard War Axe 1 Dawnguard Heavy Shield 1 Horse Armor: Dawnguard Barding and Saddle | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Steel Heavy Crossbow 8 Bolt: Steel 1 Dawnguard War Axe 1 Dawnguard Heavy Shield 1 Horse Armor: Dawnguard Barding and Saddle | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Fur Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 2 Leather |  |
| Horse Armor: Fur Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 2 Leather |  |
| Horse Armor: Hunter's Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 1 Pelt: Fox 3 Leather |  |
| Horse Armor: Hunter's Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 1 Pelt: Fox 3 Leather |  |
| Horse Armor: Hunter's Saddle - Adorned | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 8 Arrow: Steel 1 Horse Armor: Hunter's Saddle |  |
| Horse Armor: Hunter's Saddle - Adorned | Forge | 1 | Craftsmanship | Smiths | Forge | 8 Arrow: Steel 1 Horse Armor: Hunter's Saddle |  |
| Horse Armor: Imperial Barding and Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Imperial Barding and Saddle | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Horse Armor: Imperial Barding and Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Iron Sword 1 Imperial Heavy Shield 1 Imperial Heavy Bow 8 Arrow: Iron 1 Horse Armor: Imperial Barding and Saddle |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Iron Sword 1 Imperial Heavy Shield 1 Imperial Heavy Bow 8 Arrow: Iron 1 Horse Armor: Imperial Barding and Saddle |  |
| Horse Armor: Imperial Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Imperial Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 2 Wood 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 2 Wood 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle - Adorned | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Steel Helmet 1 Steel Shield 1 Steel Greatsword 1 Steel Sword 1 Horse Armor: Knight's Saddle |  |
| Horse Armor: Knight's Saddle - Adorned | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Steel Helmet 1 Steel Shield 1 Steel Greatsword 1 Steel Sword 1 Horse Armor: Knight's Saddle |  |
| Horse Armor: Leather Barding and Saddle | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Horse Armor: Leather Barding and Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Minstrel's Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 6 Leather Strips 1 Wooden Lute 3 Leather |  |
| Horse Armor: Minstrel's Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 6 Leather Strips 1 Wooden Lute 3 Leather |  |
| Horse Armor: Minstrel's Saddle - Adorned | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 8 Arrow: Steel 1 Horse Armor: Minstrel's Saddle |  |
| Horse Armor: Minstrel's Saddle - Adorned | Forge | 1 | Craftsmanship | Smiths | Forge | 8 Arrow: Steel 1 Horse Armor: Minstrel's Saddle |  |
| Horse Armor: Nordic Barding and Saddle | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Horse Armor: Ornate Barding and Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 6 Linen Wrap 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Ornate Barding and Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 6 Linen Wrap 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Ornate Barding and Saddle | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Horse Armor: Shadowmere's Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Shadowmere's Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Bear 2 Ingot: Iron 10 Leather Strips 7 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Bear 2 Ingot: Iron 10 Leather Strips 7 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Iron Sword 8 Arrow: Iron 1 Wooden Light Bow 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Iron Sword 8 Arrow: Iron 1 Wooden Light Bow 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Horse Armor: Traveler's Saddle | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Linen Wrap 1 Corundum Flagon 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Traveler's Saddle | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Linen Wrap 1 Corundum Flagon 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Imperial Crested Heavy Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Imperial Crested Heavy Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Crested Heavy Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial General Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial General Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Heavy Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 3 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 3 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Imperial Heavy Bow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 3 Wood 3 Hide Lace | Civil War - Joined Imperials |
| Imperial Heavy Bow | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 3 Wood 3 Hide Lace | Civil War - Joined Imperials |
| Imperial Heavy Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Bracers | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Bracers | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Crossbow | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Imperial Heavy Crossbow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Imperial Heavy Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Imperial Heavy Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Heavy Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Heavy Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Heavy Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Light Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Imperial Light Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Bracers | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Imperial Light Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Imperial Light Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Light Helmet | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Imperial Light Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Imperial Light Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 4 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Light Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 4 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Officer Heavy Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Imperial Officer Heavy Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Officer Heavy Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Outcast Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Imperial Outcast Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Imperial Outcast Bracers | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Elk 2 Leather Strips |  |
| Imperial Outcast Bracers | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Fur Plate |  |
| Imperial Outcast Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Imperial Outcast Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Imperial Outcast Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Iron 1 Leather Strips |  |
| Imperial Outcast Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Iron 1 Leather Strips |  |
| Imperial Studded Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Imperial Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Imperial Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Imperials |
| Imperial Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Imperials |
| Ingot: Corundum | Player Crafting | 20 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Ore: Corundum |  |
| Ingot: Corundum | Smelter | 10 | Craftsmanship | N/A | Smelter | 30 Ore: Corundum |  |
| Ingot: Corundum | Smelter | 20 | Craftsmanship | N/A | Smelter | 60 Ore: Corundum |  |
| Ingot: Corundum | Smelter | 5 | Craftsmanship | N/A | Smelter | 25 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 20 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 60 Ore: Corundum |  |
| Ingot: Corundum | Smelter | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Corundum |  |
| Ingot: Corundum | Smelter | 1 | Craftsmanship | N/A | Smelter | 3 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Corundum |  |
| Ingot: Corundum | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Corundum |  |
| Ingot: Corundum | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Corundum |  |
| Ingot: Corundum | Smelter | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Corundum |  |
| Ingot: Corundum | Smelter | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Corundum |  |
| Ingot: Corundum | Smelter | 20 | Craftsmanship | N/A | Smelter | 100 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Corundum |  |
| Ingot: Corundum | Smelter | 1 | Craftsmanship | N/A | Smelter | 5 Ore: Corundum |  |
| Ingot: Corundum | Smelter | 10 | Craftsmanship | N/A | Smelter | 50 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Corundum |  |
| Ingot: Corundum | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Corundum |  |
| Ingot: Corundum | Smelter | 5 | Craftsmanship | N/A | Smelter | 15 Ore: Corundum |  |
| Ingot: Galatite | Breakdown | 2 | Craftsmanship | N/A | N/A | 1 Skyforge Steel Mace |  |
| Ingot: Galatite | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Galatite |  |
| Ingot: Galatite | Smelter | 1 | Craftsmanship | N/A | Smelter | 14 Fragment: Steel 6 Fragment: Quicksilver |  |
| Ingot: Galatite | Smelter | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Galatite |  |
| Ingot: Galatite | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Galatite |  |
| Ingot: Galatite | Player Crafting | 3 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 2 Ingot: Steel 1 Ingot: Quicksilver |  |
| Ingot: Galatite | Smelter | 3 | Craftsmanship | N/A | Smelter | 2 Ingot: Steel 1 Ingot: Quicksilver |  |
| Ingot: Galatite | Smelter | 6 | Craftsmanship | N/A | Smelter | 4 Ingot: Steel 2 Ingot: Quicksilver |  |
| Ingot: Galatite | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 14 Fragment: Steel 6 Fragment: Quicksilver |  |
| Ingot: Galatite | Player Crafting | 6 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 4 Ingot: Steel 2 Ingot: Quicksilver |  |
| Ingot: Galatite | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Galatite |  |
| Ingot: Galatite | Smelter | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Galatite |  |
| Ingot: Galatite | Smelter | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Galatite |  |
| Ingot: Iron | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Iron |  |
| Ingot: Iron | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Iron |  |
| Ingot: Iron | Smelter | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Iron |  |
| Ingot: Iron | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Iron |  |
| Ingot: Iron | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Iron |  |
| Ingot: Iron | Player Crafting | 20 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Ore: Iron |  |
| Ingot: Iron | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Iron |  |
| Ingot: Iron | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Iron |  |
| Ingot: Iron | Smelter | 5 | Craftsmanship | N/A | Smelter | 15 Ore: Iron |  |
| Ingot: Iron | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Iron |  |
| Ingot: Iron | Smelter | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Iron |  |
| Ingot: Iron | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Iron |  |
| Ingot: Iron | Smelter | 5 | Craftsmanship | N/A | Smelter | 25 Ore: Iron |  |
| Ingot: Iron | Smelter | 10 | Craftsmanship | N/A | Smelter | 30 Ore: Iron |  |
| Ingot: Iron | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Iron |  |
| Ingot: Iron | Player Crafting | 20 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 60 Ore: Iron |  |
| Ingot: Iron | Smelter | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Iron |  |
| Ingot: Iron | Smelter | 20 | Craftsmanship | N/A | Smelter | 60 Ore: Iron |  |
| Ingot: Iron | Smelter | 1 | Craftsmanship | N/A | Smelter | 3 Ore: Iron |  |
| Ingot: Iron | Smelter | 1 | Craftsmanship | N/A | Smelter | 5 Ore: Iron |  |
| Ingot: Iron | Smelter | 20 | Craftsmanship | N/A | Smelter | 100 Ore: Iron |  |
| Ingot: Iron | Smelter | 10 | Craftsmanship | N/A | Smelter | 50 Ore: Iron |  |
| Ingot: Steel | Smelter | 10 | Craftsmanship | N/A | Smelter | 10 Ingot: Iron 10 Charcoal |  |
| Ingot: Steel | Player Crafting | 25 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ingot: Iron 25 Charcoal |  |
| Ingot: Steel | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Steel |  |
| Ingot: Steel | Smelter | 10 | Craftsmanship | N/A | Smelter | 200 Fragment: Steel |  |
| Ingot: Steel | Smelter | 50 | Craftsmanship | N/A | Smelter | 50 Ingot: Iron 50 Charcoal |  |
| Ingot: Steel | Smelter | 25 | Craftsmanship | N/A | Smelter | 25 Ingot: Iron 25 Charcoal |  |
| Ingot: Steel | Smelter | 5 | Craftsmanship | N/A | Smelter | 100 Fragment: Steel |  |
| Ingot: Steel | Player Crafting | 50 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ingot: Iron 50 Charcoal |  |
| Ingot: Steel | Player Crafting | 10 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 10 Ingot: Iron 10 Charcoal |  |
| Ingot: Steel | Smelter | 1 | Craftsmanship | N/A | Smelter | 20 Fragment: Steel |  |
| Ingot: Steel | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 1 Ingot: Iron 1 Charcoal |  |
| Ingot: Steel | Player Crafting | 5 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Steel |  |
| Ingot: Steel | Player Crafting | 1 | Craftsmanship | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Steel |  |
| Ingot: Steel | Smelter | 1 | Craftsmanship | N/A | Smelter | 1 Ingot: Iron 1 Charcoal |  |
| Iron Armor (Engraved) | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Iron Cuirass |  |
| Iron Banded Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Banded Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Banded Cuirass - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Masterwork Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Banded Quality Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Quality Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Banded Quality Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Banded Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Battleaxe | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Battleaxe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Battleaxe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Battlestaff | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Wood 2 Leather Strips |  |
| Iron Battlestaff | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Wood 2 Leather Strips |  |
| Iron Battlestaff | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Boots - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots - Engraved | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Boots - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots (Engraved) | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Iron Boots |  |
| Iron Cauldron | Player Crafting | 1 | Craftsmanship | Smiths,Alchemists | Forge | 8 Ingot: Iron |  |
| Iron Cauldron | Forge | 1 | Craftsmanship | Smiths,Alchemists | Forge | 8 Ingot: Iron |  |
| Iron Cooking Pot | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron |  |
| Iron Cooking Pot | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron |  |
| Iron Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass - Engraved | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Dagger | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Dagger | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Dagger | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Dented Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Fittings | Forge | 5 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron |  |
| Iron Fittings | Player Crafting | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron Fittings | Player Crafting | 10 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron |  |
| Iron Fittings | Player Crafting | 5 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron |  |
| Iron Fittings | Forge | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron Fittings | Forge | 10 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron |  |
| Iron Furred Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 4 Hide Lace 2 Fur Plate |  |
| Iron Furred Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 4 Hide Lace 2 Fur Plate |  |
| Iron Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Gauntlets - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Gauntlets - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets (Engraved) | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Iron Gauntlets |  |
| Iron Greatsword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Leather Strips |  |
| Iron Greatsword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Greatsword | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Leather Strips |  |
| Iron Guard's Cuirass - Eastmarch | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Iron Guard's Cuirass - Eastmarch | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Iron Guard's Cuirass - Falkreath | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Ingot: Corundum 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Falkreath | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Ingot: Corundum 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Haafingar | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Haafingar | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Hjaalmarch | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Hjaalmarch | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Pale | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Pale | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Reach | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 3 Leather 3 Ingot: Dwarven | Thane of Hold |
| Iron Guard's Cuirass - The Reach | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 3 Leather 3 Ingot: Dwarven | Thane of Hold |
| Iron Guard's Cuirass - The Rift | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 6 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Rift | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 6 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Whiterun | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Whiterun | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Winterhold | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Winterhold | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Hammer | Player Crafting | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Hammer | Forge | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Headsman's Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Headsman's Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Headsman's Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Heavy Crossbow | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Wood 2 Hide Lace |  |
| Iron Heavy Crossbow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Wood 2 Hide Lace |  |
| Iron Heavy Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron 2 Hide Lace |  |
| Iron Heavy Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Wood 2 Leather Strips |  |
| Iron Heavy Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Iron Dented Shield |  |
| Iron Heavy Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Wood 2 Leather Strips |  |
| Iron Heavy Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Heavy Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Iron Dented Shield |  |
| Iron Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Engraved | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Engraved | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Helmet - Engraved | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Ram | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Helmet - Ram | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Ram | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Ram | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Ram | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet (Engraved) | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Iron Helmet |  |
| Iron Hinge | Player Crafting | 2 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron Hinge | Player Crafting | 20 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron |  |
| Iron Hinge | Forge | 2 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron Hinge | Forge | 20 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron |  |
| Iron Hinge | Forge | 10 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron |  |
| Iron Hinge | Player Crafting | 10 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron |  |
| Iron Hunting Knife | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Hunting Knife | Forge | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Lantern | Player Crafting | 1 | Craftsmanship | Smiths,Thieves,Survivalists | Forge | 1 Ingot: Iron |  |
| Iron Lantern | Forge | 1 | Craftsmanship | Smiths,Thieves,Survivalists | Forge | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Falkreath | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Falkreath | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Falkreath | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Hjaalmarch | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Hjaalmarch | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Hjaalmarch | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Pale | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Pale | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Pale | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Reach | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Reach | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Reach | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Rift | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Rift | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Rift | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Whiterun | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Whiterun | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Whiterun | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Eastmarch | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Eastmarch | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Eastmarch | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Falkreath | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Falkreath | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Falkreath | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Haafingar | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Haafingar | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Haafingar | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Hjaalmarch | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Hjaalmarch | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Hjaalmarch | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Pale | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - The Pale | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Pale | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - The Rift | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Rift | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Rift | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Whiterun | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Whiterun | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Whiterun | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Lock | Forge | 5 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron 5 Ingot: Corundum |  |
| Iron Lock | Player Crafting | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron 1 Ingot: Corundum |  |
| Iron Lock | Player Crafting | 10 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron 10 Ingot: Corundum |  |
| Iron Lock | Forge | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron 1 Ingot: Corundum |  |
| Iron Lock | Forge | 10 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron 10 Ingot: Corundum |  |
| Iron Lock | Player Crafting | 5 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron 5 Ingot: Corundum |  |
| Iron Mace | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Mace | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Mace | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Nails | Forge | 10 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron Nails | Forge | 50 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron |  |
| Iron Nails | Player Crafting | 100 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron |  |
| Iron Nails | Player Crafting | 10 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron Nails | Forge | 100 | Craftsmanship | Smiths,Builders | Forge | 10 Ingot: Iron |  |
| Iron Nails | Player Crafting | 50 | Craftsmanship | Smiths,Builders | Forge | 5 Ingot: Iron |  |
| Iron Pickaxe | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Quality Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Quality Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Quality Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Quality Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Quality Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Quality Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Quality Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Quality Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Quality Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Quality Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Quality Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Iron Quality Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Reinforced Armor (Engraved) | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Iron Banded Cuirass |  |
| Iron Robed Cuirass - Dark | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Iron Robed Cuirass - Dark | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Iron Robed Cuirass - Pale | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 4 Linen Thread 3 Linen Cloth |  |
| Iron Robed Cuirass - Pale | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 4 Linen Thread 3 Linen Cloth |  |
| Iron Shiv | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Leather Strips |  |
| Iron Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Leather Strips |  |
| Iron Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Tongs | Forge | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron Tongs | Player Crafting | 1 | Craftsmanship | Smiths,Builders | Forge | 1 Ingot: Iron |  |
| Iron War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron War Axe | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron War Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Warhammer | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Warhammer | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Warhammer | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Woodcutter's Axe | Forge | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | Forge | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 2 Deadwood |  |
| Iron Woodcutter's Axe | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | Forge | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Iron 2 Deadwood |  |
| Ironhand Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Jarl of Eastmarch Armguards | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armguards | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armor | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armor | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark 4 Fur Plate |  |
| Jarl of Eastmarch Armor | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark 4 Fur Plate |  |
| Jarl of Eastmarch Armor | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark |  |
| Jon's Heavy Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Jon's Twohander | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Leather | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow |  |
| Leather | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk |  |
| Leather | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Leather | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Leather | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear |  |
| Leather | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar |  |
| Leather | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Leather | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat |  |
| Leather | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf |  |
| Leather | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Leather | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer |  |
| Leather | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow |  |
| Leather | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Leather | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Leather | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Leather | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf |  |
| Leather | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Leather | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Leather | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Leather | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Leather | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Leather | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear |  |
| Leather | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse |  |
| Leather | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf |  |
| Leather | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer |  |
| Leather | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Leather | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Leather | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Leather | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Skeever |  |
| Leather | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Leather | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Leather | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 2 Pelt: Skeever |  |
| Leather | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk |  |
| Leather | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll |  |
| Leather | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear |  |
| Leather | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer |  |
| Leather Bearskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Black |  |
| Leather Bearskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Brown |  |
| Leather Bearskin Hood - Ornate Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Ornate Black |  |
| Leather Bearskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - Ornate Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Ornate Brown |  |
| Leather Bearskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - Ornate White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Ornate White |  |
| Leather Bearskin Hood - Trimmed Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Trimmed Black |  |
| Leather Bearskin Hood - Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - Trimmed Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Leather Bearskin Hood - Trimmed White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - Trimmed White |  |
| Leather Bearskin Hood - Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bearskin Hood - White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Bearskin Hood - White |  |
| Leather Bearskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Leather Strips 4 Leather |  |
| Leather Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Bracers | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather |  |
| Leather Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Clothes - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Leather 2 Linen Cloth - Black 4 Linen Thread |  |
| Leather Clothes - Black and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather 2 Linen Cloth - Black 1 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Leather Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Leather Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Doublet | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather 2 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Doublet - Dark | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather 3 Linen Cloth - Black 4 Linen Thread |  |
| Leather Executioner's Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Pelt: Ice Wolf 3 Leather Strips |  |
| Leather Executioner's Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Leather Strips 1 Fur Plate |  |
| Leather Executioner's Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark |  |
| Leather Executioner's Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark 2 Fur Plate |  |
| Leather Executioner's Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark |  |
| Leather Executioner's Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark 2 Fur Plate |  |
| Leather Executioner's Gloves | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Leather Executioner's Gloves | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark 1 Fur Plate |  |
| Leather Executioner's Gloves | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Leather Executioner's Gloves | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark 1 Fur Plate |  |
| Leather Executioner's Hood | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Dark |  |
| Leather Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Leather Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Leather Hood | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather |  |
| Leather Hood | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Hood - Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Dark |  |
| Leather Large Tent | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 2 Wood 12 Leather 4 Fur Plate 1 Fur Bedroll |  |
| Leather Large Tent (Three Bedrolls) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Large Tent (Two Bedrolls) 1 Fur Bedroll |  |
| Leather Large Tent (Two Bedrolls) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Large Tent 1 Fur Bedroll |  |
| Leather Quilted Clothes - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 4 Linen Cloth - Black 4 Linen Thread |  |
| Leather Small Tent | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 2 Wood 6 Leather 2 Fur Plate 1 Fur Bedroll |  |
| Leather Small Tent (Two Bedrolls) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Small Tent 1 Fur Bedroll |  |
| Leather Strips | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Leather Strips | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox (Poor) |  |
| Leather Strips | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Leather Strips | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Leather Strips | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ruined |  |
| Leather Strips | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Leather Strips | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Skeever (Poor) |  |
| Leather Strips | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Leather Strips | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Leather Strips | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox |  |
| Leather Strips | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Leather Strips | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Leather Strips | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Leather Strips | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Leather Strips | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat (Poor) |  |
| Leather Strips | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf (Poor) |  |
| Leather Strips | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat (Poor) |  |
| Leather Strips | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox |  |
| Leather Strips | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Leather Strips | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox |  |
| Leather Strips | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf (Poor) |  |
| Leather Strips | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Poor) |  |
| Leather Strips | Tanning Rack | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Leather Strips | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Leather Strips | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Leather |  |
| Leather Strips | Player Crafting | 4 | Craftsmanship | Smiths,Tailors,Survivalists,Jewelers | N/A | 1 Leather |  |
| Leather Strips | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ruined |  |
| Leather Strips | Tanning Rack | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Leather Strips | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Leather Strips | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Leather Strips | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Leather Strips | Player Crafting | 4 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Leather Strips | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Poor) |  |
| Leather Strips | Player Crafting | 3 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Leather Strips | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox (Poor) |  |
| Leather Strips | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Leather Strips | Player Crafting | 1 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Skeever (Poor) |  |
| Leather Strips | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox |  |
| Leather Tiled Clothes - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 4 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Tiled Clothes - Brown and Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Wolfskin Hood - Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Black |  |
| Leather Wolfskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Brown |  |
| Leather Wolfskin Hood - Dark Trimmed Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Leather Wolfskin Hood - Dark Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Dark Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Dark Trimmed Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Leather Wolfskin Hood - Dark Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Dark Trimmed White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Leather Wolfskin Hood - Light Trimmed Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Leather Wolfskin Hood - Light Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Light Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Light Trimmed Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Leather Wolfskin Hood - Light Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Light Trimmed White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Leather Wolfskin Hood - Noble Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Noble Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Noble Black |  |
| Leather Wolfskin Hood - Noble Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Noble Brown |  |
| Leather Wolfskin Hood - Noble Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Noble White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Noble White |  |
| Leather Wolfskin Hood - Noble White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Ornate Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Ornate Black |  |
| Leather Wolfskin Hood - Ornate Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Leather Wolfskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Ornate White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - Ornate White |  |
| Leather Wolfskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather Wolfskin Hood - White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather Helmet 1 Wolfskin Hood - White |  |
| Leather Wolfskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Leather: Dark | Player Crafting | 5 | Craftsmanship | Smiths | N/A | 5 Ore: Iron 5 Leather |  |
| Leather: Dark | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Ore: Iron 1 Leather |  |
| Leather: Dark | Tanning Rack | 5 | Craftsmanship | N/A | Tanning Rack | 5 Ore: Iron 5 Leather |  |
| Leather: Dark | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 1 Ore: Iron 1 Leather |  |
| Leather: Red | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Creep Cluster 1 Leather |  |
| Leather: Red | Tanning Rack | 5 | Craftsmanship | N/A | Tanning Rack | 10 Creep Cluster 5 Leather |  |
| Leather: Red | Tanning Rack | 1 | Craftsmanship | N/A | Tanning Rack | 2 Creep Cluster 1 Leather |  |
| Leather: Red | Player Crafting | 5 | Craftsmanship | Smiths | N/A | 10 Creep Cluster 5 Leather |  |
| Linen Alik'r Boots - Dark | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Alik'r Boots - Dark | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Boots - Dark | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Boots - Tan | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Boots - Tan | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather 3 Linen Cloth - Tan 2 Linen Thread |  |
| Linen Alik'r Garb - Red | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Linen Cloth - Red 2 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Alik'r Garb - Red | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Garb - Red | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Garb - White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Leather 1 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Alik'r Garb - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Hood - Blue | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Linen Cloth - Blue 1 Linen Thread |  |
| Linen Alik'r Hood - Blue | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Hood - Red | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Hood - Red | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linen Alik'r Hood - Red | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Arm Bandages | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth |  |
| Linen Barkeep's Clothes - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth |  |
| Linen Barkeep's Clothes - White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Linen Cloth - Brown 4 Linen Thread 4 Linen Cloth |  |
| Linen Blacksmith's Apron - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Leather 3 Linen Cloth - Red 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Blacksmith's Apron - White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Leather 2 Linen Cloth - Grey 4 Linen Thread 3 Linen Cloth |  |
| Linen Blacksmith's Shoes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Cap | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Chef's Hat | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Linen Thread 3 Linen Cloth |  |
| Linen Chef's Tunic | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Leather Strips 4 Linen Thread 5 Linen Cloth |  |
| Linen Cloth | Spinning Wheel | 1 | Craftsmanship | N/A | Spinning Wheel | 3 Northern Flax |  |
| Linen Cloth | Player Crafting | 1 | Craftsmanship | Tailors,Survivalists | Spinning Wheel | 3 Northern Flax |  |
| Linen Cloth - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Black 1 Linen Cloth |  |
| Linen Cloth - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Blue 1 Linen Cloth |  |
| Linen Cloth - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Brown 1 Linen Cloth |  |
| Linen Cloth - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Green 1 Linen Cloth |  |
| Linen Cloth - Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Grey 1 Linen Cloth |  |
| Linen Cloth - Indigo | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Indigo 1 Linen Cloth |  |
| Linen Cloth - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Orange 1 Linen Cloth |  |
| Linen Cloth - Purple | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Purple 1 Linen Cloth |  |
| Linen Cloth - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Red 1 Linen Cloth |  |
| Linen Cloth - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Tan 1 Linen Cloth |  |
| Linen Cloth - Yellow | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Dye - Yellow 1 Linen Cloth |  |
| Linen Clothes - Black and Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Clothes - Black, Grey, and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown and Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Clothes - Brown and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown, Grey, and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown, White, and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Collared Brown and Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Collared Orange and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Orange, Grey, and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Grey 1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Orange, White, and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Orange, White, and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Cowl - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 1 Linen Thread |  |
| Linen Cowl - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Blue 1 Linen Thread |  |
| Linen Cowl - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 1 Linen Thread |  |
| Linen Cowl - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Cowl - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Cowl - Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Grey 1 Linen Thread |  |
| Linen Cowl - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Orange 1 Linen Thread |  |
| Linen Cowl - Purple | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Purple 1 Linen Thread |  |
| Linen Cowl - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Cowl - White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Linen Thread 3 Linen Cloth |  |
| Linen Cowl - Yellow | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Yellow 1 Linen Thread |  |
| Linen Cuffed Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 3 Linen Cloth - Tan 2 Linen Thread |  |
| Linen Doublet - Brown and Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Doublet - Brown and Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Doublet - Brown and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan and Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Grey 3 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan, Grey, and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Dunmer Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Netch Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Dunmer Hood - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Indigo 1 Linen Thread |  |
| Linen Dunmer Hood - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 1 Linen Thread |  |
| Linen Dunmer Hood - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Dunmer Tunic - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Netch Leather 3 Linen Cloth - Blue 1 Linen Cloth - Grey 1 Linen Cloth - Indigo 4 Linen Thread |  |
| Linen Dunmer Tunic - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Netch Leather 3 Linen Cloth - Brown 1 Linen Cloth - Green 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Dunmer Tunic - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Netch Leather 3 Linen Cloth - Red 1 Linen Cloth - Brown 1 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Farm Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Footwraps | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Wrap 2 Linen Thread |  |
| Linen Gloves - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 2 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Gloves - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Blue 2 Linen Thread |  |
| Linen Gloves - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Gloves - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Green 2 Linen Thread |  |
| Linen Gloves - Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Grey 2 Linen Thread |  |
| Linen Gloves - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Red 2 Linen Thread |  |
| Linen Headscarf | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Thread 3 Linen Cloth |  |
| Linen Hood - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 1 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Hood - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Mage Robes - Black and Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Robes - Black and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Robes - Brown and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Mage Robes - Brown and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Robes - Green and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Green 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Mage Robes - Tan and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Tunic - Blue and Quilted Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Mage Tunic - Grey and Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Tunic - Grey and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Tunic - White and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White and Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Orange 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White and Quilted Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White, Green, and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth |  |
| Linen Miner's Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Leather 3 Linen Cloth - Green 2 Linen Thread |  |
| Linen Miner's Clothes - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Miner's Clothes - Grey and Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Miner's Clothes - Orange and Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Miner's Clothes - Orange and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Miner's Clothes - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 2 Linen Cloth - Green 3 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Miner's Clothes - White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Miner's Clothes - Yellow and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Monk Boots - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Thread |  |
| Linen Monk Boots - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Moth Priest Blindfold | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Linen Cloth - Grey 1 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Moth Priest Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Grey 4 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Moth Priest Sandals | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 1 Linen Cloth - Brown 1 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Mourner's Clothes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Mourner's Headscarf | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Thread |  |
| Linen Plain Robes - Grey and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Grey and Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Grey and Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Mantled Orange and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Orange and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Prisoner's Rags | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Wrap 2 Linen Thread |  |
| Linen Ragged Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Wrap 2 Linen Thread |  |
| Linen Ragged Cap | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Wrap 1 Linen Thread |  |
| Linen Ragged Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Wrap 4 Linen Thread |  |
| Linen Robes - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Robes - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Robes - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Green 4 Linen Thread |  |
| Linen Robes - Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Robes - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Robes - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Linen Cloth - Red 4 Linen Thread 4 Linen Cloth |  |
| Linen Roughspun Tunic | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Wrap 2 Linen Thread |  |
| Linen Shoes - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Skirt - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Skirt - Green and Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Green 4 Linen Thread |  |
| Linen Skirt - Indigo and Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Indigo 4 Linen Thread |  |
| Linen Skirt - Orange and Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Skirt - Quilted Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth |  |
| Linen Stitched Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Surcoat - Black and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Surcoat - Black and Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Tavern Clothes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Linen Cloth - Brown 3 Linen Cloth - Green 1 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Thread | Player Crafting | 4 | Craftsmanship | Tailors,Survivalists | Spinning Wheel | 3 Northern Flax |  |
| Linen Thread | Spinning Wheel | 4 | Craftsmanship | N/A | Spinning Wheel | 3 Northern Flax |  |
| Linen Traveler Robes - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Traveler Robes - Black and Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Traveler Robes - Black and Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Traveler Robes - Black, Brown, and Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Green 4 Linen Thread |  |
| Linen Traveler Robes - Black, Brown, and Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Traveler Robes - Black, Tan, and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Brown and Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Traveler Robes - Brown and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Traveler Robes - Brown, Tan, and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Purple, Orange, and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Orange 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Purple, Tan, and White | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Linen Cloth - Tan 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth |  |
| Linen Tunic - Belted Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 5 Linen Cloth - Black 4 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Tunic - Belted Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 3 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Belted Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Belted Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Blue and Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 2 Linen Cloth - Blue 2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Tunic - Embroidered Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 1 Linen Cloth - Brown 2 Linen Cloth - Purple 2 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Tunic - Indigo and Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Tunic - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Work Boots - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Linen Cloth - Black 2 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Work Boots - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Thread |  |
| Linwe's Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linwe's Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linwe's Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Linwe's Hood | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Mail and Hide | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Hide | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Jacket | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Jacket | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Leather Surcoat | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Linen Cloth - Black |  |
| Mail and Leather Surcoat | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Linen Cloth - Black |  |
| Mail and Leathers | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Leathers | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Pauldroned Leather | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 2 Hide Lace |  |
| Mail and Pauldroned Leather | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 2 Hide Lace |  |
| Mail and Surcoat | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Surcoat | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Tunic | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Tunic | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Miraak's Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather 2 Silk Thread 2 Silk Cloth - Brown | Killed Miraak |
| Miraak's Gloves | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Silk Thread 2 Silk Cloth - Brown | Killed Miraak |
| Miraak's Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Brown | Killed Miraak |
| Noble Armguards | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 3 Leather |  |
| Notched Pickaxe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Gem: Diamond |  |
| Oiled Mail and Hide | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Flammable Oil |  |
| Oiled Mail and Hide | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Flammable Oil |  |
| Oiled Mail and Jacket | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Jacket | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Tunic | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Tunic | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Pelt: Bear | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Fine) |  |
| Pelt: Bear | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Bear (Fine) |  |
| Pelt: Boar | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Fine) |  |
| Pelt: Boar | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Boar (Fine) |  |
| Pelt: Cave Bear | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Fine) |  |
| Pelt: Cave Bear | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cave Bear (Fine) |  |
| Pelt: Cow | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Fine) |  |
| Pelt: Cow | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Cow (Fine) |  |
| Pelt: Deer | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Fine) |  |
| Pelt: Deer | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Deer (Fine) |  |
| Pelt: Elk | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Fine) |  |
| Pelt: Elk | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Elk (Fine) |  |
| Pelt: Fox | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox (Fine) |  |
| Pelt: Fox | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Fox (Fine) |  |
| Pelt: Frost Troll | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Fine) |  |
| Pelt: Frost Troll | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Frost Troll (Fine) |  |
| Pelt: Goat | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat (Fine) |  |
| Pelt: Goat | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Goat (Fine) |  |
| Pelt: Horse | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Fine) |  |
| Pelt: Horse | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Horse (Fine) |  |
| Pelt: Ice Wolf | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Fine) |  |
| Pelt: Ice Wolf | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Ice Wolf (Fine) |  |
| Pelt: Mammoth Section | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Fine) |  |
| Pelt: Mammoth Section | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Mammoth Section (Fine) |  |
| Pelt: Sabre Cat | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Fine) |  |
| Pelt: Sabre Cat | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Sabre Cat (Fine) |  |
| Pelt: Skeever | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Skeever (Fine) |  |
| Pelt: Skeever | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Skeever (Fine) |  |
| Pelt: Snow Bear | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Fine) |  |
| Pelt: Snow Bear | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Bear (Fine) |  |
| Pelt: Snow Fox | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Fine) |  |
| Pelt: Snow Fox | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snow Fox (Fine) |  |
| Pelt: Snowy Sabre Cat | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Fine) |  |
| Pelt: Snowy Sabre Cat | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Fine) |  |
| Pelt: Troll | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Fine) |  |
| Pelt: Troll | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Troll (Fine) |  |
| Pelt: Vale Deer | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Fine) |  |
| Pelt: Vale Deer | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Deer (Fine) |  |
| Pelt: Vale Sabre Cat | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Fine) |  |
| Pelt: Vale Sabre Cat | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Vale Sabre Cat (Fine) |  |
| Pelt: Werewolf | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Fine) |  |
| Pelt: Werewolf | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Werewolf (Fine) |  |
| Pelt: Wolf | Player Crafting | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf (Fine) |  |
| Pelt: Wolf | Tanning Rack | 2 | Craftsmanship | N/A | Tanning Rack | 1 Pelt: Wolf (Fine) |  |
| Penitus Oculatus Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Penitus Oculatus Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Penitus Oculatus Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Penitus Oculatus Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Poacher's Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Predator's Grace | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Ragnok's Toothpick | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Red Eagle's Bane | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Red Eagle's Fury | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Ring of Bones | Player Crafting | 1 | Craftsmanship | Jewelers | Forge | 1 Bone Meal 1 Ingot: Corundum | Daedra - The Taste of Death |
| Ring of Bones | Forge | 1 | Craftsmanship | Jewelers | Forge | 1 Bone Meal 1 Ingot: Corundum | Daedra - The Taste of Death |
| Robed Mail | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Brown 4 Linen Thread |  |
| Robed Mail | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 3 Linen Cloth - Brown 4 Linen Thread |  |
| Sheogorath's Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Purple | Daedra - The Mind of Madness |
| Sheogorath's Garb | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Silk Thread 1 Silk Cloth 1 Silk Cloth - Orange 3 Silk Cloth - Purple | Daedra - The Mind of Madness |
| Shield of Solitude | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Shrouded Ancient Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Ancient Cowl - Masked | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Ancient Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Ancient Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Red |  |
| Shrouded Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Cowl | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Cowl | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Cowl - Maskless | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl - Maskless | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Cowl - Maskless | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Red |  |
| Shrouded Gloves | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Red |  |
| Shrouded Hand Wraps | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Silk Thread 1 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Robes | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Shoes | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Silk Thread 2 Silk Cloth - Black | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Sleeveless Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Sleeveless Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Sleeveless Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Veil | Player Crafting | 1 | Craftsmanship | Smiths,Tailors | N/A | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Boots | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Worn Cowl | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Worn Cowl | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl - Maskless | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl - Maskless | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Worn Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Worn Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Red |  |
| Shrouded Worn Gloves | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Silk Cloth | Player Crafting | 1 | Craftsmanship | Tailors,Survivalists | Spinning Wheel | 3 Spider Egg |  |
| Silk Cloth | Spinning Wheel | 1 | Craftsmanship | N/A | Spinning Wheel | 3 Spider Egg |  |
| Silk Cloth - Black | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Black |  |
| Silk Cloth - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Blue |  |
| Silk Cloth - Brown | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Brown |  |
| Silk Cloth - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Green |  |
| Silk Cloth - Grey | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Grey |  |
| Silk Cloth - Indigo | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Indigo |  |
| Silk Cloth - Orange | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Orange |  |
| Silk Cloth - Purple | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Purple |  |
| Silk Cloth - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Red |  |
| Silk Cloth - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Tan |  |
| Silk Cloth - Yellow | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Cloth 1 Dye - Yellow |  |
| Silk Cuffed Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Grey |  |
| Silk Embroidered Raiment - Blue | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Blue 2 Silk Cloth - Purple |  |
| Silk Embroidered Raiment - Red | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Red 2 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Green | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Indigo | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Indigo 1 Silk Cloth - Red |  |
| Silk Fur-Embellished Robes - Indigo | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Indigo 3 Silk Cloth - Red |  |
| Silk Fur-Embellished Robes - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan |  |
| Silk Fur-Embellished Robes - Tan | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan |  |
| Silk Fur-Lined Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 1 Fur Plate 2 Silk Thread 3 Silk Cloth - Tan |  |
| Silk Fur-Trimmed Clothes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Pelt: Wolf 2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green |  |
| Silk Fur-Trimmed Clothes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green |  |
| Silk Mage Boots - Ornate | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Grey |  |
| Silk Nocturnal Hood | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Grey | TG - Darkness Returns Complete |
| Silk Nocturnal Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 4 Silk Thread 3 Silk Cloth - Black 1 Silk Cloth - Grey | TG - Darkness Returns Complete |
| Silk Pleated Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Brown |  |
| Silk Psijic Boots | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Leather 2 Silk Thread 1 Silk Cloth - Grey 1 Silk Cloth - Red 2 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Psijic Gloves | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Ingot: Quicksilver 2 Silk Thread 2 Silk Cloth - Brown | College - The Eye of Magnus Complete |
| Silk Psijic Hood | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 3 Silk Thread 1 Silk Cloth - Red 2 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Psijic Robes | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 2 Ingot: Quicksilver 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Grey 1 Silk Cloth - Red 3 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Thread | Player Crafting | 4 | Craftsmanship | Tailors,Survivalists | Spinning Wheel | 3 Spider Egg |  |
| Silk Thread | Spinning Wheel | 4 | Craftsmanship | N/A | Spinning Wheel | 3 Spider Egg |  |
| Silk Wedding Finery | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Pelt: Snow Bear 1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red |  |
| Silk Wedding Finery | Player Crafting | 1 | Craftsmanship | Tailors | N/A | 1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red |  |
| Silver Amber Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Amber 1 Silver Circlet |  |
| Silver Amber Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Amber |  |
| Silver Amber Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Amber |  |
| Silver Amethyst Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Amethyst 1 Silver Circlet |  |
| Silver Amethyst Circlet (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Silver Circlet |  |
| Silver Amethyst Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Amethyst 1 Silver Necklace |  |
| Silver Amethyst Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Amethyst (Flawless) 1 Silver Necklace |  |
| Silver Amethyst Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Amethyst |  |
| Silver Amethyst Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Amethyst (Flawless) |  |
| Silver Aquamarine Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Aquamarine 1 Silver Circlet |  |
| Silver Aquamarine Circlet (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Silver Circlet |  |
| Silver Aquamarine Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Aquamarine |  |
| Silver Aquamarine Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Aquamarine (Flawless) |  |
| Silver Aquamarine Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Aquamarine |  |
| Silver Aquamarine Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Aquamarine (Flawless) |  |
| Silver Battlestaff | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Silver Battlestaff | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Silver 2 Ingot: Steel 1 Gem: Amethyst |  |
| Silver Battlestaff | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Silver 2 Ingot: Steel 1 Gem: Amethyst |  |
| Silver Circlet | Player Crafting | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Circlet | Forge | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Diamond Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Diamond 1 Silver Circlet |  |
| Silver Diamond Circlet (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Silver Circlet |  |
| Silver Diamond Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Diamond 1 Silver Necklace |  |
| Silver Diamond Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Diamond (Flawless) 1 Silver Necklace |  |
| Silver Diamond Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Diamond |  |
| Silver Diamond Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Diamond (Flawless) |  |
| Silver Emerald Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Emerald 1 Silver Circlet |  |
| Silver Emerald Circlet (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Silver Circlet |  |
| Silver Emerald Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Emerald 1 Silver Necklace |  |
| Silver Emerald Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Emerald (Flawless) 1 Silver Necklace |  |
| Silver Emerald Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Emerald |  |
| Silver Emerald Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Emerald (Flawless) |  |
| Silver Garnet Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Garnet 1 Silver Circlet |  |
| Silver Garnet Circlet (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Silver Circlet |  |
| Silver Garnet Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Garnet 1 Silver Necklace |  |
| Silver Garnet Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Garnet (Flawless) 1 Silver Necklace |  |
| Silver Garnet Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Garnet |  |
| Silver Garnet Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Garnet (Flawless) |  |
| Silver Greatsword | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips |  |
| Silver Greatsword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Silver Greatsword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips |  |
| Silver Necklace | Player Crafting | 1 | Craftsmanship | Jewelers,Smiths | Forge | 4 Fragment: Silver |  |
| Silver Necklace | Forge | 1 | Craftsmanship | Jewelers,Smiths | Forge | 4 Fragment: Silver |  |
| Silver Necklace (5) | Forge | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Necklace (5) | Player Crafting | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Onyx Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Onyx 1 Silver Circlet |  |
| Silver Onyx Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Onyx |  |
| Silver Onyx Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Onyx |  |
| Silver Opal Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Opal 1 Silver Circlet |  |
| Silver Opal Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Opal |  |
| Silver Opal Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Opal |  |
| Silver Peridot Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Peridot 1 Silver Circlet |  |
| Silver Peridot Circlet (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Silver Circlet |  |
| Silver Peridot Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Peridot |  |
| Silver Peridot Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Peridot (Flawless) |  |
| Silver Peridot Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Peridot |  |
| Silver Peridot Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Peridot (Flawless) |  |
| Silver Ring | Player Crafting | 1 | Craftsmanship | Jewelers,Smiths | Forge | 2 Fragment: Silver |  |
| Silver Ring | Forge | 1 | Craftsmanship | Jewelers,Smiths | Forge | 2 Fragment: Silver |  |
| Silver Ring (10) | Forge | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Ring (10) | Player Crafting | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Ruby Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Ruby 1 Silver Circlet |  |
| Silver Ruby Circlet, Flawless | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Silver Circlet |  |
| Silver Ruby Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Ruby 1 Silver Necklace |  |
| Silver Ruby Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Ruby (Flawless) 1 Silver Necklace |  |
| Silver Ruby Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Ruby |  |
| Silver Ruby Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Ruby (Flawless) |  |
| Silver Sapphire Circlet | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Sapphire 1 Silver Circlet |  |
| Silver Sapphire Circlet (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Silver Circlet |  |
| Silver Sapphire Necklace | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Sapphire 1 Silver Necklace |  |
| Silver Sapphire Necklace (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Sapphire (Flawless) 1 Silver Necklace |  |
| Silver Sapphire Ring | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Sapphire |  |
| Silver Sapphire Ring (Flawless) | Player Crafting | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Sapphire (Flawless) |  |
| Silver Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Silver Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Steel 1 Leather Strips |  |
| Silver Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Steel 1 Leather Strips |  |
| Skyforge Steel Dagger | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Soap - Blue Mountain | Cook pot | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Blue Mountain Flower 1 Animal Fat |  |
| Soap - Blue Mountain | Player Crafting | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Blue Mountain Flower 1 Animal Fat |  |
| Soap - Dragon's Tongue | Cook pot | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Dragon's Tongue 1 Animal Fat |  |
| Soap - Dragon's Tongue | Player Crafting | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Dragon's Tongue 1 Animal Fat |  |
| Soap - Lavender | Cook pot | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Lavender 1 Animal Fat |  |
| Soap - Lavender | Player Crafting | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Lavender 1 Animal Fat |  |
| Soap - Plain | Cook pot | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 1 Animal Fat |  |
| Soap - Plain | Player Crafting | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 1 Animal Fat |  |
| Soap - Purple Mountain Flower | Cook pot | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Purple Mountain Flower 1 Animal Fat |  |
| Soap - Purple Mountain Flower | Player Crafting | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Purple Mountain Flower 1 Animal Fat |  |
| Soap - Red Mountain Flower | Player Crafting | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Red Mountain Flower 1 Animal Fat |  |
| Soap - Red Mountain Flower | Cook pot | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Red Mountain Flower 1 Animal Fat |  |
| Soap - Superior Mountain Flower | Cook pot | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 2 Blue Mountain Flower 2 Red Mountain Flower 2 Purple Mountain Flower 1 Animal Fat |  |
| Soap - Superior Mountain Flower | Player Crafting | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 2 Blue Mountain Flower 2 Red Mountain Flower 2 Purple Mountain Flower 1 Animal Fat |  |
| Spell Research Journal | Player Crafting | 1 | Craftsmanship | Alchemists,Survivalists | N/A | 5 Paper Roll 1 Leather 1 Linen Thread |  |
| Spinning Wheel | Player Crafting | 1 | Craftsmanship | Builders,Survivalists | N/A | 8 Wood 5 Iron Nails |  |
| Steel Battleaxe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Battleaxe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Battleaxe | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Battlestaff | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Battlestaff | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 4 Wood 2 Leather Strips |  |
| Steel Battlestaff | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 4 Wood 2 Leather Strips |  |
| Steel Bearskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Black |  |
| Steel Bearskin Hood - Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Brown |  |
| Steel Bearskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Ornate Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Ornate Black |  |
| Steel Bearskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Ornate Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Ornate Brown |  |
| Steel Bearskin Hood - Ornate White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Ornate White |  |
| Steel Bearskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Trimmed Black |  |
| Steel Bearskin Hood - Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Steel Bearskin Hood - Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - Trimmed White |  |
| Steel Bearskin Hood - White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Bearskin Hood - White |  |
| Steel Bearskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Boots - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Braced Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Hide Lace 2 Fur Plate |  |
| Steel Braced Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Hide Lace 2 Fur Plate |  |
| Steel Bracers | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Bracers | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Cuirass - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Dagger | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Dagger | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Steel Dagger | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Steel Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Gauntlets - White | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Greatsword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips |  |
| Steel Greatsword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Greatsword | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips |  |
| Steel Greaves | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Greaves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Greaves | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Heavy Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Steel Heavy Crossbow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 3 Wood 2 Hide Lace |  |
| Steel Heavy Crossbow | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 3 Wood 2 Hide Lace |  |
| Steel Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Helmet - White | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Helmet - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Horned Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Steel Horned Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Horned Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Steel Horned Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Horned Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Hunting Knife | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Steel 1 Leather Strips 1 Fragment: Bone |  |
| Steel Hunting Knife | Forge | 1 | Craftsmanship | Smiths,Survivalists | Forge | 1 Ingot: Steel 1 Leather Strips 1 Fragment: Bone |  |
| Steel Mace | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Mace | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Mace | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Pauldroned Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 5 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Pauldroned Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Wolf 5 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Pauldroned Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Pauldroned Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Pauldroned Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Pauldroned Cuirass - Katria's | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Pauldroned Cuirass - White | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Pauldroned Cuirass - White | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Scimitar | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Steel Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips |  |
| Steel Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips |  |
| Steel Sword | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Leather Strips |  |
| Steel Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Sword | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Leather Strips |  |
| Steel War Axe | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel War Axe | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel War Axe | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Warhammer | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Warhammer | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Warhammer | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Wolfskin Hood - Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Black |  |
| Steel Wolfskin Hood - Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Brown |  |
| Steel Wolfskin Hood - Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Dark Trimmed Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Steel Wolfskin Hood - Dark Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Dark Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Dark Trimmed Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Steel Wolfskin Hood - Dark Trimmed White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Steel Wolfskin Hood - Dark Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Light Trimmed Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Steel Wolfskin Hood - Light Trimmed Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Light Trimmed Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Light Trimmed Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Steel Wolfskin Hood - Light Trimmed White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Steel Wolfskin Hood - Light Trimmed White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Noble Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Noble Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Noble Black |  |
| Steel Wolfskin Hood - Noble Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Noble Brown |  |
| Steel Wolfskin Hood - Noble Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Noble White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Noble White |  |
| Steel Wolfskin Hood - Noble White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Ornate Black | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Ornate Black |  |
| Steel Wolfskin Hood - Ornate Black | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Ornate Brown | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Steel Wolfskin Hood - Ornate Brown | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Ornate White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - Ornate White |  |
| Steel Wolfskin Hood - Ornate White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - White | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 1 Steel Helmet 1 Wolfskin Hood - White |  |
| Steel Wolfskin Hood - White | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Stone Hatchet | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | N/A | 2 Deadwood 1 Sharp Rock |  |
| Stone Hatchet | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | N/A | 1 Wood 1 Sharp Rock |  |
| Stormcloak General Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Stormcloak General Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Stormcloak Heavy Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Stormcloak Heavy Crossbow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Stormcloak Heavy Crossbow | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Stormcloak Heavy Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Heavy Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Heavy Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Stormcloak Light Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Light Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Stormcloak Light Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Officer Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Stormcloak Officer Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Bracers | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Stormcloak Officer Bracers | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Bracers | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 4 Leather Strips 4 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Stormcloak Officer Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 4 Leather Strips 4 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Stormcloak Officer Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Sleeved Heavy Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 5 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Sleeved Heavy Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 5 Leather Strips 5 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Sleeved Heavy Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Stormfang | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Studded Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Elk 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather 2 Fur Plate |  |
| Studded Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Iron |  |
| Studded Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Elk 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather 2 Fur Plate |  |
| Studded Furred Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 4 Leather 4 Hide Lace 2 Fur Plate |  |
| Studded Furred Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 4 Leather 4 Hide Lace 2 Fur Plate |  |
| Summerset Shadows Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Summerset Shadows Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Summerset Shadows Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Summerset Shadows Hood | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Tanning Rack | Player Crafting | 1 | Craftsmanship | Tailors,Survivalists,Builders,Smiths | N/A | 3 Wood 2 Hide Lace |  |
| Tanning Rack | Player Crafting | 1 | Craftsmanship | Tailors,Survivalists,Builders,Smiths | N/A | 3 Wood 1 Leather Strips |  |
| Targe of the Blooded | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| The Pale Blade | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| The Woodsman's Friend | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Thieves Guild Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Boots - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Cowl | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Cowl | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cowl - Grey | Player Crafting | 1 | Craftsmanship | Smiths | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cowl - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Cuirass - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Gloves - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Hood | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Hood | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Hood - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Master's Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Gloves | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Hood | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Sleeveless Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Thieves Guild Sleeveless Cuirass - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Toolkit: Alchemist's | Player Crafting | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Toolkit: Alchemist's | Forge | 1 | Craftsmanship | N/A | Forge | 2 Wood |  |
| Toolkit: Brewer's | Player Crafting | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Toolkit: Brewer's | Forge | 1 | Craftsmanship | N/A | Forge | 2 Wood |  |
| Toolkit: Builder's | Forge | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Builder's | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Chef's | Forge | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Chef's | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Jeweler's | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Jeweler's | Forge | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Smith's | Forge | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Smith's | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Survivalist's | Player Crafting | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Toolkit: Survivalist's | Forge | 1 | Craftsmanship | N/A | Forge | 2 Wood |  |
| Toolkit: Tailor's | Forge | 1 | Craftsmanship | N/A | Forge | 2 Wood |  |
| Toolkit: Tailor's | Player Crafting | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Toolkit: Thieves' | Forge | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Thieves' | Player Crafting | 1 | Craftsmanship | N/A | Forge | 1 Ingot: Steel 2 Wood |  |
| Trollsbane | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Valdr's Lucky Dagger | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Vampire Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Vampire Cuirass - Dark | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Vampire Cuirass - Grey | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather |  |
| Vampire Cuirass - Red | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Red |  |
| Vampire Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Vampire Hood | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Vampire Royal Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Vampire Royal Cuirass - Red | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Leather: Dark |  |
| Waterskin (Empty) | Player Crafting | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Strips 1 Leather |  |
| Windshear | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Wolf Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Boots | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Wolf Boots | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Boots | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather 6 Fur Plate | Companions - Proving Honor Complete |
| Wolf Cuirass | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Wolf Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather 6 Fur Plate | Companions - Proving Honor Complete |
| Wolf Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Gauntlets | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Wolf Gauntlets | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Gauntlets | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Helmet | Forge | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Helmet | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Helmet | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Wolf Shield | Armor Table | 1 | Craftsmanship | N/A | N/A | 1 Ingot: Steel |  |
| Wolf Shield | Forge | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 2 Leather Strips | Companions - Proving Honor Complete |
| Wolf Shield | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 5 Ingot: Steel 2 Leather Strips | Companions - Proving Honor Complete |
| Wolfskin Cloak - Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal |  |
| Wolfskin Cloak - Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips |  |
| Wolfskin Cloak - Dark Trimmed Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 4 Pelt: Ice Wolf 3 Leather Strips |  |
| Wolfskin Hood - Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal |  |
| Wolfskin Hood - Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips |  |
| Wolfskin Hood - Dark Trimmed Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Black | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Brown | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - White | Player Crafting | 1 | Craftsmanship | Survivalists,Tailors | N/A | 1 Pelt: Ice Wolf 1 Leather Strips |  |
| Wooden Barrel | Player Crafting | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Wooden Battlestaff | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Wood |  |
| Wooden Battlestaff | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | N/A | 5 Wood |  |
| Wooden Chest | Player Crafting | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Wooden Common Bed | Player Crafting | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood 2 Fur Plate |  |
| Wooden Common Chair | Player Crafting | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Wooden Common Table | Player Crafting | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Wooden Fishing Rod | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Iron 1 Wood | Fishing - Unlocked Dwarven Rod |
| Wooden Fishing Rod | Forge | 1 | Craftsmanship | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Iron 1 Wood | Fishing - Unlocked Dwarven Rod |
| Wooden Flute | Player Crafting | 1 | Craftsmanship | Builders | N/A | 1 Salt 1 Wood 1 Bottled Milk |  |
| Wooden Heavy Bow | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | N/A | 4 Hide Lace 2 Deadwood |  |
| Wooden Heavy Bow | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | N/A | 3 Wood 2 Hide Lace |  |
| Wooden Heavy Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Wood 2 Hide Lace |  |
| Wooden Light Bow | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | N/A | 2 Wood 2 Hide Lace |  |
| Wooden Light Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Wood 2 Hide Lace |  |
| Wooden Light Bow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Hide Lace |  |
| Wooden Light Crossbow | Forge | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Wood 2 Hide Lace |  |
| Wooden Light Crossbow | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Wood 1 Hide Lace |  |
| Wooden Light Crossbow | Player Crafting | 1 | Craftsmanship | Smiths | Forge | 1 Ingot: Iron 4 Wood 2 Hide Lace |  |
| Wooden Sword | Player Crafting | 1 | Craftsmanship | Smiths,Survivalists | N/A | 2 Wood |  |
| Wooden Sword | Sharpening Wheel | 1 | Craftsmanship | N/A | Sharpening Wheel | 1 Wood |  |
| Wooden Walking Stick | Armor Table | 1 | Craftsmanship | N/A | N/A | 2 Leather Strips |  |
| Thieves Guild Boots | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Boots - Grey | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cuirass | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cuirass - Grey | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Gloves | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Gloves - Grey | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Hood | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Hood - Grey | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Cuirass | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Cuirass - Grey | Player Crafting | 1 | Craftsmanship,Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Blood-Conserving Phial | Forge | 2 | Craftsmanship,Alchemical Lore 1 | Alchemists | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Strong Acid | Player Must be a vampire |
| Blood-Conserving Phial | Forge | 2 | Craftsmanship,Alchemical Lore 1 | Alchemists | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Mild Acid | Player Must be a vampire |
| Blood-Conserving Phial | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Alchemists | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Mild Acid | Player Must be a vampire |
| Blood-Conserving Phial | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Alchemists | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Strong Acid | Player Must be a vampire |
| Dye - Black | Cook pot | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Nightshade |  |
| Dye - Black | Player Crafting | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Nightshade |  |
| Dye - Bleach | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Salt |  |
| Dye - Bleach | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Salt |  |
| Dye - Blue | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Indigo 1 Dye - Bleach |  |
| Dye - Blue | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Blue Mountain Flower |  |
| Dye - Blue | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Blue Mountain Flower |  |
| Dye - Blue | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Indigo 1 Dye - Bleach |  |
| Dye - Brown | Cook pot | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Canis Root |  |
| Dye - Brown | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Black 1 Dye - Tan |  |
| Dye - Brown | Player Crafting | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Canis Root |  |
| Dye - Brown | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Black 1 Dye - Tan |  |
| Dye - Green | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Hanging Moss |  |
| Dye - Green | Cook pot | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Hanging Moss |  |
| Dye - Green | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Blue 1 Dye - Yellow |  |
| Dye - Green | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Blue 1 Dye - Yellow |  |
| Dye - Grey | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Black 1 Dye - Bleach |  |
| Dye - Grey | Player Crafting | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Giant Lichen |  |
| Dye - Grey | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Black 1 Dye - Bleach |  |
| Dye - Grey | Cook pot | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Giant Lichen |  |
| Dye - Indigo | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Black 1 Dye - Blue |  |
| Dye - Indigo | Cook pot | 4 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Deathbell |  |
| Dye - Indigo | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Black 1 Dye - Blue |  |
| Dye - Indigo | Player Crafting | 4 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Deathbell |  |
| Dye - Orange | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Red 1 Dye - Yellow |  |
| Dye - Orange | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Creep Cluster |  |
| Dye - Orange | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Red 1 Dye - Yellow |  |
| Dye - Orange | Cook pot | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Creep Cluster |  |
| Dye - Purple | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Purple Mountain Flower |  |
| Dye - Purple | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Blue 1 Dye - Red |  |
| Dye - Purple | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Purple Mountain Flower |  |
| Dye - Purple | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Blue 1 Dye - Red |  |
| Dye - Red | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Red Mountain Flower |  |
| Dye - Red | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Red Mountain Flower |  |
| Dye - Tan | Cook pot | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Grass Pod |  |
| Dye - Tan | Player Crafting | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dye - Brown 1 Dye - Bleach |  |
| Dye - Tan | Cook pot | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dye - Brown 1 Dye - Bleach |  |
| Dye - Tan | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Grass Pod |  |
| Dye - Yellow | Player Crafting | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Spinning Wheel | 1 Dragon's Tongue |  |
| Dye - Yellow | Cook pot | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot | 1 Dragon's Tongue |  |
| Healing Poultice | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 5 Medicinal Salve 1 Bandage |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Blisterwort |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Imp Stool |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Blue Mountain Flower |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Panacea |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Blue Dartwing |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Cured Skeever Hide |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Wheat |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Charred Skeever Hide |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Sabre Cat Eye |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Monarch Wing |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Rock Warbler Egg |  |
| Medicinal Salve | Player Crafting | 30 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Daedra Heart |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Northern Flax |  |
| Medicinal Salve | Player Crafting | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Swamp Fungal Pod |  |
| Arrow: Iron Fire | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Fire Salts |  |
| Arrow: Iron Fire | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Fire Salts |  |
| Bolt: Dawnguard Fire | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Fire | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Frost | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Frost | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Shock | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Shock | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Dawnguard |  |
| Bolt: Imperial Fire | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Fire | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Frost | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Frost | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Shock | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Shock | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Imperial |  |
| Bolt: Iron Fire | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Iron |  |
| Bolt: Iron Fire | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Iron |  |
| Bolt: Iron Ice | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Iron |  |
| Bolt: Iron Ice | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Iron |  |
| Bolt: Iron Shock | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Iron |  |
| Bolt: Iron Shock | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Iron |  |
| Bolt: Stormcloak Fire | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Fire | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Frost | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Frost | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Shock | Player Crafting | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Shock | Forge | 15 | Craftsmanship,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Stormcloak |  |
| Chitin Heavy Boots | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Heavy Cuirass | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Heavy Gauntlets | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Heavy Helmet | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Light Boots | Forge | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Netch Leather 2 Chitin Plate |  |
| Chitin Light Boots | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Light Boots | Player Crafting | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Netch Leather 2 Chitin Plate |  |
| Chitin Light Bracers | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Light Bracers | Forge | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 1 Netch Leather 2 Chitin Plate |  |
| Chitin Light Bracers | Player Crafting | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 1 Netch Leather 2 Chitin Plate |  |
| Chitin Light Cuirass | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Light Cuirass | Forge | 1 | Morrowind Smithing 2 | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 3 Netch Leather 4 Chitin Plate |  |
| Chitin Light Cuirass | Player Crafting | 1 | Morrowind Smithing 2 | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 3 Netch Leather 4 Chitin Plate |  |
| Chitin Light Helmet | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Light Helmet | Forge | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Light Helmet | Player Crafting | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Light Shield | Player Crafting | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 1 Netch Leather 4 Chitin Plate |  |
| Chitin Light Shield | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Light Shield | Forge | 1 | Morrowind Smithing 2 | Smiths | Forge | 1 Ingot: Steel 1 Netch Leather 4 Chitin Plate |  |
| Chitin Morag Tong Boots | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Morag Tong Bracers | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Morag Tong Cuirass | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Morag Tong Elite Boots | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Leather |  |
| Chitin Morag Tong Elite Bracers | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Leather |  |
| Chitin Morag Tong Elite Cuirass | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Leather |  |
| Chitin Morag Tong Elite Hood | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Leather |  |
| Chitin Morag Tong Hood | Armor Table | 1 | Morrowind Smithing 2 | N/A | N/A | 1 Chitin Plate |  |
| Chitin Heavy Boots | Forge | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Boots | Player Crafting | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Cuirass | Player Crafting | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Corundum 4 Leather Strips 2 Netch Leather 6 Chitin Plate |  |
| Chitin Heavy Cuirass | Forge | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Corundum 4 Leather Strips 2 Netch Leather 6 Chitin Plate |  |
| Chitin Heavy Gauntlets | Player Crafting | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Heavy Gauntlets | Forge | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Heavy Helmet | Player Crafting | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Helmet | Forge | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Ahzidal's Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Ahzidal's Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Ahzidal's Gauntlets | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Ahzidal's Helmet | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Akaviri Katana | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Akaviri Katana | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Alik'ri Fishing Rod | Forge | 1 | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Quicksilver 1 Wood | Fishing - Unlocked Alikri Rod |
| Alik'ri Fishing Rod | Player Crafting | 1 | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Quicksilver 1 Wood | Fishing - Unlocked Alikri Rod |
| Amethyst | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amethyst (Rough) |  |
| Amulet of Akatosh Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Akatosh Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Arkay Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Gem: Ruby (Rough) |  |
| Amulet of Arkay Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Gem: Ruby (Rough) |  |
| Amulet of Dibella Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Pearl |  |
| Amulet of Dibella Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Pearl |  |
| Amulet of Julianos Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Ingot: Quicksilver |  |
| Amulet of Julianos Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Ingot: Quicksilver |  |
| Amulet of Mara Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Calcinium |  |
| Amulet of Mara Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Calcinium |  |
| Amulet of Stendarr Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Stendarr Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Talos Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Leather Strips 1 Ingot: Galatite |  |
| Amulet of Talos Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Leather Strips 1 Ingot: Galatite |  |
| Amulet of the Elder Council Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Ingot: Quicksilver 1 Gem: Onyx |  |
| Amulet of the Elder Council Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Ingot: Quicksilver 1 Gem: Onyx |  |
| Amulet of the Kynareth Replica | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Small Pearl |  |
| Amulet of the Kynareth Replica | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Small Pearl |  |
| Ancient Nordic Hero Battleaxe | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Battleaxe | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Ancient Nordic Honed Battleaxe 3 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Battleaxe | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Ancient Nordic Honed Battleaxe 3 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ancient Nordic Boots 3 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Boots 3 Ingot: Steel 2 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Boots 3 Ingot: Steel 2 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ancient Nordic Boots 3 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Cuirass 1 Pelt: Cave Bear 4 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Cuirass 4 Ingot: Steel 3 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Cuirass 1 Pelt: Cave Bear 4 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Cuirass 4 Ingot: Steel 3 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Dagger | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Dagger | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Ancient Nordic Honed Dagger | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Dagger | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Ancient Nordic Honed Dagger | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Gauntlets 2 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Gauntlets 2 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Gauntlets | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Greatsword | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Greatsword 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Greatsword | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Greatsword | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Greatsword 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Bow | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum 2 Hide Lace |  |
| Ancient Nordic Hero Heavy Bow | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 1 Ancient Nordic Honed Heavy Bow 2 Hide Lace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Bow | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 1 Ancient Nordic Honed Heavy Bow 2 Hide Lace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Crossbow | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Heavy Crossbow | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Leather 4 Hide Lace |  |
| Ancient Nordic Hero Heavy Crossbow | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Leather 4 Hide Lace |  |
| Ancient Nordic Hero Helm | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Helm | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Helm | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Mace | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Mace | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Ancient Nordic Honed Mace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Mace | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Ancient Nordic Honed Mace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Sword | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Sword | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Sword 1 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Sword | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Sword 1 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero War Axe | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero War Axe | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed War Axe 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero War Axe | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed War Axe 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Warhammer | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 3 Leather Strips 1 Ancient Nordic Honed Warhammer | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Warhammer | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 3 Leather Strips 1 Ancient Nordic Honed Warhammer | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Warhammer | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Pickaxe | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Aquamarine | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Aquamarine (Rough) |  |
| Argonian Fishing Rod | Forge | 1 | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Orichalcum 1 Wood | Fishing - Unlocked Argonian Rod |
| Argonian Fishing Rod | Player Crafting | 1 | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Orichalcum 1 Wood | Fishing - Unlocked Argonian Rod |
| Arrow: Ancient Nordic Hero | Player Crafting | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Wood | Currently Uncraftable - Global Disabled |
| Arrow: Ancient Nordic Hero | Forge | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Wood | Currently Uncraftable - Global Disabled |
| Arrow: Skyforge Steel | Player Crafting | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Arrow: Skyforge Steel | Forge | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Auriel's Bow Replica | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Auriel's Bow Replica | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Blade of Sacrifice Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Blade of Woe Awakened | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Blade of Woe Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Blades Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather | Main Quest - Alduins Wall Complete |
| Blades Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather | Main Quest - Alduins Wall Complete |
| Blades Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Helmet | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Helmet | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Shield | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Blades Shield | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Bloodskal Blade Replica | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Silver 2 Leather Strips 3 Ingot: Galatite | Dragonborn - The Final Decent Complete |
| Bloodskal Blade Replica | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Silver 2 Leather Strips 3 Ingot: Galatite | Dragonborn - The Final Decent Complete |
| Bolt: Ancient Nordic Hero | Player Crafting | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 1 Wood |  |
| Bolt: Ancient Nordic Hero | Forge | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 1 Wood |  |
| Bolt: Thieves Guild | Forge | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Thieves Guild | Player Crafting | 15 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Wood |  |
| Bone Hawk Amulet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 2 Leather Strips 1 Bone Hawk Skull 6 Bone Hawk Feathers |  |
| Bone Hawk Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 3 Bone Hawk Claw 3 Fragment: Silver |  |
| Bone Hawk Ring | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 3 Bone Hawk Claw 3 Fragment: Silver |  |
| Bone Hawk Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 3 Silver Ring 3 Bone Hawk Claw |  |
| Bone Hawk Ring | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 3 Silver Ring 3 Bone Hawk Claw |  |
| Bone Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Animal Bone (Large) |  |
| Champion's Cudgel | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Chillrend Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Frost Salts |  |
| Circle Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 1 Leather 3 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 1 Leather 3 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Circle Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Leather Strips 2 Leather 5 Ingot: Galatite 6 Fur Plate | Companions - Silver Hand Complete |
| Circle Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Pelt: Snow Bear 4 Leather Strips 2 Leather 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Pelt: Snow Bear 4 Leather Strips 2 Leather 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Circle Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Leather Strips 2 Leather 5 Ingot: Galatite 6 Fur Plate | Companions - Silver Hand Complete |
| Circle Gauntlets | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Circle Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 2 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 1 Leather 2 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 2 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 1 Leather 2 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Helmet | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Helmet | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Circle Helmet | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Shield | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Shield | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Circle Shield | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Copper Amber Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amber 1 Copper Circlet |  |
| Copper Amethyst Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst 1 Copper Circlet |  |
| Copper Amethyst Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Copper Circlet |  |
| Copper Aquamarine Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine 1 Copper Circlet |  |
| Copper Aquamarine Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Copper Circlet |  |
| Copper Circlet | Forge | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Corundum |  |
| Copper Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Corundum |  |
| Copper Diamond Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond 1 Copper Circlet |  |
| Copper Diamond Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Copper Circlet |  |
| Copper Emerald Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald 1 Copper Circlet |  |
| Copper Emerald Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Copper Circlet |  |
| Copper Garnet Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet 1 Copper Circlet |  |
| Copper Garnet Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Copper Circlet |  |
| Copper Onyx Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Onyx 1 Copper Circlet |  |
| Copper Opal Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Opal 1 Copper Circlet |  |
| Copper Peridot Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot 1 Copper Circlet |  |
| Copper Peridot Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Copper Circlet |  |
| Copper Ruby Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby 1 Copper Circlet |  |
| Copper Ruby Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Copper Circlet |  |
| Copper Sapphire Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire 1 Copper Circlet |  |
| Copper Sapphire Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Copper Circlet |  |
| Daedric Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Dawnbreaker Replica | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 3 Ingot: Calcinium | Daedra -  The Break of Dawn |
| Dawnbreaker Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Dawnbreaker Replica | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 3 Ingot: Calcinium | Daedra -  The Break of Dawn |
| Diamond | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Diamond (Rough) |  |
| Dragonbone Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dwarven Fishing Rod | Forge | 1 | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Steel 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Rod |
| Dwarven Fishing Rod | Player Crafting | 1 | Advanced Blacksmithing | Smiths,Survivalists,Alchemists | Forge | 1 Ingot: Steel 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Rod |
| Dwarven Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Ebony Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mail Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Eduj | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Elven Light Boots - Thalmor | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Emerald | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Emerald (Rough) |  |
| Falmer Heavy Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Heavy Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Heavy Gauntlets | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Heavy Helmet | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Chaurus Chitin |  |
| Falmer Honed Light Bow | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Chaurus Chitin |  |
| Forsworn War Axe | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Quarried Stone |  |
| Fragment: Gold | Breakdown | 20 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Gold |  |
| Fragment: Quicksilver | Breakdown | 20 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Quicksilver |  |
| Fragment: Silver | Breakdown | 20 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Silver |  |
| Garnet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Garnet (Rough) |  |
| Gem: Amber | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amber (Rough) |  |
| Gem: Onyx | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Onyx (Rough) |  |
| Gem: Opal | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Opal (Rough) |  |
| Glass Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Gold Amber Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amber 1 Gold Circlet |  |
| Gold Amber Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Amber |  |
| Gold Amber Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Amber |  |
| Gold Amethyst Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst 1 Gold Circlet |  |
| Gold Amethyst Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Gold Circlet |  |
| Gold Amethyst Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amethyst 1 Gold Necklace |  |
| Gold Amethyst Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amethyst (Flawless) 1 Gold Necklace |  |
| Gold Amethyst Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Amethyst |  |
| Gold Amethyst Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Amethyst (Flawless) |  |
| Gold Aquamarine Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine 1 Gold Circlet |  |
| Gold Aquamarine Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Gold Circlet |  |
| Gold Aquamarine Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Aquamarine |  |
| Gold Aquamarine Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Aquamarine (Flawless) |  |
| Gold Aquamarine Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Aquamarine |  |
| Gold Aquamarine Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Aquamarine (Flawless) |  |
| Gold Circlet | Forge | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Diamond Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond 1 Gold Circlet |  |
| Gold Diamond Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Gold Circlet |  |
| Gold Diamond Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Diamond 1 Gold Necklace |  |
| Gold Diamond Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Diamond (Flawless) 1 Gold Necklace |  |
| Gold Diamond Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Diamond |  |
| Gold Diamond Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Diamond (Flawless) |  |
| Gold Emerald Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald 1 Gold Circlet |  |
| Gold Emerald Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Gold Circlet |  |
| Gold Emerald Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Emerald 1 Gold Necklace |  |
| Gold Emerald Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Emerald (Flawless) 1 Gold Necklace |  |
| Gold Emerald Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Emerald |  |
| Gold Emerald Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Emerald (Flawless) |  |
| Gold Garnet Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet 1 Gold Circlet |  |
| Gold Garnet Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Gold Circlet |  |
| Gold Garnet Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Garnet 1 Gold Necklace |  |
| Gold Garnet Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Garnet (Flawless) 1 Gold Necklace |  |
| Gold Garnet Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Garnet |  |
| Gold Garnet Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Garnet (Flawless) |  |
| Gold Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 4 Fragment: Gold |  |
| Gold Necklace | Forge | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 4 Fragment: Gold |  |
| Gold Necklace (5) | Forge | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Necklace (5) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Onyx Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Onyx 1 Gold Circlet |  |
| Gold Onyx Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Onyx |  |
| Gold Onyx Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Onyx |  |
| Gold Opal Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Opal 1 Gold Circlet |  |
| Gold Opal Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Opal |  |
| Gold Opal Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Opal |  |
| Gold Peridot Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot 1 Gold Circlet |  |
| Gold Peridot Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Gold Circlet |  |
| Gold Peridot Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Peridot |  |
| Gold Peridot Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Peridot (Flawless) |  |
| Gold Peridot Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Peridot |  |
| Gold Peridot Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Peridot (Flawless) |  |
| Gold Ring | Forge | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 2 Fragment: Gold |  |
| Gold Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 2 Fragment: Gold |  |
| Gold Ring (10) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Ring (10) | Forge | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Ruby Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby 1 Gold Circlet |  |
| Gold Ruby Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Gold Circlet |  |
| Gold Ruby Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Ruby 1 Gold Necklace |  |
| Gold Ruby Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Ruby (Flawless) 1 Gold Necklace |  |
| Gold Ruby Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Ruby |  |
| Gold Ruby Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Ruby (Flawless) |  |
| Gold Sapphire Circlet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire 1 Gold Circlet |  |
| Gold Sapphire Circlet (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Gold Circlet |  |
| Gold Sapphire Necklace | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Sapphire 1 Gold Necklace |  |
| Gold Sapphire Necklace (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Sapphire (Flawless) 1 Gold Necklace |  |
| Gold Sapphire Ring | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Sapphire |  |
| Gold Sapphire Ring (Flawless) | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Sapphire (Flawless) |  |
| Helm of Yngol Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Honorblade of Whiterun | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Horse Armor: Black Hand Barding and Saddle | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Black Hand Barding and Saddle | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Black Hand Barding and Saddle | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic War Axe 1 Wooden Lute 1 Horse Armor: Black Hand Barding and Saddle |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ancient Nordic War Axe 1 Wooden Lute 1 Horse Armor: Black Hand Barding and Saddle |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Horse Armor: Nordic Barding and Saddle | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 8 Ingot: Steel 2 Ingot: Corundum 10 Leather Strips 6 Leather |  |
| Horse Armor: Nordic Barding and Saddle | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 8 Ingot: Steel 2 Ingot: Corundum 10 Leather Strips 6 Leather |  |
| Imperial General Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Ingot: Gold | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 200 Fragment: Gold |  |
| Ingot: Gold | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 15 Ore: Gold |  |
| Ingot: Gold | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 100 Fragment: Gold |  |
| Ingot: Gold | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Gold |  |
| Ingot: Gold | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Gold |  |
| Ingot: Gold | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Gold |  |
| Ingot: Gold | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 30 Ore: Gold |  |
| Ingot: Gold | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Gold |  |
| Ingot: Gold | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 3 Ore: Gold |  |
| Ingot: Gold | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 25 Ore: Gold |  |
| Ingot: Gold | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Gold |  |
| Ingot: Gold | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Gold |  |
| Ingot: Gold | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Gold |  |
| Ingot: Gold | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Gold |  |
| Ingot: Gold | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 20 Fragment: Gold |  |
| Ingot: Gold | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 50 Ore: Gold |  |
| Ingot: Gold | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 5 Ore: Gold |  |
| Ingot: Gold | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Gold |  |
| Ingot: Quicksilver | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 100 Fragment: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 3 Ore: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 25 Ore: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 15 Ore: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 5 Ore: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 20 Fragment: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 50 Ore: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Quicksilver |  |
| Ingot: Quicksilver | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 200 Fragment: Quicksilver |  |
| Ingot: Quicksilver | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 30 Ore: Quicksilver |  |
| Ingot: Silver | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 20 Fragment: Silver |  |
| Ingot: Silver | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 25 Ore: Silver |  |
| Ingot: Silver | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 100 Fragment: Silver |  |
| Ingot: Silver | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Silver |  |
| Ingot: Silver | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Silver |  |
| Ingot: Silver | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Silver |  |
| Ingot: Silver | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Silver |  |
| Ingot: Silver | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 200 Fragment: Silver |  |
| Ingot: Silver | Smelter | 5 | Advanced Blacksmithing | N/A | Smelter | 15 Ore: Silver |  |
| Ingot: Silver | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Silver |  |
| Ingot: Silver | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 5 Ore: Silver |  |
| Ingot: Silver | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 30 Ore: Silver |  |
| Ingot: Silver | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Silver |  |
| Ingot: Silver | Player Crafting | 1 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Silver |  |
| Ingot: Silver | Smelter | 10 | Advanced Blacksmithing | N/A | Smelter | 50 Ore: Silver |  |
| Ingot: Silver | Player Crafting | 5 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Silver |  |
| Ingot: Silver | Smelter | 1 | Advanced Blacksmithing | N/A | Smelter | 3 Ore: Silver |  |
| Ingot: Silver | Player Crafting | 10 | Advanced Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Silver |  |
| Iron Banded Masterwork Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Iron Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Masterwork Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Masterwork Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Masterwork Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Masterwork Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Masterwork Gauntlets | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Masterwork Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Masterwork Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Helmet | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Masterwork Helmet | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Helmet | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Masterwork Shield | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Masterwork Shield | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Shield | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Jagged Crown Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Dragon Bone |  |
| Jarl of Eastmarch Armguards | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Jarl of Eastmarch Armor | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Kahvozein's Fang | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Leather Executioner's Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Leather: Dark |  |
| Leather Executioner's Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Leather: Dark |  |
| Leather Executioner's Gloves | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Leather: Dark |  |
| Leather Executioner's Hood | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Leather: Dark |  |
| Leather Hood - Black | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Leather: Dark |  |
| Mace of Molag Bal Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Mehrunes' Razor Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Mournbringer | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Nightingale Armor | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Void Salts |  |
| Nightingale Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Void Salts |  |
| Nightingale Gloves | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Void Salts |  |
| Nightingale Hood | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Void Salts |  |
| Noble Gilded Wristguards | Player Crafting | 1 | Advanced Blacksmithing | Tailors | N/A | 2 Gold Ring 3 Leather Strips 2 Leather |  |
| Nordic Boots - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Cuirass - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Gauntlets - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Shield - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Black | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Black | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Okin | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Orcish Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Peridot | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Peridot (Rough) |  |
| Red Glitterdust | Player Crafting | 4 | Advanced Blacksmithing | Alchemists | Forge | 2 Gem: Garnet (Flawless) |  |
| Red Glitterdust | Player Crafting | 4 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Ruby |  |
| Red Glitterdust | Player Crafting | 5 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Ruby (Flawless) |  |
| Red Glitterdust | Player Crafting | 4 | Advanced Blacksmithing | Alchemists | Forge | 3 Gem: Garnet |  |
| Red Glitterdust | Forge | 4 | Advanced Blacksmithing | Alchemists | Forge | 2 Gem: Garnet (Flawless) |  |
| Red Glitterdust | Forge | 4 | Advanced Blacksmithing | Alchemists | Forge | 3 Gem: Garnet |  |
| Red Glitterdust | Forge | 5 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Ruby (Flawless) |  |
| Red Glitterdust | Forge | 4 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Ruby |  |
| Rocksplinter | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Iron |  |
| Ruby | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Ruby (Rough) |  |
| Rueful Axe Replica | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Steel 3 Leather Strips | Daedra - A Daedras Best Friend |
| Rueful Axe Replica | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Steel 3 Leather Strips | Daedra - A Daedras Best Friend |
| Rueful Axe Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Sapphire | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Sapphire (Rough) |  |
| Sapphire Glitterdust | Forge | 3 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Sapphire |  |
| Sapphire Glitterdust | Forge | 5 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Sapphire (Flawless) |  |
| Sapphire Glitterdust | Player Crafting | 3 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Sapphire |  |
| Sapphire Glitterdust | Player Crafting | 5 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Sapphire (Flawless) |  |
| Savior's Hide Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Pelt: Bear 1 Ingot: Steel |  |
| Savior's Hide Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel 1 Fur Plate |  |
| Shardsword | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Shield of Ysgramor Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Skaal Amulet | Forge | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Stalhrim | Dragonborn - The Fate of the Skaal  Complete |
| Skaal Amulet | Player Crafting | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Stalhrim | Dragonborn - The Fate of the Skaal  Complete |
| Skyforge Steel Aegis | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Skyforge Steel Aegis | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Wood 2 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Aegis | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Wood 2 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Battleaxe | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Battleaxe | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Battleaxe | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Dagger | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Dagger | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Greatsword | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Greatsword | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Greatsword | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Heavy Bow | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Heavy Bow | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Wood 3 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Heavy Bow | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Wood 3 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Mace | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Mace | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Mace | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Sword | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Sword | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Sword | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 1 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel War Axe | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel War Axe | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel War Axe | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Warhammer | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Leather Strips 5 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Warhammer | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Leather Strips 5 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Warhammer | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Spellbreaker Replica | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Steel Crossbow of Banishing | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Silver 2 Leather Strips |  |
| Steel Furred Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Furred Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Furred Plate Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Furred Plate Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Plate Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Steel Plate Boots | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Boots | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Steel Plate Cuirass | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Steel Plate Cuirass | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Steel Plate Gauntlets | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Gauntlets | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Steel Plate Gauntlets | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Helmet | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather |  |
| Steel Plate Helmet | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Steel Plate Helmet | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather |  |
| Steel Plate Shield | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Steel Plate Shield | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips |  |
| Steel Plate Shield | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips |  |
| Steel Scimitar | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips |  |
| Steel Scimitar | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips |  |
| Stone Hunting Knife | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Sharp Rock |  |
| Stormcloak General Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Steel |  |
| Thieves Guild Light Crossbow | Player Crafting | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 2 Ingot: Corundum 2 Wood 1 Leather: Dark 4 Hide Lace |  |
| Thieves Guild Light Crossbow | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Corundum |  |
| Thieves Guild Light Crossbow | Forge | 1 | Advanced Blacksmithing | Smiths | Forge | 2 Ingot: Steel 2 Ingot: Corundum 2 Wood 1 Leather: Dark 4 Hide Lace |  |
| Ulfric's Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Ulfric's Bracers | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Ulfric's Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Vigilant's Boots | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Vigilant's Cuirass | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Vigilant's Gauntlets | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Vigilant's Helmet | Armor Table | 1 | Advanced Blacksmithing | N/A | N/A | 1 Ingot: Corundum |  |
| Volendrung Replica | Sharpening Wheel | 1 | Advanced Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Aetherium Boots | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Ingot: Gold |  |
| Aetherium Cuirass | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Ingot: Gold |  |
| Aetherium Gauntlets | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Ingot: Gold |  |
| Aetherium Helmet | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Ingot: Gold |  |
| Auriel's Bow | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Moonstone 2 Hide Lace |  |
| Auriel's Shield | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Dawnbreaker | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Silver |  |
| Ebony Blade | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mail | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Keening | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Mace of Molag Bal | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Mehrunes' Razor | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Miraak's Sword | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Daedra Heart 1 Ingot: Ebony |  |
| Miraak's Sword Replica | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Rueful Axe | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Savior's Hide | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Pelt: Werewolf |  |
| Savior's Hide - Black | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Pelt: Cave Bear |  |
| Savior's Hide - White | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Pelt: Snow Bear |  |
| Spellbreaker | Armor Table | 1 | Legendary Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Volendrung | Sharpening Wheel | 1 | Legendary Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mail | Armor Table | 1 | Legendary Blacksmithing,Craftsmanship | N/A | N/A | 1 Ingot: Ebony |  |
| Arrow: Elven | Player Crafting | 15 | Elven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Arrow: Elven | Forge | 15 | Elven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Auriel's Bow Replica | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Moonstone |  |
| Auriel's Shield Replica | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Bolt: Elven | Forge | 15 | Elven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Bolt: Elven | Player Crafting | 15 | Elven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Elven Battleaxe | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 3 Leather Strips 3 Ingot: Calcinium |  |
| Elven Battleaxe | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Battleaxe | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 3 Leather Strips 3 Ingot: Calcinium |  |
| Elven Boots | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Boots | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Boots - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Dagger | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium |  |
| Elven Dagger | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Dagger | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium |  |
| Elven Gauntlets | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Greatsword | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Greatsword | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Greatsword | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Helmet | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Helmet | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Hunting Knife | Forge | 1 | Elven Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Elven Hunting Knife | Player Crafting | 1 | Elven Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Elven Light Boots | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Light Boots - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Bow | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Bow | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Bow | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 2 Hide Lace 1 Ingot: Calcinium |  |
| Elven Light Crossbow | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Moonstone 1 Hide Lace |  |
| Elven Light Crossbow | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Crossbow | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Cuirass | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Cuirass | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Light Cuirass | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Gauntlets | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Light Gauntlets | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Helmet | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Mace | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Mace | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Mace | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Shield | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Shield | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Shield - Thalmor | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Elven Sword | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 2 Ingot: Calcinium |  |
| Elven Sword | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 2 Ingot: Calcinium |  |
| Elven Sword | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven War Axe | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 2 Ingot: Calcinium |  |
| Elven War Axe | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven War Axe | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 2 Ingot: Calcinium |  |
| Elven Warhammer | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Warhammer | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 3 Leather Strips 4 Ingot: Calcinium |  |
| Elven Warhammer | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 3 Leather Strips 4 Ingot: Calcinium |  |
| Firiniel's End | Sharpening Wheel | 1 | Elven Blacksmithing | N/A | Sharpening Wheel | 1 Hide Lace 1 Ingot: Calcinium |  |
| Fragment: Calcinium | Breakdown | 20 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Calcinium |  |
| Fragment: Moonstone | Breakdown | 20 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Elven Barding and Saddle - Amber | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Amber | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Amber | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Elven Barding and Saddle - Dusk | Player Crafting | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Dusk | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Elven Barding and Saddle - Dusk | Forge | 1 | Elven Blacksmithing | Smiths | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Ingot: Calcinium | Smelter | 1 | Elven Blacksmithing | N/A | Smelter | 6 Fragment: Corundum 14 Fragment: Moonstone |  |
| Ingot: Calcinium | Player Crafting | 5 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Calcinium |  |
| Ingot: Calcinium | Smelter | 6 | Elven Blacksmithing | N/A | Smelter | 2 Ingot: Corundum 4 Ingot: Moonstone |  |
| Ingot: Calcinium | Player Crafting | 3 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 1 Ingot: Corundum 2 Ingot: Moonstone |  |
| Ingot: Calcinium | Player Crafting | 1 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Calcinium |  |
| Ingot: Calcinium | Player Crafting | 6 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 2 Ingot: Corundum 4 Ingot: Moonstone |  |
| Ingot: Calcinium | Smelter | 1 | Elven Blacksmithing | N/A | Smelter | 20 Fragment: Calcinium |  |
| Ingot: Calcinium | Smelter | 5 | Elven Blacksmithing | N/A | Smelter | 100 Fragment: Calcinium |  |
| Ingot: Calcinium | Smelter | 3 | Elven Blacksmithing | N/A | Smelter | 1 Ingot: Corundum 2 Ingot: Moonstone |  |
| Ingot: Calcinium | Smelter | 10 | Elven Blacksmithing | N/A | Smelter | 200 Fragment: Calcinium |  |
| Ingot: Calcinium | Player Crafting | 10 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Calcinium |  |
| Ingot: Calcinium | Player Crafting | 1 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 6 Fragment: Corundum 14 Fragment: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 5 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 1 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Moonstone |  |
| Ingot: Moonstone | Smelter | 5 | Elven Blacksmithing | N/A | Smelter | 15 Ore: Moonstone |  |
| Ingot: Moonstone | Smelter | 1 | Elven Blacksmithing | N/A | Smelter | 5 Ore: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 10 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 1 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Moonstone |  |
| Ingot: Moonstone | Smelter | 1 | Elven Blacksmithing | N/A | Smelter | 20 Fragment: Moonstone |  |
| Ingot: Moonstone | Smelter | 5 | Elven Blacksmithing | N/A | Smelter | 25 Ore: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 1 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Moonstone |  |
| Ingot: Moonstone | Smelter | 10 | Elven Blacksmithing | N/A | Smelter | 50 Ore: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 10 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 10 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Moonstone |  |
| Ingot: Moonstone | Smelter | 1 | Elven Blacksmithing | N/A | Smelter | 3 Ore: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 5 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Moonstone |  |
| Ingot: Moonstone | Smelter | 10 | Elven Blacksmithing | N/A | Smelter | 30 Ore: Moonstone |  |
| Ingot: Moonstone | Player Crafting | 5 | Elven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Moonstone |  |
| Ingot: Moonstone | Smelter | 10 | Elven Blacksmithing | N/A | Smelter | 200 Fragment: Moonstone |  |
| Ingot: Moonstone | Smelter | 5 | Elven Blacksmithing | N/A | Smelter | 100 Fragment: Moonstone |  |
| Snow Elf Boots | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Snow Elf Crown | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Snow Elf Cuirass | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Snow Elf Gauntlets | Armor Table | 1 | Elven Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Cleric Barding and Saddle | Forge | 1 | Elven Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Cleric Barding and Saddle | Player Crafting | 1 | Elven Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Arrow: Ebony | Player Crafting | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Arrow: Ebony | Forge | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Blade of Sacrifice | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Blade of Sacrifice Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - Boethiahs Calling |
| Blade of Sacrifice Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - Boethiahs Calling |
| Blade of Woe Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Dark Brotherhood - Death Incarnate Complete |
| Blade of Woe Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Dark Brotherhood - Death Incarnate Complete |
| Bloodscythe | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Bolt: Dark Brotherhood | Forge | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Dark Brotherhood | Player Crafting | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Ebony | Player Crafting | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Ebony | Forge | 15 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Wood |  |
| Dark Brotherhood Heavy Crossbow | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Dark Brotherhood Heavy Crossbow | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Steel 2 Ingot: Ebony 2 Wood 1 Leather 4 Hide Lace |  |
| Dark Brotherhood Heavy Crossbow | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Steel 2 Ingot: Ebony 2 Wood 1 Leather 4 Hide Lace |  |
| Dawnguard Rune Shield Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 1 Ingot: Ebony 2 Leather Strips | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Shield Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Steel 1 Ingot: Ebony 2 Leather Strips | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Shield Replica | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Dwarven Heavy Black Bow of Fate | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Battleaxe | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Battleaxe | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Battleaxe | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Battlestaff | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver |  |
| Ebony Battlestaff | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver |  |
| Ebony Battlestaff | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Blade Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - The Whispering Door |
| Ebony Blade Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - The Whispering Door |
| Ebony Blade Replica | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Boots | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Boots | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Boots | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Boots - Silvered | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Boots - Silvered | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Boots - Silvered | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Cuirass | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Ebony Cuirass | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Ebony Cuirass | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Cuirass - Gilded | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Cuirass - Gilded | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Gilded | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Dagger | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Dagger | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Dagger | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Gauntlets | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Gauntlets | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Gauntlets - Silvered | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Silvered | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Gauntlets - Silvered | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 2 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Greatsword | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Greatsword | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Greatsword | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Heavy Bow | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Hide Lace |  |
| Ebony Heavy Bow | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Heavy Bow | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Hide Lace |  |
| Ebony Heavy Crossbow | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 4 Hide Lace |  |
| Ebony Heavy Crossbow | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 4 Hide Lace |  |
| Ebony Heavy Crossbow | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Helmet | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Helmet | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Ebony Helmet | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Gilded | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Gold 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Gilded | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Helmet - Gilded | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Gold 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 3 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Hunting Knife | Player Crafting | 1 | Ebony Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Fragment: Bone |  |
| Ebony Hunting Knife | Forge | 1 | Ebony Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Fragment: Bone |  |
| Ebony Mace | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mace | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Mace | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Mail Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica - Gilded | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Gilded | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Silvered | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Silver 4 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Silvered | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Silvered | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Silver 4 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Shield | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Shield | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Shield | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Shield - Gilded | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips |  |
| Ebony Shield - Gilded | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Shield - Gilded | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips |  |
| Ebony Shield - Silvered | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Ebony Shield - Silvered | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Ebony 2 Leather Strips |  |
| Ebony Shield - Silvered | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Silver 4 Ingot: Ebony 2 Leather Strips |  |
| Ebony Sword | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Sword | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Sword | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony War Axe | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony War Axe | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony War Axe | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Warhammer | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Warhammer | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Warhammer | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Falmer Hardened Boots | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Boots | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Boots | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Falmer Hardened Cuirass | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Chaurus Chitin 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Falmer Hardened Cuirass | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Falmer Hardened Cuirass | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 5 Chaurus Chitin 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Falmer Hardened Gauntlets | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Gauntlets | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Gauntlets | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Falmer Hardened Helmet | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Falmer Hardened Helmet | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Falmer Hardened Helmet | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Falmer Honed Light Bow | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Falmer Heavy Bow 2 Ingot: Ebony |  |
| Falmer Honed Light Bow | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Falmer Honed Light Bow | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Falmer Heavy Bow 2 Ingot: Ebony |  |
| Falmer Honed Sword | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Falmer Sword 1 Ingot: Ebony |  |
| Falmer Honed Sword | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Falmer Honed Sword | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Falmer Sword 1 Ingot: Ebony |  |
| Falmer Honed War Axe | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Falmer War Axe 1 Ingot: Ebony |  |
| Falmer Honed War Axe | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Falmer Honed War Axe | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Falmer War Axe 1 Ingot: Ebony |  |
| Fragment: Ebony | Breakdown | 20 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| General Tullius' Sword | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Harkon's Sword Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Killed Harkon |
| Harkon's Sword Replica | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Harkon's Sword Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Killed Harkon |
| Horse Armor: Cleric Barding and Saddle | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Ebony Barding and Saddle | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Horse Armor: Ebony Barding and Saddle | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle - Mail | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Horse Armor: Ebony Barding and Saddle - Mail | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle - Mail | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Ingot: Ebony | Smelter | 5 | Ebony Blacksmithing | N/A | Smelter | 15 Ore: Ebony |  |
| Ingot: Ebony | Smelter | 10 | Ebony Blacksmithing | N/A | Smelter | 200 Fragment: Ebony |  |
| Ingot: Ebony | Smelter | 5 | Ebony Blacksmithing | N/A | Smelter | 25 Ore: Ebony |  |
| Ingot: Ebony | Smelter | 5 | Ebony Blacksmithing | N/A | Smelter | 100 Fragment: Ebony |  |
| Ingot: Ebony | Smelter | 1 | Ebony Blacksmithing | N/A | Smelter | 20 Fragment: Ebony |  |
| Ingot: Ebony | Player Crafting | 5 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Ebony |  |
| Ingot: Ebony | Player Crafting | 1 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Ebony |  |
| Ingot: Ebony | Smelter | 10 | Ebony Blacksmithing | N/A | Smelter | 30 Ore: Ebony |  |
| Ingot: Ebony | Player Crafting | 10 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Ebony |  |
| Ingot: Ebony | Smelter | 1 | Ebony Blacksmithing | N/A | Smelter | 3 Ore: Ebony |  |
| Ingot: Ebony | Smelter | 1 | Ebony Blacksmithing | N/A | Smelter | 5 Ore: Ebony |  |
| Ingot: Ebony | Smelter | 10 | Ebony Blacksmithing | N/A | Smelter | 50 Ore: Ebony |  |
| Ingot: Ebony | Player Crafting | 1 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Ebony |  |
| Ingot: Ebony | Player Crafting | 1 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Ebony |  |
| Ingot: Ebony | Player Crafting | 10 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Ebony |  |
| Ingot: Ebony | Player Crafting | 5 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Ebony |  |
| Ingot: Ebony | Player Crafting | 10 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Ebony |  |
| Ingot: Ebony | Player Crafting | 5 | Ebony Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Ebony |  |
| Irkngthand War Axe | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 3 Leather Strips 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Axe |
| Irkngthand War Axe | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Irkngthand War Axe | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 2 Ingot: Ebony 3 Leather Strips 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Axe |
| Masque of Clavicus Vile Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | Daedra - A Daedras Best Friend |
| Masque of Clavicus Vile Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | Daedra - A Daedras Best Friend |
| Nettlebane | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Spriggan Sap |  |
| Nightingale Blade | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Nightingale Blade | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Nightingale Bow | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Nightingale Bow | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Shellbug Helmet | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Leather Strips 1 Leather 2 Shellbug Chitin |  |
| Shellbug Helmet | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Shellbug Helmet | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 1 Ingot: Ebony 1 Leather Strips 1 Leather 2 Shellbug Chitin |  |
| Shield of Ysgramor | Armor Table | 1 | Ebony Blacksmithing | N/A | N/A | 1 Ingot: Ebony |  |
| Shield of Ysgramor Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Leather Strips 1 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Shield of Ysgramor Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 4 Ingot: Ebony 2 Leather Strips 1 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Soulrender | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Wuuthrad | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Wuuthrad Replica | Sharpening Wheel | 1 | Ebony Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Ebony |  |
| Wuuthrad Replica | Player Crafting | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 3 Leather Strips 2 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Wuuthrad Replica | Forge | 1 | Ebony Blacksmithing | Smiths | Forge | 3 Ingot: Ebony 3 Leather Strips 2 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Arrow: Glass | Forge | 15 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Wood |  |
| Arrow: Glass | Player Crafting | 15 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Wood |  |
| Bolt: Glass | Player Crafting | 15 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Wood |  |
| Bolt: Glass | Forge | 15 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Wood |  |
| Chillrend | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Frost Salts |  |
| Chillrend Replica | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 1 Frost Salts 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium | TG - The Pursuit Complete |
| Chillrend Replica | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 1 Frost Salts 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium | TG - The Pursuit Complete |
| Fragment: Malachite | Breakdown | 20 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Battleaxe | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Battleaxe | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Battleaxe | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Battlestaff | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Battlestaff | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Moonstone 2 Ingot: Malachite 2 Ingot: Calcinium |  |
| Glass Battlestaff | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Moonstone 2 Ingot: Malachite 2 Ingot: Calcinium |  |
| Glass Boots | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Boots | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Boots | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Boots - Thalmor | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Boots - Thalmor | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Boots - Thalmor | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Boots - Vvardenfell | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Boots - Vvardenfell | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Boots - Vvardenfell | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Cuirass | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Calcinium |  |
| Glass Cuirass | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Calcinium |  |
| Glass Cuirass | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Cuirass - Thalmor | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Corundum 5 Ingot: Malachite 4 Leather Strips 2 Leather |  |
| Glass Cuirass - Thalmor | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Cuirass - Thalmor | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Corundum 5 Ingot: Malachite 4 Leather Strips 2 Leather |  |
| Glass Cuirass - Vvardenfell | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Galatite |  |
| Glass Cuirass - Vvardenfell | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Galatite |  |
| Glass Cuirass - Vvardenfell | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Dagger | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Dagger | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Dagger | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Gauntlets | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Gauntlets | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Gauntlets | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Gauntlets - Thalmor | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Gauntlets - Thalmor | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Gauntlets - Thalmor | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Gauntlets - Vvardenfell | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Gauntlets - Vvardenfell | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Gauntlets - Vvardenfell | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Greatsword | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Greatsword | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Greatsword | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Helmet | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Helmet | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Helmet | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Helmet - Thalmor | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Helmet - Thalmor | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 1 Leather Strips 1 Leather |  |
| Glass Helmet - Thalmor | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 1 Leather Strips 1 Leather |  |
| Glass Helmet - Vvardenfell | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Helmet - Vvardenfell | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Helmet - Vvardenfell | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Hunting Knife | Forge | 1 | Glass Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Glass Hunting Knife | Player Crafting | 1 | Glass Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Glass Light Bow | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Hide Lace 1 Ingot: Calcinium |  |
| Glass Light Bow | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Bow | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Hide Lace 1 Ingot: Calcinium |  |
| Glass Light Bow of the Stag Prince | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Crossbow | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Crossbow | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Hide Lace 2 Ingot: Calcinium |  |
| Glass Light Crossbow | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Hide Lace 2 Ingot: Calcinium |  |
| Glass Mace | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Mace | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Mace | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Shield - Thalmor | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Shield - Thalmor | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 4 Ingot: Malachite 2 Leather Strips |  |
| Glass Shield - Thalmor | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 4 Ingot: Malachite 2 Leather Strips |  |
| Glass Shield - Vvardenfell | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Glass Shield - Vvardenfell | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Galatite |  |
| Glass Shield - Vvardenfell | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Galatite |  |
| Glass Sword | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Sword | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Sword | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass War Axe | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass War Axe | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass War Axe | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Warhammer | Sharpening Wheel | 1 | Glass Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Warhammer | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 4 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Warhammer | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 4 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Horse Armor: Divine Aegis Barding and Saddle | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 2 Briar Heart 2 Ingot: Gold 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Divine Aegis Barding and Saddle | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 2 Briar Heart 2 Ingot: Gold 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Divine Aegis Barding and Saddle | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Horse Armor: Frost Aegis Barding and Saddle | Armor Table | 1 | Glass Blacksmithing | N/A | N/A | 1 Ingot: Malachite |  |
| Horse Armor: Frost Aegis Barding and Saddle | Forge | 1 | Glass Blacksmithing | Smiths | Forge | 2 Frost Salts 2 Ingot: Quicksilver 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Frost Aegis Barding and Saddle | Player Crafting | 1 | Glass Blacksmithing | Smiths | Forge | 2 Frost Salts 2 Ingot: Quicksilver 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Ingot: Malachite | Player Crafting | 10 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Malachite |  |
| Ingot: Malachite | Player Crafting | 5 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Malachite |  |
| Ingot: Malachite | Player Crafting | 10 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Malachite |  |
| Ingot: Malachite | Player Crafting | 1 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Malachite |  |
| Ingot: Malachite | Player Crafting | 5 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Malachite |  |
| Ingot: Malachite | Smelter | 10 | Glass Blacksmithing | N/A | Smelter | 30 Ore: Malachite |  |
| Ingot: Malachite | Smelter | 5 | Glass Blacksmithing | N/A | Smelter | 15 Ore: Malachite |  |
| Ingot: Malachite | Smelter | 1 | Glass Blacksmithing | N/A | Smelter | 20 Fragment: Malachite |  |
| Ingot: Malachite | Player Crafting | 5 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Malachite |  |
| Ingot: Malachite | Smelter | 1 | Glass Blacksmithing | N/A | Smelter | 5 Ore: Malachite |  |
| Ingot: Malachite | Smelter | 10 | Glass Blacksmithing | N/A | Smelter | 50 Ore: Malachite |  |
| Ingot: Malachite | Player Crafting | 1 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Malachite |  |
| Ingot: Malachite | Player Crafting | 10 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Malachite |  |
| Ingot: Malachite | Smelter | 5 | Glass Blacksmithing | N/A | Smelter | 25 Ore: Malachite |  |
| Ingot: Malachite | Smelter | 5 | Glass Blacksmithing | N/A | Smelter | 100 Fragment: Malachite |  |
| Ingot: Malachite | Player Crafting | 1 | Glass Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Malachite |  |
| Ingot: Malachite | Smelter | 1 | Glass Blacksmithing | N/A | Smelter | 3 Ore: Malachite |  |
| Ingot: Malachite | Smelter | 10 | Glass Blacksmithing | N/A | Smelter | 200 Fragment: Malachite |  |
| Dragonscale Boots | Forge | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Boots | Player Crafting | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Cuirass | Player Crafting | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 3 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Dragonscale Cuirass | Forge | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 3 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Dragonscale Gauntlets | Player Crafting | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Gauntlets | Forge | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Helmet | Player Crafting | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Dragonscale Helmet | Forge | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Dragonscale Shield | Player Crafting | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 2 Leather Strips |  |
| Dragonscale Shield | Forge | 1 | Glass Blacksmithing,Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 2 Leather Strips |  |
| Auriel's Shield Replica | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Moonstone 2 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Auriel's Shield Replica | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Moonstone 2 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Blackguard's Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Blackguard's Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Blackguard's Gloves | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Blackguard's Hood | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Elven Shield - Gilded | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Gilded | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Imperial Outcast Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Iron |  |
| Imperial Outcast Bracers | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Imperial Outcast Bracers | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Fur Plate |  |
| Imperial Outcast Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Imperial Outcast Helmet | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Imperial Studded Cuirass | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Studded Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Nightingale Armor | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 1 Void Salts 6 Leather Strips 5 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Void Salts |  |
| Nightingale Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Void Salts |  |
| Nightingale Gloves | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Void Salts |  |
| Nightingale Gloves | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Hood | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Void Salts |  |
| Nightingale Hood | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Savior's Hide Replica | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Pelt: Cave Bear 1 Ingot: Steel |  |
| Savior's Hide Replica - Black | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Steel 1 Fur Plate |  |
| Savior's Hide Replica - Black | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Pelt: Snow Bear 1 Ingot: Steel |  |
| Savior's Hide Replica - White | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Snow Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Steel 1 Fur Plate |  |
| Savior's Hide Replica - White | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Snow Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Scaled Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather |  |
| Scaled Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Corundum |  |
| Scaled Boots | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather |  |
| Scaled Boots | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Boots | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Bracers | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Bracers | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Corundum |  |
| Scaled Bracers | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Corundum |  |
| Scaled Cuirass | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate 1 Goat Horns |  |
| Scaled Cuirass - Horned | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Corundum |  |
| Scaled Cuirass - Horned | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass - Horned | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass - Horned | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass - Horned | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate 1 Goat Horns |  |
| Scaled Cuirass - Horned | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass - Horned | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 1 Pelt: Goat 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Goat Horns |  |
| Scaled Cuirass - Horned | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Pelt: Sabre Cat 1 Pelt: Goat 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Goat Horns |  |
| Scaled Helmet | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Scaled Helmet | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Scaled Helmet | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Ingot: Corundum |  |
| Scaled Helmet | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Scaled Helmet | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Shrouded Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 5 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Supple Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 3 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Supple Cowl | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 3 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl - Maskless | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Shrouded Supple Cowl - Maskless | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 3 Leather: Dark | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Gloves | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 1 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Gloves | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Red |  |
| Snow Elf Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Boots | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Circlet | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Snow Elf Crown | DawnGuard - Touching the Sky Complete |
| Snow Elf Circlet | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Snow Elf Crown | DawnGuard - Touching the Sky Complete |
| Snow Elf Crown | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Crown | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Cuirass | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 5 Ingot: Moonstone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 5 Ingot: Moonstone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Gauntlets | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Gauntlets | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Thieves Guild Improved Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots - Grey | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots - Grey | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Cuirass - Grey | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass - Grey | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Gloves | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Gloves | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Gloves - Grey | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves - Grey | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Hood | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Hood | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Hood | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Hood - Grey | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Improved Hood - Grey | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Sleeveless Cuirass - Grey | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Sleeveless Cuirass - Grey | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Master's Boots | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 3 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cowl | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cowl | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 8 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Gloves | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Gloves | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Hood | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Hood | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Sleeveless Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 6 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Sleeveless Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Dark |  |
| Thieves Guild Sleeveless Improved Cuirass | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather |  |
| Thieves Guild Sleeveless Improved Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Tumblerbane Gloves | Armor Table | 1 | Advanced Light Smithing | N/A | N/A | 1 Leather: Red |  |
| Vampire Boots | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Iron 3 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Boots | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Iron 3 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Dark | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 5 Leather Strips 5 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Grey | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 5 Leather Strips 5 Leather 1 Dye - Grey | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Red | Player Crafting | 1 | Advanced Light Smithing | Smiths | N/A | 5 Leather Strips 5 Leather: Red | DawnGuard - Prophet (Vampire) Complete |
| Vampire Gauntlets | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Iron 2 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Gauntlets | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 1 Ingot: Iron 2 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Royal Cuirass | Player Crafting | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather: Dark | DawnGuard - Prophet (Vampire) Complete,DawnGuard - Killed Harkon |
| Vampire Royal Cuirass | Forge | 1 | Advanced Light Smithing | Smiths | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather: Dark | DawnGuard - Prophet (Vampire) Complete,DawnGuard - Killed Harkon |
| Elven Boots - Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 2 Ingot: Gold 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 2 Ingot: Gold 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Helmet - Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | Player Crafting | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | Forge | 1 | Advanced Light Smithing,Elven Blacksmithing | Smiths | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Champion's Cudgel Replica | Forge | 1 | Advanced Light Smithing,Orcish Blacksmithing | Smiths | Forge | 3 Leather Strips 5 Ingot: Galatite | Dragonborn - March Of The Dead Complete,Civil War - Joined Imperials |
| Champion's Cudgel Replica | Player Crafting | 1 | Advanced Light Smithing,Orcish Blacksmithing | Smiths | Forge | 3 Leather Strips 5 Ingot: Galatite | Dragonborn - March Of The Dead Complete,Civil War - Joined Imperials |
| Arrow: Nordic | Forge | 15 | Nordic Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Galatite |  |
| Arrow: Nordic | Player Crafting | 15 | Nordic Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Galatite |  |
| Nordic Battleaxe | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 3 Leather Strips 3 Ingot: Galatite |  |
| Nordic Battleaxe | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 3 Leather Strips 3 Ingot: Galatite |  |
| Nordic Battleaxe | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Boots - Black | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Boots - Black | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Brown | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Boots - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Boots - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Cuirass - Black | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Cuirass - Black | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Cuirass - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Cuirass - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Dagger | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Ingot: Galatite |  |
| Nordic Dagger | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Dagger | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Ingot: Galatite |  |
| Nordic Gauntlets - Black | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Black | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Black | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - White | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Gauntlets - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Greatsword | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Greatsword | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Greatsword | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Heavy Bow | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Bow | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Bow | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Heavy Crossbow | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 5 Ingot: Quicksilver |  |
| Nordic Heavy Crossbow | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Quicksilver 1 Hide Lace |  |
| Nordic Heavy Crossbow | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 5 Ingot: Quicksilver |  |
| Nordic Helmet - Black | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Leather 3 Ingot: Galatite |  |
| Nordic Helmet - Black | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Helmet - Black | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Leather 3 Ingot: Galatite |  |
| Nordic Mace | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Mace | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Mace | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Shield - Black | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Shield - Black | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Black | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Brown | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Shield - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Armor Table | 1 | Nordic Blacksmithing | N/A | N/A | 1 Ingot: Galatite |  |
| Nordic Shield - White | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Sword | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Sword | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Leather Strips 2 Ingot: Galatite |  |
| Nordic Sword | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Warhammer | Sharpening Wheel | 1 | Nordic Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Warhammer | Forge | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 3 Leather Strips 4 Ingot: Galatite |  |
| Nordic Warhammer | Player Crafting | 1 | Nordic Blacksmithing | Smiths | Forge | 2 Ingot: Orichalcum 3 Leather Strips 4 Ingot: Galatite |  |
| Bonemold Boots | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Boots | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Boots | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Cuirass | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Cuirass | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Cuirass | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Gauntlets | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 4 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Gauntlets | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Gauntlets | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 4 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Ingot: Iron 1 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Ingot: Iron 1 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Improved Boots | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Improved Boots | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Boots | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Cuirass | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Improved Cuirass | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Cuirass | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Gauntlets | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Improved Gauntlets | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 4 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Gauntlets | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 4 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 1 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 1 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Improved Pauldroned Cuirass | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 10 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Pauldroned Cuirass | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Improved Pauldroned Cuirass | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 10 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Shield | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 2 Salt 1 Ingot: Iron 2 Powdered Mammoth Tusk 2 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Shield | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Improved Shield | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 2 Salt 1 Ingot: Iron 2 Powdered Mammoth Tusk 2 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Pauldroned Cuirass | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Pauldroned Cuirass | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass - Guard's | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass - Guard's | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Pauldroned Cuirass - Guard's | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Shield | Armor Table | 1 | Morrowind Smithing 1 | N/A | N/A | 2 Bone Meal |  |
| Bonemold Shield | Forge | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 1 Ingot: Iron 1 Netch Leather |  |
| Bonemold Shield | Player Crafting | 1 | Morrowind Smithing 1 | Smiths | Forge | 8 Bone Meal 1 Ingot: Iron 1 Netch Leather |  |
| Arrow: Dragonbone | Player Crafting | 15 | Draconic Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Wood |  |
| Arrow: Dragonbone | Forge | 15 | Draconic Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Wood |  |
| Bolt: Dragonbone | Player Crafting | 15 | Draconic Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Wood |  |
| Bolt: Dragonbone | Forge | 15 | Draconic Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Wood |  |
| Dragonbone Battleaxe | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Dagger | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Greatsword | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Heavy Bow | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone 2 Hide Lace |  |
| Dragonbone Heavy Crossbow | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone 2 Hide Lace |  |
| Dragonbone Heavy Crossbow | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 3 Dragon Bone 2 Ingot: Ebony 4 Hide Lace |  |
| Dragonbone Heavy Crossbow | Forge | 1 | Draconic Blacksmithing | Smiths | Forge | 3 Dragon Bone 2 Ingot: Ebony 4 Hide Lace |  |
| Dragonbone Hunting Knife | Player Crafting | 1 | Draconic Blacksmithing | Smiths,Survivalists | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Dragonbone Hunting Knife | Forge | 1 | Draconic Blacksmithing | Smiths,Survivalists | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Dragonbone Mace | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Sword | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone War Axe | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Warhammer | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonplate Bearskin Hood - Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Black |  |
| Dragonplate Bearskin Hood - Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Brown |  |
| Dragonplate Bearskin Hood - Ornate Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonplate Bearskin Hood - Ornate Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonplate Bearskin Hood - Ornate White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonplate Bearskin Hood - Trimmed Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonplate Bearskin Hood - Trimmed Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonplate Bearskin Hood - Trimmed White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonplate Bearskin Hood - White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - White |  |
| Dragonplate Boots | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Bone |  |
| Dragonplate Cuirass | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Bone |  |
| Dragonplate Gauntlets | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Bone |  |
| Dragonplate Helmet | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Bone |  |
| Dragonplate Shield | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Bone |  |
| Dragonplate Wolfskin Hood - Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Black |  |
| Dragonplate Wolfskin Hood - Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonplate Wolfskin Hood - Light Trimmed Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonplate Wolfskin Hood - Light Trimmed Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Light Trimmed White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonplate Wolfskin Hood - Noble Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonplate Wolfskin Hood - Noble Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonplate Wolfskin Hood - Noble White | CraftingTable | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonplate Wolfskin Hood - Ornate Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonplate Wolfskin Hood - Ornate Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonplate Wolfskin Hood - Ornate White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonplate Wolfskin Hood - White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - White |  |
| Dragonscale Bearskin Hood - Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Black |  |
| Dragonscale Bearskin Hood - Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Brown |  |
| Dragonscale Bearskin Hood - Ornate Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonscale Bearskin Hood - Ornate Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonscale Bearskin Hood - Ornate White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonscale Bearskin Hood - Trimmed Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonscale Bearskin Hood - Trimmed Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonscale Bearskin Hood - Trimmed White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonscale Bearskin Hood - White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - White |  |
| Dragonscale Boots | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Cuirass | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Gauntlets | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Helmet | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Shield | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Black |  |
| Dragonscale Wolfskin Hood - Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonscale Wolfskin Hood - Light Trimmed Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonscale Wolfskin Hood - Light Trimmed Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Light Trimmed White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonscale Wolfskin Hood - Noble Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonscale Wolfskin Hood - Noble Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonscale Wolfskin Hood - Noble White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonscale Wolfskin Hood - Ornate Black | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonscale Wolfskin Hood - Ornate Brown | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonscale Wolfskin Hood - Ornate White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonscale Wolfskin Hood - White | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - White |  |
| Fang of Haynekhtnamet | Sharpening Wheel | 1 | Draconic Blacksmithing | N/A | Sharpening Wheel | 1 Dragon Bone |  |
| Horse Armor: Dragonbone Barding and Saddle | Player Crafting | 1 | Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 8 Dragon Bone 1 Ingot: Steel 10 Leather Strips 6 Leather |  |
| Horse Armor: Dragonbone Barding and Saddle | Forge | 1 | Draconic Blacksmithing | Smiths | Forge | 2 Dragon Scales 8 Dragon Bone 1 Ingot: Steel 10 Leather Strips 6 Leather |  |
| Horse Armor: Dragonbone Barding and Saddle | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Scales |  |
| Jagged Crown | Armor Table | 1 | Draconic Blacksmithing | N/A | N/A | 1 Dragon Bone |  |
| Dragonbone Battleaxe | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Battleaxe | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Dagger | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Dagger | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Greatsword | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Greatsword | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Heavy Bow | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Heavy Bow | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Mace | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Mace | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Sword | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Sword | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone War Axe | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone War Axe | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Warhammer | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 4 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Warhammer | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 4 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonplate Boots | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Boots | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Cuirass | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 4 Dragon Bone 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Dragonplate Cuirass | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 4 Dragon Bone 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Dragonplate Gauntlets | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Gauntlets | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Helmet | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Dragonplate Helmet | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Dragonplate Shield | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 4 Dragon Bone 2 Ingot: Ebony 2 Leather Strips |  |
| Dragonplate Shield | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 4 Dragon Bone 2 Ingot: Ebony 2 Leather Strips |  |
| Jagged Crown Replica | Player Crafting | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather | Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete,Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete |
| Jagged Crown Replica | Forge | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Smiths | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather | Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete,Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete |
| Arrow: Daedric | Player Crafting | 150 | Daedric Smithing | Smiths | Forge | 150 Arrow: Ebony 1 Soul Gem: Black 1 Daedra Heart |  |
| Arrow: Daedric | Forge | 150 | Daedric Smithing | Smiths | Forge | 150 Arrow: Ebony 1 Soul Gem: Black 1 Daedra Heart |  |
| Bolt: Daedric | Forge | 150 | Daedric Smithing | Smiths | Forge | 1 Soul Gem: Black 1 Daedra Heart 150 Bolt: Ebony |  |
| Bolt: Daedric | Player Crafting | 150 | Daedric Smithing | Smiths | Forge | 1 Soul Gem: Black 1 Daedra Heart 150 Bolt: Ebony |  |
| Daedric Battleaxe | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Battleaxe | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Battleaxe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Battleaxe | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Battleaxe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Battlestaff | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Battlestaff |  |
| Daedric Battlestaff | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Battlestaff |  |
| Daedric Battlestaff | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Boots | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Boots 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Boots | Armor Table | 1 | Daedric Smithing | N/A | N/A | 1 Ingot: Ebony |  |
| Daedric Boots | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Boots 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Cuirass | Armor Table | 1 | Daedric Smithing | N/A | N/A | 1 Ingot: Ebony |  |
| Daedric Cuirass | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Cuirass 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Cuirass | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Cuirass 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Dagger | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Dagger 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Dagger | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Dagger | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Dagger 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Gauntlets | Armor Table | 1 | Daedric Smithing | N/A | N/A | 1 Ingot: Ebony |  |
| Daedric Gauntlets | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Gauntlets 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Gauntlets | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Gauntlets 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Greatsword | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Greatsword | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Greatsword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Greatsword | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Greatsword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Bow | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Heavy Bow 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Bow | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Heavy Bow 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Bow | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Heavy Crossbow | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Heavy Crossbow 4 Silk Thread |  |
| Daedric Heavy Crossbow | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Ingot: Ebony 2 Silk Thread |  |
| Daedric Heavy Crossbow | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Heavy Crossbow 4 Silk Thread |  |
| Daedric Helmet | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Helmet 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Helmet | Armor Table | 1 | Daedric Smithing | N/A | N/A | 1 Ingot: Ebony |  |
| Daedric Helmet | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Helmet 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Hunting Knife | Player Crafting | 1 | Daedric Smithing | Smiths,Survivalists | Forge | 1 Daedra Heart 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Daedric Hunting Knife | Forge | 1 | Daedric Smithing | Smiths,Survivalists | Forge | 1 Daedra Heart 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Daedric Mace | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Mace 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Mace | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Mace | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Mace 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Shield | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Shield 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Shield | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Shield 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Shield | Armor Table | 1 | Daedric Smithing | N/A | N/A | 1 Ingot: Ebony |  |
| Daedric Sword | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Sword | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Sword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Sword | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Sword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric War Axe | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony War Axe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric War Axe | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony War Axe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric War Axe | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Warhammer | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Warhammer 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Warhammer | Sharpening Wheel | 1 | Daedric Smithing | N/A | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Warhammer | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Ebony Warhammer 1 Soul Gem: Black 1 Daedra Heart |  |
| Horse Armor: Daedric Barding and Saddle | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 1 Ingot: Steel 10 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Daedric Barding and Saddle | Armor Table | 1 | Daedric Smithing | N/A | N/A | 1 Ingot: Ebony |  |
| Horse Armor: Daedric Barding and Saddle | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 1 Ingot: Steel 10 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Mace of Molag Bal Replica | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 3 Ingot: Ebony 2 Leather Strips | Daedra - The House of Horrors |
| Mace of Molag Bal Replica | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 3 Ingot: Ebony 2 Leather Strips | Daedra - The House of Horrors |
| Mehrunes' Razor Replica | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 1 Ingot: Steel 1 Ingot: Ebony 1 Leather Strips | Daedra - Pieces of the Past |
| Mehrunes' Razor Replica | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 1 Ingot: Steel 1 Ingot: Ebony 1 Leather Strips | Daedra - Pieces of the Past |
| Miraak's Sword Replica | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 2 Ingot: Ebony 1 Netch Leather | Killed Miraak |
| Miraak's Sword Replica | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 2 Ingot: Ebony 1 Netch Leather | Killed Miraak |
| Nightingale Blade | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Void Salts 2 Ingot: Ebony 1 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Blade | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Void Salts 2 Ingot: Ebony 1 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Bow | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Void Salts 3 Ingot: Ebony 2 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Bow | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Void Salts 3 Ingot: Ebony 2 Leather Strips | TG - Darkness Returns Complete |
| Volendrung Replica | Player Crafting | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 4 Ingot: Ebony 3 Leather Strips | Daedra - The Cursed Tribe Complete |
| Volendrung Replica | Forge | 1 | Daedric Smithing | Smiths | Forge | 1 Daedra Heart 4 Ingot: Ebony 3 Leather Strips | Daedra - The Cursed Tribe Complete |
| Aetherial Shield | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Arrow: Dwarven | Forge | 15 | Dwarven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Arrow: Dwarven | Player Crafting | 15 | Dwarven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Blade of the Rourken | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Bolt: Dwarven | Forge | 15 | Dwarven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Bolt: Dwarven | Player Crafting | 15 | Dwarven Blacksmithing | Smiths | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Dwarven Battleaxe | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Battleaxe | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Battleaxe | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Boots | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Boots | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Dwarven Boots | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Cuirass | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 2 Leather 5 Ingot: Dwarven |  |
| Dwarven Cuirass | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Dwarven Cuirass | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 4 Leather Strips 2 Leather 5 Ingot: Dwarven |  |
| Dwarven Dagger | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven |  |
| Dwarven Dagger | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven |  |
| Dwarven Dagger | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Gauntlets | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 2 Ingot: Dwarven |  |
| Dwarven Gauntlets | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 2 Ingot: Dwarven |  |
| Dwarven Gauntlets | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Dwarven Greatsword | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Greatsword | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Greatsword | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Heavy Bow | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Bow | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Bow | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 3 Wood 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 3 Wood 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Helmet | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Helmet | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Helmet | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Dwarven Hunting Knife | Player Crafting | 1 | Dwarven Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven 1 Fragment: Bone |  |
| Dwarven Hunting Knife | Forge | 1 | Dwarven Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven 1 Fragment: Bone |  |
| Dwarven Improved Light Crossbow | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 4 Ingot: Dwarven | Read Dwemer Crossbow Schematic |
| Dwarven Improved Light Crossbow | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 4 Ingot: Dwarven | Read Dwemer Crossbow Schematic |
| Dwarven Improved Light Crossbow | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Mace | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Mace | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Mace | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Masterwork Light Crossbow | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 1 Dwarven Improved Light Crossbow | Improved Dwemer Crossbow Schematic |
| Dwarven Masterwork Light Crossbow | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Masterwork Light Crossbow | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Quicksilver 1 Dwarven Improved Light Crossbow | Improved Dwemer Crossbow Schematic |
| Dwarven Shield | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Dwarven Shield | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Shield | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 2 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Sword | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven Sword | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven Sword | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven War Axe | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven War Axe | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven War Axe | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Warhammer | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Warhammer | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Warhammer | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Leather Strips 4 Ingot: Dwarven |  |
| Falmer Heavy Boots | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Boots | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Cuirass | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 5 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Cuirass | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 5 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Gauntlets | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Gauntlets | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Helmet | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Heavy Helmet | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 3 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Fragment: Dwarven | Breakdown | 20 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Horse Armor: Dwarven Barding and Saddle | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 10 Leather Strips 6 Leather 8 Ingot: Dwarven |  |
| Horse Armor: Dwarven Barding and Saddle | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 2 Ingot: Steel 10 Leather Strips 6 Leather 8 Ingot: Dwarven |  |
| Horse Armor: Dwarven Barding and Saddle | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Ingot: Dwarven | Smelter | 1 | Dwarven Blacksmithing | N/A | Smelter | 1 Any Dwarven scrap metal |  |
| Ingot: Dwarven | Player Crafting | 1 | Dwarven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Dwarven |  |
| Ingot: Dwarven | Player Crafting | 1 | Dwarven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 1 Any Dwarven scrap metal |  |
| Ingot: Dwarven | Player Crafting | 10 | Dwarven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Dwarven |  |
| Ingot: Dwarven | Smelter | 1 | Dwarven Blacksmithing | N/A | Smelter | 20 Fragment: Dwarven |  |
| Ingot: Dwarven | Player Crafting | 5 | Dwarven Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Dwarven |  |
| Ingot: Dwarven | Smelter | 5 | Dwarven Blacksmithing | N/A | Smelter | 100 Fragment: Dwarven |  |
| Ingot: Dwarven | Smelter | 10 | Dwarven Blacksmithing | N/A | Smelter | 200 Fragment: Dwarven |  |
| Keening Replica | Forge | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Dwarven Gyro 1 Ingot: Dwarven | College - Arniels Endeavor  Complete |
| Keening Replica | Player Crafting | 1 | Dwarven Blacksmithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Dwarven Gyro 1 Ingot: Dwarven | College - Arniels Endeavor  Complete |
| Keening Replica | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Visage of Mzund | Armor Table | 1 | Dwarven Blacksmithing | N/A | N/A | 1 Ingot: Dwarven |  |
| Zephyr | Sharpening Wheel | 1 | Dwarven Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Bolt: Dwarven Fireburst | Player Crafting | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Fire Schematic |
| Bolt: Dwarven Fireburst | Forge | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Fire Schematic |
| Bolt: Dwarven Iceburst | Forge | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Ice Schematic |
| Bolt: Dwarven Iceburst | Player Crafting | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Ice Schematic |
| Bolt: Dwarven Shockburst | Player Crafting | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Shock Schematic |
| Bolt: Dwarven Shockburst | Forge | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Shock Schematic |
| Arrow: Stalhrim | Forge | 15 | Stalhrim Smithing | Smiths | Forge | 1 Wood 1 Stalhrim | A New Source of Stalhrim |
| Arrow: Stalhrim | Player Crafting | 15 | Stalhrim Smithing | Smiths | Forge | 1 Wood 1 Stalhrim | A New Source of Stalhrim |
| Bolt: Stalhrim | Player Crafting | 15 | Stalhrim Smithing | Smiths | Forge | 1 Stalhrim | A New Source of Stalhrim |
| Bolt: Stalhrim | Forge | 15 | Stalhrim Smithing | Smiths | Forge | 1 Stalhrim | A New Source of Stalhrim |
| Deathbrand Boots | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Deathbrand Cuirass | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Deathbrand Gauntlets | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Deathbrand Helm | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Battleaxe | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 3 Leather Strips 1 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battleaxe | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 3 Leather Strips 1 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battleaxe | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Battlestaff | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battlestaff | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battlestaff | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Dagger | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 1 Leather Strips 1 Ingot: Galatite 1 Stalhrim | A New Source of Stalhrim |
| Stalhrim Dagger | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 1 Leather Strips 1 Ingot: Galatite 1 Stalhrim | A New Source of Stalhrim |
| Stalhrim Dagger | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Greatsword | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Greatsword | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Greatsword | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Heavy Boots | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Heavy Boots | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Boots | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Crossbow | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Heavy Crossbow | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Crossbow | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Cuirass | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 4 Leather Strips 2 Leather 2 Ingot: Galatite 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Cuirass | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Heavy Cuirass | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 4 Leather Strips 2 Leather 2 Ingot: Galatite 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Gauntlets | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Heavy Gauntlets | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Gauntlets | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 1 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 1 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Light Boots | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Boots | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Light Boots | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Bow | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Hide Lace 1 Stalhrim |  |
| Stalhrim Light Bow | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Bow | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Cuirass | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Light Cuirass | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Cuirass | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Gauntlets | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Gauntlets | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Light Gauntlets | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Helmet | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Helmet | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Light Helmet | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Shield | Armor Table | 1 | Stalhrim Smithing | N/A | N/A | 1 Stalhrim |  |
| Stalhrim Light Shield | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Ingot: Quicksilver 2 Leather Strips 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Shield | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Ingot: Quicksilver 2 Leather Strips 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Mace | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Mace | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Mace | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Sword | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 1 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Sword | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 1 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Sword | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim War Axe | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim War Axe | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 2 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim War Axe | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Warhammer | Forge | 1 | Stalhrim Smithing | Smiths | Forge | 3 Leather Strips 2 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Warhammer | Sharpening Wheel | 1 | Stalhrim Smithing | N/A | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Warhammer | Player Crafting | 1 | Stalhrim Smithing | Smiths | Forge | 3 Leather Strips 2 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Arrow: Orcish | Forge | 15 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Arrow: Orcish | Player Crafting | 15 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Bolt: Orcish | Player Crafting | 15 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Bolt: Orcish | Forge | 15 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Bouncer | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Fragment: Orichalcum | Breakdown | 20 | Orcish Blacksmithing | N/A | N/A | 1 Ingot: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 5 | Orcish Blacksmithing | N/A | Smelter | 100 Fragment: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 10 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 30 Ore: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 10 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 50 Ore: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 10 | Orcish Blacksmithing | N/A | Smelter | 200 Fragment: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 5 | Orcish Blacksmithing | N/A | Smelter | 25 Ore: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 5 | Orcish Blacksmithing | N/A | Smelter | 15 Ore: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 1 | Orcish Blacksmithing | N/A | Smelter | 3 Ore: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 10 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 200 Fragment: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 5 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 100 Fragment: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 5 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 25 Ore: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 1 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 20 Fragment: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 1 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 3 Ore: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 1 | Orcish Blacksmithing | N/A | Smelter | 5 Ore: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 1 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 5 Ore: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 1 | Orcish Blacksmithing | N/A | Smelter | 20 Fragment: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 10 | Orcish Blacksmithing | N/A | Smelter | 50 Ore: Orichalcum |  |
| Ingot: Orichalcum | Smelter | 10 | Orcish Blacksmithing | N/A | Smelter | 30 Ore: Orichalcum |  |
| Ingot: Orichalcum | Player Crafting | 5 | Orcish Blacksmithing | Builders,Jewelers,Smiths,Thieves | Smelter | 15 Ore: Orichalcum |  |
| Orcish Battleaxe | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Battleaxe | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Battleaxe | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Boots | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Boots | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Boots | Armor Table | 1 | Orcish Blacksmithing | N/A | N/A | 1 Ingot: Orichalcum |  |
| Orcish Cuirass | Armor Table | 1 | Orcish Blacksmithing | N/A | N/A | 1 Ingot: Orichalcum |  |
| Orcish Cuirass | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Corundum 5 Ingot: Orichalcum 4 Leather Strips 2 Leather |  |
| Orcish Cuirass | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Corundum 5 Ingot: Orichalcum 4 Leather Strips 2 Leather |  |
| Orcish Dagger | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Dagger | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Dagger | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Gauntlets | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Gauntlets | Armor Table | 1 | Orcish Blacksmithing | N/A | N/A | 1 Ingot: Orichalcum |  |
| Orcish Gauntlets | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 2 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Greatsword | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Greatsword | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Greatsword | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Heavy Bow | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Bow | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Bow | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Helmet | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 1 Leather Strips 1 Leather |  |
| Orcish Helmet | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 1 Leather Strips 1 Leather |  |
| Orcish Helmet | Armor Table | 1 | Orcish Blacksmithing | N/A | N/A | 1 Ingot: Orichalcum |  |
| Orcish Hunting Knife | Forge | 1 | Orcish Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips 1 Fragment: Bone |  |
| Orcish Hunting Knife | Player Crafting | 1 | Orcish Blacksmithing | Smiths,Survivalists | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips 1 Fragment: Bone |  |
| Orcish Mace | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Mace | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Mace | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 4 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Corundum 4 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | Armor Table | 1 | Orcish Blacksmithing | N/A | N/A | 1 Ingot: Orichalcum |  |
| Orcish Sword | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Sword | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Sword | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish War Axe | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish War Axe | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish War Axe | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Warhammer | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Warhammer | Forge | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Steel 4 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Warhammer | Player Crafting | 1 | Orcish Blacksmithing | Smiths | Forge | 2 Ingot: Steel 4 Ingot: Orichalcum 3 Leather Strips |  |
| Orichalc Amber Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Amber 1 Orichalc Circlet |  |
| Orichalc Amethyst Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst 1 Orichalc Circlet |  |
| Orichalc Amethyst Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Orichalc Circlet |  |
| Orichalc Aquamarine Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine 1 Orichalc Circlet |  |
| Orichalc Aquamarine Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Orichalc Circlet |  |
| Orichalc Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Orichalcum |  |
| Orichalc Circlet | Forge | 1 | Orcish Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Orichalcum |  |
| Orichalc Diamond Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Diamond 1 Orichalc Circlet |  |
| Orichalc Diamond Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Orichalc Circlet |  |
| Orichalc Emerald Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Emerald 1 Orichalc Circlet |  |
| Orichalc Emerald Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Orichalc Circlet |  |
| Orichalc Garnet Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Garnet 1 Orichalc Circlet |  |
| Orichalc Garnet Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Orichalc Circlet |  |
| Orichalc Onyx Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Onyx 1 Orichalc Circlet |  |
| Orichalc Opal Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Opal 1 Orichalc Circlet |  |
| Orichalc Peridot Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Peridot 1 Orichalc Circlet |  |
| Orichalc Peridot Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Orichalc Circlet |  |
| Orichalc Ruby Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Ruby 1 Orichalc Circlet |  |
| Orichalc Ruby Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Orichalc Circlet |  |
| Orichalc Sapphire Circlet | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire 1 Orichalc Circlet |  |
| Orichalc Sapphire Circlet (Flawless) | Player Crafting | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Orichalc Circlet |  |
| The Longhammer | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| The Warhammer of Inebriation | Sharpening Wheel | 1 | Orcish Blacksmithing | N/A | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Spellbreaker Replica | Forge | 1 | Orcish Blacksmithing,Advanced Blacksmithing | Smiths | Forge | 1 Soul Gem: Grand 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Dwarven 2 Ingot: Calcinium | Daedra - The Only Cure Complete |
| Spellbreaker Replica | Player Crafting | 1 | Orcish Blacksmithing,Advanced Blacksmithing | Smiths | Forge | 1 Soul Gem: Grand 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Dwarven 2 Ingot: Calcinium | Daedra - The Only Cure Complete |
| Snowberry Extract | Cook pot | 1 | Alchemical Lore 1 | Survivalists,Alchemists | Cook pot | 20 Snowberries | Animal Harvesting Skill Greater or Equal to 1 |
| Snowberry Extract | Player Crafting | 1 | Alchemical Lore 1 | Survivalists,Alchemists | N/A | 20 Snowberries | Animal Harvesting Skill Greater or Equal to 1 |
| Bolt: Steel Fire | Player Crafting | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Steel |  |
| Bolt: Steel Fire | Forge | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Steel |  |
| Bolt: Steel Ice | Player Crafting | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Steel |  |
| Bolt: Steel Ice | Forge | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Steel |  |
| Bolt: Steel Shock | Player Crafting | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Steel |  |
| Bolt: Steel Shock | Forge | 15 | Arcane Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Steel |  |
| Ghostblade | Sharpening Wheel | 1 | Arcane Craftsmanship | N/A | Sharpening Wheel | 1 Ectoplasm |  |
| Unenchanted Forsworn Staff | Player Crafting | 1 | Arcane Craftsmanship | Alchemists | Staff Enchanter | 1 Hagraven Feathers 6 Sabre Cat Tooth 3 Wood 4 Leather Strips 2 Hawk Beak |  |
| Unenchanted Forsworn Staff | Staff Enchanter | 1 | Arcane Craftsmanship | N/A | Staff Enchanter | 1 Hagraven Feathers 6 Sabre Cat Tooth 3 Wood 4 Leather Strips 2 Hawk Beak |  |
| Unenchanted Staff of Alteration | Player Crafting | 1 | Arcane Craftsmanship | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Alteration | Staff Enchanter | 1 | Arcane Craftsmanship | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Conjuration | Staff Enchanter | 1 | Arcane Craftsmanship | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Conjuration | Player Crafting | 1 | Arcane Craftsmanship | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Destruction | Staff Enchanter | 1 | Arcane Craftsmanship | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Destruction | Player Crafting | 1 | Arcane Craftsmanship | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Illusion | Player Crafting | 1 | Arcane Craftsmanship | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Illusion | Staff Enchanter | 1 | Arcane Craftsmanship | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Restoration | Player Crafting | 1 | Arcane Craftsmanship | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Restoration | Staff Enchanter | 1 | Arcane Craftsmanship | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Arrow: Iron Ice | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Frost Salts |  |
| Arrow: Iron Ice | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Frost Salts |  |
| Arrow: Iron Shock | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Void Salts |  |
| Arrow: Iron Shock | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Iron 1 Void Salts |  |
| Arrow: Silver Fire | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Arrow: Silver |  |
| Arrow: Silver Fire | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Arrow: Silver |  |
| Arrow: Silver Ice | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Arrow: Silver |  |
| Arrow: Silver Ice | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Arrow: Silver |  |
| Arrow: Silver Shock | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Void Salts 15 Arrow: Silver |  |
| Arrow: Silver Shock | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Void Salts 15 Arrow: Silver |  |
| Arrow: Steel Fire | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Fire Salts |  |
| Arrow: Steel Fire | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Fire Salts |  |
| Arrow: Steel Ice | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Frost Salts |  |
| Arrow: Steel Ice | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Frost Salts |  |
| Arrow: Steel Shock | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Void Salts |  |
| Arrow: Steel Shock | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 15 Arrow: Steel 1 Void Salts |  |
| Bolt: Silver Fire | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Silver |  |
| Bolt: Silver Fire | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Fire Salts 15 Bolt: Silver |  |
| Bolt: Silver Ice | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Silver |  |
| Bolt: Silver Ice | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Frost Salts 15 Bolt: Silver |  |
| Bolt: Silver Shock | Forge | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Silver |  |
| Bolt: Silver Shock | Player Crafting | 15 | Arcane Craftsmanship,Craftsmanship | Smiths | Forge | 1 Void Salts 15 Bolt: Silver |  |
| Bolt: Ancient Nordic Hero Fire | Forge | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Fire | Player Crafting | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Frost | Forge | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Frost | Player Crafting | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Shock | Player Crafting | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Shock | Forge | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Thieves Guild Fire | Player Crafting | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Fire | Forge | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Frost | Player Crafting | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Frost | Forge | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Shock | Forge | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Shock | Player Crafting | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Thieves Guild |  |
| Arrow: Elven Fire | Forge | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Fire Salts |  |
| Arrow: Elven Fire | Player Crafting | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Fire Salts |  |
| Arrow: Elven Ice | Forge | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Frost Salts |  |
| Arrow: Elven Ice | Player Crafting | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Frost Salts |  |
| Arrow: Elven Shock | Forge | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Void Salts |  |
| Arrow: Elven Shock | Player Crafting | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 15 Arrow: Elven 1 Void Salts |  |
| Bolt: Elven Fire | Forge | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Elven |  |
| Bolt: Elven Fire | Player Crafting | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Elven |  |
| Bolt: Elven Ice | Forge | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Elven |  |
| Bolt: Elven Ice | Player Crafting | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Elven |  |
| Bolt: Elven Shock | Player Crafting | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Elven |  |
| Bolt: Elven Shock | Forge | 15 | Arcane Craftsmanship,Elven Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Elven |  |
| Arrow: Ebony Fire | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Fire Salts |  |
| Arrow: Ebony Fire | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Fire Salts |  |
| Arrow: Ebony Ice | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Frost Salts |  |
| Arrow: Ebony Ice | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Frost Salts |  |
| Arrow: Ebony Shock | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Void Salts |  |
| Arrow: Ebony Shock | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 15 Arrow: Ebony 1 Void Salts |  |
| Bolt: Dark Brotherhood Fire | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Fire | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Frost | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Frost | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Shock | Forge | 25 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Shock | Player Crafting | 25 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Ebony Fire | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Fire | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Ice | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Ice | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Shock | Player Crafting | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Shock | Forge | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Ebony |  |
| Arrow: Glass Fire | Player Crafting | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Fire Salts |  |
| Arrow: Glass Fire | Forge | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Fire Salts |  |
| Arrow: Glass Ice | Forge | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Frost Salts |  |
| Arrow: Glass Ice | Player Crafting | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Frost Salts |  |
| Arrow: Glass Shock | Player Crafting | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Void Salts |  |
| Arrow: Glass Shock | Forge | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 15 Arrow: Glass 1 Void Salts |  |
| Bolt: Glass Fire | Player Crafting | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Glass |  |
| Bolt: Glass Fire | Forge | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Glass |  |
| Bolt: Glass Ice | Player Crafting | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Glass |  |
| Bolt: Glass Ice | Forge | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Glass |  |
| Bolt: Glass Shock | Player Crafting | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Glass |  |
| Bolt: Glass Shock | Forge | 15 | Arcane Craftsmanship,Glass Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Glass |  |
| Arrow: Nordic Fire | Player Crafting | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Fire | Forge | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Frost | Player Crafting | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Frost | Forge | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Shock | Forge | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Shock | Player Crafting | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Arrow: Nordic |  |
| Arrow: Dragonbone Fire | Forge | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Fire | Player Crafting | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Ice | Forge | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Ice | Player Crafting | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Shock | Player Crafting | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Shock | Forge | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Arrow: Dragonbone |  |
| Bolt: Dragonbone Fire | Player Crafting | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Fire | Forge | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Ice | Player Crafting | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Ice | Forge | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Shock | Player Crafting | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Shock | Forge | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dragonbone |  |
| Arrow: Daedric Fire | Forge | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Fire Salts |  |
| Arrow: Daedric Fire | Player Crafting | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Fire Salts |  |
| Arrow: Daedric Ice | Player Crafting | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Frost Salts |  |
| Arrow: Daedric Ice | Forge | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Frost Salts |  |
| Arrow: Daedric Shock | Forge | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Void Salts |  |
| Arrow: Daedric Shock | Player Crafting | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 15 Arrow: Daedric 1 Void Salts |  |
| Bolt: Daedric Fire | Player Crafting | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Fire | Forge | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Ice | Player Crafting | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Ice | Forge | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Shock | Forge | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Void Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Shock | Player Crafting | 15 | Arcane Craftsmanship,Daedric Smithing | Smiths | Forge | 1 Void Salts 15 Bolt: Daedric |  |
| Arrow: Dwarven Fire | Forge | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Fire Salts |  |
| Arrow: Dwarven Fire | Player Crafting | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Fire Salts |  |
| Arrow: Dwarven Ice | Player Crafting | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Frost Salts |  |
| Arrow: Dwarven Ice | Forge | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Frost Salts |  |
| Arrow: Dwarven Shock | Forge | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Void Salts |  |
| Arrow: Dwarven Shock | Player Crafting | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 15 Arrow: Dwarven 1 Void Salts |  |
| Bolt: Dwarven Fire | Player Crafting | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Fire | Forge | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Ice | Forge | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Ice | Player Crafting | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Shock | Forge | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Shock | Player Crafting | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Dwarven |  |
| Arrow: Stalhrim Fire | Forge | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Fire | Player Crafting | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Fire Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Frost | Player Crafting | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Frost | Forge | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Frost Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Shock | Forge | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Void Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Shock | Player Crafting | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Void Salts 15 Arrow: Stalhrim |  |
| Bolt: Stalhrim Fire | Forge | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Fire | Player Crafting | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Frost | Player Crafting | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Frost | Forge | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Shock | Forge | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Void Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Shock | Player Crafting | 15 | Arcane Craftsmanship,Stalhrim Smithing | Smiths | Forge | 1 Void Salts 15 Bolt: Stalhrim |  |
| Arrow: Orcish Fire | Forge | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Fire Salts |  |
| Arrow: Orcish Fire | Player Crafting | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Fire Salts |  |
| Arrow: Orcish Ice | Player Crafting | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Frost Salts |  |
| Arrow: Orcish Ice | Forge | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Frost Salts |  |
| Arrow: Orcish Shock | Forge | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Void Salts |  |
| Arrow: Orcish Shock | Player Crafting | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 15 Arrow: Orcish 1 Void Salts |  |
| Bolt: Orcish Fire | Forge | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Fire | Player Crafting | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Fire Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Ice | Forge | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Ice | Player Crafting | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Frost Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Shock | Forge | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Shock | Player Crafting | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Smiths | Forge | 1 Void Salts 15 Bolt: Orcish |  |
| Stalhrim Staff of Paralysis | Player Crafting | 1 | Artificer's Insight | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of Paralysis | Staff Enchanter | 1 | Artificer's Insight | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Frost Atronach | Player Crafting | 1 | Artificer's Insight | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Frost Atronach | Staff Enchanter | 1 | Artificer's Insight | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Storm Atronach | Staff Enchanter | 1 | Artificer's Insight | N/A | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Storm Atronach | Player Crafting | 1 | Artificer's Insight | Alchemists | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Soul Gem: Black | Player Crafting | 1 | Soul Gem Mastery | Alchemists | N/A | 1 Soul Gem: Grand 1 Human Skull | Between 11pm -  Midnight, Must be Carrying Necromacers Amulet.  must have 100+ Enchanting skill |
| Soul Gem: Common | Player Crafting | 1 | Soul Gem Mastery | Alchemists | N/A | 1 Ingot: Moonstone 1 Ingot: Quicksilver |  |
| Soul Gem: Grand | Player Crafting | 1 | Soul Gem Mastery | Alchemists | N/A | 3 Ingot: Moonstone 3 Ingot: Quicksilver |  |
| Soul Gem: Greater | Player Crafting | 1 | Soul Gem Mastery | Alchemists | N/A | 2 Ingot: Moonstone 2 Ingot: Quicksilver |  |
| Soul Gem: Lesser | Player Crafting | 2 | Soul Gem Mastery | Alchemists | N/A | 1 Ingot: Moonstone 1 Ingot: Quicksilver |  |
| Soul Gem: Petty | Player Crafting | 4 | Soul Gem Mastery | Alchemists | N/A | 1 Ingot: Moonstone 1 Ingot: Quicksilver |  |
| Throwable Flame Powder | Player Crafting | 3 | Alchemical Lore 2 | Alchemists | N/A | 1 Fire Salts 1 Dwarven Oil |  |
| Throwable Frost Powder | Player Crafting | 3 | Alchemical Lore 2 | Alchemists | N/A | 1 Frost Salts 1 Dwarven Oil |  |
| Throwable Shock Powder | Player Crafting | 3 | Alchemical Lore 2 | Alchemists | N/A | 1 Void Salts 1 Dwarven Oil |  |
| Portable Enchanting Supplies | Player Crafting | 1 | Enchanter's Insight | Survivalists,Alchemists | N/A | 1 Troll Skull 4 Spriggan Sap 1 Gem: Amethyst (Flawless) |  |
| Staff of Banishing | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Banishing | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Calm | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Calm | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Chain Lightning | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Chain Lightning | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Courage | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Illusion 1 Heart Stone |  |
| Staff of Courage | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Illusion 1 Heart Stone |  |
| Staff of Daedric Command | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Daedric Command | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Dread Zombies | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Dread Zombies | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Expulsion | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Expulsion | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Fear | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Fear | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Fireballs | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Fireballs | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Firebolts | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Firebolts | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Flames | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Flames | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Frenzy | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Frenzy | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Frostbite | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Frostbite | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Fury | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Fury | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Grand Turning | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Grand Turning | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Heal Other | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Heal Other | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Ice Spikes | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Ice Spikes | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Ice Storms | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Ice Storms | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Icy Spears | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Icy Spears | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Incineration | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Incineration | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Inspiration | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Inspiration | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Lightning Bolts | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Lightning Bolts | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Magelight | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Alteration 2 Heart Stone |  |
| Staff of Magelight | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Alteration 2 Heart Stone |  |
| Staff of Minor Turning | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of Minor Turning | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of Paralysis | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Alteration 4 Heart Stone |  |
| Staff of Paralysis | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Alteration 4 Heart Stone |  |
| Staff of Reanimation | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Reanimation | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Repulsion | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Repulsion | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Repulsion | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Repulsion | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Revenants | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Revenants | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Soul Trapping | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Soul Trapping | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Sparks | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Sparks | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of the Flame Atronach | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of the Flame Atronach | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of the Flame Wall | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Flame Wall | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Frost Atronach | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of the Frost Atronach | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of the Frost Wall | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Frost Wall | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Healing Hand | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of the Healing Hand | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of the Spirit Wolf | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of the Spirit Wolf | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of the Storm Atronach | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of the Storm Atronach | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of the Storm Wall | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Storm Wall | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Thunderbolts | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Thunderbolts | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Turning | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Turning | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Vanquishing | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Illusion 4 Heart Stone |  |
| Staff of Vanquishing | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Illusion 4 Heart Stone |  |
| Staff of Zombies | Staff Enchanter | 1 | Enchanter's Insight | N/A | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of Zombies | Player Crafting | 1 | Enchanter's Insight | Alchemists | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Lockpick | Player Crafting | 1 | Cheap Tricks,Craftsmanship | Smiths,Thieves,Survivalists | Forge | 4 Fragment: Iron |  |
| Lockpick | Forge | 5 | Cheap Tricks,Craftsmanship | Smiths,Thieves,Survivalists | Forge | 1 Ingot: Iron |  |
| Lockpick | Forge | 1 | Cheap Tricks,Craftsmanship | Smiths,Thieves,Survivalists | Forge | 4 Fragment: Iron |  |
| Lockpick | Player Crafting | 5 | Cheap Tricks,Craftsmanship | Smiths,Thieves,Survivalists | Forge | 1 Ingot: Iron |  |

</div>
