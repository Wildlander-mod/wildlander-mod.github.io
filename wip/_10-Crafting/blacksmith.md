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



---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- Perks needed
- Quantity produced per craft
- Complete list of materials needed
- Additional crafting requirements and conditions

Use the search bar and filters below to find specific forge recipes by perks needed.

---

## Forge Recipes Data

<style>
#forge-tooltip {
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

#forge-tooltip div {
  margin: 4px 0;
}

#forge-tooltip strong {
  color: #f77ef1;
}
</style>

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
    proximity: cells[2]?.textContent || '',
    qtyMade: cells[3]?.textContent || '',
    itemsRequired: cells[4]?.textContent || '',
    additionalRequirements: cells[5]?.textContent || ''
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
  const perks = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 2) {
      const perksText = cells[1].textContent.trim();
      
      if (perksText && perksText !== '') {
        perksText.split(',').forEach(perk => {
          const trimmed = perk.trim();
          if (trimmed) perks.add(trimmed);
        });
      }
    }
  });
  
  const perksFilter = document.getElementById('forgePerksFilter');
  
  Array.from(perks).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perksFilter.appendChild(option);
  });
  
  document.getElementById('forgeSearch').addEventListener('input', filterForgeRecipes);
  document.getElementById('forgePerksFilter').addEventListener('change', filterForgeRecipes);
  initForgetooltips();
  updateFilterCountForge();
}

function filterForgeRecipes() {
  const searchTerm = document.getElementById('forgeSearch').value.toLowerCase();
  const perksFilter = document.getElementById('forgePerksFilter').value;
  
  const table = document.querySelector('.forge-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[4]?.textContent.toLowerCase() || '';
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const perksCellText = cells[1]?.textContent.trim() || '';
    const perksList = perksCellText.split(',').map(p => p.trim());
    const perksMatch = !perksFilter || perksList.includes(perksFilter);
    
    const isVisible = searchMatch && perksMatch;
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
  document.getElementById('forgePerksFilter').value = '';
  filterForgeRecipes();
}

initForgeFilters();

});
</script>

<div class="forge-recipes-controls">
  <input type="text" id="forgeSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="forgePerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersForge" onclick="clearForgeFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-forge" id="filterResultCountForge"></div>

<div class="forge-recipes-table" markdown="1">

| Produced Item Name | Perks Needed | Proximity | Qty Made | Items Required | Additional Requirements |
|:---|:---|:---|:---:|:---|:---|
| Acolyte Hood |  | Forge | 1 | 1 Silk Thread 3 Silk Cloth - Brown |  |
| Aetherium Crown |  | Aetherium Forge | 1 | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherium Crown |  | Aetherium Forge | 1 | 2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherium Shield |  | Aetherium Forge | 1 | 2 Ingot: Malachite 4 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Aetherium Shield |  | Aetherium Forge | 1 | 2 Ingot: Malachite 4 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherium Staff |  | Aetherium Forge | 1 | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 1 Aetherium Crest |  |
| Aetherium Staff |  | Aetherium Forge | 1 | 2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 2 Aetherium Dynamo Core |  |
| Akaviri Katana | Advanced Blacksmithing | Player Crafting | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Alchemist's Crown |  | Forge | 1 | 1 Infused Ingot 3 Rubyluce |  |
| Alik'ri Fishing Rod | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Wood | Fishing - Unlocked Alikri Rod |
| Ancient Falmer Boots | Advanced Light Smithing | Forge | 1 | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Ancient Falmer Crown | Advanced Light Smithing | Forge | 1 | 3 Ingot: Moonstone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Ancient Falmer Cuirass | Advanced Light Smithing | Forge | 1 | 5 Ingot: Moonstone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | DawnGuard - Touching the Sky Complete |
| Ancient Falmer Gauntlets | Advanced Light Smithing | Forge | 1 | 2 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather | DawnGuard - Touching the Sky Complete |
| Ancient Nordic Battleaxe | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 3 Leather Strips |  |
| Ancient Nordic Boots | Craftsmanship | Forge | 1 | 1 Pelt: Bear 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Ancient Nordic Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Ancient Nordic Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Bear 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Ancient Nordic Dagger | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic Gauntlets | Craftsmanship | Forge | 1 | 2 Linen Wrap 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Ancient Nordic Greatsword | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Ancient Nordic Helmet - Antlers | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Ancient Nordic Helmet - Antlers | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Doe Antlers 1 Leather Strips 1 Leather |  |
| Ancient Nordic Hero Battleaxe | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 2 Ingot: Corundum 1 Ancient Nordic Honed Battleaxe 3 Leather Strips |  |
| Ancient Nordic Hero Boots | Advanced Blacksmithing | Forge | 1 | 1 Pelt: Cave Bear 1 Ancient Nordic Boots 3 Ingot: Steel |  |
| Ancient Nordic Hero Boots | Advanced Blacksmithing | Forge | 1 | 1 Ancient Nordic Boots 3 Ingot: Steel 2 Fur Plate |  |
| Ancient Nordic Hero Cuirass | Advanced Blacksmithing | Forge | 1 | 1 Ancient Nordic Cuirass 4 Ingot: Steel 3 Fur Plate |  |
| Ancient Nordic Hero Cuirass | Advanced Blacksmithing | Forge | 1 | 1 Ancient Nordic Cuirass 1 Pelt: Cave Bear 4 Ingot: Steel |  |
| Ancient Nordic Hero Dagger | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Ancient Nordic Honed Dagger |  |
| Ancient Nordic Hero Gauntlets | Advanced Blacksmithing | Forge | 1 | 1 Ancient Nordic Gauntlets 2 Ingot: Steel 1 Leather |  |
| Ancient Nordic Hero Greatsword | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Greatsword 2 Leather Strips |  |
| Ancient Nordic Hero Heavy Bow | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Corundum 1 Ancient Nordic Honed Heavy Bow 2 Hide Lace |  |
| Ancient Nordic Hero Heavy Crossbow | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 2 Ingot: Corundum 1 Leather 4 Hide Lace |  |
| Ancient Nordic Hero Helm | Advanced Blacksmithing | Forge | 1 | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather |  |
| Ancient Nordic Hero Mace | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Ancient Nordic Honed Mace |  |
| Ancient Nordic Hero Sword | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Sword 1 Leather Strips |  |
| Ancient Nordic Hero War Axe | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed War Axe 2 Leather Strips |  |
| Ancient Nordic Hero Warhammer | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 3 Leather Strips 1 Ancient Nordic Honed Warhammer |  |
| Ancient Nordic Honed Battleaxe | Craftsmanship | Forge | 1 | 1 Ancient Nordic Battleaxe 2 Ingot: Corundum |  |
| Ancient Nordic Honed Dagger | Craftsmanship | Forge | 1 | 1 Ingot: Corundum 1 Ancient Nordic Dagger |  |
| Ancient Nordic Honed Greatsword | Craftsmanship | Forge | 1 | 1 Ancient Nordic Greatsword 2 Ingot: Corundum |  |
| Ancient Nordic Honed Heavy Bow | Craftsmanship | Forge | 1 | 1 Ancient Nordic Light Bow 2 Ingot: Corundum |  |
| Ancient Nordic Honed Mace | Craftsmanship | Forge | 1 | 2 Ingot: Corundum 1 Ancient Nordic Mace |  |
| Ancient Nordic Honed Sword | Craftsmanship | Forge | 1 | 1 Ancient Nordic Sword 1 Ingot: Corundum |  |
| Ancient Nordic Honed War Axe | Craftsmanship | Forge | 1 | 1 Ancient Nordic War Axe 1 Ingot: Corundum |  |
| Ancient Nordic Honed Warhammer | Craftsmanship | Forge | 1 | 2 Ingot: Corundum 1 Ancient Nordic Warhammer |  |
| Ancient Nordic Light Bow | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Ancient Nordic Mace | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic Sword | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips |  |
| Ancient Nordic War Axe | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Ancient Nordic Warhammer | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Antler Headdress |  | Player Crafting | 1 | 1 Doe Antlers 0 Pelt: Deer 1 Hawk Feathers 1 Antler Paste | Forage Skill Greater or Equal to 4 |
| Antlered Heavy Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 2 Buck Antlers 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Antlered Heavy Helmet (Good) | Craftsmanship | Player Crafting | 1 | 2 Buck Antlers 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Antlered Heavy Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Buck Antlers 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Antlered Light Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 2 Buck Antlers 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Antlered Light Helmet (Good) | Craftsmanship | Player Crafting | 1 | 2 Buck Antlers 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Antlered Light Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Buck Antlers 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Argonian Fishing Rod | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 1 Wood | Fishing - Unlocked Argonian Rod |
| Armor of the Midnight Hunt | Advanced Light Smithing | Forge | 1 | 1 Pelt: Cave Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Armor of the Midnight Hunt | Advanced Light Smithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Armor of the Northern Hunt | Advanced Light Smithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Armor of the Northern Hunt | Advanced Light Smithing | Forge | 1 | 1 Pelt: Snow Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Arrow: Bone (Crude) | Craftsmanship | Forge | 5 | 3 Fragment: Bone 1 Animal Bone (Large) | Forage Skill Less or Equal to 2 |
| Arrow: Bone (Crude) | Craftsmanship | Forge | 5 | 1 Wood 3 Fragment: Bone | Forage Skill Less or Equal to 2 |
| Arrow: Bone (Decent) | Craftsmanship | Forge | 5 | 1 Wood 3 Fragment: Bone | Forage Skill Greater or Equal to 3,Forage Skill Less or Equal to 4 |
| Arrow: Bone (Decent) | Craftsmanship | Forge | 5 | 3 Fragment: Bone 1 Animal Bone (Large) | Forage Skill Greater or Equal to 3,Forage Skill Less or Equal to 4 |
| Arrow: Bone (Good) | Craftsmanship | Forge | 5 | 1 Wood 3 Fragment: Bone | Forage Skill Greater or Equal to 5,Forage Skill Less or Equal to 6 |
| Arrow: Bone (Good) | Craftsmanship | Forge | 5 | 3 Fragment: Bone 1 Animal Bone (Large) | Forage Skill Greater or Equal to 5,Forage Skill Less or Equal to 6 |
| Arrow: Bone (Great) | Craftsmanship | Forge | 5 | 1 Wood 3 Fragment: Bone | Forage Skill Greater or Equal to 7,Forage Skill Less or Equal to 8 |
| Arrow: Bone (Great) | Craftsmanship | Forge | 5 | 3 Fragment: Bone 1 Animal Bone (Large) | Forage Skill Greater or Equal to 7,Forage Skill Less or Equal to 8 |
| Arrow: Bone (Superlative) | Craftsmanship | Forge | 5 | 3 Fragment: Bone 1 Animal Bone (Large) | Forage Skill Greater or Equal to 9 |
| Arrow: Bone (Superlative) | Craftsmanship | Forge | 5 | 1 Wood 3 Fragment: Bone | Forage Skill Greater or Equal to 9 |
| Arrow: Chitin (Crude) | Morrowind Smithing 2 | Player Crafting | 10 | 1 Wood 10 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Arrow: Chitin (Good) | Morrowind Smithing 2 | Player Crafting | 10 | 1 Wood 1 Chitin Resin 10 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Arrow: Chitin (Superlative) | Morrowind Smithing 2 | Player Crafting | 10 | 1 Wood 1 Netch Jelly 1 Chitin Resin 10 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Arrow: Ivory (Crude) | Craftsmanship | Player Crafting | 10 | 1 Wood 1 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Arrow: Ivory (Good) | Craftsmanship | Player Crafting | 10 | 1 Wood 1 Polished Ivory 10 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Arrow: Ivory (Superlative) | Craftsmanship | Player Crafting | 10 | 1 Wood 1 Bonesap 1 Polished Ivory 10 Fragment: Ivory | Forage Skill Greater or Equal to 8 |
| Arrow: Skyforge Steel | Advanced Blacksmithing | Forge | 15 | 1 Wood 1 Ingot: Galatite |  |
| Arrow: Stone (Crude) | Craftsmanship | Forge | 5 | 1 Wood 1 Sharp Rock | Forage Skill Less or Equal to 2 |
| Auriel's Bow Replica | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Auriel's Shield Replica | Advanced Light Smithing | Forge | 1 | 3 Ingot: Moonstone 2 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Touching the Sky Complete |
| Bearskin Cloak - Black | Craftsmanship | Player Crafting | 1 | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Brown | Craftsmanship | Player Crafting | 1 | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Ornate Black | Craftsmanship | Player Crafting | 1 | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate Brown | Craftsmanship | Player Crafting | 1 | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate White | Craftsmanship | Player Crafting | 1 | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Trimmed Black | Craftsmanship | Player Crafting | 1 | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed Brown | Craftsmanship | Player Crafting | 1 | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed White | Craftsmanship | Player Crafting | 1 | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - White | Craftsmanship | Player Crafting | 1 | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Hood - Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Cave Bear 1 Leather Strips |  |
| Bearskin Hood - Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Bear 1 Leather Strips |  |
| Bearskin Hood - Ornate Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Cave Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Snow Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Trimmed Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Cave Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Snow Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Snow Bear 1 Leather Strips |  |
| Blade of Sacrifice Replica | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - Boethiahs Calling |
| Blade of Woe Replica | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Dark Brotherhood - Death Incarnate Complete |
| Blades Boots | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Cuirass | Advanced Blacksmithing | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather | Main Quest - Alduins Wall Complete |
| Blades Gauntlets | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Helmet | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather | Main Quest - Alduins Wall Complete |
| Blades Shield | Advanced Blacksmithing | Forge | 1 | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips | Main Quest - Alduins Wall Complete |
| Bloodskal Blade Replica | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Silver 3 Leather Strips 4 Heart Stone | Dragonborn - The Final Decent Complete |
| Bone and Flint Dagger |  | Player Crafting | 1 | 1 Leather Strips 1 Sharp Rock 1 Animal Bone (Large) | Forage Skill Equal to 1 |
| Bone Battlestaff |  | Player Crafting | 1 | 2 Leather Strips 1 Animal Bone (Large) 2 Animal Bone (Superlative) | Forage Skill Greater or Equal to 4 |
| Bone Dagger |  | Player Crafting | 1 | 1 Leather Strips 1 Animal Bone (Small) 1 Animal Bone (Large) | Forage Skill Greater or Equal to 1 |
| Bone Divining Knife |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone | Forage Skill Greater or Equal to 3 |
| Bone Heavy Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bone Heavy Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bone Heavy Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Bone Hunting Knife |  | Player Crafting | 1 | 1 Animal Bone (Large) | Forage Skill Greater or Equal to 1 |
| Bone Light Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bone Light Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bone Light Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Bone Masterwork Sword |  | Player Crafting | 1 | 2 Hawk Feathers 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 5 |
| Bone Masterwork War Axe |  | Player Crafting | 1 | 2 Hide Lace 3 Wolf Claws 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 3 |
| Bone Sword |  | Player Crafting | 1 | 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 2 |
| Bone War Axe |  | Player Crafting | 1 | 2 Leather Strips 2 Animal Bone (Large) 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 1 |
| Bonemold Battleaxe (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 5 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Battleaxe (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 2 Netch Leather 5 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Battleaxe (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 5 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 8 |
| Bonemold Boots | Morrowind Smithing 1 | Forge | 1 | 6 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Boots (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Boots (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Boots (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Void Salts 1 Netch Leather 3 Fragment: Bone 1 Bonesap 2 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Bow (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 4 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Bow (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 2 Netch Leather 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Bow (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 4 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 8 |
| Bonemold Cuirass | Morrowind Smithing 1 | Forge | 1 | 8 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Cuirass (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 3 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Cuirass (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Netch Jelly 3 Netch Leather 3 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Cuirass (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Void Salts 3 Netch Leather 3 Fragment: Bone 2 Bonesap 2 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Dagger (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 2 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Dagger (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Dagger (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Bonemold Gauntlets | Morrowind Smithing 1 | Forge | 1 | 4 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather |  |
| Bonemold Gauntlets (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 4 Bone Meal 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Gauntlets (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 4 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Gauntlets (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 4 Bone Meal 1 Void Salts 1 Netch Leather 3 Fragment: Bone 1 Bonesap 2 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Greatsword (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 6 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Greatsword (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 2 Netch Leather 6 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Greatsword (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 6 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 8 |
| Bonemold Guard Cuirass (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 3 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Guard Cuirass (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Netch Jelly 3 Netch Leather 3 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Guard Cuirass (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Void Salts 3 Netch Leather 3 Fragment: Bone 2 Bonesap 2 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Helmet | Morrowind Smithing 1 | Forge | 1 | 6 Bone Meal 1 Ingot: Iron 1 Leather Strips 1 Netch Leather |  |
| Bonemold Helmet (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Helmet (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Helmet (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Void Salts 1 Netch Leather 3 Fragment: Bone 1 Bonesap 2 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Improved Boots | Morrowind Smithing 1 | Forge | 1 | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Boots (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 2,Forage Skill Less than 6 |
| Bonemold Improved Boots (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 6,Forage Skill Less than 8 |
| Bonemold Improved Boots (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Improved Cuirass | Morrowind Smithing 1 | Forge | 1 | 8 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Cuirass (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 2 Netch Leather 3 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 2,Forage Skill Less than 6 |
| Bonemold Improved Cuirass (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Netch Jelly 3 Netch Leather 3 Fragment: Bone 2 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 6,Forage Skill Less than 8 |
| Bonemold Improved Cuirass (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Netch Jelly 3 Netch Leather 3 Fragment: Bone 2 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Improved Gauntlets | Morrowind Smithing 1 | Forge | 1 | 4 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Gauntlets (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 4 Bone Meal 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 2,Forage Skill Less than 6 |
| Bonemold Improved Gauntlets (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 4 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 6,Forage Skill Less than 8 |
| Bonemold Improved Gauntlets (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 4 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Improved Helmet | Morrowind Smithing 1 | Forge | 1 | 6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 1 Leather Strips 1 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Helmet (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 2,Forage Skill Less than 6 |
| Bonemold Improved Helmet (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 6,Forage Skill Less than 8 |
| Bonemold Improved Helmet (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 6 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Improved Pauldroned Cuirass | Morrowind Smithing 1 | Forge | 1 | 10 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Shield | Morrowind Smithing 1 | Forge | 1 | 8 Bone Meal 2 Salt 1 Ingot: Iron 2 Powdered Mammoth Tusk 2 Netch Jelly 1 Netch Leather | Read Bonemold Formula |
| Bonemold Improved Shield (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 8 Bone Meal 1 Netch Leather 3 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 2,Forage Skill Less than 6 |
| Bonemold Improved Shield (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 8 Bone Meal 1 Netch Jelly 1 Netch Leather 3 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 6,Forage Skill Less than 8 |
| Bonemold Improved Shield (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 8 Bone Meal 1 Netch Jelly 1 Netch Leather 3 Fragment: Bone 1 Bonesap 1 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Mace (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 4 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Mace (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Mace (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Bonemold Pauldron Cuirass (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 3 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Pauldron Cuirass (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Netch Jelly 3 Netch Leather 3 Fragment: Bone 2 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Pauldron Cuirass (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 10 Bone Meal 1 Void Salts 3 Netch Leather 3 Fragment: Bone 2 Bonesap 2 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Pauldroned Cuirass | Morrowind Smithing 1 | Forge | 1 | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Pauldroned Cuirass - Guard's | Morrowind Smithing 1 | Forge | 1 | 10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather |  |
| Bonemold Shield | Morrowind Smithing 1 | Forge | 1 | 8 Bone Meal 1 Ingot: Iron 1 Netch Leather |  |
| Bonemold Shield (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 8 Bone Meal 3 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Shield (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 8 Bone Meal 1 Netch Jelly 1 Netch Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Shield (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 8 Bone Meal 1 Void Salts 1 Netch Leather 3 Fragment: Bone 1 Bonesap 2 Netch Resin | Forage Skill Greater or Equal to 8 |
| Bonemold Sword (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 4 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Sword (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Sword (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Bonemold Waraxe (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 3 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Waraxe (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 3 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Waraxe (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 3 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Bonemold Warhammer (Crude) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 4 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Bonemold Warhammer (Good) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Netch Leather 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Bonemold Warhammer (Superlative) | Morrowind Smithing 1 | Player Crafting | 1 | 2 Bone Meal 1 Void Salts 1 Netch Leather 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Champion's Cudgel Replica | Advanced Light Smithing,Orcish Blacksmithing | Forge | 1 | 3 Leather Strips 5 Ingot: Galatite | Dragonborn - March Of The Dead Complete,Civil War - Joined Imperials |
| Chillrend Replica | Glass Blacksmithing | Forge | 1 | 1 Frost Salts 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium | TG - The Pursuit Complete |
| Chitin Battleaxe (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 1 Bonesap 5 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Battleaxe (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 2 Bonesap 2 Chitin Resin 5 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Battleaxe (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Netch Jelly 4 Chitin Plate 1 Bonesap 2 Chitin Resin 5 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Bow (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 2 Bonesap 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Bow (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 2 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Bow (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Netch Jelly 4 Chitin Plate 1 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Dagger (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Chitin Plate 1 Bonesap 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Dagger (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Chitin Plate 1 Bonesap 1 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Dagger (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 1 Chitin Plate 1 Bonesap 1 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Greatsword (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 6 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Greatsword (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 2 Chitin Resin 6 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Greatsword (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 3 Chitin Plate 1 Bonesap 2 Chitin Resin 6 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Heavy Boots | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Boots (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 1 Bonesap 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Heavy Boots (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 1 Bonesap 2 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Heavy Boots (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 4 Chitin Plate 1 Bonesap 3 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 9 |
| Chitin Heavy Cuirass | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 | 2 Ingot: Corundum 4 Leather Strips 2 Netch Leather 6 Chitin Plate |  |
| Chitin Heavy Cuirass (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 6 Chitin Plate 2 Bonesap 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Heavy Cuirass (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 6 Chitin Plate 2 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Heavy Cuirass (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 6 Chitin Plate 2 Bonesap 3 Chitin Resin 5 Fragment: Chitin | Forage Skill Greater or Equal to 9 |
| Chitin Heavy Gauntlets | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 | 1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Heavy Gauntlets (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 1 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Heavy Gauntlets (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 2 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Heavy Gauntlets (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 3 Chitin Plate 1 Bonesap 3 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 9 |
| Chitin Heavy Helmet | Morrowind Smithing 2,Advanced Blacksmithing | Forge | 1 | 1 Ingot: Corundum 1 Leather Strips 1 Netch Leather 4 Chitin Plate |  |
| Chitin Heavy Helmet (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 1 Bonesap 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Heavy Helmet (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 1 Bonesap 2 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Heavy Helmet (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 4 Chitin Plate 1 Bonesap 3 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 9 |
| Chitin Light Boots | Morrowind Smithing 2 | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Netch Leather 2 Chitin Plate |  |
| Chitin Light Boots (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Light Boots (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 2 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Light Boots (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 3 Chitin Plate 1 Bonesap 3 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Light Bracers (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Chitin Plate 1 Bonesap 1 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Light Bracers (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Chitin Plate 1 Bonesap 2 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Light Bracers (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 2 Chitin Plate 1 Bonesap 3 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Light Cuirass | Morrowind Smithing 2 | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 3 Netch Leather 4 Chitin Plate |  |
| Chitin Light Cuirass (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 5 Chitin Plate 2 Bonesap 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Light Cuirass (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 5 Chitin Plate 2 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Light Cuirass (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 5 Chitin Plate 2 Bonesap 3 Chitin Resin 5 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Light Gauntlets | Morrowind Smithing 2 | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 1 Netch Leather 2 Chitin Plate |  |
| Chitin Light Helmet | Morrowind Smithing 2 | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Netch Leather 3 Chitin Plate |  |
| Chitin Light Helmet (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Light Helmet (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 2 Chitin Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Light Helmet (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 3 Chitin Plate 1 Bonesap 3 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Light Shield (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 1 Bonesap 3 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Light Shield (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 4 Chitin Plate 1 Bonesap 2 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 9 |
| Chitin Light Shield (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 4 Chitin Plate 1 Bonesap 3 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Mace (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Mace (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 1 Bonesap 1 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Mace (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 3 Chitin Plate 1 Bonesap 1 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Shield | Morrowind Smithing 2 | Forge | 1 | 1 Ingot: Steel 1 Netch Leather 4 Chitin Plate |  |
| Chitin Sword (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Chitin Plate 1 Bonesap 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Sword (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Chitin Plate 1 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Sword (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Netch Jelly 2 Chitin Plate 1 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Waraxe (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Chitin Plate 1 Bonesap 3 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Waraxe (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Chitin Plate 1 Bonesap 1 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Waraxe (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 1 Netch Jelly 2 Chitin Plate 1 Bonesap 1 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Chitin Warhammer (Crude) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 2 Bonesap 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Chitin Warhammer (Good) | Morrowind Smithing 2 | Player Crafting | 1 | 3 Chitin Plate 2 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Chitin Warhammer (Superlative) | Morrowind Smithing 2 | Player Crafting | 1 | 2 Netch Jelly 3 Chitin Plate 1 Bonesap 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Circle Boots | Advanced Blacksmithing | Forge | 1 | 2 Leather Strips 1 Leather 3 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Boots | Advanced Blacksmithing | Forge | 1 | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | Advanced Blacksmithing | Forge | 1 | 2 Pelt: Snow Bear 4 Leather Strips 2 Leather 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Cuirass | Advanced Blacksmithing | Forge | 1 | 4 Leather Strips 2 Leather 5 Ingot: Galatite 6 Fur Plate | Companions - Silver Hand Complete |
| Circle Gauntlets | Advanced Blacksmithing | Forge | 1 | 1 Pelt: Snow Bear 2 Leather Strips 1 Leather 2 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Gauntlets | Advanced Blacksmithing | Forge | 1 | 2 Leather Strips 1 Leather 2 Ingot: Galatite 2 Fur Plate | Companions - Silver Hand Complete |
| Circle Helmet | Advanced Blacksmithing | Forge | 1 | 1 Leather Strips 1 Leather 3 Ingot: Galatite | Companions - Silver Hand Complete |
| Circle Shield | Advanced Blacksmithing | Forge | 1 | 2 Leather Strips 5 Ingot: Galatite | Companions - Silver Hand Complete |
| Daedric Battleaxe | Daedric Smithing | Forge | 1 | 1 Ebony Battleaxe 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Battlestaff | Daedric Smithing | Forge | 1 | 1 Soul Gem: Black (Empty) 1 Daedra Heart 1 Ebony Battlestaff |  |
| Daedric Boots | Daedric Smithing | Forge | 1 | 1 Ebony Boots 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Cuirass | Daedric Smithing | Forge | 1 | 1 Ebony Cuirass 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Dagger | Daedric Smithing | Forge | 1 | 1 Ebony Dagger 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Gauntlets | Daedric Smithing | Forge | 1 | 1 Ebony Gauntlets 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Greatsword | Daedric Smithing | Forge | 1 | 1 Ebony Greatsword 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Heavy Bow | Daedric Smithing | Forge | 1 | 1 Ebony Heavy Bow 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Heavy Crossbow | Daedric Smithing | Forge | 1 | 1 Soul Gem: Black (Empty) 1 Daedra Heart 1 Ebony Heavy Crossbow 4 Silk Thread |  |
| Daedric Helmet | Daedric Smithing | Forge | 1 | 1 Ebony Helmet 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Hunting Knife | Daedric Smithing | Forge | 1 | 1 Daedra Heart 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Daedric Mace | Daedric Smithing | Forge | 1 | 1 Ebony Mace 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Shield | Daedric Smithing | Forge | 1 | 1 Ebony Shield 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Sword | Daedric Smithing | Forge | 1 | 1 Ebony Sword 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric War Axe | Daedric Smithing | Forge | 1 | 1 Ebony War Axe 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Daedric Warhammer | Daedric Smithing | Forge | 1 | 1 Ebony Warhammer 1 Soul Gem: Black (Empty) 1 Daedra Heart |  |
| Dark Brotherhood Heavy Crossbow | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Steel 2 Ingot: Ebony 2 Wood 1 Leather 4 Hide Lace |  |
| Dawnbreaker Replica | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 3 Ingot: Calcinium | Daedra -  The Break of Dawn |
| Dawnguard Heavy Boots | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Grey | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Heavy Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Improved Light Crossbow | Craftsmanship | Forge | 1 | 2 Ingot: Corundum 1 Dawnguard Light Crossbow | Read Improved Crossbow Schematic |
| Dawnguard Light Boots | Craftsmanship | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Crossbow | Craftsmanship | Forge | 1 | 3 Ingot: Steel 3 Wood 4 Hide Lace | Dawnguard - A New Order complete and spoken to Sorine about crossbow construction |
| Dawnguard Light Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Blue | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Dye - Red | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Gauntlets | Craftsmanship | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Light Helmet | Craftsmanship | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Rune Shield Replica | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 1 Ingot: Ebony 2 Leather Strips | DawnGuard - Lost Relic Complete |
| Dawnguard Rune War Axe Replica | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Rune Warhammer Replica | Craftsmanship | Forge | 1 | 5 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Lost Relic Complete |
| Dawnguard Shield | Craftsmanship | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips 1 Leather | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard War Axe | Craftsmanship | Forge | 1 | 2 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Dawnguard Warhammer | Craftsmanship | Forge | 1 | 4 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver | DawnGuard - Prophet (Hunter) Complete |
| Deer Heavy Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Deer Heavy Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Deer Heavy Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Deer Light Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Deer Light Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Deer Light Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Deer 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Deer Skull Headdress (Good) |  | Player Crafting | 1 | 1 Mammoth Tusk 0 Pelt: Deer 1 Hawk Feathers 1 Antler Paste | Forage Skill Greater or Equal to 4 |
| Demon Heavy Helmet  (Good) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Demon Heavy Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Demon Heavy Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Demon Light Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Demon Light Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Demon Light Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Dragon Priest Dagger | Craftsmanship | Forge | 1 | 1 Ingot: Corundum 1 Leather Strips |  |
| Dragon Priest Hood |  | Forge | 1 | 1 Silk Thread 1 Linen Cloth - Black 2 Linen Cloth - Brown |  |
| Dragon Skull Headdress |  | Player Crafting | 1 | 1 Dragon Bone 1 Leather Strips 1 Hawk Feathers 1 Bonesap | Forage Skill Greater or Equal to 4 |
| Dragonbone Battleaxe | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 3 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Battleaxe (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 1 Leather | Forage Skill Equal to 8 |
| Dragonbone Battleaxe (Good) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 1 Leather 2 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonbone Battleaxe (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 1 Leather 2 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonbone Dagger | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Dagger (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 1 Dragon Bone 1 Leather Strips | Forage Skill Equal to 8 |
| Dragonbone Dagger (Good) | Draconic Blacksmithing | Player Crafting | 1 | 1 Dragon Bone 1 Leather Strips 1 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonbone Dagger (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 1 Dragon Bone 1 Leather Strips 1 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonbone Greatsword | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Greatsword (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 4 Leather Strips | Forage Skill Equal to 8 |
| Dragonbone Greatsword (Good) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 4 Leather Strips 3 Fragment: Dragonbone | Forage Skill Equal to 9,Forage Skill Less than 10 |
| Dragonbone Greatsword (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 4 Leather Strips 3 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonbone Heavy Bow | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Heavy Bow (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 2 Wood 2 Leather | Forage Skill Equal to 8 |
| Dragonbone Heavy Bow (Good) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 2 Wood 2 Leather 2 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonbone Heavy Bow (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 2 Wood 2 Leather 2 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonbone Heavy Crossbow | Draconic Blacksmithing | Forge | 1 | 3 Dragon Bone 2 Ingot: Ebony 4 Hide Lace |  |
| Dragonbone Hunting Knife | Draconic Blacksmithing | Forge | 1 | 1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone |  |
| Dragonbone Mace | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Mace (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 2 Leather Strips | Forage Skill Equal to 8 |
| Dragonbone Mace (Good) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 2 Leather Strips 2 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonbone Mace (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 2 Leather Strips 2 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonbone Sword | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips |  |
| Dragonbone Sword (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 2 Dragon Bone 2 Leather Strips | Forage Skill Equal to 8 |
| Dragonbone Sword (Good) | Draconic Blacksmithing | Player Crafting | 1 | 2 Dragon Bone 2 Leather Strips 2 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonbone Sword (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 2 Dragon Bone 2 Leather Strips 2 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonbone War Axe | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips |  |
| Dragonbone Waraxe (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 1 Leather | Forage Skill Equal to 8 |
| Dragonbone Waraxe (Good) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 1 Leather 2 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonbone Waraxe (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Wood 1 Leather 2 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonbone Warhammer | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 4 Dragon Bone 2 Ingot: Ebony 3 Leather Strips |  |
| Dragonbone Warhammer (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 1 Mammoth Tusk 4 Dragon Bone 1 Quarried Stone | Forage Skill Equal to 8 |
| Dragonbone Warhammer (Good) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Quarried Stone 4 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonbone Warhammer (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 1 Quarried Stone 4 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonplate Bearskin Hood - Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Black |  |
| Dragonplate Bearskin Hood - Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Brown |  |
| Dragonplate Bearskin Hood - Ornate Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonplate Bearskin Hood - Ornate Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonplate Bearskin Hood - Ornate White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonplate Bearskin Hood - Trimmed Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonplate Bearskin Hood - Trimmed Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonplate Bearskin Hood - Trimmed White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonplate Bearskin Hood - White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Bearskin Hood - White |  |
| Dragonplate Boots | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Boots (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 1 Leather 2 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonplate Boots (Good) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 1 Leather 2 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonplate Boots (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 1 Leather 1 Bonesap 3 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonplate Cuirass | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 1 Dragon Scales 4 Dragon Bone 2 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Dragonplate Cuirass (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 6 Dragon Bone 2 Leather 4 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonplate Cuirass (Good) | Draconic Blacksmithing | Player Crafting | 1 | 6 Dragon Bone 2 Leather 4 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonplate Cuirass (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 6 Dragon Bone 2 Leather 1 Bonesap 5 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonplate Gauntlets | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Dragonplate Gauntlets (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Leather 1 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonplate Gauntlets (Good) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Leather 2 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonplate Gauntlets (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Bone 1 Leather 1 Bonesap 3 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonplate Helmet | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Dragonplate Helmet (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 1 Leather 2 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonplate Helmet (Good) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 1 Leather 2 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonplate Helmet (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 1 Leather 1 Bonesap 4 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonplate Shield | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 4 Dragon Bone 2 Ingot: Ebony 2 Leather Strips |  |
| Dragonplate Shield (Crude) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 2 Leather Strips | Forage Skill Equal to 8 |
| Dragonplate Shield (Good) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 2 Leather Strips 3 Fragment: Dragonbone | Forage Skill Equal to 9 |
| Dragonplate Shield (Superlative) | Draconic Blacksmithing | Player Crafting | 1 | 4 Dragon Bone 2 Leather Strips 3 Fragment: Dragonbone 1 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonplate Wolfskin Hood - Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Black |  |
| Dragonplate Wolfskin Hood - Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonplate Wolfskin Hood - Dark Trimmed Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Dark Trimmed White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonplate Wolfskin Hood - Light Trimmed Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonplate Wolfskin Hood - Light Trimmed Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonplate Wolfskin Hood - Light Trimmed White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonplate Wolfskin Hood - Noble Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonplate Wolfskin Hood - Noble Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonplate Wolfskin Hood - Noble White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonplate Wolfskin Hood - Ornate Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonplate Wolfskin Hood - Ornate Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonplate Wolfskin Hood - Ornate White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonplate Wolfskin Hood - White | Draconic Blacksmithing | Forge | 1 | 1 Dragonplate Helmet 1 Wolfskin Hood - White |  |
| Dragonscale Bearskin Hood - Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Black |  |
| Dragonscale Bearskin Hood - Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Brown |  |
| Dragonscale Bearskin Hood - Ornate Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Black |  |
| Dragonscale Bearskin Hood - Ornate Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate Brown |  |
| Dragonscale Bearskin Hood - Ornate White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Ornate White |  |
| Dragonscale Bearskin Hood - Trimmed Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Black |  |
| Dragonscale Bearskin Hood - Trimmed Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Dragonscale Bearskin Hood - Trimmed White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - Trimmed White |  |
| Dragonscale Bearskin Hood - White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Bearskin Hood - White |  |
| Dragonscale Boots | Glass Blacksmithing,Draconic Blacksmithing | Forge | 1 | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Boots (Crude) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Scales 1 Leather 2 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonscale Boots (Good) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Scales 1 Leather 2 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonscale Boots (Superlative) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Scales 1 Leather 1 Bonesap 3 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonscale Cuirass | Glass Blacksmithing,Draconic Blacksmithing | Forge | 1 | 3 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Dragonscale Cuirass (Crude) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 5 Dragon Scales 2 Leather 4 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonscale Cuirass (Good) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 5 Dragon Scales 2 Leather 4 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonscale Cuirass (Superlative) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 6 Dragon Scales 2 Leather 1 Bonesap 5 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonscale Gauntlets | Glass Blacksmithing,Draconic Blacksmithing | Forge | 1 | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Dragonscale Gauntlets (Crude) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 2 Dragon Scales 1 Leather 1 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonscale Gauntlets (Good) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 2 Dragon Scales 1 Leather 2 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonscale Gauntlets (Superlative) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 2 Dragon Scales 1 Leather 1 Bonesap 3 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonscale Helmet | Glass Blacksmithing,Draconic Blacksmithing | Forge | 1 | 2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Dragonscale Helmet (Crude) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Scales 1 Leather 2 Fragment: Chitin | Forage Skill Equal to 8 |
| Dragonscale Helmet (Good) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Scales 1 Leather 2 Fragment: Dragonbone 2 Wyrmsap | Forage Skill Equal to 9 |
| Dragonscale Helmet (Superlative) | Glass Blacksmithing,Draconic Blacksmithing | Player Crafting | 1 | 3 Dragon Scales 1 Leather 1 Bonesap 3 Fragment: Dragonbone 3 Wyrmsap | Forage Skill Greater or Equal to 10 |
| Dragonscale Shield | Glass Blacksmithing,Draconic Blacksmithing | Forge | 1 | 2 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 2 Leather Strips |  |
| Dragonscale Wolfskin Hood - Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Black |  |
| Dragonscale Wolfskin Hood - Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Dragonscale Wolfskin Hood - Dark Trimmed Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Dark Trimmed White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Dragonscale Wolfskin Hood - Light Trimmed Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Dragonscale Wolfskin Hood - Light Trimmed Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Dragonscale Wolfskin Hood - Light Trimmed White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Dragonscale Wolfskin Hood - Noble Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Black |  |
| Dragonscale Wolfskin Hood - Noble Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble Brown |  |
| Dragonscale Wolfskin Hood - Noble White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Noble White |  |
| Dragonscale Wolfskin Hood - Ornate Black | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Black |  |
| Dragonscale Wolfskin Hood - Ornate Brown | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Dragonscale Wolfskin Hood - Ornate White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - Ornate White |  |
| Dragonscale Wolfskin Hood - White | Draconic Blacksmithing | Forge | 1 | 1 Dragonscale Helmet 1 Wolfskin Hood - White |  |
| Dwarven Battleaxe | Dwarven Blacksmithing | Forge | 1 | 2 Ingot: Steel 3 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Dagger | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven |  |
| Dwarven Fishing Rod | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Rod |
| Dwarven Greatsword | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Heavy Boots | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Heavy Bow | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Crossbow | Dwarven Blacksmithing | Forge | 1 | 3 Wood 3 Ingot: Dwarven 2 Hide Lace |  |
| Dwarven Heavy Cuirass | Dwarven Blacksmithing | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 2 Leather 5 Ingot: Dwarven |  |
| Dwarven Heavy Gauntlets | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 1 Leather 2 Ingot: Dwarven |  |
| Dwarven Heavy Helmet | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Leather 3 Ingot: Dwarven |  |
| Dwarven Hunting Knife | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven 1 Fragment: Bone |  |
| Dwarven Improved Light Crossbow | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 4 Ingot: Dwarven | Read Dwemer Crossbow Schematic |
| Dwarven Mace | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven |  |
| Dwarven Masterwork Light Crossbow | Dwarven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 1 Dwarven Improved Light Crossbow | Improved Dwemer Crossbow Schematic |
| Dwarven Shield | Dwarven Blacksmithing | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 4 Ingot: Dwarven |  |
| Dwarven Sword | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven War Axe | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Ingot: Dwarven |  |
| Dwarven Warhammer | Dwarven Blacksmithing | Forge | 1 | 2 Ingot: Steel 3 Leather Strips 4 Ingot: Dwarven |  |
| Ebony Battleaxe | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Ebony Battlestaff | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 2 Ingot: Quicksilver |  |
| Ebony Blade Replica | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips | Daedra - The Whispering Door |
| Ebony Boots | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Boots - Gilded | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Boots - Silvered | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Silver 3 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Cuirass | Ebony Blacksmithing | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Gilded | Ebony Blacksmithing | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Cuirass - Silvered | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Dagger | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony Gauntlets | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Gilded | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather |  |
| Ebony Gauntlets - Silvered | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Silver 2 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Ebony Greatsword | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Heavy Bow | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Hide Lace |  |
| Ebony Heavy Crossbow | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 2 Ingot: Quicksilver 4 Hide Lace |  |
| Ebony Helmet | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Gilded | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Gold 1 Leather Strips 1 Leather |  |
| Ebony Helmet - Silvered | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Silver 3 Ingot: Ebony 1 Leather Strips 1 Leather |  |
| Ebony Hunting Knife | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Fragment: Bone |  |
| Ebony Mace | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Mail |  | Forge | 1 | 1 Ebony Mail |  |
| Ebony Mail |  | Forge | 1 | 1 Ebony Mail |  |
| Ebony Mail Replica | Ebony Blacksmithing | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica | Ebony Blacksmithing | Forge | 1 | 4 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Boethiahs Calling |
| Ebony Mail Replica - Gilded | Ebony Blacksmithing | Forge | 1 | 4 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Gilded | Ebony Blacksmithing | Forge | 1 | 5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Silver 4 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Mail Replica - Silvered | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather |  |
| Ebony Shield | Ebony Blacksmithing | Forge | 1 | 4 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Shield - Gilded | Ebony Blacksmithing | Forge | 1 | 4 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips |  |
| Ebony Shield - Silvered | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Silver 4 Ingot: Ebony 2 Leather Strips |  |
| Ebony Sword | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips |  |
| Ebony War Axe | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips |  |
| Ebony Warhammer | Ebony Blacksmithing | Forge | 1 | 4 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips |  |
| Elven Battleaxe | Elven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 3 Leather Strips 3 Ingot: Calcinium |  |
| Elven Boots | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Boots - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Cuirass | Elven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 1 Ingot: Gold 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor | Elven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Cuirass - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 2 Ingot: Gold 4 Leather Strips 2 Leather 5 Ingot: Calcinium |  |
| Elven Dagger | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium |  |
| Elven Gauntlets | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Gauntlets - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Greatsword | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Helmet | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Helmet - Thalmor Gilded | Advanced Light Smithing,Elven Blacksmithing | Forge | 1 | 1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium |  |
| Elven Hunting Knife | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Elven Light Armor | Elven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Boots | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Boots - Thalmor | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Bow | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Crossbow | Elven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium |  |
| Elven Light Cuirass - Thalmor | Elven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium |  |
| Elven Light Gauntlets | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Gauntlets - Thalmor | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Elven Light Helmet | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Light Helmet - Thalmor | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium |  |
| Elven Mace | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium |  |
| Elven Shield | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Gilded | Advanced Light Smithing | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Shield - Thalmor Gilded | Advanced Light Smithing | Forge | 1 | 1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium |  |
| Elven Sword | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 2 Ingot: Calcinium |  |
| Elven War Axe | Elven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 2 Ingot: Calcinium |  |
| Elven Warhammer | Elven Blacksmithing | Forge | 1 | 2 Ingot: Quicksilver 3 Leather Strips 4 Ingot: Calcinium |  |
| Falmer Boots (Crude) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 1 Leather 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Boots (Good) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 1 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Boots (Superlative) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 1 Leather 2 Falmer Resin 3 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Bracers (Crude) | Craftsmanship | Player Crafting | 1 | 3 Chaurus Chitin 1 Leather 1 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Bracers (Good) | Craftsmanship | Player Crafting | 1 | 3 Chaurus Chitin 1 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Bracers (Superlative) | Craftsmanship | Player Crafting | 1 | 3 Chaurus Chitin 1 Leather 2 Falmer Resin 3 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Cuirass (Crude) | Craftsmanship | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Cuirass (Good) | Craftsmanship | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather 2 Falmer Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Cuirass (Superlative) | Craftsmanship | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather 2 Falmer Resin 3 Chitin Resin 5 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Heavy Boots | Dwarven Blacksmithing | Forge | 1 | 3 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Boots | Ebony Blacksmithing | Forge | 1 | 3 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather |  |
| Falmer Heavy Boots (Crude) | Dwarven Blacksmithing | Player Crafting | 1 | 3 Chaurus Chitin 1 Leather 2 Fragment: Chitin | Forage Skill Greater or Equal to 8,Forage Skill Less than 4 |
| Falmer Heavy Boots (Good) | Dwarven Blacksmithing | Player Crafting | 1 | 6 Chaurus Chitin 1 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Heavy Boots (Superlative) | Dwarven Blacksmithing | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather 2 Falmer Resin 3 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Heavy Bow | Craftsmanship | Forge | 1 | 3 Chaurus Chitin 3 Leather Strips |  |
| Falmer Heavy Cuirass | Dwarven Blacksmithing | Forge | 1 | 5 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Heavy Cuirass (Crude) | Dwarven Blacksmithing | Player Crafting | 1 | 8 Chaurus Chitin 3 Leather 4 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Heavy Cuirass (Good) | Dwarven Blacksmithing | Player Crafting | 1 | 8 Chaurus Chitin 2 Leather 2 Falmer Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Heavy Cuirass (Superlative) | Dwarven Blacksmithing | Player Crafting | 1 | 8 Chaurus Chitin 2 Leather 3 Falmer Resin 3 Chitin Resin 8 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Heavy Gauntlets | Dwarven Blacksmithing | Forge | 1 | 2 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Heavy Gauntlets (Crude) | Dwarven Blacksmithing | Player Crafting | 1 | 5 Chaurus Chitin 2 Leather 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Heavy Gauntlets (Good) | Dwarven Blacksmithing | Player Crafting | 1 | 5 Chaurus Chitin 1 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Heavy Gauntlets (Superlative) | Dwarven Blacksmithing | Player Crafting | 1 | 5 Chaurus Chitin 2 Leather 2 Falmer Resin 3 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Heavy Helm (Crude) | Dwarven Blacksmithing | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Heavy Helm (Good) | Dwarven Blacksmithing | Player Crafting | 1 | 6 Chaurus Chitin 1 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Heavy Helm (Superlative) | Dwarven Blacksmithing | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather 2 Falmer Resin 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Heavy Helmet | Dwarven Blacksmithing | Forge | 1 | 3 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 1 Leather 2 Fragment: Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Helmet (Good) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 1 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 1 Leather 2 Falmer Resin 3 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Honed Light Bow | Ebony Blacksmithing | Forge | 1 | 1 Falmer Heavy Bow 2 Ingot: Ebony |  |
| Falmer Honed Sword | Ebony Blacksmithing | Forge | 1 | 1 Falmer Sword 1 Ingot: Ebony |  |
| Falmer Honed War Axe | Ebony Blacksmithing | Forge | 1 | 1 Falmer War Axe 1 Ingot: Ebony |  |
| Falmer Light Boots | Craftsmanship | Forge | 1 | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Light Bow (Crude) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 2 Wood 2 Leather | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Light Bow (Good) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 2 Wood 2 Leather 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Light Bow (Superlative) | Craftsmanship | Player Crafting | 1 | 4 Chaurus Chitin 2 Wood 2 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Light Bracers | Craftsmanship | Forge | 1 | 1 Chaurus Chitin 2 Leather Strips 1 Leather |  |
| Falmer Light Cuirass | Craftsmanship | Forge | 1 | 3 Chaurus Chitin 4 Leather Strips 2 Leather |  |
| Falmer Light Helmet | Craftsmanship | Forge | 1 | 2 Chaurus Chitin 1 Leather Strips 1 Leather |  |
| Falmer Shield | Craftsmanship | Forge | 1 | 4 Chaurus Chitin 2 Leather Strips |  |
| Falmer Shield  (Good) | Craftsmanship | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather Strips 3 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Shield (Crude) | Craftsmanship | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather Strips | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Shield (Superlative) | Craftsmanship | Player Crafting | 1 | 6 Chaurus Chitin 2 Leather Strips 1 Chitin Resin 3 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer Staff of Chain Lightning |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Void Salts 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 6 |
| Falmer Staff of Fireball |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Fire Salts 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 6 |
| Falmer Staff of Firesparks |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Fire Salts 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 3 |
| Falmer Staff of Healing Hands |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Glow Dust 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 6 |
| Falmer Staff of Icy Spear |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Frost Salts 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Equal to 6 |
| Falmer Staff of Lightning Bolt |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Void Salts 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 6 |
| Falmer Staff of Paralysis |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Vampire Dust 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 9 |
| Falmer Staff of Storms |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Void Salts 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 6 |
| Falmer Staff of the Flame Atronach |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Void Salts 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 9 |
| Falmer Staff of the Zombie |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Chaurus Chitin 1 Vampire Dust 2 Chaurus Hunter Antennae 1 Falmer Resin | Forage Skill Greater or Equal to 6 |
| Falmer Sword | Craftsmanship | Forge | 1 | 2 Chaurus Chitin 1 Leather Strips |  |
| Falmer Sword (Crude) | Craftsmanship | Player Crafting | 1 | 2 Chaurus Chitin 2 Leather Strips | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Sword (Good) | Craftsmanship | Player Crafting | 1 | 2 Chaurus Chitin 2 Leather Strips 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Sword (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Chaurus Chitin 2 Leather Strips 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Falmer War Axe | Craftsmanship | Forge | 1 | 2 Chaurus Chitin 2 Leather Strips |  |
| Falmer Waraxe (Good) | Craftsmanship | Player Crafting | 1 | 3 Chaurus Chitin 1 Wood 1 Leather 2 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Falmer Waraxe (Good) | Craftsmanship | Player Crafting | 1 | 3 Chaurus Chitin 1 Wood 1 Leather | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Falmer Waraxe (Superlative) | Craftsmanship | Player Crafting | 1 | 3 Chaurus Chitin 1 Wood 1 Leather 2 Falmer Resin 2 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Feather Headdress |  | Player Crafting | 1 | 1 Hagraven Feathers 1 Leather Strips 2 Hawk Feathers | Forage Skill Greater or Equal to 4 |
| Flint Dagger |  | Player Crafting | 1 | 1 Leather Strips 1 Sharp Rock 1 Animal Bone (Large) | Forage Skill Greater or Equal to 1 |
| Forsworn Battlestaff |  | Player Crafting | 1 | 2 Wood 1 Leather Strips 2 Hawk Beak 4 Fragment: Bone | Forage Skill Greater or Equal to 3 |
| Forsworn Battlestaff | Arcane Craftsmanship | Player Crafting | 1 | 1 Hagraven Feathers 6 Sabre Cat Tooth 3 Wood 4 Leather Strips 2 Hawk Beak |  |
| Forsworn Boots | Craftsmanship | Player Crafting | 1 | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Boots | Craftsmanship | Player Crafting | 1 | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Cuirass | Craftsmanship | Player Crafting | 1 | 2 Hagraven Feathers 4 Leather Strips 2 Fur Plate |  |
| Forsworn Cuirass | Craftsmanship | Player Crafting | 1 | 2 Hagraven Feathers 4 Pelt: Goat 4 Leather Strips |  |
| Forsworn Gauntlets | Craftsmanship | Player Crafting | 1 | 3 Leather Strips 2 Fur Plate |  |
| Forsworn Gauntlets | Craftsmanship | Player Crafting | 1 | 2 Pelt: Goat 3 Leather Strips |  |
| Forsworn Headdress | Craftsmanship | Player Crafting | 1 | 1 Hagraven Feathers 1 Pelt: Goat 1 Doe Antlers |  |
| Forsworn Headdress | Craftsmanship | Player Crafting | 1 | 1 Hagraven Feathers 1 Doe Antlers 2 Fur Plate |  |
| Forsworn Light Bow | Craftsmanship | Player Crafting | 1 | 1 Doe Antlers 2 Wood 5 Leather Strips 1 Hawk Feathers |  |
| Forsworn Staff of Chain Lightning |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 6 |
| Forsworn Staff of Fireball |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 6 |
| Forsworn Staff of Firesparks |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 3 |
| Forsworn Staff of Healing Hands |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Glow Dust 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 6 |
| Forsworn Staff of Icy Spear |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Frost Salts 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Equal to 6 |
| Forsworn Staff of Lightning Bolt |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 6 |
| Forsworn Staff of Paralysis |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Vampire Dust 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 9 |
| Forsworn Staff of Storms |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 6 |
| Forsworn Staff of the Flame Atronach |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 9 |
| Forsworn Staff of the Zombie |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Vampire Dust 2 Wood 1 Leather Strips 4 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 6 |
| Forsworn Sword | Craftsmanship | Player Crafting | 1 | 6 Sabre Cat Tooth 2 Wood 4 Leather Strips |  |
| Forsworn War Axe | Craftsmanship | Player Crafting | 1 | 1 Sabre Cat Tooth 3 Wood 5 Leather Strips 1 Quarried Stone |  |
| Fur Boots | Craftsmanship | Player Crafting | 1 | 2 Hide Lace 2 Fur Plate |  |
| Fur Bracers | Craftsmanship | Player Crafting | 1 | 2 Hide Lace 2 Fur Plate |  |
| Fur Cuirass | Craftsmanship | Player Crafting | 1 | 4 Hide Lace 5 Fur Plate |  |
| Fur Gauntlets | Craftsmanship | Player Crafting | 1 | 2 Hide Lace 2 Fur Plate |  |
| Fur Guard's Boots | Craftsmanship | Player Crafting | 1 | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Boots | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Guard's Cuirass - Falkreath | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Haafingar | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Hjaalmarch | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Pale | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Reach | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - The Rift | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Whiterun | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Cuirass - Winterhold | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Fur Guard's Gauntlets | Craftsmanship | Player Crafting | 1 | 1 Pelt: Goat 2 Leather Strips 1 Leather |  |
| Fur Guard's Gauntlets | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Fur Helmet | Craftsmanship | Player Crafting | 1 | 1 Hide Lace 2 Fur Plate |  |
| Fur Kilt | Craftsmanship | Player Crafting | 1 | 3 Hide Lace 2 Fur Plate |  |
| Fur Mantled Kilt | Craftsmanship | Player Crafting | 1 | 3 Hide Lace 3 Fur Plate |  |
| Fur Shoes | Craftsmanship | Player Crafting | 1 | 2 Hide Lace 1 Fur Plate |  |
| Fur Sleeveless Cuirass | Craftsmanship | Player Crafting | 1 | 4 Hide Lace 4 Fur Plate |  |
| Glass Battleaxe | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Glass Battlestaff | Glass Blacksmithing | Forge | 1 | 1 Ingot: Moonstone 2 Ingot: Malachite 2 Ingot: Calcinium |  |
| Glass Boots | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Boots - Thalmor | Glass Blacksmithing | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Boots - Vvardenfell | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Cuirass | Glass Blacksmithing | Forge | 1 | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Calcinium |  |
| Glass Cuirass - Thalmor | Glass Blacksmithing | Forge | 1 | 2 Ingot: Corundum 5 Ingot: Malachite 4 Leather Strips 2 Leather |  |
| Glass Cuirass - Vvardenfell | Glass Blacksmithing | Forge | 1 | 5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Galatite |  |
| Glass Dagger | Glass Blacksmithing | Forge | 1 | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass Gauntlets | Glass Blacksmithing | Forge | 1 | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Gauntlets - Thalmor | Glass Blacksmithing | Forge | 1 | 1 Ingot: Corundum 2 Ingot: Malachite 2 Leather Strips 1 Leather |  |
| Glass Gauntlets - Vvardenfell | Glass Blacksmithing | Forge | 1 | 2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Greatsword | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Helmet | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Calcinium |  |
| Glass Helmet - Thalmor | Glass Blacksmithing | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Malachite 1 Leather Strips 1 Leather |  |
| Glass Helmet - Vvardenfell | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Galatite |  |
| Glass Hunting Knife | Glass Blacksmithing | Forge | 1 | 1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone |  |
| Glass Light Bow | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 2 Hide Lace 1 Ingot: Calcinium |  |
| Glass Light Crossbow | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 2 Hide Lace 2 Ingot: Calcinium |  |
| Glass Mace | Glass Blacksmithing | Forge | 1 | 3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield | Glass Blacksmithing | Forge | 1 | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Shield - Thalmor | Glass Blacksmithing | Forge | 1 | 1 Ingot: Corundum 4 Ingot: Malachite 2 Leather Strips |  |
| Glass Shield - Vvardenfell | Glass Blacksmithing | Forge | 1 | 4 Ingot: Malachite 2 Leather Strips 1 Ingot: Galatite |  |
| Glass Sword | Glass Blacksmithing | Forge | 1 | 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium |  |
| Glass War Axe | Glass Blacksmithing | Forge | 1 | 2 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium |  |
| Glass Warhammer | Glass Blacksmithing | Forge | 1 | 4 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium |  |
| Harkon's Sword Replica | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips | DawnGuard - Killed Harkon |
| Heavy Bone Shield (Crude) | Craftsmanship | Player Crafting | 1 | 3 Horker Tusk 2 Human Skull 3 Animal Bone (Large) | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Heavy Bone Shield (Good) | Craftsmanship | Player Crafting | 1 | 4 Horker Tusk 2 Human Skull 3 Animal Bone (Large) 3 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Heavy Bone Shield (Superlative) | Craftsmanship | Player Crafting | 1 | 4 Horker Tusk 2 Human Skull 3 Animal Bone (Large) 2 Bonesap 2 Animal Bone (Superlative) | Forage Skill Greater or Equal to 8 |
| Helm of Yngol Replica | Craftsmanship | Forge | 1 | 1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather | Sidequest - Escape Yngols Barrow Complete |
| Hevnoraak's Hood |  | Forge | 1 | 1 Silk Thread 3 Silk Cloth - Tan |  |
| Hide Boots | Craftsmanship | Player Crafting | 1 | 1 Pelt: Elk 2 Leather Strips 2 Leather |  |
| Hide Boots | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather 2 Fur Plate |  |
| Hide Boots | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather |  |
| Hide Bracers | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Leather |  |
| Hide Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Iron 4 Leather Strips 3 Leather 2 Fur Plate |  |
| Hide Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Elk 1 Ingot: Iron 4 Leather Strips 3 Leather |  |
| Hide Furred Cuirass | Craftsmanship | Player Crafting | 1 | 3 Leather 4 Hide Lace 2 Fur Plate |  |
| Hide Helmet | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Hide Shield | Craftsmanship | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 4 Leather |  |
| Hide Skaal Boots | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Boots | Craftsmanship | Player Crafting | 1 | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | Craftsmanship | Player Crafting | 1 | 2 Pelt: Elk 5 Leather Strips 4 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Coat | Craftsmanship | Player Crafting | 1 | 5 Leather Strips 6 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Gloves | Craftsmanship | Player Crafting | 1 | 1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | Craftsmanship | Player Crafting | 1 | 1 Pelt: Elk 1 Leather Strips 1 Pelt: Snow Fox | Dragonborn - The Fate of the Skaal  Complete |
| Hide Skaal Hat | Craftsmanship | Player Crafting | 1 | 1 Leather Strips 2 Fur Plate | Dragonborn - The Fate of the Skaal  Complete |
| Horse Armor: Big Game Saddle | Craftsmanship | Forge | 1 | 1 Troll Skull 1 Mammoth Tusk 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Big Game Saddle - Adorned | Craftsmanship | Forge | 1 | 1 Rueful Axe 1 Horse Armor: Big Game Saddle |  |
| Horse Armor: Black Hand Barding and Saddle | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Black Hand Barding and Saddle - Adorned | Advanced Blacksmithing | Forge | 1 | 1 Ancient Nordic War Axe 1 Wooden Lute 1 Horse Armor: Black Hand Barding and Saddle |  |
| Horse Armor: Cleric Barding and Saddle | Elven Blacksmithing,Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Daedric Barding and Saddle | Daedric Smithing | Forge | 1 | 1 Daedra Heart 1 Ingot: Steel 10 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Dawnguard Barding and Saddle | Craftsmanship | Forge | 1 | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | Craftsmanship | Forge | 1 | 1 Steel Heavy Crossbow 8 Bolt: Steel 1 Dawnguard War Axe 1 Dawnguard Shield 1 Horse Armor: Dawnguard Barding and Saddle | DawnGuard - Prophet (Hunter) Complete |
| Horse Armor: Divine Aegis Barding and Saddle | Glass Blacksmithing | Forge | 1 | 2 Briar Heart 2 Ingot: Gold 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Dragonbone Barding and Saddle | Draconic Blacksmithing | Forge | 1 | 2 Dragon Scales 8 Dragon Bone 1 Ingot: Steel 10 Leather Strips 6 Leather |  |
| Horse Armor: Dwarven Barding and Saddle | Dwarven Blacksmithing | Forge | 1 | 2 Ingot: Steel 10 Leather Strips 6 Leather 8 Ingot: Dwarven |  |
| Horse Armor: Ebony Barding and Saddle | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Ebony Barding and Saddle - Mail | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Amber | Elven Blacksmithing | Forge | 1 | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Elven Barding and Saddle - Dusk | Elven Blacksmithing | Forge | 1 | 2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather |  |
| Horse Armor: Frost Aegis Barding and Saddle | Glass Blacksmithing | Forge | 1 | 2 Frost Salts 2 Ingot: Quicksilver 8 Ingot: Malachite 10 Leather Strips 6 Leather |  |
| Horse Armor: Fur Saddle | Craftsmanship | Forge | 1 | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 2 Leather |  |
| Horse Armor: Hunter's Saddle | Craftsmanship | Forge | 1 | 1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 1 Pelt: Fox 3 Leather |  |
| Horse Armor: Hunter's Saddle - Adorned | Craftsmanship | Forge | 1 | 8 Arrow: Steel 1 Horse Armor: Hunter's Saddle |  |
| Horse Armor: Imperial Barding and Saddle | Craftsmanship | Forge | 1 | 1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather |  |
| Horse Armor: Imperial Barding and Saddle - Adorned | Craftsmanship | Forge | 1 | 1 Iron Sword 1 Imperial Heavy Shield 1 Imperial Heavy Bow 8 Arrow: Iron 1 Horse Armor: Imperial Barding and Saddle |  |
| Horse Armor: Imperial Saddle | Craftsmanship | Forge | 1 | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle | Craftsmanship | Forge | 1 | 1 Ingot: Iron 2 Wood 6 Leather Strips 3 Leather |  |
| Horse Armor: Knight's Saddle - Adorned | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Steel Shield 1 Steel Greatsword 1 Steel Sword 1 Horse Armor: Knight's Saddle |  |
| Horse Armor: Leather Barding and Saddle | Craftsmanship | Forge | 1 | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Leather Barding and Saddle - Mail | Craftsmanship | Forge | 1 | 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Minstrel's Saddle | Craftsmanship | Forge | 1 | 1 Ingot: Iron 6 Leather Strips 1 Wooden Lute 3 Leather |  |
| Horse Armor: Nordic Barding and Saddle | Advanced Blacksmithing | Forge | 1 | 8 Ingot: Steel 2 Ingot: Corundum 10 Leather Strips 6 Leather |  |
| Horse Armor: Ornate Barding and Saddle | Craftsmanship | Forge | 1 | 6 Linen Wrap 2 Ingot: Iron 10 Leather Strips 10 Leather |  |
| Horse Armor: Shadowmere's Saddle | Craftsmanship | Forge | 1 | 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle | Craftsmanship | Forge | 1 | 1 Pelt: Bear 2 Ingot: Iron 10 Leather Strips 7 Leather |  |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | Craftsmanship | Forge | 1 | 1 Iron Sword 8 Arrow: Iron 1 Wooden Light Bow 1 Horse Armor: Stormcloak Barding and Saddle |  |
| Horse Armor: Traveler's Saddle | Craftsmanship | Forge | 1 | 2 Linen Wrap 1 Corundum Flagon 1 Ingot: Iron 6 Leather Strips 3 Leather |  |
| Imperial Crested Heavy Helmet | Craftsmanship | Forge | 1 | 4 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Crossbow | Craftsmanship | Forge | 1 | 1 Ingot: Iron 4 Wood 2 Hide Lace |  |
| Imperial General Cuirass | Craftsmanship | Forge | 1 | 2 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Heavy Boots | Craftsmanship | Forge | 1 | 2 Ingot: Steel 3 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Bow | Craftsmanship | Forge | 1 | 1 Ingot: Steel 3 Wood 3 Hide Lace | Civil War - Joined Imperials |
| Imperial Heavy Bracers | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Crossbow | Craftsmanship | Forge | 1 | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Imperial Heavy Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Heavy Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials |
| Imperial Heavy Shield | Craftsmanship | Forge | 1 | 4 Ingot: Steel 2 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Light Boots | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Bracers | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Cuirass | Craftsmanship | Player Crafting | 1 | 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Light Helmet | Craftsmanship | Player Crafting | 1 | 1 Leather Strips 2 Leather | Civil War - Joined Imperials |
| Imperial Light Shield | Craftsmanship | Forge | 1 | 2 Ingot: Steel 4 Wood 2 Leather Strips | Civil War - Joined Imperials |
| Imperial Officer Heavy Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather | Civil War - Joined Imperials,Civil War - Conquered a hold |
| Imperial Outcast Boots | Craftsmanship | Forge | 1 | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Imperial Outcast Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Imperial Outcast Bracers | Craftsmanship | Forge | 1 | 2 Leather Strips 2 Fur Plate |  |
| Imperial Outcast Bracers | Craftsmanship | Forge | 1 | 1 Pelt: Elk 2 Leather Strips |  |
| Imperial Outcast Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Imperial Outcast Helmet | Craftsmanship | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Iron 1 Leather Strips |  |
| Imperial Studded Cuirass | Advanced Light Smithing | Forge | 1 | 1 Ingot: Steel 5 Leather Strips 6 Leather | Civil War - Joined Imperials |
| Imperial Sword | Craftsmanship | Forge | 1 | 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Imperials |
| Irkngthand War Axe | Ebony Blacksmithing | Forge | 1 | 2 Ingot: Ebony 3 Leather Strips 1 Ingot: Dwarven | Fishing - Unlocked Dwarven Axe |
| Iron Armor (Engraved) | Craftsmanship | Forge | 1 | 1 Iron Cuirass |  |
| Iron Banded Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Craftsmanship | Forge | 1 | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Cuirass - Engraved | Craftsmanship | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | Craftsmanship | Forge | 1 | 2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Banded Cuirass - Engraved | Craftsmanship | Forge | 1 | 5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Masterwork Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Masterwork Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate |  |
| Iron Banded Quality Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Banded Quality Shield | Craftsmanship | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Banded Shield | Craftsmanship | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips |  |
| Iron Battleaxe | Craftsmanship | Forge | 1 | 4 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Battlestaff | Craftsmanship | Forge | 1 | 1 Ingot: Iron 4 Wood 2 Leather Strips |  |
| Iron Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots | Craftsmanship | Forge | 1 | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Craftsmanship | Forge | 1 | 1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Boots - Engraved | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Boots (Engraved) | Craftsmanship | Forge | 1 | 1 Iron Boots |  |
| Iron Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Cuirass - Engraved | Craftsmanship | Forge | 1 | 1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Craftsmanship | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather |  |
| Iron Cuirass - Engraved | Craftsmanship | Forge | 1 | 4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Dagger | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Furred Cuirass | Craftsmanship | Forge | 1 | 3 Ingot: Iron 4 Hide Lace 2 Fur Plate |  |
| Iron Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets | Craftsmanship | Forge | 1 | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Craftsmanship | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Craftsmanship | Forge | 1 | 1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather |  |
| Iron Gauntlets - Engraved | Craftsmanship | Forge | 1 | 2 Ingot: Iron 2 Leather Strips 2 Fur Plate |  |
| Iron Gauntlets (Engraved) | Craftsmanship | Forge | 1 | 1 Iron Gauntlets |  |
| Iron Greatsword | Craftsmanship | Forge | 1 | 4 Ingot: Iron 2 Leather Strips |  |
| Iron Guard's Cuirass - Eastmarch | Craftsmanship | Forge | 1 | 5 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Iron Guard's Cuirass - Falkreath | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Ingot: Corundum 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Haafingar | Craftsmanship | Forge | 1 | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Hjaalmarch | Craftsmanship | Forge | 1 | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Pale | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Thane of Hold |
| Iron Guard's Cuirass - The Reach | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 3 Leather 3 Ingot: Dwarven | Thane of Hold |
| Iron Guard's Cuirass - The Rift | Craftsmanship | Forge | 1 | 3 Ingot: Iron 6 Leather Strips 6 Leather | Thane of Hold |
| Iron Guard's Cuirass - Whiterun | Craftsmanship | Forge | 1 | 2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather | Thane of Hold |
| Iron Guard's Cuirass - Winterhold | Craftsmanship | Forge | 1 | 3 Ingot: Iron 5 Leather Strips 6 Leather | Thane of Hold |
| Iron Headsman's Axe | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Heavy Crossbow | Craftsmanship | Forge | 1 | 3 Ingot: Iron 3 Wood 2 Hide Lace |  |
| Iron Heavy Shield | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Iron Dented Shield |  |
| Iron Heavy Shield | Craftsmanship | Forge | 1 | 4 Ingot: Iron 2 Wood 2 Leather Strips |  |
| Iron Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet - Engraved | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Ram | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Helmet - Ram | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Helmet (Engraved) | Craftsmanship | Forge | 1 | 1 Iron Helmet |  |
| Iron Hunting Knife | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Leather Strips |  |
| Iron Light Guard's Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather |  |
| Iron Light Guard's Helmet - Falkreath | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Haafingar | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Hjaalmarch | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Pale | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Reach | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - The Rift | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Whiterun | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Helmet - Winterhold | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Thane of Hold |
| Iron Light Guard's Shield - Eastmarch | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Falkreath | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Haafingar | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Hjaalmarch | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Pale | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Reach | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - The Rift | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Whiterun | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Light Guard's Shield - Winterhold | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Wood 2 Leather Strips | Thane of Hold |
| Iron Mace | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Masterwork Boots | Advanced Blacksmithing | Forge | 1 | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Boots | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Masterwork Boots | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Cuirass | Advanced Blacksmithing | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Masterwork Cuirass | Advanced Blacksmithing | Forge | 1 | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Cuirass | Advanced Blacksmithing | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Masterwork Gauntlets | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Masterwork Gauntlets | Advanced Blacksmithing | Forge | 1 | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Gauntlets | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Masterwork Helmet | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Masterwork Shield | Advanced Blacksmithing | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Pickaxe | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Wood |  |
| Iron Quality Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Iron Quality Boots | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Boots | Craftsmanship | Forge | 1 | 1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate |  |
| Iron Quality Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Iron Quality Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | Craftsmanship | Forge | 1 | 1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Iron Quality Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate |  |
| Iron Quality Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Iron Quality Shield | Craftsmanship | Forge | 1 | 4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips |  |
| Iron Reinforced Armor (Engraved) | Craftsmanship | Forge | 1 | 1 Iron Banded Cuirass |  |
| Iron Robed Cuirass - Dark | Craftsmanship,Craftsmanship | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Iron Robed Cuirass - Pale | Craftsmanship | Forge | 1 | 3 Ingot: Iron 4 Linen Thread 3 Linen Cloth |  |
| Iron Sword | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Leather Strips |  |
| Iron War Axe | Craftsmanship | Forge | 1 | 2 Ingot: Iron 1 Wood 2 Leather Strips |  |
| Iron Warhammer | Craftsmanship | Forge | 1 | 5 Ingot: Iron 2 Wood 3 Leather Strips |  |
| Iron Woodcutter's Axe | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Wood |  |
| Iron Woodcutter's Axe | Craftsmanship | Forge | 1 | 1 Ingot: Iron 2 Deadwood |  |
| Ivory Battleaxe (Crude) | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Leather 3 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Battleaxe (Good) | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Leather 3 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Battleaxe (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Leather 1 Bonesap 3 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 8 |
| Ivory Dagger (Crude) | Craftsmanship | Player Crafting | 1 | 1 Leather Strips 1 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Dagger (Good) | Craftsmanship | Player Crafting | 1 | 1 Leather Strips 1 Polished Ivory 1 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Dagger (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Leather Strips 1 Bonesap 1 Polished Ivory 1 Fragment: Ivory | Forage Skill Greater or Equal to 8 |
| Ivory Greatsword (Crude) | Craftsmanship | Player Crafting | 1 | 1 Mammoth Tusk 4 Leather Strips 3 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Greatsword (Crude) | Craftsmanship | Player Crafting | 1 | 1 Mammoth Tusk 4 Leather Strips 3 Polished Ivory 3 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Greatsword (Superlative) | Craftsmanship | Player Crafting | 1 | 4 Leather Strips 1 Flawless Sabre Cat Tooth 1 Bonesap 3 Polished Ivory 3 Fragment: Ivory | Forage Skill Greater or Equal to 8 |
| Ivory Heavy Bow (Crude) | Craftsmanship | Player Crafting | 1 | 2 Wood 2 Leather 4 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Heavy Bow (Good) | Craftsmanship | Player Crafting | 1 | 2 Wood 2 Leather 4 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Heavy Bow (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Wood 2 Leather 4 Polished Ivory 2 Fragment: Ivory 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Ivory Heavy Crossbow (Crude) | Craftsmanship | Player Crafting | 1 | 2 Wood 2 Leather 4 Polished Ivory | Forage Skill Greater or Equal to 2,Forage Skill Less than 4 |
| Ivory Heavy Crossbow (Good) | Craftsmanship | Player Crafting | 1 | 2 Wood 2 Leather 4 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 5,Forage Skill Less than 8 |
| Ivory Heavy Crossbow (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Wood 2 Leather 4 Polished Ivory 2 Fragment: Ivory 1 Antler Paste | Forage Skill Greater or Equal to 9 |
| Ivory Mace (Crude) | Craftsmanship | Player Crafting | 1 | 1 Wood 2 Leather Strips 4 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Mace (Good) | Craftsmanship | Player Crafting | 1 | 1 Wood 2 Leather Strips 4 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Mace (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Wood 2 Leather Strips 4 Polished Ivory 2 Fragment: Ivory 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Ivory Shield (Crude) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 6 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Shield (Good) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 6 Polished Ivory 3 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Shield (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 6 Polished Ivory 3 Fragment: Ivory 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Ivory Sword (Crude) | Craftsmanship | Player Crafting | 1 | 1 Mammoth Tusk 2 Leather Strips 2 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Sword (Good) | Craftsmanship | Player Crafting | 1 | 1 Mammoth Tusk 2 Leather Strips 2 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Sword (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Bonesap 1 Mammoth Tusk (Superlative) 2 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 8 |
| Ivory Waraxe (Crude) | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Leather 3 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Waraxe (Good) | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Leather 3 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Waraxe (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Leather 1 Bonesap 3 Polished Ivory 2 Fragment: Ivory | Forage Skill Greater or Equal to 8 |
| Ivory Warhammer (Crude) | Craftsmanship | Player Crafting | 1 | 1 Mammoth Tusk 1 Quarried Stone 4 Polished Ivory | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Ivory Warhammer (Good) | Craftsmanship | Player Crafting | 1 | 1 Mammoth Tusk 1 Quarried Stone 4 Polished Ivory 4 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Ivory Warhammer (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Quarried Stone 1 Bonesap 4 Polished Ivory 4 Fragment: Ivory 1 Antler Paste | Forage Skill Greater or Equal to 8 |
| Jagged Crown Replica | Draconic Blacksmithing,Ebony Blacksmithing | Forge | 1 | 1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather | Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete,Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete |
| Jarl of Eastmarch Armguards | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Jarl of Eastmarch Armor | Craftsmanship | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark 4 Fur Plate |  |
| Jarl of Eastmarch Armor | Craftsmanship | Forge | 1 | 1 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark |  |
| Keening Replica | Dwarven Blacksmithing | Forge | 1 | 1 Ingot: Quicksilver 1 Dwarven Gyro 1 Ingot: Dwarven | College - Arniels Endeavor  Complete |
| Konahrik's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Purple 1 Silk Cloth - Yellow |  |
| Krosis' Hood |  | Forge | 1 | 1 Silk Thread 3 Silk Cloth - Brown |  |
| Leather Backpack - Black | Craftsmanship | Player Crafting | 1 | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Leather Backpack - Brown | Craftsmanship | Player Crafting | 1 | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Leather Backpack - White | Craftsmanship | Player Crafting | 1 | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Leather Bearskin Hood - Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Black |  |
| Leather Bearskin Hood - Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Brown |  |
| Leather Bearskin Hood - Ornate Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Ornate Black |  |
| Leather Bearskin Hood - Ornate Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Ornate Brown |  |
| Leather Bearskin Hood - Ornate White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Ornate White |  |
| Leather Bearskin Hood - Trimmed Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Trimmed Black |  |
| Leather Bearskin Hood - Trimmed Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Leather Bearskin Hood - Trimmed White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - Trimmed White |  |
| Leather Bearskin Hood - White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Bearskin Hood - White |  |
| Leather Boots | Craftsmanship | Player Crafting | 1 | 3 Leather Strips 4 Leather |  |
| Leather Bracers | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather |  |
| Leather Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Iron 5 Leather Strips 6 Leather |  |
| Leather Executioner's Boots | Craftsmanship | Player Crafting | 1 | 1 Pelt: Ice Wolf 3 Leather Strips |  |
| Leather Executioner's Boots | Craftsmanship | Player Crafting | 1 | 3 Leather Strips 1 Fur Plate |  |
| Leather Executioner's Cuirass | Craftsmanship | Forge | 1 | 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark 2 Fur Plate |  |
| Leather Executioner's Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Ice Wolf 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark |  |
| Leather Executioner's Gloves | Craftsmanship | Forge | 1 | 1 Pelt: Ice Wolf 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Leather Executioner's Gloves | Craftsmanship | Forge | 1 | 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark 1 Fur Plate |  |
| Leather Executioner's Hood | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Dark |  |
| Leather Helmet | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Leather Strips 2 Leather |  |
| Leather Hood | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather |  |
| Leather Hood - Black | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Dark |  |
| Leather Wolfskin Hood - Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Black |  |
| Leather Wolfskin Hood - Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Brown |  |
| Leather Wolfskin Hood - Dark Trimmed Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Leather Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Leather Wolfskin Hood - Dark Trimmed White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Leather Wolfskin Hood - Light Trimmed Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Leather Wolfskin Hood - Light Trimmed Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Leather Wolfskin Hood - Light Trimmed White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Leather Wolfskin Hood - Noble Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Noble Black |  |
| Leather Wolfskin Hood - Noble Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Noble Brown |  |
| Leather Wolfskin Hood - Noble White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Noble White |  |
| Leather Wolfskin Hood - Ornate Black | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Ornate Black |  |
| Leather Wolfskin Hood - Ornate Brown | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Leather Wolfskin Hood - Ornate White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - Ornate White |  |
| Leather Wolfskin Hood - White | Craftsmanship | Player Crafting | 1 | 1 Leather Helmet 1 Wolfskin Hood - White |  |
| Light Bone Shield (Crude) | Craftsmanship | Player Crafting | 1 | 3 Horker Tusk 2 Human Skull 3 Animal Bone (Large) | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Light Bone Shield (Good) | Craftsmanship | Player Crafting | 1 | 4 Horker Tusk 2 Human Skull 3 Animal Bone (Large) 3 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Light Bone Shield (Superlative) | Craftsmanship | Player Crafting | 1 | 4 Horker Tusk 2 Human Skull 3 Animal Bone (Large) 2 Bonesap 2 Animal Bone (Superlative) | Forage Skill Greater or Equal to 8 |
| Mace of Molag Bal Replica | Daedric Smithing | Forge | 1 | 1 Daedra Heart 3 Ingot: Ebony 2 Leather Strips | Daedra - The House of Horrors |
| Mail and Hide | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Jacket | Craftsmanship | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Leather Surcoat | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Linen Cloth - Black |  |
| Mail and Leathers | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace |  |
| Mail and Pauldroned Leather | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather 2 Hide Lace |  |
| Mail and Surcoat | Craftsmanship | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mail and Tunic | Craftsmanship | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread |  |
| Mammoth Bone Club |  | Player Crafting | 1 | 3 Leather Strips 1 Animal Bone (Enormous) | Forage Skill Greater or Equal to 1 |
| Mammoth Bone Masterwork Club |  | Player Crafting | 1 | 3 Troll Fat 3 Hide Lace 1 Animal Bone (Enormous) | Forage Skill Greater or Equal to 4 |
| Mammoth Hide Boots (Basic Level 4) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Pelt: Mammoth Section (Flawless) 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 10 |
| Mammoth Hide Boots (Crude) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Pelt: Mammoth Section | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Mammoth Hide Boots (Good) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Goat 2 Leather Strips 1 Pelt: Mammoth Section | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Mammoth Hide Boots (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Pelt: Mammoth Section (Fine) 1 Animal Bone (Large) | Forage Skill Greater or Equal to 8 |
| Mammoth Hide Cuirass (Basic Level 4) | Craftsmanship | Player Crafting | 1 | 4 Leather Strips 4 Animal Bone (Small) 2 Animal Bone (Large) 2 Pelt: Mammoth Section (Flawless) 2 Animal Bone (Superlative) | Forage Skill Greater or Equal to 10 |
| Mammoth Hide Cuirass (Crude) | Craftsmanship | Player Crafting | 1 | 4 Leather Strips 2 Pelt: Mammoth Section 4 Animal Bone (Small) 2 Animal Bone (Large) | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Mammoth Hide Cuirass (Good) | Craftsmanship | Player Crafting | 1 | 2 Pelt: Goat 4 Leather Strips 2 Pelt: Mammoth Section 4 Animal Bone (Small) 2 Animal Bone (Large) | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Mammoth Hide Cuirass (Superlative) | Craftsmanship | Player Crafting | 1 | 4 Leather Strips 2 Pelt: Mammoth Section (Fine) 4 Animal Bone (Small) 2 Animal Bone (Large) 2 Animal Bone (Large) | Forage Skill Greater or Equal to 8 |
| Mammoth Hide Gauntlets (Crude) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Pelt: Mammoth Section | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Mammoth Hide Gauntlets (Good) | Craftsmanship | Player Crafting | 1 | 1 Pelt: Goat 2 Leather Strips 1 Pelt: Mammoth Section | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Mammoth Hide Gauntlets (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Pelt: Mammoth Section (Fine) 1 Animal Bone (Large) | Forage Skill Greater or Equal to 8 |
| Mammoth Hide Gauntlets (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 1 Pelt: Mammoth Section (Flawless) 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 10 |
| Mammoth Skull Headdress |  | Player Crafting | 1 | 1 Elves Ear 1 Mammoth Tusk 1 Leather Strips 1 Hawk Feathers 1 Bonesap | Forage Skill Greater or Equal to 4 |
| Masque of Clavicus Vile Replica | Ebony Blacksmithing | Forge | 1 | 4 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather | Daedra - A Daedras Best Friend |
| Matron's Mask |  | Player Crafting | 1 | 1 Taproot 2 Spriggan Sap 1 Wood 1 Leather Strips 3 Burnt Spriggan Wood 1 Spriggan Mask | Forage Skill Greater or Equal to 10 |
| Mehrunes' Razor Replica | Daedric Smithing | Forge | 1 | 1 Daedra Heart 1 Ingot: Steel 1 Ingot: Ebony 1 Leather Strips | Daedra - Pieces of the Past |
| Miraak's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Blue 1 Silk Cloth - Yellow |  |
| Miraak's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Blue 1 Silk Cloth - Yellow |  |
| Miraak's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Blue 1 Silk Cloth - Yellow |  |
| Miraak's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Blue 1 Silk Cloth - Yellow |  |
| Miraak's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Blue 1 Silk Cloth - Yellow |  |
| Miraak's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Blue 1 Silk Cloth - Yellow |  |
| Miraak's Sword Replica | Daedric Smithing | Forge | 1 | 1 Daedra Heart 2 Ingot: Ebony 1 Netch Leather | Killed Miraak |
| Morokei's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Yellow |  |
| Nahkriin's Hood |  | Forge | 1 | 1 Silk Thread 3 Silk Cloth - Black |  |
| Nightingale Armor | Advanced Light Smithing | Player Crafting | 1 | 1 Void Salts 6 Leather Strips 5 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Blade | Daedric Smithing | Forge | 1 | 1 Void Salts 2 Ingot: Ebony 1 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Boots | Advanced Light Smithing | Player Crafting | 1 | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Bow | Daedric Smithing | Forge | 1 | 1 Void Salts 3 Ingot: Ebony 2 Leather Strips | TG - Darkness Returns Complete |
| Nightingale Gloves | Advanced Light Smithing | Player Crafting | 1 | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Nightingale Hood | Advanced Light Smithing | Player Crafting | 1 | 1 Void Salts 2 Leather Strips 3 Leather: Dark | TG - Darkness Returns Complete |
| Noble Armguards | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 3 Leather |  |
| Noble Gilded Wristguards | Advanced Blacksmithing | Player Crafting | 1 | 2 Gold Ring 3 Leather Strips 2 Leather |  |
| Nordic Battleaxe | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 3 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - Brown | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Boots - White | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Boots - White | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Nordic Cuirass - Brown | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - Brown | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Cuirass - Brown | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Snow Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Nordic Cuirass - White | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Nordic Dagger | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 1 Leather Strips 1 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - Brown | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - Brown | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Nordic Gauntlets - White | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Gauntlets - White | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Greatsword | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Bow | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Heavy Crossbow | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 3 Ingot: Galatite |  |
| Nordic Mace | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Nordic Shield - Brown | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - Brown | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - White | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Shield - White | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Nordic Shield - White | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Nordic Sword | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 1 Leather Strips 2 Ingot: Galatite |  |
| Nordic War Axe | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Nordic Warhammer | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 3 Leather Strips 4 Ingot: Galatite |  |
| Oiled Mail and Hide | Craftsmanship | Forge | 1 | 3 Ingot: Iron 2 Leather 4 Hide Lace 1 Flammable Oil |  |
| Oiled Mail and Jacket | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Oiled Mail and Tunic | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread |  |
| Orcish Battleaxe | Orcish Blacksmithing | Forge | 1 | 2 Ingot: Steel 3 Ingot: Orichalcum 3 Leather Strips |  |
| Orcish Dagger | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish Greatsword | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Heavy Boots | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Heavy Bow | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Crossbow | Orcish Blacksmithing | Forge | 1 | 2 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace |  |
| Orcish Heavy Cuirass | Orcish Blacksmithing | Forge | 1 | 2 Ingot: Corundum 5 Ingot: Orichalcum 4 Leather Strips 2 Leather |  |
| Orcish Heavy Gauntlets | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Corundum 2 Ingot: Orichalcum 2 Leather Strips 1 Leather |  |
| Orcish Heavy Helmet | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Corundum 3 Ingot: Orichalcum 1 Leather Strips 1 Leather |  |
| Orcish Hunting Knife | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips 1 Fragment: Bone |  |
| Orcish Mace | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Shield | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Corundum 4 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Sword | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Steel 2 Ingot: Orichalcum 1 Leather Strips |  |
| Orcish War Axe | Orcish Blacksmithing | Forge | 1 | 1 Ingot: Steel 2 Ingot: Orichalcum 2 Leather Strips |  |
| Orcish Warhammer | Orcish Blacksmithing | Forge | 1 | 2 Ingot: Steel 4 Ingot: Orichalcum 3 Leather Strips |  |
| Otar's Hood |  | Forge | 1 | 1 Silk Thread 3 Silk Cloth - Black |  |
| Quicksilver Boots | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate |  |
| Quicksilver Boots | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Quicksilver Boots | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite |  |
| Quicksilver Cuirass | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Quicksilver Cuirass | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Cave Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite |  |
| Quicksilver Cuirass | Nordic Blacksmithing | Forge | 1 | 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate |  |
| Quicksilver Gauntlets | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate |  |
| Quicksilver Gauntlets | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Quicksilver Gauntlets | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite |  |
| Quicksilver Helmet | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 1 Leather Strips 1 Leather 3 Ingot: Galatite |  |
| Quicksilver Shield | Nordic Blacksmithing | Forge | 1 | 1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Quicksilver Shield | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite |  |
| Quicksilver Shield | Nordic Blacksmithing | Forge | 1 | 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate |  |
| Rahgot's Hood |  | Forge | 1 | 1 Silk Thread 1 Silk Cloth - Green 2 Silk Cloth - Grey |  |
| Riekling Headdress |  | Player Crafting | 1 | 1 Leather Strips 1 Human Skull 1 Hawk Feathers 1 Bonesap | Forage Skill Greater or Equal to 4 |
| Riekling Heavy Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 3 Hagraven Feathers 1 Human Skull 1 Leather 2 Goat Horns | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Riekling Heavy Helmet (Good) | Craftsmanship | Player Crafting | 1 | 3 Hagraven Feathers 1 Human Skull 1 Leather 2 Goat Horns | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Riekling Heavy Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 3 Hagraven Feathers 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Riekling Light Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 3 Hagraven Feathers 1 Human Skull 1 Leather 2 Goat Horns | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Riekling Light Helmet (Good) | Craftsmanship | Player Crafting | 1 | 3 Hagraven Feathers 1 Human Skull 1 Leather 2 Goat Horns | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Riekling Light Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 3 Hagraven Feathers 1 Human Skull 1 Leather 2 Goat Horns 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Robed Mail | Craftsmanship | Forge | 1 | 3 Ingot: Iron 3 Linen Cloth - Brown 4 Linen Thread |  |
| Rueful Axe Replica | Advanced Blacksmithing | Forge | 1 | 1 Ingot: Silver 4 Ingot: Steel 3 Leather Strips | Daedra - A Daedras Best Friend |
| Sabrecat Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 2 Sabre Cat Tooth 2 Leather Strips 3 Polished Ivory | Forage Skill Equal to 1,Forage Skill Less than 4 |
| Sabrecat Helmet (Good) | Craftsmanship | Player Crafting | 1 | 2 Sabre Cat Tooth 2 Leather Strips 3 Polished Ivory 3 Fragment: Ivory | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Sabrecat Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Flawless Sabre Cat Tooth 1 Bonesap 3 Polished Ivory 3 Fragment: Ivory | Forage Skill Greater or Equal to 8 |
| Savior's Hide Replica | Advanced Light Smithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate | Daedra - Ill Met By Moonlight Complete |
| Savior's Hide Replica | Advanced Light Smithing | Forge | 1 | 1 Pelt: Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather | Daedra - Ill Met By Moonlight Complete |
| Scaled Boots | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Boots | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather |  |
| Scaled Boots | Advanced Light Smithing | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Advanced Light Smithing | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Scaled Bracers | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Scaled Cuirass | Advanced Light Smithing | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 5 Leather |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Forge | 1 | 1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Forge | 1 | 1 Pelt: Sabre Cat 1 Pelt: Goat 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Goat Horns |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate |  |
| Scaled Cuirass - Horned | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate 1 Goat Horns |  |
| Scaled Helmet | Advanced Light Smithing | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Scaled Helmet | Advanced Light Smithing | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Shellbug Helmet | Ebony Blacksmithing | Forge | 1 | 1 Ingot: Ebony 1 Leather Strips 1 Leather 2 Shellbug Chitin |  |
| Shellbug Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Leather 2 Shellbug Chitin | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Shellbug Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Leather 2 Shellbug Chitin 3 Fragment: Chitin | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Shellbug Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Leather 2 Shellbug Chitin 2 Chitin Resin 4 Fragment: Chitin | Forage Skill Greater or Equal to 8 |
| Shield of Ysgramor Replica | Ebony Blacksmithing | Forge | 1 | 4 Ingot: Ebony 2 Leather Strips 1 Ingot: Galatite | Companions - Glory of the Dead Complete |
| Shrouded Boots | Craftsmanship | Player Crafting | 1 | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cowl - Maskless | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Cuirass | Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 5 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Cuirass | Craftsmanship | Player Crafting | 1 | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Gloves | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Sleeveless Cuirass | Craftsmanship | Player Crafting | 1 | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete |
| Shrouded Supple Boots | Advanced Light Smithing | Player Crafting | 1 | 3 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 3 Leather: Dark 1 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Cowl - Maskless | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 3 Leather: Dark | Dark Brotherhood Main Quest Complete |
| Shrouded Supple Gloves | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 1 Leather: Dark 2 Leather: Red | Dark Brotherhood Main Quest Complete |
| Shrouded Worn Boots | Craftsmanship | Player Crafting | 1 | 3 Leather Strips 1 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Dark 1 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cowl - Maskless | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Dark | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Cuirass | Craftsmanship | Player Crafting | 1 | 6 Leather Strips 3 Leather: Dark 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Shrouded Worn Gloves | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather: Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Silver Battlestaff | Craftsmanship | Forge | 1 | 2 Ingot: Silver 2 Ingot: Steel 1 Gem: Amethyst |  |
| Silver Greatsword | Craftsmanship | Forge | 1 | 1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips |  |
| Silver Sword | Craftsmanship | Forge | 1 | 1 Ingot: Silver 2 Ingot: Steel 1 Leather Strips |  |
| Skull Heavy Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Skull Heavy Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Skull Heavy Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Skull Light Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Skull Light Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Skull Light Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Human Skull 1 Leather 2 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Skull Staff of Chain Lightning |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Hagraven Feathers 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 6 |
| Skull Staff of Fireball |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 2 Hagraven Feathers 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 6 |
| Skull Staff of Firesparks |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 2 Hagraven Feathers 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 3 |
| Skull Staff of Healing Hands |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Hagraven Feathers 1 Glow Dust 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 6 |
| Skull Staff of Lightning Bolt |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Hagraven Feathers 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 6 |
| Skull Staff of Paralysis |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Vampire Dust 1 Pelt: Elk 2 Wood 2 Flawless Bear Tooth 3 Bonesap | Forage Skill Greater or Equal to 9 |
| Skull Staff of Storms |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Hagraven Feathers 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 6 |
| Skull Staff of the Flame Atronach |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 2 Hagraven Feathers 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 9 |
| Skull Staff of the Zombie |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 2 Hagraven Feathers 1 Vampire Dust 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Greater or Equal to 6 |
| Skulll Staff of Icy Spear |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Frost Salts 2 Hagraven Feathers 1 Pelt: Elk 2 Wood 3 Bonesap | Forage Skill Equal to 6 |
| Skyforge Steel Aegis | Advanced Blacksmithing | Forge | 1 | 2 Wood 2 Leather Strips 4 Ingot: Galatite |  |
| Skyforge Steel Battleaxe | Advanced Blacksmithing | Forge | 1 | 3 Leather Strips 4 Ingot: Galatite |  |
| Skyforge Steel Dagger | Advanced Blacksmithing | Forge | 1 | 1 Leather Strips 1 Ingot: Galatite |  |
| Skyforge Steel Greatsword | Advanced Blacksmithing | Forge | 1 | 2 Leather Strips 3 Ingot: Galatite |  |
| Skyforge Steel Heavy Bow | Advanced Blacksmithing | Forge | 1 | 3 Wood 3 Leather Strips 1 Ingot: Galatite |  |
| Skyforge Steel Mace | Advanced Blacksmithing | Forge | 1 | 2 Leather Strips 3 Ingot: Galatite |  |
| Skyforge Steel Sword | Advanced Blacksmithing | Forge | 1 | 1 Leather Strips 2 Ingot: Galatite |  |
| Skyforge Steel War Axe | Advanced Blacksmithing | Forge | 1 | 2 Leather Strips 2 Ingot: Galatite |  |
| Skyforge Steel Warhammer | Advanced Blacksmithing | Forge | 1 | 3 Leather Strips 5 Ingot: Galatite |  |
| Spellbreaker Replica | Orcish Blacksmithing,Advanced Blacksmithing | Forge | 1 | 1 Soul Gem: Grand (Filled) 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Dwarven 2 Ingot: Calcinium | Daedra - The Only Cure Complete |
| Spiked Club (Crude) | Craftsmanship | Player Crafting | 1 | 1 Wood 6 Fragment: Bone | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Spiked Club (Good) | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Leather Strips 8 Fragment: Bone | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Spiked Club (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Wood 2 Leather Strips 8 Fragment: Bone 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Spriggan Mask |  | Player Crafting | 1 | 1 Spriggan Sap 1 Wood 1 Leather Strips | Forage Skill Greater or Equal to 4 |
| Spriggan Staff of Chain Lightning |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Taproot 2 Wood | Forage Skill Greater or Equal to 6 |
| Spriggan Staff of Fireball |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 1 Taproot 2 Wood | Forage Skill Greater or Equal to 6 |
| Spriggan Staff of Firesparks |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 1 Taproot 2 Wood | Forage Skill Greater or Equal to 3 |
| Spriggan Staff of Healing Hands |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Taproot 1 Glow Dust 2 Wood | Forage Skill Greater or Equal to 6 |
| Spriggan Staff of Icy Spear |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Frost Salts 1 Taproot 2 Wood | Forage Skill Equal to 6 |
| Spriggan Staff of Lightning Bolt |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Taproot 2 Wood | Forage Skill Greater or Equal to 6 |
| Spriggan Staff of Paralysis |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Taproot 1 Vampire Dust 2 Wood | Forage Skill Greater or Equal to 9 |
| Spriggan Staff of Storms |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Taproot 2 Wood | Forage Skill Greater or Equal to 6 |
| Spriggan Staff of the Flame Atronach |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Taproot 2 Wood | Forage Skill Greater or Equal to 9 |
| Spriggan Staff of the Zombie |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Taproot 1 Vampire Dust 2 Wood | Forage Skill Greater or Equal to 6 |
| Stalhrim Battleaxe | Stalhrim Smithing | Forge | 1 | 3 Leather Strips 1 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Battlestaff | Stalhrim Smithing | Forge | 1 | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Dagger | Stalhrim Smithing | Forge | 1 | 1 Leather Strips 1 Ingot: Galatite 1 Stalhrim | A New Source of Stalhrim |
| Stalhrim Greatsword | Stalhrim Smithing | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Boots | Stalhrim Smithing | Forge | 1 | 2 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Crossbow | Stalhrim Smithing | Forge | 1 | 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Cuirass | Stalhrim Smithing | Forge | 1 | 4 Leather Strips 2 Leather 2 Ingot: Galatite 5 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Gauntlets | Stalhrim Smithing | Forge | 1 | 2 Leather Strips 1 Leather 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Heavy Helmet | Stalhrim Smithing | Forge | 1 | 1 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Boots | Stalhrim Smithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Bow | Stalhrim Smithing | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Cuirass | Stalhrim Smithing | Forge | 1 | 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Gauntlets | Stalhrim Smithing | Forge | 1 | 1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Helmet | Stalhrim Smithing | Forge | 1 | 1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Light Shield | Stalhrim Smithing | Forge | 1 | 2 Ingot: Quicksilver 2 Leather Strips 4 Stalhrim | A New Source of Stalhrim |
| Stalhrim Mace | Stalhrim Smithing | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 3 Stalhrim | A New Source of Stalhrim |
| Stalhrim Staff of Paralysis | Artificer's Insight | Forge | 1 | 1 Soul Gem: Grand (Filled) 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Frost Atronach | Artificer's Insight | Forge | 1 | 1 Soul Gem: Grand (Filled) 1 Stalhrim Battlestaff |  |
| Stalhrim Staff of the Storm Atronach | Artificer's Insight | Forge | 1 | 1 Soul Gem: Grand (Filled) 1 Stalhrim Battlestaff |  |
| Stalhrim Sword | Stalhrim Smithing | Forge | 1 | 1 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim War Axe | Stalhrim Smithing | Forge | 1 | 2 Leather Strips 1 Ingot: Galatite 2 Stalhrim | A New Source of Stalhrim |
| Stalhrim Warhammer | Stalhrim Smithing | Forge | 1 | 3 Leather Strips 2 Ingot: Galatite 4 Stalhrim | A New Source of Stalhrim |
| Steel Battleaxe | Craftsmanship | Forge | 1 | 4 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Battlestaff | Craftsmanship | Forge | 1 | 1 Ingot: Steel 4 Wood 2 Leather Strips |  |
| Steel Bearskin Hood - Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Black |  |
| Steel Bearskin Hood - Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Brown |  |
| Steel Bearskin Hood - Ornate Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Ornate Black |  |
| Steel Bearskin Hood - Ornate Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Ornate Brown |  |
| Steel Bearskin Hood - Ornate White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Ornate White |  |
| Steel Bearskin Hood - Trimmed Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Trimmed Black |  |
| Steel Bearskin Hood - Trimmed Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Trimmed Brown |  |
| Steel Bearskin Hood - Trimmed White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - Trimmed White |  |
| Steel Bearskin Hood - White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Bearskin Hood - White |  |
| Steel Boots | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots | Craftsmanship | Forge | 1 | 1 Pelt: Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Craftsmanship | Forge | 1 | 1 Pelt: Ice Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Boots - White | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate |  |
| Steel Boots - White | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Braced Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Steel 4 Hide Lace 2 Fur Plate |  |
| Steel Bracers | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Cuirass | Craftsmanship | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | Craftsmanship | Forge | 1 | 1 Pelt: Ice Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Cuirass - White | Craftsmanship | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Cuirass - White | Craftsmanship | Forge | 1 | 4 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Dagger | Craftsmanship | Forge | 1 | 1 Ingot: Steel 1 Leather Strips |  |
| Steel Furred Plate Cuirass | Advanced Blacksmithing | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Gauntlets | Craftsmanship | Forge | 1 | 1 Pelt: Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Gauntlets - White | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Craftsmanship | Forge | 1 | 1 Pelt: Ice Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Gauntlets - White | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Greatsword | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips |  |
| Steel Greaves | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather |  |
| Steel Heavy Crossbow | Craftsmanship | Forge | 1 | 3 Ingot: Steel 3 Wood 2 Hide Lace |  |
| Steel Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet | Craftsmanship | Forge | 1 | 1 Pelt: Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | Craftsmanship | Forge | 1 | 1 Pelt: Ice Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Helmet - White | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate |  |
| Steel Horned Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather |  |
| Steel Horned Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns |  |
| Steel Hunting Knife | Craftsmanship | Forge | 1 | 1 Ingot: Steel 1 Leather Strips 1 Fragment: Bone |  |
| Steel Mace | Craftsmanship | Forge | 1 | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Pauldroned Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Pauldroned Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Wolf 5 Ingot: Steel 4 Leather Strips 1 Leather |  |
| Steel Pauldroned Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 2 Leather |  |
| Steel Pauldroned Cuirass - White | Craftsmanship | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate |  |
| Steel Plate Boots | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Cuirass | Advanced Blacksmithing | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather |  |
| Steel Plate Gauntlets | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather |  |
| Steel Plate Helmet | Advanced Blacksmithing | Forge | 1 | 3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather |  |
| Steel Plate Shield | Advanced Blacksmithing | Forge | 1 | 4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips |  |
| Steel Robed Plate Cuirass | Advanced Blacksmithing | Forge | 1 | 5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate |  |
| Steel Scimitar | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips |  |
| Steel Shield | Craftsmanship | Forge | 1 | 4 Ingot: Steel 2 Wood 2 Leather Strips |  |
| Steel Sword | Craftsmanship | Forge | 1 | 2 Ingot: Steel 1 Leather Strips |  |
| Steel War Axe | Craftsmanship | Forge | 1 | 2 Ingot: Steel 1 Wood 2 Leather Strips |  |
| Steel Warhammer | Craftsmanship | Forge | 1 | 5 Ingot: Steel 2 Wood 3 Leather Strips |  |
| Steel Wolfskin Hood - Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Black |  |
| Steel Wolfskin Hood - Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Brown |  |
| Steel Wolfskin Hood - Dark Trimmed Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Black |  |
| Steel Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Brown |  |
| Steel Wolfskin Hood - Dark Trimmed White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed White |  |
| Steel Wolfskin Hood - Light Trimmed Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Black |  |
| Steel Wolfskin Hood - Light Trimmed Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Brown |  |
| Steel Wolfskin Hood - Light Trimmed White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Light Trimmed White |  |
| Steel Wolfskin Hood - Noble Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Noble Black |  |
| Steel Wolfskin Hood - Noble Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Noble Brown |  |
| Steel Wolfskin Hood - Noble White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Noble White |  |
| Steel Wolfskin Hood - Ornate Black | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Ornate Black |  |
| Steel Wolfskin Hood - Ornate Brown | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Ornate Brown |  |
| Steel Wolfskin Hood - Ornate White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - Ornate White |  |
| Steel Wolfskin Hood - White | Craftsmanship | Forge | 1 | 1 Steel Helmet 1 Wolfskin Hood - White |  |
| Stone Hatchet | Craftsmanship | Player Crafting | 1 | 2 Deadwood 1 Sharp Rock |  |
| Stone Hatchet | Craftsmanship | Player Crafting | 1 | 1 Wood 1 Sharp Rock |  |
| Stone Hunting Knife |  | Player Crafting | 1 | 1 Sharp Rock 1 Bone Hunting Knife | Forage Skill Greater or Equal to 1 |
| Stormcloak General Boots | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 2 Leather: Dark |  |
| Stormcloak Heavy Crossbow | Craftsmanship | Forge | 1 | 1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace |  |
| Stormcloak Heavy Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Iron 1 Leather Strips 1 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Light Cuirass | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 4 Leather | Civil War - Joined Stormcloaks |
| Stormcloak Officer Boots | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Bracers | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 2 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Cave Bear 3 Ingot: Steel 4 Leather Strips 4 Leather | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Officer Helmet | Craftsmanship | Forge | 1 | 1 Pelt: Cave Bear 2 Ingot: Steel 1 Leather Strips | Civil War - Joined Stormcloaks,Civil War - Conquered a hold |
| Stormcloak Sleeved Heavy Cuirass | Craftsmanship | Forge | 1 | 2 Ingot: Iron 5 Leather Strips 5 Leather | Civil War - Joined Stormcloaks |
| Studded Cuirass | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Leather Strips 4 Leather 2 Fur Plate |  |
| Studded Cuirass | Craftsmanship | Forge | 1 | 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Cuirass | Craftsmanship | Forge | 1 | 1 Pelt: Elk 2 Ingot: Iron 4 Leather Strips 4 Leather |  |
| Studded Furred Cuirass | Craftsmanship | Forge | 1 | 4 Leather 4 Hide Lace 2 Fur Plate |  |
| Talisman of the Beaver Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Kynareth | Forage Skill Greater or Equal to 7 |
| Talisman of the Buck Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Julianos | Forage Skill Greater or Equal to 7 |
| Talisman of the Flower Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Julianos | Forage Skill Greater or Equal to 7 |
| Talisman of the Harvest Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Kynareth | Forage Skill Greater or Equal to 7 |
| Talisman of the Hunter's Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Kynareth | Forage Skill Greater or Equal to 7 |
| Talisman of the Long Nights Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Kynareth | Forage Skill Greater or Equal to 7 |
| Talisman of the Pink Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Hircine | Forage Skill Greater or Equal to 7 |
| Talisman of the Snow Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Hircine | Forage Skill Greater or Equal to 7 |
| Talisman of the Strawberry Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Julianos | Forage Skill Greater or Equal to 7 |
| Talisman of the Sturgeon Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Julianos | Forage Skill Greater or Equal to 7 |
| Talisman of the Wolf Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Hircine | Forage Skill Greater or Equal to 7 |
| Talisman of the Worm Moon |  | Player Crafting | 1 | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Hircine | Forage Skill Greater or Equal to 7 |
| Thieves Guild Boots | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Boots - Grey | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cowl | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cowl - Grey | Craftsmanship | Player Crafting | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Cuirass | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Cuirass - Grey | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Gloves | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Gloves - Grey | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Hood | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Hood - Grey | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots | Advanced Light Smithing | Player Crafting | 1 | 3 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Boots - Grey | Advanced Light Smithing | Player Crafting | 1 | 3 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass | Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 6 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Cuirass - Grey | Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 6 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Gloves - Grey | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Hood | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather | TG - Loud and Clear Complete |
| Thieves Guild Improved Hood - Grey | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 2 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Improved Sleeveless Cuirass - Grey | Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Light Crossbow | Advanced Blacksmithing | Forge | 1 | 2 Ingot: Steel 2 Ingot: Corundum 2 Wood 1 Leather: Dark 4 Hide Lace |  |
| Thieves Guild Master's Boots | Advanced Light Smithing | Player Crafting | 1 | 3 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cowl | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Cuirass | Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 8 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Gloves | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Hood | Advanced Light Smithing | Player Crafting | 1 | 2 Leather Strips 3 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Master's Sleeveless Cuirass | Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 6 Leather: Dark | TG - Under New Management Complete |
| Thieves Guild Sleeveless Cuirass | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Cuirass - Grey | Craftsmanship,Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 5 Leather 1 Dye - Grey | TG - Loud and Clear Complete |
| Thieves Guild Sleeveless Improved Cuirass | Advanced Light Smithing | Player Crafting | 1 | 6 Leather Strips 5 Leather | TG - Loud and Clear Complete |
| Troll Heavy Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Troll Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Troll Heavy Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Troll Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Troll Heavy Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Troll Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Troll Light Helmet (Crude) | Craftsmanship | Player Crafting | 1 | 1 Troll Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 1,Forage Skill Less than 4 |
| Troll Light Helmet (Good) | Craftsmanship | Player Crafting | 1 | 1 Troll Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 4,Forage Skill Less than 8 |
| Troll Light Helmet (Superlative) | Craftsmanship | Player Crafting | 1 | 1 Troll Skull 1 Leather 1 Bonesap | Forage Skill Greater or Equal to 8 |
| Troll Skull Headdress |  | Player Crafting | 1 | 1 Troll Skull 1 Elves Ear 1 Mammoth Tusk 1 Leather Strips 1 Bonesap | Forage Skill Greater or Equal to 4 |
| Unenchanted Staff of Alteration |  | Player Crafting | 1 | 2 Doe Antlers 2 Wood 1 Leather Strips 2 Antler Paste | Forage Skill Greater or Equal to 3 |
| Unenchanted Staff of Alteration | Arcane Craftsmanship | Forge | 1 | 1 Soul Gem: Grand (Empty) 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Conjuration |  | Player Crafting | 1 | 3 Mudcrab Chitin 2 Wood 1 Leather Strips 2 Black Bonesap | Forage Skill Greater or Equal to 3 |
| Unenchanted Staff of Conjuration | Arcane Craftsmanship | Forge | 1 | 1 Soul Gem: Grand (Empty) 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Destruction |  | Player Crafting | 1 | 2 Bone Meal 2 Wood 1 Leather Strips 2 Antler Paste | Forage Skill Greater or Equal to 3 |
| Unenchanted Staff of Destruction | Arcane Craftsmanship | Forge | 1 | 1 Soul Gem: Grand (Empty) 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Illusion |  | Player Crafting | 1 | 2 Wood 1 Leather Strips 1 Polished Ivory 2 Red Bonesap | Forage Skill Greater or Equal to 3 |
| Unenchanted Staff of Illusion | Arcane Craftsmanship | Forge | 1 | 1 Soul Gem: Grand (Empty) 1 Ingot: Steel 3 Wood |  |
| Unenchanted Staff of Restoration |  | Player Crafting | 1 | 2 Wood 1 Leather Strips 1 Polished Ivory 2 White Bonesap | Forage Skill Greater or Equal to 3 |
| Unenchanted Staff of Restoration | Arcane Craftsmanship | Forge | 1 | 1 Soul Gem: Grand (Empty) 1 Ingot: Steel 3 Wood |  |
| Vampire Boots | Advanced Light Smithing | Forge | 1 | 1 Ingot: Iron 3 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass | Advanced Light Smithing | Player Crafting | 1 | 5 Leather Strips 5 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass | Advanced Light Smithing | Player Crafting | 1 | 5 Leather Strips 5 Leather 1 Dye - Grey | DawnGuard - Prophet (Vampire) Complete |
| Vampire Cuirass | Advanced Light Smithing | Player Crafting | 1 | 5 Leather Strips 5 Leather: Red | DawnGuard - Prophet (Vampire) Complete |
| Vampire Gauntlets | Advanced Light Smithing | Forge | 1 | 1 Ingot: Iron 2 Leather Strips 2 Leather: Dark | DawnGuard - Prophet (Vampire) Complete |
| Vampire Royal Cuirass | Advanced Light Smithing | Forge | 1 | 2 Ingot: Steel 5 Leather Strips 6 Leather: Dark | DawnGuard - Prophet (Vampire) Complete,DawnGuard - Killed Harkon |
| Vokun's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Yellow |  |
| Volendrung Replica | Daedric Smithing | Forge | 1 | 1 Daedra Heart 4 Ingot: Ebony 3 Leather Strips | Daedra - The Cursed Tribe Complete |
| Volsung's Hood |  | Forge | 1 | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Yellow |  |
| Wand of Chain Lightning |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 6 |
| Wand of Fireball |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 6 |
| Wand of Flames |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 3 |
| Wand of Healing Hands |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Glow Dust 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 6 |
| Wand of Icy Spear |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Frost Salts 1 Spriggan Sap 1 Wood | Forage Skill Equal to 6 |
| Wand of Lightning Bolt |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 6 |
| Wand of Paralysis |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Vampire Dust 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 9 |
| Wand of Storms |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 6 |
| Wand of the Atronach |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 9 |
| Wand of the Zombie |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Vampire Dust 1 Spriggan Sap 1 Wood | Forage Skill Greater or Equal to 6 |
| Wolf Boots | Craftsmanship | Forge | 1 | 1 Pelt: Cave Bear 3 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Boots | Craftsmanship | Forge | 1 | 3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Cuirass | Craftsmanship | Forge | 1 | 2 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather | Companions - Proving Honor Complete |
| Wolf Cuirass | Craftsmanship | Forge | 1 | 5 Ingot: Steel 4 Leather Strips 2 Leather 6 Fur Plate | Companions - Proving Honor Complete |
| Wolf Gauntlets | Craftsmanship | Forge | 1 | 1 Pelt: Cave Bear 2 Ingot: Steel 2 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Gauntlets | Craftsmanship | Forge | 1 | 2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate | Companions - Proving Honor Complete |
| Wolf Helmet | Craftsmanship | Forge | 1 | 3 Ingot: Steel 1 Leather Strips 1 Leather | Companions - Proving Honor Complete |
| Wolf Shield | Craftsmanship | Forge | 1 | 5 Ingot: Steel 2 Leather Strips | Companions - Proving Honor Complete |
| Wolfskin Cloak - Black | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal |  |
| Wolfskin Cloak - Brown | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips |  |
| Wolfskin Cloak - Dark Trimmed Black | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed Brown | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed White | Craftsmanship | Player Crafting | 1 | 4 Pelt: Ice Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Black | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Brown | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed White | Craftsmanship | Player Crafting | 1 | 4 Pelt: Ice Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Black | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Brown | Craftsmanship | Player Crafting | 1 | 4 Pelt: Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate White | Craftsmanship | Player Crafting | 1 | 4 Pelt: Ice Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - White | Craftsmanship | Player Crafting | 1 | 4 Pelt: Ice Wolf 3 Leather Strips |  |
| Wolfskin Hood - Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal |  |
| Wolfskin Hood - Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips |  |
| Wolfskin Hood - Dark Trimmed Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Ice Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Ice Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Black | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Brown | Craftsmanship | Player Crafting | 1 | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - White | Craftsmanship | Player Crafting | 1 | 1 Pelt: Ice Wolf 1 Leather Strips |  |
| Wood Mask and Hood |  | Player Crafting | 1 | 1 Wood 1 Leather Strips 1 Leather | Forage Skill Greater or Equal to 1 |
| Wood Staff of Chain Lightning |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 6 |
| Wood Staff of Fireball |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 6 |
| Wood Staff of Firesparks |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Fire Salts 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 3 |
| Wood Staff of Healing Hands |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Glow Dust 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 6 |
| Wood Staff of Icy Spear |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Frost Salts 1 Spriggan Sap 2 Wood | Forage Skill Equal to 6 |
| Wood Staff of Lightning Bolt |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 6 |
| Wood Staff of Paralysis |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Vampire Dust 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 9 |
| Wood Staff of Storms |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 6 |
| Wood Staff of the Flame Atronach |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Void Salts 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 9 |
| Wood Staff of the Zombie |  | Player Crafting | 1 | 1 Soul Gem: Grand (Filled) 1 Vampire Dust 1 Spriggan Sap 2 Wood | Forage Skill Greater or Equal to 6 |
| Wooden Battlestaff | Craftsmanship | Player Crafting | 1 | 5 Wood |  |
| Wooden Fishing Rod | Craftsmanship | Forge | 1 | 1 Ingot: Iron 1 Wood |  |
| Wooden Heavy Bow | Craftsmanship | Player Crafting | 1 | 4 Hide Lace 2 Deadwood |  |
| Wooden Heavy Bow | Craftsmanship | Player Crafting | 1 | 3 Wood 2 Hide Lace |  |
| Wooden Light Bow | Craftsmanship | Player Crafting | 1 | 2 Wood 2 Hide Lace |  |
| Wooden Sword |  | Player Crafting | 1 | 1 Wood | Forage Skill Greater or Equal to 2 |
| Wooden Sword | Craftsmanship | Player Crafting | 1 | 2 Wood |  |
| Wooden Walking Stick |  | Player Crafting | 1 | 2 Leather Strips 4 Deadwood |  |
| Wooden Walking Stick |  | Player Crafting | 1 | 2 Wood 2 Leather Strips |  |
| Wuuthrad Replica | Ebony Blacksmithing | Forge | 1 | 3 Ingot: Ebony 3 Leather Strips 2 Ingot: Galatite | Companions - Glory of the Dead Complete |


</div>

