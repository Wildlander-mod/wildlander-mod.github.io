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
    proximity: cells[3]?.textContent || '',
    itemsRequired: cells[4]?.textContent || '',
    additionalRequirements: cells[5]?.textContent || ''
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
      const perksText = cells[2].textContent.trim();
      
      if (perksText) {
        perksText.split(',').forEach(perk => {
          const trimmed = perk.trim();
          if (trimmed) perks.add(trimmed);
        });
      }
    }
  });
  
  const perksFilter = document.getElementById('miscPerksFilter');
  
  Array.from(perks).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perksFilter.appendChild(option);
  });
  
  document.getElementById('miscRecipesSearch').addEventListener('input', filterMiscRecipesTable);

  document.getElementById('miscPerksFilter').addEventListener('change', filterMiscRecipesTable);
  initMiscRecipestooltips();
  updateFilterCountMisc();
}

function filterMiscRecipesTable() {
  const searchTerm = document.getElementById('miscRecipesSearch').value.toLowerCase();
  const perksFilter = document.getElementById('miscPerksFilter').value;
  
  const table = document.querySelector('.misc-recipes-table table');
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
  document.getElementById('miscPerksFilter').value = '';
  filterMiscRecipesTable();
}

initMiscRecipesFilters();

});
</script>

<div class="misc-recipes-controls">
  <input type="text" id="miscRecipesSearch" placeholder="Search (Item Name, Ingredients, Requirements)..." />
  <select id="miscPerksFilter">
    <option value="">All Perks</option>
  </select>
  <button id="clearFiltersMisc" onclick="clearMiscRecipesFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-misc" id="filterResultCountMisc"></div>

<div class="misc-recipes-table" markdown="1">

| Item Name | Qty Made | Perks Needed | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---|:---|:---|
| Enchanters Infusion | 1 | Enchantment Mastery |  | 1 Soul Gem: Grand (Filled) 2 Bone Meal 1 Fire Salts 1 Glass Bottle (Water) |  |
| Enchanters Infusion | 1 | Enchantment Mastery |  | 1 Soul Gem: Grand (Filled) 2 Bone Meal 1 Fire Salts 1 Glass Bottle (Water) |  |
| Enchanters Infusion | 1 | Enchantment Mastery |  | 1 Soul Gem: Grand (Filled) 2 Bone Meal 1 Fire Salts 1 Glass Bottle (Water) |  |
| Enchanters Infusion | 1 | Enchantment Mastery |  | 1 Soul Gem: Grand (Filled) 2 Bone Meal 1 Fire Salts 1 Glass Bottle (Water) |  |
| Enchanters Infusion | 1 | Enchantment Mastery |  | 1 Soul Gem: Grand (Filled) 2 Bone Meal 1 Fire Salts 1 Glass Bottle (Water) |  |
| Dye - Grey | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Giant Lichen |  |
| Dye - Green | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Hanging Moss |  |
| Dye - Black | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Nightshade |  |
| Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Salt |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Purple Mountain Flower |  |
| Dye - Red | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Red Mountain Flower |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Blue Mountain Flower |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Indigo 1 Dye - Bleach |  |
| Dye - Tan | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Brown 1 Dye - Bleach |  |
| Dye - Grey | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Bleach |  |
| Dye - Brown | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Tan |  |
| Dye - Indigo | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Blue |  |
| Dye - Green | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Blue 1 Dye - Yellow |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Blue 1 Dye - Red |  |
| Dye - Orange | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Red 1 Dye - Yellow |  |
| Dye - Yellow | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dragon's Tongue |  |
| Dye - Orange | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Creep Cluster |  |
| Dye - Tan | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Grass Pod |  |
| Dye - Brown | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Canis Root |  |
| Dye - Indigo | 4 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Deathbell |  |
| Flammable Oil | 1 |  | Cook pot | 2 Animal Fat |  |
| Ornate Chest | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Wood |  |
| Small Chest | 1 | Craftsmanship | Forge | 1 Ingot: Iron 4 Wood |  |
| Ale Barrel | 1 | Craftsmanship | Forge | 2 Ingot: Iron 5 Wood |  |
| Strong Box | 1 | Craftsmanship | Forge | 3 Ingot: Iron |  |
| Noble Chest | 1 | Craftsmanship | Forge | 2 Ingot: Iron 6 Wood |  |
| Iron Cooking Pot | 1 | Craftsmanship | Forge | 1 Iron Large Pot |  |
| Iron Cooking Pot | 1 | Craftsmanship | Forge | 1 Iron Pot |  |
| Iron Cooking Pot | 1 | Craftsmanship | Forge | 2 Ingot: Iron |  |
| Enchanted Ring Armor of Drain Protection | 1 | Arcane Experimentation | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring Armor of Resist Pestilence (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Pestilence | 1 | Arcane Experimentation | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Marksman (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Two-Handed (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify One-Handed (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Magic (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Shock (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Frost (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Fire (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Stamina Regeneration (Rank II) | 1 | Arcane Experimentation | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Magicka Regeneration (Rank II) | 1 | Arcane Experimentation | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Health Regeneration (Rank II) | 1 | Arcane Experimentation | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Stamina (Rank III) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Magicka (Rank III) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Health (Rank III) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Restoration | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Illusion | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Destruction | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Conjuration | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Alteration | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Restoration (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Illusion (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Destruction (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Conjuration (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Alteration (Rank II) | 1 | Artificer's Insight | Forge | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Iron Dagger of Arcane Power | 1 | Arcane Experimentation | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Iron Dagger of Toxicity | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Annihilation | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Greater Force | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Elemental Fury | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Spellbreaking | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Shockbursting | 1 | Arcane Experimentation | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Force | 1 | Arcane Experimentation | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Frostbursting | 1 | Arcane Experimentation | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Flamebursting | 1 | Arcane Experimentation | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Hunters Iron Dagger | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Toxic Life | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Annihilating | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Holy Iron Dagger | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Storms | 1 | Artificer's Insight | Forge | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Potent Enchanters Infusion | 1 | Enchantment Mastery | Forge | 8 Soul Gem: Grand (Filled) 6 Fire Salts 6 Frost Salts 6 Void Salts |  |
| Carpenter's Workbench | 1 | Craftsmanship | Forge | 10 Wood 5 Iron Nails |  |
| Iron Lantern | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Lockpick | 1 | Cheap Tricks,Craftsmanship | Forge | 4 Fragment: Iron |  |
| Gem: Opal | 1 | Advanced Blacksmithing | Forge | 1 Gem: Opal (Rough) |  |
| Aquamarine | 1 | Advanced Blacksmithing | Forge | 1 Gem: Aquamarine (Rough) |  |
| Peridot | 1 | Advanced Blacksmithing | Forge | 1 Gem: Peridot (Rough) |  |
| Gem: Onyx | 1 | Advanced Blacksmithing | Forge | 1 Gem: Onyx (Rough) |  |
| Gem: Amber | 1 | Advanced Blacksmithing | Forge | 1 Gem: Amber (Rough) |  |
| Iron Nails | 100 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Lock | 10 | Craftsmanship | Forge | 10 Ingot: Iron 10 Ingot: Corundum |  |
| Iron Hinge | 20 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Nails | 50 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Lock | 5 | Craftsmanship | Forge | 5 Ingot: Iron 5 Ingot: Corundum |  |
| Iron Hinge | 10 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Iron Fittings | 10 | Craftsmanship | Forge | 10 Ingot: Iron |  |
| Iron Fittings | 5 | Craftsmanship | Forge | 5 Ingot: Iron |  |
| Garnet | 1 | Advanced Blacksmithing | Forge | 1 Gem: Garnet (Rough) |  |
| Diamond | 1 | Advanced Blacksmithing | Forge | 1 Gem: Diamond (Rough) |  |
| Amethyst | 1 | Advanced Blacksmithing | Forge | 1 Gem: Amethyst (Rough) |  |
| Emerald | 1 | Advanced Blacksmithing | Forge | 1 Gem: Emerald (Rough) |  |
| Ruby | 1 | Advanced Blacksmithing | Forge | 1 Gem: Ruby (Rough) |  |
| Sapphire | 1 | Advanced Blacksmithing | Forge | 1 Gem: Sapphire (Rough) |  |
| Lockpick | 5 | Cheap Tricks,Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Hammer | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Wood |  |
| Iron Tongs | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Cauldron | 1 | Craftsmanship | Forge | 8 Ingot: Iron |  |
| Glass Alembic | 1 | Craftsmanship | Forge | 1 Ingot: Steel 5 Building Glass |  |
| Decorative War Horn | 1 |  | Forge | 1 Ingot: Iron 1 Animal Bone (Superlative) | Forage Skill Greater or Equal to 3 |
| Iron Lock | 1 | Craftsmanship | Forge | 1 Ingot: Iron 1 Ingot: Corundum |  |
| Iron Hinge | 2 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Nails | 10 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Iron Fittings | 1 | Craftsmanship | Forge | 1 Ingot: Iron |  |
| Small Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Small Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Child's Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Child's Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Chest | 1 |  | Furniture Workbench | 5 Wood |  |
| Barrel | 2 |  | Furniture Workbench | 5 Wood 1 Iron Nails |  |
| Staff of Thunderbolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Storm Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Frost Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of the Flame Wall | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Minor Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Grand Turning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Sparks | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Soul Trapping | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Vanquishing | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 4 Heart Stone |  |
| Staff of Revenants | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Repulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 4 Heart Stone |  |
| Staff of Repulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of Reanimation | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of Inspiration | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Zombies | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of Paralysis | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Alteration 4 Heart Stone |  |
| Staff of Magelight | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Alteration 2 Heart Stone |  |
| Staff of Incineration | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Icy Spears | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 4 Heart Stone |  |
| Staff of Ice Storms | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Ice Spikes | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Heal Other | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 3 Heart Stone |  |
| Staff of the Healing Hand | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Restoration 2 Heart Stone |  |
| Staff of Fury | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Icewind | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Frenzy | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 3 Heart Stone |  |
| Staff of Flames | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 1 Heart Stone |  |
| Staff of Firebolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Staff of Fireballs | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Fear | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Expulsion | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Dread Zombies | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Courage | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 1 Heart Stone |  |
| Staff of the Storm Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of the Frost Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of the Flame Atronach | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 2 Heart Stone |  |
| Staff of the Spirit Wolf | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 1 Heart Stone |  |
| Staff of Daedric Command | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 4 Heart Stone |  |
| Staff of Chain Lightning | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 3 Heart Stone |  |
| Staff of Calm | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Illusion 2 Heart Stone |  |
| Staff of Banishing | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Conjuration 3 Heart Stone |  |
| Staff of Lightning Bolts | 1 | Enchanter's Insight | Staff Enchanter | 1 Unenchanted Staff of Destruction 2 Heart Stone |  |
| Iron Shiv | 1 | Craftsmanship | Sharpening Wheel | 1 Ingot: Iron |  |
| Blacksmithing Supplies | 1 | Craftsmanship | Player Crafting | 4 Wood |  |
| Alchemists Pouch | 1 |  | Player Crafting | 2 Leather |  |
| Nord War Horn | 1 |  | Player Crafting | 2 Polished Ivory 1 Silver Paint | Forage Skill Greater or Equal to 3 |
| Fox Figurine | 1 |  | Player Crafting | 1 Polished Ivory | Forage Skill Greater or Equal to 2 |
| Silver Paint | 1 |  | Player Crafting | 1 Ore: Silver 1 Spriggan Sap | Forage Skill Greater or Equal to 2 |
| Gold Paint | 1 |  | Player Crafting | 1 Ore: Gold 1 Spriggan Sap | Forage Skill Greater or Equal to 2 |
| Queen Bee Statue | 1 |  | Player Crafting | 2 Polished Ivory 1 Gold Paint | Forage Skill Greater or Equal to 3 |
| Drinking Horn | 1 |  | Player Crafting | 1 Goat Horns | Forage Skill Greater or Equal to 3 |
| Golden Ship Model | 1 |  | Player Crafting | 1 Wood 2 Polished Ivory 1 Gold Paint | Forage Skill Greater or Equal to 3 |
| Ivory Dragon Claw Replica | 1 |  | Player Crafting | 3 Polished Ivory | Forage Skill Greater or Equal to 3 |
| Golden Claw Replica | 1 |  | Player Crafting | 3 Polished Ivory 1 Gold Paint | Forage Skill Greater or Equal to 3 |
| Masterwork Flute | 1 |  | Player Crafting | 1 Polished Ivory | Forage Skill Greater or Equal to 6 |
| Toy Flute | 1 |  | Player Crafting | 1 Wood | Forage Skill Greater or Equal to 2 |
| Gray Fox Sculpture | 1 |  | Player Crafting | 4 Polished Ivory | Forage Skill Greater or Equal to 5 |
| Toy Boat | 1 |  | Player Crafting | 1 Wood | Forage Skill Greater or Equal to 2 |
| Statue of Dibella | 1 |  | Player Crafting | 3 Polished Ivory 1 Gold Paint | Forage Skill Greater or Equal to 5 |
| Chitin Plate | 2 |  | Player Crafting | 1 Large Mudcrab Chitin | Forage Skill Greater or Equal to 1 |
| Chitin Plate | 1 |  | Player Crafting | 1 Chaurus Chitin | Forage Skill Greater or Equal to 1 |
| Chitin Plate | 2 |  | Player Crafting | 1 Shellbug Chitin | Forage Skill Greater or Equal to 1 |
| Fragment: Chitin | 5 |  | Player Crafting | 1 Large Mudcrab Chitin | Forage Skill Greater or Equal to 1 |
| Inkwell | 1 |  | Player Crafting | 1 Animal Bone (Large) 1 Ink | Forage Skill Greater or Equal to 1 |
| Polished Ivory | 2 |  | Player Crafting | 1 Boar Tusk | Forage Skill Greater or Equal to 1 |
| Ivory Candlestick | 1 |  | Player Crafting | 1 Polished Ivory | Forage Skill Greater or Equal to 1 |
| Quill | 1 |  | Player Crafting | 1 Felsaad Tern Feathers | Forage Skill Greater or Equal to 1 |
| Quill | 1 |  | Player Crafting | 1 Bone Hawk Feathers | Forage Skill Greater or Equal to 1 |
| Quill | 1 |  | Player Crafting | 1 Hagraven Feathers | Forage Skill Greater or Equal to 1 |
| Quill | 1 |  | Player Crafting | 1 Hawk Feathers | Forage Skill Greater or Equal to 1 |
| Fragment: Dragonbone | 3 |  | Player Crafting | 1 Dragon Bone |  |
| Fragment: Chitin | 2 |  | Player Crafting | 1 Mudcrab Chitin | Forage Skill Greater or Equal to 1 |
| Fragment: Chitin | 3 |  | Player Crafting | 1 Chaurus Chitin | Forage Skill Greater or Equal to 1 |
| Fragment: Chitin | 4 |  | Player Crafting | 1 Shellbug Chitin | Forage Skill Greater or Equal to 1 |
| Fragment: Chitin | 2 |  | Player Crafting | 1 Chitin Plate | Forage Skill Greater or Equal to 1 |
| Polished Ivory | 1 |  | Player Crafting | 1 Horker Tusk | Forage Skill Greater or Equal to 1 |
| Fragment: Ivory | 3 |  | Player Crafting | 1 Polished Ivory |  |
| Polished Ivory | 6 |  | Player Crafting | 1 Mammoth Tusk (Superlative) |  |
| Polished Ivory | 3 |  | Player Crafting | 1 Mammoth Tusk |  |
| Mortar and Pestle | 1 |  | Player Crafting | 1 Animal Bone (Small) 1 Animal Bone (Large) | Forage Skill Greater than 0 |
| Iron Dagger of Toxicity | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Annihilation | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Greater Force | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Elemental Fury | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Spellbreaking | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Shockbursting | 1 | Arcane Experimentation | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Force | 1 | Arcane Experimentation | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Frostbursting | 1 | Arcane Experimentation | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Flamebursting | 1 | Arcane Experimentation | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Arcane Power | 1 | Arcane Experimentation | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Hide Lace | 2 | Craftsmanship | Player Crafting | 1 Fur Plate |  |
| Hide Lace | 1 | Craftsmanship | Player Crafting | 1 Pelt: Ruined |  |
| Waterskin (Empty) | 1 | Craftsmanship | Player Crafting | 1 Leather Strips 1 Animal Bladder |  |
| Carpenter's Workbench | 1 | Craftsmanship | Player Crafting | 10 Wood 5 Iron Nails |  |
| Furniture Workbench | 1 | Craftsmanship | Player Crafting | 10 Wood 5 Iron Nails |  |
| Spinning Wheel | 1 | Craftsmanship | Player Crafting | 8 Wood 5 Iron Nails |  |
| Tinder (Superlative) | 1 |  | Player Crafting | 1 Flammable Oil |  |
| Tinder (Superlative) | 1 |  | Player Crafting | 1 Dwarven Oil |  |
| Tinder (Great) | 1 |  | Player Crafting | 1 Straw |  |
| Tinder (Great) | 1 |  | Player Crafting | 1 Beehive Husk |  |
| Tinder (Good) | 1 |  | Player Crafting | 1 Paper Roll |  |
| Tinder (Good) | 1 |  | Player Crafting | 1 Hanging Moss |  |
| Tinder (Good) | 1 |  | Player Crafting | 1 Animal Fat |  |
| Tinder (Decent) | 1 |  | Player Crafting | 1 Mora Tapinella |  |
| Tinder (Decent) | 1 |  | Player Crafting | 1 Canis Root |  |
| Tinder (Crude) | 1 |  | Player Crafting | 1 Northern Flax |  |
| Tinder (Crude) | 1 |  | Player Crafting | 1 Kindling |  |
| Enchanted Ring Armor of Drain Protection | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring Armor of Resist Pestilence (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Pestilence | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Marksman (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Two-Handed (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify One-Handed (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Magic (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Shock (Rank II) | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Frost (Rank II) | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Resist Fire (Rank II) | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Stamina Regeneration (Rank II) | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Magicka Regeneration (Rank II) | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Fortify Health Regeneration (Rank II) | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Stamina (Rank III) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Magicka (Rank III) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Health (Rank III) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Restoration | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Illusion | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Destruction | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Conjuration | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Alteration | 1 | Arcane Experimentation | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Restoration (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Illusion (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Destruction (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Conjuration (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Ring of Potent Alteration (Rank II) | 1 | Artificer's Insight | Player Crafting | 1 Soul Gem: Grand (Filled) 1 Silver Ring |  |
| Enchanted Hunters Iron Dagger | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Toxic Life | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Annihilating | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Holy Iron Dagger | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Enchanted Iron Dagger of Storms | 1 | Artificer's Insight | Player Crafting | 1 Iron Dagger 1 Soul Gem: Grand (Filled) |  |
| Potent Enchanters Infusion | 1 | Enchantment Mastery | Player Crafting | 8 Soul Gem: Grand (Filled) 6 Fire Salts 6 Frost Salts 6 Void Salts |  |
| Fur Bedroll | 1 | Craftsmanship | Player Crafting | 2 Hide Lace 2 Fur Plate |  |
| Wooden Barrel | 1 | Craftsmanship | Player Crafting | 5 Wood |  |
| Wooden Chest | 1 | Craftsmanship | Player Crafting | 5 Wood |  |
| Wooden Common Table | 1 | Craftsmanship | Player Crafting | 5 Wood |  |
| Wooden Common Chair | 1 | Craftsmanship | Player Crafting | 5 Wood |  |
| Wooden Common Bed | 1 | Craftsmanship | Player Crafting | 5 Wood 2 Fur Plate |  |
| Waterskin (Empty) | 1 | Craftsmanship | Player Crafting | 1 Leather Strips 1 Leather |  |
| Tinder (Good) | 1 |  | Player Crafting | 1 Tree Bark |  |
| Wooden Flute | 1 | Craftsmanship | Player Crafting | 1 Salt 1 Wood 1 Bottled Milk |  |
| Knucklebones (Strange Brew) | 1 |  | Player Crafting | 3 Fragment: Bone | Brewing Skill Greater or Equal to 3,Forage Skill Greater or Equal to 3 |
| Bone Idol of the Oak Rite (Strange Brew) | 1 |  | Player Crafting | 1 Oak Ritual Bone | Forage Skill Greater or Equal to 9 |
| Bone Idol of the Elm Rite (Strange Brew) | 1 |  | Player Crafting | 1 Elm Ritual Bone | Forage Skill Greater or Equal to 7 |
| Bone Idol of the Yew Rite (Strange Brew) | 1 |  | Player Crafting | 1 Yew Ritual Bone | Forage Skill Greater or Equal to 5 |
| Engraved Bone of Kynareth | 1 |  | Player Crafting | 1 Animal Bone (Large) | Forage Skill Greater or Equal to 1 |
| Engraved Bone of Julianos | 1 |  | Player Crafting | 1 Animal Bone (Large) | Forage Skill Greater or Equal to 1 |
| Engraved Bone of Hircine | 1 |  | Player Crafting | 1 Animal Bone (Large) | Forage Skill Greater or Equal to 1 |
| Fur Small Tent | 1 |  | Player Crafting | 1 Fur Small Tent (Two Bedrolls) |  |
| Fur Small Tent (Two Bedrolls) | 1 | Craftsmanship | Player Crafting | 1 Fur Small Tent 1 Fur Bedroll |  |
| Kindling | 1 |  | Player Crafting | 1 Branches |  |
| Portable Enchanting Supplies | 1 | Enchanter's Insight | Player Crafting | 1 Troll Skull 4 Spriggan Sap 1 Gem: Amethyst (Flawless) |  |
| Fur Small Tent | 1 | Craftsmanship | Player Crafting | 2 Wood 2 Leather 6 Fur Plate 1 Fur Bedroll |  |
| Kindling | 4 |  | Player Crafting | 1 Wood |  |
| Kindling | 2 |  | Player Crafting | 1 Deadwood |  |
| Fur Large Tent | 1 |  | Player Crafting | 1 Fur Large Tent (Two Bedrolls) |  |
| Fur Large Tent (Two Bedrolls) | 1 |  | Player Crafting | 1 Fur Large Tent (Three Bedrolls) |  |
| Fur Large Tent (Three Bedrolls) | 1 |  | Player Crafting | 1 Fur Large Tent (Four Bedrolls) |  |
| Fur Large Tent (Four Bedrolls) | 1 | Craftsmanship | Player Crafting | 1 Fur Large Tent (Three Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Three Bedrolls) | 1 | Craftsmanship | Player Crafting | 1 Fur Large Tent (Two Bedrolls) 1 Fur Bedroll |  |
| Fur Large Tent (Two Bedrolls) | 1 | Craftsmanship | Player Crafting | 1 Fur Large Tent 1 Fur Bedroll |  |
| Fur Large Tent | 1 | Craftsmanship | Player Crafting | 4 Wood 2 Leather 12 Fur Plate 1 Fur Bedroll |  |




