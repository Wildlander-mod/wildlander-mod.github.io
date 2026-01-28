---
title: Armor Crafting Recipes
layout: default
nav_order: 4
has_children: false
description: Armor crafting recipes and materials.
---

## Armor Crafting Reference

Quick lookup table showing the perks and materials required to craft different armor types. For detailed crafting instructions, see [Blacksmith Recipes](https://wiki.wildlandermod.com/_10-Crafting/blacksmith/).

---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- All perks required for crafting
- Complete list of materials needed

Use the search bar and filter below to find specific armor recipes by perks needed.

---

## Armor Crafting Table Data

<style>
#armor-table-tooltip {
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

#armor-table-tooltip div {
  margin: 4px 0;
}

#armor-table-tooltip strong {
  color: #f77ef1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

function initArmorTabletooltips() {
  const table = document.querySelector('.armor-table-recipes-table table');
  if (!table) return;
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    if (!itemCell) return;
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showArmorTabletooltip(e, row));
    itemCell.addEventListener('mousemove', updateArmorTabletooltipPosition);
    itemCell.addEventListener('mouseleave', hideArmorTabletooltip);
  });
}

function showArmorTabletooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    perksNeeded: cells[1]?.textContent || '',
    itemsRequired: cells[2]?.textContent || ''
  };
  
  let tooltip = document.getElementById('armor-table-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'armor-table-tooltip';
    tooltip.className = 'armor-table-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    tooltip.style.backgroundColor = '#333';
    tooltip.style.color = '#fff';
    tooltip.style.padding = '8px 12px';
    tooltip.style.borderRadius = '4px';
    tooltip.style.maxWidth = '400px';
    tooltip.style.wordWrap = 'break-word';
    tooltip.style.fontSize = '12px';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Perks Needed:</strong> ${data.perksNeeded}</div>
    <div><strong>Items Required:</strong> ${data.itemsRequired}</div>
  `;
  tooltip.style.display = 'block';
  updateArmorTabletooltipPosition(event);
}

function updateArmorTabletooltipPosition(event) {
  const tooltip = document.getElementById('armor-table-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideArmorTabletooltip() {
  const tooltip = document.getElementById('armor-table-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function filterArmorTableRecipes() {
  const searchTerm = document.getElementById('armorTableSearch').value.toLowerCase();
  const perksFilter = document.getElementById('armorTablePerksFilter').value;
  
  const table = document.querySelector('.armor-table-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = (cells[0]?.textContent || '').toLowerCase();
    const itemsRequired = (cells[2]?.textContent || '').toLowerCase();
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const perksCellText = cells[1]?.textContent.trim() || '';
    const perksList = perksCellText.split(',').map(p => p.trim());
    const perksMatch = !perksFilter || perksList.includes(perksFilter);
    
    const isVisible = searchMatch && perksMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountArmorTable();
  initArmorTabletooltips();
}

function updateFilterCountArmorTable() {
  const table = document.querySelector('.armor-table-recipes-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountArmorTable');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearArmorTableFilters() {
  document.getElementById('armorTableSearch').value = '';
  document.getElementById('armorTablePerksFilter').value = '';
  filterArmorTableRecipes();
}

function initArmorTableFilters() {
  const table = document.querySelector('.armor-table-recipes-table table');
  if (!table) {
    console.error('Armor Table Recipes table not found');
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
  
  const perksFilter = document.getElementById('armorTablePerksFilter');
  Array.from(perks).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perksFilter.appendChild(option);
  });
  
  document.getElementById('armorTableSearch').addEventListener('input', filterArmorTableRecipes);
  document.getElementById('armorTablePerksFilter').addEventListener('change', filterArmorTableRecipes);
  initArmorTabletooltips();
  updateFilterCountArmorTable();
}

$(document).ready(function(){
  initArmorTableFilters();
});

</script>

<div class="armor-table-recipes-controls">
  <input type="text" id="armorTableSearch" placeholder="Search (Item Name, Materials)..." />
  <select id="armorTablePerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersArmorTable" onclick="clearArmorTableFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-armor-table" id="filterResultCountArmorTable"></div>

<div class="armor-table-recipes-table" markdown="1">

| Produced Item Name | Perks Needed | Items Required |
|:---|:---|:---|
| Aetherial Shield | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Aetherium Boots | Legendary Blacksmithing | 1 Ingot: Gold |
| Aetherium Cuirass | Legendary Blacksmithing | 1 Ingot: Gold |
| Aetherium Gauntlets | Legendary Blacksmithing | 1 Ingot: Gold |
| Aetherium Helmet | Legendary Blacksmithing | 1 Ingot: Gold |
| Ahzidal's Boots | Advanced Blacksmithing | 1 Ingot: Steel |
| Ahzidal's Cuirass | Advanced Blacksmithing | 1 Ingot: Steel |
| Ahzidal's Gauntlets | Advanced Blacksmithing | 1 Ingot: Steel |
| Ahzidal's Helmet | Advanced Blacksmithing | 1 Ingot: Steel |
| Ancient Nordic Boots | Craftsmanship | 1 Ingot: Iron |
| Ancient Nordic Cuirass | Craftsmanship | 1 Ingot: Iron |
| Ancient Nordic Gauntlets | Craftsmanship | 1 Ingot: Iron |
| Ancient Nordic Helmet | Craftsmanship | 1 Ingot: Iron |
| Ancient Nordic Helmet - Antlers | Craftsmanship | 1 Ingot: Iron |
| Ancient Nordic Hero Boots | Advanced Blacksmithing | 1 Ingot: Corundum |
| Ancient Nordic Hero Cuirass | Advanced Blacksmithing | 1 Ingot: Corundum |
| Ancient Nordic Hero Gauntlets | Advanced Blacksmithing | 1 Ingot: Corundum |
| Ancient Nordic Hero Helm | Advanced Blacksmithing | 1 Ingot: Corundum |
| Armor of the Old Gods | Craftsmanship | 1 Leather |
| Auriel's Shield | Legendary Blacksmithing | 1 Ingot: Moonstone |
| Auriel's Shield Replica | Elven Blacksmithing | 1 Ingot: Moonstone |
| Blackguard's Boots | Advanced Light Smithing | 1 Leather |
| Blackguard's Cuirass | Advanced Light Smithing | 1 Leather |
| Blackguard's Gloves | Advanced Light Smithing | 1 Leather |
| Blackguard's Hood | Advanced Light Smithing | 1 Leather |
| Blades Boots | Craftsmanship | 1 Ingot: Corundum |
| Blades Cuirass | Craftsmanship | 1 Ingot: Corundum |
| Blades Gauntlets | Craftsmanship | 1 Ingot: Corundum |
| Blades Helmet | Craftsmanship | 1 Ingot: Corundum |
| Blades Shield | Craftsmanship | 1 Ingot: Corundum |
| Bonemold Boots | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Cuirass | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Gauntlets | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Helmet | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Improved Boots | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Improved Cuirass | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Improved Gauntlets | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Improved Helmet | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Improved Pauldroned Cuirass | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Improved Shield | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Pauldroned Cuirass | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Pauldroned Cuirass - Guard's | Morrowind Smithing 1 | 2 Bone Meal |
| Bonemold Shield | Morrowind Smithing 1 | 2 Bone Meal |
| Boots of the Old Gods | Craftsmanship | 1 Leather |
| Chitin Heavy Boots | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Heavy Cuirass | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Heavy Gauntlets | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Heavy Helmet | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Light Boots | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Light Bracers | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Light Cuirass | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Light Helmet | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Light Shield | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Morag Tong Boots | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Morag Tong Bracers | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Morag Tong Cuirass | Morrowind Smithing 2 | 1 Chitin Plate |
| Chitin Morag Tong Elite Boots | Morrowind Smithing 2 | 1 Leather |
| Chitin Morag Tong Elite Bracers | Morrowind Smithing 2 | 1 Leather |
| Chitin Morag Tong Elite Cuirass | Morrowind Smithing 2 | 1 Leather |
| Chitin Morag Tong Elite Hood | Morrowind Smithing 2 | 1 Leather |
| Chitin Morag Tong Hood | Morrowind Smithing 2 | 1 Chitin Plate |
| Circle Boots | Advanced Blacksmithing | 1 Ingot: Galatite |
| Circle Cuirass | Advanced Blacksmithing | 1 Ingot: Galatite |
| Circle Gauntlets | Advanced Blacksmithing | 1 Ingot: Galatite |
| Circle Helmet | Advanced Blacksmithing | 1 Ingot: Galatite |
| Circle Shield | Advanced Blacksmithing | 1 Ingot: Galatite |
| Daedric Boots | Daedric Smithing | 1 Ingot: Ebony |
| Daedric Cuirass | Daedric Smithing | 1 Ingot: Ebony |
| Daedric Gauntlets | Daedric Smithing | 1 Ingot: Ebony |
| Daedric Helmet | Daedric Smithing | 1 Ingot: Ebony |
| Daedric Shield | Daedric Smithing | 1 Ingot: Ebony |
| Dawnguard Heavy Boots | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Heavy Cuirass - Black | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Heavy Cuirass - Grey | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Heavy Gauntlets | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Heavy Helmet | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Heavy Shield | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Light Boots | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Light Cuirass - Black | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Light Cuirass - Red | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Light Gauntlets | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Light Helmet | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Reinforced Light Cuirass - Blue | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Rune Shield | Craftsmanship | 1 Ingot: Steel |
| Dawnguard Rune Shield Replica | Ebony Blacksmithing | 1 Ingot: Ebony |
| Deathbrand Boots | Stalhrim Smithing | 1 Stalhrim |
| Deathbrand Cuirass | Stalhrim Smithing | 1 Stalhrim |
| Deathbrand Gauntlets | Stalhrim Smithing | 1 Stalhrim |
| Deathbrand Helm | Stalhrim Smithing | 1 Stalhrim |
| Dragonplate Bearskin Hood - Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - Ornate Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - Ornate Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - Ornate White | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - Trimmed Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - Trimmed Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - Trimmed White | Craftsmanship | 1 Dragon Scales |
| Dragonplate Bearskin Hood - White | Craftsmanship | 1 Dragon Scales |
| Dragonplate Boots | Draconic Blacksmithing | 1 Dragon Bone |
| Dragonplate Cuirass | Draconic Blacksmithing | 1 Dragon Bone |
| Dragonplate Gauntlets | Draconic Blacksmithing | 1 Dragon Bone |
| Dragonplate Helmet | Draconic Blacksmithing | 1 Dragon Bone |
| Dragonplate Shield | Draconic Blacksmithing | 1 Dragon Bone |
| Dragonplate Wolfskin Hood - Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Dark Trimmed Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Dark Trimmed White | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Light Trimmed Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Light Trimmed Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Light Trimmed White | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Noble Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Noble Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Noble White | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Ornate Black | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Ornate Brown | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - Ornate White | Craftsmanship | 1 Dragon Scales |
| Dragonplate Wolfskin Hood - White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Ornate Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Ornate Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Ornate White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Trimmed Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Trimmed Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - Trimmed White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Bearskin Hood - White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Boots | Draconic Blacksmithing | 1 Dragon Scales |
| Dragonscale Cuirass | Draconic Blacksmithing | 1 Dragon Scales |
| Dragonscale Gauntlets | Draconic Blacksmithing | 1 Dragon Scales |
| Dragonscale Helmet | Draconic Blacksmithing | 1 Dragon Scales |
| Dragonscale Shield | Draconic Blacksmithing | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Dark Trimmed Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Dark Trimmed White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Light Trimmed Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Light Trimmed Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Light Trimmed White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Noble Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Noble Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Noble White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Ornate Black | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Ornate Brown | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - Ornate White | Craftsmanship | 1 Dragon Scales |
| Dragonscale Wolfskin Hood - White | Craftsmanship | 1 Dragon Scales |
| Dwarven Boots | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Dwarven Cuirass | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Dwarven Gauntlets | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Dwarven Helmet | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Dwarven Shield | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Ebony Boots | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Boots - Gilded | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Boots - Silvered | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Cuirass | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Cuirass - Gilded | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Cuirass - Silvered | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Gauntlets | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Gauntlets - Gilded | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Gauntlets - Silvered | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Helmet | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Helmet - Gilded | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Helmet - Silvered | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Mail | Legendary Blacksmithing,Craftsmanship | 1 Ingot: Ebony |
| Ebony Mail | Legendary Blacksmithing | 1 Ingot: Ebony |
| Ebony Mail Replica | Advanced Blacksmithing | 1 Ingot: Ebony |
| Ebony Mail Replica | Advanced Blacksmithing | 1 Ingot: Ebony |
| Ebony Mail Replica - Gilded | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Mail Replica - Gilded | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Mail Replica - Silvered | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Mail Replica - Silvered | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Shield | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Shield - Gilded | Ebony Blacksmithing | 1 Ingot: Ebony |
| Ebony Shield - Silvered | Ebony Blacksmithing | 1 Ingot: Ebony |
| Elven Boots | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Boots - Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Boots - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Boots - Thalmor Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Cuirass | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Cuirass - Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Cuirass - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Cuirass - Thalmor Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Gauntlets | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Gauntlets - Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Gauntlets - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Gauntlets - Thalmor Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Helmet | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Helmet - Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Helmet - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Helmet - Thalmor Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Boots | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Boots - Thalmor | Advanced Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Cuirass | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Cuirass - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Gauntlets | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Gauntlets - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Helmet | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Light Helmet - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Shield | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Shield - Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Shield - Thalmor | Elven Blacksmithing | 1 Ingot: Calcinium |
| Elven Shield - Thalmor Gilded | Elven Blacksmithing | 1 Ingot: Calcinium |
| Falmer Boots | Craftsmanship | 1 Chaurus Chitin |
| Falmer Bracers | Craftsmanship | 1 Chaurus Chitin |
| Falmer Cuirass | Craftsmanship | 1 Chaurus Chitin |
| Falmer Hardened Boots | Ebony Blacksmithing | 1 Ingot: Ebony |
| Falmer Hardened Cuirass | Ebony Blacksmithing | 1 Ingot: Ebony |
| Falmer Hardened Gauntlets | Ebony Blacksmithing | 1 Ingot: Ebony |
| Falmer Hardened Helmet | Ebony Blacksmithing | 1 Ingot: Ebony |
| Falmer Heavy Boots | Advanced Blacksmithing | 1 Chaurus Chitin |
| Falmer Heavy Cuirass | Advanced Blacksmithing | 1 Chaurus Chitin |
| Falmer Heavy Gauntlets | Advanced Blacksmithing | 1 Chaurus Chitin |
| Falmer Heavy Helmet | Advanced Blacksmithing | 1 Chaurus Chitin |
| Falmer Helmet | Craftsmanship | 1 Chaurus Chitin |
| Falmer Shield | Craftsmanship | 1 Chaurus Chitin |
| Forsworn Boots | Craftsmanship | 1 Leather |
| Forsworn Cuirass | Craftsmanship | 1 Leather |
| Forsworn Gauntlets | Craftsmanship | 1 Leather |
| Forsworn Headdress | Craftsmanship | 1 Leather |
| Fur Boots | Craftsmanship | 1 Fur Plate |
| Fur Bracers | Craftsmanship | 1 Fur Plate |
| Fur Cuirass | Craftsmanship | 1 Fur Plate |
| Fur Gauntlets | Craftsmanship | 1 Fur Plate |
| Fur Guard's Boots | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - Falkreath | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - Haafingar | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - Hjaalmarch | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - The Pale | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - The Reach | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - The Rift | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - Whiterun | Craftsmanship | 1 Leather |
| Fur Guard's Cuirass - Winterhold | Craftsmanship | 1 Leather |
| Fur Guard's Gauntlets | Craftsmanship | 1 Leather |
| Fur Helmet | Craftsmanship | 1 Fur Plate |
| Fur Kilt | Craftsmanship | 1 Fur Plate |
| Fur Mantled Kilt | Craftsmanship | 1 Fur Plate |
| Fur Shoes | Craftsmanship | 1 Fur Plate |
| Fur Sleeveless Cuirass | Craftsmanship | 1 Fur Plate |
| Gauntlets of the Old Gods | Craftsmanship | 1 Leather |
| General Carius' Cuirass | Craftsmanship | 1 Ingot: Steel |
| General Tullius' Cuirass | Craftsmanship | 1 Ingot: Steel |
| Glass Boots | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Boots - Thalmor | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Boots - Vvardenfell | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Cuirass | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Cuirass - Thalmor | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Cuirass - Vvardenfell | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Gauntlets | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Gauntlets - Thalmor | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Gauntlets - Vvardenfell | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Helmet | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Helmet - Thalmor | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Helmet - Vvardenfell | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Shield | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Shield - Thalmor | Glass Blacksmithing | 1 Ingot: Malachite |
| Glass Shield - Vvardenfell | Glass Blacksmithing | 1 Ingot: Malachite |
| Gloves of the Pugilist | Craftsmanship | 1 Leather |
| Helm of Yngol | Craftsmanship | 1 Ingot: Corundum |
| Helm of Yngol Replica | Advanced Blacksmithing | 1 Ingot: Corundum |
| Helmet of the Old Gods | Craftsmanship | 1 Leather |
| Hide Boots | Craftsmanship | 1 Leather |
| Hide Boots - Movarth's | Craftsmanship | 1 Leather |
| Hide Bracers | Craftsmanship | 1 Leather |
| Hide Cuirass | Craftsmanship | 1 Leather |
| Hide Helmet | Craftsmanship | 1 Leather |
| Hide Shield | Craftsmanship | 1 Leather |
| Horse Armor: Black Hand Barding and Saddle | Advanced Blacksmithing | 1 Ingot: Steel |
| Horse Armor: Black Hand Barding and Saddle - Adorned | Advanced Blacksmithing | 1 Ingot: Steel |
| Horse Armor: Cleric Barding and Saddle | Ebony Blacksmithing | 1 Ingot: Moonstone |
| Horse Armor: Daedric Barding and Saddle | Daedric Smithing | 1 Ingot: Ebony |
| Horse Armor: Dawnguard Barding and Saddle | Craftsmanship | 1 Ingot: Steel |
| Horse Armor: Dawnguard Barding and Saddle - Adorned | Craftsmanship | 1 Ingot: Steel |
| Horse Armor: Divine Aegis Barding and Saddle | Glass Blacksmithing | 1 Ingot: Malachite |
| Horse Armor: Dragonbone Barding and Saddle | Draconic Blacksmithing | 1 Dragon Scales |
| Horse Armor: Dwarven Barding and Saddle | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Horse Armor: Ebony Barding and Saddle | Ebony Blacksmithing | 1 Ingot: Ebony |
| Horse Armor: Ebony Barding and Saddle - Mail | Ebony Blacksmithing | 1 Ingot: Ebony |
| Horse Armor: Elven Barding and Saddle - Amber | Elven Blacksmithing | 1 Ingot: Moonstone |
| Horse Armor: Elven Barding and Saddle - Dusk | Elven Blacksmithing | 1 Ingot: Moonstone |
| Horse Armor: Frost Aegis Barding and Saddle | Glass Blacksmithing | 1 Ingot: Malachite |
| Horse Armor: Imperial Barding and Saddle | Craftsmanship | 1 Ingot: Steel |
| Horse Armor: Imperial Barding and Saddle - Adorned | Craftsmanship | 1 Ingot: Steel |
| Horse Armor: Leather Barding and Saddle | Craftsmanship | 1 Leather |
| Horse Armor: Leather Barding and Saddle - Mail | Craftsmanship | 1 Leather |
| Horse Armor: Nordic Barding and Saddle | Craftsmanship | 1 Ingot: Steel |
| Horse Armor: Ornate Barding and Saddle | Craftsmanship | 1 Ingot: Iron |
| Horse Armor: Stormcloak Barding and Saddle | Craftsmanship | 1 Leather |
| Horse Armor: Stormcloak Barding and Saddle - Adorned | Craftsmanship | 1 Leather |
| Imperial Crested Heavy Helmet | Craftsmanship | 1 Ingot: Steel |
| Imperial General Cuirass | Advanced Blacksmithing | 1 Ingot: Steel |
| Imperial Heavy Boots | Craftsmanship | 1 Ingot: Steel |
| Imperial Heavy Bracers | Craftsmanship | 1 Ingot: Steel |
| Imperial Heavy Cuirass | Craftsmanship | 1 Ingot: Steel |
| Imperial Heavy Helmet | Craftsmanship | 1 Ingot: Steel |
| Imperial Heavy Shield | Craftsmanship | 1 Ingot: Steel |
| Imperial Light Boots | Craftsmanship | 1 Leather |
| Imperial Light Bracers | Craftsmanship | 1 Leather |
| Imperial Light Cuirass | Craftsmanship | 1 Leather |
| Imperial Light Helmet | Craftsmanship | 1 Leather |
| Imperial Light Shield | Craftsmanship | 1 Leather |
| Imperial Officer Heavy Helmet | Craftsmanship | 1 Ingot: Steel |
| Imperial Outcast Boots | Advanced Light Smithing | 1 Ingot: Iron |
| Imperial Outcast Bracers | Advanced Light Smithing | 1 Leather |
| Imperial Outcast Bracers | Advanced Light Smithing | 1 Fur Plate |
| Imperial Outcast Cuirass | Advanced Light Smithing | 1 Leather |
| Imperial Outcast Helmet | Advanced Light Smithing | 1 Leather |
| Imperial Studded Cuirass | Craftsmanship | 1 Leather |
| Iron Banded Cuirass | Craftsmanship | 1 Ingot: Iron |
| Iron Banded Cuirass - Engraved | Craftsmanship | 1 Ingot: Iron |
| Iron Banded Masterwork Cuirass | Advanced Blacksmithing | 1 Ingot: Corundum |
| Iron Banded Quality Cuirass | Craftsmanship | 1 Ingot: Iron |
| Iron Banded Quality Shield | Craftsmanship | 1 Ingot: Iron |
| Iron Banded Shield | Craftsmanship | 1 Ingot: Iron |
| Iron Boots | Craftsmanship | 1 Ingot: Iron |
| Iron Boots - Engraved | Craftsmanship | 1 Ingot: Iron |
| Iron Cuirass | Craftsmanship | 1 Ingot: Iron |
| Iron Cuirass - Engraved | Craftsmanship | 1 Ingot: Iron |
| Iron Dented Shield | Craftsmanship | 1 Ingot: Iron |
| Iron Gauntlets | Craftsmanship | 1 Ingot: Iron |
| Iron Gauntlets - Engraved | Craftsmanship | 1 Ingot: Iron |
| Iron Heavy Shield | Craftsmanship | 1 Ingot: Iron |
| Iron Helmet | Craftsmanship | 1 Ingot: Iron |
| Iron Helmet - Engraved | Craftsmanship | 1 Ingot: Iron |
| Iron Helmet - Ram | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - Falkreath | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - Haafingar | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - Hjaalmarch | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - The Pale | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - The Reach | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - The Rift | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - Whiterun | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Helmet - Winterhold | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - Eastmarch | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - Falkreath | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - Haafingar | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - Hjaalmarch | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - The Pale | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - The Reach | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - The Rift | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - Whiterun | Craftsmanship | 1 Ingot: Iron |
| Iron Light Guard's Shield - Winterhold | Craftsmanship | 1 Ingot: Iron |
| Iron Masterwork Boots | Advanced Blacksmithing | 1 Ingot: Corundum |
| Iron Masterwork Cuirass | Advanced Blacksmithing | 1 Ingot: Corundum |
| Iron Masterwork Gauntlets | Advanced Blacksmithing | 1 Ingot: Corundum |
| Iron Masterwork Helmet | Advanced Blacksmithing | 1 Ingot: Corundum |
| Iron Masterwork Shield | Advanced Blacksmithing | 1 Ingot: Corundum |
| Iron Quality Boots | Craftsmanship | 1 Ingot: Iron |
| Iron Quality Cuirass | Craftsmanship | 1 Ingot: Iron |
| Iron Quality Gauntlets | Craftsmanship | 1 Ingot: Iron |
| Iron Quality Helmet | Craftsmanship | 1 Ingot: Iron |
| Iron Quality Shield | Craftsmanship | 1 Ingot: Iron |
| Ironhand Gauntlets | Craftsmanship | 1 Ingot: Steel |
| Jagged Crown | Draconic Blacksmithing | 1 Dragon Bone |
| Jagged Crown Replica | Advanced Blacksmithing | 1 Dragon Bone |
| Jarl of Eastmarch Armguards | Advanced Blacksmithing | 1 Ingot: Steel |
| Jarl of Eastmarch Armor | Advanced Blacksmithing | 1 Ingot: Steel |
| Leather Bearskin Hood - Black | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - Brown | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - Ornate Black | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - Ornate Brown | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - Ornate White | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - Trimmed Black | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - Trimmed Brown | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - Trimmed White | Craftsmanship | 1 Leather |
| Leather Bearskin Hood - White | Craftsmanship | 1 Leather |
| Leather Boots | Craftsmanship | 1 Leather |
| Leather Bracers | Craftsmanship | 1 Leather |
| Leather Cuirass | Craftsmanship | 1 Leather |
| Leather Executioner's Boots | Advanced Blacksmithing | 1 Leather: Dark |
| Leather Executioner's Cuirass | Advanced Blacksmithing | 1 Leather: Dark |
| Leather Executioner's Gloves | Advanced Blacksmithing | 1 Leather: Dark |
| Leather Executioner's Hood | Advanced Blacksmithing | 1 Leather: Dark |
| Leather Helmet | Craftsmanship | 1 Leather |
| Leather Hood | Craftsmanship | 1 Leather |
| Leather Hood - Black | Advanced Blacksmithing | 1 Leather: Dark |
| Leather Wolfskin Hood - Black | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Brown | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Dark Trimmed Black | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Dark Trimmed White | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Light Trimmed Black | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Light Trimmed Brown | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Light Trimmed White | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Noble Black | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Noble Brown | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Noble White | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Ornate Black | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Ornate Brown | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - Ornate White | Craftsmanship | 1 Leather |
| Leather Wolfskin Hood - White | Craftsmanship | 1 Leather |
| Linen Alik'r Boots - Dark | Craftsmanship | 1 Leather |
| Linen Alik'r Boots - Dark | Craftsmanship | 1 Leather |
| Linen Alik'r Boots - Tan | Craftsmanship | 1 Leather |
| Linen Alik'r Garb - Red | Craftsmanship | 1 Leather |
| Linen Alik'r Garb - Red | Craftsmanship | 1 Leather |
| Linen Alik'r Garb - White | Craftsmanship | 1 Leather |
| Linen Alik'r Hood - Blue | Craftsmanship | 1 Leather |
| Linen Alik'r Hood - Red | Craftsmanship | 1 Leather |
| Linen Alik'r Hood - Red | Craftsmanship | 1 Leather |
| Linwe's Boots | Craftsmanship | 1 Leather |
| Linwe's Cuirass | Craftsmanship | 1 Leather |
| Linwe's Gloves | Craftsmanship | 1 Leather |
| Linwe's Hood | Craftsmanship | 1 Leather |
| Nightingale Armor | Advanced Blacksmithing | 1 Void Salts |
| Nightingale Boots | Advanced Blacksmithing | 1 Void Salts |
| Nightingale Boots | Advanced Light Smithing | 1 Void Salts |
| Nightingale Cuirass | Advanced Light Smithing | 1 Void Salts |
| Nightingale Gloves | Advanced Light Smithing | 1 Void Salts |
| Nightingale Gloves | Advanced Blacksmithing | 1 Void Salts |
| Nightingale Hood | Advanced Light Smithing | 1 Void Salts |
| Nightingale Hood | Advanced Blacksmithing | 1 Void Salts |
| Nordic Boots - Black | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Boots - Brown | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Boots - White | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Cuirass - Black | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Cuirass - Brown | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Cuirass - White | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Gauntlets - Black | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Gauntlets - Brown | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Gauntlets - White | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Helmet - Black | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Shield - Black | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Shield - Brown | Nordic Blacksmithing | 1 Ingot: Galatite |
| Nordic Shield - White | Nordic Blacksmithing | 1 Ingot: Galatite |
| Orcish Boots | Orcish Blacksmithing | 1 Ingot: Orichalcum |
| Orcish Cuirass | Orcish Blacksmithing | 1 Ingot: Orichalcum |
| Orcish Gauntlets | Orcish Blacksmithing | 1 Ingot: Orichalcum |
| Orcish Helmet | Orcish Blacksmithing | 1 Ingot: Orichalcum |
| Orcish Shield | Orcish Blacksmithing | 1 Ingot: Orichalcum |
| Penitus Oculatus Boots | Craftsmanship | 1 Leather |
| Penitus Oculatus Bracers | Craftsmanship | 1 Leather |
| Penitus Oculatus Cuirass | Craftsmanship | 1 Leather |
| Penitus Oculatus Helmet | Craftsmanship | 1 Leather |
| Predator's Grace | Craftsmanship | 1 Leather |
| Savior's Hide | Legendary Blacksmithing | 1 Pelt: Werewolf |
| Savior's Hide - Black | Legendary Blacksmithing | 1 Pelt: Cave Bear |
| Savior's Hide - White | Legendary Blacksmithing | 1 Pelt: Snow Bear |
| Savior's Hide Replica | Advanced Blacksmithing | 1 Pelt: Bear 1 Ingot: Steel |
| Savior's Hide Replica | Advanced Blacksmithing | 1 Ingot: Steel 1 Fur Plate |
| Savior's Hide Replica - Black | Advanced Light Smithing | 1 Pelt: Cave Bear 1 Ingot: Steel |
| Savior's Hide Replica - Black | Advanced Light Smithing | 1 Ingot: Steel 1 Fur Plate |
| Savior's Hide Replica - White | Advanced Light Smithing | 1 Pelt: Snow Bear 1 Ingot: Steel |
| Savior's Hide Replica - White | Advanced Light Smithing | 1 Ingot: Steel 1 Fur Plate |
| Scaled Boots | Advanced Light Smithing | 1 Ingot: Corundum |
| Scaled Bracers | Advanced Light Smithing | 1 Ingot: Corundum |
| Scaled Cuirass | Advanced Light Smithing | 1 Ingot: Corundum |
| Scaled Cuirass - Horned | Advanced Light Smithing | 1 Ingot: Corundum |
| Scaled Helmet | Advanced Light Smithing | 1 Ingot: Corundum |
| Shellbug Helmet | Ebony Blacksmithing | 1 Ingot: Ebony |
| Shield of Solitude | Craftsmanship | 1 Ingot: Iron |
| Shield of Ysgramor | Ebony Blacksmithing | 1 Ingot: Ebony |
| Shield of Ysgramor Replica | Advanced Blacksmithing | 1 Ingot: Ebony |
| Shrouded Ancient Boots | Craftsmanship | 1 Leather: Dark |
| Shrouded Ancient Cowl - Masked | Craftsmanship | 1 Leather: Dark |
| Shrouded Ancient Cuirass | Craftsmanship | 1 Leather: Dark |
| Shrouded Ancient Gloves | Craftsmanship | 1 Leather: Red |
| Shrouded Boots | Craftsmanship | 1 Leather: Dark |
| Shrouded Boots | Craftsmanship | 1 Leather: Dark |
| Shrouded Cowl | Craftsmanship | 1 Leather: Dark |
| Shrouded Cowl | Craftsmanship | 1 Leather: Dark |
| Shrouded Cowl - Maskless | Craftsmanship | 1 Leather: Dark |
| Shrouded Cowl - Maskless | Craftsmanship | 1 Leather: Dark |
| Shrouded Cuirass | Advanced Light Smithing | 1 Leather: Dark |
| Shrouded Cuirass | Craftsmanship | 1 Leather: Dark |
| Shrouded Cuirass | Craftsmanship | 1 Leather: Dark |
| Shrouded Gloves | Craftsmanship | 1 Leather: Red |
| Shrouded Gloves | Craftsmanship | 1 Leather: Red |
| Shrouded Sleeveless Cuirass | Craftsmanship | 1 Leather: Dark |
| Shrouded Sleeveless Cuirass | Craftsmanship | 1 Leather: Dark |
| Shrouded Supple Boots | Advanced Light Smithing | 1 Leather: Dark |
| Shrouded Supple Cowl | Advanced Light Smithing | 1 Leather: Dark |
| Shrouded Supple Cowl - Maskless | Advanced Light Smithing | 1 Leather: Dark |
| Shrouded Supple Gloves | Advanced Light Smithing | 1 Leather: Red |
| Shrouded Worn Boots | Craftsmanship | 1 Leather: Dark |
| Shrouded Worn Cowl | Craftsmanship | 1 Leather: Dark |
| Shrouded Worn Cowl - Maskless | Craftsmanship | 1 Leather: Dark |
| Shrouded Worn Cuirass | Craftsmanship | 1 Leather: Dark |
| Shrouded Worn Gloves | Craftsmanship | 1 Leather: Red |
| Skyforge Steel Aegis | Advanced Blacksmithing | 1 Ingot: Galatite |
| Snow Elf Boots | Elven Blacksmithing | 1 Ingot: Moonstone |
| Snow Elf Crown | Elven Blacksmithing | 1 Ingot: Moonstone |
| Snow Elf Cuirass | Elven Blacksmithing | 1 Ingot: Moonstone |
| Snow Elf Gauntlets | Elven Blacksmithing | 1 Ingot: Moonstone |
| Spellbreaker | Legendary Blacksmithing | 1 Ingot: Dwarven |
| Spellbreaker Replica | Advanced Blacksmithing | 1 Ingot: Dwarven |
| Stalhrim Heavy Boots | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Heavy Cuirass | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Heavy Gauntlets | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Heavy Helmet | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Light Boots | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Light Cuirass | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Light Gauntlets | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Light Helmet | Stalhrim Smithing | 1 Stalhrim |
| Stalhrim Light Shield | Stalhrim Smithing | 1 Stalhrim |
| Steel Bearskin Hood - Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - Ornate Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - Ornate Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - Ornate White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - Trimmed Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - Trimmed Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - Trimmed White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Bearskin Hood - White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Boots | Craftsmanship | 1 Ingot: Steel |
| Steel Boots - White | Craftsmanship | 1 Ingot: Steel |
| Steel Bracers | Craftsmanship | 1 Ingot: Steel |
| Steel Cuirass | Craftsmanship | 1 Ingot: Steel |
| Steel Cuirass - White | Craftsmanship | 1 Ingot: Steel |
| Steel Gauntlets | Craftsmanship | 1 Ingot: Steel |
| Steel Gauntlets - White | Craftsmanship | 1 Ingot: Steel |
| Steel Greaves | Craftsmanship | 1 Ingot: Steel |
| Steel Helmet | Craftsmanship | 1 Ingot: Steel |
| Steel Helmet - White | Craftsmanship | 1 Ingot: Steel |
| Steel Horned Helmet | Craftsmanship | 1 Ingot: Steel |
| Steel Pauldroned Cuirass | Craftsmanship | 1 Ingot: Steel |
| Steel Pauldroned Cuirass - Katria's | Craftsmanship | 1 Ingot: Steel |
| Steel Pauldroned Cuirass - White | Craftsmanship | 1 Ingot: Steel |
| Steel Plate Boots | Advanced Blacksmithing | 1 Ingot: Corundum |
| Steel Plate Cuirass | Advanced Blacksmithing | 1 Ingot: Corundum |
| Steel Plate Gauntlets | Advanced Blacksmithing | 1 Ingot: Corundum |
| Steel Plate Helmet | Advanced Blacksmithing | 1 Ingot: Corundum |
| Steel Plate Shield | Advanced Blacksmithing | 1 Ingot: Corundum |
| Steel Shield | Craftsmanship | 1 Ingot: Steel |
| Steel Wolfskin Hood - Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Dark Trimmed Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Dark Trimmed Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Dark Trimmed White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Light Trimmed Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Light Trimmed Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Light Trimmed White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Noble Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Noble Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Noble White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Ornate Black | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Ornate Brown | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - Ornate White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Steel Wolfskin Hood - White | Craftsmanship | 1 Ingot: Steel 2 Leather Strips |
| Stormcloak General Boots | Advanced Blacksmithing | 1 Ingot: Steel |
| Stormcloak Heavy Helmet | Craftsmanship | 1 Ingot: Iron |
| Stormcloak Light Cuirass | Craftsmanship | 1 Leather |
| Stormcloak Officer Boots | Craftsmanship | 1 Ingot: Steel |
| Stormcloak Officer Bracers | Craftsmanship | 1 Ingot: Steel |
| Stormcloak Officer Cuirass | Craftsmanship | 1 Ingot: Steel |
| Stormcloak Officer Helmet | Craftsmanship | 1 Leather |
| Stormcloak Sleeved Heavy Cuirass | Craftsmanship | 1 Leather |
| Studded Cuirass | Craftsmanship | 1 Ingot: Iron |
| Summerset Shadows Boots | Craftsmanship | 1 Leather |
| Summerset Shadows Cuirass | Craftsmanship | 1 Leather |
| Summerset Shadows Gloves | Craftsmanship | 1 Leather |
| Summerset Shadows Hood | Craftsmanship | 1 Leather |
| Targe of the Blooded | Craftsmanship | 1 Ingot: Steel |
| Thieves Guild Boots | Craftsmanship | 1 Leather |
| Thieves Guild Boots | Craftsmanship | 1 Leather |
| Thieves Guild Boots - Grey | Craftsmanship | 1 Leather |
| Thieves Guild Cowl | Craftsmanship | 1 Leather |
| Thieves Guild Cowl - Grey | Craftsmanship | 1 Leather |
| Thieves Guild Cuirass | Craftsmanship | 1 Leather |
| Thieves Guild Cuirass | Craftsmanship | 1 Leather |
| Thieves Guild Cuirass - Grey | Craftsmanship | 1 Leather |
| Thieves Guild Gloves | Craftsmanship | 1 Leather |
| Thieves Guild Gloves | Craftsmanship | 1 Leather |
| Thieves Guild Gloves - Grey | Craftsmanship | 1 Leather |
| Thieves Guild Hood | Craftsmanship | 1 Leather |
| Thieves Guild Hood | Craftsmanship | 1 Leather |
| Thieves Guild Hood - Grey | Craftsmanship | 1 Leather |
| Thieves Guild Improved Boots | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Boots | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Boots - Grey | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Cuirass | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Cuirass | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Cuirass - Grey | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Gloves | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Gloves | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Gloves - Grey | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Hood | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Hood | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Hood - Grey | Advanced Light Smithing | 1 Leather |
| Thieves Guild Improved Sleeveless Cuirass - Grey | Advanced Light Smithing | 1 Leather |
| Thieves Guild Master's Boots | Advanced Light Smithing | 1 Leather: Dark |
| Thieves Guild Master's Boots | Craftsmanship | 1 Leather: Dark |
| Thieves Guild Master's Cowl | Advanced Light Smithing | 1 Leather: Dark |
| Thieves Guild Master's Cuirass | Craftsmanship | 1 Leather: Dark |
| Thieves Guild Master's Cuirass | Advanced Light Smithing | 1 Leather: Dark |
| Thieves Guild Master's Gloves | Advanced Light Smithing | 1 Leather: Dark |
| Thieves Guild Master's Gloves | Craftsmanship | 1 Leather: Dark |
| Thieves Guild Master's Hood | Advanced Light Smithing | 1 Leather: Dark |
| Thieves Guild Master's Hood | Craftsmanship | 1 Leather: Dark |
| Thieves Guild Master's Sleeveless Cuirass | Advanced Light Smithing | 1 Leather: Dark |
| Thieves Guild Sleeveless Cuirass | Craftsmanship | 1 Leather |
| Thieves Guild Sleeveless Cuirass - Grey | Craftsmanship | 1 Leather |
| Thieves Guild Sleeveless Improved Cuirass | Advanced Light Smithing | 1 Leather |
| Tumblerbane Gloves | Advanced Light Smithing | 1 Leather: Red |
| Ulfric's Boots | Advanced Blacksmithing | 1 Ingot: Corundum |
| Ulfric's Bracers | Advanced Blacksmithing | 1 Ingot: Corundum |
| Ulfric's Cuirass | Advanced Blacksmithing | 1 Ingot: Corundum |
| Vampire Boots | Craftsmanship | 1 Leather: Dark |
| Vampire Cuirass - Dark | Craftsmanship | 1 Leather: Dark |
| Vampire Cuirass - Grey | Craftsmanship | 1 Leather |
| Vampire Cuirass - Red | Craftsmanship | 1 Leather: Red |
| Vampire Gauntlets | Craftsmanship | 1 Leather: Dark |
| Vampire Hood | Craftsmanship | 1 Leather: Dark |
| Vampire Royal Cuirass | Craftsmanship | 1 Leather: Dark |
| Vampire Royal Cuirass - Red | Craftsmanship | 1 Leather: Dark |
| Vigilant's Boots | Advanced Blacksmithing | 1 Ingot: Corundum |
| Vigilant's Cuirass | Advanced Blacksmithing | 1 Ingot: Corundum |
| Vigilant's Gauntlets | Advanced Blacksmithing | 1 Ingot: Corundum |
| Vigilant's Helmet | Advanced Blacksmithing | 1 Ingot: Corundum |
| Visage of Mzund | Dwarven Blacksmithing | 1 Ingot: Dwarven |
| Wolf Boots | Craftsmanship | 1 Ingot: Steel |
| Wolf Cuirass | Craftsmanship | 1 Ingot: Steel |
| Wolf Gauntlets | Craftsmanship | 1 Ingot: Steel |
| Wolf Helmet | Craftsmanship | 1 Ingot: Steel |
| Wolf Shield | Craftsmanship | 1 Ingot: Steel |
| Wooden Walking Stick | Craftsmanship | 2 Leather Strips |


</div>
