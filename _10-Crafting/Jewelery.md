---
title: Jewelry Recipes
layout: default
nav_order: 9
has_children: false
description: Jewelry and accessory crafting recipes.
---

## Jewelry and Gem Crafting

Create and customize jewelry using the **Forge** workstation. This toolkit allows you to combine precious metals and gems into valuable accessories. Combining Gems and jewelry is performed from player crafting and no longer grants XP.

**Available crafting includes:**
- Ring creation and customization
- Amulet and pendant crafting
- Gem setting and stone working
- Precious metal jewelry

**Tip:** Jewelry crafting generates excellent XP and creates items valuable for trading and bartering with merchants.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/_10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Produced Item Name** to see the complete details including:
- Quantity produced per craft
- Perks and toolkit requirements
- Crafting location
- Complete list of materials needed
- Any additional requirements

Use the search bar and filters below to find specific jewelry recipes by toolkit or perks needed.

---

## Jewelry Recipes Data

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initJewelrytooltips() {
  const table = document.querySelector('.jewelry-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showJewelrytooltip(e, row));
    itemCell.addEventListener('mousemove', updateJewelrytooltipPosition);
    itemCell.addEventListener('mouseleave', hideJewelrytooltip);
  });
}

function showJewelrytooltip(event, row) {
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
  
  let tooltip = document.getElementById('jewelry-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'jewelry-tooltip';
    tooltip.className = 'jewelry-tooltip';
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
  updateJewelrytooltipPosition(event);
}

function updateJewelrytooltipPosition(event) {
  const tooltip = document.getElementById('jewelry-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideJewelrytooltip() {
  const tooltip = document.getElementById('jewelry-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initJewelryFilters() {
  const table = document.querySelector('.jewelry-recipes-table table');
  if (!table) {
    console.warn('Jewelry Recipes table not found');
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
      
      // Split comma-separated toolkits into individual options
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
  
  const toolkitFilter = document.getElementById('jewelryToolkitFilter');
  const perksFilter = document.getElementById('jewelryPerksFilter');
  
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
  
  document.getElementById('jewelrySearch').addEventListener('input', filterJewelryRecipes);
  document.getElementById('jewelryToolkitFilter').addEventListener('change', filterJewelryRecipes);
  document.getElementById('jewelryPerksFilter').addEventListener('change', filterJewelryRecipes);
  initJewelrytooltips();
  updateFilterCountJewelry();
}

function filterJewelryRecipes() {
  const searchTerm = document.getElementById('jewelrySearch').value.toLowerCase();
  const toolkitFilter = document.getElementById('jewelryToolkitFilter').value;
  const perksFilter = document.getElementById('jewelryPerksFilter').value;
  
  const table = document.querySelector('.jewelry-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[5]?.textContent.toLowerCase() || '';
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    
    // Split comma-separated toolkits and check if any match the filter
    const toolkitCellText = cells[3]?.textContent.trim() || '';
    const toolkits = toolkitCellText.split(',').map(t => t.trim());
    const toolkitMatch = !toolkitFilter || toolkits.includes(toolkitFilter);
    
    const perksCellText = cells[2]?.textContent.trim() || '';
    const perksList = perksCellText.split(',').map(p => p.trim());
    const perksMatch = !perksFilter || perksList.includes(perksFilter);
    
    const isVisible = searchMatch && toolkitMatch && perksMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountJewelry();
  initJewelrytooltips();
}

function updateFilterCountJewelry() {
  const table = document.querySelector('.jewelry-recipes-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountJewelry');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearJewelryFilters() {
  document.getElementById('jewelrySearch').value = '';
  document.getElementById('jewelryToolkitFilter').value = '';
  document.getElementById('jewelryPerksFilter').value = '';
  filterJewelryRecipes();
}

initJewelryFilters();

});
</script>

<div class="table-controls">
  <input type="text" id="jewelrySearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="jewelryToolkitFilter">
    <option value="">All Toolkits</option>
  </select>
  <select id="jewelryPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersJewelry" onclick="clearJewelryFilters()">Clear Filters</button>
  <div id="filterResultCountJewelry" class="filter-result-count"></div>
</div>

<div class="styled-table-wrapper" markdown="1">

| Produced Item Name | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---|:---|:---|:---|
| Alchemist's Crown | 1 |  | Smiths,Jewelers | Forge | 1 Infused Ingot 3 Rubyluce |  |
| Amethyst | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amethyst (Rough) |  |
| Amulet of Akatosh Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Arkay Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Gem: Ruby (Rough) |  |
| Amulet of Dibella Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Pearl |  |
| Amulet of Julianos Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Ingot: Quicksilver |  |
| Amulet of Mara Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Calcinium |  |
| Amulet of Stendarr Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Talos Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Gold Ring 1 Leather Strips 1 Ingot: Galatite |  |
| Amulet of the Elder Council Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Corundum 1 Ingot: Quicksilver 1 Gem: Onyx |  |
| Amulet of the Kynareth Replica | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Small Pearl |  |
| Amulet of Zenithar Replica | 1 | Craftsmanship | Jewelers | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Ancient Nordic Amulet | 1 | Craftsmanship | Jewelers | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Necklace | 1 | Craftsmanship | Jewelers | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Aquamarine | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Aquamarine (Rough) |  |
| Bone Amulet of the Beaver Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Buck Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Flower Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Harvest Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Hunter's Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Long Night | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Pink Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Snow Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Strawberry Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Sturgeon Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Wolf Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Amulet of the Worm Moon | 1 |  | Survivalists,Jewelers | N/A | 1 Hide Lace 3 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Hawk Amulet | 1 | Advanced Blacksmithing | Jewelers | N/A | 2 Leather Strips 1 Bone Hawk Skull 6 Bone Hawk Feathers |  |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Jewelers | Forge | 3 Bone Hawk Claw 3 Fragment: Silver |  |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Jewelers | Forge | 3 Silver Ring 3 Bone Hawk Claw |  |
| Bone Jagged Ring | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Lucky Ring | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Ring of the Elm Rite | 1 |  | Survivalists,Jewelers | N/A | 1 Strange Bear Claw | Animal Harvesting Skill Greater or Equal to 7 |
| Bone Ring of the Oak Rite | 1 |  | Survivalists,Jewelers | N/A | 1 Strange Cat Claw | Animal Harvesting Skill Greater or Equal to 9 |
| Bone Ring of the Yew Rite | 1 |  | Survivalists,Jewelers | N/A | 1 Strange Wolf Claw | Animal Harvesting Skill Greater or Equal to 5 |
| Bone Silvered Ring (Strange Brew) | 1 |  | Survivalists,Jewelers | Forge | 1 Animal Bone (Small) 8 Fragment: Silver | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 2 |
| Bone Smooth Ring | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Bone Thorned Ring | 1 |  | Survivalists,Jewelers | N/A | 1 Animal Bone (Small) | Animal Harvesting Skill Greater or Equal to 2 |
| Copper Amber Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amber 1 Copper Circlet |  |
| Copper Amethyst Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst 1 Copper Circlet |  |
| Copper Amethyst Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Copper Circlet |  |
| Copper Aquamarine Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine 1 Copper Circlet |  |
| Copper Aquamarine Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Copper Circlet |  |
| Copper Circlet | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Corundum |  |
| Copper Diamond Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond 1 Copper Circlet |  |
| Copper Diamond Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Copper Circlet |  |
| Copper Emerald Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald 1 Copper Circlet |  |
| Copper Emerald Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Copper Circlet |  |
| Copper Garnet Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet 1 Copper Circlet |  |
| Copper Garnet Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Copper Circlet |  |
| Copper Onyx Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Onyx 1 Copper Circlet |  |
| Copper Opal Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Opal 1 Copper Circlet |  |
| Copper Peridot Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot 1 Copper Circlet |  |
| Copper Peridot Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Copper Circlet |  |
| Copper Ruby Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby 1 Copper Circlet |  |
| Copper Ruby Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Copper Circlet |  |
| Copper Sapphire Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire 1 Copper Circlet |  |
| Copper Sapphire Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Copper Circlet |  |
| Diamond | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Diamond (Rough) |  |
| Emerald | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Emerald (Rough) |  |
| Garnet | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Garnet (Rough) |  |
| Gem: Amber | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amber (Rough) |  |
| Gem: Onyx | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Onyx (Rough) |  |
| Gem: Opal | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Opal (Rough) |  |
| Gold Amber Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amber 1 Gold Circlet |  |
| Gold Amber Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Amber |  |
| Gold Amber Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Amber |  |
| Gold Amethyst Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst 1 Gold Circlet |  |
| Gold Amethyst Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Gold Circlet |  |
| Gold Amethyst Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amethyst 1 Gold Necklace |  |
| Gold Amethyst Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Amethyst (Flawless) 1 Gold Necklace |  |
| Gold Amethyst Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Amethyst |  |
| Gold Amethyst Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Amethyst (Flawless) |  |
| Gold Aquamarine Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine 1 Gold Circlet |  |
| Gold Aquamarine Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Gold Circlet |  |
| Gold Aquamarine Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Aquamarine |  |
| Gold Aquamarine Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Aquamarine (Flawless) |  |
| Gold Aquamarine Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Aquamarine |  |
| Gold Aquamarine Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Aquamarine (Flawless) |  |
| Gold Circlet | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Diamond Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond 1 Gold Circlet |  |
| Gold Diamond Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Gold Circlet |  |
| Gold Diamond Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Diamond 1 Gold Necklace |  |
| Gold Diamond Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Diamond (Flawless) 1 Gold Necklace |  |
| Gold Diamond Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Diamond |  |
| Gold Diamond Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Diamond (Flawless) |  |
| Gold Emerald Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald 1 Gold Circlet |  |
| Gold Emerald Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Gold Circlet |  |
| Gold Emerald Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Emerald 1 Gold Necklace |  |
| Gold Emerald Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Emerald (Flawless) 1 Gold Necklace |  |
| Gold Emerald Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Emerald |  |
| Gold Emerald Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Emerald (Flawless) |  |
| Gold Garnet Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet 1 Gold Circlet |  |
| Gold Garnet Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Gold Circlet |  |
| Gold Garnet Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Garnet 1 Gold Necklace |  |
| Gold Garnet Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Garnet (Flawless) 1 Gold Necklace |  |
| Gold Garnet Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Garnet |  |
| Gold Garnet Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Garnet (Flawless) |  |
| Gold Necklace | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 4 Fragment: Gold |  |
| Gold Necklace (5) | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Onyx Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Onyx 1 Gold Circlet |  |
| Gold Onyx Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Onyx |  |
| Gold Onyx Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Onyx |  |
| Gold Opal Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Opal 1 Gold Circlet |  |
| Gold Opal Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Opal |  |
| Gold Opal Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Opal |  |
| Gold Peridot Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot 1 Gold Circlet |  |
| Gold Peridot Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Gold Circlet |  |
| Gold Peridot Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Peridot |  |
| Gold Peridot Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Necklace 1 Gem: Peridot (Flawless) |  |
| Gold Peridot Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Peridot |  |
| Gold Peridot Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Peridot (Flawless) |  |
| Gold Ring | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 2 Fragment: Gold |  |
| Gold Ring (10) | 1 | Advanced Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Gold |  |
| Gold Ruby Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby 1 Gold Circlet |  |
| Gold Ruby Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Gold Circlet |  |
| Gold Ruby Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Ruby 1 Gold Necklace |  |
| Gold Ruby Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Ruby (Flawless) 1 Gold Necklace |  |
| Gold Ruby Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Ruby |  |
| Gold Ruby Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Ruby (Flawless) |  |
| Gold Sapphire Circlet | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire 1 Gold Circlet |  |
| Gold Sapphire Circlet (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Gold Circlet |  |
| Gold Sapphire Necklace | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Sapphire 1 Gold Necklace |  |
| Gold Sapphire Necklace (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Sapphire (Flawless) 1 Gold Necklace |  |
| Gold Sapphire Ring | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Sapphire |  |
| Gold Sapphire Ring (Flawless) | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gold Ring 1 Gem: Sapphire (Flawless) |  |
| Greybeard's Hood | 1 | Craftsmanship | Jewelers | N/A | 1 Cotton Thread 3 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Greybeard's Robes | 1 | Craftsmanship | Jewelers | N/A | 4 Cotton Thread 5 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Greybeard's Shoes | 1 | Craftsmanship | Jewelers | N/A | 1 Leather 2 Cotton Thread 3 Cotton Cloth - Grey | Main Quest - The Way of the Voice Complete |
| Hide Lace | 4 | Craftsmanship | Smiths,Tailors,Survivalists,Jewelers | N/A | 1 Fur Plate |  |
| Leather Strips | 4 | Craftsmanship | Smiths,Tailors,Survivalists,Jewelers | N/A | 1 Leather |  |
| Orichalc Amber Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Amber 1 Orichalc Circlet |  |
| Orichalc Amethyst Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst 1 Orichalc Circlet |  |
| Orichalc Amethyst Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Orichalc Circlet |  |
| Orichalc Aquamarine Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine 1 Orichalc Circlet |  |
| Orichalc Aquamarine Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Orichalc Circlet |  |
| Orichalc Circlet | 1 | Orcish Blacksmithing | Jewelers,Smiths | Forge | 1 Ingot: Orichalcum |  |
| Orichalc Diamond Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Diamond 1 Orichalc Circlet |  |
| Orichalc Diamond Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Orichalc Circlet |  |
| Orichalc Emerald Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Emerald 1 Orichalc Circlet |  |
| Orichalc Emerald Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Orichalc Circlet |  |
| Orichalc Garnet Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Garnet 1 Orichalc Circlet |  |
| Orichalc Garnet Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Orichalc Circlet |  |
| Orichalc Onyx Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Onyx 1 Orichalc Circlet |  |
| Orichalc Opal Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Opal 1 Orichalc Circlet |  |
| Orichalc Peridot Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Peridot 1 Orichalc Circlet |  |
| Orichalc Peridot Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Orichalc Circlet |  |
| Orichalc Ruby Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Ruby 1 Orichalc Circlet |  |
| Orichalc Ruby Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Orichalc Circlet |  |
| Orichalc Sapphire Circlet | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire 1 Orichalc Circlet |  |
| Orichalc Sapphire Circlet (Flawless) | 1 | Orcish Blacksmithing | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Orichalc Circlet |  |
| Peridot | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Peridot (Rough) |  |
| Ring of Bones | 1 | Craftsmanship | Jewelers | Forge | 1 Bone Meal 1 Ingot: Corundum | Daedra - The Taste of Death |
| Ruby | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Ruby (Rough) |  |
| Sapphire | 1 | Advanced Blacksmithing | Jewelers | N/A | 1 Gem: Sapphire (Rough) |  |
| Silver Amber Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Amber 1 Silver Circlet |  |
| Silver Amber Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Amber |  |
| Silver Amber Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Amber |  |
| Silver Amethyst Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Amethyst 1 Silver Circlet |  |
| Silver Amethyst Circlet (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Amethyst (Flawless) 1 Silver Circlet |  |
| Silver Amethyst Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Amethyst 1 Silver Necklace |  |
| Silver Amethyst Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Amethyst (Flawless) 1 Silver Necklace |  |
| Silver Amethyst Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Amethyst |  |
| Silver Amethyst Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Amethyst (Flawless) |  |
| Silver Aquamarine Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Aquamarine 1 Silver Circlet |  |
| Silver Aquamarine Circlet (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Aquamarine (Flawless) 1 Silver Circlet |  |
| Silver Aquamarine Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Aquamarine |  |
| Silver Aquamarine Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Aquamarine (Flawless) |  |
| Silver Aquamarine Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Aquamarine |  |
| Silver Aquamarine Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Aquamarine (Flawless) |  |
| Silver Circlet | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Diamond Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Diamond 1 Silver Circlet |  |
| Silver Diamond Circlet (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Diamond (Flawless) 1 Silver Circlet |  |
| Silver Diamond Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Diamond 1 Silver Necklace |  |
| Silver Diamond Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Diamond (Flawless) 1 Silver Necklace |  |
| Silver Diamond Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Diamond |  |
| Silver Diamond Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Diamond (Flawless) |  |
| Silver Emerald Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Emerald 1 Silver Circlet |  |
| Silver Emerald Circlet (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Emerald (Flawless) 1 Silver Circlet |  |
| Silver Emerald Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Emerald 1 Silver Necklace |  |
| Silver Emerald Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Emerald (Flawless) 1 Silver Necklace |  |
| Silver Emerald Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Emerald |  |
| Silver Emerald Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Emerald (Flawless) |  |
| Silver Garnet Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Garnet 1 Silver Circlet |  |
| Silver Garnet Circlet (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Garnet (Flawless) 1 Silver Circlet |  |
| Silver Garnet Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Garnet 1 Silver Necklace |  |
| Silver Garnet Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Garnet (Flawless) 1 Silver Necklace |  |
| Silver Garnet Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Garnet |  |
| Silver Garnet Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Garnet (Flawless) |  |
| Silver Necklace | 1 | Craftsmanship | Jewelers,Smiths | Forge | 4 Fragment: Silver |  |
| Silver Necklace (5) | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Onyx Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Onyx 1 Silver Circlet |  |
| Silver Onyx Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Onyx |  |
| Silver Onyx Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Onyx |  |
| Silver Opal Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Opal 1 Silver Circlet |  |
| Silver Opal Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Opal |  |
| Silver Opal Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Opal |  |
| Silver Peridot Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Peridot 1 Silver Circlet |  |
| Silver Peridot Circlet (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Peridot (Flawless) 1 Silver Circlet |  |
| Silver Peridot Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Peridot |  |
| Silver Peridot Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Necklace 1 Gem: Peridot (Flawless) |  |
| Silver Peridot Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Peridot |  |
| Silver Peridot Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Peridot (Flawless) |  |
| Silver Ring | 1 | Craftsmanship | Jewelers,Smiths | Forge | 2 Fragment: Silver |  |
| Silver Ring (10) | 1 | Craftsmanship | Jewelers,Smiths | Forge | 1 Ingot: Silver |  |
| Silver Ruby Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Ruby 1 Silver Circlet |  |
| Silver Ruby Circlet, Flawless | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Ruby (Flawless) 1 Silver Circlet |  |
| Silver Ruby Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Ruby 1 Silver Necklace |  |
| Silver Ruby Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Ruby (Flawless) 1 Silver Necklace |  |
| Silver Ruby Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Ruby |  |
| Silver Ruby Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Ruby (Flawless) |  |
| Silver Sapphire Circlet | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Sapphire 1 Silver Circlet |  |
| Silver Sapphire Circlet (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 3 Gem: Sapphire (Flawless) 1 Silver Circlet |  |
| Silver Sapphire Necklace | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Sapphire 1 Silver Necklace |  |
| Silver Sapphire Necklace (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Gem: Sapphire (Flawless) 1 Silver Necklace |  |
| Silver Sapphire Ring | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Sapphire |  |
| Silver Sapphire Ring (Flawless) | 1 | Craftsmanship | Jewelers | N/A | 1 Silver Ring 1 Gem: Sapphire (Flawless) |  |
| Skaal Amulet | 1 | Advanced Blacksmithing | Jewelers | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Stalhrim | Dragonborn - The Fate of the Skaal  Complete |

</div>

