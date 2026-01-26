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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  initSpellsViewFilters();
});

function initSpellsViewFilters() {
  const schools = new Set();
  const table = document.querySelector('.spells-view-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const schoolCell = row.querySelector('td:nth-child(2)');
    if (schoolCell) {
      const schoolText = schoolCell.textContent.trim();
      if (schoolText) {
        schools.add(schoolText);
      }
    }
  });
  
  const select = document.getElementById('spellsViewTypeFilter');
  Array.from(schools).sort().forEach(school => {
    const option = document.createElement('option');
    option.value = school;
    option.textContent = school;
    select.appendChild(option);
  });
  
  document.getElementById('spellsViewSearch').addEventListener('keyup', filterSpellsViewTable);
  select.addEventListener('change', filterSpellsViewTable);
  document.getElementById('spellsViewClearFilters').addEventListener('click', clearSpellsViewFilters);
}

function filterSpellsViewTable() {
  const searchTerm = document.getElementById('spellsViewSearch').value.toLowerCase();
  const schoolFilter = document.getElementById('spellsViewTypeFilter').value;
  
  const table = document.querySelector('.spells-view-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const spell = cells[0]?.textContent.toLowerCase() || '';
    const school = cells[1]?.textContent.trim() || '';
    const castType = cells[3]?.textContent.toLowerCase() || '';
    
    const searchMatch = spell.includes(searchTerm) || castType.includes(searchTerm);
    const filterMatch = !schoolFilter || school === schoolFilter;
    
    const isVisible = searchMatch && filterMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateSpellsViewFilterCount(visibleCount, rows.length);
}

function updateSpellsViewFilterCount(visible, total) {
  const counter = document.getElementById('spellsViewFilterResultCount');
  if (counter) {
    counter.textContent = `Showing ${visible} of ${total} spells`;
  }
}

function clearSpellsViewFilters() {
  document.getElementById('spellsViewSearch').value = '';
  document.getElementById('spellsViewTypeFilter').value = '';
  filterSpellsViewTable();
}
</script>

<div class="spells-view-controls">
  <input type="text" id="spellsViewSearch" placeholder="Search by spell name or cast type..." />
  <select id="spellsViewTypeFilter">
    <option value="">All Schools</option>
  </select>
  <button id="spellsViewClearFilters" onclick="clearSpellsViewFilters()">Clear Filters</button>
  <div id="spellsViewFilterResultCount" class="filter-result-count-spells-view"></div>
</div>

## Spells View

<div class="spells-view-table" markdown="1">

| Spell | School | Spell Level | Cast Type | Target | Tome Crafting | Scroll Crafting | Notes |
|:---|:---|:---:|:---|:---|:---|:---|:---|
| Absorb Essence | Alteration | Master | Concentration | Actor | checked |  | Missing - Will be added in R4 |
| Absorb Health | Alteration | Adept | Concentration | Actor | checked |  |  |
| Absorb Magicka | Alteration | Adept | Concentration | Actor | checked |  |  |
| Absorb Stamina | Alteration | Adept | Concentration | Actor | checked |  |  |
| Absorbing Grasp | Alteration | Novice | Fire & Forget | Actor | checked |  | Will be corrected to Concentration in R4 |
| Arcane Mending | Alteration | Expert | Fire & Forget | Actor | checked |  |  |
| Ash Rune | Alteration | Expert | Fire & Forget | AOE,Location | checked |  |  |
| Ash Shell | Alteration | Adept | Fire & Forget | Actor | checked |  | Will be Expert in R4 |
| Candlelight | Alteration | Novice | Fire & Forget | Self | checked | checked |  |
| Detect Aura | Alteration | Master | Fire & Forget | Self | checked |  |  |
| Detect Death | Alteration | Expert | Concentration | Self | checked |  |  |
| Detect Life | Alteration | Adept | Concentration | Self | checked | checked |  |
| Featherfalling | Alteration | Apprentice | Fire & Forget | Self | checked |  |  |
| Knock (Rank I) | Alteration | Apprentice | Fire & Forget | Actor | checked |  | Will have scroll in R4 |
| Knock (Rank II) | Alteration | Adept | Fire & Forget | Actor | checked | checked |  |
| Knock (Rank III) | Alteration | Adept | Fire & Forget | Actor | checked |  | Will be corrected to master in R4,Will have scroll in R4 |
| Lightning Speed | Alteration | Master | Fire & Forget | Self | checked |  |  |
| Mage Armor on Self (Rank I) | Alteration | Novice | Fire & Forget | Self | checked | checked |  |
| Mage Armor on Self (Rank II) | Alteration | Apprentice | Fire & Forget | Self | checked | checked |  |
| Mage Armor on Self (Rank III) | Alteration | Adept | Fire & Forget | Self | checked | checked |  |
| Mage Armor on Self (Rank IV) | Alteration |  | Fire & Forget | Self | checked | checked |  |
| Mage Armor on Self (Rank V) | Alteration | Master | Fire & Forget | Self | checked | checked | Cannot be discovered via Spell research |
| Mage Armor on Target (Rank I) | Alteration | Adept | Fire & Forget | Actor | checked |  |  |
| Mage Armor on Target (Rank II) | Alteration | Expert | Fire & Forget | Actor | checked |  |  |
| Mage Armor on Target (Rank III) | Alteration | Master | Fire & Forget | Actor | checked |  |  |
| Mage Coat (Rank II) | Alteration | Adept | Fire & Forget | Self | checked | checked |  |
| Mage Coat (Rank III) | Alteration | Expert | Fire & Forget | Self | checked | checked |  |
| Mage Coat (Rank I) | Alteration | Apprentice | Fire & Forget | Self | checked | checked |  |
| Magelight | Alteration | Apprentice | Fire & Forget | Actor,Location | checked | checked |  |
| Paralyze (Rank I) | Alteration | Expert | Fire & Forget | Actor | checked | checked |  |
| Paralyze (Rank II) | Alteration | Master | Fire & Forget | AOE | checked | checked |  |
| Polymorph | Alteration | Expert | Fire & Forget | Actor | checked |  |  |
| Telekinetic Blast | Alteration | Master | Concentration | Actor | checked |  |  |
| Telekinetic Disarray | Alteration | Expert | Fire & Forget | Actor | checked |  |  |
| Telekinetic Execution | Alteration | Master | Fire & Forget | Actor | checked |  |  |
| Telekinetic Grab | Alteration | Master | Concentration | Actor | checked |  |  |
| Telekinetic Hand | Alteration | Adept | Concentration | Actor | checked |  |  |
| Telekinetic Nova | Alteration | Expert | Fire & Forget | AOE | checked |  |  |
| Transcendance on Self | Alteration | Master | Fire & Forget | Self | checked |  |  |
| Transcendance on Target | Alteration | Master | Fire & Forget | Actor | checked |  |  |
| Transmute Muscles on Self | Alteration | Apprentice | Fire & Forget | Self | checked |  |  |
| Transmute Muscles on Target | Alteration | Adept | Fire & Forget | Actor | checked |  |  |
| Transmute: Blood | Alteration | Expert | Concentration | Self | checked |  | Will be Novice in R4. |
| Transmute: Corpus | Alteration | Master | Fire & Forget | Actor | checked |  |  |
| Transmute: Water | Alteration | Adept | Fire & Forget | Self | checked | checked |  |
| Transmute: Wood | Alteration | Expert | Fire & Forget | Actor | checked |  |  |
| Transmute: Minerals | Alteration | Adept | Fire & Forget | Actor |  |  | Only obtainable via spell research,Will be disabled in R4 |
| Banish Daedra (Rank I) | Conjuration | Adept | Fire & Forget | Actor,Location | checked | checked |  |
| Banish Daedra (Rank II) | Conjuration | Expert | Fire & Forget | Actor,Location | checked | checked |  |
| Bound Axe | Conjuration | Apprentice | Fire & Forget | Self,Actor | checked |  |  |
| Bound Bow | Conjuration | Expert | Fire & Forget | Self,Actor | checked |  | Will have scroll in R4 |
| Bound Dagger | Conjuration | Novice | Fire & Forget | Actor,Self | checked |  |  |
| Bound Sword | Conjuration | Novice | Fire & Forget | Actor,Self | checked |  |  |
| Bound Cloak (Rank I) | Conjuration | Apprentice | Fire & Forget | Self | checked | checked |  |
| Bound Cloak (Rank 2) | Conjuration | Adept | Fire & Forget | Self | checked | checked |  |
| Conjure Ash Guardian | Conjuration | Expert | Fire & Forget | Location | checked |  |  |
| Conjure Ash Spawn | Conjuration | Adept | Fire & Forget | Location | checked |  |  |
| Conjure Shelter (Rank I) | Conjuration | Expert | Fire & Forget | Actor,Location | checked | checked |  |
| Conjure Shelter (Rank 2) | Conjuration | Master | Fire & Forget | Actor,Location | checked | checked |  |
| Command Daedra | Conjuration | Expert | Fire & Forget | Location,Actor | checked | checked |  |
| Mark & Recall | Conjuration | Expert | Fire & Forget | Self,Location | checked | checked |  |
| Necromantic Empowerment on Self | Conjuration | Apprentice | Concentration | Actor | checked |  | Will be corrected to Adept in R4,Should have spell tome - will be corrected in r4 |
| Necromantic Empowerment on Target | Conjuration | Apprentice | Concentration | Actor | checked |  | Will be corrected to Fire & Forget in R4 |
| Raise Dead (Rank I) | Conjuration | Novice | Fire & Forget | Actor | checked | checked |  |
| Raise Dead (Rank II) | Conjuration | Apprentice | Fire & Forget | Actor | checked | checked |  |
| Raise Dead (Rank III) | Conjuration | Adept | Fire & Forget | Actor | checked | checked |  |
| Raise Dead (Rank IV) | Conjuration | Expert | Fire & Forget | Actor | checked | checked |  |
| Raise Dead (Rank V) | Conjuration | Master | Fire & Forget | Actor | checked | checked | Cannot be discovered via Spell research |
| Soul Trap (Rank I) | Conjuration | Apprentice | Fire & Forget | Actor | checked | checked |  |
| Soulcairn Summoning (Rank I) | Conjuration | Apprentice | Fire & Forget | Actor,Location | checked |  |  |
| Soulcairn Summoning (Rank II) | Conjuration | Adept | Fire & Forget | Actor,Location | checked |  |  |
| Soulcairn Summoning (Rank III) | Conjuration | Expert | Fire & Forget | Actor,Location | checked |  |  |
| Spectral Arrow | Conjuration | Adept | Fire & Forget | Actor | checked |  | Missing - Will be added in R4 |
| Summon Arniel Gane | Conjuration | Apprentice | Fire & Forget | Actor |  |  | Cannot be discovered via Spell research |
| Summon Arvak | Conjuration | Expert | Fire & Forget | Location,Actor |  |  | Cannot be discovered via Spell research |
| Summon Dremora Archer | Conjuration | Master | Fire & Forget | Location,Actor | checked |  |  |
| Summon Dremora Archmage | Conjuration | Master | Fire & Forget | Location,Actor |  |  |  |
| Summon Dremora Lord | Conjuration | Master | Fire & Forget | Location,Actor | checked |  |  |
| Summon Flame Atronach | Conjuration | Adept | Fire & Forget | Actor,Location | checked | checked |  |
| Summon Flame Thrall | Conjuration | Master | Fire & Forget | Actor,Location | checked | checked | Cannot be discovered via Spell research |
| Summon Flaming Familiar | Conjuration | Apprentice | Fire & Forget | Actor,Location | checked |  |  |
| Summon Frost Atronach | Conjuration | Adept | Fire & Forget | Actor,Location | checked | checked | Will be Expert in R4 |
| Summon Frost Thrall | Conjuration | Master | Fire & Forget | Actor,Location | checked | checked | Cannot be discovered via Spell research |
| Summon Ghostly Dragonpriest | Conjuration | Master | Fire & Forget | Actor,Location | checked |  |  |
| Summon Ice Spirit | Conjuration | Expert | Fire & Forget | Actor,Location | checked |  |  |
| Summon Seeker | Conjuration | Adept | Fire & Forget | Location,Actor | checked |  | Will be corrected to master in R4 |
| Summon Skeletal Archer | Conjuration | Apprentice | Fire & Forget | Location,Actor | checked |  |  |
| Summon Skeletal Hero | Conjuration | Apprentice | Fire & Forget | Location,Actor | checked |  |  |
| Summon Skeletal Soldier | Conjuration | Novice | Fire & Forget | Location,Actor | checked |  |  |
| Summon Skeletal Warlock | Conjuration | Apprentice | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spectral Archer | Conjuration | Adept | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spectral Warhound | Conjuration | Apprentice | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spectral Warrior | Conjuration | Adept | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spirit Bear | Conjuration | Adept | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spirit Mudcrab | Conjuration | Apprentice | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spirit Sabrecat | Conjuration | Expert | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spirit Steed | Conjuration | Master | Fire & Forget | Self,Location | checked |  |  |
| Summon Spirit Troll | Conjuration | Adept | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spirit Werewolf | Conjuration | Master | Fire & Forget | Location,Actor | checked |  |  |
| Summon Spirit Wolf | Conjuration | Novice | Fire & Forget | Actor,Location | checked | checked |  |
| Summon Storm Atronach | Conjuration | Expert | Fire & Forget | Location,Actor | checked | checked |  |
| Summon Storm Thrall | Conjuration | Master | Fire & Forget | Location,Actor | checked | checked | Cannot be discovered via Spell research |
| Summon Swarm (Rank I) | Conjuration | Novice | Concentration | Self | checked |  |  |
| Summon Swarm (Rank II) | Conjuration | Apprentice | Concentration | Self | checked |  |  |
| Summon Unbound Dremora | Conjuration | Master | Fire & Forget | Location,Actor |  |  | Cannot be discovered via Spell research |
| Teleport | Conjuration | Master | Fire & Forget | Self,Location | checked |  |  |
| Teleport Vitals | Conjuration | Expert | Fire & Forget | Actor | checked |  |  |
| Arcane Missile | Destruction | Adept | Fire & Forget | Actor | checked |  |  |
| Arcane Volley | Destruction | Master | Concentration | Actor | checked |  |  |
| Arcane Vortex | Destruction | Master | Concentration | AOE,Actor | checked |  |  |
| Fade Other | Destruction | Adept | Fire & Forget | Actor |  |  | Will be Expert in R4 |
| Fiery Grasp | Destruction | Adept | Fire & Forget | Self | checked |  |  |
| Fireball | Destruction | Adept | Fire & Forget | AOE,Actor | checked | checked |  |
| Firebolt | Destruction | Apprentice | Fire & Forget | Actor | checked | checked |  |
| Firenova | Destruction | Expert | Fire & Forget | Self,AOE | checked |  |  |
| Firerune (Rank I) | Destruction | Apprentice | Fire & Forget | AOE,Location | checked | checked |  |
| Firerune (Rank II) | Destruction | Apprentice | Fire & Forget | AOE,Location |  |  | Missing - Will be added in R4 |
| Fireshock | Destruction | Expert | Concentration | Actor | checked |  |  |
| Firestorm | Destruction | Master | Fire & Forget | AOE | checked | checked |  |
| Firestrike | Destruction | Master | Fire & Forget | AOE,Actor | checked |  |  |
| Firewall | Destruction | Expert | Concentration | Location,Actor | checked |  |  |
| Flame Cloak | Destruction | Adept | Fire & Forget | Self | checked | checked |  |
| Flames | Destruction | Novice | Concentration | Actor | checked |  |  |
| Freeze | Destruction | Adept | Fire & Forget | Actor |  |  | Cannot be discovered via Spell research |
| Frost Cloak | Destruction | Adept | Fire & Forget | Self | checked | checked |  |
| Icerune (Rank I) | Destruction | Apprentice | Fire & Forget | AOE,Location | checked | checked |  |
| Icerune (Rank II) | Destruction | Apprentice | Fire & Forget | AOE,Location |  |  | Missing - Will be added in R4 |
| Icesphere | Destruction | Adept | Fire & Forget | AOE,Actor | checked | checked |  |
| Iceshock | Destruction | Expert | Concentration | Actor | checked |  |  |
| Icestorm | Destruction | Master | Fire & Forget | AOE | checked | checked |  |
| Icewall | Destruction | Expert | Concentration | Location,Actor | checked |  |  |
| Icewind | Destruction | Novice | Concentration | Actor | checked |  |  |
| Icy Grasp | Destruction | Adept | Fire & Forget | Self | checked |  |  |
| Icy Lance | Destruction | Expert | Fire & Forget | Actor | checked |  |  |
| Icy Shard | Destruction | Apprentice | Fire & Forget | Actor | checked | checked |  |
| Ignite | Destruction | Adept | Fire & Forget | Actor |  |  | Cannot be discovered via Spell research |
| Incinerate | Destruction | Expert | Fire & Forget | Actor | checked |  |  |
| Lightning Bolt | Destruction | Apprentice | Fire & Forget | Actor | checked | checked |  |
| Lightning Cascade | Destruction | Master | Fire & Forget | Actor | checked |  |  |
| Lightning Cloak | Destruction | Adept | Fire & Forget | Self | checked | checked |  |
| Lightning Grasp | Destruction | Adept | Fire & Forget | Self | checked |  |  |
| Lightning Jolt | Destruction | Apprentice | Fire & Forget | Actor | checked |  |  |
| Lightning Ray | Destruction | Expert | Concentration | Actor | checked |  |  |
| Lightning Rune (Rank I) | Destruction | Apprentice | Fire & Forget | AOE,Location | checked | checked |  |
| Lightning Rune (Rank II) | Destruction | Apprentice | Fire & Forget | AOE,Location |  |  | Missing - Will be added in R4 |
| Lightning Shackles | Destruction | Adept | Fire & Forget | Actor,AOE | checked | checked |  |
| Lightning Sparks | Destruction | Novice | Concentration | Actor | checked |  |  |
| Lightning Strike | Destruction | Expert | Fire & Forget | Actor | checked |  |  |
| Lightning Vortex | Destruction | Master | Concentration | Actor | checked |  |  |
| Lightning Wall | Destruction | Expert | Concentration | Location,Actor |  |  |  |
| Snow Spume | Destruction | Adept | Fire & Forget | AOE,Actor | checked |  |  |
| Steam Cloud | Destruction | Adept | Concentration | Actor | checked |  |  |
| Vapor Blast | Destruction | Adept | Fire & Forget | Actor | checked | checked |  |
| Venomous Blast | Destruction | Expert | Fire & Forget | Actor | checked |  |  |
| Venomous Grasp | Destruction | Adept | Fire & Forget | Self | checked |  |  |
| Venomous Shock | Destruction | Master | Concentration | Actor | checked |  |  |
| Venomous Spray | Destruction | Adept | Concentration | Actor | checked |  |  |
| Venomous Storm | Destruction | Master | Fire & Forget | AOE,Actor |  |  | Should have spell tome - will be corrected in r4 |
| Whirlwind Cloak | Destruction | Adept | Fire & Forget | Self | checked |  |  |
| Arcane Resonance | Illusion | Apprentice | Fire & Forget | Location | checked |  |  |
| Blackout | Illusion | Expert | Fire & Forget | Actor | checked |  |  |
| Blur | Illusion | Apprentice | Fire & Forget | Self | checked |  |  |
| Charming Touch | Illusion | Novice | Fire & Forget | Actor | checked | checked |  |
| Clairvoyance | Illusion | Novice | Concentration | Self | checked |  |  |
| Darkvision | Illusion | Novice | Fire & Forget | Self | checked |  | Missing - Will be added in R4 |
| Enraging Orb | Illusion | Apprentice | Fire & Forget | Actor | checked | checked |  |
| Enraging Rune | Illusion | Adept | Fire & Forget | AOE,Actor | checked | checked |  |
| Fear | Illusion | Novice | Fire & Forget | Actor | checked | checked |  |
| Fog of Shadows | Illusion | Expert | Fire & Forget | AOE,Location | checked |  |  |
| Frenzy Sphere | Illusion | Adept | Fire & Forget | Location,AOE | checked |  |  |
| Frightening Sphere | Illusion | Adept | Fire & Forget | AOE,Actor | checked | checked |  |
| Hibernation Spray | Illusion | Adept | Fire & Forget | AOE,Actor | checked |  |  |
| Hibernation Touch | Illusion | Apprentice | Fire & Forget | Actor | checked |  |  |
| Invisibility | Illusion | Apprentice | Fire & Forget | Self | checked | checked |  |
| Invisibility Sphere | Illusion | Expert | Fire & Forget | Self,AOE | checked |  |  |
| Lionheart | Illusion | Novice | Fire & Forget | Actor | checked | checked |  |
| Mind Maelstrom | Illusion | Master | Fire & Forget | Actor,AOE | checked |  | Missing - Will be added in R4 |
| Mistress of the Dark | Illusion | Master | Fire & Forget | Location | checked |  |  |
| Muffle | Illusion | Apprentice | Fire & Forget | Self | checked | checked |  |
| Muffling Sphere | Illusion | Expert | Fire & Forget | Self,AOE | checked |  |  |
| Nightmare | Illusion | Adept | Fire & Forget | Actor | checked |  |  |
| Phantasmal Killer | Illusion | Expert | Fire & Forget | Actor | checked |  |  |
| Phantasmal Miasma | Illusion | Master | Fire & Forget | AOE | checked |  | Missing - Will be added in R4 |
| Phantasmal Pain | Illusion | Adept | Fire & Forget | Actor | checked |  |  |
| Rune of Dampening | Illusion | Apprentice | Fire & Forget | AOE,Location | checked |  |  |
| Shadow Sanctuary | Illusion | Master | Fire & Forget | Self | checked |  | Missing - Will be added in R4 |
| Shadow Shield | Illusion | Adept | Fire & Forget | Self | checked |  |  |
| Shadow Simulacrum | Illusion | Expert | Fire & Forget | Location | checked |  |  |
| Shadow Stride | Illusion | Adept | Fire & Forget | Self | checked |  |  |
| Soothe (Rank 1) | Illusion | Novice | Fire & Forget | Self | checked | checked |  |
| Soothe (Rank 2) | Illusion | Apprentice | Fire & Forget | Self | checked | checked |  |
| Soothe (Rank 3) | Illusion | Adept | Fire & Forget | Self | checked | checked |  |
| Veil of Shadows | Illusion | Master | Fire & Forget | Self,AOE | checked |  | Missing - Will be added in R4 |
| Veil of Silence | Illusion | Expert | Fire & Forget | Self | checked |  |  |
| Rally | Illusion | Adept | Fire & Forget | AOE,Actor | checked | checked | Only obtainable via spell research,Will be disabled in R4 |
| Pacify | Illusion | Expert | Fire & Forget | Actor,AOE | checked | checked | Only obtainable via spell research,Will be disabled in R4 |
| Arcane Disjunction (Rank I) | Restoration | Adept | Fire & Forget | Actor | checked |  |  |
| Arcane Disjunction (Rank II) | Restoration | Expert | Concentration | Actor | checked |  |  |
| Arcane Ward (Rank I) | Restoration | Novice | Concentration | Self | checked |  |  |
| Arcane Ward (Rank II) | Restoration | Apprentice | Concentration | Self | checked |  |  |
| Arcane Ward (Rank III) | Restoration | Adept | Concentration | Self | checked |  |  |
| Arcane Ward (Rank IV) | Restoration | Expert | Concentration | Self | checked |  |  |
| Circle of Palladium | Restoration | Master | Fire & Forget | Location | checked |  |  |
| Circle of Protection | Restoration | Expert | Fire & Forget | Location | checked | checked |  |
| Dispel on Self | Restoration | Adept | Fire & Forget | Self | checked |  |  |
| Dispel on Target | Restoration | Master | Fire & Forget | Actor | checked |  |  |
| Heal Self (Rank I) | Restoration | Apprentice | Concentration | Self | checked |  |  |
| Heal Self (Rank II) | Restoration | Apprentice | Fire & Forget | Self | checked | checked |  |
| Heal Self (Rank III) | Restoration | Adept | Fire & Forget | Self | checked | checked |  |
| Healing Aura on Self | Restoration | Novice | Fire & Forget | Self | checked |  |  |
| Healing Aura on Target | Restoration | Novice | Fire & Forget | Actor | checked |  |  |
| Healing Hands (Rank I) | Restoration | Apprentice | Concentration | Actor | checked |  |  |
| Healing Hands (Rank II) | Restoration | Adept | Fire & Forget | Actor | checked | checked |  |
| Healing Hands (Rank III) | Restoration | Expert | Fire & Forget | Self,AOE | checked | checked |  |
| Healing Ray | Restoration | Adept | Concentration | Actor | checked |  |  |
| Kindle | Restoration | Adept | Fire & Forget | Self | checked | checked |  |
| Poison Rune | Restoration | Adept | Fire & Forget | Location,AOE | checked |  | Will be corrected to Destruction in R4 |
| Powerful Healing Aura on Self | Restoration | Expert | Fire & Forget | Self | checked |  |  |
| Powerful Healing Aura on Target | Restoration | Expert | Fire & Forget | Actor | checked |  |  |
| Protection from Poison on Self | Restoration | Apprentice | Fire & Forget | Self | checked |  |  |
| Protection from Poison on Target | Restoration | Apprentice | Fire & Forget | Actor | checked |  | Will be corrected to Adept in R4 |
| Repel Undead (Rank I) | Restoration | Adept | Fire & Forget | Actor,AOE | checked | checked |  |
| Repel Undead (Rank II) | Restoration | Expert | Fire & Forget | Actor,AOE | checked | checked |  |
| Repel Undead (Rank III) | Restoration | Master | Fire & Forget | AOE | checked | checked |  |
| Shalidor's Mirror | Restoration | Master | Concentration | AOE | checked |  | Cannot be discovered via Spell research |
| Sunburst | Restoration | Adept | Fire & Forget | Actor,AOE | checked |  |  |
| Sunfire | Restoration | Apprentice | Fire & Forget | Actor | checked |  |  |
| Sunfire Cloak | Restoration | Adept | Fire & Forget | Self | checked |  |  |
| Turn Undead (Rank I) | Restoration | Apprentice | Fire & Forget | Actor | checked |  |  |
| Turn Undead (Rank II) | Restoration | Adept | Fire & Forget | Actor | checked | checked |  |
| Turn Undead (Rank III) | Restoration | Expert | Fire & Forget | Actor | checked | checked |  |

</div>

---

## Next Steps

- **[Return to Spell Research Cheat Sheet](https://wiki.wildlandermod.com/12Cheat-Sheets/Spell-Research-Cheat-Sheet/)** - Main reference page
- **[Elixir View](https://wiki.wildlandermod.com/12Cheat-Sheets/Elixir View/)** - Find elixir recipes and effects
- **[Effect View](https://wiki.wildlandermod.com/12Cheat-Sheets/Effect View/)** - Find potion effects and their archetypes
