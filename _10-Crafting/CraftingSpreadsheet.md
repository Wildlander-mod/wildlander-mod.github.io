---
title: Crafting Spreadsheet
layout: default
nav_order: 8
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
$(document).ready(function(){
  initAllRecipesFilters();
  initAllRecipesTooltips();
});

function initAllRecipesFilters() {
  const workbenches = new Set();
  const table = document.querySelector('.allrecipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const workbenchCell = row.querySelector('td:nth-child(4)');
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
  
  document.getElementById('allrecipesSearch').addEventListener('keyup', filterAllRecipesTable);
  select.addEventListener('change', filterAllRecipesTable);
  document.getElementById('allrecipesClearFilters').addEventListener('click', clearAllRecipesFilters);
}

function filterAllRecipesTable() {
  const searchTerm = document.getElementById('allrecipesSearch').value.toLowerCase();
  const workbenchFilter = document.getElementById('allrecipesWorkbenchFilter').value;
  
  const table = document.querySelector('.allrecipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[4]?.textContent.toLowerCase() || '';
    const workbench = cells[3]?.textContent.trim() || '';
    
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const filterMatch = !workbenchFilter || workbench === workbenchFilter;
    
    const isVisible = searchMatch && filterMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateAllRecipesFilterCount(visibleCount, rows.length);
  initAllRecipesTooltips();
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
  
  const table = document.querySelector('.allrecipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  rows.forEach(row => row.style.display = '');
  
  updateAllRecipesFilterCount(rows.length, rows.length);
  initAllRecipesTooltips();
}

function initAllRecipesTooltips() {
  const table = document.querySelector('.allrecipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    if (row.style.display === 'none') return;
    
    const itemCell = row.querySelector('td:first-child');
    if (!itemCell) return;
    
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showAllRecipesTooltip(e, row));
    itemCell.addEventListener('mousemove', updateAllRecipesTooltipPosition);
    itemCell.addEventListener('mouseleave', hideAllRecipesTooltip);
  });
}

function showAllRecipesTooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    qtyMade: cells[1]?.textContent || '',
    perksNeeded: cells[2]?.textContent || '',
    proximity: cells[3]?.textContent || '',
    itemsRequired: cells[4]?.textContent || '',
    additionalReqs: cells[5]?.textContent || ''
  };
  
  let tooltip = document.getElementById('allrecipes-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'allrecipes-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    tooltip.style.backgroundColor = '#222222';
    tooltip.style.color = '#e6e6e6';
    tooltip.style.border = '2px solid #50098a';
    tooltip.style.borderRadius = '4px';
    tooltip.style.padding = '10px';
    tooltip.style.maxWidth = '400px';
    tooltip.style.boxShadow = '0 4px 6px rgba(0,0,0,0.3)';
    tooltip.style.fontSize = '12px';
    tooltip.style.lineHeight = '1.4';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong style="color: #f77ef1;">Item:</strong> ${data.itemName}</div>
    <div><strong style="color: #f77ef1;">Qty:</strong> ${data.qtyMade || 'N/A'}</div>
    <div><strong style="color: #f77ef1;">Perks:</strong> ${data.perksNeeded || 'None'}</div>
    <div><strong style="color: #f77ef1;">Workbench:</strong> ${data.proximity}</div>
    <div style="margin-top: 8px; border-top: 1px solid #50098a; padding-top: 8px;">
      <strong style="color: #f77ef1;">Ingredients:</strong><br/>
      ${data.itemsRequired}
    </div>
    ${data.additionalReqs ? `<div style="margin-top: 8px; color: #f77ef1;"><strong>Requirements:</strong><br/>${data.additionalReqs}</div>` : ''}
  `;
  tooltip.style.display = 'block';
  updateAllRecipesTooltipPosition(event);
}

function updateAllRecipesTooltipPosition(event) {
  const tooltip = document.getElementById('allrecipes-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideAllRecipesTooltip() {
  const tooltip = document.getElementById('allrecipes-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}
</script>

<div class="allrecipes-controls">
  <input type="text" id="allrecipesSearch" placeholder="Search by item name or ingredients..." />
  <select id="allrecipesWorkbenchFilter">
    <option value="">All Workbenches</option>
  </select>
  <button onclick="clearAllRecipesFilters()">Clear Filters</button>
</div>
<div class="allrecipes-filter-result-count" id="allrecipesFilterResultCount">Showing 6186 of 6186 recipes</div>

<div class="allrecipes-table" markdown="1">

| Item Name | Qty Made | Perks Needed | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---:|:---|:---|
| Aetherial Crown | 1 |  | Aetherium Forge | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherial Crown | 1 |  | Aetherium Forge | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Shield | 1 |  | Aetherium Forge | 2 Ingot: Malachite 4 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Shield | 1 |  | Aetherium Forge | 2 Ingot: Malachite 4 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherial Staff | 1 |  | Aetherium Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Staff | 1 |  | Aetherium Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Alchemist's Crown | 1 |  | Forge | 1 Infused Ingot 3 Rubyluce |  |
| Alchemist's Crown | 1 |  | Forge | 1 Infused Ingot 3 Rubyluce |  |
| Ale | 2 |  | Brewing Barrel | 4 Wheat |  |
| Ale | 2 |  | Brewing Barrel | 4 Wheat |  |
| Ale Braised Sabre Cat | 1 |  | Cook pot | 1 Ale 1 Raw Sabre Cat Meat |  |
| Ale Braised Sabre Cat | 1 |  | Cook pot | 1 Ale 1 Raw Sabre Cat Meat |  |
| Apple Cabbage Stew | 1 |  | Cook pot | 1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water) |  |
| Apple Cabbage Stew | 1 |  | Cook pot | 1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water) |  |
| Apple Dumpling | 4 |  | Oven | 2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter |  |
| Apple Dumpling | 4 |  | Oven | 2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter |  |
| Apple Pie | 1 |  | Oven | 1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter |  |
| Apple Pie | 1 |  | Oven | 1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter |  |
| Ashfire Mead | 2 |  | Brewing Barrel | 1 Juniper Berries 1 Honey 1 Ashen Grass Pod | Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete |
| Ashfire Mead | 2 |  | Brewing Barrel | 1 Juniper Berries 1 Honey 1 Ashen Grass Pod | Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Black |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Black |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Black |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Black |  |
| Barrel | 2 |  | Furniture Workbench | 5 Wood 1 Iron Nails |  || Aetherial Crown | 1 |  | Aetherium Forge | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherial Crown | 1 |  | Aetherium Forge | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Shield | 1 |  | Aetherium Forge | 2 Ingot: Malachite 4 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Shield | 1 |  | Aetherium Forge | 2 Ingot: Malachite 4 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherial Staff | 1 |  | Aetherium Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherial Staff | 1 |  | Aetherium Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Alchemist's Crown | 1 |  | Forge | 1 Infused Ingot 3 Rubyluce |  |
| Alchemist's Crown | 1 |  | Forge | 1 Infused Ingot 3 Rubyluce |  |
| Ale | 2 |  | Brewing Barrel | 4 Wheat |  |
| Ale | 2 |  | Brewing Barrel | 4 Wheat |  |
| Ale Braised Sabre Cat | 1 |  | Cook pot | 1 Ale 1 Raw Sabre Cat Meat |  |
| Ale Braised Sabre Cat | 1 |  | Cook pot | 1 Ale 1 Raw Sabre Cat Meat |  |
| Apple Cabbage Stew | 1 |  | Cook pot | 1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water) |  |
| Apple Cabbage Stew | 1 |  | Cook pot | 1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water) |  |
| Apple Dumpling | 4 |  | Oven | 2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter |  |
| Apple Dumpling | 4 |  | Oven | 2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter |  |
| Apple Pie | 1 |  | Oven | 1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter |  |
| Apple Pie | 1 |  | Oven | 1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter |  |
| Ashfire Mead | 2 |  | Brewing Barrel | 1 Juniper Berries 1 Honey 1 Ashen Grass Pod | Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete |
| Ashfire Mead | 2 |  | Brewing Barrel | 1 Juniper Berries 1 Honey 1 Ashen Grass Pod | Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Black |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Black |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Tan |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Black |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Indigo |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Orange |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Grey |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Purple |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Red |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Blue |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth |  |
| Bandage | 1 |  | N/A | 1 Cotton Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Yellow |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Green |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Brown |  |
| Bandage | 1 |  | N/A | 1 Linen Cloth - Black |  |
| Barrel | 2 |  | Furniture Workbench | 5 Wood 1 Iron Nails |  |
| Bear and Bear Chowder | 2 |  | Cook pot | 1 Ale 1 Goat Cheese Slice 1 Blue Mountain Flower 1 Bottled Milk 1 Raw Bear Meat |  |
| Bear and Bear Chowder | 2 |  | Cook pot | 1 Ale 1 Goat Cheese Slice 1 Blue Mountain Flower 1 Bottled Milk 1 Raw Bear Meat |  |
| Bear Carrot Stew | 2 |  | Cook pot | 1 Carrot 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Bear Carrot Stew | 2 |  | Cook pot | 1 Carrot 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Bear Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Bear Meat |  |
| Bear Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Bear Meat |  |
| Beef Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Beef |  |
| Beef Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Beef |  |
| Beef Stew | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Carrot 1 Raw Beef 1 Glass Bottle (Water) |  |
| Beef Stew | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Carrot 1 Raw Beef 1 Glass Bottle (Water) |  |
| Beggar's Broth | 2 |  | Cook pot | 1 Raw Horse Meat 2 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Beggar's Broth | 2 |  | Cook pot | 1 Raw Horse Meat 2 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Bestial Stew | 1 |  | Cook pot | 1 Raw Salmon Steak 1 Bottled Milk 1 Wolf Heart 3 Raw Wolf Meat |  |
| Bestial Stew | 1 |  | Cook pot | 1 Raw Salmon Steak 1 Bottled Milk 1 Wolf Heart 3 Raw Wolf Meat |  |
| Black-Briar Reserve | 2 |  | Brewing Barrel | 4 Wheat |  |
| Black-Briar Reserve | 2 |  | Brewing Barrel | 4 Wheat |  |
| Blood of the Hunt (Strange Brew) | 1 |  | Cook pot | 1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart | Brewing Skill Greater or Equal to 2 |
| Blood of the Hunt (Strange Brew) | 1 |  | Cook pot | 1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart | Brewing Skill Greater or Equal to 2 |
| Bloody Rags | 2 |  | N/A | 1 Linen Tunic - Belted Black, Bloody |  |
| Boar Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Boar Meat |  |
| Boar Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Boar Meat |  |
| Boar Leek Stew | 2 |  | Cook pot | 1 Leek 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boar Leek Stew | 2 |  | Cook pot | 1 Leek 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boar Potato Stew | 2 |  | Cook pot | 1 Potato 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boar Potato Stew | 2 |  | Cook pot | 1 Potato 1 Raw Boar Meat 1 Glass Bottle (Water) |  |
| Boiled Cabbage and Mammoth | 2 |  | Cook pot | 1 Cabbage 1 Raw Mammoth Meat |  |
| Boiled Cabbage and Mammoth | 2 |  | Cook pot | 1 Cabbage 1 Raw Mammoth Meat |  |
| Boiled Skeever Tail | 1 |  | N/A | 1 Skeever Tail | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Beaver Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Buck Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Flower Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Harvest Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Hunter's Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Long Night | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Pink Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Snow Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Strawberry Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Sturgeon Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Wolf Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Worm Moon | 1 |  | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Divining Knife | 1 |  | N/A | 1 Leather Strips 3 Fragment: Bone | Animal Harvesting Skill Greater or Equal to 3 |
| Bone Hawk Claw | 3 |  | N/A | 1 Bone Hawk Ring |  |
| Bone Hawk Feathers | 6 |  | N/A | 1 Bone Hawk Amulet |  |
| Bone Hunting Knife | 1 |  | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Idol of the Elm Rite (Strange Brew) | 1 |  | N/A | 1 Elm Ritual Bone | Animal Harvesting Skill Greater or Equal to 7 |
| Bone Idol of the Oak Rite (Strange Brew) | 1 |  | N/A | 1 Oak Ritual Bone | Animal Harvesting Skill Greater or Equal to 9 |
| Bone Idol of the Yew Rite (Strange Brew) | 1 |  | N/A | 1 Yew Ritual Bone | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Jagged Ring | 1 |  | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Lucky Ring | 1 |  | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Masterwork Sword | 1 |  | N/A | 2 Hawk Feathers 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Masterwork War Axe | 1 |  | N/A | 2 Hide Lace 3 Wolf Claws 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 3 |
| Bone Meal | 1 |  | N/A | 3 Fragment: Bone | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Ring of the Elm Rite | 1 |  | N/A | 1 Strange Bear Claw | Animal Harvesting Skill Greater or Equal to 7 |
| Bone Ring of the Oak Rite | 1 |  | N/A | 1 Strange Cat Claw | Animal Harvesting Skill Greater or Equal to 9 |
| Bone Ring of the Yew Rite | 1 |  | N/A | 1 Strange Wolf Claw | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Silvered Ring (Strange Brew) | 1 |  | Forge | 1 Animal Bone (Small) 8 Fragment: Silver | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 2 |
| Bone Silvered Ring (Strange Brew) | 1 |  | Forge | 1 Animal Bone (Small) 8 Fragment: Silver | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 2 |
| Bone Smooth Ring | 1 |  | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Staff | 1 |  | N/A | 2 Leather Strips 1 Animal Bone (Large) 2 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 4 |
| Bone Sword | 1 |  | N/A | 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Thorned Ring | 1 |  | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone War Axe | 1 |  | N/A | 2 Leather Strips 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 1 |
| Bonesap | 1 |  | N/A | 1 Bone Meal 1 Spriggan Sap | Animal Harvesting Skill Greater or Equal to 3 |
| Braided Bread | 1 |  | Oven | 1 Salt 2 Flour 1 Glass Bottle (Water) |  |
| Braided Bread | 1 |  | Oven | 1 Salt 2 Flour 1 Glass Bottle (Water) |  |
| Bread Loaf | 1 |  | Oven | 1 Salt 1 Flour 1 Glass Bottle (Water) |  |
| Bread Loaf | 1 |  | Oven | 1 Salt 1 Flour 1 Glass Bottle (Water) |  |
| Breaded Elk Cutlet | 2 |  | Cook pot | 1 Chicken's Egg 1 Bread Loaf 1 Raw Elk Meat |  |
| Breaded Elk Cutlet | 2 |  | Cook pot | 1 Chicken's Egg 1 Bread Loaf 1 Raw Elk Meat |  |
| Butter | 1 |  | Butter Churn | 1 Bottled Milk |  |
| Butter | 1 |  | Butter Churn | 1 Bottled Milk |  |
| Cabbage Potato Soup | 1 |  | Cook pot | 1 Salt 1 Cabbage 1 Potato 1 Leek 1 Glass Bottle (Water) |  |
| Cabbage Potato Soup | 1 |  | Cook pot | 1 Salt 1 Cabbage 1 Potato 1 Leek 1 Glass Bottle (Water) |  |
| Cabbage Soup | 1 |  | Cook pot | 1 Salt 1 Cabbage 1 Glass Bottle (Water) |  |
| Cabbage Soup | 1 |  | Cook pot | 1 Salt 1 Cabbage 1 Glass Bottle (Water) |  |
| Charcoal | 1 |  | Smelter | 1 Arrow: Practice |  |
| Charcoal | 5 |  | Smelter | 1 Toolkit: Tailor's |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Broom |  |
| Charcoal | 3 |  | N/A | 1 Forsworn Sword |  |
| Charcoal | 5 |  | Smelter | 1 Toolkit: Brewer's |  |
| Charcoal | 2 |  | Smelter | 1 Wooden Bellows |  |
| Charcoal | 2 |  | Smelter | 1 Wooden Heavy Bow |  |
| Charcoal | 3 |  | N/A | 1 Forsworn Light Bow |  |
| Charcoal | 2 |  | Smelter | 1 Wooden Well Bucket |  |
| Charcoal | 2 |  | Smelter | 1 Wooden Roped Bucket |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Spigot |  |
| Charcoal | 5 |  | N/A | 1 Forsworn War Axe |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Drum |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Torch (Bright) |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Flute |  |
| Charcoal | 3 |  | N/A | 1 Iron Woodcutter's Axe |  |
| Charcoal | 5 |  | Smelter | 1 Toolkit: Survivalist's |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Bowl |  |
| Charcoal | 1 |  | N/A | 1 Wooden Sword |  |
| Charcoal | 3 |  | Smelter | 1 Iron Pickaxe |  |
| Charcoal | 2 |  | Smelter | 1 Wooden Lute |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Pitchfork |  |
| Charcoal | 1 |  | N/A | 1 Imperial Heavy Bow |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Ladle |  |
| Charcoal | 2 |  | Smelter | 1 Wooden Light Bow |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Plate |  |
| Charcoal | 5 |  | Smelter | 1 Toolkit: Alchemist's |  |
| Charcoal | 1 |  | Smelter | 1 Iron Pitchfork |  |
| Charcoal | 1 |  | Smelter | 1 Wooden Torch |  |
| Charcoal | 2 |  | Smelter | 1 Wooden Fishing Rod |  |
| Charred Hawk Beak | 1 |  | N/A | 1 Hawk Beak |  |
| Charred Skeever Hide | 1 |  | N/A | 1 Pelt: Skeever (Poor) |  |
| Chaurus Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Chaurus Meat |  |
| Chaurus Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Chaurus Meat |  |
| Chaurus Pie | 1 |  | Oven | 2 Salt 1 Red Apple 1 Carrot 1 Potato 1 Tomato 1 Honeycomb 1 Raw Chaurus Meat |  |
| Chaurus Pie | 1 |  | Oven | 2 Salt 1 Red Apple 1 Carrot 1 Potato 1 Tomato 1 Honeycomb 1 Raw Chaurus Meat |  |
| Chaurus Venom (Good) | 1 |  | Cook pot | 2 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 2 |
| Chaurus Venom (Good) | 1 |  | Cook pot | 2 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 2 |
| Chaurus Venom (Great) | 1 |  | Cook pot | 1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 4 |
| Chaurus Venom (Great) | 1 |  | Cook pot | 1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 4 |
| Chaurus Venom (Superlative) | 1 |  | Cook pot | 1 Chaurus Eggs 1 Chaurus Venom (Great) | Animal Harvesting Skill Greater or Equal to 6 |
| Chaurus Venom (Superlative) | 1 |  | Cook pot | 1 Chaurus Eggs 1 Chaurus Venom (Great) | Animal Harvesting Skill Greater or Equal to 6 |
| Cheesy Potato Mammoth | 2 |  | Cook pot | 1 Nord Mead 1 Goat Cheese Slice 1 Potato 1 Bottled Milk 1 Raw Mammoth Meat |  |
| Cheesy Potato Mammoth | 2 |  | Cook pot | 1 Nord Mead 1 Goat Cheese Slice 1 Potato 1 Bottled Milk 1 Raw Mammoth Meat |  |
| Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Chicken Dumpling | 2 |  | Oven | 1 Salt 1 Garlic 2 Leek 2 Raw Chicken Breast 1 Flour |  |
| Chicken Dumpling | 2 |  | Oven | 1 Salt 1 Garlic 2 Leek 2 Raw Chicken Breast 1 Flour |  |
| Chicken Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Chicken Breast |  |
| Chicken Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Chicken Breast |  |
| Child's Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Child's Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Cinnabar Beer | 1 |  | Brewing Barrel | 1 Ale 1 Jazbay Grapes 1 Creep Cluster | Sidequest - On Hogithum Complete |
| Cinnabar Beer | 1 |  | Brewing Barrel | 1 Ale 1 Jazbay Grapes 1 Creep Cluster | Sidequest - On Hogithum Complete |
| Clam Chowder | 1 |  | Cook pot | 1 Potato 1 Raw Clam Meat 1 Glass Bottle (Water) |  |
| Clam Chowder | 1 |  | Cook pot | 1 Potato 1 Raw Clam Meat 1 Glass Bottle (Water) |  |
| Cliff Racer | 4 |  | Brewing Barrel | 1 Firebrand Wine 1 Cyrodilic Brandy 1 Flin 1 Sujamma |  |
| Cliff Racer | 4 |  | Brewing Barrel | 1 Firebrand Wine 1 Cyrodilic Brandy 1 Flin 1 Sujamma |  |
| Cooked Angelfish | 1 |  | Cook pot | 1 Angelfish |  |
| Cooked Angelfish | 1 |  | Any Fire Source,Cook pot | 1 Angelfish |  |
| Cooked Angler | 1 |  | Any Fire Source,Cook pot | 1 Raw Angler |  |
| Cooked Angler | 1 |  | Cook pot | 1 Raw Angler |  |
| Cooked Angler Larvae | 1 |  | Cook pot | 1 Angler Larvae |  |
| Cooked Angler Larvae | 1 |  | Any Fire Source,Cook pot | 1 Angler Larvae |  |
| Cooked Arctic Char | 1 |  | Cook pot | 1 Raw Arctic Char |  |
| Cooked Arctic Char | 1 |  | Any Fire Source,Cook pot | 1 Raw Arctic Char |  |
| Cooked Arctic Grayling | 1 |  | Cook pot | 1 Raw Arctic Grayling |  |
| Cooked Arctic Grayling | 1 |  | Any Fire Source,Cook pot | 1 Raw Arctic Grayling |  |
| Cooked Bear Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Bear Meat |  |
| Cooked Bear Meat | 1 |  | Cook pot | 1 Raw Bear Meat |  |
| Cooked Beef | 1 |  | Any Fire Source,Cook pot | 1 Raw Beef |  |
| Cooked Beef | 1 |  | Cook pot | 1 Raw Beef |  |
| Cooked Brook Bass | 1 |  | Cook pot | 1 Raw Brook Bass |  |
| Cooked Brook Bass | 1 |  | Any Fire Source,Cook pot | 1 Raw Brook Bass |  |
| Cooked Carp | 1 |  | Cook pot | 1 Raw Carp |  |
| Cooked Carp | 1 |  | Any Fire Source,Cook pot | 1 Raw Carp |  |
| Cooked Catfish | 1 |  | Cook pot | 1 Raw Catfish |  |
| Cooked Catfish | 1 |  | Any Fire Source,Cook pot | 1 Raw Catfish |  |
| Cooked Chaurus Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Chaurus Meat |  |
| Cooked Chaurus Meat | 1 |  | Cook pot | 1 Raw Chaurus Meat |  |
| Cooked Chicken Breast | 1 |  | Cook pot | 2 Raw Chicken Breast |  |
| Cooked Chicken Breast | 1 |  | Any Fire Source,Cook pot | 1 Raw Chicken Breast |  |
| Cooked Cod | 1 |  | Cook pot | 1 Raw Cod |  |
| Cooked Cod | 1 |  | Any Fire Source,Cook pot | 1 Raw Cod |  |
| Cooked Direfish | 1 |  | Any Fire Source,Cook pot | 1 Raw Direfish |  |
| Cooked Direfish | 1 |  | Cook pot | 1 Raw Direfish |  |
| Cooked Dog Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Dog Meat |  |
| Cooked Dog Meat | 1 |  | Cook pot | 1 Raw Dog Meat |  |
| Cooked Dragon Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Dragon Meat |  |
| Cooked Dragon Meat | 1 |  | Cook pot | 1 Raw Dragon Meat |  |
| Cooked Elk Meat | 1 |  | Cook pot | 1 Raw Elk Meat |  |
| Cooked Elk Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Elk Meat |  |
| Cooked Fat | 1 |  | Cook pot | 1 Animal Fat |  |
| Cooked Fat | 1 |  | Any Fire Source,Cook pot | 1 Animal Fat |  |
| Cooked Fox Meat | 1 |  | Cook pot | 1 Raw Fox Meat |  |
| Cooked Fox Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Fox Meat |  |
| Cooked Glass Catfish | 1 |  | Any Fire Source,Cook pot | 1 Raw Glass Catfish |  |
| Cooked Glass Catfish | 1 |  | Cook pot | 1 Raw Glass Catfish |  |
| Cooked Glassfish | 1 |  | Any Fire Source,Cook pot | 1 Glassfish |  |
| Cooked Glassfish | 1 |  | Cook pot | 1 Glassfish |  |
| Cooked Goat Leg | 1 |  | Cook pot | 1 Raw Goat Leg |  |
| Cooked Goat Leg | 1 |  | Any Fire Source,Cook pot | 1 Raw Goat Leg |  |
| Cooked Goat Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Goat Meat |  |
| Cooked Goat Meat | 1 |  | Cook pot | 1 Raw Goat Meat |  |
| Cooked Goldfish | 1 |  | Cook pot | 1 Goldfish |  |
| Cooked Goldfish | 1 |  | Any Fire Source,Cook pot | 1 Goldfish |  |
| Cooked Horker Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Horker Meat |  |
| Cooked Horker Meat | 1 |  | Cook pot | 1 Raw Horker Meat |  |
| Cooked Horse Meat | 1 |  | Cook pot | 1 Raw Horse Meat |  |
| Cooked Horse Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Horse Meat |  |
| Cooked Juvenile Mudcrab | 1 |  | Any Fire Source,Cook pot | 1 Juvenile Mudcrab |  |
| Cooked Juvenile Mudcrab | 1 |  | Cook pot | 1 Juvenile Mudcrab |  |
| Cooked Leeks | 1 |  | Any Fire Source,Cook pot | 1 Leek |  |
| Cooked Leeks | 1 |  | Cook pot | 1 Leek |  |
| Cooked Lyretail Anthias | 1 |  | Any Fire Source,Cook pot | 1 Lyretail Anthias |  |
| Cooked Lyretail Anthias | 1 |  | Cook pot | 1 Lyretail Anthias |  |
| Cooked Mammoth Meat | 1 |  | Cook pot | 1 Raw Mammoth Meat |  |
| Cooked Mammoth Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Mammoth Meat |  |
| Cooked Mammoth Snout | 1 |  | Cook pot | 1 Raw Mammoth Snout |  |
| Cooked Mammoth Snout | 1 |  | Any Fire Source,Cook pot | 1 Raw Mammoth Snout |  |
| Cooked Mudcrab | 1 |  | Cook pot | 1 Raw Mudcrab Meat |  |
| Cooked Mudcrab | 1 |  | Any Fire Source,Cook pot | 1 Raw Mudcrab Meat |  |
| Cooked Mudcrab Legs | 1 |  | Any Fire Source,Cook pot | 1 Raw Mudcrab Legs |  |
| Cooked Mudcrab Legs | 1 |  | Cook pot | 1 Raw Mudcrab Legs |  |
| Cooked Pearlfish | 1 |  | Any Fire Source,Cook pot | 1 Pearlfish |  |
| Cooked Pearlfish | 1 |  | Cook pot | 1 Pearlfish |  |
| Cooked Pheasant Breast | 1 |  | Any Fire Source,Cook pot | 1 Raw Pheasant Breast |  |
| Cooked Pheasant Breast | 1 |  | Cook pot | 1 Raw Pheasant Breast |  |
| Cooked Pogfish | 1 |  | Any Fire Source,Cook pot | 1 Raw Pogfish |  |
| Cooked Pogfish | 1 |  | Cook pot | 1 Raw Pogfish |  |
| Cooked Potatoes | 1 |  | Any Fire Source,Cook pot | 1 Potato |  |
| Cooked Potatoes | 1 |  | Cook pot | 1 Potato |  |
| Cooked Pygmy Sunfish | 1 |  | Any Fire Source,Cook pot | 1 Pygmy Sunfish |  |
| Cooked Pygmy Sunfish | 1 |  | Cook pot | 1 Pygmy Sunfish |  |
| Cooked Rabbit Leg | 1 |  | Any Fire Source,Cook pot | 1 Raw Rabbit Leg |  |
| Cooked Rabbit Leg | 1 |  | Cook pot | 1 Raw Rabbit Leg |  |
| Cooked Rabbit Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Rabbit Meat |  |
| Cooked Rabbit Meat | 1 |  | Cook pot | 1 Raw Rabbit Meat |  |
| Cooked Sabre Cat Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Sabre Cat Meat |  |
| Cooked Sabre Cat Meat | 1 |  | Cook pot | 1 Raw Sabre Cat Meat |  |
| Cooked Salmon Steak | 2 |  | Any Fire Source,Cook pot | 1 Raw Salmon |  |
| Cooked Salmon Steak | 1 |  | Cook pot | 1 Raw Salmon Steak |  |
| Cooked Salmon Steak | 2 |  | Cook pot | 1 Raw Salmon |  |
| Cooked Salmon Steak | 1 |  | Any Fire Source,Cook pot | 1 Raw Salmon Steak |  |
| Cooked Scorpion Fish | 1 |  | Cook pot | 1 Raw Scorpion Fish |  |
| Cooked Scorpion Fish | 1 |  | Any Fire Source,Cook pot | 1 Raw Scorpion Fish |  |
| Cooked Skeever Meat | 1 |  | Cook pot | 1 Raw Skeever Meat |  |
| Cooked Skeever Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Skeever Meat |  |
| Cooked Slaughterfish | 3 |  | Cook pot | 1 Raw Slaughterfish |  |
| Cooked Slaughterfish | 3 |  | Any Fire Source,Cook pot | 1 Raw Slaughterfish |  |
| Cooked Spadefish | 1 |  | Any Fire Source,Cook pot | 1 Spadefish |  |
| Cooked Spadefish | 1 |  | Cook pot | 1 Spadefish |  |
| Cooked Spider Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Spider Meat |  |
| Cooked Spider Meat | 1 |  | Cook pot | 1 Raw Spider Meat |  |
| Cooked Tripod Spiderfish | 1 |  | Cook pot | 1 Raw Tripod Spiderfish |  |
| Cooked Tripod Spiderfish | 1 |  | Any Fire Source,Cook pot | 1 Raw Tripod Spiderfish |  |
| Cooked Troll Meat | 1 |  | Cook pot | 1 Raw Troll Meat |  |
| Cooked Troll Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Troll Meat |  |
| Cooked Vampire Fish | 1 |  | Any Fire Source,Cook pot | 1 Raw Vampire Fish |  |
| Cooked Vampire Fish | 1 |  | Cook pot | 1 Raw Vampire Fish |  |
| Cooked Venison | 1 |  | Any Fire Source,Cook pot | 1 Raw Venison |  |
| Cooked Venison | 1 |  | Cook pot | 1 Raw Venison |  |
| Cooked Wolf Meat | 1 |  | Any Fire Source,Cook pot | 1 Raw Wolf Meat |  |
| Cooked Wolf Meat | 1 |  | Cook pot | 1 Raw Wolf Meat |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Yellow |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Green |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Grey |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Tan |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Brown |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Indigo |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Black |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Orange |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Purple |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Blue |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Red |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Jester's Gloves |  |
| Cotton Cloth - Black | 2 |  | N/A | 1 Cotton Robes - Thalmor |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Cuffed Boots |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Mage Hood of Apprentice Regeneration |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Jester's Gloves |  |
| Cotton Cloth - Black | 2 |  | N/A | 1 Cotton Quilted Clothes - Black and White |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Mage Hood - Embellished |  |
| Cotton Cloth - Black | 2 |  | N/A | 1 Cotton Robes - Thalmor |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Gloves - Thalmor |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Boots - Thalmor |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Focusing Gloves |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Jester's Boots |  |
| Cotton Cloth - Black | 1 |  | N/A | 1 Cotton Jester's Boots |  |
| Cotton Cloth - Blue | 1 |  | N/A | 1 Cotton Mage Robes of Novice Regeneration |  |
| Cotton Cloth - Blue | 1 |  | N/A | 1 Cotton Mage Robes - Embellished |  |
| Cotton Cloth - Blue | 1 |  | N/A | 1 Cotton Fur-Mantled Clothes - Blue |  |
| Cotton Cloth - Blue | 1 |  | N/A | 1 Cotton Reclamations Temple Robes |  |
| Cotton Cloth - Blue | 1 |  | N/A | 1 Cotton Reclamations Temple Robes |  |
| Cotton Cloth - Blue | 1 |  | N/A | 1 Cotton Mage Robes - Common |  |
| Cotton Cloth - Blue | 1 |  | N/A | 1 Cotton Reclamations Temple Hood |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Mage Robes - Embroidered |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Mage Hood - Embroidered |  |
| Cotton Cloth - Brown | 2 |  | N/A | 1 Cotton Cultist Robes |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Cultist Gloves |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Cultist Boots |  |
| Cotton Cloth - Brown | 2 |  | N/A | 1 Cotton Quilted Clothes - Orange |  |
| Cotton Cloth - Brown | 2 |  | N/A | 1 Cotton Quilted Clothes - Brown and Orange |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Mage Hood of Adept Magicka |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Merchant's Hat |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Fine Shoes |  |
| Cotton Cloth - Brown | 2 |  | N/A | 1 Cotton Quilted Clothes - Brown and White |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Telvanni Shoes of Shock Resistance |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Reclamations Temple Boots |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Telvanni Shoes |  |
| Cotton Cloth - Brown | 2 |  | N/A | 1 Cotton Fine Clothes - Brown |  |
| Cotton Cloth - Brown | 2 |  | N/A | 1 Cotton Cultist Robes |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Shoes - Mythic Dawn |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Fine Hat |  |
| Cotton Cloth - Brown | 1 |  | N/A | 1 Cotton Fine Boots |  |
| Cotton Cloth - Green | 2 |  | N/A | 1 Cotton Fur-Mantled Clothes - Green |  |
| Cotton Cloth - Grey | 1 |  | N/A | 1 Greybeard's Hood |  |
| Cotton Cloth - Grey | 1 |  | N/A | 1 Cotton Mage Boots - Embellished |  |
| Cotton Cloth - Grey | 2 |  | N/A | 1 Greybeard's Robes |  |
| Cotton Cloth - Grey | 1 |  | N/A | 1 Cotton Mage Boots - Common |  |
| Cotton Cloth - Grey | 1 |  | N/A | 1 Greybeard's Shoes |  |
| Cotton Cloth - Indigo | 2 |  | N/A | 1 Cotton Fine Clothes - Indigo |  |
| Cotton Cloth - Indigo | 1 |  | N/A | 1 Cotton Quilted Clothes - Blue |  |
| Cotton Cloth - Orange | 2 |  | N/A | 1 Cotton Quilted Clothes - Orange and Black |  |
| Cotton Cloth - Purple | 2 |  | N/A | 1 Cotton Vaermina Robes |  |
| Cotton Cloth - Red | 2 |  | N/A | 1 Cotton Jester's Clothes - Red |  |
| Cotton Cloth - Red | 1 |  | N/A | 1 Cotton Gloves - Mythic Dawn |  |
| Cotton Cloth - Red | 2 |  | N/A | 1 Cotton Robes - Mythic Dawn |  |
| Cotton Cloth - Red | 1 |  | N/A | 1 Cotton Telvanni Robes of Resurgence |  |
| Cotton Cloth - Red | 2 |  | N/A | 1 Cotton Jester's Clothes |  |
| Cotton Cloth - Red | 1 |  | N/A | 1 Cotton Hood - Mythic Dawn |  |
| Cotton Cloth - Red | 2 |  | N/A | 1 Cotton Robes - Mythic Dawn |  |
| Cotton Cloth - Red | 1 |  | N/A | 1 Cotton Telvanni Robes |  |
| Cotton Cloth - Red | 1 |  | N/A | 1 Cotton Jester's Hat - Red |  |
| Cotton Cloth - Red | 1 |  | N/A | 1 Cotton Jester's Hat |  |
| Cotton Cloth - Red | 2 |  | N/A | 1 Silk Wedding Finery |  |
| Cotton Cloth - Tan | 1 |  | N/A | 1 Cotton Mage Hood - Common |  |
| Cotton Cloth - Tan | 1 |  | N/A | 1 Cotton Mage Hood of Novice Regeneration |  |
| Cotton Cloth - Tan | 2 |  | N/A | 1 Cotton Tall Boots |  |
| Cotton Thread | 2 |  | N/A | 1 Cotton Cloth |  |
| Crab Cakes | 1 |  | Cook pot | 1 Salt 1 Flour 1 Raw Mudcrab Meat |  |
| Crab Cakes | 1 |  | Oven | 1 Salt 1 Flour 1 Raw Mudcrab Meat |  |
| Crab Stew | 1 |  | Cook pot | 1 Garlic 1 Potato 1 Leek 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Crab Stew | 1 |  | Cook pot | 1 Garlic 1 Potato 1 Leek 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Creamy Crab Bisque | 1 |  | Cook pot | 1 Salt 1 Flour 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Creamy Crab Bisque | 1 |  | Cook pot | 1 Salt 1 Flour 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Cured Skeever Hide | 1 |  | N/A | 1 Salt 1 Pelt: Skeever | Animal Harvesting Skill Greater or Equal to 1 |
| Decorative War Horn | 1 |  | N/A | 1 Ingot: Iron 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 3 |
| Deviled Chaurus | 1 |  | Cook pot | 1 Thistle Branch 1 Bleeding Crown 1 Raw Chaurus Meat |  |
| Deviled Chaurus | 1 |  | Cook pot | 1 Thistle Branch 1 Bleeding Crown 1 Raw Chaurus Meat |  |
| Dog Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Dog Meat |  |
| Dog Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Dog Meat |  |
| Dragon Blood Pudding | 1 |  | Cook pot | 1 Jazbay Grapes 1 Moon Sugar 1 Dragon's Blood |  |
| Dragon Blood Pudding | 1 |  | Cook pot | 1 Jazbay Grapes 1 Moon Sugar 1 Dragon's Blood |  |
| Dragon Bone | 3 |  | N/A | 1 Horse Armor: Dragonbone Barding and Saddle |  |
| Dragon Heart Stew | 1 |  | Cook pot | 1 Ale 1 Fire Salts 1 Potato 1 Tomato 1 Dragon Heart |  |
| Dragon Heart Stew | 1 |  | Cook pot | 1 Ale 1 Fire Salts 1 Potato 1 Tomato 1 Dragon Heart |  |
| Dragon Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Dragon Meat |  |
| Dragon Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Dragon Meat |  |
| Dragon Stuffed Rabbit | 1 |  | Cook pot | 2 Dragon's Tongue 1 Raw Rabbit Meat |  |
| Dragon Stuffed Rabbit | 1 |  | Cook pot | 2 Dragon's Tongue 1 Raw Rabbit Meat |  |
| Dragon Vegetable Stew | 2 |  | Cook pot | 2 Carrot 2 Potato 1 Raw Dragon Meat 1 Glass Bottle (Water) |  |
| Dragon Vegetable Stew | 2 |  | Cook pot | 2 Carrot 2 Potato 1 Raw Dragon Meat 1 Glass Bottle (Water) |  |
| Dragon's Blood Poison (Crude) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 1 |
| Dragon's Blood Poison (Crude) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 1 |
| Dragon's Blood Poison (Decent) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Poison (Decent) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Poison (Good) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Poison (Good) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Poison (Great) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Poison (Great) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Poison (Remarkable) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Poison (Remarkable) | 2 |  | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Potion (Decent) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Potion (Decent) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Potion (Good) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Potion (Good) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Potion (Great) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Potion (Great) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Potion (Remarkable) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Potion (Remarkable) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Breath Mead | 2 |  | Brewing Barrel | 2 Dragon's Tongue 1 Honey |  |
| Dragon's Breath Mead | 2 |  | Brewing Barrel | 2 Dragon's Tongue 1 Honey |  |
| Dragon's Elixir of Firebloom | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Firebloom | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Furious Speed | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Furious Speed | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Ghostly Passage | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Ghostly Passage | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Kyne's Peace | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Kyne's Peace | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Slowed Time | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Slowed Time | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Swiftness | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Swiftness | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Living Circle | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Living Circle | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Shade | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Shade | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Storm | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Storm | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Unseen | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Unseen | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Death | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Death | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Disarming | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Disarming | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Explosive Force | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Explosive Force | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Terrible Frost | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Terrible Frost | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Torpor | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Torpor | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Dark Trimmed White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Ornate Brown |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Brown |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Trimmed Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Ornate Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Ornate Brown |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Light Trimmed Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Ornate White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Dark Trimmed Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Ornate Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Light Trimmed Brown |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Brown |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Trimmed White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Bearskin Hood - Trimmed Brown |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Ornate White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Light Trimmed White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Noble Black |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Noble White |  |
| Dragonplate Helmet | 1 |  | N/A | 1 Dragonplate Wolfskin Hood - Noble Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Light Trimmed White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Light Trimmed Black |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Noble White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Trimmed Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Black |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Ornate White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Noble Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Noble Black |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Dark Trimmed Black |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Ornate Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Ornate Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Trimmed Black |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Trimmed White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Ornate Black |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Dark Trimmed White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Light Trimmed Brown |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Black |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Bearskin Hood - Ornate White |  |
| Dragonscale Helmet | 1 |  | N/A | 1 Dragonscale Wolfskin Hood - Ornate Black |  |
| Dried Salmon Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Salmon Steak |  |
| Dried Salmon Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Salmon Steak |  |
| Dried Slaughterfish Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Slaughterfish |  |
| Dried Slaughterfish Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Slaughterfish |  |
| Dyed Hawk Feathers | 3 |  | N/A | 3 Hawk Feathers 1 Dye - Black | Animal Harvesting Skill Greater or Equal to 1 |
| Ebony Mail | 1 |  | N/A | 1 Ebony Mail |  |
| Ebony Mail | 1 |  | N/A | 1 Ebony Mail |  |
| Eidar Cheese Slice | 2 |  | N/A | 1 Eidar Cheese Wedge |  |
| Eidar Cheese Wedge | 3 |  | N/A | 1 Eidar Cheese Wheel |  |
| Elf Eared Elk | 1 |  | Cook pot | 2 Elves Ear 1 Raw Elk Meat |  |
| Elf Eared Elk | 1 |  | Cook pot | 2 Elves Ear 1 Raw Elk Meat |  |
| Elsweyr Fondue | 1 |  | Cook pot | 1 Ale 6 Eidar Cheese Slice 1 Leek 1 Moon Sugar |  |
| Elsweyr Fondue | 1 |  | Cook pot | 1 Ale 6 Eidar Cheese Slice 1 Leek 1 Moon Sugar |  |
| Engraved Bone of Hircine | 1 |  | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Engraved Bone of Julianos | 1 |  | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Engraved Bone of Kynareth | 1 |  | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Farmer's Breakfast | 1 |  | Cook pot | 1 Tomato 1 Mora Tapinella 1 Raw Boar Meat |  |
| Farmer's Breakfast | 1 |  | Cook pot | 1 Tomato 1 Mora Tapinella 1 Raw Boar Meat |  |
| Fatty Fin Fry | 1 |  | Cook pot | 1 Garlic 1 Raw Horker Meat 1 Grass Pod |  |
| Fatty Fin Fry | 1 |  | Cook pot | 1 Garlic 1 Raw Horker Meat 1 Grass Pod |  |
| Fish with Crab Sauce | 2 |  | Cook pot | 1 Alto Noir Wine 1 Raw Slaughterfish 1 Raw Mudcrab Meat |  |
| Fish with Crab Sauce | 2 |  | Cook pot | 1 Alto Noir Wine 1 Raw Slaughterfish 1 Raw Mudcrab Meat |  |
| Flaming Dragon | 2 |  | Cook pot | 1 Red Mountain Flower 1 Mulled Wine 1 Raw Dragon Meat |  |
| Flaming Dragon | 2 |  | Cook pot | 1 Red Mountain Flower 1 Mulled Wine 1 Raw Dragon Meat |  |
| Flammable Oil | 1 |  | Cook pot | 2 Animal Fat |  |
| Flammable Oil | 1 |  | Cook pot | 2 Animal Fat |  |
| Flare Coating | 1 |  | Cook pot | 3 Torchbug Thorax | Animal Harvesting Skill Greater or Equal to 1 |
| Flare Coating | 1 |  | Cook pot | 3 Torchbug Thorax | Animal Harvesting Skill Greater or Equal to 1 |
| Flour | 1 |  | Grain Mill | 2 Wheat |  |
| Fox Apple Stew | 1 |  | Cook pot | 1 Green Apple 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox Apple Stew | 1 |  | Cook pot | 1 Green Apple 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox Herb Cutlet | 2 |  | Cook pot | 2 Frost Mirriam 1 Raw Fox Meat |  |
| Fox Herb Cutlet | 2 |  | Cook pot | 2 Frost Mirriam 1 Raw Fox Meat |  |
| Fox in a Hole | 1 |  | Cook pot | 1 Carrot 1 Potato 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox in a Hole | 1 |  | Cook pot | 1 Carrot 1 Potato 1 Raw Fox Meat 1 Glass Bottle (Water) |  |
| Fox Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Fox Meat |  |
| Fox Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Fox Meat |  |
| Fragment: Bone | 150 |  | N/A | 5 Mammoth Tusk (Superlative) |  |
| Fragment: Bone | 2 |  | N/A | 1 Horker Tusk |  |
| Fragment: Bone | 20 |  | N/A | 5 Bull Horn |  |
| Fragment: Bone | 2 |  | N/A | 1 Doe Antlers |  |
| Fragment: Bone | 25 |  | N/A | 5 Animal Bone (Superlative) |  |
| Fragment: Bone | 3 |  | N/A | 1 Troll Skull |  |
| Fragment: Bone | 30 |  | N/A | 1 Mammoth Tusk (Superlative) |  |
| Fragment: Bone | 1 |  | N/A | 1 Arrow: Falmer |  |
| Fragment: Bone | 1 |  | N/A | 3 Canine Tooth |  |
| Fragment: Bone | 1 |  | N/A | 1 Human Skull |  |
| Fragment: Bone | 4 |  | N/A | 1 Bull Horn |  |
| Fragment: Bone | 1 |  | N/A | 3 Wolf Claws |  |
| Fragment: Bone | 5 |  | N/A | 1 Animal Bone (Superlative) |  |
| Fragment: Bone | 1 |  | N/A | 2 Sabre Cat Claws |  |
| Fragment: Bone | 15 |  | N/A | 5 Animal Bone (Large) |  |
| Fragment: Bone | 5 |  | N/A | 10 Bear Tooth |  |
| Fragment: Bone | 2 |  | N/A | 1 Engraved Bone of Hircine (Drained) |  |
| Fragment: Bone | 5 |  | N/A | 15 Wolf Claws |  |
| Fragment: Bone | 10 |  | N/A | 5 Doe Antlers (Superlative) |  |
| Fragment: Bone | 5 |  | N/A | 5 Animal Bone (Small) |  |
| Fragment: Bone | 5 |  | N/A | 10 Sabre Cat Claws |  |
| Fragment: Bone | 2 |  | N/A | 1 Engraved Bone of Kynareth (Drained) |  |
| Fragment: Bone | 1 |  | N/A | 1 Animal Bone (Small) |  |
| Fragment: Bone | 2 |  | N/A | 1 Engraved Bone of Julianos (Drained) |  |
| Fragment: Bone | 5 |  | N/A | 10 Bear Claws |  |
| Fragment: Bone | 1 |  | N/A | 1 Arrow: Forsworn |  |
| Fragment: Bone | 20 |  | N/A | 5 Buck Antlers |  |
| Fragment: Bone | 3 |  | N/A | 1 Doe Antlers (Superlative) |  |
| Fragment: Bone | 5 |  | N/A | 1 Buck Antlers (Superlative) |  |
| Fragment: Bone | 3 |  | N/A | 1 Animal Bone (Large) |  |
| Fragment: Bone | 20 |  | N/A | 1 Mammoth Tusk |  |
| Fragment: Bone | 30 |  | N/A | 1 Animal Bone (Enormous) |  |
| Fragment: Bone | 20 |  | N/A | 5 Buck Antlers (Superlative) |  |
| Fragment: Bone | 1 |  | N/A | 1 Sabre Cat Tooth |  |
| Fragment: Bone | 1 |  | N/A | 2 Bear Claws |  |
| Fragment: Bone | 5 |  | N/A | 15 Canine Tooth |  |
| Fragment: Bone | 1 |  | N/A | 2 Bear Tooth |  |
| Fragment: Bone | 10 |  | N/A | 5 Doe Antlers |  |
| Fragment: Bone | 100 |  | N/A | 5 Mammoth Tusk |  |
| Fragment: Bone | 10 |  | N/A | 5 Horker Tusk |  |
| Fragment: Bone | 5 |  | N/A | 5 Sabre Cat Tooth |  |
| Fragment: Bone | 4 |  | N/A | 1 Buck Antlers |  |
| Fragment: Building Glass | 3 |  | N/A | 1 Glass Bottle (Empty) |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Dawnbreaker Replica |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Helmet - Gilded |  |
| Fragment: Calcinium | 1 |  | N/A | 1 Arrow: Elven |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Helmet - Thalmor Gilded |  |
| Fragment: Calcinium | 60 |  | N/A | 1 Elven Shield - Thalmor |  |
| Fragment: Calcinium | 80 |  | N/A | 1 Elven Cuirass |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Boots - Thalmor Gilded |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Boots - Thalmor |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Mace |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Light Helmet - Thalmor |  |
| Fragment: Calcinium | 60 |  | N/A | 1 Elven Shield - Gilded |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Sword |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Light Boots - Thalmor |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Light Helmet |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven War Axe |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Light Bow |  |
| Fragment: Calcinium | 80 |  | N/A | 1 Elven Cuirass - Thalmor Gilded |  |
| Fragment: Calcinium | 60 |  | N/A | 1 Elven Warhammer |  |
| Fragment: Calcinium | 80 |  | N/A | 1 Elven Cuirass - Gilded |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Light Boots |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Gauntlets |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Helmet - Thalmor |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Boots - Gilded |  |
| Fragment: Calcinium | 60 |  | N/A | 1 Elven Shield - Thalmor Gilded |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Battleaxe |  |
| Fragment: Calcinium | 60 |  | N/A | 1 Elven Shield |  |
| Fragment: Calcinium | 60 |  | N/A | 1 Elven Light Cuirass - Thalmor |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Light Crossbow |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Gauntlets - Thalmor Gilded |  |
| Fragment: Calcinium | 10 |  | N/A | 1 Amulet of Mara Replica |  |
| Fragment: Calcinium | 10 |  | N/A | 1 Elven Dagger |  |
| Fragment: Calcinium | 80 |  | N/A | 1 Elven Cuirass - Thalmor |  |
| Fragment: Calcinium | 60 |  | N/A | 1 Elven Light Cuirass |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Light Gauntlets - Thalmor |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Boots |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Gauntlets - Gilded |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Gauntlets - Thalmor |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Helmet |  |
| Fragment: Calcinium | 10 |  | N/A | 1 Elven Hunting Knife |  |
| Fragment: Calcinium | 40 |  | N/A | 1 Elven Greatsword |  |
| Fragment: Calcinium | 20 |  | N/A | 1 Elven Light Gauntlets |  |
| Fragment: Corundum | 10 |  | N/A | 1 Corundum Jug |  |
| Fragment: Corundum | 40 |  | N/A | 1 Ancient Nordic Helmet |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Hero Battleaxe |  |
| Fragment: Corundum | 10 |  | N/A | 1 Amulet of Dibella Replica |  |
| Fragment: Corundum | 20 |  | N/A | 1 Corundum Amphora |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Hero Heavy Crossbow |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Hero Greatsword |  |
| Fragment: Corundum | 5 |  | N/A | 1 Corundum Goblet |  |
| Fragment: Corundum | 1 |  | N/A | 1 Corundum Pot |  |
| Fragment: Corundum | 1 |  | N/A | 1 Corundum Vase |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Hero Gauntlets |  |
| Fragment: Corundum | 10 |  | N/A | 1 Corundum Bowl |  |
| Fragment: Corundum | 40 |  | N/A | 1 Thieves Guild Light Crossbow |  |
| Fragment: Corundum | 12 |  | N/A | 1 Amulet of Stendarr Replica |  |
| Fragment: Corundum | 10 |  | N/A | 1 Copper Onyx Circlet |  |
| Fragment: Corundum | 55 |  | N/A | 1 Ancient Nordic Salvaged Cuirass |  |
| Fragment: Corundum | 40 |  | N/A | 1 Ancient Nordic Hero Helm |  |
| Fragment: Corundum | 10 |  | N/A | 1 Corundum Bowl |  |
| Fragment: Corundum | 5 |  | N/A | 1 Corundum Flagon |  |
| Fragment: Corundum | 10 |  | N/A | 1 Amulet of Akatosh Replica |  |
| Fragment: Corundum | 80 |  | N/A | 1 Ancient Nordic Hero Cuirass |  |
| Fragment: Corundum | 5 |  | N/A | 1 Corundum Plate |  |
| Fragment: Corundum | 10 |  | N/A | 1 Copper Ruby Circlet |  |
| Fragment: Corundum | 15 |  | N/A | 1 Ancient Nordic Hero Mace |  |
| Fragment: Corundum | 1 |  | N/A | 1 Bolt: Ancient Nordic Hero |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Honed War Axe |  |
| Fragment: Corundum | 10 |  | N/A | 1 Amulet of Arkay Replica |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Honed Battleaxe |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Honed Sword |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Hero Warhammer |  |
| Fragment: Corundum | 1 |  | N/A | 1 Dragon Priest Dagger |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Honed Heavy Bow |  |
| Fragment: Corundum | 15 |  | N/A | 1 Ancient Nordic Hero War Axe |  |
| Fragment: Corundum | 40 |  | N/A | 1 Ancient Nordic Hero Boots |  |
| Fragment: Corundum | 10 |  | N/A | 1 Copper Opal Circlet |  |
| Fragment: Corundum | 10 |  | N/A | 1 Copper Circlet |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Honed Greatsword |  |
| Fragment: Corundum | 15 |  | N/A | 1 Ancient Nordic Hero Sword |  |
| Fragment: Corundum | 10 |  | N/A | 1 Ancient Nordic Hero Dagger |  |
| Fragment: Corundum | 20 |  | N/A | 1 Ancient Nordic Hero Heavy Bow |  |
| Fragment: Corundum | 2 |  | N/A | 1 Corundum Cup |  |
| Fragment: Dwarven | 180 |  | N/A | 1 Dwarven Large Strut |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Dwarven Improved Light Crossbow |  |
| Fragment: Dwarven | 10 |  | N/A | 1 Dwarven Bent Scrap |  |
| Fragment: Dwarven | 2 |  | N/A | 1 Dwarven Cup |  |
| Fragment: Dwarven | 60 |  | N/A | 1 Dwarven Heavy Crossbow |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Dwarven Helmet |  |
| Fragment: Dwarven | 80 |  | N/A | 1 Dwarven Cuirass |  |
| Fragment: Dwarven | 210 |  | N/A | 1 Dwarven Decorated Strut |  |
| Fragment: Dwarven | 20 |  | N/A | 1 Dwarven Boots |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Dwarven Battleaxe |  |
| Fragment: Dwarven | 1 |  | N/A | 1 Dwarven Fork |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Dwarven Mace |  |
| Fragment: Dwarven | 1 |  | N/A | 1 Dwarven Spoon |  |
| Fragment: Dwarven | 5 |  | N/A | 1 Dwarven Scrap Metal |  |
| Fragment: Dwarven | 10 |  | N/A | 1 Dwarven Gyro |  |
| Fragment: Dwarven | 15 |  | N/A | 1 Dwarven Pan |  |
| Fragment: Dwarven | 1 |  | N/A | 1 Dwarven Knife |  |
| Fragment: Dwarven | 1 |  | N/A | 1 Arrow: Dwarven |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Spellbreaker Replica |  |
| Fragment: Dwarven | 10 |  | N/A | 1 Dwarven Fishing Rod |  |
| Fragment: Dwarven | 20 |  | N/A | 1 Dwarven Handled Pan |  |
| Fragment: Dwarven | 5 |  | N/A | 1 Dwarven Small Lever |  |
| Fragment: Dwarven | 80 |  | N/A | 1 Dwarven Urn |  |
| Fragment: Dwarven | 15 |  | N/A | 1 Dwarven Cog |  |
| Fragment: Dwarven | 20 |  | N/A | 1 Dwarven Gauntlets |  |
| Fragment: Dwarven | 10 |  | N/A | 1 Dwarven Lever |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Dwarven Heavy Bow |  |
| Fragment: Dwarven | 10 |  | N/A | 1 Dwarven Shallow Bowl |  |
| Fragment: Dwarven | 30 |  | N/A | 1 Dwarven Small Plate Metal |  |
| Fragment: Dwarven | 20 |  | N/A | 1 Dwarven Sword |  |
| Fragment: Dwarven | 60 |  | N/A | 1 Horse Armor: Dwarven Barding and Saddle |  |
| Fragment: Dwarven | 10 |  | N/A | 1 Dwarven Plate |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Dwarven Greatsword |  |
| Fragment: Dwarven | 1 |  | N/A | 1 Bolt: Dwarven |  |
| Fragment: Dwarven | 150 |  | N/A | 1 Dwarven Solid Metal |  |
| Fragment: Dwarven | 60 |  | N/A | 1 Dwarven Pot |  |
| Fragment: Dwarven | 55 |  | N/A | 1 Dwarven Salvaged Cuirass |  |
| Fragment: Dwarven | 5 |  | N/A | 1 Dwarven Gear |  |
| Fragment: Dwarven | 60 |  | N/A | 1 Dwarven Shield |  |
| Fragment: Dwarven | 12 |  | N/A | 1 Dwarven Bowl |  |
| Fragment: Dwarven | 1 |  | N/A | 1 Dwarven Dagger |  |
| Fragment: Dwarven | 12 |  | N/A | 1 Dwarven Medium Bowl |  |
| Fragment: Dwarven | 15 |  | N/A | 1 Dwarven Engraved Bowl |  |
| Fragment: Dwarven | 60 |  | N/A | 1 Dwarven Warhammer |  |
| Fragment: Dwarven | 20 |  | N/A | 1 Dwarven War Axe |  |
| Fragment: Dwarven | 60 |  | N/A | 1 Dwarven Large Plate Metal |  |
| Fragment: Dwarven | 60 |  | N/A | 1 Dwarven Masterwork Light Crossbow |  |
| Fragment: Dwarven | 10 |  | N/A | 1 Dwarven Hunting Knife |  |
| Fragment: Dwarven | 40 |  | N/A | 1 Dwarven Masterwork Light Crossbow |  |
| Fragment: Ebony | 10 |  | N/A | 1 Daedric Hunting Knife |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Shield |  |
| Fragment: Ebony | 80 |  | N/A | 1 Ebony Mail Replica |  |
| Fragment: Ebony | 1 |  | N/A | 1 Arrow: Ebony |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Boots - Silvered |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Mail Replica |  |
| Fragment: Ebony | 40 |  | N/A | 1 Daedric Battlestaff |  |
| Fragment: Ebony | 20 |  | N/A | 1 Ebony Sword |  |
| Fragment: Ebony | 20 |  | N/A | 1 Dragonbone Heavy Crossbow |  |
| Fragment: Ebony | 80 |  | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Ebony | 20 |  | N/A | 1 Ebony Gauntlets |  |
| Fragment: Ebony | 80 |  | N/A | 1 Daedric Cuirass |  |
| Fragment: Ebony | 20 |  | N/A | 1 Ebony Gauntlets - Silvered |  |
| Fragment: Ebony | 40 |  | N/A | 1 Nightingale Bow |  |
| Fragment: Ebony | 10 |  | N/A | 1 Dragonbone Dagger |  |
| Fragment: Ebony | 20 |  | N/A | 1 Irkngthand War Axe |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Heavy Bow |  |
| Fragment: Ebony | 60 |  | N/A | 1 Horse Armor: Ebony Barding and Saddle |  |
| Fragment: Ebony | 80 |  | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Ebony | 80 |  | N/A | 1 Horse Armor: Ebony Barding and Saddle - Mail |  |
| Fragment: Ebony | 80 |  | N/A | 1 Ebony Cuirass - Silvered |  |
| Fragment: Ebony | 40 |  | N/A | 1 Daedric Helmet |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Helmet - Gilded |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Battleaxe |  |
| Fragment: Ebony | 20 |  | N/A | 1 Dragonplate Shield |  |
| Fragment: Ebony | 20 |  | N/A | 1 Dragonbone Battleaxe |  |
| Fragment: Ebony | 20 |  | N/A | 1 Daedric Heavy Crossbow |  |
| Fragment: Ebony | 20 |  | N/A | 1 Ebony War Axe |  |
| Fragment: Ebony | 80 |  | N/A | 1 Ebony Cuirass - Gilded |  |
| Fragment: Ebony | 40 |  | N/A | 1 Daedric Boots |  |
| Fragment: Ebony | 10 |  | N/A | 1 Dragonbone Sword |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Boots - Gilded |  |
| Fragment: Ebony | 40 |  | N/A | 1 Wuuthrad Replica |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Ebony | 10 |  | N/A | 1 Dragonbone Hunting Knife |  |
| Fragment: Ebony | 80 |  | N/A | 1 Ebony Cuirass |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Boots |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Warhammer |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Ebony | 60 |  | N/A | 1 Masque of Clavicus Vile Replica |  |
| Fragment: Ebony | 20 |  | N/A | 1 Dragonbone Heavy Bow |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Helmet - Silvered |  |
| Fragment: Ebony | 10 |  | N/A | 1 Ebony Hunting Knife |  |
| Fragment: Ebony | 20 |  | N/A | 1 Ebony Gauntlets - Gilded |  |
| Fragment: Ebony | 20 |  | N/A | 1 Harkon's Sword Replica |  |
| Fragment: Ebony | 60 |  | N/A | 1 Shield of Ysgramor Replica |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Shield - Silvered |  |
| Fragment: Ebony | 20 |  | N/A | 1 Dragonbone Warhammer |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Mace |  |
| Fragment: Ebony | 20 |  | N/A | 1 Ebony Blade Replica |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Greatsword |  |
| Fragment: Ebony | 60 |  | N/A | 1 Horse Armor: Daedric Barding and Saddle |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Battlestaff |  |
| Fragment: Ebony | 60 |  | N/A | 1 Daedric Shield |  |
| Fragment: Ebony | 20 |  | N/A | 1 Dragonbone Greatsword |  |
| Fragment: Ebony | 20 |  | N/A | 1 Dragonplate Cuirass |  |
| Fragment: Ebony | 10 |  | N/A | 1 Ebony Dagger |  |
| Fragment: Ebony | 10 |  | N/A | 1 Dragonbone Mace |  |
| Fragment: Ebony | 10 |  | N/A | 1 Dragonbone War Axe |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Heavy Crossbow |  |
| Fragment: Ebony | 60 |  | N/A | 1 Ebony Shield - Gilded |  |
| Fragment: Ebony | 40 |  | N/A | 1 Ebony Helmet |  |
| Fragment: Ebony | 20 |  | N/A | 1 Nightingale Blade |  |
| Fragment: Ebony | 20 |  | N/A | 1 Daedric Gauntlets |  |
| Fragment: Galatite | 40 |  | N/A | 1 Circle Boots |  |
| Fragment: Galatite | 60 |  | N/A | 1 Circle Shield |  |
| Fragment: Galatite | 1 |  | N/A | 1 Arrow: Skyforge Steel |  |
| Fragment: Galatite | 40 |  | N/A | 1 Bloodskal Blade Replica |  |
| Fragment: Galatite | 40 |  | N/A | 1 Circle Helmet |  |
| Fragment: Galatite | 12 |  | N/A | 1 Amulet of Talos Replica |  |
| Fragment: Galatite | 1 |  | N/A | 1 Arrow: Nordic |  |
| Fragment: Galatite | 20 |  | N/A | 1 Circle Gauntlets |  |
| Fragment: Galatite | 10 |  | N/A | 1 Skyforge Steel Dagger |  |
| Fragment: Galatite | 1 |  | N/A | 1 Nordic Dagger |  |
| Fragment: Galatite | 80 |  | N/A | 1 Circle Cuirass |  |
| Fragment: Gold | 20 |  | N/A | 1 Jewelled Dibella Statue |  |
| Fragment: Gold | 1 |  | N/A | 1 Gold Ring |  |
| Fragment: Gold | 5 |  | N/A | 1 Amulet of Julianos Replica |  |
| Fragment: Gold | 2 |  | N/A | 1 Gold Necklace |  |
| Fragment: Gold | 20 |  | N/A | 1 Dibella Statue |  |
| Fragment: Gold | 20 |  | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Gold | 10 |  | N/A | 1 Gold Circlet |  |
| Fragment: Gold | 20 |  | N/A | 1 Ebony Cuirass - Gilded |  |
| Fragment: Gold | 20 |  | N/A | 1 Elven Cuirass - Thalmor Gilded |  |
| Fragment: Gold | 20 |  | N/A | 1 Elven Cuirass - Gilded |  |
| Fragment: Gold | 20 |  | N/A | 1 Ebony Mail Replica - Gilded |  |
| Fragment: Gold | 10 |  | N/A | 1 Gold Emerald Circlet (Flawless) |  |
| Fragment: Iron | 55 |  | N/A | 1 Iron Robed Cuirass - Pale |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - Haafingar |  |
| Fragment: Iron | 55 |  | N/A | 1 Iron Braced Vagabond Cuirass |  |
| Fragment: Iron | 1 |  | N/A | 1 Arrow: Ancient Nordic |  |
| Fragment: Iron | 40 |  | N/A | 1 Ancient Nordic Greatsword |  |
| Fragment: Iron | 55 |  | N/A | 1 Iron Makeshift Cuirass |  |
| Fragment: Iron | 5 |  | N/A | 1 Iron Hammer |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Boots |  |
| Fragment: Iron | 80 |  | N/A | 1 Iron Warhammer |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Leather Surcoat |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - The Rift |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Quality Cuirass |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Battleaxe |  |
| Fragment: Iron | 20 |  | N/A | 1 Studded Cuirass |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Mace |  |
| Fragment: Iron | 25 |  | N/A | 1 Iron Torture Tools |  |
| Fragment: Iron | 80 |  | N/A | 1 Iron Banded Quality Cuirass |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - Whiterun |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Surcoat |  |
| Fragment: Iron | 55 |  | N/A | 1 Oiled Mail and Tunic |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Masterwork Shield |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - Winterhold |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Shovel |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Pickaxe |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Lantern |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Masterwork Helmet |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - The Pale |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Helmet |  |
| Fragment: Iron | 80 |  | N/A | 1 Iron Banded Cuirass |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - The Reach |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Greatsword |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - The Pale |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - Eastmarch |  |
| Fragment: Iron | 40 |  | N/A | 1 Ancient Nordic Helmet - Antlers |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - The Rift |  |
| Fragment: Iron | 80 |  | N/A | 1 Iron Banded Masterwork Cuirass |  |
| Fragment: Iron | 60 |  | N/A | 1 Ancient Nordic Cuirass |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Battlestaff |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Hunting Knife |  |
| Fragment: Iron | 55 |  | N/A | 1 Oiled Mail and Jacket |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Quality Shield |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Quality Gauntlets |  |
| Fragment: Iron | 40 |  | N/A | 1 Ancient Nordic Battleaxe |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Large Shovel |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Banded Quality Shield |  |
| Fragment: Iron | 5 |  | N/A | 1 Iron Sword Hilt |  |
| Fragment: Iron | 6 |  | N/A | 1 Iron Lock |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - Winterhold |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Masterwork Cuirass |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Pitchfork |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - The Reach |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - Falkreath |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - Winterhold |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - Whiterun |  |
| Fragment: Iron | 1 |  | N/A | 1 Bolt: Iron |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Leathers |  |
| Fragment: Iron | 40 |  | N/A | 1 Ancient Nordic Boots |  |
| Fragment: Iron | 40 |  | N/A | 1 Stormcloak Heavy Helmet |  |
| Fragment: Iron | 20 |  | N/A | 1 Stormcloak Light Cuirass |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Heavy Shield |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Quality Boots |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron War Axe Hilt |  |
| Fragment: Iron | 20 |  | N/A | 1 Stormcloak Sleeved Heavy Cuirass |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Dagger |  |
| Fragment: Iron | 5 |  | N/A | 1 Iron Tongs |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Sword |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Helmet - Ram |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Gauntlets - Engraved |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Fittings |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Quality Helmet |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Sword Blade |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron War Axe Head |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Banded Shield |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Jacket |  |
| Fragment: Iron | 55 |  | N/A | 1 Iron Vagabond Cuirass |  |
| Fragment: Iron | 5 |  | N/A | 1 Iron Hinge |  |
| Fragment: Iron | 7 |  | N/A | 1 Iron Serving Dish |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - Falkreath |  |
| Fragment: Iron | 5 |  | N/A | 1 Iron Embalming Drill |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - Whiterun |  |
| Fragment: Iron | 55 |  | N/A | 1 Oiled Mail and Hide |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Cuirass |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - Hjaalmarch |  |
| Fragment: Iron | 80 |  | N/A | 1 Iron Banded Cuirass - Engraved |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - Haafingar |  |
| Fragment: Iron | 55 |  | N/A | 1 Iron Robed Cuirass - Dark |  |
| Fragment: Iron | 1 |  | N/A | 1 Iron Nails |  |
| Fragment: Iron | 20 |  | N/A | 1 Ancient Nordic Gauntlets |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Gauntlets |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Boots - Engraved |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Masterwork Boots |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Light Guard's Shield - Hjaalmarch |  |
| Fragment: Iron | 60 |  | N/A | 1 Iron Cuirass - Engraved |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Hide |  |
| Fragment: Iron | 40 |  | N/A | 1 Imperial Outcast Boots |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - Falkreath |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - Haafingar |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Heavy Crossbow |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron War Axe |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - The Pale |  |
| Fragment: Iron | 20 |  | N/A | 1 Ancient Nordic Light Bow |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Clothes Press |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Woodcutter's Axe |  |
| Fragment: Iron | 1 |  | N/A | 1 Arrow: Iron |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Light Guard's Helmet - The Rift |  |
| Fragment: Iron | 120 |  | N/A | 1 Iron Cauldron |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Pot |  |
| Fragment: Iron | 1 |  | N/A | 1 Iron Fork |  |
| Fragment: Iron | 55 |  | N/A | 1 Iron Furred Cuirass |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Mace Head |  |
| Fragment: Iron | 1 |  | N/A | 1 Iron Knife |  |
| Fragment: Iron | 20 |  | N/A | 1 Ancient Nordic War Axe |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - The Reach |  |
| Fragment: Iron | 25 |  | N/A | 1 Iron Large Pot |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Headsman's Axe |  |
| Fragment: Iron | 20 |  | N/A | 1 Ancient Nordic Sword |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Pauldroned Leather |  |
| Fragment: Iron | 10 |  | N/A | 1 Iron Dish |  |
| Fragment: Iron | 2 |  | N/A | 1 Iron Tankard |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Masterwork Gauntlets |  |
| Fragment: Iron | 1 |  | N/A | 1 Lockpick |  |
| Fragment: Iron | 20 |  | N/A | 1 Iron Mace Hilt |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Tunic |  |
| Fragment: Iron | 20 |  | N/A | 1 Fur Guard's Cuirass - Hjaalmarch |  |
| Fragment: Iron | 10 |  | N/A | 1 Imperial Dagger |  |
| Fragment: Iron | 40 |  | N/A | 1 Iron Helmet - Engraved |  |
| Fragment: Iron | 120 |  | N/A | 1 Iron Kettle |  |
| Fragment: Iron | 55 |  | N/A | 1 Mail and Rugged Leather |  |
| Fragment: Iron | 55 |  | N/A | 1 Robed Mail |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Mace |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Helmet - Vvardenfell |  |
| Fragment: Malachite | 20 |  | N/A | 1 Glass Gauntlets |  |
| Fragment: Malachite | 60 |  | N/A | 1 Glass Warhammer |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Battleaxe |  |
| Fragment: Malachite | 60 |  | N/A | 1 Glass Shield - Thalmor |  |
| Fragment: Malachite | 60 |  | N/A | 1 Horse Armor: Divine Aegis Barding and Saddle |  |
| Fragment: Malachite | 20 |  | N/A | 1 Glass War Axe |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Boots - Thalmor |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Battlestaff |  |
| Fragment: Malachite | 60 |  | N/A | 1 Glass Shield - Vvardenfell |  |
| Fragment: Malachite | 20 |  | N/A | 1 Glass Gauntlets - Thalmor |  |
| Fragment: Malachite | 10 |  | N/A | 1 Glass Hunting Knife |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Helmet - Thalmor |  |
| Fragment: Malachite | 80 |  | N/A | 1 Glass Cuirass |  |
| Fragment: Malachite | 1 |  | N/A | 1 Arrow: Glass |  |
| Fragment: Malachite | 20 |  | N/A | 1 Glass Gauntlets - Vvardenfell |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Boots - Vvardenfell |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Light Bow |  |
| Fragment: Malachite | 80 |  | N/A | 1 Glass Cuirass - Thalmor |  |
| Fragment: Malachite | 1 |  | N/A | 1 Bolt: Glass |  |
| Fragment: Malachite | 20 |  | N/A | 1 Chillrend Replica |  |
| Fragment: Malachite | 10 |  | N/A | 1 Glass Dagger |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Light Crossbow |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Boots |  |
| Fragment: Malachite | 60 |  | N/A | 1 Glass Shield |  |
| Fragment: Malachite | 80 |  | N/A | 1 Glass Cuirass - Vvardenfell |  |
| Fragment: Malachite | 60 |  | N/A | 1 Horse Armor: Frost Aegis Barding and Saddle |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Helmet |  |
| Fragment: Malachite | 40 |  | N/A | 1 Glass Greatsword |  |
| Fragment: Malachite | 20 |  | N/A | 1 Glass Sword |  |
| Fragment: Moonstone | 60 |  | N/A | 1 Horse Armor: Cleric Barding and Saddle |  |
| Fragment: Moonstone | 40 |  | N/A | 1 Auriel's Shield Replica |  |
| Fragment: Moonstone | 60 |  | N/A | 1 Horse Armor: Elven Barding and Saddle - Amber |  |
| Fragment: Moonstone | 1 |  | N/A | 1 Bolt: Elven |  |
| Fragment: Moonstone | 60 |  | N/A | 1 Horse Armor: Elven Barding and Saddle - Dusk |  |
| Fragment: Orichalcum | 10 |  | N/A | 1 Orichalc Circlet |  |
| Fragment: Orichalcum | 20 |  | N/A | 1 Orcish War Axe |  |
| Fragment: Orichalcum | 10 |  | N/A | 1 Orichalc Sapphire Circlet |  |
| Fragment: Orichalcum | 20 |  | N/A | 1 Orcish Sword |  |
| Fragment: Orichalcum | 40 |  | N/A | 1 Orcish Boots |  |
| Fragment: Orichalcum | 40 |  | N/A | 1 Orcish Greatsword |  |
| Fragment: Orichalcum | 20 |  | N/A | 1 Orcish Gauntlets |  |
| Fragment: Orichalcum | 1 |  | N/A | 1 Bolt: Orcish |  |
| Fragment: Orichalcum | 40 |  | N/A | 1 Orcish Heavy Bow |  |
| Fragment: Orichalcum | 10 |  | N/A | 1 Orcish Hunting Knife |  |
| Fragment: Orichalcum | 40 |  | N/A | 1 Orcish Battleaxe |  |
| Fragment: Orichalcum | 80 |  | N/A | 1 Orcish Cuirass |  |
| Fragment: Orichalcum | 60 |  | N/A | 1 Orcish Shield |  |
| Fragment: Orichalcum | 10 |  | N/A | 1 Orcish Dagger |  |
| Fragment: Orichalcum | 40 |  | N/A | 1 Orcish Mace |  |
| Fragment: Orichalcum | 40 |  | N/A | 1 Orcish Helmet |  |
| Fragment: Orichalcum | 60 |  | N/A | 1 Orcish Warhammer |  |
| Fragment: Orichalcum | 40 |  | N/A | 1 Orcish Heavy Crossbow |  |
| Fragment: Orichalcum | 10 |  | N/A | 1 Argonian Fishing Rod |  |
| Fragment: Orichalcum | 1 |  | N/A | 1 Arrow: Orcish |  |
| Fragment: Quicksilver | 10 |  | N/A | 1 Alik'ri Fishing Rod |  |
| Fragment: Quicksilver | 10 |  | N/A | 1 Amulet of the Kynareth Replica |  |
| Fragment: Quicksilver | 20 |  | N/A | 1 Dragonscale Cuirass |  |
| Fragment: Quicksilver | 20 |  | N/A | 1 Dragonscale Shield |  |
| Fragment: Silver | 6 |  | N/A | 1 Silver Adorned Bowl |  |
| Fragment: Silver | 4 |  | N/A | 1 Silver Large Goblet |  |
| Fragment: Silver | 12 |  | N/A | 1 Silver Ewer |  |
| Fragment: Silver | 10 |  | N/A | 1 Silver Greatsword |  |
| Fragment: Silver | 7 |  | N/A | 1 Silver Candlestick |  |
| Fragment: Silver | 20 |  | N/A | 1 Ebony Cuirass - Silvered |  |
| Fragment: Silver | 20 |  | N/A | 1 Silver Platter |  |
| Fragment: Silver | 5 |  | N/A | 3 Silver Sword |  |
| Fragment: Silver | 7 |  | N/A | 1 Silver Plate |  |
| Fragment: Silver | 10 |  | N/A | 1 Silver Emerald Circlet |  |
| Fragment: Silver | 10 |  | N/A | 1 Silver Circlet |  |
| Fragment: Silver | 2 |  | N/A | 1 Silver Necklace |  |
| Fragment: Silver | 3 |  | N/A | 1 Silver Goblet |  |
| Fragment: Silver | 10 |  | N/A | 1 Silver Triple Candlestick |  |
| Fragment: Silver | 10 |  | N/A | 1 Silver Sapphire Circlet (Flawless) |  |
| Fragment: Silver | 5 |  | N/A | 1 Silver Bowl |  |
| Fragment: Silver | 20 |  | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Silver | 1 |  | N/A | 1 Silver Ring |  |
| Fragment: Silver | 1 |  | N/A | 1 Bolt: Silver |  |
| Fragment: Silver | 10 |  | N/A | 1 Silver Ruby Circlet |  |
| Fragment: Silver | 7 |  | N/A | 1 Silver Candlestick |  |
| Fragment: Silver | 20 |  | N/A | 1 Ebony Mail Replica - Silvered |  |
| Fragment: Silver | 20 |  | N/A | 1 Silver Candelabrum |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard Heavy Shield |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard Reinforced Light Cuirass - Blue |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Plate Gauntlets |  |
| Fragment: Steel | 80 |  | N/A | 1 Imperial Heavy Cuirass |  |
| Fragment: Steel | 10 |  | N/A | 1 Steel Sword Hilt |  |
| Fragment: Steel | 10 |  | N/A | 1 Toolkit: Chef's |  |
| Fragment: Steel | 60 |  | N/A | 1 Steel Battleaxe |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard War Axe |  |
| Fragment: Steel | 10 |  | N/A | 1 Steel Saw |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Gauntlets |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial Heavy Boots |  |
| Fragment: Steel | 20 |  | N/A | 1 Blades Gauntlets |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard Light Crossbow |  |
| Fragment: Steel | 55 |  | N/A | 1 Steel Braced Cuirass |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Horned Helmet |  |
| Fragment: Steel | 80 |  | N/A | 1 Steel Warhammer Head |  |
| Fragment: Steel | 10 |  | N/A | 1 Dawnguard Light Boots |  |
| Fragment: Steel | 60 |  | N/A | 1 Horse Armor: Dawnguard Barding and Saddle |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Helmet - White |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial Sword |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Battlestaff |  |
| Fragment: Steel | 20 |  | N/A | 1 Silver Sword |  |
| Fragment: Steel | 80 |  | N/A | 1 Dawnguard Rune Warhammer Replica |  |
| Fragment: Steel | 55 |  | N/A | 1 Steel Furred Cuirass |  |
| Fragment: Steel | 40 |  | N/A | 1 Savior's Hide Replica - Black |  |
| Fragment: Steel | 40 |  | N/A | 1 Stormcloak Officer Boots |  |
| Fragment: Steel | 80 |  | N/A | 1 Steel Pauldroned Cuirass |  |
| Fragment: Steel | 20 |  | N/A | 1 Scaled Bracers |  |
| Fragment: Steel | 1 |  | N/A | 1 Bolt: Stormcloak |  |
| Fragment: Steel | 40 |  | N/A | 1 Stormcloak Officer Cuirass |  |
| Fragment: Steel | 35 |  | N/A | 1 Steel Warhammer Hilt |  |
| Fragment: Steel | 80 |  | N/A | 1 Wolf Cuirass |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial Heavy Helmet |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Boots |  |
| Fragment: Steel | 80 |  | N/A | 1 Steel Warhammer |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Boots - White |  |
| Fragment: Steel | 60 |  | N/A | 1 Blades Shield |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Plate Boots |  |
| Fragment: Steel | 60 |  | N/A | 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Fragment: Steel | 80 |  | N/A | 1 Blades Cuirass |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel War Axe |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial Shortsword |  |
| Fragment: Steel | 40 |  | N/A | 1 Savior's Hide Replica |  |
| Fragment: Steel | 80 |  | N/A | 1 Steel Plate Cuirass |  |
| Fragment: Steel | 40 |  | N/A | 1 Helm of Yngol Replica |  |
| Fragment: Steel | 1 |  | N/A | 1 Bolt: Dark Brotherhood |  |
| Fragment: Steel | 20 |  | N/A | 1 Dawnguard Heavy Gauntlets |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Gauntlets - White |  |
| Fragment: Steel | 1 |  | N/A | 1 Bolt: Dawnguard |  |
| Fragment: Steel | 20 |  | N/A | 1 Wolf Gauntlets |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Sword |  |
| Fragment: Steel | 40 |  | N/A | 1 Silver Battlestaff |  |
| Fragment: Steel | 2 |  | N/A | 1 Steel Buckles |  |
| Fragment: Steel | 10 |  | N/A | 1 Toolkit: Thieves' |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial Mace |  |
| Fragment: Steel | 20 |  | N/A | 1 Scaled Cuirass |  |
| Fragment: Steel | 60 |  | N/A | 1 Dawnguard Heavy Cuirass - Black |  |
| Fragment: Steel | 10 |  | N/A | 1 Amulet of Zenithar Replica |  |
| Fragment: Steel | 60 |  | N/A | 1 Horse Armor: Imperial Barding and Saddle |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Heavy Crossbow |  |
| Fragment: Steel | 60 |  | N/A | 1 Steel Shield |  |
| Fragment: Steel | 40 |  | N/A | 1 Blades Boots |  |
| Fragment: Steel | 40 |  | N/A | 1 Silver Greatsword |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Scimitar |  |
| Fragment: Steel | 25 |  | N/A | 1 Steel Greatsword Hilt |  |
| Fragment: Steel | 10 |  | N/A | 1 Toolkit: Builder's |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Sword Blade |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Death Hound Collar |  |
| Fragment: Steel | 80 |  | N/A | 1 Jarl of Eastmarch Armor |  |
| Fragment: Steel | 10 |  | N/A | 1 Dawnguard Light Gauntlets |  |
| Fragment: Steel | 4 |  | N/A | 1 Steel Shears |  |
| Fragment: Steel | 10 |  | N/A | 1 Toolkit: Smith's |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard Heavy Helmet |  |
| Fragment: Steel | 20 |  | N/A | 1 Dawnguard Light Cuirass - Black |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard Rune War Axe Replica |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Battleaxe Hilt |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial Heavy Bracers |  |
| Fragment: Steel | 40 |  | N/A | 1 Wolf Boots |  |
| Fragment: Steel | 10 |  | N/A | 1 Steel Dagger |  |
| Fragment: Steel | 60 |  | N/A | 1 Steel Greatsword Blade |  |
| Fragment: Steel | 60 |  | N/A | 1 Rueful Axe Replica |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Mace |  |
| Fragment: Steel | 40 |  | N/A | 1 Wolf Helmet |  |
| Fragment: Steel | 10 |  | N/A | 1 Dawnguard Light Helmet |  |
| Fragment: Steel | 40 |  | N/A | 1 Imperial Heavy Crossbow |  |
| Fragment: Steel | 60 |  | N/A | 1 Steel Cuirass |  |
| Fragment: Steel | 60 |  | N/A | 1 Horse Armor: Dawnguard Barding and Saddle - Adorned |  |
| Fragment: Steel | 60 |  | N/A | 1 Imperial Heavy Shield |  |
| Fragment: Steel | 20 |  | N/A | 1 Scaled Cuirass - Horned |  |
| Fragment: Steel | 60 |  | N/A | 1 Dawnguard Heavy Cuirass - Grey |  |
| Fragment: Steel | 40 |  | N/A | 1 Imperial Heavy Bow |  |
| Fragment: Steel | 40 |  | N/A | 1 Scaled Helmet |  |
| Fragment: Steel | 40 |  | N/A | 1 Imperial Officer Heavy Helmet |  |
| Fragment: Steel | 1 |  | N/A | 1 Bolt: Thieves Guild |  |
| Fragment: Steel | 60 |  | N/A | 1 Wolf Shield |  |
| Fragment: Steel | 60 |  | N/A | 1 Imperial Crested Heavy Helmet |  |
| Fragment: Steel | 20 |  | N/A | 1 Steel Bracers |  |
| Fragment: Steel | 20 |  | N/A | 1 Scaled Boots |  |
| Fragment: Steel | 60 |  | N/A | 1 Horse Armor: Black Hand Barding and Saddle |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial General Cuirass |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Greaves |  |
| Fragment: Steel | 80 |  | N/A | 1 Steel Pauldroned Cuirass - White |  |
| Fragment: Steel | 40 |  | N/A | 1 Blades Helmet |  |
| Fragment: Steel | 1 |  | N/A | 1 Bolt: Imperial |  |
| Fragment: Steel | 20 |  | N/A | 1 Jarl of Eastmarch Armguards |  |
| Fragment: Steel | 20 |  | N/A | 1 Dawnguard Light Cuirass - Red |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Plate Helmet |  |
| Fragment: Steel | 20 |  | N/A | 1 Dawnguard Reinforced Light Cuirass - Blue |  |
| Fragment: Steel | 60 |  | N/A | 1 Horse Armor: Nordic Barding and Saddle |  |
| Fragment: Steel | 20 |  | N/A | 1 Dawnguard Light Cuirass - Red |  |
| Fragment: Steel | 1 |  | N/A | 1 Arrow: Ancient Nordic Hero |  |
| Fragment: Steel | 2 |  | N/A | 1 Steel Scalpel |  |
| Fragment: Steel | 20 |  | N/A | 1 Akaviri Katana |  |
| Fragment: Steel | 1 |  | N/A | 1 Arrow: Steel |  |
| Fragment: Steel | 10 |  | N/A | 1 Toolkit: Jeweler's |  |
| Fragment: Steel | 20 |  | N/A | 1 Stormcloak Officer Helmet |  |
| Fragment: Steel | 80 |  | N/A | 1 Steel Battleaxe Head |  |
| Fragment: Steel | 2 |  | N/A | 1 Steel Embalming Pick |  |
| Fragment: Steel | 1 |  | N/A | 1 Bolt: Steel |  |
| Fragment: Steel | 40 |  | N/A | 1 Stormcloak General Boots |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard Improved Light Crossbow |  |
| Fragment: Steel | 55 |  | N/A | 1 Steel Furred Plate Cuirass |  |
| Fragment: Steel | 20 |  | N/A | 1 Dawnguard Heavy Boots |  |
| Fragment: Steel | 20 |  | N/A | 1 Imperial Light Shield |  |
| Fragment: Steel | 1 |  | N/A | 1 Stormcloak Officer Bracers |  |
| Fragment: Steel | 10 |  | N/A | 1 Steel Hunting Knife |  |
| Fragment: Steel | 40 |  | N/A | 1 Stormcloak Heavy Crossbow |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Greatsword |  |
| Fragment: Steel | 40 |  | N/A | 1 Dark Brotherhood Heavy Crossbow |  |
| Fragment: Steel | 80 |  | N/A | 1 Dawnguard Warhammer |  |
| Fragment: Steel | 40 |  | N/A | 1 Savior's Hide Replica - White |  |
| Fragment: Steel | 40 |  | N/A | 1 Dawnguard Rune Shield Replica |  |
| Fragment: Steel | 60 |  | N/A | 1 Horse Armor: Black Hand Barding and Saddle - Adorned |  |
| Fragment: Steel | 40 |  | N/A | 1 Steel Helmet |  |
| Fragment: Steel | 80 |  | N/A | 1 Steel Cuirass - White |  |
| Fur Large Tent | 1 |  | N/A | 1 Fur Large Tent (Two Bedrolls) |  |
| Fur Large Tent (Three Bedrolls) | 1 |  | N/A | 1 Fur Large Tent (Four Bedrolls) |  |
| Fur Large Tent (Two Bedrolls) | 1 |  | N/A | 1 Fur Large Tent (Three Bedrolls) |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Ornate White |  |
| Fur Plate | 1 |  | N/A | 1 Forsworn Cuirass |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Noble Black |  |
| Fur Plate | 1 |  | N/A | 1 Fur Backpack - Black |  |
| Fur Plate | 3 |  | N/A | 1 Fur Sleeveless Cuirass |  |
| Fur Plate | 2 |  | N/A | 1 Fur Vagabond Cuirass |  |
| Fur Plate | 2 |  | N/A | 1 Fur Rags - Pale |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Ornate White |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Light Trimmed White |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Dark Trimmed Black |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Ornate Brown |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Brown |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Trimmed White |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Dark Trimmed Brown |  |
| Fur Plate | 2 |  | N/A | 1 Fur Tattered Cuirass |  |
| Fur Plate | 1 |  | N/A | 1 Fur Bracers |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Light Trimmed Black |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Ornate Brown |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Ornate White |  |
| Fur Plate | 1 |  | N/A | 1 Forsworn Headdress |  |
| Fur Plate | 1 |  | N/A | 1 Forsworn Gauntlets |  |
| Fur Plate | 2 |  | N/A | 1 Fur Tattered Cuirass - Pale |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Noble White |  |
| Fur Plate | 2 |  | N/A | 1 Fur Makeshift Cuirass |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Light Trimmed Brown |  |
| Fur Plate | 1 |  | N/A | 1 Forsworn Boots |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Trimmed Black |  |
| Fur Plate | 1 |  | N/A | 1 Fur Kilt |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Trimmed Brown |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Ornate Black |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Trimmed White |  |
| Fur Plate | 2 |  | N/A | 1 Fur Scrap Cuirass |  |
| Fur Plate | 2 |  | N/A | 1 Fur Rags - Dark |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Light Trimmed White |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Black |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Dark Trimmed White |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - White |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Trimmed Brown |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Light Trimmed Brown |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Brown |  |
| Fur Plate | 1 |  | N/A | 1 Fur Boots |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Trimmed Black |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - White |  |
| Fur Plate | 3 |  | N/A | 1 Fur Cuirass |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - White |  |
| Fur Plate | 1 |  | N/A | 1 Imperial Outcast Bracers |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Ornate Black |  |
| Fur Plate | 1 |  | N/A | 1 Fur Shoes |  |
| Fur Plate | 1 |  | N/A | 1 Fur Backpack - Brown |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Ornate Brown |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Noble Brown |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Dark Trimmed Black |  |
| Fur Plate | 2 |  | N/A | 1 Furred Robes - Dark |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Ornate Black |  |
| Fur Plate | 1 |  | N/A | 1 Fur Helmet |  |
| Fur Plate | 1 |  | N/A | 1 Imperial Outcast Helmet |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Brown |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Brown |  |
| Fur Plate | 2 |  | N/A | 1 Furred Robes - Pale |  |
| Fur Plate | 1 |  | N/A | 1 Fur Backpack - White |  |
| Fur Plate | 2 |  | N/A | 1 Fur Rugged Cuirass |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Ornate Brown |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - Black |  |
| Fur Plate | 2 |  | N/A | 1 Fur Mantled Kilt |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Black |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Black |  |
| Fur Plate | 1 |  | N/A | 1 Wolfskin Hood - White |  |
| Fur Plate | 1 |  | N/A | 1 Fur Gauntlets |  |
| Fur Plate | 1 |  | N/A | 1 Bearskin Hood - Ornate Black |  |
| Fur Plate | 3 |  | N/A | 1 Bearskin Cloak - Ornate White |  |
| Fur Plate | 2 |  | N/A | 1 Fur Bedroll |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Light Trimmed Black |  |
| Fur Plate | 2 |  | N/A | 1 Wolfskin Cloak - Dark Trimmed White |  |
| Fur Small Tent | 1 |  | N/A | 1 Fur Small Tent (Two Bedrolls) |  |
| Garlic Boar | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Raw Boar Meat |  |
| Garlic Boar | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Raw Boar Meat |  |
| Garlic Bread | 2 |  | Oven | 1 Garlic 1 Bread Loaf 1 Butter |  |
| Garlic Bread | 2 |  | Oven | 1 Garlic 1 Bread Loaf 1 Butter |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Glass Bottle (Water) |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Jessica's Wine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 White-Gold Tower |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Nord Mead |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Flin |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Ale |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Ashfire Mead |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Argonian Bloodwine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Cliff Racer |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Black-Briar Reserve |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Ale |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Black-Briar Mead |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Juniper Berry Mead |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Argonian Ale |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Sadri's Sujamma |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Cinnabar Beer |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Dragon's Breath Mead |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Alto Blanc Wine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Honningbrew Mead |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Cyrodilic Brandy |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Village Red Wine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Sujamma |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Firebrand Wine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Stros M'Kai Rum |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Velvet LeChance |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Bottled Milk |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Mazte |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Shein |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Emberbrand Wine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Mulled Wine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Village White Wine |  |
| Glass Bottle (Empty) | 1 |  | N/A | 1 Alto Noir Wine |  |
| Glass Bottle (Water) | 1 |  | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Glass Bottle (Water) | 1 |  | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Glazed Goat Loin | 1 |  | Cook pot | 2 Snowberries 1 Honey 1 Raw Goat Meat |  |
| Glazed Goat Loin | 1 |  | Cook pot | 2 Snowberries 1 Honey 1 Raw Goat Meat |  |
| Goat and Potato Stew | 1 |  | Cook pot | 1 Potato 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Goat and Potato Stew | 1 |  | Cook pot | 1 Potato 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Goat Cheese Slice | 2 |  | N/A | 1 Goat Cheese Wedge |  |
| Goat Cheese Wedge | 3 |  | N/A | 1 Goat Cheese Wheel |  |
| Goat Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Goat Leg |  |
| Goat Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Goat Meat |  |
| Goat Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Goat Leg |  |
| Goat Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Goat Meat |  |
| High King's Stew | 2 |  | Cook pot | 1 Carrot 1 Leek 1 Raw Dragon Meat |  |
| High King's Stew | 2 |  | Cook pot | 1 Carrot 1 Leek 1 Raw Dragon Meat |  |
| Honeyed Mammoth Roast | 1 |  | Cook pot | 1 Honey 1 Raw Mammoth Meat |  |
| Honeyed Mammoth Roast | 1 |  | Cook pot | 1 Honey 1 Raw Mammoth Meat |  |
| Honningbrew Mead | 2 |  | Brewing Barrel | 2 Green Apple 1 Honey |  |
| Honningbrew Mead | 2 |  | Brewing Barrel | 2 Green Apple 1 Honey |  |
| Horker and Ash Yam Stew | 2 |  | Cook pot | 1 Salt 1 Garlic 1 Raw Horker Meat 3 Ash Yam 1 Glass Bottle (Water) |  |
| Horker and Ash Yam Stew | 2 |  | Cook pot | 1 Salt 1 Garlic 1 Raw Horker Meat 3 Ash Yam 1 Glass Bottle (Water) |  |
| Horker Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Horker Meat |  |
| Horker Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Horker Meat |  |
| Horker Stew | 1 |  | Cook pot | 1 Garlic 1 Lavender 1 Tomato 1 Raw Horker Meat 1 Glass Bottle (Water) |  |
| Horker Stew | 1 |  | Cook pot | 1 Garlic 1 Lavender 1 Tomato 1 Raw Horker Meat 1 Glass Bottle (Water) |  |
| Horse Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Horse Meat |  |
| Horse Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Horse Meat |  |
| Hot Honey Horker | 1 |  | Cook pot | 1 Raw Horker Meat 1 Honey |  |
| Hot Honey Horker | 1 |  | Cook pot | 1 Raw Horker Meat 1 Honey |  |
| Hunter's Hearty Stew | 2 |  | Cook pot | 1 Cabbage 1 Potato 1 Raw Venison 1 Raw Elk Meat 1 Glass Bottle (Water) |  |
| Hunter's Hearty Stew | 2 |  | Cook pot | 1 Cabbage 1 Potato 1 Raw Venison 1 Raw Elk Meat 1 Glass Bottle (Water) |  |
| Ingot: Galatite | 4 |  | N/A | 1 Nordic Cuirass - Brown |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Boots - Brown |  |
| Ingot: Galatite | 4 |  | N/A | 1 Champion's Cudgel Replica |  |
| Ingot: Galatite | 1 |  | N/A | 1 Nordic War Axe |  |
| Ingot: Galatite | 1 |  | N/A | 1 Skyforge Steel Heavy Bow |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Boots - White |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Helmet - Black |  |
| Ingot: Galatite | 3 |  | N/A | 1 Skyforge Steel Battleaxe |  |
| Ingot: Galatite | 2 |  | N/A | 1 Skyforge Steel Greatsword |  |
| Ingot: Galatite | 1 |  | N/A | 1 Nordic Sword |  |
| Ingot: Galatite | 3 |  | N/A | 1 Skyforge Steel Aegis |  |
| Ingot: Galatite | 1 |  | N/A | 1 Skyforge Steel War Axe |  |
| Ingot: Galatite | 3 |  | N/A | 1 Nordic Shield - Black |  |
| Ingot: Galatite | 1 |  | N/A | 1 Skyforge Steel Sword |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Boots - Black |  |
| Ingot: Galatite | 4 |  | N/A | 1 Skyforge Steel Warhammer |  |
| Ingot: Galatite | 3 |  | N/A | 1 Nordic Shield - Brown |  |
| Ingot: Galatite | 1 |  | N/A | 1 Nordic Gauntlets - Black |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Greatsword |  |
| Ingot: Galatite | 4 |  | N/A | 1 Nordic Cuirass - White |  |
| Ingot: Galatite | 3 |  | N/A | 1 Nordic Shield - White |  |
| Ingot: Galatite | 1 |  | N/A | 1 Nordic Gauntlets - Brown |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Battleaxe |  |
| Ingot: Galatite | 1 |  | N/A | 1 Nordic Gauntlets - White |  |
| Ingot: Galatite | 4 |  | N/A | 1 Nordic Cuirass - Black |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Mace |  |
| Ingot: Galatite | 2 |  | N/A | 1 Nordic Heavy Bow |  |
| Ingot: Galatite | 3 |  | N/A | 1 Nordic Warhammer |  |
| Ingot: Moonstone | 2 |  | N/A | 1 Auriel's Bow Replica |  |
| Ingot: Moonstone | 1 |  | N/A | 1 Snow Elf Crown |  |
| Ingot: Moonstone | 2 |  | N/A | 1 Snow Elf Boots |  |
| Ingot: Moonstone | 1 |  | N/A | 1 Snow Elf Gauntlets |  |
| Ingot: Moonstone | 4 |  | N/A | 1 Snow Elf Cuirass |  |
| Ingot: Quicksilver | 1 |  | N/A | 1 Nordic Heavy Crossbow |  |
| Item Name |  |  | Proximity(When Player Crafting) | Components | Requirements |
| Jazbay Crostata | 2 |  | Oven | 10 Jazbay Grapes 1 Honey 1 Flour 1 Butter |  |
| Jazbay Crostata | 2 |  | Oven | 10 Jazbay Grapes 1 Honey 1 Flour 1 Butter |  |
| Juniper Berry Crostata | 2 |  | Oven | 10 Juniper Berries 1 Honey 1 Flour 1 Butter |  |
| Juniper Berry Crostata | 2 |  | Oven | 10 Juniper Berries 1 Honey 1 Flour 1 Butter |  |
| Juniper Berry Mead | 2 |  | Brewing Barrel | 2 Juniper Berries 1 Honey |  |
| Juniper Berry Mead | 2 |  | Brewing Barrel | 2 Juniper Berries 1 Honey |  |
| Juniper Tea | 1 |  | Cook pot | 3 Juniper Berries 1 Honeycomb 1 Glass Bottle (Water) |  |
| Juniper Tea | 1 |  | Cook pot | 3 Juniper Berries 1 Honeycomb 1 Glass Bottle (Water) |  |
| Kindling | 1 |  | N/A | 1 Bolt: Dark Brotherhood |  |
| Kindling | 4 |  | N/A | 1 Wooden Roped Bucket |  |
| Kindling | 1 |  | N/A | 1 Bolt: Dwarven |  |
| Kindling | 3 |  | N/A | 1 Wooden Heavy Bow |  |
| Kindling | 1 |  | N/A | 1 Wooden Ladle |  |
| Kindling | 1 |  | N/A | 1 Bolt: Glass |  |
| Kindling | 1 |  | N/A | 1 Bolt: Stormcloak |  |
| Kindling | 1 |  | N/A | 1 Wooden Plate |  |
| Kindling | 6 |  | N/A | 1 Wooden Drum |  |
| Kindling | 3 |  | N/A | 1 Wooden Light Bow |  |
| Kindling | 1 |  | N/A | 1 Arrow: Ancient Nordic |  |
| Kindling | 1 |  | N/A | 1 Bolt: Orcish |  |
| Kindling | 2 |  | N/A | 1 Deadwood |  |
| Kindling | 1 |  | N/A | 1 Arrow: Ancient Nordic Hero |  |
| Kindling | 10 |  | N/A | 5 Wooden Battlestaff |  |
| Kindling | 4 |  | N/A | 1 Wooden Bellows |  |
| Kindling | 5 |  | Smelter | 1 Iron Woodcutter's Axe |  |
| Kindling | 6 |  | N/A | 1 Wooden Lute |  |
| Kindling | 4 |  | N/A | 1 Wood |  |
| Kindling | 1 |  | N/A | 1 Bolt: Ancient Nordic Hero |  |
| Kindling | 10 |  | N/A | 1 Toolkit: Alchemist's |  |
| Kindling | 4 |  | N/A | 1 Wooden Pitchfork |  |
| Kindling | 1 |  | N/A | 1 Arrow: Glass |  |
| Kindling | 1 |  | N/A | 1 Bolt: Elven |  |
| Kindling | 1 |  | N/A | 1 Bolt: Silver |  |
| Kindling | 2 |  | N/A | 1 Wooden Torch |  |
| Kindling | 2 |  | N/A | 1 Wooden Fishing Rod |  |
| Kindling | 1 |  | N/A | 1 Arrow: Iron |  |
| Kindling | 2 |  | N/A | 1 Wooden Torch (Bright) |  |
| Kindling | 1 |  | N/A | 1 Arrow: Falmer |  |
| Kindling | 10 |  | N/A | 1 Toolkit: Brewer's |  |
| Kindling | 1 |  | N/A | 1 Arrow: Ebony |  |
| Kindling | 4 |  | N/A | 1 Wooden Well Bucket |  |
| Kindling | 1 |  | N/A | 1 Wooden Bowl |  |
| Kindling | 1 |  | N/A | 1 Bolt: Steel |  |
| Kindling | 1 |  | N/A | 1 Arrow: Nordic |  |
| Kindling | 1 |  | N/A | 1 Bolt: Thieves Guild |  |
| Kindling | 1 |  | N/A | 1 Bolt: Iron |  |
| Kindling | 1 |  | N/A | 1 Bolt: Dawnguard |  |
| Kindling | 5 |  | N/A | 1 Iron Pickaxe |  |
| Kindling | 1 |  | N/A | 1 Branches |  |
| Kindling | 1 |  | N/A | 1 Bolt: Imperial |  |
| Kindling | 1 |  | N/A | 1 Arrow: Elven |  |
| Kindling | 1 |  | N/A | 1 Arrow: Orcish |  |
| Kindling | 1 |  | N/A | 1 Arrow: Forsworn |  |
| Kindling | 10 |  | N/A | 1 Toolkit: Survivalist's |  |
| Kindling | 10 |  | N/A | 1 Wooden Light Crossbow |  |
| Kindling | 2 |  | N/A | 1 Wooden Broom |  |
| Kindling | 10 |  | N/A | 1 Toolkit: Tailor's |  |
| Kindling | 1 |  | N/A | 1 Arrow: Skyforge Steel |  |
| Kindling | 1 |  | N/A | 1 Arrow: Steel |  |
| Kindling | 2 |  | N/A | 1 Wooden Flute |  |
| Kindling | 1 |  | N/A | 1 Arrow: Dwarven |  |
| Kindling | 1 |  | N/A | 1 Wooden Spigot |  |
| Knucklebones (Strange Brew) | 1 |  | N/A | 3 Fragment: Bone | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 3 |
| Lavender Honey Dumpling | 2 |  | Oven | 6 Lavender 1 Moon Sugar 1 Honey 1 Flour |  |
| Lavender Honey Dumpling | 2 |  | Oven | 6 Lavender 1 Moon Sugar 1 Honey 1 Flour |  |
| Lavender Tea | 1 |  | Cook pot | 2 Lavender 3 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Lavender Tea | 1 |  | Cook pot | 2 Lavender 3 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Leather | 2 |  | N/A | 1 Leather Doublet |  |
| Leather | 3 |  | N/A | 1 Studded Furred Cuirass |  |
| Leather | 2 |  | N/A | 1 Hide Scrap Robes |  |
| Leather | 2 |  | N/A | 1 Hide Vagabond Robes - Dark |  |
| Leather | 2 |  | N/A | 1 Leather Boiled Cuirass |  |
| Leather | 2 |  | N/A | 1 Leather Vagabond Cuirass |  |
| Leather | 2 |  | N/A | 1 Hide Scrap Cuirass |  |
| Leather | 2 |  | N/A | 1 Hide Furred Vagabond Cuirass |  |
| Leather | 2 |  | N/A | 1 Hide Tattered Cuirass |  |
| Leather | 2 |  | N/A | 1 Leather Rugged Cuirass - Pale |  |
| Leather | 2 |  | N/A | 1 Hide Makeshift Cuirass |  |
| Leather | 2 |  | N/A | 1 Hide Roughspun Tunic |  |
| Leather | 2 |  | N/A | 1 Hide Rugged Cuirass |  |
| Leather | 2 |  | N/A | 1 Hide Furred Cuirass |  |
| Leather | 2 |  | N/A | 1 Leather Rugged Cuirass - Dark |  |
| Leather | 2 |  | N/A | 1 Leather Doublet - Dark |  |
| Leather | 2 |  | N/A | 1 Hide Vagabond Robes - Pale |  |
| Leather | 2 |  | N/A | 1 Hide Vagabond Cuirass |  |
| Leather | 2 |  | N/A | 1 Hide Vagabond Robes - Dark |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Ornate White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Dark Trimmed Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Dark Trimmed White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Noble White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Ornate Black |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Trimmed Black |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Ornate Black |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Ornate White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Light Trimmed Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Black |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Ornate Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Light Trimmed White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Trimmed White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Ornate Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Noble Black |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Black |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Noble Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - Trimmed Brown |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Light Trimmed Black |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Bearskin Hood - White |  |
| Leather Helmet | 1 |  | N/A | 1 Leather Wolfskin Hood - Dark Trimmed Black |  |
| Leather Large Tent | 1 |  | N/A | 1 Leather Large Tent (Two Bedrolls) |  |
| Leather Large Tent (Two Bedrolls) | 1 |  | N/A | 1 Leather Large Tent (Three Bedrolls) |  |
| Leather Small Tent | 1 |  | N/A | 1 Leather Small Tent (Two Bedrolls) |  |
| Leather Strips | 4 |  | N/A | 1 Leather Executioner's Hood |  |
| Leather Strips | 4 |  | N/A | 1 Leather Hood |  |
| Leather Strips | 10 |  | N/A | 1 Thieves Guild Sleeveless Improved Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Improved Gloves - Grey |  |
| Leather Strips | 10 |  | N/A | 1 Thieves Guild Improved Sleeveless Cuirass - Grey |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Boots |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Leather Barding and Saddle |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Hunter's Saddle |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Knight's Saddle |  |
| Leather Strips | 10 |  | N/A | 1 Shrouded Worn Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Hide Helmet |  |
| Leather Strips | 4 |  | N/A | 1 Vampire Gauntlets |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Imperial Saddle |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Gloves |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Ornate Barding and Saddle |  |
| Leather Strips | 2 |  | N/A | 1 Hide Bracers |  |
| Leather Strips | 4 |  | N/A | 1 Summerset Shadows Gloves |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - The Pale |  |
| Leather Strips | 4 |  | N/A | 1 Summerset Shadows Hood |  |
| Leather Strips | 12 |  | N/A | 1 Imperial Studded Cuirass |  |
| Leather Strips | 5 |  | N/A | 1 Noble Gilded Wristguards |  |
| Leather Strips | 10 |  | N/A | 1 Summerset Shadows Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Gloves - Grey |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - Haafingar |  |
| Leather Strips | 5 |  | N/A | 1 Shrouded Supple Cowl - Maskless |  |
| Leather Strips | 3 |  | N/A | 1 Fur Guard's Boots |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Hood |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Fur Saddle |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - Winterhold |  |
| Leather Strips | 5 |  | N/A | 1 Hide Shield |  |
| Leather Strips | 10 |  | N/A | 1 Thieves Guild Cuirass |  |
| Leather Strips | 6 |  | N/A | 1 Thieves Guild Master's Hood |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Cowl |  |
| Leather Strips | 6 |  | N/A | 1 Thieves Guild Master's Gloves |  |
| Leather Strips | 6 |  | N/A | 1 Vampire Hood |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Minstrel's Saddle |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Gloves |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Cowl |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Improved Gloves |  |
| Leather Strips | 4 |  | N/A | 1 Leather Hood - Black |  |
| Leather Strips | 10 |  | N/A | 1 Vampire Cuirass - Grey |  |
| Leather Strips | 5 |  | N/A | 1 Shrouded Supple Gloves |  |
| Leather Strips | 12 |  | N/A | 1 Imperial Outcast Cuirass |  |
| Leather Strips | 12 |  | N/A | 1 Shrouded Cuirass |  |
| Leather Strips | 6 |  | N/A | 1 Thieves Guild Master's Cowl |  |
| Leather Strips | 12 |  | N/A | 1 Vampire Royal Cuirass |  |
| Leather Strips | 8 |  | N/A | 1 Studded Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Improved Boots - Grey |  |
| Leather Strips | 6 |  | N/A | 1 Thieves Guild Master's Boots |  |
| Leather Strips | 8 |  | N/A | 1 Stormcloak Light Cuirass |  |
| Leather Strips | 10 |  | N/A | 1 Thieves Guild Sleeveless Cuirass - Grey |  |
| Leather Strips | 12 |  | N/A | 1 Imperial General Cuirass |  |
| Leather Strips | 8 |  | N/A | 1 Hide Cuirass |  |
| Leather Strips | 12 |  | N/A | 1 Vampire Lord Robes |  |
| Leather Strips | 4 |  | N/A | 1 Imperial Light Bracers |  |
| Leather Strips | 4 |  | N/A | 1 Vampire Boots |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - The Rift |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Improved Hood - Grey |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - The Reach |  |
| Leather Strips | 12 |  | N/A | 1 Leather Executioner's Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Worn Boots |  |
| Leather Strips | 8 |  | N/A | 1 Leather Cuirass |  |
| Leather Strips | 12 |  | N/A | 1 Imperial Light Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Boots |  |
| Leather Strips | 3 |  | N/A | 1 Fur Guard's Gauntlets |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - Hjaalmarch |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - Whiterun |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Cowl - Maskless |  |
| Leather Strips | 4 |  | N/A | 1 Leather Boots |  |
| Leather Strips | 8 |  | N/A | 1 Shrouded Sleeveless Cuirass |  |
| Leather Strips | 7 |  | N/A | 1 Noble Armguards |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Leather Barding and Saddle - Mail |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Worn Cowl - Maskless |  |
| Leather Strips | 5 |  | N/A | 1 Shrouded Supple Cowl |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Big Game Saddle |  |
| Leather Strips | 4 |  | N/A | 1 Summerset Shadows Boots |  |
| Leather Strips | 12 |  | N/A | 1 Thieves Guild Improved Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Hide Boots |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Cowl - Grey |  |
| Leather Strips | 10 |  | N/A | 1 Vampire Cuirass - Red |  |
| Leather Strips | 8 |  | N/A | 1 Shrouded Sleeveless Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Hood - Grey |  |
| Leather Strips | 8 |  | N/A | 1 Stormcloak Officer Cuirass |  |
| Leather Strips | 10 |  | N/A | 1 Thieves Guild Sleeveless Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Worn Cowl |  |
| Leather Strips | 8 |  | N/A | 1 Silk Fur-Trimmed Clothes |  |
| Leather Strips | 16 |  | N/A | 1 Thieves Guild Master's Cuirass |  |
| Leather Strips | 10 |  | N/A | 1 Shrouded Cuirass |  |
| Leather Strips | 4 |  | N/A | 1 Leather Bracers |  |
| Leather Strips | 4 |  | N/A | 1 Leather Helmet |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Improved Hood |  |
| Leather Strips | 10 |  | N/A | 1 Stormcloak Sleeved Heavy Cuirass |  |
| Leather Strips | 12 |  | N/A | 1 Thieves Guild Master's Sleeveless Cuirass |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Traveler's Saddle |  |
| Leather Strips | 4 |  | N/A | 1 Shrouded Worn Gloves |  |
| Leather Strips | 4 |  | N/A | 1 Imperial Light Boots |  |
| Leather Strips | 12 |  | N/A | 1 Thieves Guild Improved Cuirass - Grey |  |
| Leather Strips | 4 |  | N/A | 1 Leather Executioner's Boots |  |
| Leather Strips | 4 |  | N/A | 1 Leather Executioner's Gloves |  |
| Leather Strips | 4 |  | N/A | 1 Imperial Light Helmet |  |
| Leather Strips | 10 |  | N/A | 1 Vampire Cuirass - Dark |  |
| Leather Strips | 8 |  | N/A | 1 Scaled Cuirass - Horned |  |
| Leather Strips | 8 |  | N/A | 1 Scaled Cuirass |  |
| Leather Strips | 12 |  | N/A | 1 Thieves Guild Cuirass - Grey |  |
| Leather Strips | 4 |  | N/A | 1 Linen Moth Priest Sandals |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Improved Boots |  |
| Leather Strips | 8 |  | N/A | 1 Fur Guard's Cuirass - Falkreath |  |
| Leather Strips | 5 |  | N/A | 1 Shrouded Supple Boots |  |
| Leather Strips | 4 |  | N/A | 1 Thieves Guild Boots - Grey |  |
| Leather Strips | 10 |  | N/A | 1 Horse Armor: Shadowmere's Saddle |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Grey |  |
| Linen Cloth | 2 |  | N/A | 1 Linen Mage Tunic - White and Orange |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Red |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Purple |  |
| Linen Cloth | 1 |  | N/A | 1 Linen Head Bandages |  |
| Linen Cloth | 1 |  | N/A | 1 Linen Cowl - White |  |
| Linen Cloth | 2 |  | N/A | 1 Linen Barkeep's Clothes - White |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Yellow |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Tan |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Orange |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Black |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Brown |  |
| Linen Cloth | 1 |  | N/A | 1 Linen Miner's Clothes - White |  |
| Linen Cloth | 1 |  | N/A | 1 Linen Chef's Hat |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Green |  |
| Linen Cloth | 2 |  | N/A | 1 Linen Mage Tunic - White and Brown |  |
| Linen Cloth | 1 |  | N/A | 1 Linen Arm Bandages |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Blue |  |
| Linen Cloth | 2 |  | N/A | 1 Linen Mage Tunic - White and Quilted Brown |  |
| Linen Cloth | 1 |  | N/A | 1 Linen Headscarf |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Indigo |  |
| Linen Cloth | 2 |  | N/A | 1 Linen Chef's Tunic |  |
| Linen Cloth | 2 |  | N/A | 1 Linen Mage Tunic - White, Green, and Brown |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Clothes - Black and Green |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Hood - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Traveler Robes - Black and Orange |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Cowl - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Traveler Robes - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Leather Clothes - Black and Brown |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Traveler Robes - Black and Brown |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Traveler Robes - Black, Brown, and Green |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Clothes - Black, Grey, and Tan |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Surcoat - Black and Brown |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Leather Clothes - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Surcoat - Black and Green |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Mourner's Clothes |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Work Boots - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Leather Quilted Clothes - Black |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Tunic - Indigo and Green |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Gloves - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Mage Robes - Black and Grey |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Skirt - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Traveler Robes - Black, Brown, and Grey |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Mourner's Headscarf |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Alik'r Garb - Red |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Monk Boots - Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Traveler Robes - Black, Tan, and White |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Mage Robes - Black and White |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Robes - Black |  |
| Linen Cloth - Black | 1 |  | N/A | 1 Linen Cowl - Necromancer |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Tunic - Belted Black |  |
| Linen Cloth - Black | 2 |  | N/A | 1 Linen Robes - Necromancer's |  |
| Linen Cloth - Blue | 2 |  | N/A | 1 Linen Robes - Blue |  |
| Linen Cloth - Blue | 1 |  | N/A | 1 Linen Gloves - Blue |  |
| Linen Cloth - Blue | 1 |  | N/A | 1 Linen Tunic - Blue and Orange |  |
| Linen Cloth - Blue | 2 |  | N/A | 1 Linen Mage Tunic - Blue and Quilted Brown |  |
| Linen Cloth - Blue | 1 |  | N/A | 1 Linen Cowl - Blue |  |
| Linen Cloth - Blue | 1 |  | N/A | 1 Linen Alik'r Hood - Blue |  |
| Linen Cloth - Blue | 1 |  | N/A | 1 Linen Dunmer Tunic - Blue |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Mage Robes - Brown and White |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Child's Skaal Shoes |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Robes - Brown |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Monk Boots - Brown |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Clothes - Brown and Grey |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Dunmer Hood - Brown |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Stitched Boots |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Child's Linen Shoes |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Dunmer Boots |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Gloves - Brown |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Doublet - Brown and Tan |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Shoes - Brown |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Robes - Orange |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Skirt - Quilted Brown |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Miner's Clothes - Brown |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Cowl - Brown |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Dunmer Tunic - Brown |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Tunic - Belted Red |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Barkeep's Clothes - Brown |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Alik'r Boots - Dark |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Clothes - Brown, Grey, and Tan |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Doublet - Brown and Green |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Clothes - Collared Brown and Orange |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Blacksmith's Shoes |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Traveler Robes - Brown and Grey |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Leather Tiled Clothes - Brown |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Cap |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Doublet - Brown and Grey |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Traveler Robes - Brown and White |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Clothes - Brown, White, and Tan |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Clothes - Brown and Tan |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Traveler Robes - Brown, Tan, and White |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Farm Boots |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Alik'r Garb - White |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Linen Mage Robes - Brown and Tan |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Tunic - Tan |  |
| Linen Cloth - Brown | 2 |  | N/A | 1 Leather Tiled Clothes - Brown and Black |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Alik'r Boots - Dark |  |
| Linen Cloth - Brown | 1 |  | N/A | 1 Linen Work Boots - Brown |  |
| Linen Cloth - Green | 1 |  | N/A | 1 Linen Miner's Boots |  |
| Linen Cloth - Green | 1 |  | N/A | 1 Linen Gloves - Green |  |
| Linen Cloth - Green | 1 |  | N/A | 1 Linen Hood - Green |  |
| Linen Cloth - Green | 1 |  | N/A | 1 Linen Tunic - Belted Green |  |
| Linen Cloth - Green | 2 |  | N/A | 1 Linen Tunic - Adorned Green |  |
| Linen Cloth - Green | 2 |  | N/A | 1 Linen Mage Robes - Green and Tan |  |
| Linen Cloth - Green | 2 |  | N/A | 1 Linen Skirt - Green and Black |  |
| Linen Cloth - Green | 2 |  | N/A | 1 Linen Robes - Green |  |
| Linen Cloth - Green | 1 |  | N/A | 1 Linen Cowl - Green |  |
| Linen Cloth - Green | 1 |  | N/A | 1 Linen Tavern Clothes |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Plain Robes - Mantled Grey and Orange |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Robes - Grey |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Plain Robes - Grey and Brown |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Miner's Clothes - Grey and Tan |  |
| Linen Cloth - Grey | 1 |  | N/A | 1 Linen Gloves - Grey |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Mage Tunic - Grey and Brown |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Doublet - Tan, Grey, and White |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Moth Priest Robes |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Mage Tunic - Grey and Black |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Plain Robes - Grey and Red |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Doublet - Tan and Grey |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Plain Robes - Mantled Grey and Brown |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Plain Robes - Mantled Grey and Red |  |
| Linen Cloth - Grey | 2 |  | N/A | 1 Linen Plain Robes - Grey and Orange |  |
| Linen Cloth - Grey | 1 |  | N/A | 1 Linen Cowl - Grey |  |
| Linen Cloth - Indigo | 2 |  | N/A | 1 Linen Skirt - Indigo and Black |  |
| Linen Cloth - Indigo | 1 |  | N/A | 1 Linen Dunmer Hood - Blue |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Plain Robes - Mantled Orange and Brown |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Clothes - Orange |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Clothes - Orange, White, and Brown |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Miner's Clothes - Orange and Black |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Plain Robes - Mantled Orange |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Plain Robes - Orange and Brown |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Clothes - Orange, Grey, and Tan |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Plain Robes - Orange |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Miner's Clothes - Orange and Brown |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Clothes - Collared Orange and White |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Skirt - Orange and Black |  |
| Linen Cloth - Orange | 2 |  | N/A | 1 Linen Clothes - Orange, White, and Tan |  |
| Linen Cloth - Orange | 1 |  | N/A | 1 Linen Cowl - Orange |  |
| Linen Cloth - Purple | 2 |  | N/A | 1 Linen Traveler Robes - Purple, Orange, and White |  |
| Linen Cloth - Purple | 1 |  | N/A | 1 Linen Cowl - Purple |  |
| Linen Cloth - Purple | 2 |  | N/A | 1 Linen Traveler Robes - Purple, Tan, and White |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Dunmer Tunic - Red |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Cowl - Red |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Alik'r Hood - Red |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Gloves - Red |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Blacksmith's Apron - Red |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Dunmer Hood - Red |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Alik'r Hood - Red |  |
| Linen Cloth - Red | 1 |  | N/A | 1 Linen Alik'r Garb - Red |  |
| Linen Cloth - Tan | 1 |  | N/A | 1 Linen Tunic - Belted Tan |  |
| Linen Cloth - Tan | 2 |  | N/A | 1 Linen Doublet - Tan |  |
| Linen Cloth - Tan | 1 |  | N/A | 1 Linen Miner's Clothes - Tan |  |
| Linen Cloth - Tan | 2 |  | N/A | 1 Linen Mage Robes - Tan and White |  |
| Linen Cloth - Tan | 1 |  | N/A | 1 Linen Alik'r Boots - Tan |  |
| Linen Cloth - Tan | 1 |  | N/A | 1 Linen Miner's Shirt |  |
| Linen Cloth - Tan | 1 |  | N/A | 1 Linen Cuffed Boots |  |
| Linen Cloth - Yellow | 1 |  | N/A | 1 Linen Tunic - Embroidered Brown |  |
| Linen Cloth - Yellow | 1 |  | N/A | 1 Linen Cowl - Yellow |  |
| Linen Cloth - Yellow | 2 |  | N/A | 1 Linen Miner's Clothes - Yellow and Brown |  |
| Linen Head Bandages | 1 |  | N/A | 2 Linen Cloth |  |
| Linen Robes - Blue | 1 |  | N/A | 1 Linen Robes of Regeneration - Blue |  |
| Linen Thread | 4 |  | N/A | 1 Linen Moth Priest Blindfold |  |
| Linen Thread | 2 |  | N/A | 1 Linen Robes - Red |  |
| Linen Thread | 2 |  | N/A | 1 Linen Blacksmith's Apron - White |  |
| Linen Thread | 2 |  | N/A | 1 Linen Cloth |  |
| Linen Wrap | 1 |  | N/A | 1 Linen Ragged Cap |  |
| Linen Wrap | 1 |  | N/A | 1 Linen Roughspun Tunic |  |
| Linen Wrap | 1 |  | N/A | 1 Linen Footwraps |  |
| Linen Wrap | 1 |  | N/A | 1 Linen Ragged Boots |  |
| Linen Wrap | 2 |  | N/A | 1 Linen Ragged Robes |  |
| Linen Wrap | 1 |  | N/A | 1 Linen Prisoner's Rags |  |
| Mammoth Balls | 6 |  | Cook pot | 1 Garlic 1 Tomato 1 Raw Mammoth Meat |  |
| Mammoth Balls | 6 |  | Cook pot | 1 Garlic 1 Tomato 1 Raw Mammoth Meat |  |
| Mammoth Bone Club | 1 |  | N/A | 3 Leather Strips 1 Animal Bone (Enormous) | Animal Harvesting Skill Greater or Equal to 1 |
| Mammoth Bone Masterwork Club | 1 |  | N/A | 3 Troll Fat 3 Hide Lace 1 Animal Bone (Enormous) | Animal Harvesting Skill Greater or Equal to 4 |
| Mammoth Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Mammoth Snout |  |
| Mammoth Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Mammoth Meat |  |
| Mammoth Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Mammoth Meat |  |
| Mammoth Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Mammoth Snout |  |
| Mammoth Tomato Stew | 2 |  | Cook pot | 2 Tomato 1 Raw Mammoth Meat 1 Glass Bottle (Water) |  |
| Mammoth Tomato Stew | 2 |  | Cook pot | 2 Tomato 1 Raw Mammoth Meat 1 Glass Bottle (Water) |  |
| Marinated Mammoth in Elsweyr Sauce | 1 |  | Cook pot | 2 Honningbrew Mead 1 Moon Sugar 1 Raw Mammoth Meat |  |
| Marinated Mammoth in Elsweyr Sauce | 1 |  | Cook pot | 2 Honningbrew Mead 1 Moon Sugar 1 Raw Mammoth Meat |  |
| Mashed Troll | 1 |  | Cook pot | 1 Garlic 1 Potato 1 Raw Troll Meat |  |
| Mashed Troll | 1 |  | Cook pot | 1 Garlic 1 Potato 1 Raw Troll Meat |  |
| Mead Braised Bear | 1 |  | Cook pot | 1 Nord Mead 1 Raw Bear Meat |  |
| Mead Braised Bear | 1 |  | Cook pot | 1 Nord Mead 1 Raw Bear Meat |  |
| Meat Pie | 1 |  | Oven | 1 Salt 1 Raw Beef 1 Bottled Milk 1 Flour 1 Butter |  |
| Meat Pie | 1 |  | Oven | 1 Salt 1 Raw Beef 1 Bottled Milk 1 Flour 1 Butter |  |
| Mild Acid | 1 |  | Cook pot | 1 Chaurus Venom (Crude) |  |
| Mild Acid | 1 |  | Cook pot | 5 Spider Egg |  |
| Mild Acid | 1 |  | Cook pot | 1 Chaurus Venom (Crude) |  |
| Mild Acid | 1 |  | Cook pot | 2 Spider Venom (Crude) |  |
| Mild Acid | 1 |  | Cook pot | 2 Spider Venom (Crude) |  |
| Mild Acid | 1 |  | Cook pot | 5 Spider Egg |  |
| Minced Marinated Bear | 2 |  | Cook pot | 1 Salt 2 Juniper Berries 1 Raw Bear Meat |  |
| Minced Marinated Bear | 2 |  | Cook pot | 1 Salt 2 Juniper Berries 1 Raw Bear Meat |  |
| Moon Dance Tea | 1 |  | Cook pot | 2 Luna Moth Wing 1 Moon Sugar 1 Glass Bottle (Water) |  |
| Moon Dance Tea | 1 |  | Cook pot | 2 Luna Moth Wing 1 Moon Sugar 1 Glass Bottle (Water) |  |
| Mortar and Pestle | 1 |  | N/A | 1 Animal Bone (Small) 1 Animal Bone (Large) | Animal Harvesting Skill Greater than 0 |
| Morthal Mudders | 1 |  | Cook pot | 1 Ale 1 Swamp Fungal Pod 1 Raw Mudcrab Meat |  |
| Morthal Mudders | 1 |  | Cook pot | 1 Ale 1 Swamp Fungal Pod 1 Raw Mudcrab Meat |  |
| Mountain Flower Tea | 1 |  | Cook pot | 1 Blue Mountain Flower 1 Red Mountain Flower 1 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Mountain Flower Tea | 1 |  | Cook pot | 1 Blue Mountain Flower 1 Red Mountain Flower 1 Purple Mountain Flower 1 Glass Bottle (Water) |  |
| Mudcrab Chowder | 1 |  | Cook pot | 1 Potato 1 Bottled Milk 1 Raw Mudcrab Meat |  |
| Mudcrab Chowder | 1 |  | Cook pot | 1 Potato 1 Bottled Milk 1 Raw Mudcrab Meat |  |
| Mudcrab Egg Scramble | 1 |  | Cook pot | 1 Chicken's Egg 1 Raw Mudcrab Meat |  |
| Mudcrab Egg Scramble | 1 |  | Cook pot | 1 Chicken's Egg 1 Raw Mudcrab Meat |  |
| Mudcrab Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Mudcrab Legs |  |
| Mudcrab Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Mudcrab Meat |  |
| Mudcrab Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Mudcrab Legs |  |
| Mudcrab Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Mudcrab Meat |  |
| Mullwine Braised Mammoth | 1 |  | Cook pot | 1 Mulled Wine 1 Raw Mammoth Meat |  |
| Mullwine Braised Mammoth | 1 |  | Cook pot | 1 Mulled Wine 1 Raw Mammoth Meat |  |
| Nirn Spring Tea | 1 |  | Cook pot | 1 Nirnroot 1 Sleeping Tree Sap 1 Glass Bottle (Water) |  |
| Nirn Spring Tea | 1 |  | Cook pot | 1 Nirnroot 1 Sleeping Tree Sap 1 Glass Bottle (Water) |  |
| Nord Mead | 2 |  | Brewing Barrel | 1 Honey |  |
| Nord Mead | 2 |  | Brewing Barrel | 1 Honey |  |
| Ocean's Kiss | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Raw Clam Meat |  |
| Ocean's Kiss | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Raw Clam Meat |  |
| Paper Roll | 2 |  | N/A | 1 Ruined Book |  |
| Pelt: Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Bear (Flawless) |  |
| Pelt: Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Bear (Flawless) |  |
| Pelt: Boar (Fine) | 2 |  | Tanning Rack | 1 Pelt: Boar (Flawless) |  |
| Pelt: Boar (Fine) | 2 |  | Tanning Rack | 1 Pelt: Boar (Flawless) |  |
| Pelt: Cave Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Cave Bear (Flawless) |  |
| Pelt: Cave Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Cave Bear (Flawless) |  |
| Pelt: Cow (Fine) | 2 |  | Tanning Rack | 1 Pelt: Cow (Flawless) |  |
| Pelt: Cow (Fine) | 2 |  | Tanning Rack | 1 Pelt: Cow (Flawless) |  |
| Pelt: Deer (Fine) | 2 |  | Tanning Rack | 1 Pelt: Deer (Flawless) |  |
| Pelt: Deer (Fine) | 2 |  | Tanning Rack | 1 Pelt: Deer (Flawless) |  |
| Pelt: Elk (Fine) | 2 |  | Tanning Rack | 1 Pelt: Elk (Flawless) |  |
| Pelt: Elk (Fine) | 2 |  | Tanning Rack | 1 Pelt: Elk (Flawless) |  |
| Pelt: Fox (Fine) | 2 |  | Tanning Rack | 1 Pelt: Fox (Flawless) |  |
| Pelt: Fox (Fine) | 2 |  | Tanning Rack | 1 Pelt: Fox (Flawless) |  |
| Pelt: Frost Troll (Fine) | 2 |  | Tanning Rack | 1 Pelt: Frost Troll (Flawless) |  |
| Pelt: Frost Troll (Fine) | 2 |  | Tanning Rack | 1 Pelt: Frost Troll (Flawless) |  |
| Pelt: Goat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Goat (Flawless) |  |
| Pelt: Goat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Goat (Flawless) |  |
| Pelt: Horse (Fine) | 2 |  | Tanning Rack | 1 Pelt: Horse (Flawless) |  |
| Pelt: Horse (Fine) | 2 |  | Tanning Rack | 1 Pelt: Horse (Flawless) |  |
| Pelt: Ice Wolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Ice Wolf (Flawless) |  |
| Pelt: Ice Wolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Ice Wolf (Flawless) |  |
| Pelt: Mammoth Section (Fine) | 2 |  | Tanning Rack | 1 Pelt: Mammoth Section (Flawless) |  |
| Pelt: Mammoth Section (Fine) | 2 |  | Tanning Rack | 1 Pelt: Mammoth Section (Flawless) |  |
| Pelt: Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Sabre Cat (Flawless) |  |
| Pelt: Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Sabre Cat (Flawless) |  |
| Pelt: Skeever (Fine) | 2 |  | Tanning Rack | 1 Pelt: Skeever (Flawless) |  |
| Pelt: Skeever (Fine) | 2 |  | Tanning Rack | 1 Pelt: Skeever (Flawless) |  |
| Pelt: Snow Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snow Bear (Flawless) |  |
| Pelt: Snow Bear (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snow Bear (Flawless) |  |
| Pelt: Snow Fox (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snow Fox (Flawless) |  |
| Pelt: Snow Fox (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snow Fox (Flawless) |  |
| Pelt: Snowy Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Flawless) |  |
| Pelt: Snowy Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Flawless) |  |
| Pelt: Troll (Fine) | 2 |  | Tanning Rack | 1 Pelt: Troll (Flawless) |  |
| Pelt: Troll (Fine) | 2 |  | Tanning Rack | 1 Pelt: Troll (Flawless) |  |
| Pelt: Vale Deer (Fine) | 2 |  | Tanning Rack | 1 Pelt: Vale Deer (Flawless) |  |
| Pelt: Vale Deer (Fine) | 2 |  | Tanning Rack | 1 Pelt: Vale Deer (Flawless) |  |
| Pelt: Vale Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Vale Sabre Cat (Flawless) |  |
| Pelt: Vale Sabre Cat (Fine) | 2 |  | Tanning Rack | 1 Pelt: Vale Sabre Cat (Flawless) |  |
| Pelt: Werewolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Werewolf (Flawless) |  |
| Pelt: Werewolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Werewolf (Flawless) |  |
| Pelt: Wolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Wolf (Flawless) |  |
| Pelt: Wolf (Fine) | 2 |  | Tanning Rack | 1 Pelt: Wolf (Flawless) |  |
| Pet Bait: Fox (Strange Brew) | 1 |  | Cook pot | 1 Raw Chicken Breast 1 Strange Brew | Brewing Skill Greater or Equal to 2 |
| Pet Bait: Fox (Strange Brew) | 1 |  | Cook pot | 1 Raw Chicken Breast 1 Strange Brew | Brewing Skill Greater or Equal to 2 |
| Pet Bait: Rabbit (Strange Brew) | 1 |  | Cook pot | 1 Carrot 1 Strange Brew | Brewing Skill Greater or Equal to 1 |
| Pet Bait: Rabbit (Strange Brew) | 1 |  | Cook pot | 1 Carrot 1 Strange Brew | Brewing Skill Greater or Equal to 1 |
| Pet Bait: Wolf (Strange Brew) | 1 |  | Cook pot | 1 Raw Venison 1 Strange Brew | Brewing Skill Greater or Equal to 0 |
| Pet Bait: Wolf (Strange Brew) | 1 |  | Cook pot | 1 Raw Venison 1 Strange Brew | Brewing Skill Greater or Equal to 0 |
| Pet Bait: Wolf (Strange Brew) | 1 |  | Cook pot | 1 Strange Brew 1 Raw Elk Meat | Brewing Skill Greater or Equal to 0 |
| Pet Bait: Wolf (Strange Brew) | 1 |  | Cook pot | 1 Strange Brew 1 Raw Elk Meat | Brewing Skill Greater or Equal to 0 |
| Pheasant Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Pheasant Breast |  |
| Pheasant Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Pheasant Breast |  |
| Poison of Fear (Remarkable) | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Poison of Fear (Remarkable) | 2 |  | Cook pot | 1 Dragon's Blood |  |
| Poisoner's Stew | 1 |  | Cook pot | 1 Nightshade 1 Raw Chaurus Meat 1 Chaurus Venom (Crude) |  |
| Poisoner's Stew | 1 |  | Cook pot | 1 Nightshade 1 Raw Chaurus Meat 1 Chaurus Venom (Crude) |  |
| Polished Bear Eye | 1 |  | N/A | 1 Bear Eye | Animal Harvesting Skill Greater or Equal to 3 |
| Polished Boar Eye | 1 |  | N/A | 1 Boar Eye | Animal Harvesting Skill Greater or Equal to 2 |
| Polished Dragon Eye | 1 |  | N/A | 1 Dragon Eye | Animal Harvesting Skill Greater or Equal to 5 |
| Polished Fox Eye | 1 |  | N/A | 1 Fox Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Hare Eye | 1 |  | N/A | 1 Hare Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Mammoth Eye | 1 |  | N/A | 1 Mammoth Eye | Animal Harvesting Skill Greater or Equal to 4 |
| Polished Sabre Cat Eye | 1 |  | N/A | 1 Sabre Cat Eye | Animal Harvesting Skill Greater or Equal to 2 |
| Polished Slaughterfish Scales | 1 |  | N/A | 1 Slaughterfish Scales | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Troll Eye | 1 |  | N/A | 1 Troll Eye | Animal Harvesting Skill Greater or Equal to 4 |
| Polished Werewolf Eye | 1 |  | N/A | 1 Werewolf Eye | Animal Harvesting Skill Greater or Equal to 3 |
| Polished Wolf Eye | 1 |  | N/A | 1 Wolf Eye | Animal Harvesting Skill Greater or Equal to 2 |
| Potato Bread | 1 |  | Oven | 1 Salt 1 Potato 1 Flour 1 Glass Bottle (Water) |  |
| Potato Bread | 1 |  | Oven | 1 Salt 1 Potato 1 Flour 1 Glass Bottle (Water) |  |
| Potato Crab Chowder | 1 |  | Cook pot | 1 Potato 1 Bottled Milk 1 Butter 1 Raw Mudcrab Meat |  |
| Potato Crab Chowder | 1 |  | Cook pot | 1 Potato 1 Bottled Milk 1 Butter 1 Raw Mudcrab Meat |  |
| Potato Soup | 1 |  | Cook pot | 1 Salt 1 Potato 1 Glass Bottle (Water) |  |
| Potato Soup | 1 |  | Cook pot | 1 Salt 1 Potato 1 Glass Bottle (Water) |  |
| Potion of Arcane Metabolisis | 2 |  | Cook pot | 2 Polished Fox Eye 1 Dragon's Blood | Animal Harvesting Skill Greater or Equal to 3 |
| Potion of Arcane Metabolisis | 2 |  | Cook pot | 2 Polished Fox Eye 1 Dragon's Blood | Animal Harvesting Skill Greater or Equal to 3 |
| Potion of Boneblood | 1 |  | Cook pot | 10 Bone Meal 1 Blood of the Hunt (Strange Brew) | Animal Harvesting Skill Greater or Equal to 1 |
| Potion of Boneblood | 1 |  | Cook pot | 10 Bone Meal 1 Blood of the Hunt (Strange Brew) | Animal Harvesting Skill Greater or Equal to 1 |
| Potion of Hircine's Agony (Strange Brew) | 2 |  | Cook pot | 1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative) | Brewing Skill Greater or Equal to 0 |
| Potion of Hircine's Agony (Strange Brew) | 2 |  | Cook pot | 1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative) | Brewing Skill Greater or Equal to 0 |
| Potion of Hircine's Cloak (Strange Brew) | 2 |  | Cook pot | 1 Wolf Heart 2 Polished Sabre Cat Eye | Brewing Skill Greater or Equal to 1 |
| Potion of Hircine's Cloak (Strange Brew) | 2 |  | Cook pot | 1 Wolf Heart 2 Polished Sabre Cat Eye | Brewing Skill Greater or Equal to 1 |
| Powdered Mammoth Tusk | 1 |  | N/A | 1 Mammoth Tusk |  |
| Powdered Mudcrab Chitin | 2 |  | N/A | 1 Large Mudcrab Chitin | Animal Harvesting Skill Greater or Equal to 1 |
| Predator's Price | 4 |  | Cook pot | 1 Garlic 1 Raw Venison 1 Raw Bear Meat 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Predator's Price | 4 |  | Cook pot | 1 Garlic 1 Raw Venison 1 Raw Bear Meat 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Rabbit Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Rabbit Leg |  |
| Rabbit Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Rabbit Leg |  |
| Rabbit Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Rabbit Meat |  |
| Rabbit Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Rabbit Meat |  |
| Rabbit Mushroom Stew | 1 |  | Cook pot | 1 Mora Tapinella 1 Raw Rabbit Meat 1 Glass Bottle (Water) |  |
| Rabbit Mushroom Stew | 1 |  | Cook pot | 1 Mora Tapinella 1 Raw Rabbit Meat 1 Glass Bottle (Water) |  |
| Rarebit Ragout | 1 |  | Cook pot | 1 Goat Cheese Slice 1 Bread Half-Loaf 1 Raw Rabbit Meat |  |
| Rarebit Ragout | 1 |  | Cook pot | 1 Goat Cheese Slice 1 Bread Half-Loaf 1 Raw Rabbit Meat |  |
| Raw Salmon Steak | 2 |  | Cook pot | 1 Raw Salmon |  |
| Raw Salmon Steak | 2 |  | N/A | 1 Raw Salmon |  |
| Reachman Soup | 1 |  | Cook pot | 1 Sabre Cat Tooth 2 Edible Mushroom 2 Edible Root 1 Glass Bottle (Water) |  |
| Reachman Soup | 1 |  | Cook pot | 1 Sabre Cat Tooth 2 Edible Mushroom 2 Edible Root 1 Glass Bottle (Water) |  |
| Roasted Tomato Crab Bisque | 1 |  | Cook pot | 1 Salt 1 Tomato 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Roasted Tomato Crab Bisque | 1 |  | Cook pot | 1 Salt 1 Tomato 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) |  |
| Root Bear (Strange Brew) | 2 |  | Cook pot | 1 Nirnroot 2 Bear Tooth 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Root Bear (Strange Brew) | 2 |  | Cook pot | 1 Nirnroot 2 Bear Tooth 1 Raw Bear Meat 1 Glass Bottle (Water) |  |
| Sabre Cat Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Sabre Cat Meat |  |
| Sabre Cat Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Sabre Cat Meat |  |
| Sabre Cat Pot Roast | 1 |  | Cook pot | 1 Leek 1 Gourd 1 Raw Sabre Cat Meat |  |
| Sabre Cat Pot Roast | 1 |  | Cook pot | 1 Leek 1 Gourd 1 Raw Sabre Cat Meat |  |
| Salmon Bake | 1 |  | Cook pot | 1 Thistle Branch 2 Raw Salmon Steak 1 Honey |  |
| Salmon Bake | 1 |  | Cook pot | 1 Thistle Branch 2 Raw Salmon Steak 1 Honey |  |
| Salt | 1 |  | Cook pot | 1 Waterskin (Salt Water) |  |
| Salt | 1 |  | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Salt | 1 |  | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Salt | 1 |  | Cook pot | 1 Waterskin (Salt Water) |  |
| Salty Sabre Stew | 1 |  | Cook pot | 2 Salt 1 Canis Root 1 Raw Sabre Cat Meat 1 Glass Bottle (Water) |  |
| Salty Sabre Stew | 1 |  | Cook pot | 2 Salt 1 Canis Root 1 Raw Sabre Cat Meat 1 Glass Bottle (Water) |  |
| Sausaged Skeever | 2 |  | Cook pot | 1 Garlic 1 Skeever Tail 1 Raw Skeever Meat |  |
| Sausaged Skeever | 2 |  | Cook pot | 1 Garlic 1 Skeever Tail 1 Raw Skeever Meat |  |
| Sauteed Dog and Mushrooms | 1 |  | Cook pot | 2 Garlic 1 Fly Amanita 1 White Cap 1 Raw Dog Meat |  |
| Sauteed Dog and Mushrooms | 1 |  | Cook pot | 2 Garlic 1 Fly Amanita 1 White Cap 1 Raw Dog Meat |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Blue |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Red |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Tan |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Black |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Indigo |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Green |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Yellow |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Grey |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Orange |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Purple |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Brown |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Shrouded Hood |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Shrouded Robes |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Miraak's Robes |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Silk Nocturnal Robes |  |
| Silk Cloth - Black | 2 |  | N/A | 1 Emperor's Robes |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Silk Nocturnal Hood |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Shrouded Robes |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Shrouded Shoes |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Sheogorath's Boots |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Shrouded Veil |  |
| Silk Cloth - Black | 2 |  | N/A | 1 Silk Mage Robes - Ornate |  |
| Silk Cloth - Black | 1 |  | N/A | 1 Shrouded Shoes |  |
| Silk Cloth - Blue | 2 |  | N/A | 1 Silk Embroidered Raiment - Blue |  |
| Silk Cloth - Brown | 1 |  | N/A | 1 Silk Pleated Boots |  |
| Silk Cloth - Brown | 2 |  | N/A | 1 Archmage's Robes |  |
| Silk Cloth - Brown | 1 |  | N/A | 1 Silk Psijic Gloves |  |
| Silk Cloth - Brown | 1 |  | N/A | 1 Silk Fur-Embellished Robes - Tan |  |
| Silk Cloth - Brown | 1 |  | N/A | 1 Miraak's Boots |  |
| Silk Cloth - Brown | 1 |  | N/A | 1 Archmage's Boots |  |
| Silk Cloth - Brown | 1 |  | N/A | 1 Miraak's Gloves |  |
| Silk Cloth - Green | 1 |  | N/A | 1 Silk Fur-Embellished Robes - Green |  |
| Silk Cloth - Grey | 1 |  | N/A | 1 Silk Cuffed Boots |  |
| Silk Cloth - Grey | 1 |  | N/A | 1 Silk Mage Boots - Ornate |  |
| Silk Cloth - Indigo | 1 |  | N/A | 1 Silk Fur-Embellished Robes - Indigo |  |
| Silk Cloth - Purple | 1 |  | N/A | 1 Sheogorath's Garb |  |
| Silk Cloth - Red | 2 |  | N/A | 1 Silk Embroidered Raiment - Red |  |
| Silk Cloth - Tan | 1 |  | N/A | 1 Silk Mage Robes - Fine |  |
| Silk Cloth - Tan | 1 |  | N/A | 1 Silk Fur-Lined Boots |  |
| Silk Cloth - Yellow | 1 |  | N/A | 1 Silk Psijic Robes |  |
| Silk Cloth - Yellow | 1 |  | N/A | 1 Silk Psijic Hood |  |
| Silk Cloth - Yellow | 1 |  | N/A | 1 Silk Psijic Boots |  |
| Silk Thread | 2 |  | N/A | 1 Silk Cloth |  |
| Silk Thread | 4 |  | N/A | 1 Shrouded Hand Wraps |  |
| Silk Thread | 4 |  | N/A | 1 Shrouded Hand Wraps |  |
| Skeevender Stew | 1 |  | Cook pot | 2 Lavender 2 Raw Skeever Meat 1 Glass Bottle (Water) |  |
| Skeevender Stew | 1 |  | Cook pot | 2 Lavender 2 Raw Skeever Meat 1 Glass Bottle (Water) |  |
| Skeever Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Skeever Meat |  |
| Skeever Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Skeever Meat |  |
| Skeever Scramble | 1 |  | Cook pot | 1 Chicken's Egg 1 Leek 1 Raw Skeever Meat |  |
| Skeever Scramble | 1 |  | Cook pot | 1 Chicken's Egg 1 Leek 1 Raw Skeever Meat |  |
| Skewered Skeever | 2 |  | Cook pot | 1 Red Apple 1 Goat Cheese Slice 1 Raw Skeever Meat |  |
| Skewered Skeever | 2 |  | Cook pot | 1 Red Apple 1 Goat Cheese Slice 1 Raw Skeever Meat |  |
| Slaughterfish Scales | 5 |  | N/A | 1 Raw Slaughterfish |  |
| Small Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Small Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Smoked Elk Roast | 2 |  | Cook pot | 1 Salt 1 Raw Elk Meat |  |
| Smoked Elk Roast | 2 |  | Cook pot | 1 Salt 1 Raw Elk Meat |  |
| Snowberry Crostata | 2 |  | Oven | 10 Snowberries 1 Honey 1 Flour 1 Butter |  |
| Snowberry Crostata | 2 |  | Oven | 10 Snowberries 1 Honey 1 Flour 1 Butter |  |
| Snowberry Tea | 1 |  | Cook pot | 3 Snowberries 2 Red Mountain Flower 1 Glass Bottle (Water) |  |
| Snowberry Tea | 1 |  | Cook pot | 3 Snowberries 2 Red Mountain Flower 1 Glass Bottle (Water) |  |
| Snowbery Wolf Chop | 1 |  | Cook pot | 2 Snowberries 1 Raw Wolf Meat |  |
| Snowbery Wolf Chop | 1 |  | Cook pot | 2 Snowberries 1 Raw Wolf Meat |  |
| Soul Tomato: Common | 1 |  | N/A | 1 Soul Gem: Lesser 1 Tomato |  |
| Soul Tomato: Corrupted | 1 |  | N/A | 1 Soul Gem: Grand 1 Tomato |  |
| Soul Tomato: Grand | 1 |  | N/A | 1 Soul Gem: Greater 1 Tomato |  |
| Soul Tomato: Greater | 1 |  | N/A | 1 Soul Gem: Common 1 Tomato |  |
| Soul Tomato: Lesser | 1 |  | N/A | 1 Soul Gem: Petty 1 Tomato |  |
| Soul Tomato: Petty | 1 |  | N/A | 1 Tomato |  |
| Spiced Diced Goat | 1 |  | Cook pot | 1 Purple Mountain Flower 1 Creep Cluster 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Spiced Diced Goat | 1 |  | Cook pot | 1 Purple Mountain Flower 1 Creep Cluster 1 Raw Goat Meat 1 Glass Bottle (Water) |  |
| Spider Fry | 2 |  | Cook pot | 1 Ale 2 Salt 1 Raw Spider Meat |  |
| Spider Fry | 2 |  | Cook pot | 1 Ale 2 Salt 1 Raw Spider Meat |  |
| Spider Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Spider Meat |  |
| Spider Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Spider Meat |  |
| Spider Soup | 1 |  | Cook pot | 1 Salt 1 Potato 1 Raw Spider Meat 1 Glass Bottle (Water) |  |
| Spider Soup | 1 |  | Cook pot | 1 Salt 1 Potato 1 Raw Spider Meat 1 Glass Bottle (Water) |  |
| Spider Surprise | 1 |  | Cook pot | 1 Leek 1 Spider Egg 1 Bottled Milk 1 Raw Spider Meat |  |
| Spider Surprise | 1 |  | Cook pot | 1 Leek 1 Spider Egg 1 Bottled Milk 1 Raw Spider Meat |  |
| Spider Venom (Good) | 1 |  | Cook pot | 2 Spider Venom (Crude) | Animal Harvesting Skill Greater or Equal to 1 |
| Spider Venom (Good) | 1 |  | Cook pot | 2 Spider Venom (Crude) | Animal Harvesting Skill Greater or Equal to 1 |
| Spider Venom (Great) | 1 |  | Cook pot | 3 Bleeding Crown 1 Spider Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Spider Venom (Great) | 1 |  | Cook pot | 3 Bleeding Crown 1 Spider Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Spider Venom (Superlative) | 1 |  | Cook pot | 1 Spider Egg 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 3 |
| Spider Venom (Superlative) | 1 |  | Cook pot | 1 Spider Egg 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 3 |
| Spotted Wolf Meat | 1 |  | Cook pot | 1 Ale 1 Jazbay Grapes 1 Raw Wolf Meat |  |
| Spotted Wolf Meat | 1 |  | Cook pot | 1 Ale 1 Jazbay Grapes 1 Raw Wolf Meat |  |
| Spriggan Sap | 1 |  | N/A | 1 Taproot | Animal Harvesting Skill Greater or Equal to 2 |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Battlestaff |  |
| Stalhrim | 2 |  | N/A | 1 Stalhrim Warhammer |  |
| Stalhrim | 2 |  | N/A | 1 Stalhrim Light Cuirass |  |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Light Bow |  |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Greatsword |  |
| Stalhrim | 5 |  | N/A | 1 Stalhrim Heavy Crossbow |  |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Light Helmet |  |
| Stalhrim | 2 |  | N/A | 1 Stalhrim Light Shield |  |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Heavy Helmet |  |
| Stalhrim | 2 |  | N/A | 1 Stalhrim Battleaxe |  |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Heavy Boots |  |
| Stalhrim | 3 |  | N/A | 1 Stalhrim Heavy Cuirass |  |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Light Boots |  |
| Stalhrim | 1 |  | N/A | 1 Stalhrim Mace |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Ornate Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Brown |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Noble White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Dark Trimmed White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Ornate White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Light Trimmed Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Noble Brown |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Brown |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Ornate Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Noble Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Ornate White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Ornate Brown |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Trimmed Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Ornate Brown |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Light Trimmed White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Dark Trimmed Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Trimmed White |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Black |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Light Trimmed Brown |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Wolfskin Hood - Dark Trimmed Brown |  |
| Steel Helmet | 1 |  | N/A | 1 Steel Bearskin Hood - Trimmed Brown |  |
| Stone Hunting Knife | 1 |  | N/A | 1 Sharp Rock 1 Bone Hunting Knife | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | 1 |  | Cook pot | 2 Nightshade 1 Nord Mead 1 Wolf Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | 3 |  | Cook pot | 2 Nightshade 1 Sleeping Tree Sap 2 Mora Tapinella | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | 1 |  | Cook pot | 2 Nightshade 1 Nord Mead 1 Wolf Eye | Animal Harvesting Skill Greater or Equal to 1 |
| Strange Brew | 3 |  | Cook pot | 2 Nightshade 1 Sleeping Tree Sap 2 Mora Tapinella | Animal Harvesting Skill Greater or Equal to 1 |
| Strong Acid | 1 |  | Cook pot | 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 |  | Cook pot | 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 |  | Cook pot | 3 Chaurus Eggs | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 |  | Cook pot | 3 Chaurus Eggs | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 |  | Cook pot | 1 Chaurus Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 |  | Cook pot | 1 Chaurus Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Sweetroll | 6 |  | Oven | 1 Chicken's Egg 1 Salt 1 Honey 1 Bottled Milk 1 Flour 1 Butter |  |
| Sweetroll | 6 |  | Oven | 1 Chicken's Egg 1 Salt 1 Honey 1 Bottled Milk 1 Flour 1 Butter |  |
| Sweetwolf (Strange Brew) | 1 |  | Cook pot | 1 Red Apple 1 Honey 1 Raw Wolf Meat |  |
| Sweetwolf (Strange Brew) | 1 |  | Cook pot | 1 Red Apple 1 Honey 1 Raw Wolf Meat |  |
| Ten Dragons Tea | 1 |  | Cook pot | 10 Dragon's Tongue 1 Glass Bottle (Water) |  |
| Ten Dragons Tea | 1 |  | Cook pot | 10 Dragon's Tongue 1 Glass Bottle (Water) |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Green |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Yellow |  |
| Tinder (Crude) | 1 |  | N/A | 1 Kindling |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Brown |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Red |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Tan |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Indigo |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Purple |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Black |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Blue |  |
| Tinder (Crude) | 1 |  | N/A | 1 Northern Flax |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Grey |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Wrap |  |
| Tinder (Crude) | 1 |  | N/A | 1 Linen Cloth - Orange |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Purple |  |
| Tinder (Decent) | 1 |  | N/A | 1 Canis Root |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Black |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Tan |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Brown |  |
| Tinder (Decent) | 1 |  | N/A | 1 Mora Tapinella |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Red |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Blue |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Green |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Indigo |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Orange |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Yellow |  |
| Tinder (Decent) | 1 |  | N/A | 1 Silk Cloth - Grey |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Blue |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Green |  |
| Tinder (Good) | 1 |  | N/A | 1 Tundra Cotton |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Purple |  |
| Tinder (Good) | 1 |  | N/A | 1 Hanging Moss |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Indigo |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Brown |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Yellow |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Tan |  |
| Tinder (Good) | 1 |  | N/A | 1 Tree Bark |  |
| Tinder (Good) | 1 |  | N/A | 1 Paper Roll |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Grey |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Red |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Black |  |
| Tinder (Good) | 1 |  | N/A | 1 Animal Fat |  |
| Tinder (Good) | 1 |  | N/A | 1 Cotton Cloth - Orange |  |
| Tinder (Great) | 1 |  | N/A | 1 Straw |  |
| Tinder (Great) | 1 |  | N/A | 1 Beehive Husk |  |
| Tinder (Superlative) | 1 |  | N/A | 1 Dwarven Oil |  |
| Tinder (Superlative) | 1 |  | N/A | 1 Flammable Oil |  |
| Tomato Soup | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Tomato Soup | 1 |  | Cook pot | 1 Salt 1 Garlic 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Troll Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Troll Meat |  |
| Troll Jerky | 4 |  | Cook pot | 6 Salt 1 Raw Troll Meat |  |
| Troll's Blood Poison (Crude) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Poison (Crude) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Poison (Decent) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Poison (Decent) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Poison (Good) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Poison (Good) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Poison (Great) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Poison (Great) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Poison (Remarkable) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Poison (Remarkable) | 2 |  | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Potion (Crude) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Potion (Crude) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Potion (Decent) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Potion (Decent) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Potion (Good) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Potion (Good) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Potion (Great) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Potion (Great) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Potion (Remarkable) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Potion (Remarkable) | 2 |  | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Greater or Equal to 5 |
| Tundra Cotton | 6 |  | N/A | 1 Floral Head Wreath |  |
| Vegetable Soup | 1 |  | Cook pot | 1 Cabbage 1 Potato 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Vegetable Soup | 1 |  | Cook pot | 1 Cabbage 1 Potato 1 Tomato 1 Leek 1 Glass Bottle (Water) |  |
| Velvet Slaughterfish | 1 |  | Cook pot | 1 Velvet LeChance 1 Raw Slaughterfish |  |
| Velvet Slaughterfish | 1 |  | Cook pot | 1 Velvet LeChance 1 Raw Slaughterfish |  |
| Venison Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Venison |  |
| Venison Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Venison |  |
| Venison Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Elk Meat |  |
| Venison Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Elk Meat |  |
| Venison Stew | 1 |  | Cook pot | 1 Salt 1 Potato 1 Raw Venison 1 Leek 1 Glass Bottle (Water) |  |
| Venison Stew | 1 |  | Cook pot | 1 Salt 1 Potato 1 Raw Venison 1 Leek 1 Glass Bottle (Water) |  |
| Venison Tenderloin | 2 |  | Cook pot | 1 Ale 1 Raw Venison |  |
| Venison Tenderloin | 2 |  | Cook pot | 1 Ale 1 Raw Venison |  |
| Watermelon Gazpacho | 3 |  | Cook pot | 1 Salt 1 Elves Ear 1 Goat Cheese Slice 1 Tomato 1 Watermelon |  |
| Watermelon Gazpacho | 3 |  | Cook pot | 1 Salt 1 Elves Ear 1 Goat Cheese Slice 1 Tomato 1 Watermelon |  |
| Waterskin (3/3) | 1 |  | Cook pot | 1 Waterskin (Salt Water) |  |
| Waterskin (3/3) | 1 |  | Cook pot | 1 Waterskin (Salt Water) |  |
| Werebear's Blood Poison (Crude) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 1 |
| Werebear's Blood Poison (Crude) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 1 |
| Werebear's Blood Poison (Decent) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Poison (Decent) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Poison (Good) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Poison (Good) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Poison (Great) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Poison (Great) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Poison (Remarkable) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Poison (Remarkable) | 2 |  | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Decent) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Potion (Decent) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Potion (Good) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Potion (Good) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Potion (Great) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Potion (Great) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Potion (Remarkable) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Remarkable) | 2 |  | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Wheat Boon Tea | 1 |  | Cook pot | 3 Wheat 1 Hanging Moss 1 Glass Bottle (Water) |  |
| Wheat Boon Tea | 1 |  | Cook pot | 3 Wheat 1 Hanging Moss 1 Glass Bottle (Water) |  |
| White-Gold Tower | 2 |  | Brewing Barrel | 1 Nord Mead 1 Lavender 1 Dragon's Tongue 1 Bottled Milk |  |
| White-Gold Tower | 2 |  | Brewing Barrel | 1 Nord Mead 1 Lavender 1 Dragon's Tongue 1 Bottled Milk |  |
| Wolf Cabbage Stew | 1 |  | Cook pot | 1 Cabbage 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Wolf Cabbage Stew | 1 |  | Cook pot | 1 Cabbage 1 Raw Wolf Meat 1 Glass Bottle (Water) |  |
| Wolf Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Wolf Meat |  |
| Wolf Jerky | 3 |  | Cook pot | 6 Salt 1 Raw Wolf Meat |  |
| Wood | 3 |  | N/A | 1 Wooden Common Table |  |
| Wood | 3 |  | N/A | 1 Wooden Barrel |  |
| Wood | 2 |  | N/A | 1 Wooden Common Chair |  |
| Wood | 3 |  | N/A | 1 Wooden Common Bed |  |
| Wood | 5 |  | N/A | 1 Furniture Workbench |  |
| Wood | 4 |  | N/A | 1 Spinning Wheel |  |
| Wood | 3 |  | N/A | 1 Wooden Chest |  |
| Wooden Torch | 1 |  | N/A | 1 Linen Wrap 1 Wood 1 Flammable Oil |  |
| Wooden Torch (5) | 1 |  | N/A | 5 Linen Wrap 5 Wood 5 Flammable Oil |  |
| Wooden Torch (10) | 1 |  | N/A | 10 Linen Wrap 10 Wood 10 Flammable Oil |  |
| Wooden Torch (Bright) | 1 |  | N/A | 1 Linen Wrap 1 Wood 1 Dwarven Oil |  |
| Wooden Torch (Bright) (5) | 1 |  | N/A | 5 Linen Wrap 5 Wood 5 Dwarven Oil |  |
| Wooden Walking Stick | 1 |  | N/A | 2 Wood 2 Leather Strips |  |
| Wooden Walking Stick | 1 |  | N/A | 2 Leather Strips 4 Deadwood |  |
| Wyrm and Chips | 2 |  | Cook pot | 1 Salt 2 Potato 1 Raw Dragon Meat |  |
| Wyrm and Chips | 2 |  | Cook pot | 1 Salt 2 Potato 1 Raw Dragon Meat |  |
| Aegisbane | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Akaviri Katana | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Amulet of Zenithar Replica | 1 | Craftsmanship | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Amulet of Zenithar Replica | 1 | Craftsmanship | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Ancient Nordic Amulet | 1 | Craftsmanship | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Amulet | 1 | Craftsmanship | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Battleaxe | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 3 Leather Strips |  |
| Ancient Nordic Battleaxe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Battleaxe | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 3 Leather Strips |  |
| Ancient Nordic Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Ancient Nordic Boots | 1 | Craftsmanship | Forge | 1 Pelt: Bear 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | 1 | Craftsmanship | Forge | 1 Pelt: Bear 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Ancient Nordic Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Bear 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Bear 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Ancient Nordic Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Ancient Nordic Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Dagger | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Gauntlets | 1 | Craftsmanship | Forge | 2 Linen Wrap 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | 1 | Craftsmanship | Forge | 2 Linen Wrap 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Greatsword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Greatsword | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic Greatsword | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Ancient Nordic Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Ancient Nordic Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Helmet - Antlers | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Doe Antlers 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Ancient Nordic Helmet - Antlers | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Doe Antlers 1 Leather Strips 1 Leather |  |
| Ancient Nordic Honed Battleaxe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Battleaxe | 1 | Craftsmanship | Forge | 1 Ancient Nordic Battleaxe 2 Ingot: Corundum |  |
| Ancient Nordic Honed Battleaxe | 1 | Craftsmanship | Forge | 1 Ancient Nordic Battleaxe 2 Ingot: Corundum |  |
| Ancient Nordic Honed Dagger | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Honed Greatsword | 1 | Craftsmanship | Forge | 1 Ancient Nordic Greatsword 2 Ingot: Corundum |  |
| Ancient Nordic Honed Greatsword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Greatsword | 1 | Craftsmanship | Forge | 1 Ancient Nordic Greatsword 2 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | 1 | Craftsmanship | Forge | 1 Ancient Nordic Light Bow 2 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | 1 | Craftsmanship | Forge | 1 Ancient Nordic Light Bow 2 Ingot: Corundum |  |
| Ancient Nordic Honed Mace | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Honed Sword | 1 | Craftsmanship | Forge | 1 Ancient Nordic Sword 1 Ingot: Corundum |  |
| Ancient Nordic Honed Sword | 1 | Craftsmanship | Forge | 1 Ancient Nordic Sword 1 Ingot: Corundum |  |
| Ancient Nordic Honed Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | 1 | Craftsmanship | Forge | 1 Ancient Nordic War Axe 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | 1 | Craftsmanship | Forge | 1 Ancient Nordic War Axe 1 Ingot: Corundum |  |
| Ancient Nordic Honed Warhammer | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Light Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Light Bow | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Ancient Nordic Light Bow | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Ancient Nordic Mace | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Ancient Nordic Necklace | 1 | Craftsmanship | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Necklace | 1 | Craftsmanship | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Sword | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic Sword | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic Sword - Ceremonial | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic War Axe - Ceremonial | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Ancient Nordic Warhammer | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Angi's Light Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Archmage's Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Brown | College - The Eye of Magnus Complete |
| Archmage's Robes | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan | College - The Eye of Magnus Complete |
| Archmage's Robes | 1 | Craftsmanship | N/A | 2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan | College - The Eye of Magnus Complete |
| Armor of the Old Gods | 1 | Craftsmanship | N/A | 1 Leather |  |
| Arrow: Ancient Nordic | 15 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Ancient Nordic | 15 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Bone (Crude) | 5 | Craftsmanship | N/A | 1 Wood 3 Fragment: Bone | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Bone (Crude) | 5 | Craftsmanship | N/A | 3 Fragment: Bone 1 Animal Bone (Large) | Animal Harvesting Skill Less or Equal to 2 |
| Arrow: Falmer | 24 | Craftsmanship | Forge | 1 Chaurus Chitin 1 Wood |  |
| Arrow: Falmer | 24 | Craftsmanship | Forge | 1 Chaurus Chitin 1 Wood |  |
| Arrow: Forsworn | 24 | Craftsmanship | N/A | 1 Doe Antlers 1 Wood |  |
| Arrow: Iron | 15 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Iron | 15 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Arrow: Silver | 15 | Craftsmanship | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Arrow: Silver | 15 | Craftsmanship | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Arrow: Steel | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Arrow: Steel | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Arrow: Stone (Crude) | 5 | Craftsmanship | N/A | 1 Wood 1 Sharp Rock | Animal Harvesting Skill Less or Equal to 2 |
| Bearskin Cloak - Black | 1 | Craftsmanship | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Brown | 1 | Craftsmanship | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Ornate Black | 1 | Craftsmanship | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate Brown | 1 | Craftsmanship | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate White | 1 | Craftsmanship | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Trimmed Black | 1 | Craftsmanship | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed Brown | 1 | Craftsmanship | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed White | 1 | Craftsmanship | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - White | 1 | Craftsmanship | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Pelt: Cave Bear 1 Leather Strips |  |
| Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Pelt: Bear 1 Leather Strips |  |
| Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Pelt: Cave Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Pelt: Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Pelt: Cave Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Pelt: Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Leather Strips |  |
| Blade of Woe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Blades Boots | 1 | Craftsmanship | N/A | 1 Ingot: Corundum |  |
| Blades Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Corundum |  |
| Blades Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Corundum |  |
| Blades Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Corundum |  |
| Blades Shield | 1 | Craftsmanship | N/A | 1 Ingot: Corundum |  |
| Bloodskal Blade | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Bloodskal Blade Replica | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Bloodthorn | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Bolar's Oathblade | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Bolt: Dawnguard | 15 | Craftsmanship | Forge | 1 Ingot: Silver 1 Wood |  |
| Bolt: Dawnguard | 15 | Craftsmanship | Forge | 1 Ingot: Silver 1 Wood |  |
| Bolt: Imperial | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Imperial | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Iron | 15 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Bolt: Iron | 15 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Bolt: Silver | 15 | Craftsmanship | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Bolt: Silver | 15 | Craftsmanship | Forge | 1 Ingot: Silver 1 Ingot: Steel 1 Wood |  |
| Bolt: Steel | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Steel | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Stormcloak | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Stormcloak | 15 | Craftsmanship | Forge | 1 Ingot: Steel 1 Wood |  |
| Boots of the Old Gods | 1 | Craftsmanship | N/A | 1 Leather |  |
| Bow of the Hunt | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Building Glass | 1 | Craftsmanship | Smelter | 20 Fragment: Building Glass |  |
| Building Glass | 1 | Craftsmanship | Smelter | 20 Fragment: Building Glass |  |
| Champion's Cudgel Replica | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Child's Doll | 1 | Craftsmanship | N/A | 5 Tundra Cotton 1 Leather Strips 2 Linen Cloth |  |
| Cotton Boots - Thalmor | 1 | Craftsmanship | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Cloth - Black | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Black |  |
| Cotton Cloth - Blue | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Blue |  |
| Cotton Cloth - Brown | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Brown |  |
| Cotton Cloth - Green | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Green |  |
| Cotton Cloth - Grey | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Grey |  |
| Cotton Cloth - Indigo | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Indigo |  |
| Cotton Cloth - Orange | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Orange |  |
| Cotton Cloth - Purple | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Purple |  |
| Cotton Cloth - Red | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Red |  |
| Cotton Cloth - Tan | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Tan |  |
| Cotton Cloth - Yellow | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Yellow |  |
| Cotton Cuffed Boots | 1 | Craftsmanship | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Cultist Boots | 1 | Craftsmanship | N/A | 2 Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Cultist Gloves | 1 | Craftsmanship | N/A | 4 Bone Meal 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Cultist Robes | 1 | Craftsmanship | N/A | 3 Bone Meal 4 Leather 4 Cotton Thread 5 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Fine Boots | 1 | Craftsmanship | N/A | 6 Gold 1 Leather 2 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Clothes - Brown | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Grey |  |
| Cotton Fine Clothes - Indigo | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Indigo |  |
| Cotton Fine Hat | 1 | Craftsmanship | N/A | 1 Leather Strips 1 Pelt: Snow Fox 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Hat | 1 | Craftsmanship | N/A | 1 Leather Strips 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Shoes | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown |  |
| Cotton Fur-Mantled Clothes - Blue | 1 | Craftsmanship | N/A | 2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo |  |
| Cotton Fur-Mantled Clothes - Blue | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo |  |
| Cotton Fur-Mantled Clothes - Green | 1 | Craftsmanship | N/A | 4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green |  |
| Cotton Fur-Mantled Clothes - Green | 1 | Craftsmanship | N/A | 1 Pelt: Bear 4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green |  |
| Cotton Gloves - Mythic Dawn | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Red | Daedra - Pieces of the Past |
| Cotton Gloves - Thalmor | 1 | Craftsmanship | N/A | 2 Cotton Thread 2 Cotton Cloth - Black |  |
| Cotton Hood - Mythic Dawn | 1 | Craftsmanship | N/A | 1 Cotton Thread 3 Cotton Cloth - Red | Daedra - Pieces of the Past |
| Cotton Jester's Boots | 1 | Craftsmanship | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Jester's Clothes | 1 | Craftsmanship | N/A | 1 Leather Strips 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Red |  |
| Cotton Jester's Gloves | 1 | Craftsmanship | N/A | 2 Cotton Thread 2 Cotton Cloth - Black |  |
| Cotton Jester's Hat | 1 | Craftsmanship | N/A | 1 Cotton Thread 1 Cotton Cloth - Black 2 Cotton Cloth - Red |  |
| Cotton Mage Boots - Common | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 1 Cotton Cloth - Blue 2 Cotton Cloth - Grey |  |
| Cotton Mage Boots - Embellished | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 1 Cotton Cloth - Brown 2 Cotton Cloth - Grey |  |
| Cotton Merchant's Hat | 1 | Craftsmanship | N/A | 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Quilted Clothes - Black and White | 1 | Craftsmanship | N/A | 2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Quilted Clothes - Blue | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 2 Cotton Cloth - Blue 3 Cotton Cloth - Indigo |  |
| Cotton Quilted Clothes - Brown and Orange | 1 | Craftsmanship | N/A | 4 Cotton Thread 3 Cotton Cloth - Brown 2 Cotton Cloth - Orange |  |
| Cotton Quilted Clothes - Brown and White | 1 | Craftsmanship | N/A | 2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Quilted Clothes - Orange | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Tan |  |
| Cotton Quilted Clothes - Orange and Black | 1 | Craftsmanship | N/A | 4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Orange |  |
| Cotton Reclamations Temple Boots | 1 | Craftsmanship | N/A | 1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown 1 Cotton Cloth - Grey | Dragonborn - Clean Sweep Complete |
| Cotton Reclamations Temple Hood | 1 | Craftsmanship | N/A | 1 Cotton Thread 3 Cotton Cloth - Blue | Dragonborn - Clean Sweep Complete |
| Cotton Reclamations Temple Robes | 1 | Craftsmanship | N/A | 3 Netch Leather 4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Blue 2 Cotton Cloth - Grey | Dragonborn - Clean Sweep Complete |
| Cotton Robes - Mythic Dawn | 1 | Craftsmanship | N/A | 4 Cotton Thread 4 Cotton Cloth - Red 1 Cotton Cloth - Yellow | Daedra - Pieces of the Past |
| Cotton Robes - Thalmor | 1 | Craftsmanship | N/A | 4 Cotton Thread 5 Cotton Cloth - Black |  |
| Cotton Shoes - Mythic Dawn | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Daedra - Pieces of the Past |
| Cotton Tall Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 4 Cotton Cloth - Tan |  |
| Cotton Telvanni Robes | 1 | Craftsmanship | N/A | 3 Netch Leather 4 Cotton Thread 1 Cotton Cloth - Black 3 Cotton Cloth - Red 1 Cotton Cloth - Yellow | Dragonborn -  Old Friends Complete |
| Cotton Telvanni Shoes | 1 | Craftsmanship | N/A | 1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn -  Old Friends Complete |
| Cotton Thread | 4 | Craftsmanship | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Thread | 4 | Craftsmanship | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Vaermina Robes | 1 | Craftsmanship | N/A | 4 Cotton Thread 5 Cotton Cloth - Purple | Daedra - Waking Nightmare |
| Dawnguard Heavy Boots | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Boots | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Boots | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Cuirass - Black | 1 | Craftsmanship | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Cuirass - Black | 1 | Craftsmanship | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Grey | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Cuirass - Grey | 1 | Craftsmanship | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Grey | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass - Grey | 1 | Craftsmanship | Forge | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Grey | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Shield | 1 | Craftsmanship | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips 1 Leather | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Shield | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Heavy Shield | 1 | Craftsmanship | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips 1 Leather | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Improved Light Crossbow | 1 | Craftsmanship | Forge | 2 Ingot: Corundum 1 Dawnguard Light Crossbow | Read Improved Crossbow Schematic |
| Dawnguard Improved Light Crossbow | 1 | Craftsmanship | Forge | 2 Ingot: Corundum 1 Dawnguard Light Crossbow | Read Improved Crossbow Schematic |
| Dawnguard Improved Light Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace | Read Improved Crossbow Schematic |
| Dawnguard Light Boots | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Boots | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Boots | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Crossbow | 1 | Craftsmanship | Forge | 3 Ingot: Steel 3 Wood 4 Hide Lace | Dawnguard - A New Order complete and spoken to Sorine about crossbow construction |
| Dawnguard Light Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Dawnguard Light Crossbow | 1 | Craftsmanship | Forge | 3 Ingot: Steel 3 Wood 4 Hide Lace | Dawnguard - A New Order complete and spoken to Sorine about crossbow construction |
| Dawnguard Light Cuirass - Black | 1 | Craftsmanship | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass - Black | 1 | Craftsmanship | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass - Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Cuirass - Red | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Cuirass - Red | 1 | Craftsmanship | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Dye - Red | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass - Red | 1 | Craftsmanship | Forge | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Dye - Red | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Gauntlets | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Light Gauntlets | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Reinforced Light Cuirass - Blue | 1 | Craftsmanship | Forge | 1 Ingot: Silver 3 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Blue | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Reinforced Light Cuirass - Blue | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Reinforced Light Cuirass - Blue | 1 | Craftsmanship | Forge | 1 Ingot: Silver 3 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Blue | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Rune Shield | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Dawnguard Rune War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Dawnguard Rune War Axe Replica | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Dawnguard Rune War Axe Replica | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune War Axe Replica | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Warhammer | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Dawnguard Rune Warhammer Replica | 1 | Craftsmanship | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Warhammer Replica | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Dawnguard Rune Warhammer Replica | 1 | Craftsmanship | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Dawnguard War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Dragon Priest Dagger | 1 | Craftsmanship | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Dragon Priest Dagger | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Dragon Priest Dagger | 1 | Craftsmanship | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Dragonbane | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Corundum |  |
| Dragonplate Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonplate Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Dragon Scales |  |
| Emperor's Robes | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood Main Quest Complete |
| Emperor's Robes | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood Main Quest Complete |
| Falmer Boots | 1 | Craftsmanship | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Boots | 1 | Craftsmanship | N/A | 1 Chaurus Chitin |  |
| Falmer Boots | 1 | Craftsmanship | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Bracers | 1 | Craftsmanship | N/A | 1 Chaurus Chitin |  |
| Falmer Bracers | 1 | Craftsmanship | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Bracers | 1 | Craftsmanship | Forge | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Cuirass | 1 | Craftsmanship | Forge | 3 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Cuirass | 1 | Craftsmanship | N/A | 1 Chaurus Chitin |  |
| Falmer Cuirass | 1 | Craftsmanship | Forge | 3 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Bow | 1 | Craftsmanship | Forge | 3 Chaurus Chitin 3 Leather Strips |  |
| Falmer Heavy Bow | 1 | Craftsmanship | Forge | 3 Chaurus Chitin 3 Leather Strips |  |
| Falmer Heavy Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Chaurus Chitin 2 Hide Lace |  |
| Falmer Helmet | 1 | Craftsmanship | Forge | 2 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Helmet | 1 | Craftsmanship | Forge | 2 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Helmet | 1 | Craftsmanship | N/A | 1 Chaurus Chitin |  |
| Falmer Shield | 1 | Craftsmanship | N/A | 1 Chaurus Chitin |  |
| Falmer Shield | 1 | Craftsmanship | Forge | 4 Chaurus Chitin 2 Leather Strips |  |
| Falmer Shield | 1 | Craftsmanship | Forge | 4 Chaurus Chitin 2 Leather Strips |  |
| Falmer Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Chaurus Chitin |  |
| Falmer Sword | 1 | Craftsmanship | Forge | 2 Chaurus Chitin 1 Leather Strips |  |
| Falmer Sword | 1 | Craftsmanship | Forge | 2 Chaurus Chitin 1 Leather Strips |  |
| Falmer War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Chaurus Chitin |  |
| Falmer War Axe | 1 | Craftsmanship | Forge | 2 Chaurus Chitin 2 Leather Strips |  |
| Falmer War Axe | 1 | Craftsmanship | Forge | 2 Chaurus Chitin 2 Leather Strips |  |
| Floral Head Wreath | 1 | Craftsmanship | N/A | 12 Tundra Cotton |  |
| Focusing Gloves | 1 | Craftsmanship | N/A | 2 Cotton Thread 2 Cotton Cloth - Black | College - Out Of Balance Complete |
| Forsworn Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Forsworn Boots | 1 | Craftsmanship | N/A | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Boots | 1 | Craftsmanship | N/A | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Cuirass | 1 | Craftsmanship | N/A | 2 Hagraven Feathers 4 Pelt: Goat 4 Leather Strips |  |
| Forsworn Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Forsworn Cuirass | 1 | Craftsmanship | N/A | 2 Hagraven Feathers 4 Leather Strips 2 Fur Plate |  |
| Forsworn Gauntlets | 1 | Craftsmanship | N/A | 1 Leather |  |
| Forsworn Gauntlets | 1 | Craftsmanship | N/A | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Gauntlets | 1 | Craftsmanship | N/A | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Headdress | 1 | Craftsmanship | N/A | 1 Leather |  |
| Forsworn Headdress | 1 | Craftsmanship | N/A | 1 Hagraven Feathers 1 Doe Antlers 2 Fur Plate |  |
| Forsworn Headdress | 1 | Craftsmanship | N/A | 1 Hagraven Feathers 1 Pelt: Goat 1 Doe Antlers |  |
| Forsworn Light Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Forsworn Light Bow | 1 | Craftsmanship | Forge | 1 Doe Antlers 2 Wood 5 Leather Strips 1 Hawk Feathers |  |
| Forsworn Light Bow | 1 | Craftsmanship | Forge | 1 Doe Antlers 2 Wood 5 Leather Strips 1 Hawk Feathers |  |
| Forsworn Sword | 1 | Craftsmanship | Forge | 6 Sabre Cat Tooth 2 Wood 4 Leather Strips |  |
| Forsworn Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Forsworn Sword | 1 | Craftsmanship | Forge | 6 Sabre Cat Tooth 2 Wood 4 Leather Strips |  |
| Forsworn War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Forsworn War Axe | 1 | Craftsmanship | Forge | 1 Sabre Cat Tooth 3 Wood 5 Leather Strips 1 Quarried Stone |  |
| Forsworn War Axe | 1 | Craftsmanship | Forge | 1 Sabre Cat Tooth 3 Wood 5 Leather Strips 1 Quarried Stone |  |
| Fragment: Building Glass | 20 | Craftsmanship | N/A | 1 Building Glass |  |
| Fragment: Corundum | 20 | Craftsmanship | N/A | 1 Ingot: Corundum |  |
| Fragment: Galatite | 20 | Craftsmanship | N/A | 1 Ingot: Galatite |  |
| Fragment: Iron | 20 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Fragment: Steel | 20 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Froki's Heavy Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Wood 2 Hide Lace |  |
| Fur Backpack - Black | 1 | Craftsmanship | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Backpack - Brown | 1 | Craftsmanship | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Backpack - White | 1 | Craftsmanship | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Bedroll | 1 | Craftsmanship | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Boots | 1 | Craftsmanship | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Boots | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Bracers | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Bracers | 1 | Craftsmanship | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Cuirass | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Cuirass | 1 | Craftsmanship | N/A | 4 Hide Lace 5 Fur Plate |  |
| Fur Gauntlets | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Gauntlets | 1 | Craftsmanship | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Guard's Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Boots | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Guard's Boots | 1 | Craftsmanship | N/A | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Cuirass - Falkreath | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Falkreath | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Falkreath | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Haafingar | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Haafingar | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Haafingar | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Hjaalmarch | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Hjaalmarch | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Hjaalmarch | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - The Reach | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - The Reach | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Reach | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Rift | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - The Rift | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Rift | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Whiterun | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Whiterun | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Whiterun | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Winterhold | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Cuirass - Winterhold | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Winterhold | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Gauntlets | 1 | Craftsmanship | N/A | 1 Leather |  |
| Fur Guard's Gauntlets | 1 | Craftsmanship | N/A | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Gauntlets | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Helmet | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Helmet | 1 | Craftsmanship | N/A | 1 Hide Lace 2 Fur Plate |  |
| Fur Kilt | 1 | Craftsmanship | N/A | 3 Hide Lace 2 Fur Plate |  |
| Fur Kilt | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Large Tent | 1 | Craftsmanship | N/A | 4 Wood 2 Leather 12 Fur Plate 1 Fur Bedroll |  |
| Fur Large Tent (Four Bedrolls) | 1 | Craftsmanship | N/A | 1 Fur Large Tent (Three Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Three Bedrolls) | 1 | Craftsmanship | N/A | 1 Fur Large Tent (Two Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Two Bedrolls) | 1 | Craftsmanship | N/A | 1 Fur Large Tent 1 Fur Bedroll |  |
| Fur Mantled Kilt | 1 | Craftsmanship | N/A | 3 Hide Lace 3 Fur Plate |  |
| Fur Mantled Kilt | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Goat (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Goat (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Bear |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Troll |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Snow Fox |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Fox (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Ice Wolf (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Wolf (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Skeever |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Skeever (Poor) |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Skeever |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Snow Fox |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Ice Wolf (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Skeever (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Bear |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Fox (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Fox |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 3 Pelt: Fox |  |
| Fur Plate | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Troll |  |
| Fur Plate | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Wolf (Poor) |  |
| Fur Plate | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Fur Plate | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Fur Shoes | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Shoes | 1 | Craftsmanship | N/A | 2 Hide Lace 1 Fur Plate |  |
| Fur Sleeveless Cuirass | 1 | Craftsmanship | N/A | 1 Fur Plate |  |
| Fur Sleeveless Cuirass | 1 | Craftsmanship | N/A | 4 Hide Lace 4 Fur Plate |  |
| Fur Small Tent | 1 | Craftsmanship | N/A | 2 Wood 2 Leather 6 Fur Plate 1 Fur Bedroll |  |
| Fur Small Tent (Two Bedrolls) | 1 | Craftsmanship | N/A | 1 Fur Small Tent 1 Fur Bedroll |  |
| Furred Robes - Dark | 1 | Craftsmanship | N/A | 3 Fur Plate 2 Linen Cloth - Black 4 Linen Thread |  |
| Furred Robes - Pale | 1 | Craftsmanship | N/A | 3 Fur Plate 4 Linen Thread 2 Linen Cloth |  |
| Gauldur Blackblade | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Gauldur Heavy Blackbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Gauntlets of the Old Gods | 1 | Craftsmanship | N/A | 1 Leather |  |
| General Carius' Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| General Tullius' Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Glass Alembic | 1 | Craftsmanship | Forge | 1 Ingot: Steel 5 Building Glass |  |
| Glass Alembic | 1 | Craftsmanship | Forge | 1 Ingot: Steel 5 Building Glass |  |
| Glass Bottle (Empty) | 1 | Craftsmanship | Forge | 5 Building Glass |  |
| Glass Bottle (Empty) | 1 | Craftsmanship | Forge | 5 Building Glass |  |
| Gloves of the Pugilist | 1 | Craftsmanship | N/A | 1 Leather |  |
| Gorak's Troll Gutting Knife | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Greybeard's Hood | 1 | Craftsmanship | N/A | 1 Cotton Thread 3 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Greybeard's Robes | 1 | Craftsmanship | N/A | 4 Cotton Thread 5 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Greybeard's Shoes | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 3 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Harkon's Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Helm of Yngol | 1 | Craftsmanship | N/A | 1 Ingot: Corundum |  |
| Helm of Yngol Replica | 1 | Craftsmanship | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Sidequest - Escape Yngols Barrow Complete,Currently Uncraftable - Global Disabled |
| Helm of Yngol Replica | 1 | Craftsmanship | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Sidequest - Escape Yngols Barrow Complete,Currently Uncraftable - Global Disabled |
| Helmet of the Old Gods | 1 | Craftsmanship | N/A | 1 Leather |  |
| Hide Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Hide Boots | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather |  |
| Hide Boots | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather 2 Fur Plate |  |
| Hide Boots | 1 | Craftsmanship | N/A | 1 Pelt: Elk 2 Leather Strips 2 Leather |  |
| Hide Boots - Movarth's | 1 | Craftsmanship | N/A | 1 Leather |  |
| Hide Bracers | 1 | Craftsmanship | N/A | 1 Leather |  |
| Hide Bracers | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather |  |
| Hide Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather 2 Fur Plate |  |
| Hide Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Elk 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather 2 Fur Plate |  |
| Hide Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Hide Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Elk 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Furred Cuirass | 1 | Craftsmanship | N/A | 3 Leather 4 Hide Lace 2 Fur Plate |  |
| Hide Helmet | 1 | Craftsmanship | N/A | 1 Leather |  |
| Hide Helmet | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Hide Helmet | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Hide Lace | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Hide Lace | 4 | Craftsmanship | N/A | 1 Fur Plate |  |
| Hide Lace | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ruined |  |
| Hide Lace | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ruined |  |
| Hide Lace | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Hide Shield | 1 | Craftsmanship | N/A | 1 Leather |  |
| Hide Shield | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 4 Leather |  |
| Hide Shield | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 4 Leather |  |
| Hide Skaal Boots | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Boots | 1 | Craftsmanship | N/A | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | 1 | Craftsmanship | N/A | 5 Leather Strips 6 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | 1 | Craftsmanship | N/A | 2 Pelt: Elk 5 Leather Strips 4 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | 1 | Craftsmanship | N/A | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | 1 | Craftsmanship | N/A | 1 Pelt: Elk 1 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | 1 | Craftsmanship | N/A | 1 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hoarfrost | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Horksbane | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Horse Armor: Big Game Saddle | 1 | Craftsmanship | Forge | 1 Troll Skull 1 Mammoth Tusk 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Big Game Saddle | 1 | Craftsmanship | Forge | 1 Troll Skull 1 Mammoth Tusk 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Big Game Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Rueful Axe 1 Horse Armor: Big Game Saddle |  |
| Horse Armor: Big Game Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Rueful Axe 1 Horse Armor: Big Game Saddle |  |
| Horse Armor: Dawnguard Barding and Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Horse Armor: Dawnguard Barding and Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Steel Heavy Crossbow 8 Bolt: Steel 1 Dawnguard War Axe 1 Dawnguard Heavy Shield 1 Horse Armor: Dawnguard Barding and Saddle | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Steel Heavy Crossbow 8 Bolt: Steel 1 Dawnguard War Axe 1 Dawnguard Heavy Shield 1 Horse Armor: Dawnguard Barding and Saddle | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Fur Saddle | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 2 Leather |  |
| Horse Armor: Fur Saddle | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 2 Leather |  |
| Horse Armor: Hunter's Saddle | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 1 Pelt: Fox 3 Leather |  |
| Horse Armor: Hunter's Saddle | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 1 Pelt: Fox 3 Leather |  |
| Horse Armor: Hunter's Saddle - Adorned | 1 | Craftsmanship | Forge | 8 Arrow: Steel 1 Horse Armor: Hunter's Saddle |  |
| Horse Armor: Hunter's Saddle - Adorned | 1 | Craftsmanship | Forge | 8 Arrow: Steel 1 Horse Armor: Hunter's Saddle |  |
| Horse Armor: Imperial Barding and Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Imperial Barding and Saddle | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Horse Armor: Imperial Barding and Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Iron Sword 1 Imperial Heavy Shield 1 Imperial Heavy Bow 8 Arrow: Iron 1 Horse Armor: Imperial Barding and Saddle |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Iron Sword 1 Imperial Heavy Shield 1 Imperial Heavy Bow 8 Arrow: Iron 1 Horse Armor: Imperial Barding and Saddle |  |
| Horse Armor: Imperial Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Imperial Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Wood 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Wood 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Steel Helmet 1 Steel Shield 1 Steel Greatsword 1 Steel Sword 1 Horse Armor: Knight's Saddle |  |
| Horse Armor: Knight's Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Steel Helmet 1 Steel Shield 1 Steel Greatsword 1 Steel Sword 1 Horse Armor: Knight's Saddle |  |
| Horse Armor: Leather Barding and Saddle | 1 | Craftsmanship | N/A | 1 Leather |  |
| Horse Armor: Leather Barding and Saddle | 1 | Craftsmanship | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle | 1 | Craftsmanship | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | 1 | Craftsmanship | N/A | 1 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | 1 | Craftsmanship | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | 1 | Craftsmanship | Forge | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Minstrel's Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 6 Leather Strips 1 Wooden Lute 3 Leather |  |
| Horse Armor: Minstrel's Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 6 Leather Strips 1 Wooden Lute 3 Leather |  |
| Horse Armor: Minstrel's Saddle - Adorned | 1 | Craftsmanship | Forge | 8 Arrow: Steel 1 Horse Armor: Minstrel's Saddle |  |
| Horse Armor: Minstrel's Saddle - Adorned | 1 | Craftsmanship | Forge | 8 Arrow: Steel 1 Horse Armor: Minstrel's Saddle |  |
| Horse Armor: Nordic Barding and Saddle | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Horse Armor: Ornate Barding and Saddle | 1 | Craftsmanship | Forge | 6 Linen Wrap 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Ornate Barding and Saddle | 1 | Craftsmanship | Forge | 6 Linen Wrap 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Ornate Barding and Saddle | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Horse Armor: Shadowmere's Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Shadowmere's Saddle | 1 | Craftsmanship | Forge | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | 1 | Craftsmanship | N/A | 1 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | 1 | Craftsmanship | Forge | 1 Pelt: Bear 2 Ingot: Iron 10 Leather Strips 7 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | 1 | Craftsmanship | Forge | 1 Pelt: Bear 2 Ingot: Iron 10 Leather Strips 7 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Iron Sword 8 Arrow: Iron 1 Wooden Light Bow 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | 1 | Craftsmanship | Forge | 1 Iron Sword 8 Arrow: Iron 1 Wooden Light Bow 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | 1 | Craftsmanship | N/A | 1 Leather |  |
| Horse Armor: Traveler's Saddle | 1 | Craftsmanship | Forge | 2 Linen Wrap 1 Corundum Flagon 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Traveler's Saddle | 1 | Craftsmanship | Forge | 2 Linen Wrap 1 Corundum Flagon 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Imperial Crested Heavy Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Imperial Crested Heavy Helmet | 1 | Craftsmanship | Forge | 4 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Crested Heavy Helmet | 1 | Craftsmanship | Forge | 4 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial General Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial General Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Heavy Boots | 1 | Craftsmanship | Forge | 2 Ingot: Steel 3 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Boots | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Boots | 1 | Craftsmanship | Forge | 2 Ingot: Steel 3 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Imperial Heavy Bow | 1 | Craftsmanship | Forge | 1 Ingot: Steel 3 Wood 3 Hide Lace | Civil War - Joined Imperials |
| Imperial Heavy Bow | 1 | Craftsmanship | Forge | 1 Ingot: Steel 3 Wood 3 Hide Lace | Civil War - Joined Imperials |
| Imperial Heavy Bracers | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Bracers | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Bracers | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Crossbow | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Imperial Heavy Crossbow | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Imperial Heavy Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Imperial Heavy Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Heavy Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Heavy Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Shield | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Heavy Shield | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Imperial Heavy Shield | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Light Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Imperial Light Boots | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Bracers | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Bracers | 1 | Craftsmanship | N/A | 1 Leather |  |
| Imperial Light Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Imperial Light Cuirass | 1 | Craftsmanship | N/A | 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Light Helmet | 1 | Craftsmanship | N/A | 1 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Helmet | 1 | Craftsmanship | N/A | 1 Leather |  |
| Imperial Light Shield | 1 | Craftsmanship | N/A | 1 Leather |  |
| Imperial Light Shield | 1 | Craftsmanship | Forge | 2 Ingot: Steel 4 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Light Shield | 1 | Craftsmanship | Forge | 2 Ingot: Steel 4 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Officer Heavy Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Imperial Officer Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Officer Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Outcast Boots | 1 | Craftsmanship | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | 1 | Craftsmanship | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Imperial Outcast Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Imperial Outcast Bracers | 1 | Craftsmanship | N/A | 1 Pelt: Elk 2 Leather Strips |  |
| Imperial Outcast Bracers | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Fur Plate |  |
| Imperial Outcast Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Imperial Outcast Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Imperial Outcast Helmet | 1 | Craftsmanship | Forge | 1 Pelt: Snow Bear 1 Ingot: Iron 1 Leather Strips |  |
| Imperial Outcast Helmet | 1 | Craftsmanship | Forge | 1 Pelt: Snow Bear 1 Ingot: Iron 1 Leather Strips |  |
| Imperial Studded Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Imperial Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Imperial Sword | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Imperials |
| Imperial Sword | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Imperials |
| Ingot: Corundum | 20 | Craftsmanship | Smelter | 100 Ore: Corundum |  |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 30 Ore: Corundum |  |
| Ingot: Corundum | 20 | Craftsmanship | Smelter | 60 Ore: Corundum |  |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 25 Ore: Corundum |  |
| Ingot: Corundum | 20 | Craftsmanship | Smelter | 60 Ore: Corundum |  |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 20 Fragment: Corundum |  |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 3 Ore: Corundum |  |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 20 Fragment: Corundum |  |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 50 Ore: Corundum |  |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 30 Ore: Corundum |  |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 100 Fragment: Corundum |  |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 25 Ore: Corundum |  |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 200 Fragment: Corundum |  |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 100 Fragment: Corundum |  |
| Ingot: Corundum | 20 | Craftsmanship | Smelter | 100 Ore: Corundum |  |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 15 Ore: Corundum |  |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 200 Fragment: Corundum |  |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 5 Ore: Corundum |  |
| Ingot: Corundum | 10 | Craftsmanship | Smelter | 50 Ore: Corundum |  |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 5 Ore: Corundum |  |
| Ingot: Corundum | 1 | Craftsmanship | Smelter | 3 Ore: Corundum |  |
| Ingot: Corundum | 5 | Craftsmanship | Smelter | 15 Ore: Corundum |  |
| Ingot: Galatite | 2 | Craftsmanship | N/A | 1 Skyforge Steel Mace |  |
| Ingot: Galatite | 1 | Craftsmanship | Smelter | 20 Fragment: Galatite |  |
| Ingot: Galatite | 1 | Craftsmanship | Smelter | 14 Fragment: Steel 6 Fragment: Quicksilver |  |
| Ingot: Galatite | 1 | Craftsmanship | Smelter | 20 Fragment: Galatite |  |
| Ingot: Galatite | 10 | Craftsmanship | Smelter | 200 Fragment: Galatite |  |
| Ingot: Galatite | 3 | Craftsmanship | Smelter | 2 Ingot: Steel 1 Ingot: Quicksilver |  |
| Ingot: Galatite | 3 | Craftsmanship | Smelter | 2 Ingot: Steel 1 Ingot: Quicksilver |  |
| Ingot: Galatite | 6 | Craftsmanship | Smelter | 4 Ingot: Steel 2 Ingot: Quicksilver |  |
| Ingot: Galatite | 1 | Craftsmanship | Smelter | 14 Fragment: Steel 6 Fragment: Quicksilver |  |
| Ingot: Galatite | 6 | Craftsmanship | Smelter | 4 Ingot: Steel 2 Ingot: Quicksilver |  |
| Ingot: Galatite | 5 | Craftsmanship | Smelter | 100 Fragment: Galatite |  |
| Ingot: Galatite | 5 | Craftsmanship | Smelter | 100 Fragment: Galatite |  |
| Ingot: Galatite | 10 | Craftsmanship | Smelter | 200 Fragment: Galatite |  |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 20 Fragment: Iron |  |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 200 Fragment: Iron |  |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 20 Fragment: Iron |  |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 3 Ore: Iron |  |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 5 Ore: Iron |  |
| Ingot: Iron | 20 | Craftsmanship | Smelter | 100 Ore: Iron |  |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 100 Fragment: Iron |  |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 15 Ore: Iron |  |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 15 Ore: Iron |  |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 25 Ore: Iron |  |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 100 Fragment: Iron |  |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 50 Ore: Iron |  |
| Ingot: Iron | 5 | Craftsmanship | Smelter | 25 Ore: Iron |  |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 30 Ore: Iron |  |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 30 Ore: Iron |  |
| Ingot: Iron | 20 | Craftsmanship | Smelter | 60 Ore: Iron |  |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 200 Fragment: Iron |  |
| Ingot: Iron | 20 | Craftsmanship | Smelter | 60 Ore: Iron |  |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 3 Ore: Iron |  |
| Ingot: Iron | 1 | Craftsmanship | Smelter | 5 Ore: Iron |  |
| Ingot: Iron | 20 | Craftsmanship | Smelter | 100 Ore: Iron |  |
| Ingot: Iron | 10 | Craftsmanship | Smelter | 50 Ore: Iron |  |
| Ingot: Steel | 10 | Craftsmanship | Smelter | 10 Ingot: Iron 10 Charcoal |  |
| Ingot: Steel | 25 | Craftsmanship | Smelter | 25 Ingot: Iron 25 Charcoal |  |
| Ingot: Steel | 10 | Craftsmanship | Smelter | 200 Fragment: Steel |  |
| Ingot: Steel | 10 | Craftsmanship | Smelter | 200 Fragment: Steel |  |
| Ingot: Steel | 50 | Craftsmanship | Smelter | 50 Ingot: Iron 50 Charcoal |  |
| Ingot: Steel | 25 | Craftsmanship | Smelter | 25 Ingot: Iron 25 Charcoal |  |
| Ingot: Steel | 5 | Craftsmanship | Smelter | 100 Fragment: Steel |  |
| Ingot: Steel | 50 | Craftsmanship | Smelter | 50 Ingot: Iron 50 Charcoal |  |
| Ingot: Steel | 10 | Craftsmanship | Smelter | 10 Ingot: Iron 10 Charcoal |  |
| Ingot: Steel | 1 | Craftsmanship | Smelter | 20 Fragment: Steel |  |
| Ingot: Steel | 1 | Craftsmanship | Smelter | 1 Ingot: Iron 1 Charcoal |  |
| Ingot: Steel | 5 | Craftsmanship | Smelter | 100 Fragment: Steel |  |
| Ingot: Steel | 1 | Craftsmanship | Smelter | 20 Fragment: Steel |  |
| Ingot: Steel | 1 | Craftsmanship | Smelter | 1 Ingot: Iron 1 Charcoal |  |
| Iron Armor (Engraved) | 1 | Craftsmanship | Forge | 1 Iron Cuirass |  |
| Iron Banded Cuirass | 1 | Craftsmanship | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass | 1 | Craftsmanship | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Banded Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Banded Cuirass - Engraved | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | 1 | Craftsmanship | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | 1 | Craftsmanship | Forge | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | 1 | Craftsmanship | Forge | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Masterwork Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Banded Quality Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Quality Shield | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Banded Quality Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Shield | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Banded Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Battleaxe | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Battleaxe | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Battleaxe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Battlestaff | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Wood 2 Leather Strips |  |
| Iron Battlestaff | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Wood 2 Leather Strips |  |
| Iron Battlestaff | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | 1 | Craftsmanship | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | 1 | Craftsmanship | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Boots - Engraved | 1 | Craftsmanship | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots - Engraved | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots - Engraved | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Boots - Engraved | 1 | Craftsmanship | Forge | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots (Engraved) | 1 | Craftsmanship | N/A | 1 Iron Boots |  |
| Iron Cauldron | 1 | Craftsmanship | Forge | 8 Ingot: Iron |  |
| Iron Cauldron | 1 | Craftsmanship | Forge | 8 Ingot: Iron |  |
| Iron Cooking Pot | 1 | Craftsmanship | Forge | 2 Ingot: Iron |  |
| Iron Cooking Pot | 1 | Craftsmanship | Forge | 2 Ingot: Iron |  |
| Iron Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass - Engraved | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | 1 | Craftsmanship | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | 1 | Craftsmanship | Forge | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | 1 | Craftsmanship | Forge | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass - Engraved | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Dagger | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Dagger | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Dagger | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Dented Shield | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Fittings | 5 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Fittings | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Fittings | 10 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Fittings | 5 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Fittings | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Fittings | 10 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Furred Cuirass | 1 | Craftsmanship | Forge | 3 Ingot: Iron 4 Hide Lace 2 Fur Plate |  |
| Iron Furred Cuirass | 1 | Craftsmanship | Forge | 3 Ingot: Iron 4 Hide Lace 2 Fur Plate |  |
| Iron Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Gauntlets - Engraved | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Gauntlets - Engraved | 1 | Craftsmanship | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | 1 | Craftsmanship | Forge | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets - Engraved | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets - Engraved | 1 | Craftsmanship | Forge | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets (Engraved) | 1 | Craftsmanship | Forge | 1 Iron Gauntlets |  |
| Iron Greatsword | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Leather Strips |  |
| Iron Greatsword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Greatsword | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Leather Strips |  |
| Iron Guard's Cuirass - Eastmarch | 1 | Craftsmanship | Forge | 5 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Iron Guard's Cuirass - Eastmarch | 1 | Craftsmanship | Forge | 5 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Iron Guard's Cuirass - Falkreath | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Ingot: Corundum 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Falkreath | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Ingot: Corundum 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Haafingar | 1 | Craftsmanship | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Haafingar | 1 | Craftsmanship | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Hjaalmarch | 1 | Craftsmanship | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Hjaalmarch | 1 | Craftsmanship | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Pale | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Pale | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Reach | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 3 Leather 3 Ingot: Dwarven | Thane of Hold |
| Iron Guard's Cuirass - The Reach | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 3 Leather 3 Ingot: Dwarven | Thane of Hold |
| Iron Guard's Cuirass - The Rift | 1 | Craftsmanship | Forge | 3 Ingot: Iron 6 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Rift | 1 | Craftsmanship | Forge | 3 Ingot: Iron 6 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Whiterun | 1 | Craftsmanship | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Whiterun | 1 | Craftsmanship | Forge | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Winterhold | 1 | Craftsmanship | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Winterhold | 1 | Craftsmanship | Forge | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Hammer | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Hammer | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Headsman's Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Headsman's Axe | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Headsman's Axe | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Heavy Crossbow | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Wood 2 Hide Lace |  |
| Iron Heavy Crossbow | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Wood 2 Hide Lace |  |
| Iron Heavy Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron 2 Hide Lace |  |
| Iron Heavy Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Wood 2 Leather Strips |  |
| Iron Heavy Shield | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Iron Dented Shield |  |
| Iron Heavy Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Wood 2 Leather Strips |  |
| Iron Heavy Shield | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Heavy Shield | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Iron Dented Shield |  |
| Iron Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Engraved | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Engraved | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Helmet - Engraved | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Ram | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Helmet - Ram | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Ram | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Ram | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Ram | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet (Engraved) | 1 | Craftsmanship | Forge | 1 Iron Helmet |  |
| Iron Hinge | 2 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Hinge | 20 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Hinge | 2 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Hinge | 20 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Hinge | 10 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Hinge | 10 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Hunting Knife | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Hunting Knife | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Lantern | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Lantern | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Falkreath | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Falkreath | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Falkreath | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Hjaalmarch | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Hjaalmarch | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Hjaalmarch | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Pale | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Pale | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Pale | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Reach | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Reach | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Reach | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Rift | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Rift | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - The Rift | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Whiterun | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Helmet - Whiterun | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Whiterun | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Eastmarch | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Eastmarch | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Eastmarch | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Falkreath | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Falkreath | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Falkreath | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Haafingar | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Haafingar | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Haafingar | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Hjaalmarch | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Hjaalmarch | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Hjaalmarch | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Pale | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - The Pale | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Pale | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - The Rift | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Rift | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Rift | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Whiterun | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Whiterun | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Light Guard's Shield - Whiterun | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Lock | 5 | Craftsmanship | Forge | 5 Ingot: Iron 5 Ingot: Corundum |  |
| Iron Lock | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Ingot: Corundum |  |
| Iron Lock | 10 | Craftsmanship | Forge | 10 Ingot: Iron 10 Ingot: Corundum |  |
| Iron Lock | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Ingot: Corundum |  |
| Iron Lock | 10 | Craftsmanship | Forge | 10 Ingot: Iron 10 Ingot: Corundum |  |
| Iron Lock | 5 | Craftsmanship | Forge | 5 Ingot: Iron 5 Ingot: Corundum |  |
| Iron Mace | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Mace | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Mace | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Nails | 10 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Nails | 50 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Nails | 100 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Nails | 10 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Nails | 100 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Nails | 50 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Pickaxe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood |  |
| Iron Pickaxe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Quality Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | 1 | Craftsmanship | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | 1 | Craftsmanship | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Quality Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Quality Boots | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Quality Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Quality Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Quality Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Quality Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Quality Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Quality Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Quality Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Quality Shield | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Iron Quality Shield | 1 | Craftsmanship | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Reinforced Armor (Engraved) | 1 | Craftsmanship | N/A | 1 Iron Banded Cuirass |  |
| Iron Robed Cuirass - Dark | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Iron Robed Cuirass - Dark | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Iron Robed Cuirass - Pale | 1 | Craftsmanship | Forge | 3 Ingot: Iron 4 Linen Thread 3 Linen Cloth |  |
| Iron Robed Cuirass - Pale | 1 | Craftsmanship | Forge | 3 Ingot: Iron 4 Linen Thread 3 Linen Cloth |  |
| Iron Shiv | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Sword | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Leather Strips |  |
| Iron Sword | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Leather Strips |  |
| Iron Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Tongs | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Tongs | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Warhammer | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Warhammer | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Warhammer | 1 | Craftsmanship | Forge | 5 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Woodcutter's Axe | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Deadwood |  |
| Iron Woodcutter's Axe | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | 1 | Craftsmanship | Forge | 1 Ingot: Iron 2 Deadwood |  |
| Ironhand Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Jarl of Eastmarch Armguards | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armguards | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armor | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armor | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark 4 Fur Plate |  |
| Jarl of Eastmarch Armor | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark 4 Fur Plate |  |
| Jarl of Eastmarch Armor | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark |  |
| Jon's Heavy Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Jon's Twohander | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Boar |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Poor) |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Troll |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Boar |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Poor) |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Poor) |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Bear |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Poor) |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Poor) |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Skeever |  |
| Leather | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Poor) |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Poor) |  |
| Leather | 1 | Craftsmanship | Tanning Rack | 2 Pelt: Skeever |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Troll |  |
| Leather | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Bear |  |
| Leather | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer |  |
| Leather Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Black |  |
| Leather Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Brown |  |
| Leather Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Ornate Black |  |
| Leather Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Ornate Brown |  |
| Leather Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Ornate White |  |
| Leather Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Trimmed Black |  |
| Leather Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Leather Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - Trimmed White |  |
| Leather Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Bearskin Hood - White |  |
| Leather Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Boots | 1 | Craftsmanship | N/A | 3 Leather Strips 4 Leather |  |
| Leather Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Bracers | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather |  |
| Leather Bracers | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Clothes - Black | 1 | Craftsmanship | N/A | 3 Leather 2 Linen Cloth - Black 4 Linen Thread |  |
| Leather Clothes - Black and Brown | 1 | Craftsmanship | N/A | 2 Leather 2 Linen Cloth - Black 1 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Leather Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Leather Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Doublet | 1 | Craftsmanship | N/A | 2 Leather 2 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Doublet - Dark | 1 | Craftsmanship | N/A | 2 Leather 3 Linen Cloth - Black 4 Linen Thread |  |
| Leather Executioner's Boots | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 3 Leather Strips |  |
| Leather Executioner's Boots | 1 | Craftsmanship | N/A | 3 Leather Strips 1 Fur Plate |  |
| Leather Executioner's Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark |  |
| Leather Executioner's Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark 2 Fur Plate |  |
| Leather Executioner's Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark |  |
| Leather Executioner's Cuirass | 1 | Craftsmanship | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark 2 Fur Plate |  |
| Leather Executioner's Gloves | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Leather Executioner's Gloves | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark 1 Fur Plate |  |
| Leather Executioner's Gloves | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Leather Executioner's Gloves | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark 1 Fur Plate |  |
| Leather Executioner's Hood | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Dark |  |
| Leather Helmet | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Leather Helmet | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Helmet | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Leather Hood | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather |  |
| Leather Hood | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Hood - Black | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Dark |  |
| Leather Large Tent | 1 | Craftsmanship | N/A | 2 Wood 12 Leather 4 Fur Plate 1 Fur Bedroll |  |
| Leather Large Tent (Three Bedrolls) | 1 | Craftsmanship | N/A | 1 Leather Large Tent (Two Bedrolls) 1 Fur Bedroll |  |
| Leather Large Tent (Two Bedrolls) | 1 | Craftsmanship | N/A | 1 Leather Large Tent 1 Fur Bedroll |  |
| Leather Quilted Clothes - Black | 1 | Craftsmanship | N/A | 1 Leather 4 Linen Cloth - Black 4 Linen Thread |  |
| Leather Small Tent | 1 | Craftsmanship | N/A | 2 Wood 6 Leather 2 Fur Plate 1 Fur Bedroll |  |
| Leather Small Tent (Two Bedrolls) | 1 | Craftsmanship | N/A | 1 Leather Small Tent 1 Fur Bedroll |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Fox (Poor) |  |
| Leather Strips | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ruined |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Skeever (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox |  |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Goat (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Fox |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf (Poor) |  |
| Leather Strips | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Leather |  |
| Leather Strips | 4 | Craftsmanship | N/A | 1 Leather |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ruined |  |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Leather Strips | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Poor) |  |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Poor) |  |
| Leather Strips | 4 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf (Poor) |  |
| Leather Strips | 3 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Fox (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Poor) |  |
| Leather Strips | 1 | Craftsmanship | Tanning Rack | 1 Pelt: Skeever (Poor) |  |
| Leather Strips | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Fox |  |
| Leather Tiled Clothes - Brown | 1 | Craftsmanship | N/A | 1 Leather 4 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Tiled Clothes - Brown and Black | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Black |  |
| Leather Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Brown |  |
| Leather Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Leather Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Leather Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Leather Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Leather Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Leather Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Leather Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Noble Black |  |
| Leather Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Noble Brown |  |
| Leather Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Noble White |  |
| Leather Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Ornate Black |  |
| Leather Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Leather Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - Ornate White |  |
| Leather Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Leather Helmet 1 Wolfskin Hood - White |  |
| Leather Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Leather: Dark | 5 | Craftsmanship | N/A | 5 Ore: Iron 5 Leather |  |
| Leather: Dark | 1 | Craftsmanship | N/A | 1 Ore: Iron 1 Leather |  |
| Leather: Dark | 5 | Craftsmanship | Tanning Rack | 5 Ore: Iron 5 Leather |  |
| Leather: Dark | 1 | Craftsmanship | Tanning Rack | 1 Ore: Iron 1 Leather |  |
| Leather: Red | 1 | Craftsmanship | N/A | 2 Creep Cluster 1 Leather |  |
| Leather: Red | 5 | Craftsmanship | Tanning Rack | 10 Creep Cluster 5 Leather |  |
| Leather: Red | 1 | Craftsmanship | Tanning Rack | 2 Creep Cluster 1 Leather |  |
| Leather: Red | 5 | Craftsmanship | N/A | 10 Creep Cluster 5 Leather |  |
| Linen Alik'r Boots - Dark | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Alik'r Boots - Dark | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Boots - Dark | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Boots - Tan | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Boots - Tan | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Tan 2 Linen Thread |  |
| Linen Alik'r Garb - Red | 1 | Craftsmanship | N/A | 1 Linen Cloth - Red 2 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Alik'r Garb - Red | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Garb - Red | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Garb - White | 1 | Craftsmanship | N/A | 1 Leather 1 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Alik'r Garb - White | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Hood - Blue | 1 | Craftsmanship | N/A | 3 Linen Cloth - Blue 1 Linen Thread |  |
| Linen Alik'r Hood - Blue | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Hood - Red | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Hood - Red | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linen Alik'r Hood - Red | 1 | Craftsmanship | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Arm Bandages | 1 | Craftsmanship | N/A | 2 Linen Cloth |  |
| Linen Barkeep's Clothes - Brown | 1 | Craftsmanship | N/A | 2 Leather Strips 4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth |  |
| Linen Barkeep's Clothes - White | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Linen Cloth - Brown 4 Linen Thread 4 Linen Cloth |  |
| Linen Blacksmith's Apron - Red | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 3 Linen Cloth - Red 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Blacksmith's Apron - White | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 2 Linen Cloth - Grey 4 Linen Thread 3 Linen Cloth |  |
| Linen Blacksmith's Shoes | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Cap | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Chef's Hat | 1 | Craftsmanship | N/A | 1 Linen Thread 3 Linen Cloth |  |
| Linen Chef's Tunic | 1 | Craftsmanship | N/A | 4 Leather Strips 4 Linen Thread 5 Linen Cloth |  |
| Linen Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Northern Flax |  |
| Linen Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Northern Flax |  |
| Linen Cloth - Black | 1 | Craftsmanship | N/A | 1 Dye - Black 1 Linen Cloth |  |
| Linen Cloth - Blue | 1 | Craftsmanship | N/A | 1 Dye - Blue 1 Linen Cloth |  |
| Linen Cloth - Brown | 1 | Craftsmanship | N/A | 1 Dye - Brown 1 Linen Cloth |  |
| Linen Cloth - Green | 1 | Craftsmanship | N/A | 1 Dye - Green 1 Linen Cloth |  |
| Linen Cloth - Grey | 1 | Craftsmanship | N/A | 1 Dye - Grey 1 Linen Cloth |  |
| Linen Cloth - Indigo | 1 | Craftsmanship | N/A | 1 Dye - Indigo 1 Linen Cloth |  |
| Linen Cloth - Orange | 1 | Craftsmanship | N/A | 1 Dye - Orange 1 Linen Cloth |  |
| Linen Cloth - Purple | 1 | Craftsmanship | N/A | 1 Dye - Purple 1 Linen Cloth |  |
| Linen Cloth - Red | 1 | Craftsmanship | N/A | 1 Dye - Red 1 Linen Cloth |  |
| Linen Cloth - Tan | 1 | Craftsmanship | N/A | 1 Dye - Tan 1 Linen Cloth |  |
| Linen Cloth - Yellow | 1 | Craftsmanship | N/A | 1 Dye - Yellow 1 Linen Cloth |  |
| Linen Clothes - Black and Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Clothes - Black, Grey, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Clothes - Brown and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown, Grey, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown, White, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Collared Brown and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Collared Orange and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Orange, Grey, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Orange, White, and Brown | 1 | Craftsmanship | N/A | 1 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Orange, White, and Tan | 1 | Craftsmanship | N/A | 1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Cowl - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 1 Linen Thread |  |
| Linen Cowl - Blue | 1 | Craftsmanship | N/A | 3 Linen Cloth - Blue 1 Linen Thread |  |
| Linen Cowl - Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 1 Linen Thread |  |
| Linen Cowl - Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Cowl - Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Cowl - Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 1 Linen Thread |  |
| Linen Cowl - Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Orange 1 Linen Thread |  |
| Linen Cowl - Purple | 1 | Craftsmanship | N/A | 3 Linen Cloth - Purple 1 Linen Thread |  |
| Linen Cowl - Red | 1 | Craftsmanship | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Cowl - White | 1 | Craftsmanship | N/A | 1 Linen Thread 3 Linen Cloth |  |
| Linen Cowl - Yellow | 1 | Craftsmanship | N/A | 3 Linen Cloth - Yellow 1 Linen Thread |  |
| Linen Cuffed Boots | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Tan 2 Linen Thread |  |
| Linen Doublet - Brown and Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Doublet - Brown and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Doublet - Brown and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan | 1 | Craftsmanship | N/A | 5 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan and Grey | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 3 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan, Grey, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Dunmer Boots | 1 | Craftsmanship | N/A | 1 Netch Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Dunmer Hood - Blue | 1 | Craftsmanship | N/A | 3 Linen Cloth - Indigo 1 Linen Thread |  |
| Linen Dunmer Hood - Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 1 Linen Thread |  |
| Linen Dunmer Hood - Red | 1 | Craftsmanship | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Dunmer Tunic - Blue | 1 | Craftsmanship | N/A | 1 Netch Leather 3 Linen Cloth - Blue 1 Linen Cloth - Grey 1 Linen Cloth - Indigo 4 Linen Thread |  |
| Linen Dunmer Tunic - Brown | 1 | Craftsmanship | N/A | 1 Netch Leather 3 Linen Cloth - Brown 1 Linen Cloth - Green 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Dunmer Tunic - Red | 1 | Craftsmanship | N/A | 1 Netch Leather 3 Linen Cloth - Red 1 Linen Cloth - Brown 1 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Farm Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Footwraps | 1 | Craftsmanship | N/A | 2 Linen Wrap 2 Linen Thread |  |
| Linen Gloves - Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Gloves - Blue | 1 | Craftsmanship | N/A | 2 Linen Cloth - Blue 2 Linen Thread |  |
| Linen Gloves - Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Gloves - Green | 1 | Craftsmanship | N/A | 2 Linen Cloth - Green 2 Linen Thread |  |
| Linen Gloves - Grey | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 2 Linen Thread |  |
| Linen Gloves - Red | 1 | Craftsmanship | N/A | 2 Linen Cloth - Red 2 Linen Thread |  |
| Linen Headscarf | 1 | Craftsmanship | N/A | 2 Linen Thread 3 Linen Cloth |  |
| Linen Hood - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 1 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Hood - Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Mage Robes - Black and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Robes - Black and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Robes - Brown and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Mage Robes - Brown and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Robes - Green and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Mage Robes - Tan and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Tunic - Blue and Quilted Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Mage Tunic - Grey and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Tunic - Grey and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Tunic - White and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White and Orange | 1 | Craftsmanship | N/A | 2 Linen Cloth - Orange 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White and Quilted Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White, Green, and Brown | 1 | Craftsmanship | N/A | 1 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth |  |
| Linen Miner's Boots | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 3 Linen Cloth - Green 2 Linen Thread |  |
| Linen Miner's Clothes - Brown | 1 | Craftsmanship | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Miner's Clothes - Grey and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Miner's Clothes - Orange and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Miner's Clothes - Orange and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Miner's Clothes - Tan | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Green 3 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Miner's Clothes - White | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Miner's Clothes - Yellow and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Monk Boots - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Thread |  |
| Linen Monk Boots - Brown | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Moth Priest Blindfold | 1 | Craftsmanship | N/A | 1 Linen Cloth - Grey 1 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Moth Priest Robes | 1 | Craftsmanship | N/A | 5 Linen Cloth - Grey 4 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Moth Priest Sandals | 1 | Craftsmanship | N/A | 1 Leather 1 Linen Cloth - Brown 1 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Mourner's Clothes | 1 | Craftsmanship | N/A | 2 Leather Strips 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Mourner's Headscarf | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Thread |  |
| Linen Plain Robes - Grey and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Grey and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Grey and Red | 1 | Craftsmanship | N/A | 2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Red | 1 | Craftsmanship | N/A | 2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Mantled Orange and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Orange and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Prisoner's Rags | 1 | Craftsmanship | N/A | 3 Linen Wrap 2 Linen Thread |  |
| Linen Ragged Boots | 1 | Craftsmanship | N/A | 2 Linen Wrap 2 Linen Thread |  |
| Linen Ragged Cap | 1 | Craftsmanship | N/A | 2 Linen Wrap 1 Linen Thread |  |
| Linen Ragged Robes | 1 | Craftsmanship | N/A | 5 Linen Wrap 4 Linen Thread |  |
| Linen Robes - Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Robes - Brown | 1 | Craftsmanship | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Robes - Green | 1 | Craftsmanship | N/A | 5 Linen Cloth - Green 4 Linen Thread |  |
| Linen Robes - Grey | 1 | Craftsmanship | N/A | 5 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Robes - Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Robes - Red | 1 | Craftsmanship | N/A | 1 Linen Cloth - Red 4 Linen Thread 4 Linen Cloth |  |
| Linen Roughspun Tunic | 1 | Craftsmanship | N/A | 3 Linen Wrap 2 Linen Thread |  |
| Linen Shoes - Brown | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Skirt - Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Skirt - Green and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Green 4 Linen Thread |  |
| Linen Skirt - Indigo and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Indigo 4 Linen Thread |  |
| Linen Skirt - Orange and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Skirt - Quilted Brown | 1 | Craftsmanship | N/A | 4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth |  |
| Linen Stitched Boots | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Surcoat - Black and Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Surcoat - Black and Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Tavern Clothes | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Linen Cloth - Brown 3 Linen Cloth - Green 1 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Thread | 4 | Craftsmanship | Spinning Wheel | 3 Northern Flax |  |
| Linen Thread | 4 | Craftsmanship | Spinning Wheel | 3 Northern Flax |  |
| Linen Traveler Robes - Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Traveler Robes - Black and Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Traveler Robes - Black and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Traveler Robes - Black, Brown, and Green | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Green 4 Linen Thread |  |
| Linen Traveler Robes - Black, Brown, and Grey | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Traveler Robes - Black, Tan, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Brown and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Traveler Robes - Brown and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Traveler Robes - Brown, Tan, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Purple, Orange, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Orange 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Purple, Tan, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Tan 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth |  |
| Linen Tunic - Belted Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Tunic - Belted Green | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Belted Red | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Belted Tan | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Blue and Orange | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Blue 2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Tunic - Embroidered Brown | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Linen Cloth - Brown 2 Linen Cloth - Purple 2 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Tunic - Indigo and Green | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Tunic - Tan | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Work Boots - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Work Boots - Brown | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Thread |  |
| Linwe's Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linwe's Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linwe's Gloves | 1 | Craftsmanship | N/A | 1 Leather |  |
| Linwe's Hood | 1 | Craftsmanship | N/A | 1 Leather |  |
| Mail and Hide | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Hide | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Jacket | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Jacket | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Leather Surcoat | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Linen Cloth - Black |  |
| Mail and Leather Surcoat | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Linen Cloth - Black |  |
| Mail and Leathers | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Leathers | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Pauldroned Leather | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 2 Hide Lace |  |
| Mail and Pauldroned Leather | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 2 Hide Lace |  |
| Mail and Surcoat | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Surcoat | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Tunic | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Tunic | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Miraak's Boots | 1 | Craftsmanship | N/A | 2 Leather 2 Silk Thread 2 Silk Cloth - Brown | Killed Miraak |
| Miraak's Gloves | 1 | Craftsmanship | N/A | 2 Silk Thread 2 Silk Cloth - Brown | Killed Miraak |
| Miraak's Robes | 1 | Craftsmanship | N/A | 4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Brown | Killed Miraak |
| Noble Armguards | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Leather |  |
| Notched Pickaxe | 1 | Craftsmanship | Sharpening Wheel | 1 Gem: Diamond |  |
| Oiled Mail and Hide | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Flammable Oil |  |
| Oiled Mail and Hide | 1 | Craftsmanship | Forge | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Flammable Oil |  |
| Oiled Mail and Jacket | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Jacket | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Tunic | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Tunic | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Pelt: Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Fine) |  |
| Pelt: Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Bear (Fine) |  |
| Pelt: Boar | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Fine) |  |
| Pelt: Boar | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Boar (Fine) |  |
| Pelt: Cave Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Fine) |  |
| Pelt: Cave Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cave Bear (Fine) |  |
| Pelt: Cow | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Fine) |  |
| Pelt: Cow | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Cow (Fine) |  |
| Pelt: Deer | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Fine) |  |
| Pelt: Deer | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Deer (Fine) |  |
| Pelt: Elk | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Fine) |  |
| Pelt: Elk | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Elk (Fine) |  |
| Pelt: Fox | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Fox (Fine) |  |
| Pelt: Fox | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Fox (Fine) |  |
| Pelt: Frost Troll | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Fine) |  |
| Pelt: Frost Troll | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Frost Troll (Fine) |  |
| Pelt: Goat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Goat (Fine) |  |
| Pelt: Goat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Goat (Fine) |  |
| Pelt: Horse | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Fine) |  |
| Pelt: Horse | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Horse (Fine) |  |
| Pelt: Ice Wolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf (Fine) |  |
| Pelt: Ice Wolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Ice Wolf (Fine) |  |
| Pelt: Mammoth Section | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Fine) |  |
| Pelt: Mammoth Section | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Mammoth Section (Fine) |  |
| Pelt: Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Fine) |  |
| Pelt: Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Sabre Cat (Fine) |  |
| Pelt: Skeever | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Skeever (Fine) |  |
| Pelt: Skeever | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Skeever (Fine) |  |
| Pelt: Snow Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Fine) |  |
| Pelt: Snow Bear | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Bear (Fine) |  |
| Pelt: Snow Fox | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Fine) |  |
| Pelt: Snow Fox | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snow Fox (Fine) |  |
| Pelt: Snowy Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Fine) |  |
| Pelt: Snowy Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Snowy Sabre Cat (Fine) |  |
| Pelt: Troll | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Fine) |  |
| Pelt: Troll | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Troll (Fine) |  |
| Pelt: Vale Deer | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Fine) |  |
| Pelt: Vale Deer | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Deer (Fine) |  |
| Pelt: Vale Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Fine) |  |
| Pelt: Vale Sabre Cat | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Vale Sabre Cat (Fine) |  |
| Pelt: Werewolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Fine) |  |
| Pelt: Werewolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Werewolf (Fine) |  |
| Pelt: Wolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf (Fine) |  |
| Pelt: Wolf | 2 | Craftsmanship | Tanning Rack | 1 Pelt: Wolf (Fine) |  |
| Penitus Oculatus Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Penitus Oculatus Bracers | 1 | Craftsmanship | N/A | 1 Leather |  |
| Penitus Oculatus Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Penitus Oculatus Helmet | 1 | Craftsmanship | N/A | 1 Leather |  |
| Poacher's Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Predator's Grace | 1 | Craftsmanship | N/A | 1 Leather |  |
| Ragnok's Toothpick | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Red Eagle's Bane | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Red Eagle's Fury | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Ring of Bones | 1 | Craftsmanship | Forge | 1 Bone Meal 1 Ingot: Corundum | Daedra - The Taste of Death |
| Ring of Bones | 1 | Craftsmanship | Forge | 1 Bone Meal 1 Ingot: Corundum | Daedra - The Taste of Death |
| Robed Mail | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Brown 4 Linen Thread |  |
| Robed Mail | 1 | Craftsmanship | Forge | 3 Ingot: Iron 3 Linen Cloth - Brown 4 Linen Thread |  |
| Sheogorath's Boots | 1 | Craftsmanship | N/A | 2 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Purple | Daedra - The Mind of Madness |
| Sheogorath's Garb | 1 | Craftsmanship | N/A | 4 Silk Thread 1 Silk Cloth 1 Silk Cloth - Orange 3 Silk Cloth - Purple | Daedra - The Mind of Madness |
| Shield of Solitude | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Shrouded Ancient Boots | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Ancient Cowl - Masked | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Ancient Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Ancient Gloves | 1 | Craftsmanship | N/A | 1 Leather: Red |  |
| Shrouded Boots | 1 | Craftsmanship | N/A | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Boots | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Boots | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Cowl | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Cowl | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Cowl - Maskless | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl - Maskless | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Cowl - Maskless | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Cuirass | 1 | Craftsmanship | N/A | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Gloves | 1 | Craftsmanship | N/A | 1 Leather: Red |  |
| Shrouded Gloves | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Gloves | 1 | Craftsmanship | N/A | 1 Leather: Red |  |
| Shrouded Hand Wraps | 1 | Craftsmanship | N/A | 2 Silk Thread 1 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Robes | 1 | Craftsmanship | N/A | 4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Shoes | 1 | Craftsmanship | N/A | 2 Silk Thread 2 Silk Cloth - Black | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Sleeveless Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Sleeveless Cuirass | 1 | Craftsmanship | N/A | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Sleeveless Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Veil | 1 | Craftsmanship | N/A | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Boots | 1 | Craftsmanship | N/A | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Boots | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Worn Cowl | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Worn Cowl | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl - Maskless | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl - Maskless | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Worn Cuirass | 1 | Craftsmanship | N/A | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Shrouded Worn Gloves | 1 | Craftsmanship | N/A | 1 Leather: Red |  |
| Shrouded Worn Gloves | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Silk Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Spider Egg |  |
| Silk Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Spider Egg |  |
| Silk Cloth - Black | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Black |  |
| Silk Cloth - Blue | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Blue |  |
| Silk Cloth - Brown | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Brown |  |
| Silk Cloth - Green | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Green |  |
| Silk Cloth - Grey | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Grey |  |
| Silk Cloth - Indigo | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Indigo |  |
| Silk Cloth - Orange | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Orange |  |
| Silk Cloth - Purple | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Purple |  |
| Silk Cloth - Red | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Red |  |
| Silk Cloth - Tan | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Tan |  |
| Silk Cloth - Yellow | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Yellow |  |
| Silk Cuffed Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Grey |  |
| Silk Embroidered Raiment - Blue | 1 | Craftsmanship | N/A | 2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Blue 2 Silk Cloth - Purple |  |
| Silk Embroidered Raiment - Red | 1 | Craftsmanship | N/A | 2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Red 2 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Green | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Green | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Indigo | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Indigo 1 Silk Cloth - Red |  |
| Silk Fur-Embellished Robes - Indigo | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Indigo 3 Silk Cloth - Red |  |
| Silk Fur-Embellished Robes - Tan | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan |  |
| Silk Fur-Embellished Robes - Tan | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan |  |
| Silk Fur-Lined Boots | 1 | Craftsmanship | N/A | 1 Leather 1 Fur Plate 2 Silk Thread 3 Silk Cloth - Tan |  |
| Silk Fur-Trimmed Clothes | 1 | Craftsmanship | N/A | 3 Pelt: Wolf 2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green |  |
| Silk Fur-Trimmed Clothes | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green |  |
| Silk Mage Boots - Ornate | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Grey |  |
| Silk Nocturnal Hood | 1 | Craftsmanship | N/A | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Grey | TG - Darkness Returns Complete |
| Silk Nocturnal Robes | 1 | Craftsmanship | N/A | 4 Silk Thread 3 Silk Cloth - Black 1 Silk Cloth - Grey | TG - Darkness Returns Complete |
| Silk Pleated Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Brown |  |
| Silk Psijic Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 1 Silk Cloth - Grey 1 Silk Cloth - Red 2 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Psijic Gloves | 1 | Craftsmanship | N/A | 1 Ingot: Quicksilver 2 Silk Thread 2 Silk Cloth - Brown | College - The Eye of Magnus Complete |
| Silk Psijic Hood | 1 | Craftsmanship | N/A | 3 Silk Thread 1 Silk Cloth - Red 2 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Psijic Robes | 1 | Craftsmanship | N/A | 2 Ingot: Quicksilver 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Grey 1 Silk Cloth - Red 3 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Thread | 4 | Craftsmanship | Spinning Wheel | 3 Spider Egg |  |
| Silk Thread | 4 | Craftsmanship | Spinning Wheel | 3 Spider Egg |  |
| Silk Wedding Finery | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red |  |
| Silk Wedding Finery | 1 | Craftsmanship | N/A | 1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red |  |
| Silver Amber Circlet | 1 | Craftsmanship | N/A | 3 Gem: Amber 1 Silver Circlet |  |
| Silver Amber Necklace | 1 | Craftsmanship | N/A | 1 Silver Necklace 1 Gem: Amber |  |
| Silver Amber Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Amber |  |
| Silver Amethyst Circlet | 1 | Craftsmanship | N/A | 3 Gem: Amethyst 1 Silver Circlet |  |
| Silver Amethyst Circlet (Flawless) | 1 | Craftsmanship | N/A | 3 Gem: Amethyst (Flawless) 1 Silver Circlet |  |
| Silver Amethyst Necklace | 1 | Craftsmanship | N/A | 1 Gem: Amethyst 1 Silver Necklace |  |
| Silver Amethyst Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Gem: Amethyst (Flawless) 1 Silver Necklace |  |
| Silver Amethyst Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Amethyst |  |
| Silver Amethyst Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Amethyst (Flawless) |  |
| Silver Aquamarine Circlet | 1 | Craftsmanship | N/A | 3 Gem: Aquamarine 1 Silver Circlet |  |
| Silver Aquamarine Circlet (Flawless) | 1 | Craftsmanship | N/A | 3 Gem: Aquamarine (Flawless) 1 Silver Circlet |  |
| Silver Aquamarine Necklace | 1 | Craftsmanship | N/A | 1 Silver Necklace 1 Gem: Aquamarine |  |
| Silver Aquamarine Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Necklace 1 Gem: Aquamarine (Flawless) |  |
| Silver Aquamarine Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Aquamarine |  |
| Silver Aquamarine Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Aquamarine (Flawless) |  |
| Silver Battlestaff | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Silver Battlestaff | 1 | Craftsmanship | Forge | 2 Ingot: Silver 2 Ingot: Steel 1 Gem: Amethyst |  |
| Silver Battlestaff | 1 | Craftsmanship | Forge | 2 Ingot: Silver 2 Ingot: Steel 1 Gem: Amethyst |  |
| Silver Circlet | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Silver Circlet | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Silver Diamond Circlet | 1 | Craftsmanship | N/A | 3 Gem: Diamond 1 Silver Circlet |  |
| Silver Diamond Circlet (Flawless) | 1 | Craftsmanship | N/A | 3 Gem: Diamond (Flawless) 1 Silver Circlet |  |
| Silver Diamond Necklace | 1 | Craftsmanship | N/A | 1 Gem: Diamond 1 Silver Necklace |  |
| Silver Diamond Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Gem: Diamond (Flawless) 1 Silver Necklace |  |
| Silver Diamond Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Diamond |  |
| Silver Diamond Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Diamond (Flawless) |  |
| Silver Emerald Circlet | 1 | Craftsmanship | N/A | 3 Gem: Emerald 1 Silver Circlet |  |
| Silver Emerald Circlet (Flawless) | 1 | Craftsmanship | N/A | 3 Gem: Emerald (Flawless) 1 Silver Circlet |  |
| Silver Emerald Necklace | 1 | Craftsmanship | N/A | 1 Gem: Emerald 1 Silver Necklace |  |
| Silver Emerald Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Gem: Emerald (Flawless) 1 Silver Necklace |  |
| Silver Emerald Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Emerald |  |
| Silver Emerald Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Emerald (Flawless) |  |
| Silver Garnet Circlet | 1 | Craftsmanship | N/A | 3 Gem: Garnet 1 Silver Circlet |  |
| Silver Garnet Circlet (Flawless) | 1 | Craftsmanship | N/A | 3 Gem: Garnet (Flawless) 1 Silver Circlet |  |
| Silver Garnet Necklace | 1 | Craftsmanship | N/A | 1 Gem: Garnet 1 Silver Necklace |  |
| Silver Garnet Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Gem: Garnet (Flawless) 1 Silver Necklace |  |
| Silver Garnet Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Garnet |  |
| Silver Garnet Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Garnet (Flawless) |  |
| Silver Greatsword | 1 | Craftsmanship | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips |  |
| Silver Greatsword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Silver Greatsword | 1 | Craftsmanship | Forge | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips |  |
| Silver Necklace | 1 | Craftsmanship | Forge | 4 Fragment: Silver |  |
| Silver Necklace | 1 | Craftsmanship | Forge | 4 Fragment: Silver |  |
| Silver Necklace (5) | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Silver Necklace (5) | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Silver Onyx Circlet | 1 | Craftsmanship | N/A | 3 Gem: Onyx 1 Silver Circlet |  |
| Silver Onyx Necklace | 1 | Craftsmanship | N/A | 1 Silver Necklace 1 Gem: Onyx |  |
| Silver Onyx Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Onyx |  |
| Silver Opal Circlet | 1 | Craftsmanship | N/A | 3 Gem: Opal 1 Silver Circlet |  |
| Silver Opal Necklace | 1 | Craftsmanship | N/A | 1 Silver Necklace 1 Gem: Opal |  |
| Silver Opal Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Opal |  |
| Silver Peridot Circlet | 1 | Craftsmanship | N/A | 3 Gem: Peridot 1 Silver Circlet |  |
| Silver Peridot Circlet (Flawless) | 1 | Craftsmanship | N/A | 3 Gem: Peridot (Flawless) 1 Silver Circlet |  |
| Silver Peridot Necklace | 1 | Craftsmanship | N/A | 1 Silver Necklace 1 Gem: Peridot |  |
| Silver Peridot Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Necklace 1 Gem: Peridot (Flawless) |  |
| Silver Peridot Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Peridot |  |
| Silver Peridot Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Peridot (Flawless) |  |
| Silver Ring | 1 | Craftsmanship | Forge | 2 Fragment: Silver |  |
| Silver Ring | 1 | Craftsmanship | Forge | 2 Fragment: Silver |  |
| Silver Ring (10) | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Silver Ring (10) | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Silver Ruby Circlet | 1 | Craftsmanship | N/A | 3 Gem: Ruby 1 Silver Circlet |  |
| Silver Ruby Circlet, Flawless | 1 | Craftsmanship | N/A | 3 Gem: Ruby (Flawless) 1 Silver Circlet |  |
| Silver Ruby Necklace | 1 | Craftsmanship | N/A | 1 Gem: Ruby 1 Silver Necklace |  |
| Silver Ruby Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Gem: Ruby (Flawless) 1 Silver Necklace |  |
| Silver Ruby Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Ruby |  |
| Silver Ruby Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Ruby (Flawless) |  |
| Silver Sapphire Circlet | 1 | Craftsmanship | N/A | 3 Gem: Sapphire 1 Silver Circlet |  |
| Silver Sapphire Circlet (Flawless) | 1 | Craftsmanship | N/A | 3 Gem: Sapphire (Flawless) 1 Silver Circlet |  |
| Silver Sapphire Necklace | 1 | Craftsmanship | N/A | 1 Gem: Sapphire 1 Silver Necklace |  |
| Silver Sapphire Necklace (Flawless) | 1 | Craftsmanship | N/A | 1 Gem: Sapphire (Flawless) 1 Silver Necklace |  |
| Silver Sapphire Ring | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Sapphire |  |
| Silver Sapphire Ring (Flawless) | 1 | Craftsmanship | N/A | 1 Silver Ring 1 Gem: Sapphire (Flawless) |  |
| Silver Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Silver |  |
| Silver Sword | 1 | Craftsmanship | Forge | 1 Ingot: Silver 2 Ingot: Steel 1 Leather Strips |  |
| Silver Sword | 1 | Craftsmanship | Forge | 1 Ingot: Silver 2 Ingot: Steel 1 Leather Strips |  |
| Skyforge Steel Dagger | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Galatite |  |
| Soap - Blue Mountain | 3 | Craftsmanship | Cook pot | 1 Salt 3 Blue Mountain Flower 1 Animal Fat |  |
| Soap - Blue Mountain | 3 | Craftsmanship | Cook pot | 1 Salt 3 Blue Mountain Flower 1 Animal Fat |  |
| Soap - Dragon's Tongue | 3 | Craftsmanship | Cook pot | 1 Salt 3 Dragon's Tongue 1 Animal Fat |  |
| Soap - Dragon's Tongue | 3 | Craftsmanship | Cook pot | 1 Salt 3 Dragon's Tongue 1 Animal Fat |  |
| Soap - Lavender | 3 | Craftsmanship | Cook pot | 1 Salt 3 Lavender 1 Animal Fat |  |
| Soap - Lavender | 3 | Craftsmanship | Cook pot | 1 Salt 3 Lavender 1 Animal Fat |  |
| Soap - Plain | 3 | Craftsmanship | Cook pot | 1 Salt 1 Animal Fat |  |
| Soap - Plain | 3 | Craftsmanship | Cook pot | 1 Salt 1 Animal Fat |  |
| Soap - Purple Mountain Flower | 3 | Craftsmanship | Cook pot | 1 Salt 3 Purple Mountain Flower 1 Animal Fat |  |
| Soap - Purple Mountain Flower | 3 | Craftsmanship | Cook pot | 1 Salt 3 Purple Mountain Flower 1 Animal Fat |  |
| Soap - Red Mountain Flower | 3 | Craftsmanship | Cook pot | 1 Salt 3 Red Mountain Flower 1 Animal Fat |  |
| Soap - Red Mountain Flower | 3 | Craftsmanship | Cook pot | 1 Salt 3 Red Mountain Flower 1 Animal Fat |  |
| Soap - Superior Mountain Flower | 3 | Craftsmanship | Cook pot | 1 Salt 2 Blue Mountain Flower 2 Red Mountain Flower 2 Purple Mountain Flower 1 Animal Fat |  |
| Soap - Superior Mountain Flower | 3 | Craftsmanship | Cook pot | 1 Salt 2 Blue Mountain Flower 2 Red Mountain Flower 2 Purple Mountain Flower 1 Animal Fat |  |
| Spell Research Journal | 1 | Craftsmanship | N/A | 5 Paper Roll 1 Leather 1 Linen Thread |  |
| Spinning Wheel | 1 | Craftsmanship | N/A | 8 Wood 5 Iron Nails |  |
| Steel Battleaxe | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Battleaxe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Battleaxe | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Battlestaff | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Battlestaff | 1 | Craftsmanship | Forge | 1 Ingot: Steel 4 Wood 2 Leather Strips |  |
| Steel Battlestaff | 1 | Craftsmanship | Forge | 1 Ingot: Steel 4 Wood 2 Leather Strips |  |
| Steel Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Black |  |
| Steel Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Brown |  |
| Steel Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Ornate Black |  |
| Steel Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Ornate Brown |  |
| Steel Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Ornate White |  |
| Steel Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Trimmed Black |  |
| Steel Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Steel Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - Trimmed White |  |
| Steel Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Bearskin Hood - White |  |
| Steel Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Boots | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots - White | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Boots - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Braced Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Hide Lace 2 Fur Plate |  |
| Steel Braced Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Hide Lace 2 Fur Plate |  |
| Steel Bracers | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Bracers | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Bracers | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Cuirass - White | 1 | Craftsmanship | Forge | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Dagger | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Dagger | 1 | Craftsmanship | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Steel Dagger | 1 | Craftsmanship | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Steel Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Gauntlets - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets - White | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Greatsword | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips |  |
| Steel Greatsword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Greatsword | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips |  |
| Steel Greaves | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Greaves | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Greaves | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Heavy Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel 2 Hide Lace |  |
| Steel Heavy Crossbow | 1 | Craftsmanship | Forge | 3 Ingot: Steel 3 Wood 2 Hide Lace |  |
| Steel Heavy Crossbow | 1 | Craftsmanship | Forge | 3 Ingot: Steel 3 Wood 2 Hide Lace |  |
| Steel Helmet | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Helmet - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet - White | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Helmet - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | 1 | Craftsmanship | Forge | 1 Pelt: Ice Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Horned Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Steel Horned Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Horned Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Steel Horned Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Horned Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Hunting Knife | 1 | Craftsmanship | Forge | 1 Ingot: Steel 1 Leather Strips 1 Fragment: Bone |  |
| Steel Hunting Knife | 1 | Craftsmanship | Forge | 1 Ingot: Steel 1 Leather Strips 1 Fragment: Bone |  |
| Steel Mace | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Mace | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Mace | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Pauldroned Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 5 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Pauldroned Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Wolf 5 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Pauldroned Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Pauldroned Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Pauldroned Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Pauldroned Cuirass - Katria's | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Pauldroned Cuirass - White | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass - White | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Pauldroned Cuirass - White | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Scimitar | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Shield | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Steel Shield | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips |  |
| Steel Shield | 1 | Craftsmanship | Forge | 4 Ingot: Steel 2 Wood 2 Leather Strips |  |
| Steel Sword | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Leather Strips |  |
| Steel Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Sword | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Leather Strips |  |
| Steel War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel War Axe | 1 | Craftsmanship | Forge | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel War Axe | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Warhammer | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Warhammer | 1 | Craftsmanship | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Warhammer | 1 | Craftsmanship | Forge | 5 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Black |  |
| Steel Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Brown |  |
| Steel Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Steel Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Steel Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Steel Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Steel Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Steel Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Steel Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Noble Black |  |
| Steel Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Noble Brown |  |
| Steel Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Noble White |  |
| Steel Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Ornate Black |  |
| Steel Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Steel Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - Ornate White |  |
| Steel Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Steel Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Steel Helmet 1 Wolfskin Hood - White |  |
| Steel Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Ingot: Steel 2 Leather Strips |  |
| Stone Hatchet | 1 | Craftsmanship | N/A | 2 Deadwood 1 Sharp Rock |  |
| Stone Hatchet | 1 | Craftsmanship | N/A | 1 Wood 1 Sharp Rock |  |
| Stormcloak General Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Stormcloak General Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Stormcloak Heavy Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Stormcloak Heavy Crossbow | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Stormcloak Heavy Crossbow | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Stormcloak Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Heavy Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Iron 1 Leather Strips 1 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Heavy Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Stormcloak Light Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Light Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Stormcloak Light Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Officer Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Boots | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Stormcloak Officer Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Bracers | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Stormcloak Officer Bracers | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Bracers | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 4 Leather Strips 4 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Stormcloak Officer Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 4 Leather Strips 4 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Helmet | 1 | Craftsmanship | N/A | 1 Leather |  |
| Stormcloak Officer Helmet | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Helmet | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Sleeved Heavy Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 5 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Sleeved Heavy Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Leather Strips 5 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Sleeved Heavy Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Stormfang | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Studded Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Elk 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather 2 Fur Plate |  |
| Studded Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Iron |  |
| Studded Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | 1 | Craftsmanship | Forge | 1 Pelt: Elk 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | 1 | Craftsmanship | Forge | 2 Ingot: Iron 4 Leather Strips 4 Leather 2 Fur Plate |  |
| Studded Furred Cuirass | 1 | Craftsmanship | Forge | 4 Leather 4 Hide Lace 2 Fur Plate |  |
| Studded Furred Cuirass | 1 | Craftsmanship | Forge | 4 Leather 4 Hide Lace 2 Fur Plate |  |
| Summerset Shadows Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Summerset Shadows Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Summerset Shadows Gloves | 1 | Craftsmanship | N/A | 1 Leather |  |
| Summerset Shadows Hood | 1 | Craftsmanship | N/A | 1 Leather |  |
| Tanning Rack | 1 | Craftsmanship | N/A | 3 Wood 2 Hide Lace |  |
| Tanning Rack | 1 | Craftsmanship | N/A | 3 Wood 1 Leather Strips |  |
| Targe of the Blooded | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| The Pale Blade | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| The Woodsman's Friend | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Thieves Guild Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Boots | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Boots - Grey | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Cowl | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Cowl | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cowl - Grey | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cowl - Grey | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Cuirass - Grey | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Gloves | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Gloves | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Gloves - Grey | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Hood | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Hood | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Hood - Grey | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Master's Boots | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Gloves | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Hood | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Thieves Guild Sleeveless Cuirass | 1 | Craftsmanship | N/A | 1 Leather |  |
| Thieves Guild Sleeveless Cuirass - Grey | 1 | Craftsmanship | N/A | 1 Leather |  |
| Toolkit: Alchemist's | 1 | Craftsmanship | N/A | 2 Wood |  |
| Toolkit: Alchemist's | 1 | Craftsmanship | Forge | 2 Wood |  |
| Toolkit: Brewer's | 1 | Craftsmanship | N/A | 2 Wood |  |
| Toolkit: Brewer's | 1 | Craftsmanship | Forge | 2 Wood |  |
| Toolkit: Builder's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Builder's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Chef's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Chef's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Jeweler's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Jeweler's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Smith's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Smith's | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Survivalist's | 1 | Craftsmanship | N/A | 2 Wood |  |
| Toolkit: Survivalist's | 1 | Craftsmanship | Forge | 2 Wood |  |
| Toolkit: Tailor's | 1 | Craftsmanship | Forge | 2 Wood |  |
| Toolkit: Tailor's | 1 | Craftsmanship | N/A | 2 Wood |  |
| Toolkit: Thieves' | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Toolkit: Thieves' | 1 | Craftsmanship | Forge | 1 Ingot: Steel 2 Wood |  |
| Trollsbane | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Valdr's Lucky Dagger | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Vampire Boots | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Vampire Cuirass - Dark | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Vampire Cuirass - Grey | 1 | Craftsmanship | N/A | 1 Leather |  |
| Vampire Cuirass - Red | 1 | Craftsmanship | N/A | 1 Leather: Red |  |
| Vampire Gauntlets | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Vampire Hood | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Vampire Royal Cuirass | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Vampire Royal Cuirass - Red | 1 | Craftsmanship | N/A | 1 Leather: Dark |  |
| Waterskin (Empty) | 1 | Craftsmanship | N/A | 1 Leather Strips 1 Leather |  |
| Windshear | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Steel |  |
| Wolf Boots | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Boots | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Wolf Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Boots | 1 | Craftsmanship | Forge | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Boots | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather 6 Fur Plate | Companions - Proving Honor Complete |
| Wolf Cuirass | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Wolf Cuirass | 1 | Craftsmanship | Forge | 2 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | 1 | Craftsmanship | Forge | 2 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | 1 | Craftsmanship | Forge | 5 Ingot: Steel 4 Leather Strips 2 Leather 6 Fur Plate | Companions - Proving Honor Complete |
| Wolf Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Gauntlets | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Wolf Gauntlets | 1 | Craftsmanship | Forge | 1 Pelt: Cave Bear 2 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Gauntlets | 1 | Craftsmanship | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Helmet | 1 | Craftsmanship | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Helmet | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Wolf Shield | 1 | Craftsmanship | N/A | 1 Ingot: Steel |  |
| Wolf Shield | 1 | Craftsmanship | Forge | 5 Ingot: Steel 2 Leather Strips | Companions - Proving Honor Complete |
| Wolf Shield | 1 | Craftsmanship | Forge | 5 Ingot: Steel 2 Leather Strips | Companions - Proving Honor Complete |
| Wolfskin Cloak - Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal |  |
| Wolfskin Cloak - Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips |  |
| Wolfskin Cloak - Dark Trimmed Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips |  |
| Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal |  |
| Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips |  |
| Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips |  |
| Wooden Barrel | 1 | Craftsmanship | N/A | 5 Wood |  |
| Wooden Battlestaff | 1 | Craftsmanship | Sharpening Wheel | 1 Wood |  |
| Wooden Battlestaff | 1 | Craftsmanship | N/A | 5 Wood |  |
| Wooden Chest | 1 | Craftsmanship | N/A | 5 Wood |  |
| Wooden Common Bed | 1 | Craftsmanship | N/A | 5 Wood 2 Fur Plate |  |
| Wooden Common Chair | 1 | Craftsmanship | N/A | 5 Wood |  |
| Wooden Common Table | 1 | Craftsmanship | N/A | 5 Wood |  |
| Wooden Fishing Rod | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood | Fishing - Unlocked Dwarven Rod |
| Wooden Fishing Rod | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood | Fishing - Unlocked Dwarven Rod |
| Wooden Flute | 1 | Craftsmanship | N/A | 1 Salt 1 Wood 1 Bottled Milk |  |
| Wooden Heavy Bow | 1 | Craftsmanship | N/A | 4 Hide Lace 2 Deadwood |  |
| Wooden Heavy Bow | 1 | Craftsmanship | N/A | 3 Wood 2 Hide Lace |  |
| Wooden Heavy Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Wood 2 Hide Lace |  |
| Wooden Light Bow | 1 | Craftsmanship | N/A | 2 Wood 2 Hide Lace |  |
| Wooden Light Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Wood 2 Hide Lace |  |
| Wooden Light Bow | 1 | Craftsmanship | Sharpening Wheel | 1 Hide Lace |  |
| Wooden Light Crossbow | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Wood 2 Hide Lace |  |
| Wooden Light Crossbow | 1 | Craftsmanship | Sharpening Wheel | 1 Wood 1 Hide Lace |  |
| Wooden Light Crossbow | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Wood 2 Hide Lace |  |
| Wooden Sword | 1 | Craftsmanship | N/A | 2 Wood |  |
| Wooden Sword | 1 | Craftsmanship | Sharpening Wheel | 1 Wood |  |
| Wooden Walking Stick | 1 | Craftsmanship | N/A | 2 Leather Strips |  |
| Thieves Guild Boots | 1 | Craftsmanship,Advanced Light Smithing | N/A | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Boots - Grey | 1 | Craftsmanship,Advanced Light Smithing | N/A | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cuirass | 1 | Craftsmanship,Advanced Light Smithing | N/A | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cuirass - Grey | 1 | Craftsmanship,Advanced Light Smithing | N/A | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Gloves | 1 | Craftsmanship,Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Gloves - Grey | 1 | Craftsmanship,Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Hood | 1 | Craftsmanship,Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Hood - Grey | 1 | Craftsmanship,Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Cuirass | 1 | Craftsmanship,Advanced Light Smithing | N/A | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Cuirass - Grey | 1 | Craftsmanship,Advanced Light Smithing | N/A | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Blood-Conserving Phial | 2 | Craftsmanship,Alchemical Lore 1 | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Strong Acid | Player Must be a vampire |
| Blood-Conserving Phial | 2 | Craftsmanship,Alchemical Lore 1 | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Mild Acid | Player Must be a vampire |
| Blood-Conserving Phial | 2 | Craftsmanship,Alchemical Lore 1 | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Mild Acid | Player Must be a vampire |
| Blood-Conserving Phial | 2 | Craftsmanship,Alchemical Lore 1 | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Strong Acid | Player Must be a vampire |
| Dye - Black | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Nightshade |  |
| Dye - Black | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Nightshade |  |
| Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Salt |  |
| Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Salt |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Indigo 1 Dye - Bleach |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Blue Mountain Flower |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Blue Mountain Flower |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Indigo 1 Dye - Bleach |  |
| Dye - Brown | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Canis Root |  |
| Dye - Brown | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Black 1 Dye - Tan |  |
| Dye - Brown | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Canis Root |  |
| Dye - Brown | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Tan |  |
| Dye - Green | 1 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Hanging Moss |  |
| Dye - Green | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Hanging Moss |  |
| Dye - Green | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Blue 1 Dye - Yellow |  |
| Dye - Green | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Blue 1 Dye - Yellow |  |
| Dye - Grey | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Black 1 Dye - Bleach |  |
| Dye - Grey | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Giant Lichen |  |
| Dye - Grey | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Bleach |  |
| Dye - Grey | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Giant Lichen |  |
| Dye - Indigo | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Black 1 Dye - Blue |  |
| Dye - Indigo | 4 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Deathbell |  |
| Dye - Indigo | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Blue |  |
| Dye - Indigo | 4 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Deathbell |  |
| Dye - Orange | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Red 1 Dye - Yellow |  |
| Dye - Orange | 1 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Creep Cluster |  |
| Dye - Orange | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Red 1 Dye - Yellow |  |
| Dye - Orange | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Creep Cluster |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Purple Mountain Flower |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Blue 1 Dye - Red |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Purple Mountain Flower |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Blue 1 Dye - Red |  |
| Dye - Red | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Red Mountain Flower |  |
| Dye - Red | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Red Mountain Flower |  |
| Dye - Tan | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Grass Pod |  |
| Dye - Tan | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Brown 1 Dye - Bleach |  |
| Dye - Tan | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Brown 1 Dye - Bleach |  |
| Dye - Tan | 1 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Grass Pod |  |
| Dye - Yellow | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dragon's Tongue |  |
| Dye - Yellow | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dragon's Tongue |  |
| Healing Poultice | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 5 Medicinal Salve 1 Bandage |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Blisterwort |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Imp Stool |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Blue Mountain Flower |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Panacea |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Blue Dartwing |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Cured Skeever Hide |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Wheat |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Charred Skeever Hide |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Sabre Cat Eye |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Monarch Wing |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Rock Warbler Egg |  |
| Medicinal Salve | 30 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Daedra Heart |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Northern Flax |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | N/A | 1 Swamp Fungal Pod |  |
| Arrow: Iron Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 15 Arrow: Iron 1 Fire Salts |  |
| Arrow: Iron Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 15 Arrow: Iron 1 Fire Salts |  |
| Bolt: Dawnguard Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Frost | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Frost | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Dawnguard |  |
| Bolt: Dawnguard Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Dawnguard |  |
| Bolt: Imperial Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Frost | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Frost | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Imperial |  |
| Bolt: Imperial Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Imperial |  |
| Bolt: Iron Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Iron |  |
| Bolt: Iron Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Iron |  |
| Bolt: Iron Ice | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Iron |  |
| Bolt: Iron Ice | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Iron |  |
| Bolt: Iron Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Iron |  |
| Bolt: Iron Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Iron |  |
| Bolt: Stormcloak Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Fire | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Frost | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Frost | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Stormcloak |  |
| Bolt: Stormcloak Shock | 15 | Craftsmanship,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Stormcloak |  |
| Chitin Heavy Boots | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Heavy Cuirass | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Heavy Gauntlets | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Heavy Helmet | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Light Boots | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 2 Leather Strips 2 Netch Leather 2 Chitin Plate |  |
| Chitin Light Boots | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Light Boots | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 2 Leather Strips 2 Netch Leather 2 Chitin Plate |  |
| Chitin Light Bracers | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Light Bracers | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 2 Leather Strips 1 Netch Leather 2 Chitin Plate |  |
| Chitin Light Bracers | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 2 Leather Strips 1 Netch Leather 2 Chitin Plate |  |
| Chitin Light Cuirass | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Light Cuirass | 1 | Morrowind Smithing 2 | Forge | 2 Ingot: Steel 4 Leather Strips 3 Netch Leather 4 Chitin Plate |  |
| Chitin Light Cuirass | 1 | Morrowind Smithing 2 | Forge | 2 Ingot: Steel 4 Leather Strips 3 Netch Leather 4 Chitin Plate |  |
| Chitin Light Helmet | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Light Helmet | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 1 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Light Helmet | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 1 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Light Shield | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 1 Netch Leather 4 Chitin Plate |  |
| Chitin Light Shield | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Light Shield | 1 | Morrowind Smithing 2 | Forge | 1 Ingot: Steel 1 Netch Leather 4 Chitin Plate |  |
| Chitin Morag Tong Boots | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Morag Tong Bracers | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Morag Tong Cuirass | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Morag Tong Elite Boots | 1 | Morrowind Smithing 2 | N/A | 1 Leather |  |
| Chitin Morag Tong Elite Bracers | 1 | Morrowind Smithing 2 | N/A | 1 Leather |  |
| Chitin Morag Tong Elite Cuirass | 1 | Morrowind Smithing 2 | N/A | 1 Leather |  |
| Chitin Morag Tong Elite Hood | 1 | Morrowind Smithing 2 | N/A | 1 Leather |  |
| Chitin Morag Tong Hood | 1 | Morrowind Smithing 2 | N/A | 1 Chitin Plate |  |
| Chitin Heavy Boots | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Boots | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Cuirass | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 2 Ingot: Corundum 4 Leather Strips 2 Netch Leather 6 Chitin Plate |  |
| Chitin Heavy Cuirass | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 2 Ingot: Corundum 4 Leather Strips 2 Netch Leather 6 Chitin Plate |  |
| Chitin Heavy Gauntlets | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Heavy Gauntlets | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Heavy Helmet | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Helmet | 1 | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Ahzidal's Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Ahzidal's Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Ahzidal's Gauntlets | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Ahzidal's Helmet | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Akaviri Katana | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Akaviri Katana | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Alik'ri Fishing Rod | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Wood | Fishing - Unlocked Alikri Rod |
| Alik'ri Fishing Rod | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Wood | Fishing - Unlocked Alikri Rod |
| Amethyst | 1 | Advanced Blacksmithing | N/A | 1 Gem: Amethyst (Rough) |  |
| Amulet of Akatosh Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Akatosh Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Arkay Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Gem: Ruby (Rough) |  |
| Amulet of Arkay Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Gem: Ruby (Rough) |  |
| Amulet of Dibella Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Pearl |  |
| Amulet of Dibella Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Pearl |  |
| Amulet of Julianos Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Ingot: Quicksilver |  |
| Amulet of Julianos Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Ingot: Quicksilver |  |
| Amulet of Mara Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Calcinium |  |
| Amulet of Mara Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Calcinium |  |
| Amulet of Stendarr Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Stendarr Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Talos Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Leather Strips 1 Ingot: Galatite |  |
| Amulet of Talos Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Leather Strips 1 Ingot: Galatite |  |
| Amulet of the Elder Council Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Ingot: Quicksilver 1 Gem: Onyx |  |
| Amulet of the Elder Council Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Ingot: Quicksilver 1 Gem: Onyx |  |
| Amulet of the Kynareth Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Small Pearl |  |
| Amulet of the Kynareth Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Small Pearl |  |
| Ancient Nordic Hero Battleaxe | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Battleaxe | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Ancient Nordic Honed Battleaxe 3 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Battleaxe | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Ancient Nordic Honed Battleaxe 3 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ancient Nordic Boots 3 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Boots 3 Ingot: Steel 2 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Boots 3 Ingot: Steel 2 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ancient Nordic Boots 3 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Cuirass | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Cuirass 1 Pelt: Cave Bear 4 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Cuirass 4 Ingot: Steel 3 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Cuirass 1 Pelt: Cave Bear 4 Ingot: Steel | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Cuirass 4 Ingot: Steel 3 Fur Plate | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Dagger | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Dagger | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Ancient Nordic Honed Dagger | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Dagger | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Ancient Nordic Honed Dagger | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Gauntlets | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Gauntlets 2 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Gauntlets | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Gauntlets 2 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Gauntlets | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Greatsword | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Greatsword 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Greatsword | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Greatsword | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Greatsword 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Bow | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum 2 Hide Lace |  |
| Ancient Nordic Hero Heavy Bow | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Ancient Nordic Honed Heavy Bow 2 Hide Lace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Bow | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Ancient Nordic Honed Heavy Bow 2 Hide Lace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Heavy Crossbow | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Heavy Crossbow | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Leather 4 Hide Lace |  |
| Ancient Nordic Hero Heavy Crossbow | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 2 Ingot: Corundum 1 Leather 4 Hide Lace |  |
| Ancient Nordic Hero Helm | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Helm | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Helm | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Mace | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Mace | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Ancient Nordic Honed Mace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Mace | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Ancient Nordic Honed Mace | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Sword | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero Sword | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Sword 1 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Sword | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Sword 1 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero War Axe | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Hero War Axe | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed War Axe 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero War Axe | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed War Axe 2 Leather Strips | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Warhammer | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 3 Leather Strips 1 Ancient Nordic Honed Warhammer | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Warhammer | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 3 Leather Strips 1 Ancient Nordic Honed Warhammer | Currently Uncraftable - Global Disabled |
| Ancient Nordic Hero Warhammer | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Ancient Nordic Pickaxe | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Iron |  |
| Aquamarine | 1 | Advanced Blacksmithing | N/A | 1 Gem: Aquamarine (Rough) |  |
| Argonian Fishing Rod | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Wood | Fishing - Unlocked Argonian Rod |
| Argonian Fishing Rod | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Wood | Fishing - Unlocked Argonian Rod |
| Arrow: Ancient Nordic Hero | 15 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Wood | Currently Uncraftable - Global Disabled |
| Arrow: Ancient Nordic Hero | 15 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Corundum 1 Wood | Currently Uncraftable - Global Disabled |
| Arrow: Skyforge Steel | 15 | Advanced Blacksmithing | Forge | 1 Wood 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Arrow: Skyforge Steel | 15 | Advanced Blacksmithing | Forge | 1 Wood 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Auriel's Bow Replica | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Auriel's Bow Replica | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Blade of Sacrifice Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Blade of Woe Awakened | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Steel |  |
| Blade of Woe Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Blades Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather | Main Quest - Alduins Wall Complete |
| Blades Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather | Main Quest - Alduins Wall Complete |
| Blades Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Helmet | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Helmet | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Shield | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Blades Shield | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Bloodskal Blade Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Silver 2 Leather Strips 3 Ingot: Galatite | Dragonborn - The Final Decent Complete |
| Bloodskal Blade Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Silver 2 Leather Strips 3 Ingot: Galatite | Dragonborn - The Final Decent Complete |
| Bolt: Ancient Nordic Hero | 15 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Wood |  |
| Bolt: Ancient Nordic Hero | 15 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Wood |  |
| Bolt: Thieves Guild | 15 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Wood |  |
| Bolt: Thieves Guild | 15 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Wood |  |
| Bone Hawk Amulet | 1 | Advanced Blacksmithing | N/A | 2 Leather Strips 1 Bone Hawk Skull 6 Bone Hawk Feathers |  |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Forge | 3 Bone Hawk Claw 3 Fragment: Silver |  |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Forge | 3 Bone Hawk Claw 3 Fragment: Silver |  |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Forge | 3 Silver Ring 3 Bone Hawk Claw |  |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Forge | 3 Silver Ring 3 Bone Hawk Claw |  |
| Bone Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Animal Bone (Large) |  |
| Champion's Cudgel | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Steel |  |
| Chillrend Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Frost Salts |  |
| Circle Boots | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Boots | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 1 Leather 3 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Boots | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 1 Leather 3 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Circle Boots | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | 1 | Advanced Blacksmithing | Forge | 4 Leather Strips 2 Leather 5 Ingot: Galatite 6 Fur Plate | Companions - Silver Hand Complete |
| Circle Cuirass | 1 | Advanced Blacksmithing | Forge | 2 Pelt: Snow Bear 4 Leather Strips 2 Leather 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | 1 | Advanced Blacksmithing | Forge | 2 Pelt: Snow Bear 4 Leather Strips 2 Leather 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Circle Cuirass | 1 | Advanced Blacksmithing | Forge | 4 Leather Strips 2 Leather 5 Ingot: Galatite 6 Fur Plate | Companions - Silver Hand Complete |
| Circle Gauntlets | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Circle Gauntlets | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 2 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 1 Leather 2 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Gauntlets | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 2 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 1 Leather 2 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Helmet | 1 | Advanced Blacksmithing | Forge | 1 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Helmet | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Circle Helmet | 1 | Advanced Blacksmithing | Forge | 1 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Shield | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Shield | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Circle Shield | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Copper Amber Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Amber 1 Copper Circlet |  |
| Copper Amethyst Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Amethyst 1 Copper Circlet |  |
| Copper Amethyst Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Amethyst (Flawless) 1 Copper Circlet |  |
| Copper Aquamarine Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Aquamarine 1 Copper Circlet |  |
| Copper Aquamarine Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Aquamarine (Flawless) 1 Copper Circlet |  |
| Copper Circlet | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum |  |
| Copper Circlet | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum |  |
| Copper Diamond Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Diamond 1 Copper Circlet |  |
| Copper Diamond Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Diamond (Flawless) 1 Copper Circlet |  |
| Copper Emerald Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Emerald 1 Copper Circlet |  |
| Copper Emerald Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Emerald (Flawless) 1 Copper Circlet |  |
| Copper Garnet Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Garnet 1 Copper Circlet |  |
| Copper Garnet Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Garnet (Flawless) 1 Copper Circlet |  |
| Copper Onyx Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Onyx 1 Copper Circlet |  |
| Copper Opal Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Opal 1 Copper Circlet |  |
| Copper Peridot Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Peridot 1 Copper Circlet |  |
| Copper Peridot Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Peridot (Flawless) 1 Copper Circlet |  |
| Copper Ruby Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Ruby 1 Copper Circlet |  |
| Copper Ruby Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Ruby (Flawless) 1 Copper Circlet |  |
| Copper Sapphire Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Sapphire 1 Copper Circlet |  |
| Copper Sapphire Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Sapphire (Flawless) 1 Copper Circlet |  |
| Daedric Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Dawnbreaker Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 3 Ingot: Calcinium | Daedra -  The Break of Dawn |
| Dawnbreaker Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Dawnbreaker Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 3 Ingot: Calcinium | Daedra -  The Break of Dawn |
| Diamond | 1 | Advanced Blacksmithing | N/A | 1 Gem: Diamond (Rough) |  |
| Dragonbone Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dwarven Fishing Rod | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Rod |
| Dwarven Fishing Rod | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Rod |
| Dwarven Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Ebony Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mail Replica | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Eduj | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Elven Light Boots - Thalmor | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Emerald | 1 | Advanced Blacksmithing | N/A | 1 Gem: Emerald (Rough) |  |
| Falmer Heavy Boots | 1 | Advanced Blacksmithing | N/A | 1 Chaurus Chitin |  |
| Falmer Heavy Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Chaurus Chitin |  |
| Falmer Heavy Gauntlets | 1 | Advanced Blacksmithing | N/A | 1 Chaurus Chitin |  |
| Falmer Heavy Helmet | 1 | Advanced Blacksmithing | N/A | 1 Chaurus Chitin |  |
| Falmer Honed Light Bow | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Chaurus Chitin |  |
| Forsworn War Axe | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Quarried Stone |  |
| Fragment: Gold | 20 | Advanced Blacksmithing | N/A | 1 Ingot: Gold |  |
| Fragment: Quicksilver | 20 | Advanced Blacksmithing | N/A | 1 Ingot: Quicksilver |  |
| Fragment: Silver | 20 | Advanced Blacksmithing | N/A | 1 Ingot: Silver |  |
| Garnet | 1 | Advanced Blacksmithing | N/A | 1 Gem: Garnet (Rough) |  |
| Gem: Amber | 1 | Advanced Blacksmithing | N/A | 1 Gem: Amber (Rough) |  |
| Gem: Onyx | 1 | Advanced Blacksmithing | N/A | 1 Gem: Onyx (Rough) |  |
| Gem: Opal | 1 | Advanced Blacksmithing | N/A | 1 Gem: Opal (Rough) |  |
| Glass Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Gold Amber Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Amber 1 Gold Circlet |  |
| Gold Amber Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gold Necklace 1 Gem: Amber |  |
| Gold Amber Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Amber |  |
| Gold Amethyst Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Amethyst 1 Gold Circlet |  |
| Gold Amethyst Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Amethyst (Flawless) 1 Gold Circlet |  |
| Gold Amethyst Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gem: Amethyst 1 Gold Necklace |  |
| Gold Amethyst Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gem: Amethyst (Flawless) 1 Gold Necklace |  |
| Gold Amethyst Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Amethyst |  |
| Gold Amethyst Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Amethyst (Flawless) |  |
| Gold Aquamarine Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Aquamarine 1 Gold Circlet |  |
| Gold Aquamarine Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Aquamarine (Flawless) 1 Gold Circlet |  |
| Gold Aquamarine Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gold Necklace 1 Gem: Aquamarine |  |
| Gold Aquamarine Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Necklace 1 Gem: Aquamarine (Flawless) |  |
| Gold Aquamarine Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Aquamarine |  |
| Gold Aquamarine Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Aquamarine (Flawless) |  |
| Gold Circlet | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |
| Gold Circlet | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |
| Gold Diamond Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Diamond 1 Gold Circlet |  |
| Gold Diamond Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Diamond (Flawless) 1 Gold Circlet |  |
| Gold Diamond Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gem: Diamond 1 Gold Necklace |  |
| Gold Diamond Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gem: Diamond (Flawless) 1 Gold Necklace |  |
| Gold Diamond Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Diamond |  |
| Gold Diamond Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Diamond (Flawless) |  |
| Gold Emerald Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Emerald 1 Gold Circlet |  |
| Gold Emerald Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Emerald (Flawless) 1 Gold Circlet |  |
| Gold Emerald Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gem: Emerald 1 Gold Necklace |  |
| Gold Emerald Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gem: Emerald (Flawless) 1 Gold Necklace |  |
| Gold Emerald Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Emerald |  |
| Gold Emerald Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Emerald (Flawless) |  |
| Gold Garnet Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Garnet 1 Gold Circlet |  |
| Gold Garnet Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Garnet (Flawless) 1 Gold Circlet |  |
| Gold Garnet Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gem: Garnet 1 Gold Necklace |  |
| Gold Garnet Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gem: Garnet (Flawless) 1 Gold Necklace |  |
| Gold Garnet Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Garnet |  |
| Gold Garnet Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Garnet (Flawless) |  |
| Gold Necklace | 1 | Advanced Blacksmithing | Forge | 4 Fragment: Gold |  |
| Gold Necklace | 1 | Advanced Blacksmithing | Forge | 4 Fragment: Gold |  |
| Gold Necklace (5) | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |
| Gold Necklace (5) | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |
| Gold Onyx Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Onyx 1 Gold Circlet |  |
| Gold Onyx Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gold Necklace 1 Gem: Onyx |  |
| Gold Onyx Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Onyx |  |
| Gold Opal Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Opal 1 Gold Circlet |  |
| Gold Opal Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gold Necklace 1 Gem: Opal |  |
| Gold Opal Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Opal |  |
| Gold Peridot Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Peridot 1 Gold Circlet |  |
| Gold Peridot Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Peridot (Flawless) 1 Gold Circlet |  |
| Gold Peridot Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gold Necklace 1 Gem: Peridot |  |
| Gold Peridot Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Necklace 1 Gem: Peridot (Flawless) |  |
| Gold Peridot Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Peridot |  |
| Gold Peridot Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Peridot (Flawless) |  |
| Gold Ring | 1 | Advanced Blacksmithing | Forge | 2 Fragment: Gold |  |
| Gold Ring | 1 | Advanced Blacksmithing | Forge | 2 Fragment: Gold |  |
| Gold Ring (10) | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |
| Gold Ring (10) | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |
| Gold Ruby Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Ruby 1 Gold Circlet |  |
| Gold Ruby Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Ruby (Flawless) 1 Gold Circlet |  |
| Gold Ruby Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gem: Ruby 1 Gold Necklace |  |
| Gold Ruby Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gem: Ruby (Flawless) 1 Gold Necklace |  |
| Gold Ruby Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Ruby |  |
| Gold Ruby Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Ruby (Flawless) |  |
| Gold Sapphire Circlet | 1 | Advanced Blacksmithing | N/A | 3 Gem: Sapphire 1 Gold Circlet |  |
| Gold Sapphire Circlet (Flawless) | 1 | Advanced Blacksmithing | N/A | 3 Gem: Sapphire (Flawless) 1 Gold Circlet |  |
| Gold Sapphire Necklace | 1 | Advanced Blacksmithing | N/A | 1 Gem: Sapphire 1 Gold Necklace |  |
| Gold Sapphire Necklace (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gem: Sapphire (Flawless) 1 Gold Necklace |  |
| Gold Sapphire Ring | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Sapphire |  |
| Gold Sapphire Ring (Flawless) | 1 | Advanced Blacksmithing | N/A | 1 Gold Ring 1 Gem: Sapphire (Flawless) |  |
| Helm of Yngol Replica | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Honorblade of Whiterun | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Steel |  |
| Horse Armor: Black Hand Barding and Saddle | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Black Hand Barding and Saddle | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Black Hand Barding and Saddle | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic War Axe 1 Wooden Lute 1 Horse Armor: Black Hand Barding and Saddle |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | 1 | Advanced Blacksmithing | Forge | 1 Ancient Nordic War Axe 1 Wooden Lute 1 Horse Armor: Black Hand Barding and Saddle |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Horse Armor: Nordic Barding and Saddle | 1 | Advanced Blacksmithing | Forge | 8 Ingot: Steel 2 Ingot: Corundum 10 Leather Strips 6 Leather |  |
| Horse Armor: Nordic Barding and Saddle | 1 | Advanced Blacksmithing | Forge | 8 Ingot: Steel 2 Ingot: Corundum 10 Leather Strips 6 Leather |  |
| Imperial General Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Gold |  |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Gold |  |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Gold |  |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Gold |  |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Gold |  |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Gold |  |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Gold |  |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Gold |  |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Gold |  |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Gold |  |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Gold |  |
| Ingot: Gold | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Gold |  |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Gold |  |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Gold |  |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Gold |  |
| Ingot: Gold | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Gold |  |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Gold |  |
| Ingot: Gold | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Gold |  |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Quicksilver |  |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Quicksilver |  |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Quicksilver |  |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Quicksilver |  |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Quicksilver |  |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Quicksilver |  |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Quicksilver |  |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Quicksilver |  |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Quicksilver |  |
| Ingot: Quicksilver | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Quicksilver |  |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Quicksilver |  |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Quicksilver |  |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Quicksilver |  |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Quicksilver |  |
| Ingot: Quicksilver | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Quicksilver |  |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Quicksilver |  |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Quicksilver |  |
| Ingot: Quicksilver | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Quicksilver |  |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Silver |  |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Silver |  |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Silver |  |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Silver |  |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 25 Ore: Silver |  |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Silver |  |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 20 Fragment: Silver |  |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 200 Fragment: Silver |  |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Silver |  |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 100 Fragment: Silver |  |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 5 Ore: Silver |  |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Silver |  |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 30 Ore: Silver |  |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Silver |  |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Silver |  |
| Ingot: Silver | 5 | Advanced Blacksmithing | Smelter | 15 Ore: Silver |  |
| Ingot: Silver | 1 | Advanced Blacksmithing | Smelter | 3 Ore: Silver |  |
| Ingot: Silver | 10 | Advanced Blacksmithing | Smelter | 50 Ore: Silver |  |
| Iron Banded Masterwork Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Iron Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Iron |  |
| Iron Masterwork Boots | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Masterwork Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Masterwork Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Boots | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Cuirass | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Masterwork Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Cuirass | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Masterwork Gauntlets | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Gauntlets | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | 1 | Advanced Blacksmithing | Forge | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Masterwork Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Masterwork Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Helmet | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Masterwork Helmet | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Helmet | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Masterwork Shield | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Masterwork Shield | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Iron Masterwork Shield | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Jagged Crown Replica | 1 | Advanced Blacksmithing | N/A | 1 Dragon Bone |  |
| Jarl of Eastmarch Armguards | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Jarl of Eastmarch Armor | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Kahvozein's Fang | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Steel |  |
| Leather Executioner's Boots | 1 | Advanced Blacksmithing | N/A | 1 Leather: Dark |  |
| Leather Executioner's Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Leather: Dark |  |
| Leather Executioner's Gloves | 1 | Advanced Blacksmithing | N/A | 1 Leather: Dark |  |
| Leather Executioner's Hood | 1 | Advanced Blacksmithing | N/A | 1 Leather: Dark |  |
| Leather Hood - Black | 1 | Advanced Blacksmithing | N/A | 1 Leather: Dark |  |
| Mace of Molag Bal Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Mehrunes' Razor Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Mournbringer | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Silver |  |
| Nightingale Armor | 1 | Advanced Blacksmithing | N/A | 1 Void Salts |  |
| Nightingale Boots | 1 | Advanced Blacksmithing | N/A | 1 Void Salts |  |
| Nightingale Gloves | 1 | Advanced Blacksmithing | N/A | 1 Void Salts |  |
| Nightingale Hood | 1 | Advanced Blacksmithing | N/A | 1 Void Salts |  |
| Noble Gilded Wristguards | 1 | Advanced Blacksmithing | N/A | 2 Gold Ring 3 Leather Strips 2 Leather |  |
| Nordic Boots - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Cuirass - Black | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Black | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Gauntlets - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Shield - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Black | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Okin | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Orcish Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Peridot | 1 | Advanced Blacksmithing | N/A | 1 Gem: Peridot (Rough) |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Forge | 2 Gem: Garnet (Flawless) |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Forge | 1 Gem: Ruby |  |
| Red Glitterdust | 5 | Advanced Blacksmithing | Forge | 1 Gem: Ruby (Flawless) |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Forge | 3 Gem: Garnet |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Forge | 2 Gem: Garnet (Flawless) |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Forge | 3 Gem: Garnet |  |
| Red Glitterdust | 5 | Advanced Blacksmithing | Forge | 1 Gem: Ruby (Flawless) |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Forge | 1 Gem: Ruby |  |
| Rocksplinter | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Iron |  |
| Ruby | 1 | Advanced Blacksmithing | N/A | 1 Gem: Ruby (Rough) |  |
| Rueful Axe Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Silver 4 Ingot: Steel 3 Leather Strips | Daedra - A Daedras Best Friend |
| Rueful Axe Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Silver 4 Ingot: Steel 3 Leather Strips | Daedra - A Daedras Best Friend |
| Rueful Axe Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Steel |  |
| Sapphire | 1 | Advanced Blacksmithing | N/A | 1 Gem: Sapphire (Rough) |  |
| Sapphire Glitterdust | 3 | Advanced Blacksmithing | Forge | 1 Gem: Sapphire |  |
| Sapphire Glitterdust | 5 | Advanced Blacksmithing | Forge | 1 Gem: Sapphire (Flawless) |  |
| Sapphire Glitterdust | 3 | Advanced Blacksmithing | Forge | 1 Gem: Sapphire |  |
| Sapphire Glitterdust | 5 | Advanced Blacksmithing | Forge | 1 Gem: Sapphire (Flawless) |  |
| Savior's Hide Replica | 1 | Advanced Blacksmithing | N/A | 1 Pelt: Bear 1 Ingot: Steel |  |
| Savior's Hide Replica | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel 1 Fur Plate |  |
| Shardsword | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Steel |  |
| Shield of Ysgramor Replica | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Skaal Amulet | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Stalhrim | Dragonborn - The Fate of the Skaal  Complete |
| Skaal Amulet | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Stalhrim | Dragonborn - The Fate of the Skaal  Complete |
| Skyforge Steel Aegis | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Skyforge Steel Aegis | 1 | Advanced Blacksmithing | Forge | 2 Wood 2 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Aegis | 1 | Advanced Blacksmithing | Forge | 2 Wood 2 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Battleaxe | 1 | Advanced Blacksmithing | Forge | 3 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Battleaxe | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Battleaxe | 1 | Advanced Blacksmithing | Forge | 3 Leather Strips 4 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Dagger | 1 | Advanced Blacksmithing | Forge | 1 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Dagger | 1 | Advanced Blacksmithing | Forge | 1 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Greatsword | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Greatsword | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Greatsword | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Heavy Bow | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Heavy Bow | 1 | Advanced Blacksmithing | Forge | 3 Wood 3 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Heavy Bow | 1 | Advanced Blacksmithing | Forge | 3 Wood 3 Leather Strips 1 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Mace | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Mace | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Mace | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 3 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Sword | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel Sword | 1 | Advanced Blacksmithing | Forge | 1 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Sword | 1 | Advanced Blacksmithing | Forge | 1 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel War Axe | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Skyforge Steel War Axe | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel War Axe | 1 | Advanced Blacksmithing | Forge | 2 Leather Strips 2 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Warhammer | 1 | Advanced Blacksmithing | Forge | 3 Leather Strips 5 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Warhammer | 1 | Advanced Blacksmithing | Forge | 3 Leather Strips 5 Ingot: Galatite | Currently Uncraftable - Global Disabled |
| Skyforge Steel Warhammer | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Spellbreaker Replica | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Steel Crossbow of Banishing | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Silver 2 Leather Strips |  |
| Steel Furred Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Furred Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Furred Plate Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Furred Plate Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Steel |  |
| Steel Plate Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Steel Plate Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Boots | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Steel Plate Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Steel Plate Cuirass | 1 | Advanced Blacksmithing | Forge | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Steel Plate Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Gauntlets | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Steel Plate Gauntlets | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Helmet | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather |  |
| Steel Plate Helmet | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Steel Plate Helmet | 1 | Advanced Blacksmithing | Forge | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather |  |
| Steel Plate Shield | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Steel Plate Shield | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips |  |
| Steel Plate Shield | 1 | Advanced Blacksmithing | Forge | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips |  |
| Steel Scimitar | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips |  |
| Steel Scimitar | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips |  |
| Stone Hunting Knife | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Sharp Rock |  |
| Stormcloak General Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Steel |  |
| Thieves Guild Light Crossbow | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 2 Ingot: Corundum 2 Wood 1 Leather: Dark 4 Hide Lace |  |
| Thieves Guild Light Crossbow | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Corundum |  |
| Thieves Guild Light Crossbow | 1 | Advanced Blacksmithing | Forge | 2 Ingot: Steel 2 Ingot: Corundum 2 Wood 1 Leather: Dark 4 Hide Lace |  |
| Ulfric's Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Ulfric's Bracers | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Ulfric's Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Vigilant's Boots | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Vigilant's Cuirass | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Vigilant's Gauntlets | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Vigilant's Helmet | 1 | Advanced Blacksmithing | N/A | 1 Ingot: Corundum |  |
| Volendrung Replica | 1 | Advanced Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Aetherium Boots | 1 | Legendary Blacksmithing | N/A | 1 Ingot: Gold |  |
| Aetherium Cuirass | 1 | Legendary Blacksmithing | N/A | 1 Ingot: Gold |  |
| Aetherium Gauntlets | 1 | Legendary Blacksmithing | N/A | 1 Ingot: Gold |  |
| Aetherium Helmet | 1 | Legendary Blacksmithing | N/A | 1 Ingot: Gold |  |
| Auriel's Bow | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Moonstone 2 Hide Lace |  |
| Auriel's Shield | 1 | Legendary Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Dawnbreaker | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Silver |  |
| Ebony Blade | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mail | 1 | Legendary Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Keening | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Mace of Molag Bal | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Mehrunes' Razor | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Miraak's Sword | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Daedra Heart 1 Ingot: Ebony |  |
| Miraak's Sword Replica | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Rueful Axe | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Savior's Hide | 1 | Legendary Blacksmithing | N/A | 1 Pelt: Werewolf |  |
| Savior's Hide - Black | 1 | Legendary Blacksmithing | N/A | 1 Pelt: Cave Bear |  |
| Savior's Hide - White | 1 | Legendary Blacksmithing | N/A | 1 Pelt: Snow Bear |  |
| Spellbreaker | 1 | Legendary Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Volendrung | 1 | Legendary Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mail | 1 | Legendary Blacksmithing,Craftsmanship | N/A | 1 Ingot: Ebony |  |
| Arrow: Elven | 15 | Elven Blacksmithing | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Arrow: Elven | 15 | Elven Blacksmithing | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Auriel's Bow Replica | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Moonstone |  |
| Auriel's Shield Replica | 1 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Bolt: Elven | 15 | Elven Blacksmithing | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Bolt: Elven | 15 | Elven Blacksmithing | Forge | 1 Wood 1 Ingot: Calcinium |  |
| Elven Battleaxe | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 3 Leather Strips 3 Ingot: Calcinium |  |
| Elven Battleaxe | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Battleaxe | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 3 Leather Strips 3 Ingot: Calcinium |  |
| Elven Boots | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Boots | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Boots - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Dagger | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium |  |
| Elven Dagger | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Dagger | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium |  |
| Elven Gauntlets | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Greatsword | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Greatsword | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Greatsword | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Helmet | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Helmet | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Hunting Knife | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Elven Hunting Knife | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Elven Light Boots | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Light Boots - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Bow | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Bow | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Bow | 1 | Elven Blacksmithing | Sharpening Wheel | 2 Hide Lace 1 Ingot: Calcinium |  |
| Elven Light Crossbow | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Moonstone 1 Hide Lace |  |
| Elven Light Crossbow | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Crossbow | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Cuirass | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Cuirass | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Light Cuirass | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Gauntlets | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Light Gauntlets | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Helmet | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Mace | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Mace | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Mace | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Shield | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Shield | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Shield - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | 1 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Elven Sword | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 2 Ingot: Calcinium |  |
| Elven Sword | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 2 Ingot: Calcinium |  |
| Elven Sword | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven War Axe | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 2 Ingot: Calcinium |  |
| Elven War Axe | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven War Axe | 1 | Elven Blacksmithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 2 Ingot: Calcinium |  |
| Elven Warhammer | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Ingot: Calcinium |  |
| Elven Warhammer | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 3 Leather Strips 4 Ingot: Calcinium |  |
| Elven Warhammer | 1 | Elven Blacksmithing | Forge | 2 Ingot: Quicksilver 3 Leather Strips 4 Ingot: Calcinium |  |
| Firiniel's End | 1 | Elven Blacksmithing | Sharpening Wheel | 1 Hide Lace 1 Ingot: Calcinium |  |
| Fragment: Calcinium | 20 | Elven Blacksmithing | N/A | 1 Ingot: Calcinium |  |
| Fragment: Moonstone | 20 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Elven Barding and Saddle - Amber | 1 | Elven Blacksmithing | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Amber | 1 | Elven Blacksmithing | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Amber | 1 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Elven Barding and Saddle - Dusk | 1 | Elven Blacksmithing | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Dusk | 1 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Elven Barding and Saddle - Dusk | 1 | Elven Blacksmithing | Forge | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Ingot: Calcinium | 1 | Elven Blacksmithing | Smelter | 6 Fragment: Corundum 14 Fragment: Moonstone |  |
| Ingot: Calcinium | 5 | Elven Blacksmithing | Smelter | 100 Fragment: Calcinium |  |
| Ingot: Calcinium | 6 | Elven Blacksmithing | Smelter | 2 Ingot: Corundum 4 Ingot: Moonstone |  |
| Ingot: Calcinium | 3 | Elven Blacksmithing | Smelter | 1 Ingot: Corundum 2 Ingot: Moonstone |  |
| Ingot: Calcinium | 1 | Elven Blacksmithing | Smelter | 20 Fragment: Calcinium |  |
| Ingot: Calcinium | 6 | Elven Blacksmithing | Smelter | 2 Ingot: Corundum 4 Ingot: Moonstone |  |
| Ingot: Calcinium | 1 | Elven Blacksmithing | Smelter | 20 Fragment: Calcinium |  |
| Ingot: Calcinium | 5 | Elven Blacksmithing | Smelter | 100 Fragment: Calcinium |  |
| Ingot: Calcinium | 3 | Elven Blacksmithing | Smelter | 1 Ingot: Corundum 2 Ingot: Moonstone |  |
| Ingot: Calcinium | 10 | Elven Blacksmithing | Smelter | 200 Fragment: Calcinium |  |
| Ingot: Calcinium | 10 | Elven Blacksmithing | Smelter | 200 Fragment: Calcinium |  |
| Ingot: Calcinium | 1 | Elven Blacksmithing | Smelter | 6 Fragment: Corundum 14 Fragment: Moonstone |  |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 25 Ore: Moonstone |  |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 5 Ore: Moonstone |  |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 15 Ore: Moonstone |  |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 5 Ore: Moonstone |  |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 50 Ore: Moonstone |  |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 3 Ore: Moonstone |  |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 20 Fragment: Moonstone |  |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 25 Ore: Moonstone |  |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 20 Fragment: Moonstone |  |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 50 Ore: Moonstone |  |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 200 Fragment: Moonstone |  |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 30 Ore: Moonstone |  |
| Ingot: Moonstone | 1 | Elven Blacksmithing | Smelter | 3 Ore: Moonstone |  |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 15 Ore: Moonstone |  |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 30 Ore: Moonstone |  |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 100 Fragment: Moonstone |  |
| Ingot: Moonstone | 10 | Elven Blacksmithing | Smelter | 200 Fragment: Moonstone |  |
| Ingot: Moonstone | 5 | Elven Blacksmithing | Smelter | 100 Fragment: Moonstone |  |
| Snow Elf Boots | 1 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Snow Elf Crown | 1 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Snow Elf Cuirass | 1 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Snow Elf Gauntlets | 1 | Elven Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Cleric Barding and Saddle | 1 | Elven Blacksmithing,Ebony Blacksmithing | Forge | 2 Ingot: Ebony 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Cleric Barding and Saddle | 1 | Elven Blacksmithing,Ebony Blacksmithing | Forge | 2 Ingot: Ebony 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Arrow: Ebony | 15 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Wood |  |
| Arrow: Ebony | 15 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Wood |  |
| Blade of Sacrifice | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Blade of Sacrifice Replica | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - Boethiahs Calling |
| Blade of Sacrifice Replica | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - Boethiahs Calling |
| Blade of Woe Replica | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Dark Brotherhood - Death Incarnate Complete |
| Blade of Woe Replica | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Dark Brotherhood - Death Incarnate Complete |
| Bloodscythe | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Bolt: Dark Brotherhood | 15 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Dark Brotherhood | 15 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Ebony | 15 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Wood |  |
| Bolt: Ebony | 15 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Wood |  |
| Dark Brotherhood Heavy Crossbow | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Dark Brotherhood Heavy Crossbow | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Steel 2 Ingot: Ebony 2 Wood 1 Leather 4 Hide Lace |  |
| Dark Brotherhood Heavy Crossbow | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Steel 2 Ingot: Ebony 2 Wood 1 Leather 4 Hide Lace |  |
| Dawnguard Rune Shield Replica | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 3 Ingot: Steel 1 Ingot: Ebony 2 Leather Strips | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Shield Replica | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 3 Ingot: Steel 1 Ingot: Ebony 2 Leather Strips | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Shield Replica | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Dwarven Heavy Black Bow of Fate | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Battleaxe | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Battleaxe | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Battleaxe | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Battlestaff | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver |  |
| Ebony Battlestaff | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver |  |
| Ebony Battlestaff | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Blade Replica | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - The Whispering Door |
| Ebony Blade Replica | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - The Whispering Door |
| Ebony Blade Replica | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Boots | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Boots | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Boots | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Boots - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 3 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Boots - Silvered | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Boots - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 3 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Cuirass | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Ebony Cuirass | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Ebony Cuirass | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Cuirass - Gilded | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Cuirass - Gilded | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Gilded | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Dagger | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Dagger | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Dagger | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Gauntlets | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Gauntlets | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Gauntlets - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 2 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Silvered | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Gauntlets - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 2 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Greatsword | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Greatsword | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Greatsword | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Heavy Bow | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Hide Lace |  |
| Ebony Heavy Bow | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Heavy Bow | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Hide Lace |  |
| Ebony Heavy Crossbow | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 4 Hide Lace |  |
| Ebony Heavy Crossbow | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 2 Ingot: Quicksilver 4 Hide Lace |  |
| Ebony Heavy Crossbow | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Ebony Helmet | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Helmet | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Ebony Helmet | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Gilded | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Gold 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Gilded | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Helmet - Gilded | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Gold 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 3 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 3 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Hunting Knife | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Fragment: Bone |  |
| Ebony Hunting Knife | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Fragment: Bone |  |
| Ebony Mace | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Mace | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Mace | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Mail Replica | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica - Gilded | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Gilded | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | 1 | Ebony Blacksmithing | Forge | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Silvered | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Silver 4 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Silvered | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Mail Replica - Silvered | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Silver 4 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Shield | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Shield | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Shield | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Shield - Gilded | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips |  |
| Ebony Shield - Gilded | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Shield - Gilded | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips |  |
| Ebony Shield - Silvered | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Ebony Shield - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 4 Ingot: Ebony 2 Leather Strips |  |
| Ebony Shield - Silvered | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Silver 4 Ingot: Ebony 2 Leather Strips |  |
| Ebony Sword | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Sword | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Sword | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony War Axe | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony War Axe | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony War Axe | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Warhammer | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Ebony Warhammer | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Warhammer | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Falmer Hardened Boots | 1 | Ebony Blacksmithing | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Boots | 1 | Ebony Blacksmithing | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Boots | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Falmer Hardened Cuirass | 1 | Ebony Blacksmithing | Forge | 5 Chaurus Chitin 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Falmer Hardened Cuirass | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Falmer Hardened Cuirass | 1 | Ebony Blacksmithing | Forge | 5 Chaurus Chitin 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Falmer Hardened Gauntlets | 1 | Ebony Blacksmithing | Forge | 2 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Gauntlets | 1 | Ebony Blacksmithing | Forge | 2 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Hardened Gauntlets | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Falmer Hardened Helmet | 1 | Ebony Blacksmithing | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Falmer Hardened Helmet | 1 | Ebony Blacksmithing | Forge | 3 Chaurus Chitin 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Falmer Hardened Helmet | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Falmer Honed Light Bow | 1 | Ebony Blacksmithing | Forge | 1 Falmer Heavy Bow 2 Ingot: Ebony |  |
| Falmer Honed Light Bow | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Falmer Honed Light Bow | 1 | Ebony Blacksmithing | Forge | 1 Falmer Heavy Bow 2 Ingot: Ebony |  |
| Falmer Honed Sword | 1 | Ebony Blacksmithing | Forge | 1 Falmer Sword 1 Ingot: Ebony |  |
| Falmer Honed Sword | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Falmer Honed Sword | 1 | Ebony Blacksmithing | Forge | 1 Falmer Sword 1 Ingot: Ebony |  |
| Falmer Honed War Axe | 1 | Ebony Blacksmithing | Forge | 1 Falmer War Axe 1 Ingot: Ebony |  |
| Falmer Honed War Axe | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Falmer Honed War Axe | 1 | Ebony Blacksmithing | Forge | 1 Falmer War Axe 1 Ingot: Ebony |  |
| Fragment: Ebony | 20 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| General Tullius' Sword | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Harkon's Sword Replica | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Killed Harkon |
| Harkon's Sword Replica | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Harkon's Sword Replica | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Killed Harkon |
| Horse Armor: Cleric Barding and Saddle | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Moonstone |  |
| Horse Armor: Ebony Barding and Saddle | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Horse Armor: Ebony Barding and Saddle | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle - Mail | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Horse Armor: Ebony Barding and Saddle - Mail | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle - Mail | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 15 Ore: Ebony |  |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 200 Fragment: Ebony |  |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 25 Ore: Ebony |  |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 100 Fragment: Ebony |  |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 20 Fragment: Ebony |  |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 25 Ore: Ebony |  |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 3 Ore: Ebony |  |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 30 Ore: Ebony |  |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 200 Fragment: Ebony |  |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 3 Ore: Ebony |  |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 5 Ore: Ebony |  |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 50 Ore: Ebony |  |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 5 Ore: Ebony |  |
| Ingot: Ebony | 1 | Ebony Blacksmithing | Smelter | 20 Fragment: Ebony |  |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 50 Ore: Ebony |  |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 15 Ore: Ebony |  |
| Ingot: Ebony | 10 | Ebony Blacksmithing | Smelter | 30 Ore: Ebony |  |
| Ingot: Ebony | 5 | Ebony Blacksmithing | Smelter | 100 Fragment: Ebony |  |
| Irkngthand War Axe | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 3 Leather Strips 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Axe |
| Irkngthand War Axe | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Irkngthand War Axe | 1 | Ebony Blacksmithing | Forge | 2 Ingot: Ebony 3 Leather Strips 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Axe |
| Masque of Clavicus Vile Replica | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | Daedra - A Daedras Best Friend |
| Masque of Clavicus Vile Replica | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | Daedra - A Daedras Best Friend |
| Nettlebane | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Spriggan Sap |  |
| Nightingale Blade | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Nightingale Blade | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Nightingale Bow | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Nightingale Bow | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony 2 Hide Lace |  |
| Shellbug Helmet | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Leather Strips 1 Leather 2 Shellbug Chitin |  |
| Shellbug Helmet | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Shellbug Helmet | 1 | Ebony Blacksmithing | Forge | 1 Ingot: Ebony 1 Leather Strips 1 Leather 2 Shellbug Chitin |  |
| Shield of Ysgramor | 1 | Ebony Blacksmithing | N/A | 1 Ingot: Ebony |  |
| Shield of Ysgramor Replica | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Leather Strips 1 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Shield of Ysgramor Replica | 1 | Ebony Blacksmithing | Forge | 4 Ingot: Ebony 2 Leather Strips 1 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Soulrender | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Wuuthrad | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Wuuthrad Replica | 1 | Ebony Blacksmithing | Sharpening Wheel | 1 Ingot: Ebony |  |
| Wuuthrad Replica | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 3 Leather Strips 2 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Wuuthrad Replica | 1 | Ebony Blacksmithing | Forge | 3 Ingot: Ebony 3 Leather Strips 2 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Arrow: Glass | 15 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Wood |  |
| Arrow: Glass | 15 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Wood |  |
| Bolt: Glass | 15 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Wood |  |
| Bolt: Glass | 15 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Wood |  |
| Chillrend | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Frost Salts |  |
| Chillrend Replica | 1 | Glass Blacksmithing | Forge | 1 Frost Salts 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium | TG - The Pursuit Complete |
| Chillrend Replica | 1 | Glass Blacksmithing | Forge | 1 Frost Salts 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium | TG - The Pursuit Complete |
| Fragment: Malachite | 20 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Battleaxe | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Battleaxe | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Battleaxe | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Battlestaff | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Battlestaff | 1 | Glass Blacksmithing | Forge | 1 Ingot: Moonstone 2 Ingot: Malachite 2 Ingot: Calcinium |  |
| Glass Battlestaff | 1 | Glass Blacksmithing | Forge | 1 Ingot: Moonstone 2 Ingot: Malachite 2 Ingot: Calcinium |  |
| Glass Boots | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Boots | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Boots | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Boots - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Boots - Thalmor | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Boots - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Boots - Vvardenfell | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Boots - Vvardenfell | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Boots - Vvardenfell | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Cuirass | 1 | Glass Blacksmithing | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Calcinium |  |
| Glass Cuirass | 1 | Glass Blacksmithing | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Calcinium |  |
| Glass Cuirass | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Cuirass - Thalmor | 1 | Glass Blacksmithing | Forge | 2 Ingot: Corundum 5 Ingot: Malachite 4 Leather Strips 2 Leather |  |
| Glass Cuirass - Thalmor | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Cuirass - Thalmor | 1 | Glass Blacksmithing | Forge | 2 Ingot: Corundum 5 Ingot: Malachite 4 Leather Strips 2 Leather |  |
| Glass Cuirass - Vvardenfell | 1 | Glass Blacksmithing | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Galatite |  |
| Glass Cuirass - Vvardenfell | 1 | Glass Blacksmithing | Forge | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Galatite |  |
| Glass Cuirass - Vvardenfell | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Dagger | 1 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Dagger | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Dagger | 1 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Gauntlets | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Gauntlets | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Gauntlets | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Gauntlets - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 2 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Gauntlets - Thalmor | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Gauntlets - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 2 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Gauntlets - Vvardenfell | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Gauntlets - Vvardenfell | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Gauntlets - Vvardenfell | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Greatsword | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Greatsword | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Greatsword | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Helmet | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Helmet | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Helmet | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Helmet - Thalmor | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Helmet - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 1 Leather Strips 1 Leather |  |
| Glass Helmet - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Malachite 1 Leather Strips 1 Leather |  |
| Glass Helmet - Vvardenfell | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Helmet - Vvardenfell | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Helmet - Vvardenfell | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Hunting Knife | 1 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Glass Hunting Knife | 1 | Glass Blacksmithing | Forge | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Glass Light Bow | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Hide Lace 1 Ingot: Calcinium |  |
| Glass Light Bow | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Bow | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Hide Lace 1 Ingot: Calcinium |  |
| Glass Light Bow of the Stag Prince | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Crossbow | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite 1 Hide Lace |  |
| Glass Light Crossbow | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Hide Lace 2 Ingot: Calcinium |  |
| Glass Light Crossbow | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Hide Lace 2 Ingot: Calcinium |  |
| Glass Mace | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Mace | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Mace | 1 | Glass Blacksmithing | Forge | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | 1 | Glass Blacksmithing | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | 1 | Glass Blacksmithing | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Shield - Thalmor | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Shield - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 4 Ingot: Malachite 2 Leather Strips |  |
| Glass Shield - Thalmor | 1 | Glass Blacksmithing | Forge | 1 Ingot: Corundum 4 Ingot: Malachite 2 Leather Strips |  |
| Glass Shield - Vvardenfell | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Glass Shield - Vvardenfell | 1 | Glass Blacksmithing | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Galatite |  |
| Glass Shield - Vvardenfell | 1 | Glass Blacksmithing | Forge | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Galatite |  |
| Glass Sword | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Sword | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Sword | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass War Axe | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass War Axe | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass War Axe | 1 | Glass Blacksmithing | Forge | 2 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Warhammer | 1 | Glass Blacksmithing | Sharpening Wheel | 1 Ingot: Malachite |  |
| Glass Warhammer | 1 | Glass Blacksmithing | Forge | 4 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Warhammer | 1 | Glass Blacksmithing | Forge | 4 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Horse Armor: Divine Aegis Barding and Saddle | 1 | Glass Blacksmithing | Forge | 2 Briar Heart 2 Ingot: Gold 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Divine Aegis Barding and Saddle | 1 | Glass Blacksmithing | Forge | 2 Briar Heart 2 Ingot: Gold 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Divine Aegis Barding and Saddle | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Horse Armor: Frost Aegis Barding and Saddle | 1 | Glass Blacksmithing | N/A | 1 Ingot: Malachite |  |
| Horse Armor: Frost Aegis Barding and Saddle | 1 | Glass Blacksmithing | Forge | 2 Frost Salts 2 Ingot: Quicksilver 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Frost Aegis Barding and Saddle | 1 | Glass Blacksmithing | Forge | 2 Frost Salts 2 Ingot: Quicksilver 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 200 Fragment: Malachite |  |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 25 Ore: Malachite |  |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 30 Ore: Malachite |  |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 5 Ore: Malachite |  |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 15 Ore: Malachite |  |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 30 Ore: Malachite |  |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 15 Ore: Malachite |  |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 20 Fragment: Malachite |  |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 100 Fragment: Malachite |  |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 5 Ore: Malachite |  |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 50 Ore: Malachite |  |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 3 Ore: Malachite |  |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 50 Ore: Malachite |  |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 25 Ore: Malachite |  |
| Ingot: Malachite | 5 | Glass Blacksmithing | Smelter | 100 Fragment: Malachite |  |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 20 Fragment: Malachite |  |
| Ingot: Malachite | 1 | Glass Blacksmithing | Smelter | 3 Ore: Malachite |  |
| Ingot: Malachite | 10 | Glass Blacksmithing | Smelter | 200 Fragment: Malachite |  |
| Dragonscale Boots | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Boots | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Cuirass | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 3 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Dragonscale Cuirass | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 3 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Dragonscale Gauntlets | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Gauntlets | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Helmet | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Dragonscale Helmet | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Dragonscale Shield | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 2 Leather Strips |  |
| Dragonscale Shield | 1 | Glass Blacksmithing,Draconic Blacksmithing | Forge | 2 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 2 Leather Strips |  |
| Auriel's Shield Replica | 1 | Advanced Light Smithing | Forge | 3 Ingot: Moonstone 2 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Auriel's Shield Replica | 1 | Advanced Light Smithing | Forge | 3 Ingot: Moonstone 2 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Blackguard's Boots | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Blackguard's Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Blackguard's Gloves | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Blackguard's Hood | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Elven Shield - Gilded | 1 | Advanced Light Smithing | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Gilded | 1 | Advanced Light Smithing | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | 1 | Advanced Light Smithing | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | 1 | Advanced Light Smithing | Forge | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Imperial Outcast Boots | 1 | Advanced Light Smithing | N/A | 1 Ingot: Iron |  |
| Imperial Outcast Bracers | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Imperial Outcast Bracers | 1 | Advanced Light Smithing | N/A | 1 Fur Plate |  |
| Imperial Outcast Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Imperial Outcast Helmet | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Imperial Studded Cuirass | 1 | Advanced Light Smithing | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Studded Cuirass | 1 | Advanced Light Smithing | Forge | 1 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Nightingale Armor | 1 | Advanced Light Smithing | N/A | 1 Void Salts 6 Leather Strips 5 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Boots | 1 | Advanced Light Smithing | N/A | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Boots | 1 | Advanced Light Smithing | N/A | 1 Void Salts |  |
| Nightingale Cuirass | 1 | Advanced Light Smithing | N/A | 1 Void Salts |  |
| Nightingale Gloves | 1 | Advanced Light Smithing | N/A | 1 Void Salts |  |
| Nightingale Gloves | 1 | Advanced Light Smithing | N/A | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Hood | 1 | Advanced Light Smithing | N/A | 1 Void Salts |  |
| Nightingale Hood | 1 | Advanced Light Smithing | N/A | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Savior's Hide Replica | 1 | Advanced Light Smithing | Forge | 1 Pelt: Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | 1 | Advanced Light Smithing | Forge | 1 Pelt: Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | 1 | Advanced Light Smithing | N/A | 1 Pelt: Cave Bear 1 Ingot: Steel |  |
| Savior's Hide Replica - Black | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | 1 | Advanced Light Smithing | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - Black | 1 | Advanced Light Smithing | N/A | 1 Ingot: Steel 1 Fur Plate |  |
| Savior's Hide Replica - Black | 1 | Advanced Light Smithing | Forge | 1 Pelt: Cave Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | 1 | Advanced Light Smithing | N/A | 1 Pelt: Snow Bear 1 Ingot: Steel |  |
| Savior's Hide Replica - White | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | 1 | Advanced Light Smithing | Forge | 1 Pelt: Snow Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica - White | 1 | Advanced Light Smithing | N/A | 1 Ingot: Steel 1 Fur Plate |  |
| Savior's Hide Replica - White | 1 | Advanced Light Smithing | Forge | 1 Pelt: Snow Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Scaled Boots | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather |  |
| Scaled Boots | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Boots | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Boots | 1 | Advanced Light Smithing | N/A | 1 Ingot: Corundum |  |
| Scaled Boots | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 2 Leather |  |
| Scaled Boots | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Boots | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Bracers | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Bracers | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | 1 | Advanced Light Smithing | N/A | 1 Ingot: Corundum |  |
| Scaled Bracers | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Cuirass | 1 | Advanced Light Smithing | N/A | 1 Ingot: Corundum |  |
| Scaled Cuirass | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate 1 Goat Horns |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | N/A | 1 Ingot: Corundum |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate 1 Goat Horns |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 1 Pelt: Goat 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Goat Horns |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | 1 | Advanced Light Smithing | Forge | 1 Pelt: Sabre Cat 1 Pelt: Goat 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Goat Horns |  |
| Scaled Helmet | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Scaled Helmet | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Scaled Helmet | 1 | Advanced Light Smithing | N/A | 1 Ingot: Corundum |  |
| Scaled Helmet | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Scaled Helmet | 1 | Advanced Light Smithing | Forge | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Shrouded Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Shrouded Cuirass | 1 | Advanced Light Smithing | N/A | 6 Leather Strips 5 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Boots | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Shrouded Supple Boots | 1 | Advanced Light Smithing | N/A | 3 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Shrouded Supple Cowl | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 3 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl - Maskless | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Shrouded Supple Cowl - Maskless | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 3 Leather: Dark | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Gloves | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 1 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Gloves | 1 | Advanced Light Smithing | N/A | 1 Leather: Red |  |
| Snow Elf Boots | 1 | Advanced Light Smithing | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Boots | 1 | Advanced Light Smithing | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Circlet | 1 | Advanced Light Smithing | Forge | 1 Snow Elf Crown | DawnGuard - Touching the Sky Complete |
| Snow Elf Circlet | 1 | Advanced Light Smithing | Forge | 1 Snow Elf Crown | DawnGuard - Touching the Sky Complete |
| Snow Elf Crown | 1 | Advanced Light Smithing | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Crown | 1 | Advanced Light Smithing | Forge | 3 Ingot: Moonstone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Cuirass | 1 | Advanced Light Smithing | Forge | 5 Ingot: Moonstone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Cuirass | 1 | Advanced Light Smithing | Forge | 5 Ingot: Moonstone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Gauntlets | 1 | Advanced Light Smithing | Forge | 2 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Snow Elf Gauntlets | 1 | Advanced Light Smithing | Forge | 2 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Thieves Guild Improved Boots | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Boots | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Boots | 1 | Advanced Light Smithing | N/A | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots - Grey | 1 | Advanced Light Smithing | N/A | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots - Grey | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Cuirass | 1 | Advanced Light Smithing | N/A | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Cuirass - Grey | 1 | Advanced Light Smithing | N/A | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass - Grey | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Gloves | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Gloves | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Gloves - Grey | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves - Grey | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Hood | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Hood | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Hood | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Hood - Grey | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Improved Hood - Grey | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Sleeveless Cuirass - Grey | 1 | Advanced Light Smithing | N/A | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Sleeveless Cuirass - Grey | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Master's Boots | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Boots | 1 | Advanced Light Smithing | N/A | 3 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cowl | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cowl | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Cuirass | 1 | Advanced Light Smithing | N/A | 6 Leather Strips 8 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Gloves | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Gloves | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Hood | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Thieves Guild Master's Hood | 1 | Advanced Light Smithing | N/A | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Sleeveless Cuirass | 1 | Advanced Light Smithing | N/A | 6 Leather Strips 6 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Sleeveless Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather: Dark |  |
| Thieves Guild Sleeveless Improved Cuirass | 1 | Advanced Light Smithing | N/A | 1 Leather |  |
| Thieves Guild Sleeveless Improved Cuirass | 1 | Advanced Light Smithing | N/A | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Tumblerbane Gloves | 1 | Advanced Light Smithing | N/A | 1 Leather: Red |  |
| Vampire Boots | 1 | Advanced Light Smithing | Forge | 1 Ingot: Iron 3 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Boots | 1 | Advanced Light Smithing | Forge | 1 Ingot: Iron 3 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Dark | 1 | Advanced Light Smithing | N/A | 5 Leather Strips 5 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Grey | 1 | Advanced Light Smithing | N/A | 5 Leather Strips 5 Leather 1 Dye - Grey | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass - Red | 1 | Advanced Light Smithing | N/A | 5 Leather Strips 5 Leather: Red | DawnGuard - Prophet (Vampire) Complete |
| Vampire Gauntlets | 1 | Advanced Light Smithing | Forge | 1 Ingot: Iron 2 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Gauntlets | 1 | Advanced Light Smithing | Forge | 1 Ingot: Iron 2 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Royal Cuirass | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather: Dark | DawnGuard - Prophet (Vampire) Complete,DawnGuard - Killed Harkon |
| Vampire Royal Cuirass | 1 | Advanced Light Smithing | Forge | 2 Ingot: Steel 5 Leather Strips 6 Leather: Dark | DawnGuard - Prophet (Vampire) Complete,DawnGuard - Killed Harkon |
| Elven Boots - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 2 Ingot: Gold 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 2 Ingot: Gold 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Helmet - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | 1 | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Champion's Cudgel Replica | 1 | Advanced Light Smithing,Orcish Blacksmithing | Forge | 3 Leather Strips 5 Ingot: Galatite | Dragonborn - March Of The Dead Complete,Civil War - Joined Imperials |
| Champion's Cudgel Replica | 1 | Advanced Light Smithing,Orcish Blacksmithing | Forge | 3 Leather Strips 5 Ingot: Galatite | Dragonborn - March Of The Dead Complete,Civil War - Joined Imperials |
| Arrow: Nordic | 15 | Nordic Blacksmithing | Forge | 1 Wood 1 Ingot: Galatite |  |
| Arrow: Nordic | 15 | Nordic Blacksmithing | Forge | 1 Wood 1 Ingot: Galatite |  |
| Nordic Battleaxe | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 3 Leather Strips 3 Ingot: Galatite |  |
| Nordic Battleaxe | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 3 Leather Strips 3 Ingot: Galatite |  |
| Nordic Battleaxe | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Boots - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Black | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Boots - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Brown | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Boots - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Boots - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Cuirass - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Black | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Cuirass - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Brown | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Cuirass - White | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Cuirass - White | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Dagger | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Ingot: Galatite |  |
| Nordic Dagger | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Dagger | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Ingot: Galatite |  |
| Nordic Gauntlets - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Black | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - White | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Gauntlets - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Greatsword | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Greatsword | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Greatsword | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Heavy Bow | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Bow | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Bow | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Heavy Crossbow | 1 | Nordic Blacksmithing | Forge | 5 Ingot: Quicksilver |  |
| Nordic Heavy Crossbow | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Quicksilver 1 Hide Lace |  |
| Nordic Heavy Crossbow | 1 | Nordic Blacksmithing | Forge | 5 Ingot: Quicksilver |  |
| Nordic Helmet - Black | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Leather 3 Ingot: Galatite |  |
| Nordic Helmet - Black | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Helmet - Black | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Leather Strips 1 Leather 3 Ingot: Galatite |  |
| Nordic Mace | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Mace | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Mace | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Shield - Black | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Shield - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Black | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - Brown | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Shield - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | 1 | Nordic Blacksmithing | N/A | 1 Ingot: Galatite |  |
| Nordic Shield - White | 1 | Nordic Blacksmithing | Forge | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Sword | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Sword | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Leather Strips 2 Ingot: Galatite |  |
| Nordic Sword | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | 1 | Nordic Blacksmithing | Forge | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Warhammer | 1 | Nordic Blacksmithing | Sharpening Wheel | 1 Ingot: Galatite |  |
| Nordic Warhammer | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 3 Leather Strips 4 Ingot: Galatite |  |
| Nordic Warhammer | 1 | Nordic Blacksmithing | Forge | 2 Ingot: Orichalcum 3 Leather Strips 4 Ingot: Galatite |  |
| Bonemold Boots | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Boots | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Boots | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Cuirass | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Cuirass | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Cuirass | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Gauntlets | 1 | Morrowind Smithing 1 | Forge | 4 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Gauntlets | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Gauntlets | 1 | Morrowind Smithing 1 | Forge | 4 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Ingot: Iron 1 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Ingot: Iron 1 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Improved Boots | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Improved Boots | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Boots | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Cuirass | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Improved Cuirass | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Cuirass | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Gauntlets | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Improved Gauntlets | 1 | Morrowind Smithing 1 | Forge | 4 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Gauntlets | 1 | Morrowind Smithing 1 | Forge | 4 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 1 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet | 1 | Morrowind Smithing 1 | Forge | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 1 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Improved Pauldroned Cuirass | 1 | Morrowind Smithing 1 | Forge | 10 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Pauldroned Cuirass | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Improved Pauldroned Cuirass | 1 | Morrowind Smithing 1 | Forge | 10 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Shield | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 2 Salt 1 Ingot: Iron 2 Powdered Mammoth Tusk 2 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Shield | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Improved Shield | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 2 Salt 1 Ingot: Iron 2 Powdered Mammoth Tusk 2 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Pauldroned Cuirass | 1 | Morrowind Smithing 1 | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Pauldroned Cuirass | 1 | Morrowind Smithing 1 | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass - Guard's | 1 | Morrowind Smithing 1 | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass - Guard's | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Pauldroned Cuirass - Guard's | 1 | Morrowind Smithing 1 | Forge | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Shield | 1 | Morrowind Smithing 1 | N/A | 2 Bone Meal |  |
| Bonemold Shield | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 1 Ingot: Iron 1 Netch Leather |  |
| Bonemold Shield | 1 | Morrowind Smithing 1 | Forge | 8 Bone Meal 1 Ingot: Iron 1 Netch Leather |  |
| Arrow: Dragonbone | 15 | Draconic Blacksmithing | Forge | 1 Dragon Bone 1 Wood |  |
| Arrow: Dragonbone | 15 | Draconic Blacksmithing | Forge | 1 Dragon Bone 1 Wood |  |
| Bolt: Dragonbone | 15 | Draconic Blacksmithing | Forge | 1 Dragon Bone 1 Wood |  |
| Bolt: Dragonbone | 15 | Draconic Blacksmithing | Forge | 1 Dragon Bone 1 Wood |  |
| Dragonbone Battleaxe | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Dagger | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Greatsword | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Heavy Bow | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone 2 Hide Lace |  |
| Dragonbone Heavy Crossbow | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone 2 Hide Lace |  |
| Dragonbone Heavy Crossbow | 1 | Draconic Blacksmithing | Forge | 3 Dragon Bone 2 Ingot: Ebony 4 Hide Lace |  |
| Dragonbone Heavy Crossbow | 1 | Draconic Blacksmithing | Forge | 3 Dragon Bone 2 Ingot: Ebony 4 Hide Lace |  |
| Dragonbone Hunting Knife | 1 | Draconic Blacksmithing | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Dragonbone Hunting Knife | 1 | Draconic Blacksmithing | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Dragonbone Mace | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Sword | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone War Axe | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonbone Warhammer | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Dragonplate Bearskin Hood - Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Black |  |
| Dragonplate Bearskin Hood - Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Brown |  |
| Dragonplate Bearskin Hood - Ornate Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonplate Bearskin Hood - Ornate Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonplate Bearskin Hood - Ornate White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonplate Bearskin Hood - Trimmed Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonplate Bearskin Hood - Trimmed Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonplate Bearskin Hood - Trimmed White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonplate Bearskin Hood - White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Bearskin Hood - White |  |
| Dragonplate Boots | 1 | Draconic Blacksmithing | N/A | 1 Dragon Bone |  |
| Dragonplate Cuirass | 1 | Draconic Blacksmithing | N/A | 1 Dragon Bone |  |
| Dragonplate Gauntlets | 1 | Draconic Blacksmithing | N/A | 1 Dragon Bone |  |
| Dragonplate Helmet | 1 | Draconic Blacksmithing | N/A | 1 Dragon Bone |  |
| Dragonplate Shield | 1 | Draconic Blacksmithing | N/A | 1 Dragon Bone |  |
| Dragonplate Wolfskin Hood - Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Black |  |
| Dragonplate Wolfskin Hood - Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonplate Wolfskin Hood - Light Trimmed Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonplate Wolfskin Hood - Light Trimmed Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Light Trimmed White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonplate Wolfskin Hood - Noble Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonplate Wolfskin Hood - Noble Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonplate Wolfskin Hood - Noble White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonplate Wolfskin Hood - Ornate Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonplate Wolfskin Hood - Ornate Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonplate Wolfskin Hood - Ornate White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonplate Wolfskin Hood - White | 1 | Draconic Blacksmithing | Forge | 1 Dragonplate Helmet 1 Wolfskin Hood - White |  |
| Dragonscale Bearskin Hood - Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Black |  |
| Dragonscale Bearskin Hood - Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Brown |  |
| Dragonscale Bearskin Hood - Ornate Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonscale Bearskin Hood - Ornate Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonscale Bearskin Hood - Ornate White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonscale Bearskin Hood - Trimmed Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonscale Bearskin Hood - Trimmed Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonscale Bearskin Hood - Trimmed White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonscale Bearskin Hood - White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Bearskin Hood - White |  |
| Dragonscale Boots | 1 | Draconic Blacksmithing | N/A | 1 Dragon Scales |  |
| Dragonscale Cuirass | 1 | Draconic Blacksmithing | N/A | 1 Dragon Scales |  |
| Dragonscale Gauntlets | 1 | Draconic Blacksmithing | N/A | 1 Dragon Scales |  |
| Dragonscale Helmet | 1 | Draconic Blacksmithing | N/A | 1 Dragon Scales |  |
| Dragonscale Shield | 1 | Draconic Blacksmithing | N/A | 1 Dragon Scales |  |
| Dragonscale Wolfskin Hood - Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Black |  |
| Dragonscale Wolfskin Hood - Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonscale Wolfskin Hood - Light Trimmed Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonscale Wolfskin Hood - Light Trimmed Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Light Trimmed White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonscale Wolfskin Hood - Noble Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonscale Wolfskin Hood - Noble Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonscale Wolfskin Hood - Noble White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonscale Wolfskin Hood - Ornate Black | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonscale Wolfskin Hood - Ornate Brown | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonscale Wolfskin Hood - Ornate White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonscale Wolfskin Hood - White | 1 | Draconic Blacksmithing | Forge | 1 Dragonscale Helmet 1 Wolfskin Hood - White |  |
| Fang of Haynekhtnamet | 1 | Draconic Blacksmithing | Sharpening Wheel | 1 Dragon Bone |  |
| Horse Armor: Dragonbone Barding and Saddle | 1 | Draconic Blacksmithing | Forge | 2 Dragon Scales 8 Dragon Bone 1 Ingot: Steel 10 Leather Strips 6 Leather |  |
| Horse Armor: Dragonbone Barding and Saddle | 1 | Draconic Blacksmithing | Forge | 2 Dragon Scales 8 Dragon Bone 1 Ingot: Steel 10 Leather Strips 6 Leather |  |
| Horse Armor: Dragonbone Barding and Saddle | 1 | Draconic Blacksmithing | N/A | 1 Dragon Scales |  |
| Jagged Crown | 1 | Draconic Blacksmithing | N/A | 1 Dragon Bone |  |
| Dragonbone Battleaxe | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Battleaxe | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Dagger | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Dagger | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Greatsword | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Greatsword | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Heavy Bow | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Heavy Bow | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Mace | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Mace | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Sword | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Sword | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone War Axe | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone War Axe | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Warhammer | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 4 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Warhammer | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 4 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonplate Boots | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Boots | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Cuirass | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 4 Dragon Bone 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Dragonplate Cuirass | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 4 Dragon Bone 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Dragonplate Gauntlets | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Gauntlets | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Helmet | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Dragonplate Helmet | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Dragonplate Shield | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 4 Dragon Bone 2 Ingot: Ebony 2 Leather Strips |  |
| Dragonplate Shield | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 4 Dragon Bone 2 Ingot: Ebony 2 Leather Strips |  |
| Jagged Crown Replica | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather | Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete,Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete |
| Jagged Crown Replica | 1 | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather | Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete,Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete |
| Arrow: Daedric | 150 | Daedric Smithing | Forge | 150 Arrow: Ebony 1 Soul Gem: Black 1 Daedra Heart |  |
| Arrow: Daedric | 150 | Daedric Smithing | Forge | 150 Arrow: Ebony 1 Soul Gem: Black 1 Daedra Heart |  |
| Bolt: Daedric | 150 | Daedric Smithing | Forge | 1 Soul Gem: Black 1 Daedra Heart 150 Bolt: Ebony |  |
| Bolt: Daedric | 150 | Daedric Smithing | Forge | 1 Soul Gem: Black 1 Daedra Heart 150 Bolt: Ebony |  |
| Daedric Battleaxe | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Battleaxe | 1 | Daedric Smithing | Forge | 1 Ebony Battleaxe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Battleaxe | 1 | Daedric Smithing | Forge | 1 Ebony Battleaxe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Battlestaff | 1 | Daedric Smithing | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Battlestaff |  |
| Daedric Battlestaff | 1 | Daedric Smithing | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Battlestaff |  |
| Daedric Battlestaff | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Boots | 1 | Daedric Smithing | Forge | 1 Ebony Boots 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Boots | 1 | Daedric Smithing | N/A | 1 Ingot: Ebony |  |
| Daedric Boots | 1 | Daedric Smithing | Forge | 1 Ebony Boots 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Cuirass | 1 | Daedric Smithing | N/A | 1 Ingot: Ebony |  |
| Daedric Cuirass | 1 | Daedric Smithing | Forge | 1 Ebony Cuirass 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Cuirass | 1 | Daedric Smithing | Forge | 1 Ebony Cuirass 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Dagger | 1 | Daedric Smithing | Forge | 1 Ebony Dagger 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Dagger | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Dagger | 1 | Daedric Smithing | Forge | 1 Ebony Dagger 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Gauntlets | 1 | Daedric Smithing | N/A | 1 Ingot: Ebony |  |
| Daedric Gauntlets | 1 | Daedric Smithing | Forge | 1 Ebony Gauntlets 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Gauntlets | 1 | Daedric Smithing | Forge | 1 Ebony Gauntlets 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Greatsword | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Greatsword | 1 | Daedric Smithing | Forge | 1 Ebony Greatsword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Greatsword | 1 | Daedric Smithing | Forge | 1 Ebony Greatsword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Bow | 1 | Daedric Smithing | Forge | 1 Ebony Heavy Bow 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Bow | 1 | Daedric Smithing | Forge | 1 Ebony Heavy Bow 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Heavy Bow | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Heavy Crossbow | 1 | Daedric Smithing | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Heavy Crossbow 4 Silk Thread |  |
| Daedric Heavy Crossbow | 1 | Daedric Smithing | Sharpening Wheel | 1 Ingot: Ebony 2 Silk Thread |  |
| Daedric Heavy Crossbow | 1 | Daedric Smithing | Forge | 1 Soul Gem: Black 1 Daedra Heart 1 Ebony Heavy Crossbow 4 Silk Thread |  |
| Daedric Helmet | 1 | Daedric Smithing | Forge | 1 Ebony Helmet 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Helmet | 1 | Daedric Smithing | N/A | 1 Ingot: Ebony |  |
| Daedric Helmet | 1 | Daedric Smithing | Forge | 1 Ebony Helmet 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Hunting Knife | 1 | Daedric Smithing | Forge | 1 Daedra Heart 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Daedric Hunting Knife | 1 | Daedric Smithing | Forge | 1 Daedra Heart 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Daedric Mace | 1 | Daedric Smithing | Forge | 1 Ebony Mace 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Mace | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Mace | 1 | Daedric Smithing | Forge | 1 Ebony Mace 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Shield | 1 | Daedric Smithing | Forge | 1 Ebony Shield 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Shield | 1 | Daedric Smithing | Forge | 1 Ebony Shield 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Shield | 1 | Daedric Smithing | N/A | 1 Ingot: Ebony |  |
| Daedric Sword | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Sword | 1 | Daedric Smithing | Forge | 1 Ebony Sword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Sword | 1 | Daedric Smithing | Forge | 1 Ebony Sword 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric War Axe | 1 | Daedric Smithing | Forge | 1 Ebony War Axe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric War Axe | 1 | Daedric Smithing | Forge | 1 Ebony War Axe 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric War Axe | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Warhammer | 1 | Daedric Smithing | Forge | 1 Ebony Warhammer 1 Soul Gem: Black 1 Daedra Heart |  |
| Daedric Warhammer | 1 | Daedric Smithing | Sharpening Wheel | 1 Daedra Heart |  |
| Daedric Warhammer | 1 | Daedric Smithing | Forge | 1 Ebony Warhammer 1 Soul Gem: Black 1 Daedra Heart |  |
| Horse Armor: Daedric Barding and Saddle | 1 | Daedric Smithing | Forge | 1 Daedra Heart 1 Ingot: Steel 10 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Daedric Barding and Saddle | 1 | Daedric Smithing | N/A | 1 Ingot: Ebony |  |
| Horse Armor: Daedric Barding and Saddle | 1 | Daedric Smithing | Forge | 1 Daedra Heart 1 Ingot: Steel 10 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Mace of Molag Bal Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 3 Ingot: Ebony 2 Leather Strips | Daedra - The House of Horrors |
| Mace of Molag Bal Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 3 Ingot: Ebony 2 Leather Strips | Daedra - The House of Horrors |
| Mehrunes' Razor Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 1 Ingot: Steel 1 Ingot: Ebony 1 Leather Strips | Daedra - Pieces of the Past |
| Mehrunes' Razor Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 1 Ingot: Steel 1 Ingot: Ebony 1 Leather Strips | Daedra - Pieces of the Past |
| Miraak's Sword Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 2 Ingot: Ebony 1 Netch Leather | Killed Miraak |
| Miraak's Sword Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 2 Ingot: Ebony 1 Netch Leather | Killed Miraak |
| Nightingale Blade | 1 | Daedric Smithing | Forge | 1 Void Salts 2 Ingot: Ebony 1 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Blade | 1 | Daedric Smithing | Forge | 1 Void Salts 2 Ingot: Ebony 1 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Bow | 1 | Daedric Smithing | Forge | 1 Void Salts 3 Ingot: Ebony 2 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Bow | 1 | Daedric Smithing | Forge | 1 Void Salts 3 Ingot: Ebony 2 Leather Strips | TG - Darkness Returns Complete |
| Volendrung Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 4 Ingot: Ebony 3 Leather Strips | Daedra - The Cursed Tribe Complete |
| Volendrung Replica | 1 | Daedric Smithing | Forge | 1 Daedra Heart 4 Ingot: Ebony 3 Leather Strips | Daedra - The Cursed Tribe Complete |
| Aetherial Shield | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Arrow: Dwarven | 15 | Dwarven Blacksmithing | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Arrow: Dwarven | 15 | Dwarven Blacksmithing | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Blade of the Rourken | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Bolt: Dwarven | 15 | Dwarven Blacksmithing | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Bolt: Dwarven | 15 | Dwarven Blacksmithing | Forge | 1 Wood 1 Ingot: Dwarven |  |
| Dwarven Battleaxe | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 3 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Battleaxe | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 3 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Battleaxe | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Boots | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Boots | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Dwarven Boots | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Cuirass | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 4 Leather Strips 2 Leather 5 Ingot: Dwarven |  |
| Dwarven Cuirass | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Dwarven Cuirass | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 4 Leather Strips 2 Leather 5 Ingot: Dwarven |  |
| Dwarven Dagger | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven |  |
| Dwarven Dagger | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven |  |
| Dwarven Dagger | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Gauntlets | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 2 Ingot: Dwarven |  |
| Dwarven Gauntlets | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 1 Leather 2 Ingot: Dwarven |  |
| Dwarven Gauntlets | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Dwarven Greatsword | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Greatsword | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Greatsword | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Heavy Bow | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Bow | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Bow | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | 1 | Dwarven Blacksmithing | Forge | 3 Wood 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | 1 | Dwarven Blacksmithing | Forge | 3 Wood 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Helmet | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Helmet | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Helmet | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Dwarven Hunting Knife | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven 1 Fragment: Bone |  |
| Dwarven Hunting Knife | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven 1 Fragment: Bone |  |
| Dwarven Improved Light Crossbow | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 4 Ingot: Dwarven | Read Dwemer Crossbow Schematic |
| Dwarven Improved Light Crossbow | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 4 Ingot: Dwarven | Read Dwemer Crossbow Schematic |
| Dwarven Improved Light Crossbow | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Mace | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Mace | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Mace | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Masterwork Light Crossbow | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Quicksilver 1 Dwarven Improved Light Crossbow | Improved Dwemer Crossbow Schematic |
| Dwarven Masterwork Light Crossbow | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Masterwork Light Crossbow | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Quicksilver 1 Dwarven Improved Light Crossbow | Improved Dwemer Crossbow Schematic |
| Dwarven Shield | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Dwarven Shield | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 2 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Shield | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 2 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Sword | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven Sword | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 1 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven Sword | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven War Axe | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven War Axe | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Steel 2 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven War Axe | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Warhammer | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 3 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Warhammer | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Dwarven Warhammer | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 3 Leather Strips 4 Ingot: Dwarven |  |
| Falmer Heavy Boots | 1 | Dwarven Blacksmithing | Forge | 3 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Boots | 1 | Dwarven Blacksmithing | Forge | 3 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Cuirass | 1 | Dwarven Blacksmithing | Forge | 5 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Cuirass | 1 | Dwarven Blacksmithing | Forge | 5 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Gauntlets | 1 | Dwarven Blacksmithing | Forge | 2 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Gauntlets | 1 | Dwarven Blacksmithing | Forge | 2 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Helmet | 1 | Dwarven Blacksmithing | Forge | 3 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Heavy Helmet | 1 | Dwarven Blacksmithing | Forge | 3 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Fragment: Dwarven | 20 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Horse Armor: Dwarven Barding and Saddle | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 10 Leather Strips 6 Leather 8 Ingot: Dwarven |  |
| Horse Armor: Dwarven Barding and Saddle | 1 | Dwarven Blacksmithing | Forge | 2 Ingot: Steel 10 Leather Strips 6 Leather 8 Ingot: Dwarven |  |
| Horse Armor: Dwarven Barding and Saddle | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | Smelter | 1 Any Dwarven scrap metal |  |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | Smelter | 20 Fragment: Dwarven |  |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | Smelter | 1 Any Dwarven scrap metal |  |
| Ingot: Dwarven | 10 | Dwarven Blacksmithing | Smelter | 200 Fragment: Dwarven |  |
| Ingot: Dwarven | 1 | Dwarven Blacksmithing | Smelter | 20 Fragment: Dwarven |  |
| Ingot: Dwarven | 5 | Dwarven Blacksmithing | Smelter | 100 Fragment: Dwarven |  |
| Ingot: Dwarven | 5 | Dwarven Blacksmithing | Smelter | 100 Fragment: Dwarven |  |
| Ingot: Dwarven | 10 | Dwarven Blacksmithing | Smelter | 200 Fragment: Dwarven |  |
| Keening Replica | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Dwarven Gyro 1 Ingot: Dwarven | College - Arniels Endeavor  Complete |
| Keening Replica | 1 | Dwarven Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Dwarven Gyro 1 Ingot: Dwarven | College - Arniels Endeavor  Complete |
| Keening Replica | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven |  |
| Visage of Mzund | 1 | Dwarven Blacksmithing | N/A | 1 Ingot: Dwarven |  |
| Zephyr | 1 | Dwarven Blacksmithing | Sharpening Wheel | 1 Ingot: Dwarven 2 Hide Lace |  |
| Bolt: Dwarven Fireburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Fire Schematic |
| Bolt: Dwarven Fireburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Fire Schematic |
| Bolt: Dwarven Iceburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Ice Schematic |
| Bolt: Dwarven Iceburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Ice Schematic |
| Bolt: Dwarven Shockburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Shock Schematic |
| Bolt: Dwarven Shockburst | 15 | Dwarven Blacksmithing,Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Dwarven | Read Dwemer Bolt of Shock Schematic |
| Arrow: Stalhrim | 15 | Stalhrim Smithing | Forge | 1 Wood 1 Stalhrim | A New Source of Stalhrim |
| Arrow: Stalhrim | 15 | Stalhrim Smithing | Forge | 1 Wood 1 Stalhrim | A New Source of Stalhrim |
| Bolt: Stalhrim | 15 | Stalhrim Smithing | Forge | 1 Stalhrim | A New Source of Stalhrim |
| Bolt: Stalhrim | 15 | Stalhrim Smithing | Forge | 1 Stalhrim | A New Source of Stalhrim |
| Deathbrand Boots | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Deathbrand Cuirass | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Deathbrand Gauntlets | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Deathbrand Helm | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Battleaxe | 1 | Stalhrim Smithing | Forge | 3 Leather Strips 1 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battleaxe | 1 | Stalhrim Smithing | Forge | 3 Leather Strips 1 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battleaxe | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Battlestaff | 1 | Stalhrim Smithing | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battlestaff | 1 | Stalhrim Smithing | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battlestaff | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Dagger | 1 | Stalhrim Smithing | Forge | 1 Leather Strips 1 Ingot: Galatite 1 Stalhrim | A New Source of Stalhrim |
| Stalhrim Dagger | 1 | Stalhrim Smithing | Forge | 1 Leather Strips 1 Ingot: Galatite 1 Stalhrim | A New Source of Stalhrim |
| Stalhrim Dagger | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Greatsword | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Greatsword | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Greatsword | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Heavy Boots | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Heavy Boots | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Boots | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Crossbow | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Heavy Crossbow | 1 | Stalhrim Smithing | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Crossbow | 1 | Stalhrim Smithing | Forge | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Cuirass | 1 | Stalhrim Smithing | Forge | 4 Leather Strips 2 Leather 2 Ingot: Galatite 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Cuirass | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Heavy Cuirass | 1 | Stalhrim Smithing | Forge | 4 Leather Strips 2 Leather 2 Ingot: Galatite 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Gauntlets | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Heavy Gauntlets | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Gauntlets | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Leather 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | 1 | Stalhrim Smithing | Forge | 1 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | 1 | Stalhrim Smithing | Forge | 1 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Light Boots | 1 | Stalhrim Smithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Boots | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Light Boots | 1 | Stalhrim Smithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Bow | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Hide Lace 1 Stalhrim |  |
| Stalhrim Light Bow | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Bow | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Cuirass | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Light Cuirass | 1 | Stalhrim Smithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Cuirass | 1 | Stalhrim Smithing | Forge | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Gauntlets | 1 | Stalhrim Smithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Gauntlets | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Light Gauntlets | 1 | Stalhrim Smithing | Forge | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Helmet | 1 | Stalhrim Smithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Helmet | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Light Helmet | 1 | Stalhrim Smithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Shield | 1 | Stalhrim Smithing | N/A | 1 Stalhrim |  |
| Stalhrim Light Shield | 1 | Stalhrim Smithing | Forge | 2 Ingot: Quicksilver 2 Leather Strips 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Shield | 1 | Stalhrim Smithing | Forge | 2 Ingot: Quicksilver 2 Leather Strips 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Mace | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Mace | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Mace | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Sword | 1 | Stalhrim Smithing | Forge | 1 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Sword | 1 | Stalhrim Smithing | Forge | 1 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Sword | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim War Axe | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim War Axe | 1 | Stalhrim Smithing | Forge | 2 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim War Axe | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Warhammer | 1 | Stalhrim Smithing | Forge | 3 Leather Strips 2 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Warhammer | 1 | Stalhrim Smithing | Sharpening Wheel | 1 Stalhrim |  |
| Stalhrim Warhammer | 1 | Stalhrim Smithing | Forge | 3 Leather Strips 2 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Arrow: Orcish | 15 | Orcish Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Arrow: Orcish | 15 | Orcish Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Bolt: Orcish | 15 | Orcish Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Bolt: Orcish | 15 | Orcish Blacksmithing | Forge | 1 Ingot: Orichalcum 1 Wood |  |
| Bouncer | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Fragment: Orichalcum | 20 | Orcish Blacksmithing | N/A | 1 Ingot: Orichalcum |  |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 100 Fragment: Orichalcum |  |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 30 Ore: Orichalcum |  |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 50 Ore: Orichalcum |  |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 200 Fragment: Orichalcum |  |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 25 Ore: Orichalcum |  |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 15 Ore: Orichalcum |  |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 3 Ore: Orichalcum |  |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 200 Fragment: Orichalcum |  |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 100 Fragment: Orichalcum |  |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 25 Ore: Orichalcum |  |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 20 Fragment: Orichalcum |  |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 3 Ore: Orichalcum |  |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 5 Ore: Orichalcum |  |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 5 Ore: Orichalcum |  |
| Ingot: Orichalcum | 1 | Orcish Blacksmithing | Smelter | 20 Fragment: Orichalcum |  |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 50 Ore: Orichalcum |  |
| Ingot: Orichalcum | 10 | Orcish Blacksmithing | Smelter | 30 Ore: Orichalcum |  |
| Ingot: Orichalcum | 5 | Orcish Blacksmithing | Smelter | 15 Ore: Orichalcum |  |
| Orcish Battleaxe | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Battleaxe | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Battleaxe | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Boots | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Boots | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Boots | 1 | Orcish Blacksmithing | N/A | 1 Ingot: Orichalcum |  |
| Orcish Cuirass | 1 | Orcish Blacksmithing | N/A | 1 Ingot: Orichalcum |  |
| Orcish Cuirass | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Corundum 5 Ingot: Orichalcum 4 Leather Strips 2 Leather |  |
| Orcish Cuirass | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Corundum 5 Ingot: Orichalcum 4 Leather Strips 2 Leather |  |
| Orcish Dagger | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Dagger | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Dagger | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Gauntlets | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 2 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Gauntlets | 1 | Orcish Blacksmithing | N/A | 1 Ingot: Orichalcum |  |
| Orcish Gauntlets | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 2 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Greatsword | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Greatsword | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Greatsword | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Heavy Bow | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Bow | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Bow | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Helmet | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 1 Leather Strips 1 Leather |  |
| Orcish Helmet | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 3 Ingot: Orichalcum 1 Leather Strips 1 Leather |  |
| Orcish Helmet | 1 | Orcish Blacksmithing | N/A | 1 Ingot: Orichalcum |  |
| Orcish Hunting Knife | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips 1 Fragment: Bone |  |
| Orcish Hunting Knife | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips 1 Fragment: Bone |  |
| Orcish Mace | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Mace | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Mace | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 4 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Corundum 4 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | 1 | Orcish Blacksmithing | N/A | 1 Ingot: Orichalcum |  |
| Orcish Sword | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Sword | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Sword | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish War Axe | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish War Axe | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Steel 2 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish War Axe | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Warhammer | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Orcish Warhammer | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Steel 4 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Warhammer | 1 | Orcish Blacksmithing | Forge | 2 Ingot: Steel 4 Ingot: Orichalcum 3 Leather Strips |  |
| Orichalc Amber Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Amber 1 Orichalc Circlet |  |
| Orichalc Amethyst Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Amethyst 1 Orichalc Circlet |  |
| Orichalc Amethyst Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Amethyst (Flawless) 1 Orichalc Circlet |  |
| Orichalc Aquamarine Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Aquamarine 1 Orichalc Circlet |  |
| Orichalc Aquamarine Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Aquamarine (Flawless) 1 Orichalc Circlet |  |
| Orichalc Circlet | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Orichalcum |  |
| Orichalc Circlet | 1 | Orcish Blacksmithing | Forge | 1 Ingot: Orichalcum |  |
| Orichalc Diamond Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Diamond 1 Orichalc Circlet |  |
| Orichalc Diamond Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Diamond (Flawless) 1 Orichalc Circlet |  |
| Orichalc Emerald Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Emerald 1 Orichalc Circlet |  |
| Orichalc Emerald Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Emerald (Flawless) 1 Orichalc Circlet |  |
| Orichalc Garnet Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Garnet 1 Orichalc Circlet |  |
| Orichalc Garnet Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Garnet (Flawless) 1 Orichalc Circlet |  |
| Orichalc Onyx Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Onyx 1 Orichalc Circlet |  |
| Orichalc Opal Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Opal 1 Orichalc Circlet |  |
| Orichalc Peridot Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Peridot 1 Orichalc Circlet |  |
| Orichalc Peridot Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Peridot (Flawless) 1 Orichalc Circlet |  |
| Orichalc Ruby Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Ruby 1 Orichalc Circlet |  |
| Orichalc Ruby Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Ruby (Flawless) 1 Orichalc Circlet |  |
| Orichalc Sapphire Circlet | 1 | Orcish Blacksmithing | N/A | 3 Gem: Sapphire 1 Orichalc Circlet |  |
| Orichalc Sapphire Circlet (Flawless) | 1 | Orcish Blacksmithing | N/A | 3 Gem: Sapphire (Flawless) 1 Orichalc Circlet |  |
| The Longhammer | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| The Warhammer of Inebriation | 1 | Orcish Blacksmithing | Sharpening Wheel | 1 Ingot: Orichalcum |  |
| Spellbreaker Replica | 1 | Orcish Blacksmithing,Advanced Blacksmithing | Forge | 1 Soul Gem: Grand 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Dwarven 2 Ingot: Calcinium | Daedra - The Only Cure Complete |
| Spellbreaker Replica | 1 | Orcish Blacksmithing,Advanced Blacksmithing | Forge | 1 Soul Gem: Grand 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Dwarven 2 Ingot: Calcinium | Daedra - The Only Cure Complete |
| Snowberry Extract | 1 | Alchemical Lore 1 | Cook pot | 20 Snowberries | Animal Harvesting Skill Greater or Equal to 1 |
| Snowberry Extract | 1 | Alchemical Lore 1 | N/A | 20 Snowberries | Animal Harvesting Skill Greater or Equal to 1 |
| Bolt: Steel Fire | 15 | Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Steel |  |
| Bolt: Steel Fire | 15 | Arcane Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Steel |  |
| Bolt: Steel Ice | 15 | Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Steel |  |
| Bolt: Steel Ice | 15 | Arcane Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Steel |  |
| Bolt: Steel Shock | 15 | Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Steel |  |
| Bolt: Steel Shock | 15 | Arcane Craftsmanship | Forge | 1 Void Salts 15 Bolt: Steel |  |
| Ghostblade | 1 | Arcane Craftsmanship | Sharpening Wheel | 1 Ectoplasm |  |
| Unenchanted Forsworn Staff | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Hagraven Feathers 6 Sabre Cat Tooth 3 Wood 4 Leather Strips 2 Hawk Beak |  |
| Unenchanted Forsworn Staff | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Hagraven Feathers 6 Sabre Cat Tooth 3 Wood 4 Leather Strips 2 Hawk Beak |  |
| Unenchanted Staff of Alteration | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Alteration | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Conjuration | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Conjuration | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Destruction | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Destruction | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Illusion | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Illusion | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Restoration | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Restoration | 1 | Arcane Craftsmanship | Staff Enchanter | 1 Soul Gem: Grand 1 Ingot: Steel 3 Wood |  |
| Arrow: Iron Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Iron 1 Frost Salts |  |
| Arrow: Iron Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Iron 1 Frost Salts |  |
| Arrow: Iron Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Iron 1 Void Salts |  |
| Arrow: Iron Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Iron 1 Void Salts |  |
| Arrow: Silver Fire | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Fire Salts 15 Arrow: Silver |  |
| Arrow: Silver Fire | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Fire Salts 15 Arrow: Silver |  |
| Arrow: Silver Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Frost Salts 15 Arrow: Silver |  |
| Arrow: Silver Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Frost Salts 15 Arrow: Silver |  |
| Arrow: Silver Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Void Salts 15 Arrow: Silver |  |
| Arrow: Silver Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Void Salts 15 Arrow: Silver |  |
| Arrow: Steel Fire | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Steel 1 Fire Salts |  |
| Arrow: Steel Fire | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Steel 1 Fire Salts |  |
| Arrow: Steel Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Steel 1 Frost Salts |  |
| Arrow: Steel Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Steel 1 Frost Salts |  |
| Arrow: Steel Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Steel 1 Void Salts |  |
| Arrow: Steel Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 15 Arrow: Steel 1 Void Salts |  |
| Bolt: Silver Fire | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Silver |  |
| Bolt: Silver Fire | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Fire Salts 15 Bolt: Silver |  |
| Bolt: Silver Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Silver |  |
| Bolt: Silver Ice | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Frost Salts 15 Bolt: Silver |  |
| Bolt: Silver Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Void Salts 15 Bolt: Silver |  |
| Bolt: Silver Shock | 15 | Arcane Craftsmanship,Craftsmanship | Forge | 1 Void Salts 15 Bolt: Silver |  |
| Bolt: Ancient Nordic Hero Fire | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Fire | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Frost | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Frost | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Shock | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Void Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Ancient Nordic Hero Shock | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Void Salts 15 Bolt: Ancient Nordic Hero |  |
| Bolt: Thieves Guild Fire | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Fire | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Frost | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Frost | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Shock | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Void Salts 15 Bolt: Thieves Guild |  |
| Bolt: Thieves Guild Shock | 15 | Arcane Craftsmanship,Advanced Blacksmithing | Forge | 1 Void Salts 15 Bolt: Thieves Guild |  |
| Arrow: Elven Fire | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 15 Arrow: Elven 1 Fire Salts |  |
| Arrow: Elven Fire | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 15 Arrow: Elven 1 Fire Salts |  |
| Arrow: Elven Ice | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 15 Arrow: Elven 1 Frost Salts |  |
| Arrow: Elven Ice | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 15 Arrow: Elven 1 Frost Salts |  |
| Arrow: Elven Shock | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 15 Arrow: Elven 1 Void Salts |  |
| Arrow: Elven Shock | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 15 Arrow: Elven 1 Void Salts |  |
| Bolt: Elven Fire | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Elven |  |
| Bolt: Elven Fire | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Elven |  |
| Bolt: Elven Ice | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Elven |  |
| Bolt: Elven Ice | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Elven |  |
| Bolt: Elven Shock | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 1 Void Salts 15 Bolt: Elven |  |
| Bolt: Elven Shock | 15 | Arcane Craftsmanship,Elven Blacksmithing | Forge | 1 Void Salts 15 Bolt: Elven |  |
| Arrow: Ebony Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 15 Arrow: Ebony 1 Fire Salts |  |
| Arrow: Ebony Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 15 Arrow: Ebony 1 Fire Salts |  |
| Arrow: Ebony Ice | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 15 Arrow: Ebony 1 Frost Salts |  |
| Arrow: Ebony Ice | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 15 Arrow: Ebony 1 Frost Salts |  |
| Arrow: Ebony Shock | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 15 Arrow: Ebony 1 Void Salts |  |
| Arrow: Ebony Shock | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 15 Arrow: Ebony 1 Void Salts |  |
| Bolt: Dark Brotherhood Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Frost | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Frost | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Shock | 25 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Void Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Dark Brotherhood Shock | 25 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Void Salts 15 Bolt: Dark Brotherhood |  |
| Bolt: Ebony Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Fire | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Ice | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Ice | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Shock | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Void Salts 15 Bolt: Ebony |  |
| Bolt: Ebony Shock | 15 | Arcane Craftsmanship,Ebony Blacksmithing | Forge | 1 Void Salts 15 Bolt: Ebony |  |
| Arrow: Glass Fire | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 15 Arrow: Glass 1 Fire Salts |  |
| Arrow: Glass Fire | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 15 Arrow: Glass 1 Fire Salts |  |
| Arrow: Glass Ice | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 15 Arrow: Glass 1 Frost Salts |  |
| Arrow: Glass Ice | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 15 Arrow: Glass 1 Frost Salts |  |
| Arrow: Glass Shock | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 15 Arrow: Glass 1 Void Salts |  |
| Arrow: Glass Shock | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 15 Arrow: Glass 1 Void Salts |  |
| Bolt: Glass Fire | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Glass |  |
| Bolt: Glass Fire | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Glass |  |
| Bolt: Glass Ice | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Glass |  |
| Bolt: Glass Ice | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Glass |  |
| Bolt: Glass Shock | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 1 Void Salts 15 Bolt: Glass |  |
| Bolt: Glass Shock | 15 | Arcane Craftsmanship,Glass Blacksmithing | Forge | 1 Void Salts 15 Bolt: Glass |  |
| Arrow: Nordic Fire | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Forge | 1 Fire Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Fire | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Forge | 1 Fire Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Frost | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Forge | 1 Frost Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Frost | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Forge | 1 Frost Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Shock | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Forge | 1 Void Salts 15 Arrow: Nordic |  |
| Arrow: Nordic Shock | 15 | Arcane Craftsmanship,Nordic Blacksmithing | Forge | 1 Void Salts 15 Arrow: Nordic |  |
| Arrow: Dragonbone Fire | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Fire Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Fire | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Fire Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Ice | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Frost Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Ice | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Frost Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Shock | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Void Salts 15 Arrow: Dragonbone |  |
| Arrow: Dragonbone Shock | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Void Salts 15 Arrow: Dragonbone |  |
| Bolt: Dragonbone Fire | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Fire | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Ice | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Ice | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Shock | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Void Salts 15 Bolt: Dragonbone |  |
| Bolt: Dragonbone Shock | 15 | Arcane Craftsmanship,Draconic Blacksmithing | Forge | 1 Void Salts 15 Bolt: Dragonbone |  |
| Arrow: Daedric Fire | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 15 Arrow: Daedric 1 Fire Salts |  |
| Arrow: Daedric Fire | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 15 Arrow: Daedric 1 Fire Salts |  |
| Arrow: Daedric Ice | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 15 Arrow: Daedric 1 Frost Salts |  |
| Arrow: Daedric Ice | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 15 Arrow: Daedric 1 Frost Salts |  |
| Arrow: Daedric Shock | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 15 Arrow: Daedric 1 Void Salts |  |
| Arrow: Daedric Shock | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 15 Arrow: Daedric 1 Void Salts |  |
| Bolt: Daedric Fire | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 1 Fire Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Fire | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 1 Fire Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Ice | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 1 Frost Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Ice | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 1 Frost Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Shock | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 1 Void Salts 15 Bolt: Daedric |  |
| Bolt: Daedric Shock | 15 | Arcane Craftsmanship,Daedric Smithing | Forge | 1 Void Salts 15 Bolt: Daedric |  |
| Arrow: Dwarven Fire | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 15 Arrow: Dwarven 1 Fire Salts |  |
| Arrow: Dwarven Fire | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 15 Arrow: Dwarven 1 Fire Salts |  |
| Arrow: Dwarven Ice | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 15 Arrow: Dwarven 1 Frost Salts |  |
| Arrow: Dwarven Ice | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 15 Arrow: Dwarven 1 Frost Salts |  |
| Arrow: Dwarven Shock | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 15 Arrow: Dwarven 1 Void Salts |  |
| Arrow: Dwarven Shock | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 15 Arrow: Dwarven 1 Void Salts |  |
| Bolt: Dwarven Fire | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Fire | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Ice | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Ice | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Shock | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 1 Void Salts 15 Bolt: Dwarven |  |
| Bolt: Dwarven Shock | 15 | Arcane Craftsmanship,Dwarven Blacksmithing | Forge | 1 Void Salts 15 Bolt: Dwarven |  |
| Arrow: Stalhrim Fire | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Fire Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Fire | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Fire Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Frost | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Frost Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Frost | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Frost Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Shock | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Void Salts 15 Arrow: Stalhrim |  |
| Arrow: Stalhrim Shock | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Void Salts 15 Arrow: Stalhrim |  |
| Bolt: Stalhrim Fire | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Fire Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Fire | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Fire Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Frost | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Frost Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Frost | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Frost Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Shock | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Void Salts 15 Bolt: Stalhrim |  |
| Bolt: Stalhrim Shock | 15 | Arcane Craftsmanship,Stalhrim Smithing | Forge | 1 Void Salts 15 Bolt: Stalhrim |  |
| Arrow: Orcish Fire | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 15 Arrow: Orcish 1 Fire Salts |  |
| Arrow: Orcish Fire | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 15 Arrow: Orcish 1 Fire Salts |  |
| Arrow: Orcish Ice | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 15 Arrow: Orcish 1 Frost Salts |  |
| Arrow: Orcish Ice | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 15 Arrow: Orcish 1 Frost Salts |  |
| Arrow: Orcish Shock | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 15 Arrow: Orcish 1 Void Salts |  |
| Arrow: Orcish Shock | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 15 Arrow: Orcish 1 Void Salts |  |
| Bolt: Orcish Fire | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Fire | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 1 Fire Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Ice | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Ice | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 1 Frost Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Shock | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 1 Void Salts 15 Bolt: Orcish |  |
| Bolt: Orcish Shock | 15 | Arcane Craftsmanship,Orcish Blacksmithing | Forge | 1 Void Salts 15 Bolt: Orcish |  |
| Stalhrim Staff of Paralysis | 1 | Artificer's Insight | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of Paralysis | 1 | Artificer's Insight | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Frost Atronach | 1 | Artificer's Insight | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Frost Atronach | 1 | Artificer's Insight | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Storm Atronach | 1 | Artificer's Insight | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Storm Atronach | 1 | Artificer's Insight | Staff Enchanter | 1 Soul Gem: Grand 1 Stalhrim Battlestaff |  |
| Soul Gem: Black | 1 | Soul Gem Mastery | N/A | 1 Soul Gem: Grand 1 Human Skull | Between 11pm -  Midnight, Must be Carrying Necromacers Amulet.  must have 100+ Enchanting skill |
| Soul Gem: Common | 1 | Soul Gem Mastery | N/A | 1 Ingot: Moonstone 1 Ingot: Quicksilver |  |
| Soul Gem: Grand | 1 | Soul Gem Mastery | N/A | 3 Ingot: Moonstone 3 Ingot: Quicksilver |  |
| Soul Gem: Greater | 1 | Soul Gem Mastery | N/A | 2 Ingot: Moonstone 2 Ingot: Quicksilver |  |
| Soul Gem: Lesser | 2 | Soul Gem Mastery | N/A | 1 Ingot: Moonstone 1 Ingot: Quicksilver |  |
| Soul Gem: Petty | 4 | Soul Gem Mastery | N/A | 1 Ingot: Moonstone 1 Ingot: Quicksilver |  |
| Throwable Flame Powder | 3 | Alchemical Lore 2 | N/A | 1 Fire Salts 1 Dwarven Oil |  |
| Throwable Frost Powder | 3 | Alchemical Lore 2 | N/A | 1 Frost Salts 1 Dwarven Oil |  |
| Throwable Shock Powder | 3 | Alchemical Lore 2 | N/A | 1 Void Salts 1 Dwarven Oil |  |
| Portable Enchanting Supplies | 1 | Enchanter's Insight | N/A | 1 Troll Skull 4 Spriggan Sap 1 Gem: Amethyst (Flawless) |  |
| Staff of Banishing | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Banishing | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Calm | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Calm | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Chain Lightning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Chain Lightning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Courage | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 1 Heart Stone |  |
| Staff of Courage | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 1 Heart Stone |  |
| Staff of Daedric Command | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Daedric Command | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Dread Zombies | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Dread Zombies | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Expulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Expulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Fear | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Fear | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Fireballs | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Fireballs | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Firebolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Firebolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Flames | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Flames | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Frenzy | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Frenzy | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Frostbite | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Frostbite | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Fury | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Fury | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Grand Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Grand Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Heal Other | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Heal Other | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Ice Spikes | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Ice Spikes | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Ice Storms | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Ice Storms | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Icy Spears | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Icy Spears | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Incineration | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Incineration | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Inspiration | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Inspiration | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Lightning Bolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Lightning Bolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Magelight | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Alteration 2 Heart Stone |  |
| Staff of Magelight | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Alteration 2 Heart Stone |  |
| Staff of Minor Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of Minor Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of Paralysis | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Alteration 4 Heart Stone |  |
| Staff of Paralysis | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Alteration 4 Heart Stone |  |
| Staff of Reanimation | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Reanimation | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Repulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Repulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Repulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Repulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Revenants | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Revenants | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Soul Trapping | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Soul Trapping | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Sparks | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Sparks | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of the Flame Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of the Flame Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of the Flame Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Flame Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Frost Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of the Frost Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of the Frost Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Frost Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Healing Hand | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of the Healing Hand | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of the Spirit Wolf | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of the Spirit Wolf | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of the Storm Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of the Storm Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of the Storm Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Storm Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Thunderbolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Thunderbolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Vanquishing | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 4 Heart Stone |  |
| Staff of Vanquishing | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 4 Heart Stone |  |
| Staff of Zombies | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of Zombies | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Lockpick | 1 | Cheap Tricks,Craftsmanship | Forge | 4 Fragment: Iron |  |
| Lockpick | 5 | Cheap Tricks,Craftsmanship | Forge | 1 Ingot: Iron |  |
| Lockpick | 1 | Cheap Tricks,Craftsmanship | Forge | 4 Fragment: Iron |  |
| Lockpick | 5 | Cheap Tricks,Craftsmanship | Forge | 1 Ingot: Iron |  |


</div>
