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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  initEffectViewFilters();
});

function initEffectViewFilters() {
  const archetypes = new Set();
  const table = document.querySelector('.effect-view-table table');
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
  Array.from(archetypes).sort().forEach(arch => {
    const option = document.createElement('option');
    option.value = arch;
    option.textContent = arch;
    select.appendChild(option);
  });
  
  document.getElementById('effectViewSearch').addEventListener('keyup', filterEffectViewTable);
  select.addEventListener('change', filterEffectViewTable);
  document.getElementById('effectViewClearFilters').addEventListener('click', clearEffectViewFilters);
}

function filterEffectViewTable() {
  const searchTerm = document.getElementById('effectViewSearch').value.toLowerCase();
  const archetypeFilter = document.getElementById('effectViewArchetypeFilter').value;
  
  const table = document.querySelector('.effect-view-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const effect = cells[0]?.textContent.toLowerCase() || '';
    const archetypes = cells[1]?.textContent.toLowerCase() || '';
    
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
    counter.textContent = `Showing ${visible} of ${total} effects`;
  }
}

function clearEffectViewFilters() {
  document.getElementById('effectViewSearch').value = '';
  document.getElementById('effectViewArchetypeFilter').value = '';
  filterEffectViewTable();
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

