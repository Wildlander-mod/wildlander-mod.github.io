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

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/10-Crafting/1.1-Crafting-System/).

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
  setTimeout(initJewelryPage, 300);
});

function initJewelryPage() {
  const table = document.querySelector('.jewelry-recipes-table table');
  if (!table) return;
  
  initJewelryFilters(table);
  initJewelrytooltips(table);
}

function initJewelryFilters(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const perks = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 4) {
      const perksText = cells[2]?.textContent.trim() || '';
      
      if (perksText) {
        perksText.split(',').forEach(perk => {
          const trimmed = perk.trim();
          if (trimmed) perks.add(trimmed);
        });
      }
    }
  });
  
  const perksFilter = document.getElementById('jewelryPerksFilter');
  
  if (perksFilter) {
    Array.from(perks).sort().forEach(perk => {
      const option = document.createElement('option');
      option.value = perk;
      option.textContent = perk;
      perksFilter.appendChild(option);
    });
    perksFilter.addEventListener('change', function() { filterJewelryRecipes(table); });
  }
  
  const searchInput = document.getElementById('jewelrySearch');
  if (searchInput) {
    searchInput.addEventListener('input', function() { filterJewelryRecipes(table); });
  }
  
  const clearButton = document.getElementById('clearFiltersJewelry');
  if (clearButton) {
    clearButton.addEventListener('click', function() { clearJewelryFilters(table); });
  }
  
  updateFilterCountJewelry(table);
}

function filterJewelryRecipes(table) {
  const searchInput = document.getElementById('jewelrySearch');
  const searchTerm = (searchInput?.value || '').toLowerCase();
  
  const perksFilter = document.getElementById('jewelryPerksFilter');
  const perksValue = perksFilter?.value || '';
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = (cells[0]?.textContent || '').toLowerCase();
    const itemsRequired = (cells[4]?.textContent || '').toLowerCase();
    
    const matchesSearch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    
    const perksCellText = cells[2]?.textContent.trim() || '';
    const perksList = perksCellText.split(',').map(p => p.trim());
    const matchesPerks = !perksValue || perksList.includes(perksValue);
    
    const isVisible = matchesSearch && matchesPerks;
    row.style.display = isVisible ? '' : 'none';
  });
  
  updateFilterCountJewelry(table);
}

function updateFilterCountJewelry(table) {
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountJewelry');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearJewelryFilters(table) {
  const searchInput = document.getElementById('jewelrySearch');
  const perksFilter = document.getElementById('jewelryPerksFilter');
  
  if (searchInput) searchInput.value = '';
  if (perksFilter) perksFilter.value = '';
  
  filterJewelryRecipes(table);
}

function initJewelrytooltips(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    if (!itemCell) return;
    
    itemCell.style.cursor = 'pointer';
    itemCell.style.color = '#f77ef1';
    itemCell.style.fontWeight = '500';
    itemCell.addEventListener('mouseenter', (e) => showJewelrytooltip(e, row));
    itemCell.addEventListener('mousemove', updateJewelrytooltipPosition);
    itemCell.addEventListener('mouseleave', hideJewelrytooltip);
  });
}

function showJewelrytooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const itemName = cells[0]?.textContent || '';
  const qtyMade = cells[1]?.textContent || '';
  const perksNeeded = cells[2]?.textContent || '';
  const toolkitsRequired = cells[3]?.textContent || '';
  const proximity = cells[4]?.textContent || '';
  const itemsRequired = cells[5]?.textContent || '';
  const additionalRequirements = cells[6]?.textContent || '';
  
  let tooltip = document.getElementById('jewelry-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'jewelry-tooltip';
    tooltip.className = 'jewelry-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Item:</strong> ' + itemName + '</div>' +
    '<div><strong>Qty:</strong> ' + (qtyMade || 'N/A') + '</div>' +
    '<div><strong>Perks:</strong> ' + (perksNeeded || 'None') + '</div>' +
    '<div><strong>Toolkits:</strong> ' + (toolkitsRequired || 'N/A') + '</div>' +
    '<div><strong>Proximity:</strong> ' + (proximity || 'N/A') + '</div>' +
    '<div><strong>Items:</strong> ' + (itemsRequired || 'N/A') + '</div>' +
    '<div><strong>Additional:</strong> ' + (additionalRequirements || 'None') + '</div>';
  
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
</script>
</script>

<div class="jewelry-controls">
  <input type="text" id="jewelrySearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="jewelryPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersJewelry" onclick="clearJewelryFilters()">Clear Filters</button>
  <div id="filterResultCountJewelry" class="filter-result-count-jewelry"></div>
</div>

<div class="jewelry-recipes-table" markdown="1">

| Produced Item Name | Qty Made | Perks Needed | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---|:---|:---|
| Ring of the Bear Spirit | 1 |  | Player Crafting | 1 Flawless Bear Tooth 1 Polished Bear Eye 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 7 |
| Ring of the Sabrecat Spirit | 1 |  | Player Crafting | 1 Flawless Sabre Cat Tooth 1 Polished Sabre Cat Eye 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 7 |
| Ring of the Troll Spirit | 1 |  | Player Crafting | 1 Troll Fat 1 Polished Troll Eye 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 7 |
| Ring of the Mammoth Spirit | 1 |  | Player Crafting | 1 Polished Mammoth Eye 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 7 |
| Ring of the Wolf Spirit | 1 |  | Player Crafting | 1 Polished Wolf Eye 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 7 |
| Ring of the Skeever Spirit | 1 |  | Player Crafting | 1 Cured Skeever Hide 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 7 |
| Ring of the Mudcrab Spirit | 1 |  | Player Crafting | 1 Large Mudcrab Chitin 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 7 |
| Amulet of Kynareth | 1 |  | Player Crafting | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Kynareth | Forage Skill Greater or Equal to 4 |
| Amulet of Julianos | 1 |  | Player Crafting | 1 Leather Strips 3 Fragment: Bone 1 Engraved Bone of Julianos | Forage Skill Greater or Equal to 4 |
| Amulet of Hircine | 1 |  | Player Crafting | 1 Leather Strips 1 Fragment: Bone 3 Engraved Bone of Hircine | Forage Skill Greater or Equal to 4 |
| Ring of the Moon | 1 |  | Player Crafting | 3 Wolf Claws 1 Engraved Bone of Hircine 1 Polished Werewolf Eye 1 Wolfsap | Forage Skill Greater or Equal to 8 |
| Ring of Instinct | 1 |  | Player Crafting | 3 Wolf Claws 1 Engraved Bone of Hircine 1 Polished Werewolf Eye 1 Wolfsap | Forage Skill Greater or Equal to 8 |
| Ring of Bloodlust | 1 |  | Player Crafting | 3 Wolf Claws 1 Engraved Bone of Hircine 1 Polished Werewolf Eye 1 Wolfsap | Forage Skill Greater or Equal to 8 |
| Ring of the Hunt | 1 |  | Player Crafting | 3 Wolf Claws 1 Engraved Bone of Hircine 1 Polished Werewolf Eye 1 Wolfsap | Forage Skill Greater or Equal to 8 |
| Bone Hawk Ring | 1 |  | Player Crafting | 1 Bone Hawk Skull 2 Bone Hawk Claw | Forage Skill Greater or Equal to 3 |
| Bone Hawk Amulet | 1 |  | Player Crafting | 2 Leather Strips 1 Bone Hawk Skull 6 Bone Hawk Feathers | Forage Skill Greater or Equal to 3 |
| Bone and Ivory Necklace | 1 |  | Player Crafting | 1 Leather Strips 4 Animal Bone (Small) 1 Polished Ivory | Forage Skill Greater or Equal to 2 |
| Bone Ring | 2 |  | Player Crafting | 1 Animal Bone (Large) | Forage Skill Greater or Equal to 2 |
| Ivory Ring | 2 |  | Player Crafting | 1 Polished Ivory | Forage Skill Greater or Equal to 2 |
| Silver Ring | 1 | Craftsmanship | Forge | 2 Fragment: Silver |  |
| Gold Ring | 1 | Advanced Blacksmithing | Forge | 2 Fragment: Gold |  |
| Silver Necklace | 1 | Craftsmanship | Forge | 4 Fragment: Silver |  |
| Gold Necklace | 1 | Advanced Blacksmithing | Forge | 4 Fragment: Gold |  |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Player Crafting | 3 Silver Ring 3 Bone Hawk Claw |  |
| Silver Opal Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Opal |  |
| Gold Opal Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Opal |  |
| Silver Opal Necklace | 1 | Craftsmanship | Forge | 1 Silver Necklace 1 Gem: Opal |  |
| Gold Opal Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gold Necklace 1 Gem: Opal |  |
| Gold Emerald Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gem: Emerald (Flawless) 1 Gold Necklace |  |
| Gold Emerald Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gem: Emerald 1 Gold Necklace |  |
| Gold Sapphire Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gem: Sapphire (Flawless) 1 Gold Necklace |  |
| Gold Sapphire Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gem: Sapphire 1 Gold Necklace |  |
| Gold Aquamarine Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Necklace 1 Gem: Aquamarine (Flawless) |  |
| Gold Aquamarine Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gold Necklace 1 Gem: Aquamarine |  |
| Gold Peridot Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Necklace 1 Gem: Peridot (Flawless) |  |
| Gold Peridot Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gold Necklace 1 Gem: Peridot |  |
| Gold Garnet Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gem: Garnet (Flawless) 1 Gold Necklace |  |
| Gold Garnet Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gem: Garnet 1 Gold Necklace |  |
| Gold Onyx Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gold Necklace 1 Gem: Onyx |  |
| Gold Amber Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gold Necklace 1 Gem: Amber |  |
| Silver Diamond Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Gem: Diamond (Flawless) 1 Silver Necklace |  |
| Silver Diamond Necklace | 1 | Craftsmanship | Forge | 1 Gem: Diamond 1 Silver Necklace |  |
| Silver Ruby Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Gem: Ruby (Flawless) 1 Silver Necklace |  |
| Silver Ruby Necklace | 1 | Craftsmanship | Forge | 1 Gem: Ruby 1 Silver Necklace |  |
| Silver Aquamarine Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Necklace 1 Gem: Aquamarine (Flawless) |  |
| Silver Aquamarine Necklace | 1 | Craftsmanship | Forge | 1 Silver Necklace 1 Gem: Aquamarine |  |
| Silver Amethyst Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Gem: Amethyst (Flawless) 1 Silver Necklace |  |
| Silver Amethyst Necklace | 1 | Craftsmanship | Forge | 1 Gem: Amethyst 1 Silver Necklace |  |
| Silver Peridot Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Necklace 1 Gem: Peridot (Flawless) |  |
| Silver Peridot Necklace | 1 | Craftsmanship | Forge | 1 Silver Necklace 1 Gem: Peridot |  |
| Silver Onyx Necklace | 1 | Craftsmanship | Forge | 1 Silver Necklace 1 Gem: Onyx |  |
| Silver Amber Necklace | 1 | Craftsmanship | Forge | 1 Silver Necklace 1 Gem: Amber |  |
| Silver Peridot Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Peridot |  |
| Silver Onyx Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Onyx |  |
| Silver Aquamarine Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Aquamarine |  |
| Silver Aquamarine Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Aquamarine (Flawless) |  |
| Silver Amber Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Amber |  |
| Gold Peridot Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Peridot |  |
| Gold Peridot Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Peridot (Flawless) |  |
| Gold Onyx Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Onyx |  |
| Gold Aquamarine Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Aquamarine |  |
| Gold Aquamarine Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Aquamarine (Flawless) |  |
| Gold Amber Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Amber |  |
| Ring of Bones | 1 | Craftsmanship | Forge | 1 Bone Meal 1 Ingot: Corundum | Daedra - The Taste of Death |
| Amulet of the Kynareth Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Small Pearl |  |
| Amulet of Akatosh Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Stendarr Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Ingot: Corundum 1 Leather Strips |  |
| Amulet of Mara Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Calcinium |  |
| Amulet of Arkay Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Gem: Ruby (Rough) |  |
| Amulet of Talos Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Leather Strips 1 Ingot: Galatite |  |
| Skaal Amulet | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Quicksilver 1 Leather Strips 1 Stalhrim | Dragonborn - The Fate of the Skaal  Complete |
| Amulet of the Elder Council Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Ingot: Quicksilver 1 Gem: Onyx |  |
| Amulet of Julianos Replica | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Ingot: Quicksilver |  |
| Amulet of Zenithar Replica | 1 | Craftsmanship | Forge | 1 Ingot: Steel 1 Leather Strips |  |
| Amulet of Dibella Replica | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Corundum 1 Leather Strips 1 Pearl |  |
| Ancient Nordic Necklace | 1 | Craftsmanship | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Ancient Nordic Amulet | 1 | Craftsmanship | Forge | 1 Leather Strips 1 Animal Bone (Small) |  |
| Silver Peridot Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Peridot (Flawless) |  |
| Gold Ruby Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Ruby |  |
| Gold Garnet Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Garnet |  |
| Gold Amethyst Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Amethyst |  |
| Silver Diamond Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Diamond |  |
| Silver Emerald Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Emerald |  |
| Silver Sapphire Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Sapphire |  |
| Gold Ruby Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Ruby (Flawless) |  |
| Gold Garnet Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Garnet (Flawless) |  |
| Gold Amethyst Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Amethyst (Flawless) |  |
| Silver Sapphire Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Sapphire (Flawless) |  |
| Silver Emerald Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Emerald (Flawless) |  |
| Silver Diamond Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Diamond (Flawless) |  |
| Silver Sapphire Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Gem: Sapphire (Flawless) 1 Silver Necklace |  |
| Silver Garnet Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Gem: Garnet (Flawless) 1 Silver Necklace |  |
| Silver Emerald Necklace (Flawless) | 1 | Craftsmanship | Forge | 1 Gem: Emerald (Flawless) 1 Silver Necklace |  |
| Gold Ruby Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gem: Ruby (Flawless) 1 Gold Necklace |  |
| Gold Amethyst Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gem: Amethyst (Flawless) 1 Gold Necklace |  |
| Gold Diamond Necklace (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gem: Diamond (Flawless) 1 Gold Necklace |  |
| Silver Ruby Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Ruby (Flawless) |  |
| Silver Garnet Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Garnet (Flawless) |  |
| Silver Amethyst Ring (Flawless) | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Amethyst (Flawless) |  |
| Gold Sapphire Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Sapphire (Flawless) |  |
| Gold Emerald Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Emerald (Flawless) |  |
| Gold Diamond Ring (Flawless) | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Diamond (Flawless) |  |
| Bone Silvered Ring (Strange Brew) | 1 |  | Player Crafting | 1 Animal Bone (Small) 8 Fragment: Silver | Brewing Skill Greater or Equal to 3,Forage Skill Greater or Equal to 2 |
| Bone Ring of the Oak Rite | 1 |  | Player Crafting | 1 Strange Cat Claw | Forage Skill Greater or Equal to 9 |
| Bone Ring of the Elm Rite | 1 |  | Player Crafting | 1 Strange Bear Claw | Forage Skill Greater or Equal to 7 |
| Bone Ring of the Yew Rite | 1 |  | Player Crafting | 1 Strange Wolf Claw | Forage Skill Greater or Equal to 5 |
| Bone Smooth Ring | 1 |  | Player Crafting | 1 Animal Bone (Small) | Forage Skill Greater or Equal to 2 |
| Bone Thorned Ring | 1 |  | Player Crafting | 1 Animal Bone (Small) | Forage Skill Greater or Equal to 2 |
| Bone Jagged Ring | 1 |  | Player Crafting | 1 Animal Bone (Small) | Forage Skill Greater or Equal to 2 |
| Bone Lucky Ring | 1 |  | Player Crafting | 1 Animal Bone (Small) | Forage Skill Greater or Equal to 2 |
| Bone Amulet of the Long Night | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Beaver Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Hunter's Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Harvest Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Sturgeon Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Buck Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Strawberry Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Flower Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Pink Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Worm Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Snow Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Amulet of the Wolf Moon | 1 |  | Player Crafting | 1 Hide Lace 3 Animal Bone (Small) | Forage Skill Greater or Equal to 1 |
| Bone Hawk Ring | 1 | Advanced Blacksmithing | Player Crafting | 3 Bone Hawk Claw 3 Fragment: Silver |  |
| Bone Hawk Amulet | 1 | Advanced Blacksmithing | Player Crafting | 2 Leather Strips 1 Bone Hawk Skull 6 Bone Hawk Feathers |  |
| Silver Ruby Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Ruby |  |
| Silver Garnet Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Garnet |  |
| Silver Amethyst Ring | 1 | Craftsmanship | Forge | 1 Silver Ring 1 Gem: Amethyst |  |
| Silver Ring (10) | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Gold Sapphire Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Sapphire |  |
| Gold Emerald Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Emerald |  |
| Gold Diamond Ring | 1 | Advanced Blacksmithing | Forge | 1 Gold Ring 1 Gem: Diamond |  |
| Gold Ring (10) | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |
| Silver Sapphire Necklace | 1 | Craftsmanship | Forge | 1 Gem: Sapphire 1 Silver Necklace |  |
| Silver Garnet Necklace | 1 | Craftsmanship | Forge | 1 Gem: Garnet 1 Silver Necklace |  |
| Silver Emerald Necklace | 1 | Craftsmanship | Forge | 1 Gem: Emerald 1 Silver Necklace |  |
| Silver Necklace (5) | 1 | Craftsmanship | Forge | 1 Ingot: Silver |  |
| Gold Ruby Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gem: Ruby 1 Gold Necklace |  |
| Gold Amethyst Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gem: Amethyst 1 Gold Necklace |  |
| Gold Diamond Necklace | 1 | Advanced Blacksmithing | Forge | 1 Gem: Diamond 1 Gold Necklace |  |
| Gold Necklace (5) | 1 | Advanced Blacksmithing | Forge | 1 Ingot: Gold |  |





</div>
