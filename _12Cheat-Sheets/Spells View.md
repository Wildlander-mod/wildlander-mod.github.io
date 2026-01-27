---
title: Spells View
layout: default
nav_order: 3
parent: Spell Research Cheat Sheet
description: Complete interactive reference for all craftable spells
---

Reference all spells available through Spell Research, organized by school and level. Search by spell name or filter by school to find exactly what you need.

---

## How to Use This Page

**Search** - Find specific spells by name or cast type
**Filter by School** - View spells from a specific school (Alteration, Conjuration, Destruction, Illusion, Restoration)
**Full Reference** - Complete list of all 231+ spells with crafting and scroll availability

Use the search box below to find spells by name or filter by school of magic.

---

<style>
#spells-view-tooltip {
  background-color: #2a2a2a;
  border: 2px solid #50098a;
  border-radius: 4px;
  padding: 10px;
  color: #e6e6e6;
  font-size: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.5);
  max-width: 350px;
  word-wrap: break-word;
}

#spells-view-tooltip div {
  margin: 4px 0;
}

#spells-view-tooltip strong {
  color: #f77ef1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  setTimeout(initSpellsViewPage, 300);
});

function initSpellsViewPage() {
  const table = document.querySelector('.spells-view-table table');
  if (!table) return;
  
  initSpellsViewFilters(table);
  initSpellsViewtooltips(table);
}

function initSpellsViewFilters(table) {
  const schools = new Set();
  const elements = new Set();
  const targets = new Set();
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const schoolCell = row.querySelector('td:nth-child(2)');
    if (schoolCell) {
      const schoolText = schoolCell.textContent.trim();
      if (schoolText) {
        schools.add(schoolText);
      }
    }
    
    const targetCell = row.querySelector('td:nth-child(5)');
    if (targetCell) {
      const targetText = targetCell.textContent.trim();
      if (targetText) {
        targetText.split(',').forEach(tgt => {
          const cleaned = tgt.trim();
          if (cleaned) targets.add(cleaned);
        });
      }
    }
    
    const elementsCell = row.querySelector('td:nth-child(7)');
    if (elementsCell) {
      const elementsText = elementsCell.textContent.trim();
      if (elementsText) {
        elementsText.split(',').forEach(elm => {
          const cleaned = elm.trim();
          if (cleaned) elements.add(cleaned);
        });
      }
    }
  });
  
  const schoolSelect = document.getElementById('spellsViewTypeFilter');
  if (schoolSelect) {
    Array.from(schools).sort().forEach(school => {
      const option = document.createElement('option');
      option.value = school;
      option.textContent = school;
      schoolSelect.appendChild(option);
    });
    schoolSelect.addEventListener('change', function() { filterSpellsViewTable(table); });
  }
  
  const targetSelect = document.getElementById('spellsViewTargetFilter');
  if (targetSelect) {
    Array.from(targets).sort().forEach(tgt => {
      const option = document.createElement('option');
      option.value = tgt;
      option.textContent = tgt;
      targetSelect.appendChild(option);
    });
    targetSelect.addEventListener('change', function() { filterSpellsViewTable(table); });
  }
  
  const elementsSelect = document.getElementById('spellsViewElementsFilter');
  if (elementsSelect) {
    Array.from(elements).sort().forEach(elm => {
      const option = document.createElement('option');
      option.value = elm;
      option.textContent = elm;
      elementsSelect.appendChild(option);
    });
    elementsSelect.addEventListener('change', function() { filterSpellsViewTable(table); });
  }
  
  const searchInput = document.getElementById('spellsViewSearch');
  if (searchInput) {
    searchInput.addEventListener('input', function() { filterSpellsViewTable(table); });
  }
  
  const clearButton = document.getElementById('spellsViewClearFilters');
  if (clearButton) {
    clearButton.addEventListener('click', function() { clearSpellsViewFilters(table); });
  }
  
  filterSpellsViewTable(table);
}

function filterSpellsViewTable(table) {
  const searchTerm = (document.getElementById('spellsViewSearch')?.value || '').toLowerCase();
  const schoolFilter = document.getElementById('spellsViewTypeFilter')?.value || '';
  const targetFilter = document.getElementById('spellsViewTargetFilter')?.value || '';
  const elementsFilter = document.getElementById('spellsViewElementsFilter')?.value || '';
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const spell = (cells[0]?.textContent || '').toLowerCase();
    const school = (cells[1]?.textContent || '').trim();
    const castType = (cells[2]?.textContent || '').toLowerCase();
    const targetText = (cells[4]?.textContent || '').toLowerCase();
    const elementsText = (cells[6]?.textContent || '').toLowerCase();
    
    const searchMatch = spell.includes(searchTerm) || castType.includes(searchTerm);
    const schoolMatch = !schoolFilter || school === schoolFilter;
    
    const targetList = targetText.split(',').map(v => v.trim());
    const targetMatch = !targetFilter || targetList.includes(targetFilter.toLowerCase());
    
    const elementsList = elementsText.split(',').map(v => v.trim());
    const elementsMatch = !elementsFilter || elementsList.includes(elementsFilter.toLowerCase());
    
    const isVisible = searchMatch && schoolMatch && targetMatch && elementsMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateSpellsViewFilterCount(visibleCount, rows.length);
}

function updateSpellsViewFilterCount(visible, total) {
  const counter = document.getElementById('spellsViewFilterResultCount');
  if (counter) {
    counter.textContent = 'Showing ' + visible + ' of ' + total + ' spells';
  }
}

function clearSpellsViewFilters(table) {
  const searchInput = document.getElementById('spellsViewSearch');
  const schoolSelect = document.getElementById('spellsViewTypeFilter');
  const targetSelect = document.getElementById('spellsViewTargetFilter');
  const elementsSelect = document.getElementById('spellsViewElementsFilter');
  
  if (searchInput) searchInput.value = '';
  if (schoolSelect) schoolSelect.value = '';
  if (targetSelect) targetSelect.value = '';
  if (elementsSelect) elementsSelect.value = '';
  
  filterSpellsViewTable(table);
}

function initSpellsViewtooltips(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const spellCell = row.querySelector('td:first-child');
    if (!spellCell) return;
    
    spellCell.style.cursor = 'pointer';
    spellCell.style.color = '#f77ef1';
    spellCell.style.fontWeight = '500';
    spellCell.addEventListener('mouseenter', (e) => showSpellsViewtooltip(e, row));
    spellCell.addEventListener('mousemove', updateSpellsViewtooltipPosition);
    spellCell.addEventListener('mouseleave', hideSpellsViewtooltip);
  });
}

function showSpellsViewtooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const spellName = cells[0]?.textContent || '';
  const school = cells[1]?.textContent || '';
  const castType = cells[2]?.textContent || '';
  const level = cells[3]?.textContent || '';
  const target = cells[4]?.textContent || '';
  const technique = cells[5]?.textContent || '';
  const elements = cells[6]?.textContent || '';
  const tomeCrafting = cells[7]?.textContent || '';
  const scrollCrafting = cells[8]?.textContent || '';
  const notes = cells[9]?.textContent || '';
  
  let tooltip = document.getElementById('spells-view-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'spells-view-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Spell:</strong> ' + spellName + '</div>' +
    '<div><strong>School:</strong> ' + school + '</div>' +
    '<div><strong>Cast Type:</strong> ' + castType + '</div>' +
    '<div><strong>Level:</strong> ' + level + '</div>' +
    '<div><strong>Target:</strong> ' + target + '</div>' +
    '<div><strong>Technique:</strong> ' + (technique || 'N/A') + '</div>' +
    '<div><strong>Elements:</strong> ' + elements + '</div>' +
    '<div><strong>Tome:</strong> ' + (tomeCrafting || 'No') + '</div>' +
    '<div><strong>Scroll:</strong> ' + (scrollCrafting || 'No') + '</div>' +
    (notes ? '<div><strong>Notes:</strong> ' + notes + '</div>' : '');
  
  tooltip.style.display = 'block';
  updateSpellsViewtooltipPosition(event);
}

function updateSpellsViewtooltipPosition(event) {
  const tooltip = document.getElementById('spells-view-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideSpellsViewtooltip() {
  const tooltip = document.getElementById('spells-view-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}
</script>

<div class="spells-view-controls">
  <input type="text" id="spellsViewSearch" placeholder="Search by spell name or cast type..." />
  <select id="spellsViewTypeFilter">
    <option value="">All Schools</option>
  </select>
  <select id="spellsViewTargetFilter">
    <option value="">All Targets</option>
  </select>
  <select id="spellsViewElementsFilter">
    <option value="">All Elements</option>
  </select>
  <button id="spellsViewClearFilters" onclick="clearSpellsViewFilters()">Clear Filters</button>
  <div id="spellsViewFilterResultCount" class="filter-result-count-spells-view"></div>
</div>

## Spells View

<div class="spells-view-table" markdown="1">

| Spell | School | Cast Type | Spell Level | Target | Technique | Elements | Tome Crafting | Scroll Crafting | Notes |
|:---|:---|:---|:---:|:---|:---|:---|:---|:---|:---|
| Absorb Essence | Alteration | Concentration | Master | Actor | Siphon | Health,Magicka,Stamina | checked |  | Missing - Will be added in R4 |
| Absorb Health | Alteration | Concentration | Adept | Actor | Siphon | Health | checked |  |  |
| Absorb Magicka | Alteration | Concentration | Adept | Actor | Siphon | Magicka | checked |  |  |
| Absorb Stamina | Alteration | Concentration | Adept | Actor | Siphon | Stamina | checked |  |  |
| Absorbing Grasp | Alteration | Fire & Forget | Novice | Actor | Siphon | Health | checked |  | Will be corrected to Concentration in R4 |
| Arcane Mending | Alteration | Fire & Forget | Expert | Actor | Telekinesis | Construct,Daedra,Health,Metal | checked |  |  |
| Ash Rune | Alteration | Fire & Forget | Expert | AOE,Location |  | Construct,Earth,Fire,Trap | checked |  |  |
| Ash Shell | Alteration | Fire & Forget | Adept | Actor | Telekinesis | Flesh,Earth,Fire | checked |  | Will be Expert in R4 |
| Candlelight | Alteration | Fire & Forget | Novice | Self |  | Construct,Light | checked | checked |  |
| Detect Aura | Alteration | Fire & Forget | Master | Self | Sense | Construct,Creature,Human,Undead | checked |  |  |
| Detect Death | Alteration | Concentration | Expert | Self | Sense | Undead | checked |  |  |
| Detect Life | Alteration | Concentration | Adept | Self | Sense | Creature,Human | checked | checked |  |
| Featherfalling | Alteration | Fire & Forget | Apprentice | Self | Cloak,Telekinesis |  | checked |  |  |
| Knock (Rank I) | Alteration | Fire & Forget | Apprentice | Actor | Telekinesis | Metal | checked |  | Will have scroll in R4 |
| Knock (Rank II) | Alteration | Fire & Forget | Adept | Actor | Telekinesis | Metal | checked | checked |  |
| Knock (Rank III) | Alteration | Fire & Forget | Adept | Actor | Metal | Telekinesis | checked |  | Will be corrected to master in R4,Will have scroll in R4 |
| Lightning Speed | Alteration | Fire & Forget | Master | Self | Sense,Strengthen | Flesh | checked |  |  |
| Mage Armor on Self (Rank I) | Alteration | Fire & Forget | Novice | Self | Infuse | Armor,Flesh,Nature | checked | checked |  |
| Mage Armor on Self (Rank II) | Alteration | Fire & Forget | Apprentice | Self | Infuse | Armor,Flesh,Earth | checked | checked |  |
| Mage Armor on Self (Rank III) | Alteration | Fire & Forget | Adept | Self | Infuse | Armor,Flesh,Metal | checked | checked |  |
| Mage Armor on Self (Rank IV) | Alteration | Fire & Forget |  | Self | Infuse | Armor,Flesh,Metal | checked | checked |  |
| Mage Armor on Self (Rank V) | Alteration | Fire & Forget | Master | Self | Infuse | Armor,Flesh,Creature | checked | checked | Cannot be discovered via Spell research |
| Mage Armor on Target (Rank I) | Alteration | Fire & Forget | Adept | Actor |  | Armor,Force | checked |  |  |
| Mage Armor on Target (Rank II) | Alteration | Fire & Forget | Expert | Actor |  | Armor,Force | checked |  |  |
| Mage Armor on Target (Rank III) | Alteration | Fire & Forget | Master | Actor |  | Armor,Force | checked |  |  |
| Mage Coat (Rank II) | Alteration | Fire & Forget | Adept | Self | Infuse | Creature,Fire,Flesh | checked | checked |  |
| Mage Coat (Rank III) | Alteration | Fire & Forget | Expert | Self | Infuse | Creature,Fire,Flesh | checked | checked |  |
| Mage Coat (Rank I) | Alteration | Fire & Forget | Apprentice | Self | Infuse | Creature,Fire,Flesh | checked | checked |  |
| Magelight | Alteration | Fire & Forget | Apprentice | Actor,Location |  | Light | checked | checked |  |
| Paralyze (Rank I) | Alteration | Fire & Forget | Expert | Actor | Telekinesis | Flesh | checked | checked |  |
| Paralyze (Rank II) | Alteration | Fire & Forget | Master | AOE | Telekinesis | Flesh | checked | checked |  |
| Polymorph | Alteration | Fire & Forget | Expert | Actor | Transform | Creature,Flesh,Human | checked |  |  |
| Telekinetic Blast | Alteration | Concentration | Master | Actor | Telekinesis | Flesh | checked |  |  |
| Telekinetic Disarray | Alteration | Fire & Forget | Expert | Actor | Telekinesis |  | checked |  |  |
| Telekinetic Execution | Alteration | Fire & Forget | Master | Actor | Telekinesis | Flesh | checked |  |  |
| Telekinetic Grab | Alteration | Concentration | Master | Actor | Telekinesis |  | checked |  |  |
| Telekinetic Hand | Alteration | Concentration | Adept | Actor | Telekinesis |  | checked |  |  |
| Telekinetic Nova | Alteration | Fire & Forget | Expert | AOE | Telekinesis |  | checked |  |  |
| Transcendance on Self | Alteration | Fire & Forget | Master | Self | Control,Telekinesis,Transform | Air,Flesh | checked |  |  |
| Transcendance on Target | Alteration | Fire & Forget | Master | Actor | Control,Telekinesis,Transform | Air,Flesh | checked |  |  |
| Transmute Muscles on Self | Alteration | Fire & Forget | Apprentice | Self | Strengthen | Flesh | checked |  |  |
| Transmute Muscles on Target | Alteration | Fire & Forget | Adept | Actor | Strengthen | Flesh | checked |  |  |
| Transmute: Blood | Alteration | Concentration | Expert | Self | Transform | Health,Magicka | checked |  | Will be Novice in R4. |
| Transmute: Corpus | Alteration | Fire & Forget | Master | Actor | Transform | Flesh | checked |  |  |
| Transmute: Water | Alteration | Fire & Forget | Adept | Self | Cloak,Transform | Air,Water | checked | checked |  |
| Transmute: Wood | Alteration | Fire & Forget | Expert | Actor | Transform | Nature | checked |  |  |
| Transmute: Minerals | Alteration | Fire & Forget | Adept | Actor | Transform | Metal |  |  | Only obtainable via spell research,Will be disabled in R4 |
| Banish Daedra (Rank I) | Conjuration | Fire & Forget | Adept | Actor,Location | Summoning | Daedra | checked | checked |  |
| Banish Daedra (Rank II) | Conjuration | Fire & Forget | Expert | Actor,Location | Summoning | Daedra | checked | checked |  |
| Bound Axe | Conjuration | Fire & Forget | Apprentice | Self,Actor | Summoning,Transform | Daedra,Soul,Weapon | checked |  |  |
| Bound Bow | Conjuration | Fire & Forget | Expert | Self,Actor | Summoning,Transform | Daedra,Soul,Weapon | checked |  | Will have scroll in R4 |
| Bound Dagger | Conjuration | Fire & Forget | Novice | Actor,Self | Summoning,Transform | Daedra,Soul,Weapon | checked |  |  |
| Bound Sword | Conjuration | Fire & Forget | Novice | Actor,Self | Summoning,Transform | Daedra,Soul,Weapon | checked |  |  |
| Bound Cloak (Rank I) | Conjuration | Fire & Forget | Apprentice | Self | Summoning | Armor,Daedra,Soul | checked | checked |  |
| Bound Cloak (Rank 2) | Conjuration | Fire & Forget | Adept | Self | Summoning | Armor,Daedra,Soul | checked | checked |  |
| Conjure Ash Guardian | Conjuration | Fire & Forget | Expert | Location | Control,Infuse | Construct,Earth,Life,Fire | checked |  |  |
| Conjure Ash Spawn | Conjuration | Fire & Forget | Adept | Location | Control,Infuse | Earth,Life,Fire | checked |  |  |
| Conjure Shelter (Rank I) | Conjuration | Fire & Forget | Expert | Actor,Location | Summoning | Construct,Nature,Soul | checked | checked |  |
| Conjure Shelter (Rank 2) | Conjuration | Fire & Forget | Master | Actor,Location | Summoning | Construct,Nature,Soul | checked | checked |  |
| Command Daedra | Conjuration | Fire & Forget | Expert | Location,Actor | Summoning,Control | Daedra | checked | checked |  |
| Mark & Recall | Conjuration | Fire & Forget | Expert | Self,Location | Summoning |  | checked | checked |  |
| Necromantic Empowerment on Self | Conjuration | Concentration | Apprentice | Actor | Curing | Health,Undead | checked |  | Will be corrected to Adept in R4,Should have spell tome - will be corrected in r4 |
| Necromantic Empowerment on Target | Conjuration | Concentration | Apprentice | Actor | Curing | Health,Undead | checked |  | Will be corrected to Fire & Forget in R4 |
| Raise Dead (Rank I) | Conjuration | Fire & Forget | Novice | Actor | Infuse,Control,Summoning | Creature,Flesh,Human,Soul,Undead | checked | checked |  |
| Raise Dead (Rank II) | Conjuration | Fire & Forget | Apprentice | Actor | Infuse,Control,Summoning | Creature,Flesh,Human,Soul,Undead | checked | checked |  |
| Raise Dead (Rank III) | Conjuration | Fire & Forget | Adept | Actor | Infuse,Control,Summoning | Creature,Flesh,Soul,Undead | checked | checked |  |
| Raise Dead (Rank IV) | Conjuration | Fire & Forget | Expert | Actor | Infuse,Control,Summoning | Creature,Flesh,Human,Soul,Undead | checked | checked |  |
| Raise Dead (Rank V) | Conjuration | Fire & Forget | Master | Actor | Infuse,Control,Summoning | Flesh,Human,Soul,Undead | checked | checked | Cannot be discovered via Spell research |
| Soul Trap (Rank I) | Conjuration | Fire & Forget | Apprentice | Actor | Infuse,Siphon | Soul | checked | checked |  |
| Soulcairn Summoning (Rank I) | Conjuration | Fire & Forget | Apprentice | Actor,Location | Control,Summoning | Soul,Undead | checked |  |  |
| Soulcairn Summoning (Rank II) | Conjuration | Fire & Forget | Adept | Actor,Location | Control,Summoning | Soul,Undead | checked |  |  |
| Soulcairn Summoning (Rank III) | Conjuration | Fire & Forget | Expert | Actor,Location | Summoning,Control | Soul,Undead | checked |  |  |
| Spectral Arrow | Conjuration | Fire & Forget | Adept | Actor | Curse | Soul | checked |  | Missing - Will be added in R4 |
| Summon Arniel Gane | Conjuration | Fire & Forget | Apprentice | Actor | Summoning | Apparition,Human,Soul |  |  | Cannot be discovered via Spell research |
| Summon Arvak | Conjuration | Fire & Forget | Expert | Location,Actor | Summoning | Creature,Soul,Undead |  |  | Cannot be discovered via Spell research |
| Summon Dremora Archer | Conjuration | Fire & Forget | Master | Location,Actor | Summoning,Control | Daedra | checked |  |  |
| Summon Dremora Archmage | Conjuration | Fire & Forget | Master | Location,Actor | Summoning,Control | Daedra |  |  |  |
| Summon Dremora Lord | Conjuration | Fire & Forget | Master | Location,Actor | Summoning,Control | Daedra | checked |  |  |
| Summon Flame Atronach | Conjuration | Fire & Forget | Adept | Actor,Location | Control,Summoning | Daedra,Fire | checked | checked |  |
| Summon Flame Thrall | Conjuration | Fire & Forget | Master | Actor,Location | Summoning,Control | Daedra,Fire | checked | checked | Cannot be discovered via Spell research |
| Summon Flaming Familiar | Conjuration | Fire & Forget | Apprentice | Actor,Location | Control | Creature,Fire,Soul | checked |  |  |
| Summon Frost Atronach | Conjuration | Fire & Forget | Adept | Actor,Location | Control,Summoning | Daedra,Frost | checked | checked | Will be Expert in R4 |
| Summon Frost Thrall | Conjuration | Fire & Forget | Master | Actor,Location | Summoning,Control | Daedra,Frost | checked | checked | Cannot be discovered via Spell research |
| Summon Ghostly Dragonpriest | Conjuration | Fire & Forget | Master | Actor,Location | Summoning,Control | Human,Soul | checked |  |  |
| Summon Ice Spirit | Conjuration | Fire & Forget | Expert | Actor,Location | Summoning,Control | Creature,Soul | checked |  |  |
| Summon Seeker | Conjuration | Fire & Forget | Adept | Location,Actor | Control,Summoning | Daedra | checked |  | Will be corrected to master in R4 |
| Summon Skeletal Archer | Conjuration | Fire & Forget | Apprentice | Location,Actor | Control,Summoning | Undead | checked |  |  |
| Summon Skeletal Hero | Conjuration | Fire & Forget | Apprentice | Location,Actor | Control,Summoning | Undead | checked |  |  |
| Summon Skeletal Soldier | Conjuration | Fire & Forget | Novice | Location,Actor | Control,Summoning | Undead | checked |  |  |
| Summon Skeletal Warlock | Conjuration | Fire & Forget | Apprentice | Location,Actor | Control,Summoning | Undead | checked |  |  |
| Summon Spectral Archer | Conjuration | Fire & Forget | Adept | Location,Actor | Control,Summoning | Human,Soul | checked |  |  |
| Summon Spectral Warhound | Conjuration | Fire & Forget | Apprentice | Location,Actor | Control,Summoning | Creature,Soul | checked |  |  |
| Summon Spectral Warrior | Conjuration | Fire & Forget | Adept | Location,Actor | Control,Summoning | Human,Soul | checked |  |  |
| Summon Spirit Bear | Conjuration | Fire & Forget | Adept | Location,Actor | Summoning,Control | Creature,Soul | checked |  |  |
| Summon Spirit Mudcrab | Conjuration | Fire & Forget | Apprentice | Location,Actor | Control,Summoning | Creature,Soul | checked |  |  |
| Summon Spirit Sabrecat | Conjuration | Fire & Forget | Expert | Location,Actor | Summoning,Control | Creature,Soul | checked |  |  |
| Summon Spirit Steed | Conjuration | Fire & Forget | Master | Self,Location | Summoning,Control | Creature,Soul | checked |  |  |
| Summon Spirit Troll | Conjuration | Fire & Forget | Adept | Location,Actor | Summoning,Control | Creature,Soul | checked |  |  |
| Summon Spirit Werewolf | Conjuration | Fire & Forget | Master | Location,Actor | Summoning,Control | Creature,Soul | checked |  |  |
| Summon Spirit Wolf | Conjuration | Fire & Forget | Novice | Actor,Location | Control,Summoning | Creature,Soul | checked | checked |  |
| Summon Storm Atronach | Conjuration | Fire & Forget | Expert | Location,Actor | Summoning,Control | Daedra,Shock | checked | checked |  |
| Summon Storm Thrall | Conjuration | Fire & Forget | Master | Location,Actor | Summoning,Control | Daedra,Shock | checked | checked | Cannot be discovered via Spell research |
| Summon Swarm (Rank I) | Conjuration | Concentration | Novice | Self | Control,Summoning | Daedra,Poison | checked |  |  |
| Summon Swarm (Rank II) | Conjuration | Concentration | Apprentice | Self | Control,Summoning | Daedra,Poison | checked |  |  |
| Summon Unbound Dremora | Conjuration | Fire & Forget | Master | Location,Actor | Summoning | Daedra |  |  | Cannot be discovered via Spell research |
| Teleport | Conjuration | Fire & Forget | Master | Self,Location | Summoning |  | checked |  |  |
| Teleport Vitals | Conjuration | Fire & Forget | Expert | Actor | Summoning | Flesh | checked |  |  |
| Arcane Missile | Destruction | Fire & Forget | Adept | Actor |  | Arcane | checked |  |  |
| Arcane Volley | Destruction | Concentration | Master | Actor |  | Arcane | checked |  |  |
| Arcane Vortex | Destruction | Concentration | Master | AOE,Actor |  | Arcane | checked |  |  |
| Fade Other | Destruction | Fire & Forget | Adept | Actor | Cloak,Control | Light |  |  | Will be Expert in R4 |
| Fiery Grasp | Destruction | Fire & Forget | Adept | Self | Infuse | Fire,Flesh | checked |  |  |
| Fireball | Destruction | Fire & Forget | Adept | AOE,Actor |  | Fire | checked | checked |  |
| Firebolt | Destruction | Fire & Forget | Apprentice | Actor |  | Fire | checked | checked |  |
| Firenova | Destruction | Fire & Forget | Expert | Self,AOE |  | Fire | checked |  |  |
| Firerune (Rank I) | Destruction | Fire & Forget | Apprentice | AOE,Location |  | Construct,Fire,Trap | checked | checked |  |
| Firerune (Rank II) | Destruction | Fire & Forget | Apprentice | AOE,Location |  | Fire,Trap |  |  | Missing - Will be added in R4 |
| Fireshock | Destruction | Concentration | Expert | Actor | Telekinesis | Fire | checked |  |  |
| Firestorm | Destruction | Fire & Forget | Master | AOE |  | Fire | checked | checked |  |
| Firestrike | Destruction | Fire & Forget | Master | AOE,Actor |  | Fire | checked |  |  |
| Firewall | Destruction | Concentration | Expert | Location,Actor |  | Fire,Trap | checked |  |  |
| Flame Cloak | Destruction | Fire & Forget | Adept | Self | Cloak | Fire | checked | checked |  |
| Flames | Destruction | Concentration | Novice | Actor |  | Fire | checked |  |  |
| Freeze | Destruction | Fire & Forget | Adept | Actor | Curse | Frost,Arcane |  |  | Cannot be discovered via Spell research |
| Frost Cloak | Destruction | Fire & Forget | Adept | Self | Cloak | Frost | checked | checked |  |
| Icerune (Rank I) | Destruction | Fire & Forget | Apprentice | AOE,Location |  | Construct,Frost,Trap | checked | checked |  |
| Icerune (Rank II) | Destruction | Fire & Forget | Apprentice | AOE,Location |  | Trap,Frost |  |  | Missing - Will be added in R4 |
| Icesphere | Destruction | Fire & Forget | Adept | AOE,Actor |  | Frost | checked | checked |  |
| Iceshock | Destruction | Concentration | Expert | Actor | Telekinesis | Frost,Shock | checked |  |  |
| Icestorm | Destruction | Fire & Forget | Master | AOE |  | Frost | checked | checked |  |
| Icewall | Destruction | Concentration | Expert | Location,Actor |  | Frost,Trap | checked |  |  |
| Icewind | Destruction | Concentration | Novice | Actor |  | Frost | checked |  |  |
| Icy Grasp | Destruction | Fire & Forget | Adept | Self | Infuse | Flesh,Frost | checked |  |  |
| Icy Lance | Destruction | Fire & Forget | Expert | Actor |  | Frost | checked |  |  |
| Icy Shard | Destruction | Fire & Forget | Apprentice | Actor |  | Frost | checked | checked |  |
| Ignite | Destruction | Fire & Forget | Adept | Actor | Curse | Fire,Arcane |  |  | Cannot be discovered via Spell research |
| Incinerate | Destruction | Fire & Forget | Expert | Actor |  | Fire | checked |  |  |
| Lightning Bolt | Destruction | Fire & Forget | Apprentice | Actor |  | Shock | checked | checked |  |
| Lightning Cascade | Destruction | Fire & Forget | Master | Actor | Telekinesis,Control | Air,Shock | checked |  |  |
| Lightning Cloak | Destruction | Fire & Forget | Adept | Self |  | Shock | checked | checked |  |
| Lightning Grasp | Destruction | Fire & Forget | Adept | Self | Cloak | Flesh,Shock | checked |  |  |
| Lightning Jolt | Destruction | Fire & Forget | Apprentice | Actor | Telekinesis | Shock | checked |  |  |
| Lightning Ray | Destruction | Concentration | Expert | Actor |  | Shock | checked |  |  |
| Lightning Rune (Rank I) | Destruction | Fire & Forget | Apprentice | AOE,Location |  | Construct,Shock,Trap | checked | checked |  |
| Lightning Rune (Rank II) | Destruction | Fire & Forget | Apprentice | AOE,Location |  | Shock,Trap |  |  | Missing - Will be added in R4 |
| Lightning Shackles | Destruction | Fire & Forget | Adept | Actor,AOE |  | Shock | checked | checked |  |
| Lightning Sparks | Destruction | Concentration | Novice | Actor |  | Shock | checked |  |  |
| Lightning Strike | Destruction | Fire & Forget | Expert | Actor |  | Shock | checked |  |  |
| Lightning Vortex | Destruction | Concentration | Master | Actor |  | Shock | checked |  |  |
| Lightning Wall | Destruction | Concentration | Expert | Location,Actor |  | Shock,Trap |  |  |  |
| Snow Spume | Destruction | Fire & Forget | Adept | AOE,Actor |  | Frost | checked |  |  |
| Steam Cloud | Destruction | Concentration | Adept | Actor |  | Fire,Water | checked |  |  |
| Vapor Blast | Destruction | Fire & Forget | Adept | Actor | Transform | Air,Fire,Water | checked | checked |  |
| Venomous Blast | Destruction | Fire & Forget | Expert | Actor |  | Poison | checked |  |  |
| Venomous Grasp | Destruction | Fire & Forget | Adept | Self | Infuse | Flesh,Poison | checked |  |  |
| Venomous Shock | Destruction | Concentration | Master | Actor | Telekinesis | Poison | checked |  |  |
| Venomous Spray | Destruction | Concentration | Adept | Actor |  | Poison | checked |  |  |
| Venomous Storm | Destruction | Fire & Forget | Master | AOE,Actor |  | Poison |  |  | Should have spell tome - will be corrected in r4 |
| Whirlwind Cloak | Destruction | Fire & Forget | Adept | Self | Cloak | Air | checked |  |  |
| Arcane Resonance | Illusion | Fire & Forget | Apprentice | Location | Telekinesis,Control | Air | checked |  |  |
| Blackout | Illusion | Fire & Forget | Expert | Actor | Curse | Magicka | checked |  |  |
| Blur | Illusion | Fire & Forget | Apprentice | Self | Cloak,Control | Light | checked |  |  |
| Charming Touch | Illusion | Fire & Forget | Novice | Actor | Pacify | Creature,Human | checked | checked |  |
| Clairvoyance | Illusion | Concentration | Novice | Self | Sense |  | checked |  |  |
| Darkvision | Illusion | Fire & Forget | Novice | Self | Sense,Strengthen | Light | checked |  | Missing - Will be added in R4 |
| Enraging Orb | Illusion | Fire & Forget | Apprentice | Actor | Frenzy | Creature,Human | checked | checked |  |
| Enraging Rune | Illusion | Fire & Forget | Adept | AOE,Actor | Frenzy | Creature,Human | checked | checked |  |
| Fear | Illusion | Fire & Forget | Novice | Actor | Fear | Creature,Human | checked | checked |  |
| Fog of Shadows | Illusion | Fire & Forget | Expert | AOE,Location |  | Shadow | checked |  |  |
| Frenzy Sphere | Illusion | Fire & Forget | Adept | Location,AOE | Frenzy | Construct,Creature,Human,Trap | checked |  |  |
| Frightening Sphere | Illusion | Fire & Forget | Adept | AOE,Actor | Fear | Creature,Human | checked | checked |  |
| Hibernation Spray | Illusion | Fire & Forget | Adept | AOE,Actor | Curse,Pacify |  | checked |  |  |
| Hibernation Touch | Illusion | Fire & Forget | Apprentice | Actor | Curse,Pacify | Creature,Human | checked |  |  |
| Invisibility | Illusion | Fire & Forget | Apprentice | Self | Cloak,Control | Light | checked | checked |  |
| Invisibility Sphere | Illusion | Fire & Forget | Expert | Self,AOE | Cloak,Control | Light | checked |  |  |
| Lionheart | Illusion | Fire & Forget | Novice | Actor | Courage,Strengthen | Creature,Health,Human,Stamina | checked | checked |  |
| Mind Maelstrom | Illusion | Fire & Forget | Master | Actor,AOE | Pacify,Fear,Frenzy | Human,Creature | checked |  | Missing - Will be added in R4 |
| Mistress of the Dark | Illusion | Fire & Forget | Master | Location | Control | Apparition,Daedra,Shadow | checked |  |  |
| Muffle | Illusion | Fire & Forget | Apprentice | Self | Cloak,Control | Air | checked | checked |  |
| Muffling Sphere | Illusion | Fire & Forget | Expert | Self,AOE | Cloak,Control | Air | checked |  |  |
| Nightmare | Illusion | Fire & Forget | Adept | Actor | Fear | Apparition | checked |  |  |
| Phantasmal Killer | Illusion | Fire & Forget | Expert | Actor | Control | Human | checked |  |  |
| Phantasmal Miasma | Illusion | Fire & Forget | Master | AOE | Fear | Human,Creature | checked |  | Missing - Will be added in R4 |
| Phantasmal Pain | Illusion | Fire & Forget | Adept | Actor |  | Apparition,Flesh | checked |  |  |
| Rune of Dampening | Illusion | Fire & Forget | Apprentice | AOE,Location | Control | Air,Construct | checked |  |  |
| Shadow Sanctuary | Illusion | Fire & Forget | Master | Self | Cloak,Control | Human,Creature,Shield | checked |  | Missing - Will be added in R4 |
| Shadow Shield | Illusion | Fire & Forget | Adept | Self | Summoning | Shadow | checked |  |  |
| Shadow Simulacrum | Illusion | Fire & Forget | Expert | Location | Control | Apparition,Daedra,Shadow | checked |  |  |
| Shadow Stride | Illusion | Fire & Forget | Adept | Self | Summoning | Shadow | checked |  |  |
| Soothe (Rank 1) | Illusion | Fire & Forget | Novice | Self |  | Fire,Resistance | checked | checked |  |
| Soothe (Rank 2) | Illusion | Fire & Forget | Apprentice | Self |  | Fire,Resistance | checked | checked |  |
| Soothe (Rank 3) | Illusion | Fire & Forget | Adept | Self |  | Fire,Resistance | checked | checked |  |
| Veil of Shadows | Illusion | Fire & Forget | Master | Self,AOE | Cloak | Human | checked |  | Missing - Will be added in R4 |
| Veil of Silence | Illusion | Fire & Forget | Expert | Self | Cloak,Control | Air | checked |  |  |
| Rally | Illusion | Fire & Forget | Adept | AOE,Actor | Courage,Strengthen | Creature,Health,Stamina,Human | checked | checked | Only obtainable via spell research,Will be disabled in R4 |
| Pacify | Illusion | Fire & Forget | Expert | Actor,AOE | Pacify | Creature,Human | checked | checked | Only obtainable via spell research,Will be disabled in R4 |
| Arcane Disjunction (Rank I) | Restoration | Fire & Forget | Adept | Actor | Curse | Arcane,Resistance | checked |  |  |
| Arcane Disjunction (Rank II) | Restoration | Concentration | Expert | Actor | Curse | Arcane,Resistance | checked |  |  |
| Arcane Ward (Rank I) | Restoration | Concentration | Novice | Self |  | Force,Shield | checked |  |  |
| Arcane Ward (Rank II) | Restoration | Concentration | Apprentice | Self |  | Force,Shield | checked |  |  |
| Arcane Ward (Rank III) | Restoration | Concentration | Adept | Self |  | Force,Shield | checked |  |  |
| Arcane Ward (Rank IV) | Restoration | Concentration | Expert | Self |  | Force,Shield | checked |  |  |
| Circle of Palladium | Restoration | Fire & Forget | Master | Location | Curing,Fear | Construct,Undead,Health | checked |  |  |
| Circle of Protection | Restoration | Fire & Forget | Expert | Location | Fear | Construct,Undead | checked | checked |  |
| Dispel on Self | Restoration | Fire & Forget | Adept | Self | Curing | Arcane,Disease,Poison | checked |  |  |
| Dispel on Target | Restoration | Fire & Forget | Master | Actor | Curing | Arcane,Disease,Poison | checked |  |  |
| Heal Self (Rank I) | Restoration | Concentration | Apprentice | Self | Curing | Health | checked |  |  |
| Heal Self (Rank II) | Restoration | Fire & Forget | Apprentice | Self | Curing | Health | checked | checked |  |
| Heal Self (Rank III) | Restoration | Fire & Forget | Adept | Self | Curing | Health | checked | checked |  |
| Healing Aura on Self | Restoration | Fire & Forget | Novice | Self | Cloak,Curing | Health | checked |  |  |
| Healing Aura on Target | Restoration | Fire & Forget | Novice | Actor | Cloak,Curing | Health | checked |  |  |
| Healing Hands (Rank I) | Restoration | Concentration | Apprentice | Actor | Curing | Creature,Health,Human | checked |  |  |
| Healing Hands (Rank II) | Restoration | Fire & Forget | Adept | Actor | Curing | Creature,Health,Human | checked | checked |  |
| Healing Hands (Rank III) | Restoration | Fire & Forget | Expert | Self,AOE | Curing | Creature,Health,Human | checked | checked |  |
| Healing Ray | Restoration | Concentration | Adept | Actor | Curing | Creature,Health,Human | checked |  |  |
| Kindle | Restoration | Fire & Forget | Adept | Self | Transform | Fire,Nature | checked | checked |  |
| Poison Rune | Restoration | Fire & Forget | Adept | Location,AOE |  | Construct,Poison,Trap | checked |  | Will be corrected to Destruction in R4 |
| Powerful Healing Aura on Self | Restoration | Fire & Forget | Expert | Self | Curing,Cloak | Health | checked |  |  |
| Powerful Healing Aura on Target | Restoration | Fire & Forget | Expert | Actor | Curing,Cloak | Health | checked |  |  |
| Protection from Poison on Self | Restoration | Fire & Forget | Apprentice | Self | Strengthen | Poison,Resistance | checked |  |  |
| Protection from Poison on Target | Restoration | Fire & Forget | Apprentice | Actor | Strengthen | Poison,Resistance | checked |  | Will be corrected to Adept in R4 |
| Repel Undead (Rank I) | Restoration | Fire & Forget | Adept | Actor,AOE | Fear | Undead | checked | checked |  |
| Repel Undead (Rank II) | Restoration | Fire & Forget | Expert | Actor,AOE | Fear | Undead | checked | checked |  |
| Repel Undead (Rank III) | Restoration | Fire & Forget | Master | AOE | Fear | Fire,Undead | checked | checked |  |
| Shalidor's Mirror | Restoration | Concentration | Master | AOE | Control,Siphon | Arcane | checked |  | Cannot be discovered via Spell research |
| Sunburst | Restoration | Fire & Forget | Adept | Actor,AOE |  | Sun | checked |  |  |
| Sunfire | Restoration | Fire & Forget | Apprentice | Actor |  | Sun | checked |  |  |
| Sunfire Cloak | Restoration | Fire & Forget | Adept | Self | Cloak | Sun | checked |  |  |
| Turn Undead (Rank I) | Restoration | Fire & Forget | Apprentice | Actor | Fear | Undead | checked |  |  |
| Turn Undead (Rank II) | Restoration | Fire & Forget | Adept | Actor | Fear | Undead | checked | checked |  |
| Turn Undead (Rank III) | Restoration | Fire & Forget | Expert | Actor | Fear | Undead | checked | checked |  |

</div>

---

## Next Steps

- **[Return to Spell Research Cheat Sheet](https://wiki.wildlandermod.com/12Cheat-Sheets/Spell-Research-Cheat-Sheet/)** - Main reference page
- **[Elixir View](https://wiki.wildlandermod.com/12Cheat-Sheets/Elixir View/)** - Find elixir recipes and effects
- **[Effect View](https://wiki.wildlandermod.com/12Cheat-Sheets/Effect View/)** - Find potion effects and their archetypes
