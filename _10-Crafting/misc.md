---
title: Miscellaneous Recipes
layout: default
nav_order: 10
has_children: false
description: Miscellaneous crafting recipes and items.
---

## Miscellaneous Crafting

A collection of specialized and unique crafting recipes that don't fit into other categories. Access these recipes at various **Miscellaneous Crafting** workstations.

**Available crafting includes:**
- Unique item creation
- Specialized equipment
- Tool and implement crafting
- Other assorted recipes

**Tip:** Explore these recipes to discover unique items and niche crafting opportunities.

For more information on obtaining toolkits and understanding the full crafting system, see [Crafting System Overview](https://wiki.wildlandermod.com/10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Item Name** to see the complete details including:
- All items required for the recipe
- Perks and toolkit requirements
- Specific workstation location needed
- Additional conditions

Use the search bar and filters below to find specific recipes by toolkit or perks needed.

---

## Miscellaneous Recipes Data

<style>
#misc-recipes-tooltip {
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

#misc-recipes-tooltip div {
  margin: 4px 0;
}

#misc-recipes-tooltip strong {
  color: #f77ef1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initMiscRecipestooltips() {
  const table = document.querySelector('.misc-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showMiscRecipestooltip(e, row));
    itemCell.addEventListener('mousemove', updateMiscRecipestooltipPosition);
    itemCell.addEventListener('mouseleave', hideMiscRecipestooltip);
  });
}

function showMiscRecipestooltip(event, row) {
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
  
  let tooltip = document.getElementById('misc-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'misc-tooltip';
    tooltip.className = 'misc-tooltip';
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
  updateMiscRecipestooltipPosition(event);
}

function updateMiscRecipestooltipPosition(event) {
  const tooltip = document.getElementById('misc-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideMiscRecipestooltip() {
  const tooltip = document.getElementById('misc-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initMiscRecipesFilters() {
  const table = document.querySelector('.misc-recipes-table table');
  if (!table) {
    console.warn('Misc Recipes table not found');
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
      
      if (toolkitText) {
        toolkitText.split(',').forEach(toolkit => {
          const trimmed = toolkit.trim();
          if (trimmed) toolkits.add(trimmed);
        });
      }
      if (perksText) {
        perksText.split(',').forEach(perk => {
          const trimmed = perk.trim();
          if (trimmed) perks.add(trimmed);
        });
      }
    }
  });
  
  const toolkitFilter = document.getElementById('miscToolkitFilter');
  const perksFilter = document.getElementById('miscPerksFilter');
  
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
  
  document.getElementById('miscRecipesSearch').addEventListener('input', filterMiscRecipesTable);
  document.getElementById('miscToolkitFilter').addEventListener('change', filterMiscRecipesTable);
  document.getElementById('miscPerksFilter').addEventListener('change', filterMiscRecipesTable);
  initMiscRecipestooltips();
  updateFilterCountMisc();
}

function filterMiscRecipesTable() {
  const searchTerm = document.getElementById('miscRecipesSearch').value.toLowerCase();
  const toolkitFilter = document.getElementById('miscToolkitFilter').value;
  const perksFilter = document.getElementById('miscPerksFilter').value;
  
  const table = document.querySelector('.misc-recipes-table table');
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
  
  updateFilterCountMisc();
  initMiscRecipestooltips();
}

function updateFilterCountMisc() {
  const table = document.querySelector('.misc-recipes-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountMisc');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearMiscRecipesFilters() {
  document.getElementById('miscRecipesSearch').value = '';
  document.getElementById('miscToolkitFilter').value = '';
  document.getElementById('miscPerksFilter').value = '';
  filterMiscRecipesTable();
}

initMiscRecipesFilters();

});
</script>

<div class="misc-recipes-controls">
  <input type="text" id="miscRecipesSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="miscToolkitFilter">
    <option value="">All Toolkits</option>
  </select>
  <select id="miscPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersMisc" onclick="clearMiscRecipesFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-misc" id="filterResultCountMisc"></div>

<div class="misc-recipes-table" markdown="1">

| Item Name | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---|:---|:---|:---|
| Flammable Oil | 1 |  | N/A | Cook pot | 2 Animal Fat |  |
| Glass Bottle (Water) | 1 |  | N/A | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Salt | 1 |  | N/A | Cook pot | 1 Waterskin (Salt Water) |  |
| Salt | 1 |  | N/A | Cook pot | 1 Glass Bottle (Salt Water) |  |
| Waterskin (3/3) | 1 |  | N/A | Cook pot | 1 Waterskin (Salt Water) |  |
| Soap - Blue Mountain | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Blue Mountain Flower 1 Animal Fat |  |
| Soap - Dragon's Tongue | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Dragon's Tongue 1 Animal Fat |  |
| Soap - Lavender | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Lavender 1 Animal Fat |  |
| Soap - Plain | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 1 Animal Fat |  |
| Soap - Purple Mountain Flower | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Purple Mountain Flower 1 Animal Fat |  |
| Soap - Red Mountain Flower | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 3 Red Mountain Flower 1 Animal Fat |  |
| Soap - Superior Mountain Flower | 3 | Craftsmanship | Survivalists | Cook pot | 1 Salt 2 Blue Mountain Flower 2 Red Mountain Flower 2 Purple Mountain Flower 1 Animal Fat |  |
| Blood of the Hunt (Strange Brew) | 1 |  | Alchemists | Cook pot | 1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart | Brewing Skill Greater or Equal to 2 |
| Chaurus Venom (Good) | 1 |  | Alchemists | Cook pot | 2 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 2 |
| Chaurus Venom (Great) | 1 |  | Alchemists | Cook pot | 1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude) | Animal Harvesting Skill Greater or Equal to 4 |
| Chaurus Venom (Superlative) | 1 |  | Alchemists | Cook pot | 1 Chaurus Eggs 1 Chaurus Venom (Great) | Animal Harvesting Skill Greater or Equal to 6 |
| Dragon's Blood Poison (Crude) | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 1 |
| Dragon's Blood Poison (Decent) | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Poison (Good) | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Poison (Great) | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Poison (Remarkable) | 2 |  | Alchemists | Cook pot | 1 Wolf Eye 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Potion (Decent) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Potion (Good) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Potion (Great) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Potion (Remarkable) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werewolf's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Elixir of Firebloom | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Furious Speed | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Ghostly Passage | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Kyne's Peace | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Slowed Time | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of Swiftness | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Living Circle | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Shade | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Storm | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Elixir of the Unseen | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Death | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Disarming | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Explosive Force | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Terrible Frost | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Dragon's Venom of Torpor | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Flare Coating | 1 |  | Alchemists | Cook pot | 3 Torchbug Thorax | Animal Harvesting Skill Greater or Equal to 1 |
| Mild Acid | 1 |  | Alchemists | Cook pot | 1 Chaurus Venom (Crude) |  |
| Mild Acid | 1 |  | Alchemists | Cook pot | 5 Spider Egg |  |
| Mild Acid | 1 |  | Alchemists | Cook pot | 2 Spider Venom (Crude) |  |
| Poison of Fear (Remarkable) | 2 |  | Alchemists | Cook pot | 1 Dragon's Blood |  |
| Potion of Arcane Metabolisis | 2 |  | Alchemists | Cook pot | 2 Polished Fox Eye 1 Dragon's Blood | Animal Harvesting Skill Greater or Equal to 3 |
| Potion of Boneblood | 1 |  | Alchemists | Cook pot | 10 Bone Meal 1 Blood of the Hunt (Strange Brew) | Animal Harvesting Skill Greater or Equal to 1 |
| Potion of Hircine's Agony (Strange Brew) | 2 |  | Alchemists | Cook pot | 1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative) | Brewing Skill Greater or Equal to 0 |
| Potion of Hircine's Cloak (Strange Brew) | 2 |  | Alchemists | Cook pot | 1 Wolf Heart 2 Polished Sabre Cat Eye | Brewing Skill Greater or Equal to 1 |
| Spider Venom (Good) | 1 |  | Alchemists | Cook pot | 2 Spider Venom (Crude) | Animal Harvesting Skill Greater or Equal to 1 |
| Spider Venom (Great) | 1 |  | Alchemists | Cook pot | 3 Bleeding Crown 1 Spider Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Spider Venom (Superlative) | 1 |  | Alchemists | Cook pot | 1 Spider Egg 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 3 |
| Strong Acid | 1 |  | Alchemists | Cook pot | 1 Spider Venom (Great) | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 |  | Alchemists | Cook pot | 3 Chaurus Eggs | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 |  | Alchemists | Cook pot | 1 Chaurus Venom (Good) | Animal Harvesting Skill Greater or Equal to 2 |
| Troll's Blood Poison (Crude) | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Poison (Decent) | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Poison (Good) | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Poison (Great) | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Poison (Remarkable) | 2 |  | Alchemists | Cook pot | 1 Troll Fat 1 Troll Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Potion (Crude) | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Potion (Decent) | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Potion (Good) | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Potion (Great) | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Potion (Remarkable) | 2 |  | Alchemists | Cook pot | 1 Troll Blood 1 Medicinal Salve | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Poison (Crude) | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 1 |
| Werebear's Blood Poison (Decent) | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Poison (Good) | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Poison (Great) | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Poison (Remarkable) | 2 |  | Alchemists | Cook pot | 1 Bear Eye 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Decent) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Potion (Good) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Potion (Great) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Potion (Remarkable) | 2 |  | Alchemists | Cook pot | 1 Luna Moth Wing 1 Werebear's Blood | Animal Harvesting Skill Greater or Equal to 5 |
| Blood-Conserving Phial | 2 | Craftsmanship,Alchemical Lore 1 | Alchemists | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Mild Acid | Player Must be a vampire |
| Blood-Conserving Phial | 2 | Craftsmanship,Alchemical Lore 1 | Alchemists | Forge | 3 Salt 1 Ingot: Gold 1 Building Glass 3 Strong Acid | Player Must be a vampire |
| Glass Alembic | 1 | Craftsmanship | Alchemists | Forge | 1 Ingot: Steel 5 Building Glass |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Alchemists | Forge | 2 Gem: Garnet (Flawless) |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Ruby |  |
| Red Glitterdust | 5 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Ruby (Flawless) |  |
| Red Glitterdust | 4 | Advanced Blacksmithing | Alchemists | Forge | 3 Gem: Garnet |  |
| Sapphire Glitterdust | 3 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Sapphire |  |
| Sapphire Glitterdust | 5 | Advanced Blacksmithing | Alchemists | Forge | 1 Gem: Sapphire (Flawless) |  |
| Barrel | 2 |  | N/A | Furniture Workbench | 5 Wood 1 Iron Nails |  |
| Chest | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Chest | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Chest | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Child's Chest | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Child's Chest | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Small Chest | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Small Chest | 1 |  | N/A | Furniture Workbench | 5 Wood |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Orange |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Tan |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Green |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Black |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Orange |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Purple |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Purple |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Tan |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Yellow |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Green |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Indigo |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Red |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Black |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Indigo |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Red |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Grey |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Blue |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Grey |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Blue |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth |  |
| Bandage | 1 |  | N/A | N/A | 1 Cotton Cloth - Brown |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Yellow |  |
| Bandage | 1 |  | N/A | N/A | 1 Linen Cloth - Brown |  |
| Ebony Mail | 1 |  | N/A | N/A | 1 Ebony Mail |  |
| Ebony Mail | 1 |  | N/A | N/A | 1 Ebony Mail |  |
| Toolkit: Alchemist's | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Toolkit: Brewer's | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Toolkit: Survivalist's | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Toolkit: Tailor's | 1 | Craftsmanship | N/A | N/A | 2 Wood |  |
| Bone Idol of the Elm Rite (Strange Brew) | 1 |  | Survivalists | N/A | 1 Elm Ritual Bone | Animal Harvesting Skill Greater or Equal to 7 |
| Bone Idol of the Oak Rite (Strange Brew) | 1 |  | Survivalists | N/A | 1 Oak Ritual Bone | Animal Harvesting Skill Greater or Equal to 9 |
| Bone Idol of the Yew Rite (Strange Brew) | 1 |  | Survivalists | N/A | 1 Yew Ritual Bone | Animal Harvesting Skill Greater or Equal to 5 |
| Engraved Bone of Hircine | 1 |  | Survivalists | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Engraved Bone of Julianos | 1 |  | Survivalists | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Engraved Bone of Kynareth | 1 |  | Survivalists | N/A | 1 Animal Bone (Large) | Animal Harvesting Skill Greater or Equal to 1 |
| Fur Backpack - Black | 1 | Craftsmanship | Survivalists | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Backpack - Brown | 1 | Craftsmanship | Survivalists | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Backpack - White | 1 | Craftsmanship | Survivalists | N/A | 4 Leather Strips 4 Hide Lace 2 Fur Plate |  |
| Fur Bedroll | 1 | Craftsmanship | Survivalists | N/A | 2 Hide Lace 2 Fur Plate |  |
| Fur Large Tent | 1 | Craftsmanship | Survivalists | N/A | 4 Wood 2 Leather 12 Fur Plate 1 Fur Bedroll |  |
| Fur Large Tent | 1 |  | Survivalists | N/A | 1 Fur Large Tent (Two Bedrolls) |  |
| Fur Large Tent (Four Bedrolls) | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Large Tent (Three Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Three Bedrolls) | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Large Tent (Two Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Three Bedrolls) | 1 |  | Survivalists | N/A | 1 Fur Large Tent (Four Bedrolls) |  |
| Fur Large Tent (Two Bedrolls) | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Large Tent 1 Fur Bedroll |  |
| Fur Large Tent (Two Bedrolls) | 1 |  | Survivalists | N/A | 1 Fur Large Tent (Three Bedrolls) |  |
| Fur Small Tent | 1 | Craftsmanship | Survivalists | N/A | 2 Wood 2 Leather 6 Fur Plate 1 Fur Bedroll |  |
| Fur Small Tent | 1 |  | Survivalists | N/A | 1 Fur Small Tent (Two Bedrolls) |  |
| Fur Small Tent (Two Bedrolls) | 1 | Craftsmanship | Survivalists | N/A | 1 Fur Small Tent 1 Fur Bedroll |  |
| Healing Poultice | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 5 Medicinal Salve 1 Bandage |  |
| Kindling | 2 |  | Survivalists | N/A | 1 Deadwood |  |
| Kindling | 4 |  | Survivalists | N/A | 1 Wood |  |
| Kindling | 1 |  | Survivalists | N/A | 1 Branches |  |
| Knucklebones (Strange Brew) | 1 |  | Survivalists | N/A | 3 Fragment: Bone | Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 3 |
| Leather Large Tent | 1 | Craftsmanship | Survivalists | N/A | 2 Wood 12 Leather 4 Fur Plate 1 Fur Bedroll |  |
| Leather Large Tent | 1 |  | Survivalists | N/A | 1 Leather Large Tent (Two Bedrolls) |  |
| Leather Large Tent (Three Bedrolls) | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Large Tent (Two Bedrolls) 1 Fur Bedroll |  |
| Leather Large Tent (Two Bedrolls) | 1 |  | Survivalists | N/A | 1 Leather Large Tent (Three Bedrolls) |  |
| Leather Large Tent (Two Bedrolls) | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Large Tent 1 Fur Bedroll |  |
| Leather Small Tent | 1 |  | Survivalists | N/A | 1 Leather Small Tent (Two Bedrolls) |  |
| Leather Small Tent | 1 | Craftsmanship | Survivalists | N/A | 2 Wood 6 Leather 2 Fur Plate 1 Fur Bedroll |  |
| Leather Small Tent (Two Bedrolls) | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Small Tent 1 Fur Bedroll |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Blisterwort |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Imp Stool |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Blue Mountain Flower |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Panacea |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Blue Dartwing |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Cured Skeever Hide |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Wheat |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Charred Skeever Hide |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Sabre Cat Eye |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Monarch Wing |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Rock Warbler Egg |  |
| Medicinal Salve | 30 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Daedra Heart |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Northern Flax |  |
| Medicinal Salve | 1 | Craftsmanship,Alchemical Lore 1 | Survivalists | N/A | 1 Swamp Fungal Pod |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Green |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Yellow |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Kindling |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Brown |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Red |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Tan |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Indigo |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Purple |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Black |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Blue |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Northern Flax |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Grey |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Wrap |  |
| Tinder (Crude) | 1 |  | Survivalists | N/A | 1 Linen Cloth - Orange |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Purple |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Canis Root |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Black |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Tan |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Brown |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Mora Tapinella |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Red |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Blue |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Green |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Indigo |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Orange |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Yellow |  |
| Tinder (Decent) | 1 |  | Survivalists | N/A | 1 Silk Cloth - Grey |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Blue |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Green |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Tundra Cotton |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Purple |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Hanging Moss |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Indigo |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Brown |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Yellow |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Tan |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Tree Bark |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Paper Roll |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Grey |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Red |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Black |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Animal Fat |  |
| Tinder (Good) | 1 |  | Survivalists | N/A | 1 Cotton Cloth - Orange |  |
| Tinder (Great) | 1 |  | Survivalists | N/A | 1 Straw |  |
| Tinder (Great) | 1 |  | Survivalists | N/A | 1 Beehive Husk |  |
| Tinder (Superlative) | 1 |  | Survivalists | N/A | 1 Dwarven Oil |  |
| Tinder (Superlative) | 1 |  | Survivalists | N/A | 1 Flammable Oil |  |
| Waterskin (Empty) | 1 | Craftsmanship | Survivalists | N/A | 1 Leather Strips 1 Leather |  |
| Wooden Torch | 1 |  | Survivalists | N/A | 1 Linen Wrap 1 Wood 1 Flammable Oil |  |
| Wooden Torch (5) | 1 |  | Survivalists | N/A | 5 Linen Wrap 5 Wood 5 Flammable Oil |  |
| Wooden Torch (10) | 1 |  | Survivalists | N/A | 10 Linen Wrap 10 Wood 10 Flammable Oil |  |
| Wooden Torch (Bright) | 1 |  | Survivalists | N/A | 1 Linen Wrap 1 Wood 1 Dwarven Oil |  |
| Wooden Torch (Bright) (5) | 1 |  | Survivalists | N/A | 5 Linen Wrap 5 Wood 5 Dwarven Oil |  |
| Wooden Walking Stick | 1 |  | Survivalists | N/A | 2 Wood 2 Leather Strips |  |
| Wooden Walking Stick | 1 |  | Survivalists | N/A | 2 Leather Strips 4 Deadwood |  |
| Spinning Wheel | 1 | Craftsmanship | Builders,Survivalists | N/A | 8 Wood 5 Iron Nails |  |
| Wooden Barrel | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Wooden Chest | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Wooden Common Bed | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood 2 Fur Plate |  |
| Wooden Common Chair | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Wooden Common Table | 1 | Craftsmanship | Builders,Survivalists | N/A | 5 Wood |  |
| Decorative War Horn | 1 |  | Builders | N/A | 1 Ingot: Iron 1 Animal Bone (Superlative) | Animal Harvesting Skill Greater or Equal to 3 |
| Wooden Flute | 1 | Craftsmanship | Builders | N/A | 1 Salt 1 Wood 1 Bottled Milk |  |

</div>

