---
title: Effect View
layout: default
nav_order: 1
parent: Spell Research Cheat Sheet
description: Solutions from potions with specific effects
---

Shows archetypes of solutions from potions with specific effects. Search by effect name or filter by archetype.

---

## How to Use This Page

**Search** - Find specific effects or archetypes by name
**Full Reference** - Complete list of all potion effects and their corresponding solution archetypes

Use the search box below to find recipes by effect or archetype.

---

<style>
#effect-view-tooltip {
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

#effect-view-tooltip div {
  margin: 4px 0;
}

#effect-view-tooltip strong {
  color: #f77ef1;
}

.effect-view-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  setTimeout(initEffectViewPage, 300);
});

function initEffectViewPage() {
  const table = document.querySelector('.effect-view-table table');
  if (!table) return;
  
  initEffectViewFilters(table);
  initEffectViewtooltips(table);
}

function initEffectViewFilters(table) {
  const archetypes = new Set();
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const archetypeCell = row.querySelector('td:nth-child(2)');
    if (archetypeCell) {
      const archetypesText = archetypeCell.textContent.trim();
      if (archetypesText) {
        archetypesText.split(',').forEach(arch => {
          const cleaned = arch.trim();
          if (cleaned) archetypes.add(cleaned);
        });
      }
    }
  });
  
  const select = document.getElementById('effectViewArchetypeFilter');
  if (select) {
    Array.from(archetypes).sort().forEach(arch => {
      const option = document.createElement('option');
      option.value = arch;
      option.textContent = arch;
      select.appendChild(option);
    });
    select.addEventListener('change', function() { filterEffectViewTable(table); });
  }
  
  const searchInput = document.getElementById('effectViewSearch');
  if (searchInput) {
    searchInput.addEventListener('input', function() { filterEffectViewTable(table); });
  }
  
  const clearButton = document.getElementById('effectViewClearFilters');
  if (clearButton) {
    clearButton.addEventListener('click', function() { clearEffectViewFilters(table); });
  }
  
  filterEffectViewTable(table);
}

function initEffectViewtooltips(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const effectCell = row.querySelector('td:first-child');
    if (!effectCell) return;
    
    effectCell.style.cursor = 'pointer';
    effectCell.style.color = '#f77ef1';
    effectCell.style.fontWeight = '500';
    effectCell.addEventListener('mouseenter', (e) => showEffectViewtooltip(e, row));
    effectCell.addEventListener('mousemove', updateEffectViewtooltipPosition);
    effectCell.addEventListener('mouseleave', hideEffectViewtooltip);
  });
}

function showEffectViewtooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const effect = cells[0]?.textContent?.trim() || '';
  const archetypes = cells[1]?.textContent?.trim() || '';
  
  let tooltip = document.getElementById('effect-view-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'effect-view-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Effect:</strong> ' + effect + '</div>' +
    '<div><strong>Archetypes:</strong> ' + archetypes + '</div>';
  
  tooltip.style.display = 'block';
  updateEffectViewtooltipPosition(event);
}

function updateEffectViewtooltipPosition(event) {
  const tooltip = document.getElementById('effect-view-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideEffectViewtooltip() {
  const tooltip = document.getElementById('effect-view-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function filterEffectViewTable(table) {
  const searchTerm = (document.getElementById('effectViewSearch')?.value || '').toLowerCase();
  const archetypeFilter = document.getElementById('effectViewArchetypeFilter')?.value || '';
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const effect = (cells[0]?.textContent || '').toLowerCase();
    const archetypes = (cells[1]?.textContent || '').toLowerCase();
    
    const searchMatch = effect.includes(searchTerm) || archetypes.includes(searchTerm);
    const filterMatch = !archetypeFilter || archetypes.includes(archetypeFilter.toLowerCase());
    
    const isVisible = searchMatch && filterMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateEffectViewFilterCount(visibleCount, rows.length);
}

function updateEffectViewFilterCount(visible, total) {
  const counter = document.getElementById('effectViewFilterResultCount');
  if (counter) {
    counter.textContent = 'Showing ' + visible + ' of ' + total + ' effects';
  }
}

function clearEffectViewFilters(table) {
  const searchInput = document.getElementById('effectViewSearch');
  const archetypeSelect = document.getElementById('effectViewArchetypeFilter');
  
  if (searchInput) searchInput.value = '';
  if (archetypeSelect) archetypeSelect.value = '';
  
  filterEffectViewTable(table);
}
</script>

<div class="effect-view-controls">
  <input type="text" id="effectViewSearch" placeholder="Search by effect or archetype..." />
  <select id="effectViewArchetypeFilter">
    <option value="">All Archetypes</option>
  </select>
  <button id="effectViewClearFilters" onclick="clearEffectViewFilters()">Clear Filters</button>
  <div id="effectViewFilterResultCount" class="filter-result-count-effect-view"></div>
</div>

## Effect View

<div class="effect-view-table" markdown="1">

| Effect | Archetypes |
|:---|:---|
| Cleansing |  |
| Consumption | Poisons,Health,Stamina |
| Cure Disease | Creatures,Disease,Mortals |
| Cure Betaltadoon | Creatures,Poisons,Mortals |
| Damage Health | Poisons,Health |
| Damage Magicka | Magicka,Poisons |
| Damage Magicka Regeneration | Magicka,Poisons |
| Damage Maximum Health | Acid,Health |
| Damage Maximum Magicka | Acid,Magicka |
| Damage Maximum Stamina | Acid,Stamina |
| Damage Stamina | Poisons,Stamina |
| Damage Stamina Regeneration | Poisons,Stamina |
| Detect Life | Life |
| Disarm | Weapons,Force |
| Disease | Disease,Mortals,Poisons |
| Drain Health | Health,Poisons |
| Drain Magicka | Magicka,Poisons |
| Drain Magicka Regeneration | Magicka,Poisons |
| Drain Stamina | Poisons,Stamina |
| Drain Stamina Regeneration | Poisons,Stamina |
| Elemental Resistance | Resistances |
| Fear | Apparitions,Daedra,Mortal |
| Fire Resistance | Resistances |
| Fortify Alteration | Magicka |
| Fortify Conjuration | Magicka |
| Fortify Destruction | Magicka |
| Fortify Endurance | Health,Stamina |
| Fortify Health | Health |
| Fortify Illusion | Magicka |
| Fortify Magicka | Magicka |
| Fortify Magicka Regeneration | Magicka |
| Fortify Melee Weapons | Weapons |
| Fortify Mysticism | Magicka |
| Fortify Restoration | Magicka |
| Fortify Stamina | Stamina |
| Fortify Stamina Regeneration | Stamina |
| Freeze | Frost |
| Frenzy | Apparitions,Mortal |
| Frost Resistance | Resistances |
| Guided Arrow | Weapons |
| Heal Stamina | Health,Stamina |
| Heal | Health |
| Illuminate | Light |
| Invisibility | Apparitions,Shadow |
| Lightning Resistance | Resistances |
| Lingering Damage Health | Health,Poisons |
| Lingering Damage Magicka | Magicka,Poisons |
| Lingering Damage Stamina | Poisons,Stamina |
| Numb Metal | Metal,Poisons |
| Open Locks | Trap |
| Paralyze | Flesh,Paralysis,Poisons |
| Plague | Disease,Mortals,Poisons |
| Poison | Poisons |
| Ravage Alteration | Magicka,Poisons |
| Ravage Conjuration | Magicka,Poisons |
| Ravage Destruction | Magicka,Poisons |
| Ravage Endurance | Health,Poisons,Stamina |
| Ravage Health | Health,Poisons |
| Ravage Illusion | Magicka,Poisons |
| Ravage Magicka | Magicka,Poisons |
| Ravage Magicka Regeneration | Magicka,Poisons |
| Ravage Melee Weapons | Poisons,Weapons |
| Ravage Mysticism | Magicka,Poisons |
| Ravage Restoration | Magicka,Poisons |
| Ravage Stamina | Poisons,Stamina |
| Ravage Stamina Regeneration | Poisons,Stamina |
| Regenerate Health | Health |
| Regenerate Magicka | Magicka |
| Regenerate Stamina | Stamina |
| Ruse | Apparitions,Mortal |
| Shield | Shield |
| Shock Resistance | Resistances |
| Silence | Apparitions,Trap |
| Slow | Time |
| Spike Damage | Force,Weapons |
| Summon Atronach | Conjuration,Creatures |
| Summon Daedra | Conjuration,Daedra |
| Summon Spirit | Conjuration,Undead |
| Teleportation | Time |

</div>

---

## Next Steps

- **[Return to Spell Research Cheat Sheet](https://wiki.wildlandermod.com/12Cheat-Sheets/Spell-Research-Cheat-Sheet/)** - Main reference page
- **[Ingredient View](https://wiki.wildlandermod.com/12Cheat-Sheets/Ingredient View/)** - See solutions from dissolving ingredients
- **[Solutions View](https://wiki.wildlandermod.com/12Cheat-Sheets/Solutions-View/)** - Find which ingredients produce specific solutions

