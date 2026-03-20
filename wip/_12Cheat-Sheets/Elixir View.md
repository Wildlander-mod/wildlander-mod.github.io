---
title: Elixir View
layout: default
nav_order: 2
parent: Spell Research Cheat Sheet
description: Complete interactive reference for elixir recipes and effects
---

Craft powerful elixirs by mixing solutions at a glass alembic. Search by elixir name or filter by effect to find the exact recipe you need.

---

## How to Use This Page

**Search** - Find specific elixirs by name or required solutions (ingredients)
**Filter by Effect** - View all elixirs that produce a specific effect
**Full Reference** - Complete list of all 341+ elixir recipes with magnitude and duration

Use the search box below to find recipes by elixir name or ingredient requirements.

---

<style>
#elixir-view-tooltip {
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

#elixir-view-tooltip div {
  margin: 4px 0;
}

#elixir-view-tooltip strong {
  color: #f77ef1;
}

.elixir-view-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  setTimeout(initElixirViewPage, 300);
});

function initElixirViewPage() {
  const table = document.querySelector('.elixir-view-table table');
  if (!table) return;
  
  initElixirViewFilters(table);
  initElixirViewtooltips(table);
}

function initElixirViewFilters(table) {
  const effects = new Set();
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const effectCell = row.querySelector('td:nth-child(2)');
    if (effectCell) {
      const effectText = effectCell.textContent.trim();
      if (effectText) {
        effects.add(effectText);
      }
    }
  });
  
  const select = document.getElementById('elixirViewEffectFilter');
  if (select) {
    Array.from(effects).sort().forEach(effect => {
      const option = document.createElement('option');
      option.value = effect;
      option.textContent = effect;
      select.appendChild(option);
    });
    select.addEventListener('change', function() { filterElixirViewTable(table); });
  }
  
  const searchInput = document.getElementById('elixirViewSearch');
  if (searchInput) {
    searchInput.addEventListener('input', function() { filterElixirViewTable(table); });
  }
  
  const clearButton = document.getElementById('elixirViewClearFilters');
  if (clearButton) {
    clearButton.addEventListener('click', function() { clearElixirViewFilters(table); });
  }
  
  filterElixirViewTable(table);
}

function initElixirViewtooltips(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const elixirCell = row.querySelector('td:first-child');
    if (!elixirCell) return;
    
    elixirCell.style.cursor = 'pointer';
    elixirCell.style.color = '#f77ef1';
    elixirCell.style.fontWeight = '500';
    elixirCell.addEventListener('mouseenter', (e) => showElixirViewtooltip(e, row));
    elixirCell.addEventListener('mousemove', updateElixirViewtooltipPosition);
    elixirCell.addEventListener('mouseleave', hideElixirViewtooltip);
  });
}

function showElixirViewtooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const name = cells[0]?.textContent?.trim() || '';
  const effect = cells[1]?.textContent?.trim() || '';
  const solutions = cells[2]?.textContent?.trim() || '';
  
  let tooltip = document.getElementById('elixir-view-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'elixir-view-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Elixir:</strong> ' + name + '</div>' +
    '<div><strong>Effect:</strong> ' + effect + '</div>' +
    '<div><strong>Solutions:</strong> ' + solutions + '</div>';
  
  tooltip.style.display = 'block';
  updateElixirViewtooltipPosition(event);
}

function updateElixirViewtooltipPosition(event) {
  const tooltip = document.getElementById('elixir-view-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideElixirViewtooltip() {
  const tooltip = document.getElementById('elixir-view-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function filterElixirViewTable(table) {
  const searchTerm = (document.getElementById('elixirViewSearch')?.value || '').toLowerCase();
  const effectFilter = document.getElementById('elixirViewEffectFilter')?.value || '';
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const name = (cells[0]?.textContent || '').toLowerCase();
    const effect = (cells[1]?.textContent || '').toLowerCase();
    const solutions = (cells[2]?.textContent || '').toLowerCase();
    
    const searchMatch = name.includes(searchTerm) || solutions.includes(searchTerm) || effect.includes(searchTerm);
    const filterMatch = !effectFilter || cells[1]?.textContent?.trim() === effectFilter;
    
    const isVisible = searchMatch && filterMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateElixirViewFilterCount(visibleCount, rows.length);
}

function updateElixirViewFilterCount(visible, total) {
  const counter = document.getElementById('elixirViewFilterResultCount');
  if (counter) {
    counter.textContent = 'Showing ' + visible + ' of ' + total + ' elixirs';
  }
}

function clearElixirViewFilters(table) {
  const searchInput = document.getElementById('elixirViewSearch');
  const effectSelect = document.getElementById('elixirViewEffectFilter');
  
  if (searchInput) searchInput.value = '';
  if (effectSelect) effectSelect.value = '';
  
  filterElixirViewTable(table);
}
</script>

<div class="elixir-view-controls">
  <input type="text" id="elixirViewSearch" placeholder="Search by elixir name, effects, or solutions..." />
  <select id="elixirViewEffectFilter">
    <option value="">All Effects</option>
  </select>
  <button id="elixirViewClearFilters" onclick="clearElixirViewFilters()">Clear Filters</button>
  <div id="elixirViewFilterResultCount" class="filter-result-count-elixir-view"></div>
</div>

## Elixir View

<div class="elixir-view-table" markdown="1">

| Elixir Name | Effect | Required Solutions | Magnitude | Duration | Strength |
|:---|:---|:---|:---:|:---:|:---:|
| Void Salts |  | Pelleni Alchemical Solution of Life sa Baune,Alchemical Solution of Magicka Alchemical Solution of Shield sa Baune,Alchemical Solution of Shock sa Baune |  |  |  |
| Salt |  | Alchemical Solution of Water sa Goria,Alchemical Solution of Earth sa Goria |  |  |  |
| Glow Dust |  | Alchemical Solution of Arcane Energy sa Baune,Alchemical Solution of Magical Constructs sa Baune,Alchemical Solution of Magicka sa Baune,Alchemical Solution of Light sa Baune |  |  |  |
| Frost Salts |  | Pelleni Alchemical Solution of Life sa Baune,Alchemical Solution of Magicka Alchemical Solution of Shield sa Baune,Alchemical Solution of Frost sa Baune |  |  |  |
| Fire Salts |  | Pelleni Alchemical Solution of Life sa Baune,Alchemical Solution of Fire sa Baune,Alchemical Solution of Magicka Alchemical Solution of Shield sa Baune |  |  |  |
| Paper Roll I  |  | Wood,Alchemical Solution of Creatures sa Haelia |  |  |  |
| Paper Roll II |  | Wood,Alchemical Solution of Flesh sa Haelia |  |  |  |
| Paper Roll III |  | Wood,Alchemical Solution of Nature sa Haelia |  |  |  |
| Inkwell I |  | charcoal,Alchemical Solution of Nature sa Goria |  |  |  |
| Inkwell II |  | charcoal,Alchemical Solution of Creatures sa Goria |  |  |  |
| Inkwell III |  | iron ore,Alchemical Solution of Nature sa Goria |  |  |  |
| Mild Glowing Elixir | Cure Disease   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 4.00 | 0 | Mild |
| Strong Glowing Elixir | Cure Disease   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 8.00 | 0 | Strong |
| Concentrated Glowing Elixir | Cure Disease   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 32.00 | 0 | Concentrated |
| Weak Glowing Elixir | Cure Disease   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 2.00 | 0 | Weak |
| Potent Glowing Elixir | Cure Disease   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 16.00 | 0 | Potent |
| Diluted Glowing Elixir | Cure Disease   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 1.00 | 0 | Dilute |
| Strong Grainy Elixir | Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 4.00 | 0 | Strong |
| Concentrated Grainy Elixir | Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 16.00 | 0 | Concentrated |
| Potent Grainy Elixir | Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 8.00 | 0 | Potent |
| Weak Grainy Elixir | Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 1.00 | 0 | Weak |
| Mild Grainy Elixir | Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 2.00 | 0 | Mild |
| Diluted Grainy Elixir | Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 0.50 | 0 | Dilute |
| Weak Chunky Elixir | Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 1.50 | 0 | Weak |
| Strong Chunky Elixir | Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 6.00 | 0 | Strong |
| Diluted Chunky Elixir | Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 0.75 | 0 | Dilute |
| Mild Chunky Elixir | Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 3.00 | 0 | Mild |
| Potent Chunky Elixir | Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 12.00 | 0 | Potent |
| Concentrated Chunky Elixir | Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 24.00 | 0 | Concentrated |
| Dilute Elixir | Damage Magicka Regen   | Alchemical Solution of Magicka,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 1 | Dilute |
| Concentrated Elixir | Damage Magicka Regen   | Alchemical Solution of Magicka,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 40 | Concentrated |
| Potent Elixir | Damage Magicka Regen   | Alchemical Solution of Magicka,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 20 | Potent |
| Strong Elixir | Damage Magicka Regen   | Alchemical Solution of Magicka,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 10 | Strong |
| Mild Elixir | Damage Magicka Regen   | Alchemical Solution of Magicka,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 5 | Mild |
| Weak Elixir | Damage Magicka Regen   | Alchemical Solution of Magicka,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 3 | Weak |
| Weak Elixir | Damage Maximum Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Acid | 1.30 | 7 | Weak |
| Dilute Elixir | Damage Maximum Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Acid | 0.90 | 4 | Dilute |
| Mild Elixir | Damage Maximum Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Acid | 2.00 | 10 | Mild |
| Potent Elixir | Damage Maximum Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Acid | 4.50 | 23 | Potent |
| Strong Elixir | Damage Maximum Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Acid | 3.00 | 15 | Strong |
| Concentrated Elixir | Damage Maximum Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Acid | 6.75 | 34 | Concentrated |
| Dilute Elixir | Damage Maximum Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Creatures,Alchemical Solution of Acid | 0.90 | 4 | Dilute |
| Mild Elixir | Damage Maximum Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Creatures,Alchemical Solution of Acid | 2.00 | 10 | Mild |
| Potent Elixir | Damage Maximum Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Creatures,Alchemical Solution of Acid | 4.50 | 23 | Potent |
| Concentrated Elixir | Damage Maximum Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Creatures,Alchemical Solution of Acid | 6.80 | 34 | Concentrated |
| Strong Elixir | Damage Maximum Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Creatures,Alchemical Solution of Acid | 3.00 | 15 | Strong |
| Weak Elixir | Damage Maximum Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Creatures,Alchemical Solution of Acid | 1.30 | 7 | Weak |
| Strong Bitter Elixir | Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 6.00 | 0 | Strong |
| Diluted Bitter Elixir | Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 0.80 | 0 | Dilute |
| Weak Bitter Elixir | Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 1.50 | 0 | Weak |
| Concentrated Bitter Elixir | Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 24.00 | 0 | Concentrated |
| Potent Bitter Elixir | Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 12.00 | 0 | Potent |
| Mild Bitter Elixir | Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Poisons,Alchemical Solution of Creatures | 3.00 | 0 | Mild |
| Strong Elixir | Damage Stamina Regen   | Alchemical Solution of Stamina,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 10 | Strong |
| Concentrated Elixir | Damage Stamina Regen   | Alchemical Solution of Stamina,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 40 | Concentrated |
| Potent Elixir | Damage Stamina Regen   | Alchemical Solution of Stamina,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 20 | Potent |
| Weak Elixir | Damage Stamina Regen   | Alchemical Solution of Stamina,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 3 | Weak |
| Dilute Elixir | Damage Stamina Regen   | Alchemical Solution of Stamina,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 1 | Dilute |
| Mild Elixir | Damage Stamina Regen   | Alchemical Solution of Stamina,Pellenni Alchemical Solution of Life,Alchemical Solution of Creatures | 100.00 | 5 | Mild |
| Mild Cold Elixir | Fear  | Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 1.00 | 30 | Mild |
| Potent Cold Elixir | Fear  | Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 2.30 | 68 | Potent |
| Strong Cold Elixir | Fear  | Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 1.50 | 30 | Strong |
| Weak Cold Elixir | Fear  | Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 0.70 | 20 | Weak |
| Diluted Cold Elixir | Fear  | Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 0.40 | 13 | Dilute |
| Concentrated Cold Elixir | Fear  | Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Life | 3.40 | 68 | Concentrated |
| Concentrated Sticky Elixir | Fortify Alteration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 13.50 | 203 | Concentrated |
| Diluted Sticky Elixir | Fortify Alteration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 1.80 | 27 | Dilute |
| Mild Sticky Elixir | Fortify Alteration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 4.00 | 60 | Mild |
| Potent Sticky Elixir | Fortify Alteration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 9.00 | 135 | Potent |
| Strong Sticky Elixir | Fortify Alteration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 6.00 | 90 | Strong |
| Weak Sticky Elixir | Fortify Alteration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 2.70 | 40 | Weak |
| Dilute Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 0.90 | 27 | Dilute |
| Weak Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 1.30 | 40 | Weak |
| Strong Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 3.00 | 90 | Strong |
| Mild Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 2.00 | 60 | Mild |
| Potent Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 4.50 | 135 | Potent |
| Concentrated Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 6.80 | 203 | Concentrated |
| Dilute Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 0.90 | 27 | Dilute |
| Mild Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 2.00 | 60 | Mild |
| Potent Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 4.50 | 135 | Potent |
| Weak Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 1.30 | 40 | Weak |
| Concentrated Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 6.80 | 203 | Concentrated |
| Strong Elixir | Fortify Armor   | Mer Alchemical Solution of Life,Alchemical Solution of Armor,Alchemical Solution of Flesh | 3.00 | 90 | Strong |
| Diluted Shimmering Elixir | Fortify Barter   | Alchemical Solution of Life,Alchemical Solution of Air,Mer Alchemical Solution of Life | 0.40 | 13 | Dilute |
| Concentrated Shimmering Elixir | Fortify Barter   | Alchemical Solution of Life,Alchemical Solution of Air,Mer Alchemical Solution of Life | 3.40 | 101 | Concentrated |
| Strong Shimmering Elixir | Fortify Barter   | Alchemical Solution of Life,Alchemical Solution of Air,Mer Alchemical Solution of Life | 1.50 | 45 | Strong |
| Potent Shimmering Elixir | Fortify Barter   | Alchemical Solution of Life,Alchemical Solution of Air,Mer Alchemical Solution of Life | 2.30 | 68 | Potent |
| Mild Shimmering Elixir | Fortify Barter   | Alchemical Solution of Life,Alchemical Solution of Air,Mer Alchemical Solution of Life | 1.00 | 30 | Mild |
| Weak Shimmering Elixir | Fortify Barter   | Alchemical Solution of Life,Alchemical Solution of Air,Mer Alchemical Solution of Life | 0.70 | 20 | Weak |
| Strong Smoky Elixir | Fortify Block   | Mer Alchemical Solution of Life,Alchemical Solution of Shield,Alchemical Solution of Flesh | 6.00 | 90 | Strong |
| Weak Smoky Elixir | Fortify Block   | Mer Alchemical Solution of Life,Alchemical Solution of Shield,Alchemical Solution of Flesh | 2.70 | 40 | Weak |
| Concentrated Smoky Elixir | Fortify Block   | Mer Alchemical Solution of Life,Alchemical Solution of Shield,Alchemical Solution of Flesh | 13.50 | 203 | Concentrated |
| Potent Smoky Elixir | Fortify Block   | Mer Alchemical Solution of Life,Alchemical Solution of Shield,Alchemical Solution of Flesh | 9.00 | 135 | Potent |
| Diluted Smoky Elixir | Fortify Block   | Mer Alchemical Solution of Life,Alchemical Solution of Shield,Alchemical Solution of Flesh | 1.80 | 27 | Dilute |
| Mild Smoky Elixir | Fortify Block   | Mer Alchemical Solution of Life,Alchemical Solution of Shield,Alchemical Solution of Flesh | 4.00 | 60 | Mild |
| Strong Weighty Elixir | Fortify Carry Weight   | Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Flesh | 6.00 | 450 | Strong |
| Potent Weighty Elixir | Fortify Carry Weight   | Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Flesh | 9.00 | 675 | Potent |
| Mild Weighty Elixir | Fortify Carry Weight   | Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Flesh | 4.00 | 300 | Mild |
| Weak Weighty Elixir | Fortify Carry Weight   | Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Flesh | 2.70 | 200 | Weak |
| Diluted Weighty Elixir | Fortify Carry Weight   | Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Flesh | 1.80 | 133 | Dilute |
| Concentrated Weighty Elixir | Fortify Carry Weight   | Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Flesh | 13.50 | 1013 | Concentrated |
| Potent Ghostly Elixir | Fortify Conjuration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 11.30 | 135 | Potent |
| Weak Ghostly Elixir | Fortify Conjuration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 3.30 | 40 | Weak |
| Strong Ghostly Elixir | Fortify Conjuration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 7.50 | 90 | Strong |
| Diluted Ghostly Elixir | Fortify Conjuration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 2.20 | 27 | Dilute |
| Mild Ghostly Elixir | Fortify Conjuration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 5.00 | 60 | Mild |
| Concentrated Ghostly Elixir | Fortify Conjuration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 16.90 | 203 | Concentrated |
| Diluted Sparking Elixir | Fortify Destruction   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 2.20 | 27 | Dilute |
| Mild Sparking Elixir | Fortify Destruction   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 5.00 | 60 | Mild |
| Concentrated Sparking Elixir | Fortify Destruction   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 16.90 | 203 | Concentrated |
| Weak Sparking Elixir | Fortify Destruction   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 3.30 | 40 | Weak |
| Strong Sparking Elixir | Fortify Destruction   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 7.50 | 90 | Strong |
| Potent Sparking Elixir | Fortify Destruction   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 11.30 | 135 | Potent |
| Potent Glossy Elixir | Fortify Enchanting   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Armor | 2.30 | 68 | Potent |
| Weak Glossy Elixir | Fortify Enchanting   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Armor | 0.70 | 20 | Weak |
| Diluted Glossy Elixir | Fortify Enchanting   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Armor | 0.40 | 13 | Dilute |
| Strong Glossy Elixir | Fortify Enchanting   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Armor | 1.50 | 45 | Strong |
| Mild Glossy Elixir | Fortify Enchanting   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Armor | 1.00 | 30 | Mild |
| Concentrated Glossy Elixir | Fortify Enchanting   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Armor | 3.40 | 101 | Concentrated |
| Weak Metallic Elixir | Fortify Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 2.70 | 40 | Weak |
| Strong Metallic Elixir | Fortify Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 6.00 | 90 | Strong |
| Mild Metallic Elixir | Fortify Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 4.00 | 60 | Mild |
| Potent Metallic Elixir | Fortify Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 9.00 | 135 | Potent |
| Diluted Metallic Elixir | Fortify Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 1.80 | 27 | Dilute |
| Concentrated Metallic Elixir | Fortify Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 13.50 | 203 | Concentrated |
| Diluted Shiny Elixir | Fortify Illusion   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 1.80 | 27 | Dilute |
| Potent Shiny Elixir | Fortify Illusion   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 9.00 | 135 | Potent |
| Concentrated Shiny Elixir | Fortify Illusion   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 13.50 | 203 | Concentrated |
| Weak Shiny Elixir | Fortify Illusion   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 2.70 | 40 | Weak |
| Strong Shiny Elixir | Fortify Illusion   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 6.00 | 90 | Strong |
| Mild Shiny Elixir | Fortify Illusion   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 4.00 | 60 | Mild |
| Concentrated Glinting Elixir | Fortify Lockpicking   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 6.80 | 101 | Concentrated |
| Strong Glinting Elixir | Fortify Lockpicking   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 3.00 | 45 | Strong |
| Weak Glinting Elixir | Fortify Lockpicking   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 1.30 | 20 | Weak |
| Mild Glinting Elixir | Fortify Lockpicking   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 2.00 | 30 | Mild |
| Diluted Glinting Elixir | Fortify Lockpicking   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 0.90 | 13 | Dilute |
| Potent Glinting Elixir | Fortify Lockpicking   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 4.50 | 68 | Potent |
| Mild Rubbery Elixir | Fortify Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 4.00 | 60 | Mild |
| Strong Rubbery Elixir | Fortify Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 6.00 | 90 | Strong |
| Weak Rubbery Elixir | Fortify Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 2.70 | 40 | Weak |
| Potent Rubbery Elixir | Fortify Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 9.00 | 135 | Potent |
| Diluted Rubbery Elixir | Fortify Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 1.80 | 27 | Dilute |
| Concentrated Rubbery Elixir | Fortify Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 13.50 | 203 | Concentrated |
| Mild Hazy Elixir | Fortify Marksman   | Alchemical Solution of Flesh,Alchemical Solution of Weapons,Mer Alchemical Solution of Life | 4.00 | 60 | Mild |
| Strong Hazy Elixir | Fortify Marksman   | Alchemical Solution of Flesh,Alchemical Solution of Weapons,Mer Alchemical Solution of Life | 6.00 | 90 | Strong |
| Potent Hazy Elixir | Fortify Marksman   | Alchemical Solution of Flesh,Alchemical Solution of Weapons,Mer Alchemical Solution of Life | 9.00 | 135 | Potent |
| Weak Hazy Elixir | Fortify Marksman   | Alchemical Solution of Flesh,Alchemical Solution of Weapons,Mer Alchemical Solution of Life | 2.70 | 40 | Weak |
| Concentrated Hazy Elixir | Fortify Marksman   | Alchemical Solution of Flesh,Alchemical Solution of Weapons,Mer Alchemical Solution of Life | 13.50 | 203 | Concentrated |
| Diluted Hazy Elixir | Fortify Marksman   | Alchemical Solution of Flesh,Alchemical Solution of Weapons,Mer Alchemical Solution of Life | 1.80 | 27 | Dilute |
| Potent Elixir | Fortify One-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 9.00 | 135 | Potent |
| Strong Elixir | Fortify One-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 6.00 | 90 | Strong |
| Mild Elixir | Fortify One-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 4.00 | 60 | Mild |
| Dilute Elixir | Fortify One-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 1.80 | 27 | Dilute |
| Concentrated Elixir | Fortify One-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 13.50 | 203 | Concentrated |
| Weak Elixir | Fortify One-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 2.70 | 40 | Weak |
| Diluted Gleaming Elixir | Fortify Pickpocket   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 1.80 | 27 | Dilute |
| Concentrated Gleaming Elixir | Fortify Pickpocket   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 13.50 | 203 | Concentrated |
| Potent Gleaming Elixir | Fortify Pickpocket   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 9.00 | 135 | Potent |
| Mild Gleaming Elixir | Fortify Pickpocket   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 4.00 | 60 | Mild |
| Weak Gleaming Elixir | Fortify Pickpocket   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 2.70 | 40 | Weak |
| Strong Gleaming Elixir | Fortify Pickpocket   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 6.00 | 90 | Strong |
| Weak Silver Elixir | Fortify Restoration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 2.70 | 40 | Weak |
| Mild Silver Elixir | Fortify Restoration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 4.00 | 60 | Mild |
| Diluted Silver Elixir | Fortify Restoration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 1.80 | 27 | Dilute |
| Concentrated Silver Elixir | Fortify Restoration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 13.50 | 203 | Concentrated |
| Strong Silver Elixir | Fortify Restoration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 6.00 | 90 | Strong |
| Potent Silver Elixir | Fortify Restoration   | Mer Alchemical Solution of Life,Alchemical Solution of Arcane Energy,Alchemical Solution of Magicka | 9.00 | 135 | Potent |
| Concentrated Molten Elixir | Fortify Smithing   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 13.50 | 101 | Concentrated |
| Diluted Molten Elixir | Fortify Smithing   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 1.80 | 13 | Dilute |
| Strong Molten Elixir | Fortify Smithing   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 6.00 | 45 | Strong |
| Weak Molten Elixir | Fortify Smithing   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 2.70 | 20 | Weak |
| Potent Molten Elixir | Fortify Smithing   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 9.00 | 68 | Potent |
| Mild Molten Elixir | Fortify Smithing   | Alchemical Solution of Flesh,Alchemical Solution of Metal,Mer Alchemical Solution of Life | 4.00 | 30 | Mild |
| Potent Reflective Elixir | Fortify Sneak   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 9.00 | 135 | Potent |
| Concentrated Reflective Elixir | Fortify Sneak   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 13.50 | 203 | Concentrated |
| Weak Reflective Elixir | Fortify Sneak   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 2.70 | 40 | Weak |
| Strong Reflective Elixir | Fortify Sneak   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 6.00 | 90 | Strong |
| Diluted Reflective Elixir | Fortify Sneak   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 1.80 | 27 | Dilute |
| Mild Reflective Elixir | Fortify Sneak   | Alchemical Solution of Flesh,Alchemical Solution of Air,Mer Alchemical Solution of Life | 4.00 | 60 | Mild |
| Diluted Spicy Elixir | Fortify Stamina   | Alchemical Solution of Nature,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 1.80 | 27 | Dilute |
| Concentrated Spicy Elixir | Fortify Stamina   | Alchemical Solution of Nature,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 13.50 | 203 | Concentrated |
| Weak Spicy Elixir | Fortify Stamina   | Alchemical Solution of Nature,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 2.70 | 40 | Weak |
| Potent Spicy Elixir | Fortify Stamina   | Alchemical Solution of Nature,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 9.00 | 135 | Potent |
| Mild Spicy Elixir | Fortify Stamina   | Alchemical Solution of Nature,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 4.00 | 60 | Mild |
| Strong Spicy Elixir | Fortify Stamina   | Alchemical Solution of Nature,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 6.00 | 90 | Strong |
| Potent Elixir | Fortify Two-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 9.00 | 135 | Potent |
| Strong Elixir | Fortify Two-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 6.00 | 90 | Strong |
| Mild Elixir | Fortify Two-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 4.00 | 60 | Mild |
| Dilute Elixir | Fortify Two-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 1.80 | 27 | Dilute |
| Weak Elixir | Fortify Two-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 2.70 | 40 | Weak |
| Concentrated Elixir | Fortify Two-handed   | Mer Alchemical Solution of Life,Alchemical Solution of Weapons,Alchemical Solution of Flesh | 13.50 | 203 | Concentrated |
| Strong Glittery Elixir | Frenzy  | Alchemical Solution of Creatures,Alchemical Solution of Poisons,Alchemical Solution of Life | 1.50 | 15 | Strong |
| Diluted Glittery Elixir | Frenzy  | Alchemical Solution of Creatures,Alchemical Solution of Poisons,Alchemical Solution of Life | 0.40 | 4 | Dilute |
| Mild Glittery Elixir | Frenzy  | Alchemical Solution of Creatures,Alchemical Solution of Poisons,Alchemical Solution of Life | 1.00 | 10 | Mild |
| Potent Glittery Elixir | Frenzy  | Alchemical Solution of Creatures,Alchemical Solution of Poisons,Alchemical Solution of Life | 2.30 | 23 | Potent |
| Concentrated Glittery Elixir | Frenzy  | Alchemical Solution of Creatures,Alchemical Solution of Poisons,Alchemical Solution of Life | 3.40 | 34 | Concentrated |
| Weak Glittery Elixir | Frenzy  | Alchemical Solution of Creatures,Alchemical Solution of Poisons,Alchemical Solution of Life | 0.70 | 7 | Weak |
| Concentrated Colorless Elixir | Invisibility  | Alchemical Solution of Flesh,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Light | 0.00 | 32 | Concentrated |
| Weak Colorless Elixir | Invisibility  | Alchemical Solution of Flesh,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Light | 0.00 | 2 | Weak |
| Diluted Colorless Elixir | Invisibility  | Alchemical Solution of Flesh,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Light | 0.00 | 1 | Dilute |
| Strong Colorless Elixir | Invisibility  | Alchemical Solution of Flesh,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Light | 0.00 | 8 | Strong |
| Potent Colorless Elixir | Invisibility  | Alchemical Solution of Flesh,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Light | 0.00 | 16 | Potent |
| Mild Colorless Elixir | Invisibility  | Alchemical Solution of Flesh,Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Light | 0.00 | 4 | Mild |
| Dilute Elixir | Lingering Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet | 0.40 | 4 | Dilute |
| Concentrated Elixir | Lingering Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet | 3.40 | 34 | Concentrated |
| Potent Elixir | Lingering Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet | 2.25 | 23 | Potent |
| Strong Elixir | Lingering Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet | 1.50 | 15 | Strong |
| Mild Elixir | Lingering Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet | 1.00 | 10 | Mild |
| Weak Elixir | Lingering Damage Health   | Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Creatures,Alchemical Solution of Weapons ry Bet | 0.70 | 7 | Weak |
| Mild Elixir | Lingering Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 1.00 | 10 | Mild |
| Concentrated Elixir | Lingering Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 3.40 | 34 | Concentrated |
| Dilute Elixir | Lingering Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 0.40 | 4 | Dilute |
| Strong Elixir | Lingering Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 1.50 | 15 | Strong |
| Potent Elixir | Lingering Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 2.25 | 23 | Potent |
| Weak Elixir | Lingering Damage Magicka   | Alchemical Solution of Magicka,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 0.70 | 7 | Weak |
| Weak Elixir | Lingering Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 0.70 | 7 | Weak |
| Potent Elixir | Lingering Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 2.25 | 23 | Potent |
| Concentrated Elixir | Lingering Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 3.40 | 34 | Concentrated |
| Strong Elixir | Lingering Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 1.50 | 15 | Strong |
| Mild Elixir | Lingering Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 1.00 | 10 | Mild |
| Dilute Elixir | Lingering Damage Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Weapons ry Bet,Alchemical Solution of Creatures | 0.40 | 4 | Dilute |
| Mild Numbing Elixir | Paralysis  | Alchemical Solution of Flesh,Alchemical Solution of Poisons,Alchemical Solution of Arcane Energy | 0.00 | 4 | Mild |
| Potent Numbing Elixir | Paralysis  | Alchemical Solution of Flesh,Alchemical Solution of Poisons,Alchemical Solution of Arcane Energy | 0.00 | 16 | Potent |
| Weak Numbing Elixir | Paralysis  | Alchemical Solution of Flesh,Alchemical Solution of Poisons,Alchemical Solution of Arcane Energy | 0.00 | 2 | Weak |
| Concentrated Numbing Elixir | Paralysis  | Alchemical Solution of Flesh,Alchemical Solution of Poisons,Alchemical Solution of Arcane Energy | 0.00 | 32 | Concentrated |
| Diluted Numbing Elixir | Paralysis  | Alchemical Solution of Flesh,Alchemical Solution of Poisons,Alchemical Solution of Arcane Energy | 0.00 | 1 | Dilute |
| Strong Numbing Elixir | Paralysis  | Alchemical Solution of Flesh,Alchemical Solution of Poisons,Alchemical Solution of Arcane Energy | 0.00 | 8 | Strong |
| Concentrated Elixir | Damage Maxiumum Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Creatures,Alchemical Solution of Acid | 6.80 | 34 | Concentrated |
| Mild Elixir | Damage Maxiumum Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Creatures,Alchemical Solution of Acid | 2.00 | 10 | Mild |
| Weak Elixir | Damage Maxiumum Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Creatures,Alchemical Solution of Acid | 1.30 | 7 | Weak |
| Dilute Elixir | Damage Maxiumum Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Creatures,Alchemical Solution of Acid | 0.90 | 4 | Dilute |
| Strong Elixir | Damage Maxiumum Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Creatures,Alchemical Solution of Acid | 3.00 | 15 | Strong |
| Potent Elixir | Damage Maxiumum Stamina   | Alchemical Solution of Stamina,Alchemical Solution of Creatures,Alchemical Solution of Acid | 4.50 | 23 | Potent |
| Dilute Elixir | Regenerate Health   | Alchemical Solution of Flesh,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 2.20 | 133 | Dilute |
| Strong Elixir | Regenerate Health   | Alchemical Solution of Flesh,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 7.50 | 450 | Strong |
| Mild Elixir | Regenerate Health   | Alchemical Solution of Flesh,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 5.00 | 300 | Mild |
| Weak Elixir | Regenerate Health   | Alchemical Solution of Flesh,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 3.30 | 200 | Weak |
| Concentrated Elixir | Regenerate Health   | Alchemical Solution of Flesh,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 16.90 | 1013 | Concentrated |
| Potent Elixir | Regenerate Health   | Alchemical Solution of Flesh,Alchemical Solution of Armor ry Alchemical Solution of Life,Alchemical Solution of Magicka Alchemical Solution of Shield | 11.30 | 675 | Potent |
| Dilute Elixir | Regenerate Magicka   | Alchemical Solution of Flesh,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 2.20 | 133 | Dilute |
| Strong Elixir | Regenerate Magicka   | Alchemical Solution of Flesh,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 7.50 | 450 | Strong |
| Potent Elixir | Regenerate Magicka   | Alchemical Solution of Flesh,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 11.30 | 675 | Potent |
| Weak Elixir | Regenerate Magicka   | Alchemical Solution of Flesh,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 3.30 | 200 | Weak |
| Concentrated Elixir | Regenerate Magicka   | Alchemical Solution of Flesh,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 16.90 | 1013 | Concentrated |
| Mild Elixir | Regenerate Magicka   | Alchemical Solution of Flesh,Alchemical Solution of Magicka,Alchemical Solution of Magicka Alchemical Solution of Shield | 5.00 | 300 | Mild |
| Weak Elixir | Regenerate Stamina   | Alchemical Solution of Flesh,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 3.30 | 200 | Weak |
| Strong Elixir | Regenerate Stamina   | Alchemical Solution of Flesh,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 7.50 | 450 | Strong |
| Mild Elixir | Regenerate Stamina   | Alchemical Solution of Flesh,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 5.00 | 300 | Mild |
| Dilute Elixir | Regenerate Stamina   | Alchemical Solution of Flesh,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 2.20 | 133 | Dilute |
| Potent Elixir | Regenerate Stamina   | Alchemical Solution of Flesh,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 11.30 | 675 | Potent |
| Concentrated Elixir | Regenerate Stamina   | Alchemical Solution of Flesh,Alchemical Solution of Stamina,Alchemical Solution of Magicka Alchemical Solution of Shield | 16.90 | 1013 | Concentrated |
| Mild Blue Elixir | Resist Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Magicka Alchemical Solution of Shield | 3.00 | 60 | Mild |
| Potent Blue Elixir | Resist Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Magicka Alchemical Solution of Shield | 6.80 | 135 | Potent |
| Diluted Blue Elixir | Resist Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Magicka Alchemical Solution of Shield | 1.30 | 27 | Dilute |
| Concentrated Blue Elixir | Resist Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Magicka Alchemical Solution of Shield | 10.10 | 203 | Concentrated |
| Weak Blue Elixir | Resist Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Magicka Alchemical Solution of Shield | 2.00 | 40 | Weak |
| Strong Blue Elixir | Resist Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Magicka Alchemical Solution of Shield | 4.50 | 90 | Strong |
| Mild Crimson Elixir | Resist Frost   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Frost,Alchemical Solution of Flesh | 3.00 | 60 | Mild |
| Strong Crimson Elixir | Resist Frost   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Frost,Alchemical Solution of Flesh | 4.50 | 90 | Strong |
| Potent Crimson Elixir | Resist Frost   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Frost,Alchemical Solution of Flesh | 6.80 | 135 | Potent |
| Diluted Crimson Elixir | Resist Frost   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Frost,Alchemical Solution of Flesh | 1.30 | 27 | Dilute |
| Weak Crimson Elixir | Resist Frost   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Frost,Alchemical Solution of Flesh | 2.00 | 40 | Weak |
| Concentrated Crimson Elixir | Resist Frost   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Frost,Alchemical Solution of Flesh | 10.10 | 203 | Concentrated |
| Diluted White Elixir | Resist Magic   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 0.40 | 27 | Dilute |
| Strong White Elixir | Resist Magic   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 1.50 | 90 | Strong |
| Potent White Elixir | Resist Magic   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 2.30 | 135 | Potent |
| Mild White Elixir | Resist Magic   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 1.00 | 60 | Mild |
| Weak White Elixir | Resist Magic   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 0.70 | 40 | Weak |
| Concentrated White Elixir | Resist Magic   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 3.40 | 203 | Concentrated |
| Diluted Green Elixir | Resist Poison   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 1.80 | 27 | Dilute |
| Potent Green Elixir | Resist Poison   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 9.00 | 135 | Potent |
| Mild Green Elixir | Resist Poison   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 4.00 | 60 | Mild |
| Weak Green Elixir | Resist Poison   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 2.70 | 40 | Weak |
| Concentrated Green Elixir | Resist Poison   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 13.50 | 203 | Concentrated |
| Strong Green Elixir | Resist Poison   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 6.00 | 90 | Strong |
| Diluted Grey Elixir | Resist Shock   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Shock,Alchemical Solution of Flesh | 1.30 | 27 | Dilute |
| Weak Grey Elixir | Resist Shock   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Shock,Alchemical Solution of Flesh | 2.00 | 40 | Weak |
| Mild Grey Elixir | Resist Shock   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Shock,Alchemical Solution of Flesh | 3.00 | 60 | Mild |
| Potent Grey Elixir | Resist Shock   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Shock,Alchemical Solution of Flesh | 6.80 | 135 | Potent |
| Concentrated Grey Elixir | Resist Shock   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Shock,Alchemical Solution of Flesh | 10.10 | 203 | Concentrated |
| Strong Grey Elixir | Resist Shock   | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Shock,Alchemical Solution of Flesh | 4.50 | 90 | Strong |
| Diluted Sweet Elixir | Restore Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Ayammi | 1.30 | 0 | Dilute |
| Mild Sweet Elixir | Restore Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Ayammi | 5.00 | 0 | Mild |
| Strong Sweet Elixir | Restore Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Ayammi | 10.00 | 0 | Strong |
| Potent Sweet Elixir | Restore Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Ayammi | 20.00 | 0 | Potent |
| Concentrated Sweet Elixir | Restore Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Ayammi | 40.00 | 0 | Concentrated |
| Weak Sweet Elixir | Restore Health   | Alchemical Solution of Nature,Alchemical Solution of Armor ry Alchemical Solution of Life,Ayammi | 2.50 | 0 | Weak |
| Concentrated Fruity Elixir | Restore Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 40.00 | 0 | Concentrated |
| Weak Fruity Elixir | Restore Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 2.50 | 0 | Weak |
| Mild Fruity Elixir | Restore Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 5.00 | 0 | Mild |
| Potent Fruity Elixir | Restore Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 20.00 | 0 | Potent |
| Diluted Fruity Elixir | Restore Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 1.30 | 0 | Dilute |
| Strong Fruity Elixir | Restore Magicka   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 10.00 | 0 | Strong |
| Concentrated Salty Elixir | Restore Stamina   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 40.00 | 0 | Concentrated |
| Strong Salty Elixir | Restore Stamina   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 10.00 | 0 | Strong |
| Mild Salty Elixir | Restore Stamina   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 5.00 | 0 | Mild |
| Potent Salty Elixir | Restore Stamina   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 20.00 | 0 | Potent |
| Weak Salty Elixir | Restore Stamina   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 2.50 | 0 | Weak |
| Diluted Salty Elixir | Restore Stamina   | Alchemical Solution of Nature,Alchemical Solution of Magicka,Alchemical Solution of Life | 1.30 | 0 | Dilute |
| Concentrated Elixir | Tardiness | Alchemical Solution of Flesh,Alchemical Solution of Armor Kogo,Alchemical Solution of Creatures | 50.00 | 40 | Concentrated |
| Dilute Elixir | Tardiness | Alchemical Solution of Flesh,Alchemical Solution of Armor Kogo,Alchemical Solution of Creatures | 50.00 | 1 | Dilute |
| Weak Elixir | Tardiness | Alchemical Solution of Flesh,Alchemical Solution of Armor Kogo,Alchemical Solution of Creatures | 50.00 | 3 | Weak |
| Potent Elixir | Tardiness | Alchemical Solution of Flesh,Alchemical Solution of Armor Kogo,Alchemical Solution of Creatures | 50.00 | 20 | Potent |
| Mild Elixir | Tardiness | Alchemical Solution of Flesh,Alchemical Solution of Armor Kogo,Alchemical Solution of Creatures | 50.00 | 2 | Mild |
| Strong Elixir | Tardiness | Alchemical Solution of Flesh,Alchemical Solution of Armor Kogo,Alchemical Solution of Creatures | 50.00 | 10 | Strong |
| Diluted Sapphire Elixir | Waterbreathing  | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Water,Alchemical Solution of Flesh | 0.00 | 1 | Dilute |
| Concentrated Sapphire Elixir | Waterbreathing  | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Water,Alchemical Solution of Flesh | 0.00 | 40 | Concentrated |
| Mild Sapphire Elixir | Waterbreathing  | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Water,Alchemical Solution of Flesh | 0.00 | 5 | Mild |
| Weak Sapphire Elixir | Waterbreathing  | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Water,Alchemical Solution of Flesh | 0.00 | 2 | Weak |
| Strong Sapphire Elixir | Waterbreathing  | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Water,Alchemical Solution of Flesh | 0.00 | 10 | Strong |
| Potent Sapphire Elixir | Waterbreathing  | Alchemical Solution of Magicka Alchemical Solution of Shield,Alchemical Solution of Water,Alchemical Solution of Flesh | 0.00 | 20 | Potent |
| Weak Elixir | Weakness to Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Weapons ry Bet | 2.00 | 20 | Weak |
| Mild Elixir | Weakness to Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Weapons ry Bet | 3.00 | 30 | Mild |
| Potent Elixir | Weakness to Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Weapons ry Bet | 6.80 | 68 | Potent |
| Concentrated Elixir | Weakness to Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Weapons ry Bet | 10.10 | 101 | Concentrated |
| Dilute Elixir | Weakness to Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Weapons ry Bet | 1.30 | 13 | Dilute |
| Strong Elixir | Weakness to Fire   | Alchemical Solution of Flesh,Alchemical Solution of Fire,Alchemical Solution of Weapons ry Bet | 4.50 | 45 | Strong |
| Concentrated Elixir | Weakness to Frost   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Frost,Alchemical Solution of Flesh | 10.10 | 101 | Concentrated |
| Dilute Elixir | Weakness to Frost   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Frost,Alchemical Solution of Flesh | 1.30 | 13 | Dilute |
| Weak Elixir | Weakness to Frost   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Frost,Alchemical Solution of Flesh | 2.00 | 20 | Weak |
| Strong Elixir | Weakness to Frost   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Frost,Alchemical Solution of Flesh | 4.50 | 45 | Strong |
| Mild Elixir | Weakness to Frost   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Frost,Alchemical Solution of Flesh | 3.00 | 30 | Mild |
| Potent Elixir | Weakness to Frost   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Frost,Alchemical Solution of Flesh | 6.80 | 68 | Potent |
| Mild Elixir | Weakness to Magic   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 2.00 | 30 | Mild |
| Concentrated Elixir | Weakness to Magic   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 6.80 | 101 | Concentrated |
| Weak Elixir | Weakness to Magic   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 1.30 | 20 | Weak |
| Potent Elixir | Weakness to Magic   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 4.50 | 68 | Potent |
| Dilute Elixir | Weakness to Magic   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 0.90 | 13 | Dilute |
| Strong Elixir | Weakness to Magic   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Arcane Energy,Alchemical Solution of Flesh | 3.00 | 45 | Strong |
| Potent Elixir | Weakness to Poison   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 4.50 | 68 | Potent |
| Dilute Elixir | Weakness to Poison   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 0.90 | 13 | Dilute |
| Mild Elixir | Weakness to Poison   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 2.00 | 30 | Mild |
| Concentrated Elixir | Weakness to Poison   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 6.80 | 101 | Concentrated |
| Strong Elixir | Weakness to Poison   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 3.00 | 45 | Strong |
| Weak Elixir | Weakness to Poison   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Poisons,Alchemical Solution of Flesh | 1.30 | 20 | Weak |
| Dilute Elixir | Weakness to Shock   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Shock,Alchemical Solution of Flesh | 1.30 | 13 | Dilute |
| Potent Elixir | Weakness to Shock   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Shock,Alchemical Solution of Flesh | 6.80 | 68 | Potent |
| Mild Elixir | Weakness to Shock   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Shock,Alchemical Solution of Flesh | 3.00 | 30 | Mild |
| Strong Elixir | Weakness to Shock   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Shock,Alchemical Solution of Flesh | 4.50 | 45 | Strong |
| Concentrated Elixir | Weakness to Shock   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Shock,Alchemical Solution of Flesh | 10.10 | 101 | Concentrated |
| Weak Elixir | Weakness to Shock   | Alchemical Solution of Weapons ry Bet,Alchemical Solution of Shock,Alchemical Solution of Flesh | 2.00 | 20 | Weak |

</div>

---

## Next Steps

- **[Return to Spell Research Cheat Sheet](https://wiki.wildlandermod.com/12Cheat-Sheets/Spell-Research-Cheat-Sheet/)** - Main reference page
- **[Effect View](https://wiki.wildlandermod.com/12Cheat-Sheets/Effect View/)** - Find potion effects and their archetypes
- **[Spells View](https://wiki.wildlandermod.com/12Cheat-Sheets/Spells View/)** - Explore all crafted spells and their components
