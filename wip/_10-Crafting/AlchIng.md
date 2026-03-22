---
title: Alchemy Ingredients
layout: default
nav_order: 2
has_children: false
description: Alchemy ingredients and recipe list.
---

## Alchemy Ingredients and Potion Crafting

Alchemy allows you to create powerful potions and poisons. Access these recipes at an **Alchemy Lab** workstation with the appropriate toolkit.

**What you can make:**
- Healing potions and stamina restoratives
- Buff potions (strength, resist magic, etc.)
- Poisons and harmful concoctions
- Ingredient combinations for advanced recipes

**Tip:** Alchemy is essential for survivability in Requiem. Stock up on healing potions before dangerous encounters.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Item Name** to see the complete details including:
- Quantity produced per craft
- Components required
- Perks and proximity requirements
- Additional skill requirements

Use the search bar and filters below to find specific alchemy recipes by perks or proximity.

---

## Crafted Alchemy Recipes Data

<style>
#alchemy-recipes-tooltip {
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

#alchemy-recipes-tooltip div {
  margin: 4px 0;
}

#alchemy-recipes-tooltip strong {
  color: #f77ef1;
}

.alchemy-recipes-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initAlchemyRecipestooltips() {
  const table = document.querySelector('.alchemy-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showAlchemyRecipestooltip(e, row));
    itemCell.addEventListener('mousemove', updateAlchemyRecipestooltipPosition);
    itemCell.addEventListener('mouseleave', hideAlchemyRecipestooltip);
  });
}

function showAlchemyRecipestooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    qty: cells[1]?.textContent || '',
    components: cells[2]?.textContent || '',
    perks: cells[3]?.textContent || '',
    proximity: cells[4]?.textContent || '',
    additional: cells[5]?.textContent || ''
  };
  
  let tooltip = document.getElementById('alchemy-recipes-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'alchemy-recipes-tooltip';
    tooltip.className = 'alchemy-recipes-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Item:</strong> ' + data.itemName + '</div>' +
    '<div><strong>Qty Made:</strong> ' + data.qty + '</div>' +
    '<div><strong>Components:</strong> ' + data.components + '</div>' +
    '<div><strong>Perks Needed:</strong> ' + data.perks + '</div>' +
    '<div><strong>Proximity:</strong> ' + data.proximity + '</div>' +
    '<div><strong>Additional Requirements:</strong> ' + data.additional + '</div>';
  tooltip.style.display = 'block';
  updateAlchemyRecipestooltipPosition(event);
}

function updateAlchemyRecipestooltipPosition(event) {
  const tooltip = document.getElementById('alchemy-recipes-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideAlchemyRecipestooltip() {
  const tooltip = document.getElementById('alchemy-recipes-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initAlchemyRecipesFilters() {
  const table = document.querySelector('.alchemy-recipes-table table');
  if (!table) {
    console.warn('Alchemy Recipes table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const perks = new Set();
  const proximities = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 5) {
      const perkText = cells[3].textContent.trim();
      const proximityText = cells[4].textContent.trim();
      
      if (perkText && perkText !== '') {
        perkText.split(',').forEach(perk => {
          const trimmed = perk.trim();
          if (trimmed) perks.add(trimmed);
        });
      }
      if (proximityText && proximityText !== '') {
        proximities.add(proximityText);
      }
    }
  });
  
  const perksFilter = document.getElementById('alchemyRecipesPerksFilter');
  const proximityFilter = document.getElementById('alchemyRecipesProximityFilter');
  
  Array.from(perks).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perksFilter.appendChild(option);
  });
  
  Array.from(proximities).sort().forEach(proximity => {
    const option = document.createElement('option');
    option.value = proximity;
    option.textContent = proximity;
    proximityFilter.appendChild(option);
  });
  
  document.getElementById('alchemyRecipesSearch').addEventListener('input', filterAlchemyRecipes);
  document.getElementById('alchemyRecipesPerksFilter').addEventListener('change', filterAlchemyRecipes);
  document.getElementById('alchemyRecipesProximityFilter').addEventListener('change', filterAlchemyRecipes);
  initAlchemyRecipestooltips();
  updateFilterCountAlchemyRecipes();
  filterAlchemyRecipes();
}

function filterAlchemyRecipes() {
  const searchTerm = document.getElementById('alchemyRecipesSearch').value.toLowerCase();
  const perksFilter = document.getElementById('alchemyRecipesPerksFilter').value;
  const proximityFilter = document.getElementById('alchemyRecipesProximityFilter').value;
  
  const table = document.querySelector('.alchemy-recipes-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const components = cells[2]?.textContent.toLowerCase() || '';
    const searchMatch = itemName.includes(searchTerm) || components.includes(searchTerm);
    const perksCellText = cells[3]?.textContent.trim() || '';
    const perksList = perksCellText.split(',').map(p => p.trim());
    const perksMatch = !perksFilter || perksList.includes(perksFilter);
    const proximityMatch = !proximityFilter || cells[4]?.textContent.trim() === proximityFilter;
    
    const isVisible = searchMatch && perksMatch && proximityMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountAlchemyRecipes();
  initAlchemyRecipestooltips();
}

function updateFilterCountAlchemyRecipes() {
  const table = document.querySelector('.alchemy-recipes-table table');
  if (!table) return;
  
  const allRows = table.querySelectorAll('tbody tr');
  const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
  
  const countElement = document.getElementById('filterResultCountAlchemyRecipes');
  if (countElement) {
    countElement.textContent = `Showing ${visibleRows.length} of ${allRows.length} recipes`;
  }
}

function clearAlchemyRecipesFilters() {
  document.getElementById('alchemyRecipesSearch').value = '';
  document.getElementById('alchemyRecipesPerksFilter').value = '';
  document.getElementById('alchemyRecipesProximityFilter').value = '';
  filterAlchemyRecipes();
}

initAlchemyRecipesFilters();

});
</script>

<div class="alchemy-recipes-controls">
  <input type="text" id="alchemyRecipesSearch" placeholder="Search (Item Name, Components)..." />
  <select id="alchemyRecipesPerksFilter">
    <option value="">All Perks</option>
  </select>
  <select id="alchemyRecipesProximityFilter">
    <option value="">All Proximity</option>
  </select>
  <button id="clearFiltersAlchemyRecipes" onclick="clearAlchemyRecipesFilters()">Clear Filters</button>
</div>
<div class="filter-result-count-alchemy-recipes" id="filterResultCountAlchemyRecipes"></div>

<div class="alchemy-recipes-table" markdown="1">

| Item Name | Qty | Components | Perks Needed | Proximity | Additional Requirements |
|:---|:---:|:---|:---|:---|:---|
| Ink | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| White Bonesap | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 3 |
| Red Bonesap | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 5 |
| Shellbug Resin | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 3 |
| Wolfsap | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 7 |
| Wyrmsap | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 8 |
| Salt | 1 |  |  | Cook pot |  |
| Salt | 1 |  |  | Cook pot |  |
| Snowberry Extract | 1 |  | Alchemical Lore 1 | Cook pot | Forage Skill Greater or Equal to 1 |
| Werebear's Blood Poison (Remarkable) | 2 |  |  | Cook pot | Forage Skill Greater or Equal to 5 |
| Werebear's Blood Poison (Great) | 2 |  |  | Cook pot | Forage Skill Equal to 4 |
| Werebear's Blood Poison (Good) | 2 |  |  | Cook pot | Forage Skill Equal to 3 |
| Werebear's Blood Poison (Decent) | 2 |  |  | Cook pot | Forage Skill Equal to 2 |
| Werebear's Blood Poison (Crude) | 2 |  |  | Cook pot | Forage Skill Equal to 1 |
| Werebear's Blood Potion (Remarkable) | 2 |  |  | Cook pot | Forage Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Great) | 2 |  |  | Cook pot | Forage Skill Equal to 4 |
| Werebear's Blood Potion (Good) | 2 |  |  | Cook pot | Forage Skill Equal to 3 |
| Werebear's Blood Potion (Decent) | 2 |  |  | Cook pot | Forage Skill Equal to 2 |
| Strong Acid | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 2 |
| Strong Acid | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 2 |
| Strong Acid | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 2 |
| Mild Acid | 1 |  |  | Cook pot |  |
| Mild Acid | 1 |  |  | Cook pot |  |
| Mild Acid | 1 |  |  | Cook pot |  |
| Potion of Boneblood | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| Strange Brew | 3 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| Spriggan Sap | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 2 |
| Potion of Arcane Metabolisis | 2 |  |  | Cook pot | Forage Skill Greater or Equal to 3 |
| Dragon's Elixir of Swiftness | 2 |  |  | Cook pot |  |
| Dragon's Venom of Explosive Force | 2 |  |  | Cook pot |  |
| Dragon's Elixir of Ghostly Passage | 2 |  |  | Cook pot |  |
| Dragon's Elixir of the Storm | 2 |  |  | Cook pot |  |
| Dragon's Elixir of Slowed Time | 2 |  |  | Cook pot |  |
| Dragon's Venom of Death | 2 |  |  | Cook pot |  |
| Dragon's Elixir of Kyne's Peace | 2 |  |  | Cook pot |  |
| Dragon's Venom of Terrible Frost | 2 |  |  | Cook pot |  |
| Dragon's Venom of Torpor | 2 |  |  | Cook pot |  |
| Dragon's Elixir of Firebloom | 2 |  |  | Cook pot |  |
| Dragon's Elixir of Furious Speed | 2 |  |  | Cook pot |  |
| Poison of Fear (Remarkable) | 2 |  |  | Cook pot |  |
| Dragon's Venom of Disarming | 2 |  |  | Cook pot |  |
| Dragon's Elixir of the Unseen | 2 |  |  | Cook pot |  |
| Dragon's Elixir of the Living Circle | 2 |  |  | Cook pot |  |
| Dragon's Elixir of the Shade | 2 |  |  | Cook pot |  |
| Werewolf's Blood Poison (Remarkable) | 2 |  |  | Cook pot | Forage Skill Greater or Equal to 5 |
| Werewolf's Blood Poison (Great) | 2 |  |  | Cook pot | Forage Skill Equal to 4 |
| Werewolf's Blood Poison (Good) | 2 |  |  | Cook pot | Forage Skill Equal to 3 |
| Werewolf's Blood Poison (Decent) | 2 |  |  | Cook pot | Forage Skill Equal to 2 |
| Werewolf's Blood Poison (Crude) | 2 |  |  | Cook pot | Forage Skill Equal to 1 |
| Werewolf's Blood Potion (Remarkable) | 2 |  |  | Cook pot | Forage Skill Greater or Equal to 5 |
| Werewolf's Blood Potion (Great) | 2 |  |  | Cook pot | Forage Skill Equal to 4 |
| Werewolf's Blood Potion (Good) | 2 |  |  | Cook pot | Forage Skill Equal to 3 |
| Werewolf's Blood Potion (Decent) | 2 |  |  | Cook pot | Forage Skill Equal to 2 |
| Troll's Blood Poison (Remarkable) | 2 |  |  | Cook pot | Forage Skill Greater or Equal to 5 |
| Troll's Blood Poison (Great) | 2 |  |  | Cook pot | Forage Skill Equal to 4 |
| Troll's Blood Poison (Good) | 2 |  |  | Cook pot | Forage Skill Equal to 3 |
| Troll's Blood Poison (Decent) | 2 |  |  | Cook pot | Forage Skill Equal to 2 |
| Troll's Blood Poison (Crude) | 2 |  |  | Cook pot | Forage Skill Equal to 1 |
| Troll's Blood Potion (Remarkable) | 2 |  |  | Cook pot | Forage Skill Greater or Equal to 5 |
| Troll's Blood Potion (Great) | 2 |  |  | Cook pot | Forage Skill Equal to 4 |
| Troll's Blood Potion (Good) | 2 |  |  | Cook pot | Forage Skill Equal to 3 |
| Troll's Blood Potion (Decent) | 2 |  |  | Cook pot | Forage Skill Equal to 2 |
| Troll's Blood Potion (Crude) | 2 |  |  | Cook pot | Forage Skill Equal to 1 |
| Chaurus Venom (Superlative) | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 6 |
| Chaurus Venom (Great) | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 4 |
| Chaurus Venom (Good) | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 2 |
| Spider Venom (Superlative) | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 3 |
| Spider Venom (Great) | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 2 |
| Spider Venom (Good) | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| Dyed Hawk Feathers | 3 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| Charred Hawk Beak | 1 |  |  | Cook pot |  |
| Charred Skeever Hide | 1 |  |  | Cook pot |  |
| Flare Coating | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| Potion of Hircine's Cloak (Strange Brew) | 2 |  |  | Cook pot | Brewing Skill Greater or Equal to 1 |
| Potion of Hircine's Agony (Strange Brew) | 2 |  |  | Cook pot | Brewing Skill Greater or Equal to 0 |
| Cured Skeever Hide | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| Blood of the Hunt (Strange Brew) | 1 |  |  | Cook pot | Brewing Skill Greater or Equal to 2 |
| Strange Brew | 1 |  |  | Cook pot | Forage Skill Greater or Equal to 1 |
| Soap - Superior Mountain Flower | 3 |  | Craftsmanship | Cook pot |  |
| Soap - Red Mountain Flower | 3 |  | Craftsmanship | Cook pot |  |
| Soap - Purple Mountain Flower | 3 |  | Craftsmanship | Cook pot |  |
| Soap - Plain | 3 |  | Craftsmanship | Cook pot |  |
| Soap - Lavender | 3 |  | Craftsmanship | Cook pot |  |
| Soap - Dragon's Tongue | 3 |  | Craftsmanship | Cook pot |  |
| Soap - Blue Mountain | 3 |  | Craftsmanship | Cook pot |  |
| Ink | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 1 |
| Powdered Bone Hawk Beak | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Chitin Resin | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Chitin Resin | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Powdered Shellbug Chitin | 3 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Powdered Chitin Plate | 3 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Powdered Bone Hawk Claw | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Powdered Charcoal | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Powdered Charcoal | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Powdered Canine Teeth | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 5 |
| Black Bonesap | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 5 |
| Netch Resin | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 5 |
| Falmer Resin | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Chitin Resin | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Dragon Bonemeal | 2 |  |  | Player Crafting | Forage Skill Greater or Equal to 5 |
| Antler Paste | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 5 |
| Powdered Antler | 4 |  |  | Player Crafting |  |
| Powdered Antler | 2 |  |  | Player Crafting |  |
| Powdered Antler | 3 |  |  | Player Crafting |  |
| Powdered Antler | 1 |  |  | Player Crafting |  |
| Powdered Albino Spider Pod | 5 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Powdered Chaurus Chitin | 5 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Charred Skeever Hide | 1 |  |  | Player Crafting |  |
| Charred Hawk Beak | 1 |  |  | Player Crafting |  |
| Powdered Mammoth Tusk | 1 |  |  | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 30 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Medicinal Salve | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Slaughterfish Scales | 5 |  |  | Player Crafting |  |
| Soul Tomato: Grand (Empty) | 1 |  |  | Player Crafting |  |
| Soul Tomato: Greater (Empty) | 1 |  |  | Player Crafting |  |
| Soul Tomato: Common (Empty) | 1 |  |  | Player Crafting |  |
| Soul Tomato: Lesser (Empty) | 1 |  |  | Player Crafting |  |
| Soul Tomato: Corrupted (Empty) | 1 |  |  | Player Crafting |  |
| Sapphire Glitterdust | 5 |  | Advanced Blacksmithing | Player Crafting |  |
| Sapphire Glitterdust | 3 |  | Advanced Blacksmithing | Player Crafting |  |
| Red Glitterdust | 5 |  | Advanced Blacksmithing | Player Crafting |  |
| Red Glitterdust | 4 |  | Advanced Blacksmithing | Player Crafting |  |
| Red Glitterdust | 4 |  | Advanced Blacksmithing | Player Crafting |  |
| Red Glitterdust | 4 |  | Advanced Blacksmithing | Player Crafting |  |
| Soul Gem: Black (Empty) | 1 |  | Soul Gem Mastery | Player Crafting |  |
| Soul Gem: Grand (Empty) | 1 |  | Soul Gem Mastery | Player Crafting |  |
| Soul Gem: Greater (Empty) | 1 |  | Soul Gem Mastery | Player Crafting |  |
| Soul Gem: Common (Empty) | 1 |  | Soul Gem Mastery | Player Crafting |  |
| Soul Gem: Lesser (Empty) | 2 |  | Soul Gem Mastery | Player Crafting |  |
| Soul Gem: Petty (Empty) | 4 |  | Soul Gem Mastery | Player Crafting |  |
| Soul Tomato: Petty (Empty) | 1 |  |  | Player Crafting |  |
| Healing Poultice | 1 |  | Craftsmanship,Alchemical Lore 1 | Player Crafting |  |
| Throwable Frost Powder | 3 |  | Alchemical Lore 2 | Player Crafting |  |
| Throwable Shock Powder | 3 |  | Alchemical Lore 2 | Player Crafting |  |
| Throwable Flame Powder | 3 |  | Alchemical Lore 2 | Player Crafting |  |
| Polished Boar Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 2 |
| Bonesap | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Bone Meal | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 1 |
| Polished Dragon Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 5 |
| Polished Troll Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 4 |
| Polished Werewolf Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Boiled Skeever Tail | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 1 |
| Polished Wolf Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 2 |
| Polished Sabre Cat Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 2 |
| Polished Mammoth Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 4 |
| Polished Hare Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 1 |
| Polished Fox Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 1 |
| Polished Bear Eye | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 3 |
| Polished Slaughterfish Scales | 1 |  |  | Player Crafting | Forage Skill Greater or Equal to 1 |
| Powdered Mudcrab Chitin | 2 |  |  | Player Crafting | Forage Skill Greater or Equal to 1 |
</div>

---

## Alchemy Ingredients & Effects

For a comprehensive list of collected alchemy ingredients and their effects, see [Alchemy Effects by Ingredient](https://wiki.wildlandermod.com/12Cheat-Sheets/Alchemy-Effects-by-Ingredient/) in the Cheat Sheets section.


