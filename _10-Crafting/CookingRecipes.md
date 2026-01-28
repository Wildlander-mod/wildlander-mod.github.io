---
title: Cooking Recipes
layout: default
nav_order: 7
has_children: false
description: Food and cooking recipes.
---

## Cooking and Food Preparation

Prepare meals and food items at a **Oven**, **Campfire** or **Cooking Pot**. Cooking provides essential sustenance, Warmth and Buffs, but does not give crafting XP.

**Available cooking includes:**
- Meal preparation from raw ingredients
- Soup and stew creation
- Bread and pastry baking
- Food preservation and storage

**Why cooking matters:**
- Provides health recovery and stamina restoration
- Creates valuable items for trading
- Essential for long journeys and survival

**Tip:** Start cooking raw meat early - it's an easy way to create valuable, lightweight items Which provide lifesaving stamina regeneration.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/_10-Crafting/1.1-Crafting-System/).

---

<style>
#cooking-tooltip {
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

#cooking-tooltip div {
  margin: 4px 0;
}

#cooking-tooltip strong {
  color: #f77ef1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initCookingRecipestooltips() {
  const table = document.querySelector('.cooking-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showCookingRecipestooltip(e, row));
    itemCell.addEventListener('mousemove', updateCookingRecipestooltipPosition);
    itemCell.addEventListener('mouseleave', hideCookingRecipestooltip);
  });
}

function showCookingRecipestooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    type: cells[1]?.textContent || '',
    effects: cells[2]?.textContent || '',
    itemsRequired: cells[3]?.textContent || '',
    qtyMade: cells[4]?.textContent || '',
    perksNeeded: cells[5]?.textContent || '',
    toolkitsRequired: cells[6]?.textContent || '',
    proximity: cells[7]?.textContent || '',
    additionalRequirements: cells[8]?.textContent || ''
  };
  
  let tooltip = document.getElementById('cooking-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'cooking-tooltip';
    tooltip.className = 'cooking-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Type:</strong> ${data.type}</div>
    <div><strong>Effects:</strong> ${data.effects}</div>
    <div><strong>Items Required:</strong> ${data.itemsRequired}</div>
    <div><strong>Qty Made:</strong> ${data.qtyMade}</div>
    <div><strong>Perks Needed:</strong> ${data.perksNeeded}</div>
    <div><strong>Toolkits Required:</strong> ${data.toolkitsRequired}</div>
    <div><strong>Proximity:</strong> ${data.proximity}</div>
    <div><strong>Additional Requirements:</strong> ${data.additionalRequirements}</div>
  `;
  tooltip.style.display = 'block';
  updateCookingRecipestooltipPosition(event);
}

function updateCookingRecipestooltipPosition(event) {
  const tooltip = document.getElementById('cooking-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideCookingRecipestooltip() {
  const tooltip = document.getElementById('cooking-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initCookingRecipesFilters() {
  const table = document.querySelector('.cooking-recipes-table table');
  if (!table) {
    console.warn('Cooking Recipes table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const types = new Set();
  const toolkits = new Set();
  const perks = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 9) {
      types.add(cells[1].textContent.trim());
      const toolkitCell = cells[6].textContent.trim();
      if (toolkitCell && toolkitCell !== 'N/A') {
        toolkits.add(toolkitCell);
      }
      const perksCell = cells[5].textContent.trim();
      if (perksCell && perksCell !== '') {
        perks.add(perksCell);
      }
    }
  });
  
  const typeSelect = document.getElementById('typeFilter');
  const toolkitSelect = document.getElementById('toolkitFilter');
  const perksSelect = document.getElementById('perksFilter');
  
  Array.from(types).sort().forEach(type => {
    const option = document.createElement('option');
    option.value = type;
    option.textContent = type;
    typeSelect.appendChild(option);
  });
  
  Array.from(toolkits).sort().forEach(toolkit => {
    const option = document.createElement('option');
    option.value = toolkit;
    option.textContent = toolkit;
    toolkitSelect.appendChild(option);
  });
  
  Array.from(perks).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perksSelect.appendChild(option);
  });
  
  document.getElementById('cookingRecipesSearch').addEventListener('input', filterCookingRecipesTable);
  typeSelect.addEventListener('change', filterCookingRecipesTable);
  toolkitSelect.addEventListener('change', filterCookingRecipesTable);
  perksSelect.addEventListener('change', filterCookingRecipesTable);
  
  initCookingRecipestooltips();
  updateFilterCountCooking();
}

function filterCookingRecipesTable() {
  const table = document.querySelector('.cooking-recipes-table table');
  if (!table) return;
  
  const searchTerm = document.getElementById('cookingRecipesSearch').value.toLowerCase();
  const typeFilter = document.getElementById('typeFilter').value;
  const toolkitFilter = document.getElementById('toolkitFilter').value;
  const perksFilter = document.getElementById('perksFilter').value;
  
  const rows = table.querySelectorAll('tbody tr');
  let visibleCount = 0;
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length < 9) return;
    
    const itemName = cells[0].textContent.toLowerCase();
    const type = cells[1].textContent.trim();
    const effects = cells[2].textContent.toLowerCase();
    const itemsRequired = cells[3].textContent.toLowerCase();
    const perks = cells[5].textContent.trim();
    const toolkits = cells[6].textContent.trim();
    
    const matchesSearch = !searchTerm || 
                         itemName.includes(searchTerm) ||
                         effects.includes(searchTerm) ||
                         itemsRequired.includes(searchTerm);
    
    const matchesType = !typeFilter || type === typeFilter;
    const matchesToolkit = !toolkitFilter || toolkits === toolkitFilter;
    const matchesPerks = !perksFilter || perks === perksFilter;
    
    const isVisible = matchesSearch && matchesType && matchesToolkit && matchesPerks;
    row.style.display = isVisible ? '' : 'none';
    
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountCooking(visibleCount, rows.length);
  initCookingRecipestooltips();
}

function updateFilterCountCooking(visible, total) {
  const table = document.querySelector('.cooking-recipes-table table');
  if (!table) return;
  
  if (visible === undefined) {
    visible = Array.from(table.querySelectorAll('tbody tr')).filter(row => row.style.display !== 'none').length;
    total = table.querySelectorAll('tbody tr').length;
  }
  
  const countElement = document.getElementById('filterResultCountCooking');
  if (countElement) {
    countElement.textContent = `Showing ${visible} of ${total} recipes`;
  }
}

function clearCookingRecipesFilters() {
  document.getElementById('cookingRecipesSearch').value = '';
  document.getElementById('typeFilter').value = '';
  document.getElementById('toolkitFilter').value = '';
  document.getElementById('perksFilter').value = '';
  filterCookingRecipesTable();
}

initCookingRecipesFilters();

});
</script>

## How to Use This Page

**Hover over any Item Name** to see the complete details including:
- Full effects description
- All items required for the recipe
- Additional perks and toolkit requirements
- Special conditions and quest requirements

Use the search bar and filters below to find specific recipes by type, toolkit, or perks needed.

---

## Cooking Recipes Data

<div class="cooking-recipes-controls">
  <input type="text" id="cookingRecipesSearch" placeholder="Search" />
  <select id="typeFilter">
    <option value="">All Types</option>
  </select>
  <select id="toolkitFilter">
    <option value="">All Toolkits</option>
  </select>
  <select id="perksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersRecipes" onclick="clearCookingRecipesFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-recipes" id="filterResultCountRecipes"></div>

<div class="cooking-recipes-table" markdown="1">

| Item Name | Type | Effects | Items Required | Qty Made | Perks Needed | Toolkits Required | Proximity | Additional Requirements |
|-----------|------|---------|-----------------|----------|--------------|-------------------|-----------|-------------------------|
| Ale | Alcohol | Numbs your sense of pain, making you feel 15 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 10% and twice that for Magicka for 450 seconds. At least you get to feel good for a while! | 4 Wheat | 2 |  | N/A | Brewing Barrel |  |
| Ashfire Mead | Alcohol | Numbs your sense of pain, making you feel 80 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 25% and twice that for Magicka for 450 seconds. At least you get to feel good for a while! | 1 Juniper Berries 1 Honey 1 Ashen Grass Pod | 2 |  | N/A | Brewing Barrel | Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete |
| Black-Briar Reserve | Alcohol | Numbs your sense of pain, making you feel 100 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 50% and twice that for Magicka for 900 seconds. At least you get to feel good for a while! | 4 Wheat | 2 |  | N/A | Brewing Barrel |  |
| Cinnabar Beer | Alcohol | This ale smells of minerals leached from the volcanic wastelands. Enhances your focus, giving you 15 extra points of magicka for 300 seconds.,That might feel good for a short time... or it might just shorten your time. | 1 Ale 1 Jazbay Grapes 1 Creep Cluster | 1 |  | N/A | Brewing Barrel | Sidequest - On Hogithum Complete |
| Cliff Racer | Alcohol | Numbs your sense of pain, making you feel 70 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 40% and twice that for Magicka for 900 seconds. At least you get to feel good for a while!,Resists 10% of frost damage for 600 seconds. | 1 Firebrand Wine 1 Cyrodilic Brandy 1 Flin 1 Sujamma | 4 |  | N/A | Brewing Barrel |  |
| Dragon's Breath Mead | Alcohol | Numbs your sense of pain, making you feel 55 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 450 seconds. At least you get to feel good for a while! | 2 Dragon's Tongue 1 Honey | 2 |  | N/A | Brewing Barrel |  |
| Honningbrew Mead | Alcohol | Numbs your sense of pain, making you feel 50 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 20% and twice that for Magicka for 450 seconds. At least you get to feel good for a while! | 2 Green Apple 1 Honey | 2 |  | N/A | Brewing Barrel |  |
| Juniper Berry Mead | Alcohol | Numbs your sense of pain, making you feel 40 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 20% and twice that for Magicka for 450 seconds. At least you get to feel good for a while!,Health regenerates 25% faster for 300 seconds. | 2 Juniper Berries 1 Honey | 2 |  | N/A | Brewing Barrel |  |
| Nord Mead | Alcohol | Numbs your sense of pain, making you feel 20 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 15% and twice that for Magicka for 450 seconds. At least you get to feel good for a while! | 1 Honey | 2 |  | N/A | Brewing Barrel |  |
| White-Gold Tower | Alcohol | Numbs your sense of pain, making you feel 60 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 900 seconds. At least you get to feel good for a while!,Resists 10% of fire damage for 600 seconds. | 1 Nord Mead 1 Lavender 1 Dragon's Tongue 1 Bottled Milk | 2 |  | N/A | Brewing Barrel |  |
| Butter | Dairy | Consumed out of combat, it restores 2 Stamina and Magicka. | 1 Bottled Milk | 1 |  | N/A | Butter Churn |  |
| Ale Braised Sabre Cat | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds. | 1 Ale 1 Raw Sabre Cat Meat | 1 |  | Chefs | Cook pot |  |
| Apple Cabbage Stew | Stew | Consumed out of combat, it restores 50 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Bear and Bear Chowder | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth by <25> points. | 1 Ale 1 Goat Cheese Slice 1 Blue Mountain Flower 1 Bottled Milk 1 Raw Bear Meat | 2 |  | Chefs | Cook pot |  |
| Bear Carrot Stew | Stew | Consumed out of combat, it restores 25 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth by <25> points. | 1 Carrot 1 Raw Bear Meat 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Bear Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Bear Meat | 3 |  | Chefs | Cook pot |  |
| Beef Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Beef | 3 |  | Chefs | Cook pot |  |
| Beef Stew | Stew | Consumed out of combat, it restores 75 Stamina and Magicka.,Health is increased by 50 points for 1800 seconds.,Carry weight is increased by 25 points for 1800 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Garlic 1 Carrot 1 Raw Beef 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Beggar's Broth | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Carry weight is increased by 35 points for 7200 seconds.,Your meal improves your warmth by <25> points. | 1 Raw Horse Meat 2 Purple Mountain Flower 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Bestial Stew | Stew | A stew tartare which restores 2 Stamina per second for 1800 seconds.,Consumed out of combat, it restores 200 Stamina and Magicka.,Your meal improves your warmth by <25> points.,Only those with a strong stomach can enjoy this meal without vomiting. | 1 Raw Salmon Steak 1 Bottled Milk 1 Wolf Heart 3 Raw Wolf Meat | 1 |  | Chefs | Cook pot |  |
| Boar Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Boar Meat | 3 |  | Chefs | Cook pot |  |
| Boar Leek Stew | Stew | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 900 seconds.,Your meal improves your warmth by <25> points. | 1 Leek 1 Raw Boar Meat 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Boar Potato Stew | Stew | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 900 seconds.,Your meal improves your warmth by <25> points. | 1 Potato 1 Raw Boar Meat 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Boiled Cabbage and Mammoth | Cooked Meal | Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth by <25> points. | 1 Cabbage 1 Raw Mammoth Meat | 2 |  | Chefs | Cook pot |  |
| Breaded Elk Cutlet | Bread | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds. | 1 Chicken's Egg 1 Bread Loaf 1 Raw Elk Meat | 2 |  | Chefs | Cook pot |  |
| Cabbage Potato Soup | Soup | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 20% faster for 1200 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Cabbage 1 Potato 1 Leek 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Cabbage Soup | Soup | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 15% faster for 1200 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Cabbage 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Chaurus Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Chaurus Meat | 4 |  | Chefs | Cook pot |  |
| Cheesy Potato Mammoth | Cooked Meal | Consumed out of combat, it restores 25 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth by <25> points. | 1 Nord Mead 1 Goat Cheese Slice 1 Potato 1 Bottled Milk 1 Raw Mammoth Meat | 2 |  | Chefs | Cook pot |  |
| Chicken Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Chicken Breast | 3 |  | Chefs | Cook pot |  |
| Clam Chowder | Cooked Meal | Consumed out of combat, it restores 75 Stamina and Magicka.,Your meal improves your warmth by <25> points. | 1 Potato 1 Raw Clam Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Cooked Angelfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Angelfish | 1 |  | N/A | Cook pot |  |
| Cooked Angler | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Angler | 1 |  | N/A | Cook pot |  |
| Cooked Angler Larvae | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <6> points of Hunger.] | 1 Angler Larvae | 1 |  | N/A | Cook pot |  |
| Cooked Arctic Char | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Arctic Char | 1 |  | N/A | Cook pot |  |
| Cooked Arctic Grayling | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Arctic Grayling | 1 |  | N/A | Cook pot |  |
| Cooked Bear Meat | Roasted food | Consumed out of combat, it restores 65 Stamina and Magicka. | 1 Raw Bear Meat | 1 |  | N/A | Cook pot |  |
| Cooked Beef | Roasted food | Consumed out of combat, it restores 140 Stamina. | 1 Raw Beef | 1 |  | N/A | Cook pot |  |
| Cooked Brook Bass | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Brook Bass | 1 |  | N/A | Cook pot |  |
| Cooked Carp | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Carp | 1 |  | N/A | Cook pot |  |
| Cooked Catfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Catfish | 1 |  | N/A | Cook pot |  |
| Cooked Chaurus Meat | Roasted food | Consumed out of combat, it restores 10 Stamina and Magicka. | 1 Raw Chaurus Meat | 1 |  | N/A | Cook pot |  |
| Cooked Chicken Breast | Roasted food | Consumed out of combat, it restores 50 Stamina. | 2 Raw Chicken Breast | 1 |  | N/A | Cook pot |  |
| Cooked Cod | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Cod | 1 |  | N/A | Cook pot |  |
| Cooked Direfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Direfish | 1 |  | N/A | Cook pot |  |
| Cooked Dog Meat | Roasted food | Consumed out of combat, it restores 15 Stamina and Magicka. | 1 Raw Dog Meat | 1 |  | N/A | Cook pot |  |
| Cooked Dragon Meat | Roasted food | Consumed out of combat, it restores 30 Stamina and Magicka.,Restores 1 points of Stamina per second for 5400 seconds. | 1 Raw Dragon Meat | 1 |  | N/A | Cook pot |  |
| Cooked Elk Meat | Roasted food | Consumed out of combat, it restores 20 Stamina and Magicka. | 1 Raw Elk Meat | 1 |  | N/A | Cook pot |  |
| Cooked Fat | Roasted food | Consumed out of combat, it restores 1 Stamina. | 1 Animal Fat | 1 |  | N/A | Cook pot |  |
| Cooked Fox Meat | Roasted food | Consumed out of combat, it restores 10 Stamina and Magicka. | 1 Raw Fox Meat | 1 |  | N/A | Cook pot |  |
| Cooked Glass Catfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Glass Catfish | 1 |  | N/A | Cook pot |  |
| Cooked Glassfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Glassfish | 1 |  | N/A | Cook pot |  |
| Cooked Goat Leg | Roasted food | Consumed out of combat, it restores 130 Stamina. | 1 Raw Goat Leg | 1 |  | N/A | Cook pot |  |
| Cooked Goat Meat | Roasted food | Consumed out of combat, it restores 40 Stamina and Magicka. | 1 Raw Goat Meat | 1 |  | N/A | Cook pot |  |
| Cooked Goldfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Goldfish | 1 |  | N/A | Cook pot |  |
| Cooked Horker Meat | Roasted food | Consumed out of combat, it restores 110 Stamina. | 1 Raw Horker Meat | 1 |  | N/A | Cook pot |  |
| Cooked Horse Meat | Roasted food | Consumed out of combat, it restores 120 Stamina. | 1 Raw Horse Meat | 1 |  | N/A | Cook pot |  |
| Cooked Juvenile Mudcrab | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Juvenile Mudcrab | 1 |  | N/A | Cook pot |  |
| Cooked Leeks | Roasted food | Consumed out of combat, it restores 15 Stamina and Magicka. | 1 Leek | 1 |  | N/A | Cook pot |  |
| Cooked Lyretail Anthias | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Lyretail Anthias | 1 |  | N/A | Cook pot |  |
| Cooked Mammoth Meat | Roasted food | Consumed out of combat, it restores 80 Stamina and Magicka. | 1 Raw Mammoth Meat | 1 |  | N/A | Cook pot |  |
| Cooked Mammoth Snout | Roasted food | Consumed out of combat, it restores 200 Stamina. | 1 Raw Mammoth Snout | 1 |  | N/A | Cook pot |  |
| Cooked Mudcrab | Roasted food | Consumed out of combat, it restores 10 Stamina and Magicka. | 1 Raw Mudcrab Meat | 1 |  | N/A | Cook pot |  |
| Cooked Mudcrab Legs | Roasted food | Consumed out of combat, it restores 40 Stamina. | 1 Raw Mudcrab Legs | 1 |  | N/A | Cook pot |  |
| Cooked Pearlfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Pearlfish | 1 |  | N/A | Cook pot |  |
| Cooked Pheasant Breast | Roasted food | Consumed out of combat, it restores 50 Stamina. | 1 Raw Pheasant Breast | 1 |  | N/A | Cook pot |  |
| Cooked Pogfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Pogfish | 1 |  | N/A | Cook pot |  |
| Cooked Potatoes | Roasted food | Consumed out of combat, it restores 10 Stamina and Magicka. | 1 Potato | 1 |  | N/A | Cook pot |  |
| Cooked Pygmy Sunfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Pygmy Sunfish | 1 |  | N/A | Cook pot |  |
| Cooked Rabbit Leg | Roasted food | Consumed out of combat, it restores 50 Stamina. | 1 Raw Rabbit Leg | 1 |  | N/A | Cook pot |  |
| Cooked Rabbit Meat | Roasted food | Consumed out of combat, it restores 20 Stamina and Magicka. | 1 Raw Rabbit Meat | 1 |  | N/A | Cook pot |  |
| Cooked Sabre Cat Meat | Roasted food | Consumed out of combat, it restores 50 Stamina and Magicka. | 1 Raw Sabre Cat Meat | 1 |  | N/A | Cook pot |  |
| Cooked Salmon Steak | Roasted food | Consumed out of combat, it restores 40 Stamina. | 1 Raw Salmon Steak | 1 |  | N/A | Cook pot |  |
| Cooked Salmon Steak | Roasted food | Consumed out of combat, it restores 40 Stamina. | 1 Raw Salmon | 2 |  | N/A | Cook pot |  |
| Cooked Scorpion Fish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Scorpion Fish | 1 |  | N/A | Cook pot |  |
| Cooked Skeever Meat | Roasted food | Consumed out of combat, it restores 30 Stamina. | 1 Raw Skeever Meat | 1 |  | N/A | Cook pot |  |
| Cooked Slaughterfish | Roasted food | Consumed out of combat, it restores 50 Stamina. | 1 Raw Slaughterfish | 3 |  | N/A | Cook pot |  |
| Cooked Spadefish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Spadefish | 1 |  | N/A | Cook pot |  |
| Cooked Spider Meat | Roasted food | Consumed out of combat, it restores 10 Stamina and Magicka.,Sticky and sweet. | 1 Raw Spider Meat | 1 |  | N/A | Cook pot |  |
| Cooked Tripod Spiderfish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Tripod Spiderfish | 1 |  | N/A | Cook pot |  |
| Cooked Troll Meat | Roasted food | Consumed out of combat, it restores 20 Stamina and Magicka. | 1 Raw Troll Meat | 1 |  | N/A | Cook pot |  |
| Cooked Vampire Fish | Roasted food | Consumed out of combat, it restores 40 Stamina.,[SURV=Reduce <60> points of Hunger.] | 1 Raw Vampire Fish | 1 |  | N/A | Cook pot |  |
| Cooked Venison | Roasted food | Consumed out of combat, it restores 150 Stamina. | 1 Raw Venison | 1 |  | N/A | Cook pot |  |
| Cooked Wolf Meat | Roasted food | Consumed out of combat, it restores 35 Stamina and Magicka. | 1 Raw Wolf Meat | 1 |  | N/A | Cook pot |  |
| Crab Stew | Stew | Consumed out of combat, it restores 75 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth by <25> points. | 1 Garlic 1 Potato 1 Leek 1 Raw Mudcrab Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Creamy Crab Bisque | Cooked Meal | Consumed out of combat, it restores 40 Stamina and Magicka.,Stamina is increased by 25 points for 1200 seconds.,Your meal improves your warmth by <25> points.,Restores 1 points of Magicka per second for 1200 seconds. | 1 Salt 1 Flour 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Deviled Chaurus | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds. | 1 Thistle Branch 1 Bleeding Crown 1 Raw Chaurus Meat | 1 |  | Chefs | Cook pot |  |
| Dog Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,A cheap iron ration. | 6 Salt 1 Raw Dog Meat | 3 |  | Chefs | Cook pot |  |
| Dragon Blood Pudding | Cooked Meal | Health regenerates 4% faster for 600 seconds.,Restores 2 points of Stamina per second for 3000 seconds.,Your meal improves your warmth by <25> points. | 1 Jazbay Grapes 1 Moon Sugar 1 Dragon's Blood | 1 |  | Chefs | Cook pot |  |
| Dragon Heart Stew | Stew | Consumed out of combat, it restores 45 Stamina and Magicka.,Resists 15% of fire damage for 3000 seconds.,Your meal improves your warmth by <25> points.,Called revenge if served chilled. | 1 Ale 1 Fire Salts 1 Potato 1 Tomato 1 Dragon Heart | 1 |  | Chefs | Cook pot |  |
| Dragon Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Dragon Meat | 4 |  | Chefs | Cook pot |  |
| Dragon Stuffed Rabbit | Cooked Meal | Consumed out of combat, it restores 5 Stamina and Magicka.,Restores 1 points of Stamina per second for 6000 seconds.,An excellent ironic ration. | 2 Dragon's Tongue 1 Raw Rabbit Meat | 1 |  | Chefs | Cook pot |  |
| Dragon Vegetable Stew | Stew | Consumed out of combat, it restores 35 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds.,Your meal improves your warmth by <25> points.,Magicka is increased by 20 points for 900 seconds. | 2 Carrot 2 Potato 1 Raw Dragon Meat 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Dried Salmon Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Salmon Steak | 3 |  | Chefs | Cook pot |  |
| Dried Slaughterfish Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,A cheap iron ration. | 6 Salt 1 Raw Slaughterfish | 3 |  | Chefs | Cook pot |  |
| Dye - Black | Cooked Meal |  | 1 Nightshade | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Bleach | Cooked Meal |  | 1 Salt | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Blue | Cooked Meal |  | 1 Blue Mountain Flower | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Blue | Cooked Meal |  | 1 Dye - Indigo 1 Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Brown | Cooked Meal |  | 1 Canis Root | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Brown | Cooked Meal |  | 1 Dye - Black 1 Dye - Tan | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Green | Cooked Meal |  | 1 Hanging Moss | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Green | Cooked Meal |  | 1 Dye - Blue 1 Dye - Yellow | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Grey | Cooked Meal |  | 1 Dye - Black 1 Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Grey | Cooked Meal |  | 1 Giant Lichen | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Indigo | Cooked Meal |  | 1 Deathbell | 4 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Indigo | Cooked Meal |  | 1 Dye - Black 1 Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Orange | Cooked Meal |  | 1 Dye - Red 1 Dye - Yellow | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Orange | Cooked Meal |  | 1 Creep Cluster | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Purple | Cooked Meal |  | 1 Purple Mountain Flower | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Purple | Cooked Meal |  | 1 Dye - Blue 1 Dye - Red | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Red | Cooked Meal |  | 1 Red Mountain Flower | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Tan | Cooked Meal |  | 1 Grass Pod | 1 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Tan | Cooked Meal |  | 1 Dye - Brown 1 Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Dye - Yellow | Cooked Meal |  | 1 Dragon's Tongue | 5 | Craftsmanship,Alchemical Lore 1 | Tailors | Cook pot |  |
| Elf Eared Elk | Cooked Meal | Consumed out of combat, it restores 25 Stamina and Magicka.,Funny garnish, great taste. | 2 Elves Ear 1 Raw Elk Meat | 1 |  | Chefs | Cook pot |  |
| Elsweyr Fondue | Cooked Meal | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka is increased by 50 points for 1800 seconds.,Restores 1 points of Magicka per second for 1800 seconds. | 1 Ale 6 Eidar Cheese Slice 1 Leek 1 Moon Sugar | 1 |  | Chefs | Cook pot |  |
| Farmer's Breakfast | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds. | 1 Tomato 1 Mora Tapinella 1 Raw Boar Meat | 1 |  | Chefs | Cook pot |  |
| Fatty Fin Fry | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds. | 1 Garlic 1 Raw Horker Meat 1 Grass Pod | 1 |  | Chefs | Cook pot |  |
| Fish with Crab Sauce | Cooked Meal | Consumed out of combat, it restores 35 Stamina and Magicka.,Stamina is increased by 10 points for 600 seconds. | 1 Alto Noir Wine 1 Raw Slaughterfish 1 Raw Mudcrab Meat | 2 |  | Chefs | Cook pot |  |
| Flaming Dragon | Cooked Meal | Restores 1 points of Magicka per second for 1200 seconds.,Restores 1 points of Stamina per second for 3000 seconds.,Your meal improves your warmth by <25> points. | 1 Red Mountain Flower 1 Mulled Wine 1 Raw Dragon Meat | 2 |  | Chefs | Cook pot |  |
| Flammable Oil | Cooked Meal |  | 2 Animal Fat | 1 |  | N/A | Cook pot |  |
| Fox Apple Stew | Stew | Consumed out of combat, it restores 15 Stamina and Magicka.,Hunter's comfort food.,Your meal improves your warmth by <25> points. | 1 Green Apple 1 Raw Fox Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Fox Herb Cutlet | Cooked Meal | Consumed out of combat, it restores 30 Stamina and Magicka.,Restores 1 points of Stamina per second for 1200 seconds. | 2 Frost Mirriam 1 Raw Fox Meat | 2 |  | Chefs | Cook pot |  |
| Fox in a Hole | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds. | 1 Carrot 1 Potato 1 Raw Fox Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Fox Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Fox Meat | 3 |  | Chefs | Cook pot |  |
| Garlic Boar | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka. | 1 Salt 1 Garlic 1 Raw Boar Meat | 1 |  | Chefs | Cook pot |  |
| Glass Bottle (Water) | Water | Restores thirst. | 1 Glass Bottle (Salt Water) | 1 |  | N/A | Cook pot |  |
| Glazed Goat Loin | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Magicka regenerates 1% faster for 600 seconds. | 2 Snowberries 1 Honey 1 Raw Goat Meat | 1 |  | Chefs | Cook pot |  |
| Goat and Potato Stew | Stew | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth by <25> points. | 1 Potato 1 Raw Goat Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Goat Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,A cheap iron ration. | 6 Salt 1 Raw Goat Leg | 3 |  | Chefs | Cook pot |  |
| Goat Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,A cheap iron ration. | 6 Salt 1 Raw Goat Meat | 3 |  | Chefs | Cook pot |  |
| High King's Stew | Stew | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth by <25> points. | 1 Carrot 1 Leek 1 Raw Dragon Meat | 2 |  | Chefs | Cook pot |  |
| Honeyed Mammoth Roast | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds. | 1 Honey 1 Raw Mammoth Meat | 1 |  | Chefs | Cook pot |  |
| Horker and Ash Yam Stew | Stew | Consumed out of combat, it restores 150 Stamina and Magicka.,Restores 1 points of Stamina per second for 3200 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Garlic 1 Raw Horker Meat 3 Ash Yam 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Horker Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Horker Meat | 3 |  | Chefs | Cook pot |  |
| Horker Stew | Stew | Consumed out of combat, it restores 75 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth by <25> points. | 1 Garlic 1 Lavender 1 Tomato 1 Raw Horker Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Horse Jerky | Jerky | Consumed out of combat, it restores 10 Stamina and Magicka.,A cheap iron ration. | 6 Salt 1 Raw Horse Meat | 3 |  | Chefs | Cook pot |  |
| Hot Honey Horker | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,A delight on cold Skyrim nights.,Restores 1 points of Stamina per second for 3000 seconds. | 1 Raw Horker Meat 1 Honey | 1 |  | Chefs | Cook pot |  |
| Hunter's Hearty Stew | Stew | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth by <25> points. | 1 Cabbage 1 Potato 1 Raw Venison 1 Raw Elk Meat 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Juniper Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,This earthy tea slightly improves your warmth and stamina.,Your meal improves your warmth by <25> points. | 3 Juniper Berries 1 Honeycomb 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Lavender Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,This delicate tea slightly improves your warmth and magicka.,Your meal improves your warmth by <25> points. | 2 Lavender 3 Purple Mountain Flower 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Mammoth Balls | Cooked Meal | Consumed out of combat, it restores 5 Stamina and Magicka., | 1 Garlic 1 Tomato 1 Raw Mammoth Meat | 6 |  | Chefs | Cook pot |  |
| Mammoth Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,The iron ration of choice for the truly hardened northern hunter. | 6 Salt 1 Raw Mammoth Meat | 4 |  | Chefs | Cook pot |  |
| Mammoth Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,The iron ration of choice for the truly hardened northern hunter. | 6 Salt 1 Raw Mammoth Snout | 3 |  | Chefs | Cook pot |  |
| Mammoth Tomato Stew | Stew | Consumed out of combat, it restores 25 Stamina and Magicka.,Restores 1 points of Stamina per second for 7200 seconds.,Your meal improves your warmth by <25> points. | 2 Tomato 1 Raw Mammoth Meat 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Marinated Mammoth in Elsweyr Sauce | Cooked Meal | Restores 1 points of Stamina per second for 7200 seconds.,A long-forgotten secret recipe.,Restores 1 points of Magicka per second for 3600 seconds. | 2 Honningbrew Mead 1 Moon Sugar 1 Raw Mammoth Meat | 1 |  | Chefs | Cook pot |  |
| Mashed Troll | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds. | 1 Garlic 1 Potato 1 Raw Troll Meat | 1 |  | Chefs | Cook pot |  |
| Mead Braised Bear | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 2400 seconds. | 1 Nord Mead 1 Raw Bear Meat | 1 |  | Chefs | Cook pot |  |
| Minced Marinated Bear | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 2400 seconds. | 1 Salt 2 Juniper Berries 1 Raw Bear Meat | 2 |  | Chefs | Cook pot |  |
| Moon Dance Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,A mildly narcotic brew with mercurial effects.,Your meal improves your warmth by <25> points. | 2 Luna Moth Wing 1 Moon Sugar 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Morthal Mudders | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Restores 1 points of Stamina per second for 1600 seconds. | 1 Ale 1 Swamp Fungal Pod 1 Raw Mudcrab Meat | 1 |  | Chefs | Cook pot |  |
| Mountain Flower Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,This flavorful tea slightly improves your warmth.,Your meal improves your warmth by <25> points. | 1 Blue Mountain Flower 1 Red Mountain Flower 1 Purple Mountain Flower 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Mudcrab Chowder | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Consumed out of combat, it restores 1 Stamina.,Your meal improves your warmth by <25> points. | 1 Potato 1 Bottled Milk 1 Raw Mudcrab Meat | 1 |  | Chefs | Cook pot |  |
| Mudcrab Egg Scramble | Cooked Meal | Restores 1 points of Stamina per second for 900 seconds.,A hearty, savory breakfast. | 1 Chicken's Egg 1 Raw Mudcrab Meat | 1 |  | Chefs | Cook pot |  |
| Mudcrab Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Mudcrab Legs | 3 |  | Chefs | Cook pot |  |
| Mudcrab Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Mudcrab Meat | 3 |  | Chefs | Cook pot |  |
| Mullwine Braised Mammoth | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 7200 seconds. | 1 Mulled Wine 1 Raw Mammoth Meat | 1 |  | Chefs | Cook pot |  |
| Nirn Spring Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,An astringent brew, its potent ingredients draw upon the essence of Mundus.,Your meal improves your warmth by <25> points. | 1 Nirnroot 1 Sleeping Tree Sap 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Ocean's Kiss | Cooked Meal | Consumed out of combat, it restores 5 Stamina and Magicka.,Magicka is increased by 5 points for 900 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Garlic 1 Raw Clam Meat | 1 |  | Chefs | Cook pot |  |
| Pet Bait: Fox (Strange Brew) | Cooked Meal | This tasty chicken might lure a wild fox, if I can get close.,Consumed out of combat, it restores 20 Stamina and Magicka. | 1 Raw Chicken Breast 1 Strange Brew | 1 |  | Chefs | Cook pot | Brewing Skill Greater or Equal to 2 |
| Pet Bait: Rabbit (Strange Brew) | Cooked Meal | This tasty carrot might lure a wild hare, if I can get close.,Consumed out of combat, it restores 10 Stamina and Magicka. | 1 Carrot 1 Strange Brew | 1 |  | Chefs | Cook pot | Brewing Skill Greater or Equal to 1 |
| Pet Bait: Wolf (Strange Brew) | Cooked Meal | This odorous meat might lure a wild animal, if I leave it lying out.,Consumed out of combat, it restores 20 Stamina and Magicka. | 1 Raw Venison 1 Strange Brew | 1 |  | Chefs | Cook pot | Brewing Skill Greater or Equal to 0 |
| Pet Bait: Wolf (Strange Brew) | Cooked Meal | This odorous meat might lure a wild animal, if I leave it lying out.,Consumed out of combat, it restores 20 Stamina and Magicka. | 1 Strange Brew 1 Raw Elk Meat | 1 |  | Chefs | Cook pot | Brewing Skill Greater or Equal to 0 |
| Pheasant Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Pheasant Breast | 3 |  | Chefs | Cook pot |  |
| Poisoner's Stew | Stew | Drains the target's Health by 1 points per second for 150 seconds.,Resists 80% of poison effects for 120 seconds.,Your meal improves your warmth by <25> points.,A hot and sour soup of questionable value. | 1 Nightshade 1 Raw Chaurus Meat 1 Chaurus Venom (Crude) | 1 |  | Chefs | Cook pot |  |
| Potato Crab Chowder | Cooked Meal | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 25% faster for 1200 seconds.,Your meal improves your warmth by <25> points. | 1 Potato 1 Bottled Milk 1 Butter 1 Raw Mudcrab Meat | 1 |  | Chefs | Cook pot |  |
| Potato Soup | Soup | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 10% faster for 1200 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Potato 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Predator's Price | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth by <25> points. | 1 Garlic 1 Raw Venison 1 Raw Bear Meat 1 Raw Wolf Meat 1 Glass Bottle (Water) | 4 |  | Chefs | Cook pot |  |
| Rabbit Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Rabbit Leg | 3 |  | Chefs | Cook pot |  |
| Rabbit Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Rabbit Meat | 3 |  | Chefs | Cook pot |  |
| Rabbit Mushroom Stew | Stew | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 2000 seconds.,Your meal improves your warmth by <25> points. | 1 Mora Tapinella 1 Raw Rabbit Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Rarebit Ragout | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1600 seconds.,Your meal improves your warmth by <25> points. | 1 Goat Cheese Slice 1 Bread Half-Loaf 1 Raw Rabbit Meat | 1 |  | Chefs | Cook pot |  |
| Raw Salmon Steak | Raw food | Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach. | 1 Raw Salmon | 2 |  | Chefs,Survivalists | Cook pot |  |
| Reachman Soup | Soup | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth by <25> points. | 1 Sabre Cat Tooth 2 Edible Mushroom 2 Edible Root 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Roasted Tomato Crab Bisque | Cooked Meal | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka is increased by 20 points for 1200 seconds.,Your meal improves your warmth by <25> points.,Restores 1 points of Magicka per second for 1200 seconds. | 1 Salt 1 Tomato 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Root Bear (Strange Brew) | Cooked Meal | Consumed out of combat, it restores 20 Stamina and Magicka.,Stamina is increased by 20 points for 2400 seconds.,Your meal improves your warmth by <25> points. | 1 Nirnroot 2 Bear Tooth 1 Raw Bear Meat 1 Glass Bottle (Water) | 2 |  | Chefs | Cook pot |  |
| Sabre Cat Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,An excellent iron ration. | 6 Salt 1 Raw Sabre Cat Meat | 3 |  | Chefs | Cook pot |  |
| Sabre Cat Pot Roast | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds. | 1 Leek 1 Gourd 1 Raw Sabre Cat Meat | 1 |  | Chefs | Cook pot |  |
| Salmon Bake | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds. | 1 Thistle Branch 2 Raw Salmon Steak 1 Honey | 1 |  | Chefs | Cook pot |  |
| Salt | Cooked Meal |  | 1 Glass Bottle (Salt Water) | 1 |  | N/A | Cook pot |  |
| Salt | Cooked Meal |  | 1 Waterskin (Salt Water) | 1 |  | N/A | Cook pot |  |
| Salty Sabre Stew | Stew | Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth by <25> points. | 2 Salt 1 Canis Root 1 Raw Sabre Cat Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Sausaged Skeever | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka. | 1 Garlic 1 Skeever Tail 1 Raw Skeever Meat | 2 |  | Chefs | Cook pot |  |
| Sauteed Dog and Mushrooms | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Makes you feel better. Unless you just lost your dog. | 2 Garlic 1 Fly Amanita 1 White Cap 1 Raw Dog Meat | 1 |  | Chefs | Cook pot |  |
| Skeevender Stew | Stew | Consumed out of combat, it restores 15 Stamina and Magicka.,It really just tastes like lavender stew.,Your meal improves your warmth by <25> points.,Restores 1 points of Stamina per second for 900 seconds. | 2 Lavender 2 Raw Skeever Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Skeever Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Skeever Meat | 3 |  | Chefs | Cook pot |  |
| Skeever Scramble | Cooked Meal | Consumed out of combat, it restores 5 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds. | 1 Chicken's Egg 1 Leek 1 Raw Skeever Meat | 1 |  | Chefs | Cook pot |  |
| Skewered Skeever | Cooked Meal | Consumed out of combat, it restores 5 Stamina and Magicka. | 1 Red Apple 1 Goat Cheese Slice 1 Raw Skeever Meat | 2 |  | Chefs | Cook pot |  |
| Smoked Elk Roast | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka. | 1 Salt 1 Raw Elk Meat | 2 |  | Chefs | Cook pot |  |
| Snowberry Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,A warm draught against Skyrim's chilly nights and heights.,Your meal improves your warmth by <25> points. | 3 Snowberries 2 Red Mountain Flower 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Snowbery Wolf Chop | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 2400 seconds.,A little tart, a little sweet. | 2 Snowberries 1 Raw Wolf Meat | 1 |  | Chefs | Cook pot |  |
| Soap - Blue Mountain | Soap | Soap scented with Blue Mountain Flowers. Slightly increases health regeneration. | 1 Salt 3 Blue Mountain Flower 1 Animal Fat | 3 | Craftsmanship | Survivalists | Cook pot |  |
| Soap - Dragon's Tongue | Soap | Soap scented with Dragon's Tongue Flowers. Slightly increases your fire resistance and your speechcraft. | 1 Salt 3 Dragon's Tongue 1 Animal Fat | 3 | Craftsmanship | Survivalists | Cook pot |  |
| Soap - Lavender | Soap | Soap scented with Lavender. Slightly increases your magic resistance and your speechcraft. | 1 Salt 3 Lavender 1 Animal Fat | 3 | Craftsmanship | Survivalists | Cook pot |  |
| Soap - Plain | Soap | Soap with a neutral scent. Slightly raises your sneak ability by masking your scent. | 1 Salt 1 Animal Fat | 3 | Craftsmanship | Survivalists | Cook pot |  |
| Soap - Purple Mountain Flower | Soap | Soap scented with Purple Mountain Flowers. Slightly increases stamina regeneration. | 1 Salt 3 Purple Mountain Flower 1 Animal Fat | 3 | Craftsmanship | Survivalists | Cook pot |  |
| Soap - Red Mountain Flower | Soap | Soap scented with Red Mountain Flowers. Slightly increases magika regeneration. | 1 Salt 3 Red Mountain Flower 1 Animal Fat | 3 | Craftsmanship | Survivalists | Cook pot |  |
| Soap - Superior Mountain Flower | Soap | Soap scented with Mountain Flowers. Slightly increases health, magicka and stamina regeneration. | 1 Salt 2 Blue Mountain Flower 2 Red Mountain Flower 2 Purple Mountain Flower 1 Animal Fat | 3 | Craftsmanship | Survivalists | Cook pot |  |
| Spiced Diced Goat | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Sublime, exotic flavor.,Your meal improves your warmth by <25> points.,Restores 1 points of Stamina per second for 3600 seconds. | 1 Purple Mountain Flower 1 Creep Cluster 1 Raw Goat Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Spider Fry | Cooked Meal | Consumed out of combat, it restores 50 Stamina and Magicka. | 1 Ale 2 Salt 1 Raw Spider Meat | 2 |  | Chefs | Cook pot |  |
| Spider Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Spider Meat | 4 |  | Chefs | Cook pot |  |
| Spider Soup | Soup | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1200 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Potato 1 Raw Spider Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Spider Surprise | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Your meal improves your warmth by <25> points.,Restores 1 points of Stamina per second for 600 seconds. | 1 Leek 1 Spider Egg 1 Bottled Milk 1 Raw Spider Meat | 1 |  | Chefs | Cook pot |  |
| Spotted Wolf Meat | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka.,Restores 5 points of Stamina per second for 600 seconds. | 1 Ale 1 Jazbay Grapes 1 Raw Wolf Meat | 1 |  | Chefs | Cook pot |  |
| Sweetwolf (Strange Brew) | Cooked Meal | Consumed out of combat, it restores 15 Stamina and Magicka.,Health is increased by 10 points for 600 seconds. | 1 Red Apple 1 Honey 1 Raw Wolf Meat | 1 |  | Chefs | Cook pot |  |
| Ten Dragons Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,This flavorful tea slightly improves your warmth.,Your meal improves your warmth by <25> points. | 10 Dragon's Tongue 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Tomato Soup | Soup | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 25% faster for 1200 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Garlic 1 Tomato 1 Leek 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Troll Jerky | Jerky | Consumed out of combat, it restores 7 Stamina and Magicka.,Tough and tasteless, but imperishable. | 6 Salt 1 Raw Troll Meat | 4 |  | Chefs | Cook pot |  |
| Vegetable Soup | Soup | Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 20% faster for 1200 seconds.,Your meal improves your warmth by <25> points. | 1 Cabbage 1 Potato 1 Tomato 1 Leek 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Velvet Slaughterfish | Cooked Meal | Consumed out of combat, it restores 1 Stamina.,An expensive way to cook a very angry fish.,Consumed out of combat, it restores 5 Stamina and Magicka. | 1 Velvet LeChance 1 Raw Slaughterfish | 1 |  | Chefs | Cook pot |  |
| Venison Jerky | Jerky | Consumed out of combat, it restores 5 Stamina and Magicka.,An excellent iron ration. | 6 Salt 1 Raw Venison | 3 |  | Chefs | Cook pot |  |
| Venison Jerky | Jerky | Consumed out of combat, it restores 5 Stamina and Magicka.,An excellent iron ration. | 6 Salt 1 Raw Elk Meat | 3 |  | Chefs | Cook pot |  |
| Venison Stew | Stew | Consumed out of combat, it restores 75 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth by <25> points. | 1 Salt 1 Potato 1 Raw Venison 1 Leek 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Venison Tenderloin | Cooked Meal | Consumed out of combat, it restores 10 Stamina and Magicka. | 1 Ale 1 Raw Venison | 2 |  | Chefs | Cook pot |  |
| Watermelon Gazpacho | Water | Restores 15 points of Stamina per second for 0 seconds.,Restores 1 points of Stamina per second for 300 seconds.,This soup tastes amazing! | 1 Salt 1 Elves Ear 1 Goat Cheese Slice 1 Tomato 1 Watermelon | 3 |  | Chefs | Cook pot |  |
| Waterskin (3/3) | Water | Restores thirst. | 1 Waterskin (Salt Water) | 1 |  | N/A | Cook pot |  |
| Wheat Boon Tea | Tea | Consumed out of combat, it restores 15 Stamina and Magicka.,Bitter tasting but reputed for its balsamaceous properties.,Your meal improves your warmth by <25> points. | 3 Wheat 1 Hanging Moss 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Wolf Cabbage Stew | Stew | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds.,Your meal improves your warmth by <25> points. | 1 Cabbage 1 Raw Wolf Meat 1 Glass Bottle (Water) | 1 |  | Chefs | Cook pot |  |
| Wolf Jerky | Jerky | Consumed out of combat, it restores 1 Stamina.,A cheap iron ration. | 6 Salt 1 Raw Wolf Meat | 3 |  | Chefs | Cook pot |  |
| Wyrm and Chips | Cooked Meal | Consumed out of combat, it restores 35 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds.,Tastes best with hot Nord mead.,Restores 1 points of Magicka per second for 1200 seconds. | 1 Salt 2 Potato 1 Raw Dragon Meat | 2 |  | Chefs | Cook pot |  |
| Flour | Flour | Its raw taste is revolting to anyone but those with a strong stomach. | 2 Wheat | 1 |  | N/A | Grain Mill |  |
| Apple Dumpling | Baked goods | Consumed out of combat, it restores 5 Stamina and Magicka.,Ranged weapons deal 5% more damage for 1200 seconds. | 2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter | 4 |  | Chefs | Oven |  |
| Apple Pie | Baked goods | Consumed out of combat, it restores 50 Stamina and Magicka.,Magicka is increased by 10 points for 1200 seconds. | 1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter | 1 |  | Chefs | Oven |  |
| Braided Bread | Bread | Consumed out of combat, it restores 40 Stamina and Magicka.,Carry weight is increased by 10 points for 1200 seconds. | 1 Salt 2 Flour 1 Glass Bottle (Water) | 1 |  | Chefs | Oven |  |
| Bread Loaf | Bread | Consumed out of combat, it restores 40 Stamina and Magicka. | 1 Salt 1 Flour 1 Glass Bottle (Water) | 1 |  | Chefs | Oven |  |
| Chaurus Pie | Baked goods | Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1200 seconds. | 2 Salt 1 Red Apple 1 Carrot 1 Potato 1 Tomato 1 Honeycomb 1 Raw Chaurus Meat | 1 |  | Chefs | Oven |  |
| Chicken Dumpling | Baked goods | Consumed out of combat, it restores 15 Stamina and Magicka.,One-handed weapons do 5% more damage for 1200 seconds.,Two-handed weapons do 5% more damage for 1200 seconds. | 1 Salt 1 Garlic 2 Leek 2 Raw Chicken Breast 1 Flour | 2 |  | Chefs | Oven |  |
| Crab Cakes | Baked goods | Consumed out of combat, it restores 40 Stamina and Magicka.,Blocking absorbs 5% more damage for 300 seconds.,[SURV=Reduce <60> points of Hunger.] | 1 Salt 1 Flour 1 Raw Mudcrab Meat | 1 |  | Chefs | Oven |  |
| Garlic Bread | Bread | Consumed out of combat, it restores 20 Stamina and Magicka.,Increases Disease Resistance by 20% for 1200 seconds. | 1 Garlic 1 Bread Loaf 1 Butter | 2 |  | Chefs | Oven |  |
| Jazbay Crostata | Baked goods | Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of fire damage for 1200 seconds. | 10 Jazbay Grapes 1 Honey 1 Flour 1 Butter | 2 |  | Chefs | Oven |  |
| Juniper Berry Crostata | Baked goods | Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of shock damage for 1200 seconds. | 10 Juniper Berries 1 Honey 1 Flour 1 Butter | 2 |  | Chefs | Oven |  |
| Lavender Honey Dumpling | Baked goods | Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of magic for 1200 seconds. | 6 Lavender 1 Moon Sugar 1 Honey 1 Flour | 2 |  | Chefs | Oven |  |
| Meat Pie | Baked goods |  | 1 Salt 1 Raw Beef 1 Bottled Milk 1 Flour 1 Butter | 1 |  | Chefs | Oven |  |
| Potato Bread | Bread | Consumed out of combat, it restores 40 Stamina and Magicka.,Health regenerates 75% faster for 1200 seconds. | 1 Salt 1 Potato 1 Flour 1 Glass Bottle (Water) | 1 |  | Chefs | Oven |  |
| Snowberry Crostata | Baked goods | Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of frost damage for 1200 seconds. | 10 Snowberries 1 Honey 1 Flour 1 Butter | 2 |  | Chefs | Oven |  |
| Sweetroll | Baked goods | Consumed out of combat, it restores 15 Stamina and Magicka.,Magicka is increased by 5 points for 300 seconds. | 1 Chicken's Egg 1 Salt 1 Honey 1 Bottled Milk 1 Flour 1 Butter | 6 |  | Chefs | Oven |  |

</div>