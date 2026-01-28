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

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/_10-Crafting/1.1-Crafting-System/).

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
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Qty Made:</strong> ${data.qty}</div>
    <div><strong>Components:</strong> ${data.components}</div>
    <div><strong>Perks Needed:</strong> ${data.perks}</div>
    <div><strong>Proximity:</strong> ${data.proximity}</div>
    <div><strong>Additional Requirements:</strong> ${data.additional}</div>
  `;
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
| Blood of the Hunt (Strange Brew) | 1 | 1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart |  | Cook pot | Brewing Skill Greater or Equal to 2 |
| Blood of the Hunt (Strange Brew) | 1 | 1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart |  | Cook pot | Brewing Skill Greater or Equal to 2 |
| Chaurus Venom (Good) | 1 | 2 Chaurus Venom (Crude) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Chaurus Venom (Good) | 1 | 2 Chaurus Venom (Crude) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Chaurus Venom (Great) | 1 | 1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 4 |
| Chaurus Venom (Great) | 1 | 1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 4 |
| Chaurus Venom (Superlative) | 1 | 1 Chaurus Eggs 1 Chaurus Venom (Great) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 6 |
| Chaurus Venom (Superlative) | 1 | 1 Chaurus Eggs 1 Chaurus Venom (Great) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 6 |
| Dragon's Blood Poison (Crude) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Dragon's Blood Poison (Crude) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Dragon's Blood Poison (Decent) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Poison (Decent) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Poison (Good) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Poison (Good) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Poison (Great) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Poison (Great) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Poison (Remarkable) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Poison (Remarkable) | 2 | 1 Wolf Eye 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Potion (Decent) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Potion (Decent) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Dragon's Blood Potion (Good) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Potion (Good) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Dragon's Blood Potion (Great) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Potion (Great) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Dragon's Blood Potion (Remarkable) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Blood Potion (Remarkable) | 2 | 1 Luna Moth Wing 1 Werewolf's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Dragon's Elixir of Firebloom | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Firebloom | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Furious Speed | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Furious Speed | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Ghostly Passage | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Ghostly Passage | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Kyne's Peace | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Kyne's Peace | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Slowed Time | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Slowed Time | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Swiftness | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of Swiftness | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Living Circle | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Living Circle | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Shade | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Shade | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Storm | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Storm | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Unseen | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Elixir of the Unseen | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Death | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Death | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Disarming | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Disarming | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Explosive Force | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Explosive Force | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Terrible Frost | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Terrible Frost | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Torpor | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Dragon's Venom of Torpor | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Flare Coating | 1 | 3 Torchbug Thorax |  | Cook pot | Animal Harvesting Skill Greater or Equal to 1 |
| Flare Coating | 1 | 3 Torchbug Thorax |  | Cook pot | Animal Harvesting Skill Greater or Equal to 1 |
| Mild Acid | 1 | 1 Chaurus Venom (Crude) |  | Cook pot |  |
| Mild Acid | 1 | 2 Spider Venom (Crude) |  | Cook pot |  |
| Mild Acid | 1 | 5 Spider Egg |  | Cook pot |  |
| Mild Acid | 1 | 1 Chaurus Venom (Crude) |  | Cook pot |  |
| Mild Acid | 1 | 5 Spider Egg |  | Cook pot |  |
| Mild Acid | 1 | 2 Spider Venom (Crude) |  | Cook pot |  |
| Poison of Fear (Remarkable) | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Poison of Fear (Remarkable) | 2 | 1 Dragon's Blood |  | Cook pot |  |
| Potion of Arcane Metabolisis | 2 | 2 Polished Fox Eye 1 Dragon's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 3 |
| Potion of Arcane Metabolisis | 2 | 2 Polished Fox Eye 1 Dragon's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 3 |
| Potion of Boneblood | 1 | 10 Bone Meal 1 Blood of the Hunt (Strange Brew) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 1 |
| Potion of Boneblood | 1 | 10 Bone Meal 1 Blood of the Hunt (Strange Brew) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 1 |
| Potion of Hircine's Agony (Strange Brew) | 2 | 1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative) |  | Cook pot | Brewing Skill Greater or Equal to 0 |
| Potion of Hircine's Agony (Strange Brew) | 2 | 1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative) |  | Cook pot | Brewing Skill Greater or Equal to 0 |
| Potion of Hircine's Cloak (Strange Brew) | 2 | 1 Wolf Heart 2 Polished Sabre Cat Eye |  | Cook pot | Brewing Skill Greater or Equal to 1 |
| Potion of Hircine's Cloak (Strange Brew) | 2 | 1 Wolf Heart 2 Polished Sabre Cat Eye |  | Cook pot | Brewing Skill Greater or Equal to 1 |
| Spider Venom (Good) | 1 | 2 Spider Venom (Crude) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 1 |
| Spider Venom (Good) | 1 | 2 Spider Venom (Crude) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 1 |
| Spider Venom (Great) | 1 | 3 Bleeding Crown 1 Spider Venom (Good) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Spider Venom (Great) | 1 | 3 Bleeding Crown 1 Spider Venom (Good) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Spider Venom (Superlative) | 1 | 1 Spider Egg 1 Spider Venom (Great) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 3 |
| Spider Venom (Superlative) | 1 | 1 Spider Egg 1 Spider Venom (Great) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 3 |
| Strong Acid | 1 | 1 Spider Venom (Great) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 | 3 Chaurus Eggs |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 | 1 Chaurus Venom (Good) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 | 1 Spider Venom (Great) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 | 3 Chaurus Eggs |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Strong Acid | 1 | 1 Chaurus Venom (Good) |  | Cook pot | Animal Harvesting Skill Greater or Equal to 2 |
| Troll's Blood Poison (Crude) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Poison (Crude) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Poison (Decent) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Poison (Decent) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Poison (Good) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Poison (Good) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Poison (Great) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Poison (Great) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Poison (Remarkable) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Poison (Remarkable) | 2 | 1 Troll Fat 1 Troll Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Potion (Crude) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Potion (Crude) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Troll's Blood Potion (Decent) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Potion (Decent) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Troll's Blood Potion (Good) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Potion (Good) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Troll's Blood Potion (Great) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Potion (Great) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Troll's Blood Potion (Remarkable) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Troll's Blood Potion (Remarkable) | 2 | 1 Troll Blood 1 Medicinal Salve |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Poison (Crude) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Werebear's Blood Poison (Crude) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 1 |
| Werebear's Blood Poison (Decent) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Poison (Decent) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Poison (Good) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Poison (Good) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Poison (Great) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Poison (Great) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Poison (Remarkable) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Poison (Remarkable) | 2 | 1 Bear Eye 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Decent) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Potion (Decent) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 2 |
| Werebear's Blood Potion (Good) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Potion (Good) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 3 |
| Werebear's Blood Potion (Great) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Potion (Great) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Equal to 4 |
| Werebear's Blood Potion (Remarkable) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Werebear's Blood Potion (Remarkable) | 2 | 1 Luna Moth Wing 1 Werebear's Blood |  | Cook pot | Animal Harvesting Skill Greater or Equal to 5 |
| Red Glitterdust | 4 | 2 Gem: Garnet (Flawless) | Advanced Blacksmithing | Forge |  |
| Red Glitterdust | 4 | 1 Gem: Ruby | Advanced Blacksmithing | Forge |  |
| Red Glitterdust | 5 | 1 Gem: Ruby (Flawless) | Advanced Blacksmithing | Forge |  |
| Red Glitterdust | 4 | 3 Gem: Garnet | Advanced Blacksmithing | Forge |  |
| Sapphire Glitterdust | 3 | 1 Gem: Sapphire | Advanced Blacksmithing | Forge |  |
| Sapphire Glitterdust | 5 | 1 Gem: Sapphire (Flawless) | Advanced Blacksmithing | Forge |  |
| Boiled Skeever Tail | 1 | 1 Skeever Tail |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Bone Meal | 1 | 3 Fragment: Bone |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Bonesap | 1 | 1 Bone Meal 1 Spriggan Sap |  | N/A | Animal Harvesting Skill Greater or Equal to 3 |
| Charred Hawk Beak | 1 | 1 Hawk Beak |  | N/A |  |
| Charred Skeever Hide | 1 | 1 Pelt: Skeever (Poor) |  | N/A |  |
| Cured Skeever Hide | 1 | 1 Salt 1 Pelt: Skeever |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Dyed Hawk Feathers | 3 | 3 Hawk Feathers 1 Dye - Black |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Bear Eye | 1 | 1 Bear Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 3 |
| Polished Boar Eye | 1 | 1 Boar Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 2 |
| Polished Dragon Eye | 1 | 1 Dragon Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 5 |
| Polished Fox Eye | 1 | 1 Fox Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Hare Eye | 1 | 1 Hare Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Mammoth Eye | 1 | 1 Mammoth Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 4 |
| Polished Sabre Cat Eye | 1 | 1 Sabre Cat Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 2 |
| Polished Slaughterfish Scales | 1 | 1 Slaughterfish Scales |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Polished Troll Eye | 1 | 1 Troll Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 4 |
| Polished Werewolf Eye | 1 | 1 Werewolf Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 3 |
| Polished Wolf Eye | 1 | 1 Wolf Eye |  | N/A | Animal Harvesting Skill Greater or Equal to 2 |
| Powdered Mammoth Tusk | 1 | 1 Mammoth Tusk |  | N/A |  |
| Powdered Mudcrab Chitin | 2 | 1 Large Mudcrab Chitin |  | N/A | Animal Harvesting Skill Greater or Equal to 1 |
| Slaughterfish Scales | 5 | 1 Raw Slaughterfish |  | N/A |  |
| Soul Gem: Black | 1 | 1 Soul Gem: Grand 1 Human Skull | Soul Gem Mastery | N/A | Between 11pm -  Midnight, Must be Carrying Necromacers Amulet.  must have 100+ Enchanting skill |
| Soul Gem: Common | 1 | 1 Ingot: Moonstone 1 Ingot: Quicksilver | Soul Gem Mastery | N/A |  |
| Soul Gem: Grand | 1 | 3 Ingot: Moonstone 3 Ingot: Quicksilver | Soul Gem Mastery | N/A |  |
| Soul Gem: Greater | 1 | 2 Ingot: Moonstone 2 Ingot: Quicksilver | Soul Gem Mastery | N/A |  |
| Soul Gem: Lesser | 2 | 1 Ingot: Moonstone 1 Ingot: Quicksilver | Soul Gem Mastery | N/A |  |
| Soul Gem: Petty | 4 | 1 Ingot: Moonstone 1 Ingot: Quicksilver | Soul Gem Mastery | N/A |  |
| Soul Tomato: Common | 1 | 1 Soul Gem: Lesser 1 Tomato |  | N/A |  |
| Soul Tomato: Corrupted | 1 | 1 Soul Gem: Grand 1 Tomato |  | N/A |  |
| Soul Tomato: Grand | 1 | 1 Soul Gem: Greater 1 Tomato |  | N/A |  |
| Soul Tomato: Greater | 1 | 1 Soul Gem: Common 1 Tomato |  | N/A |  |
| Soul Tomato: Lesser | 1 | 1 Soul Gem: Petty 1 Tomato |  | N/A |  |
| Soul Tomato: Petty | 1 | 1 Tomato |  | N/A |  |
| Spriggan Sap | 1 | 1 Taproot |  | N/A | Animal Harvesting Skill Greater or Equal to 2 |
| Throwable Flame Powder | 3 | 1 Fire Salts 1 Dwarven Oil | Alchemical Lore 2 | N/A |  |
| Throwable Frost Powder | 3 | 1 Frost Salts 1 Dwarven Oil | Alchemical Lore 2 | N/A |  |
| Throwable Shock Powder | 3 | 1 Void Salts 1 Dwarven Oil | Alchemical Lore 2 | N/A |  |

</div>

---

## Alchemy Ingredients & Effects

For a comprehensive list of collected alchemy ingredients and their effects, see [Alchemy Effects by Ingredient](https://wiki.wildlandermod.com/Cheat-Sheets/Alchemy-Effects-by-Ingredient/) in the Cheat Sheets section.

