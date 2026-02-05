---
title: Solutions View
layout: default
nav_order: 3
parent: Spell Research Cheat Sheet
description: Potion solutions and their creation paths in Spell Research
---

Shows all potion solutions created in Spell Research. Find which base ingredients produce each solution and what effects they have.

---

## How to Use This Page

**Search** - Find solutions by name, effect, or ingredient
**Filter** - View solutions by archetype (Creatures, Disease, Health, etc.)
**Rank & Effect** - Check solution power level and primary effect

Use the search box below to find solutions and their creation paths.

---

<style>
#solutions-view-tooltip {
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

#solutions-view-tooltip div {
  margin: 4px 0;
}

#solutions-view-tooltip strong {
  color: #f77ef1;
}

.solutions-view-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  setTimeout(initSolutionsViewPage, 300);
});

function initSolutionsViewPage() {
  const table = document.querySelector('.solutions-view-table table');
  if (!table) return;
  
  initSolutionsViewFilters(table);
  initSolutionsViewtooltips(table);
}

function initSolutionsViewFilters(table) {
  const archetypes = new Set();
  const baseIngredients = new Set();
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const archetypeCell = row.querySelector('td:nth-child(4)');
    if (archetypeCell) {
      const archetypesText = archetypeCell.textContent.trim();
      if (archetypesText) {
        archetypesText.split(',').forEach(arch => {
          const cleaned = arch.trim();
          if (cleaned) archetypes.add(cleaned);
        });
      }
    }
    
    const baseIngCell = row.querySelector('td:nth-child(2)');
    if (baseIngCell) {
      const baseIngText = baseIngCell.textContent.trim();
      if (baseIngText) {
        baseIngText.split(',').forEach(ing => {
          const cleaned = ing.trim();
          if (cleaned) baseIngredients.add(cleaned);
        });
      }
    }
  });
  
  const archetypeSelect = document.getElementById('solutionsViewEffectFilter');
  if (archetypeSelect) {
    Array.from(archetypes).sort().forEach(arch => {
      const option = document.createElement('option');
      option.value = arch;
      option.textContent = arch;
      archetypeSelect.appendChild(option);
    });
    archetypeSelect.addEventListener('change', function() { filterSolutionsViewTable(table); });
  }
  
  const ingredientSelect = document.getElementById('solutionsViewBaseIngredientFilter');
  if (ingredientSelect) {
    Array.from(baseIngredients).sort().forEach(ing => {
      const option = document.createElement('option');
      option.value = ing;
      option.textContent = ing;
      ingredientSelect.appendChild(option);
    });
    ingredientSelect.addEventListener('change', function() { filterSolutionsViewTable(table); });
  }
  
  const searchInput = document.getElementById('solutionsViewSearch');
  if (searchInput) {
    searchInput.addEventListener('input', function() { filterSolutionsViewTable(table); });
  }
  
  const clearButton = document.getElementById('solutionsViewClearFilters');
  if (clearButton) {
    clearButton.addEventListener('click', function() { clearSolutionsViewFilters(table); });
  }
  
  filterSolutionsViewTable(table);
}

function initSolutionsViewtooltips(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const solutionCell = row.querySelector('td:first-child');
    if (!solutionCell) return;
    
    solutionCell.style.cursor = 'pointer';
    solutionCell.style.color = '#f77ef1';
    solutionCell.style.fontWeight = '500';
    solutionCell.addEventListener('mouseenter', (e) => showSolutionsViewtooltip(e, row));
    solutionCell.addEventListener('mousemove', updateSolutionsViewtooltipPosition);
    solutionCell.addEventListener('mouseleave', hideSolutionsViewtooltip);
  });
}

function showSolutionsViewtooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const solution = cells[0]?.textContent?.trim() || '';
  const baseIng = cells[1]?.textContent?.trim() || '';
  const effect = cells[2]?.textContent?.trim() || '';
  const archetypes = cells[3]?.textContent?.trim() || '';
  const rank = cells[4]?.textContent?.trim() || '';
  
  let tooltip = document.getElementById('solutions-view-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'solutions-view-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Solution:</strong> ' + solution + '</div>' +
    '<div><strong>Base Ingredient:</strong> ' + baseIng + '</div>' +
    '<div><strong>Primary Effect:</strong> ' + (effect || 'N/A') + '</div>' +
    '<div><strong>Archetypes:</strong> ' + archetypes + '</div>' +
    '<div><strong>Rank:</strong> ' + rank + '</div>';
  
  tooltip.style.display = 'block';
  updateSolutionsViewtooltipPosition(event);
}

function updateSolutionsViewtooltipPosition(event) {
  const tooltip = document.getElementById('solutions-view-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideSolutionsViewtooltip() {
  const tooltip = document.getElementById('solutions-view-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function filterSolutionsViewTable(table) {
  const searchTerm = (document.getElementById('solutionsViewSearch')?.value || '').toLowerCase();
  const archetypeFilter = document.getElementById('solutionsViewEffectFilter')?.value || '';
  const baseIngFilter = document.getElementById('solutionsViewBaseIngredientFilter')?.value || '';
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const solution = (cells[0]?.textContent || '').toLowerCase();
    const baseIng = (cells[1]?.textContent || '').toLowerCase();
    const effect = (cells[2]?.textContent || '').toLowerCase();
    const archetypes = (cells[3]?.textContent || '').toLowerCase();
    const rank = (cells[4]?.textContent || '').toLowerCase();
    
    const searchMatch = solution.includes(searchTerm) || baseIng.includes(searchTerm) || 
                        effect.includes(searchTerm) || archetypes.includes(searchTerm);
    const archetypeMatch = !archetypeFilter || archetypes.includes(archetypeFilter.toLowerCase());
    
    const baseIngList = baseIng.split(',').map(v => v.trim());
    const baseIngMatch = !baseIngFilter || baseIngList.includes(baseIngFilter.toLowerCase());
    
    const isVisible = searchMatch && archetypeMatch && baseIngMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateSolutionsViewFilterCount(visibleCount, rows.length);
}

function updateSolutionsViewFilterCount(visible, total) {
  const counter = document.getElementById('solutionsViewFilterResultCount');
  if (counter) {
    counter.textContent = 'Showing ' + visible + ' of ' + total + ' solutions';
  }
}

function clearSolutionsViewFilters(table) {
  const searchInput = document.getElementById('solutionsViewSearch');
  const archetypeSelect = document.getElementById('solutionsViewEffectFilter');
  const ingredientSelect = document.getElementById('solutionsViewBaseIngredientFilter');
  
  if (searchInput) searchInput.value = '';
  if (archetypeSelect) archetypeSelect.value = '';
  if (ingredientSelect) ingredientSelect.value = '';
  
  filterSolutionsViewTable(table);
}
</script>

<div class="solutions-view-controls">
  <input type="text" id="solutionsViewSearch" placeholder="Search by solution, ingredient, or effect..." />
  <select id="solutionsViewEffectFilter">
    <option value="">All Archetypes</option>
  </select>
  <select id="solutionsViewBaseIngredientFilter">
    <option value="">All Base Ingredients</option>
  </select>
  <button id="solutionsViewClearFilters" onclick="clearSolutionsViewFilters()">Clear Filters</button>
  <div id="solutionsViewFilterResultCount" class="filter-result-count-solutions-view"></div>
</div>

<div class="solutions-view-table" markdown="1">

| Solution | Base Ingredient | Primary Effect | Archetypes | Rank |
|:---|:---|:---|:---|---:|
| Agea Arden sa Haelia   (Resistances) | Ashen Grass Pod,Blue Dartwing,Chicken's Egg,Dragon's Tongue,Fly Amanita,Frost Mirriam,Garlic,Glowing Mushroom,Grass Pod,Lavender,Slaughterfish Egg,Snowberries,Swamp Fungal Pod,Thistle Branch,Tundra Cotton,Yellow Mountain Flower |  | Agea Arden | Haelia |
| Agea sa Haelia   (Magicka) | Creep Cluster,Elves Ear,Hanging Moss,Luna Moth Wing,Mora Tapinella,Namira's Rot,Nordic Barnacle,Red Mountain Flower |  | Agea | Haelia |
| Altadoon ry Bet sa Haelia   (Diseases) | Bone Meal,Charred Skeever Hide,Large Mudcrab Chitin,Namira's Rot,Skeever Tail |  | Altadoon ry Bet | Haelia |
| Arden sa Haelia   (Sheild) | Mudcrab Chitin |  | Arden | Haelia |
| Ayammis sa Haelia   (Life) | Chicken's Egg,Grass Pod,Nordic Barnacle,Pine Thrush Egg,Rock Warbler Egg,Slaughterfish Egg,Wheat |  | Ayammis | Haelia |
| Bal sa Haelia   (Earth) | Bleeding Crown,Blisterwort,Bone Meal,Creep Cluster,Fly Amanita,Giant Lichen,Glowing Mushroom,Imp Stool,Mora Tapinella,Namira's Rot,Salt,Scaly Pholiota,Swamp Fungal Pod,White Cap |  | Bal | Haelia |
| Betaltadoon sa Haelia   (Poisons) | Abecean Longfin,Bleeding Crown,Blisterwort,Blue Butterfly Wing,Bone Meal,Cyrodilic Spadetail,Garlic,Giant Lichen,Grass Pod,Hanging Moss,Imp Stool,Jazbay Grapes,Juniper Berries,Luna Moth Wing,Namira's Rot,Nordic Barnacle,River Betty,Salt,Scaly Pholiota,Scathecraw,Skeever Tail,Slaughterfish Egg,Trama Root,White Cap,Yellow Mountain Flower |  | Betaltadoon | Haelia |
| Betayammis sa Haelia   (Creatures) | Abecean Longfin,Bee,Blue Butterfly Wing,Blue Dartwing,Charred Skeever Hide,Chicken's Egg,Cyrodilic Spadetail,Dragon's Tongue,Giant Lichen,Histcarp,Large Mudcrab Chitin,Luna Moth Wing,Monarch Wing,Mudcrab Chitin,Nordic Barnacle,Orange Dartwing,Pine Thrush Egg,Powdered Mudcrab Chitin,River Betty,Rock Warbler Egg,Silverside Perch,Skeever Tail,Slaughterfish Egg,Torchbug Abdomen |  | Betayammis | Haelia |
| Dunayammis sa Haelia   (Undead) | Bone Meal |  | Dunayammis | Haelia |
| Ghartok sa Haelia   (Stamina) | Bee,Blisterwort,Blue Butterfly Wing,Bone Meal,Charred Skeever Hide,Cyrodilic Spadetail,Histcarp,Mudcrab Chitin,Orange Dartwing,Pine Thrush Egg,Purple Mountain Flower,Silverside Perch,Skeever Tail,Torchbug Abdomen |  | Ghartok | Haelia |
| Karan ry Ayammis sa Haelia  (Health) | Blue Mountain Flower,Imp Stool,Monarch Wing,Powdered Mudcrab Chitin,River Betty,Rock Warbler Egg,Scathecraw,Wheat |  | Karan ry Ayammis | Haelia |
| Karan sa Haelia   (Armor) | Mudcrab Chitin,Nordic Barnacle |  | Karan | Haelia |
| Latta sa Haelia   (Light) | Glowing Mushroom,Luna Moth Wing,Torchbug Abdomen |  | Latta | Haelia |
| Mafre sa Haelia   (Frost) | Abecean Longfin,Frost Mirriam,Snowberries,Thistle Branch,White Cap |  | Mafre | Haelia |
| Malatu Magicka sa Haelia   (Arcane Energy) | Chicken's Egg,Lavender,Tundra Cotton |  | Malatu Magicka | Haelia |
| Mallari sa Haelia   (Metal) | Ingot: Corundum, Ingot: Iron,Ingot: Steel |  | Mallari | Haelia |
| Mer Garlas sa Haelia   (Flesh) | Abecean Longfin,Bee,Blue Butterfly Wing,Blue Dartwing,Bone Meal,Charred Skeever Hide,Cyrodilic Spadetail,Histcarp,Large Mudcrab Chitin,Luna Moth Wing,Monarch Wing,Mudcrab Chitin,Orange Dartwing,Powdered Mudcrab Chitin,River Betty,Silverside Perch,Skeever Tail,Torchbug Abdomen |  | Mer Garlas | Haelia |
| Molag sa Haelia   (Fire) | Ashen Grass Pod,Bleeding Crown,Charred Skeever Hide,Dragon's Tongue,Fly Amanita,Juniper Berries,Snowberries,Torchbug Abdomen |  | Molag | Haelia |
| Mora sa Haelia   (Nature) | Ashen Grass Pod,Bleeding Crown,Blisterwort,Blue Mountain Flower,Chicken's Egg,Creep Cluster,Dragon's Tongue,Elves Ear,Fly Amanita,Frost Mirriam,Garlic,Giant Lichen,Glowing Mushroom,Grass Pod,Hanging Moss,Imp Stool,Jazbay Grapes,Juniper Berries,Lavender,Mora Tapinella,Namira's Rot,Pine Thrush Egg,Purple Mountain Flower,Red Mountain Flower,Scaly Pholiota,Scathecraw,Snowberries,Swamp Fungal Pod,Thistle Branch,Trama Root,Tundra Cotton,Wheat,White Cap,Yellow Mountain Flower |  | Mora | Haelia |
| Relleis sa Haelia  (Water) | Abecean Longfin,Blue Mountain Flower,Creep Cluster,Cyrodilic Spadetail,Dragon's Tongue,Elves Ear,Frost Mirriam,Garlic,Giant Lichen,Hanging Moss,Histcarp,Juniper Berries,Large Mudcrab Chitin,Lavender,Mudcrab Chitin,Nordic Barnacle,Powdered Mudcrab Chitin,Purple Mountain Flower,Red Mountain Flower,River Betty,Rock Warbler Egg,Salt,Silverside Perch,Slaughterfish Egg,Snowberries,Swamp Fungal Pod,Thistle Branch,Tundra Cotton,Wheat |  | Relleis | Haelia |
| Rellers ry Molag sa Haelia   (Acid) | Creep Cluster,Salt |  | Rellers ry Molag | Haelia |
| Wel sa Belle sa Haelia   (Shock) | Blue Dartwing,Giant Lichen,Glowing Mushroom,Swamp Fungal Pod,Trama Root |  | Wel sa Belle | Haelia |
| Wel sa Haelia   (Air) | Bee,Blue Butterfly Wing,Blue Dartwing,Luna Moth Wing,Monarch Wing,Orange Dartwing,Torchbug Abdomen |  | Wel | Haelia |
| Agea Arden sa Goria   (Resistances) | Beehive Husk,Gleamblossom,Ice Wraith Essence,Pearl,Small Pearl,Troll Fat | Boar Tusk,Charred Skeever Hide,Chaurus Eggs,Giant Lichen,Ice Wraith Teeth,Pine Thrush Egg,Polished Fox Eye,Polished Slaughterfish Scales,Torchbug Abdomen | Agea Arden | Goria |
| Agea sa Goria   (Magicka) | Bear Tooth,Flawless Sabre Cat Tooth,Moon Sugar,Sabre Cat Claws | Flawless Sabre Cat Tooth,Red Mountain Flower | Agea | Goria |
| Altadoon ry Bet sa Goria   (Diseases) | Dyed Hawk Feathers,Hawk Feathers,Panacea | Dragon Heart | Altadoon ry Bet | Goria |
| Altadoon sa Goria   (Weapons) | Bear Claws,Buck Antlers,Doe Antlers,Hawk Beak,Polished Hare Eye,Polished Werewolf Eye,Powdered Mammoth Tusk,Sabre Cat Tooth |  | Altadoon | Goria |
| Ayammis Malata sa Goria   (Souls) | Ice Wraith Teeth |  | Ayammis Malata | Goria |
| Ayammis sa Goria   (Life) | Bear Eye,Chaurus Eggs,Spider Egg | Blisterwort,Boar Tusk,Charred Skeever Hide,Northern Flax,Sabre Cat Eye | Ayammis | Goria |
| Bal sa Goria   (Earth) | Beehive Husk,Bonesap,Dwarven Oil,Moon Sugar,Pearl,Red Glitterdust,Sapphire Glitterdust,Slaughterfish Scales,Small Pearl |  | Bal | Goria |
| Betaltadoon sa Goria   (Poisons) | Bear Heart,Beehive Husk,Boiled Skeever Tail,Buck Antlers (Superlative),Canine Tooth,Canis Root,Chaurus Eggs,Chaurus Hunter Antennae,Deathbell,Doe Antlers,Doe Antlers (Superlative),Dwarven Oil,Falmer Ear,Flawless Bear Tooth,Flawless Sabre Cat Tooth,Goat Heart,Heart,Human Flesh,Ice Wraith Teeth,Large Bear Claws,Large Sabre Cat Claws,Moon Moon Sugar,Moon Sugar,Nightshade,Oil of Vitriol,Polished Werewolf Eye,Spider Egg,Troll Fat,Troll Heart,Wolf Claws | Blisterwort,Chaurus Eggs,Doe Antlers,Flawless Bear Tooth,Human Flesh,Large Sabre Cat Claws,Oil of Vitriol,Polished Slaughterfish Scales,Powdered Mudcrab Chitin,Wolf Heart | Betaltadoon | Goria |
| Betayammis sa Goria   (Creatures) | Animal Fat,Ash Hopper Jelly,Bear Claws,Bear Eye,Bear Heart,Bear Tooth,Beehive Husk,Boar Eye,Boar Heart,Boar Tusk,Boiled Skeever Tail,Buck Antlers,Buck Antlers (Superlative),Bull Horn,Canine Tooth,Chaurus Eggs,Chaurus Hunter Antennae,Cured Skeever Hide,Deer Heart,Doe Antlers,Doe Antlers (Superlative),Dyed Hawk Feathers,Felsaad Tern Feathers,Flawless Bear Tooth,Flawless Sabre Cat Tooth,Fox Eye,Goat Heart,Hare Eye,Hawk Beak,Hawk Feathers,Ice Wraith Teeth,Large Bear Claws,Large Sabre Cat Claws,Mammoth Eye,Polished Bear Eye,Polished Boar Eye,Polished Fox Eye,Polished Hare Eye,Polished Sabre Cat Eye,Polished Slaughterfish Scales,Polished Troll Eye,Polished Werewolf Eye,Polished Wolf Eye,Powdered Mammoth Tusk,Sabre Cat Claws,Sabre Cat Eye,Sabre Cat Heart,Sabre Cat Tooth,Salmon Roe,Spider Egg,Troll Eye,Troll Fat,Troll Heart,Werewolf Eye,Werewolf Heart,Wolf Claws,Wolf Eye,Wolf Heart |  | Betayammis | Goria |
| Ghartok sa Goria   (Stamina) | Bear Claws,Boar Eye,Boar Tusk,Buck Antlers,Buck Antlers (Superlative),Canis Root,Chaurus Hunter Antennae,Flawless Bear Tooth,Hare Eye,Hawk Beak,Large Bear Claws,Pearl,Polished Bear Eye,Powdered Mammoth Tusk,Sabre Cat Eye,Sabre Cat Tooth,Salmon Roe,Slaughterfish Scales,Small Pearl,Spider Egg | Blisterwort,Flawless Bear Tooth,Torchbug Abdomen | Ghartok | Goria |
| Karan Kogo sa Goria   (Force) | Dwarven Oil | Canine Tooth,Chaurus Eggs,Doe Antlers,Flawless Bear Tooth,Fox Eye,Giant Lichen,Ice Wraith Teeth,Rock Warbler Egg,Torchbug Abdomen | Karan Kogo | Goria |
| Karan ry Ayammis sa Goria   (Health) | Ash Hopper Jelly,Boiled Skeever Tail,Canine Tooth,Charred Hawk Beak,Cured Skeever Hide,Deathbell,Doe Antlers (Superlative),Falmer Ear,Felsaad Tern Feathers,Heart,Human Flesh,Large Sabre Cat Claws,Mammoth Eye,Nightshade,Oil of Vitriol,Polished Boar Eye,Polished Troll Eye,Troll Eye,Wolf Claws | Canine Tooth,Imp Stool,Oil of Vitriol,Powdered Mudcrab Chitin,Scathecraw,Swamp Fungal Pod,Wolf Eye | Karan ry Ayammis | Goria |
| Karan sa Goria   (Armor) | Buck Antlers,Doe Antlers,Hawk Feathers,Pearl,Polished Slaughterfish Scales,Powdered Mammoth Tusk,Slaughterfish Scales,Small Pearl |  | Karan | Goria |
| Latta Loria sa Goria   (Shadow) |  | Glassfish | Latta Loria | Goria |
| Latta sa Goria   (Light) | Chaurus Eggs,Gleamblossom,Polished Sabre Cat Eye,Sabre Cat Eye |  | Latta | Goria |
| Mafre sa Goria   (Frost) | Ice Wraith Essence,Ice Wraith Teeth |  | Mafre | Goria |
| Malatu Magicka sa Goria   (Arcane Energy) | Gleamblossom,Ice Wraith Essence | Charred Skeever Hide,Dragon Heart,Glassfish,Human Flesh,Northern Flax,Pine Thrush Egg,Polished Fox Eye,Polished Slaughterfish Scales,Purple Mountain Flower,Rock Warbler Egg,Sabre Cat Eye,Swamp Fungal Pod,Torchbug Abdomen | Malatu Magicka | Goria |
| Mallari sa Goria  (Metal) | Dwarven Oil,Ingot: Moonstone,Ingot: Silver |  | Mallari | Goria |
| Mer Ayammis sa Goria   (Mortals) | Falmer Ear,Heart,Human Flesh,Polished Werewolf Eye,Werewolf Eye,Werewolf Heart |  | Mer Ayammis | Goria |
| Mer Garlas sa Goria   (Flesh) | Animal Fat,Bear Eye,Bear Heart,Boar Eye,Boar Heart,Boiled Skeever Tail,Bull Horn,Cured Skeever Hide,Deer Heart,Falmer Ear,Fox Eye,Goat Heart,Hare Eye,Hawk Beak,Hawk Feathers,Heart,Human Flesh,Mammoth Eye,Polished Bear Eye,Polished Boar Eye,Polished Fox Eye,Polished Hare Eye,Polished Sabre Cat Eye,Polished Troll Eye,Polished Werewolf Eye,Polished Wolf Eye,Sabre Cat Eye,Sabre Cat Heart,Troll Eye,Troll Fat,Troll Heart,Werewolf Eye,Werewolf Heart,Wolf Eye,Wolf Heart |  | Mer Garlas | Goria |
| Molag sa Goria   (Fire) | Charred Hawk Beak,Moon Sugar |  | Molag | Goria |
| Mora sa Goria   (Nature) | Canis Root,Chaurus Eggs,Deathbell,Gleamblossom,Moon Moon Sugar,Moon Sugar,Nightshade,Panacea |  | Mora | Goria |
| Relleis sa Goria   (Water) | Animal Fat,Canis Root,Deathbell,Falmer Ear,Nightshade,Pearl,Polished Slaughterfish Scales,Sabre Cat Eye,Salmon Roe,Slaughterfish Scales,Small Pearl,Spider Egg | Charred Skeever Hide,Polished Slaughterfish Scales | Relleis | Goria |
| Rellers ry Molag sa Goria   (Acid) | Oil of Vitriol | Scathecraw | Rellers ry Molag | Goria |
| Volen Magicka sa Goria   (Magical Constructs) | Ice Wraith Teeth |  | Volen Magicka | Goria |
| Wel sa Goria   (Air) | Dyed Hawk Feathers,Felsaad Tern Feathers,Hawk Beak,Hawk Feathers,Mammoth Eye,Polished Slaughterfish Scales,Powdered Mammoth Tusk |  | Wel | Goria |
| Agea Arden sa Gravia   (Resistances) | Hagraven Claw | Abecean Longfin,Ash Hopper Jelly,Ashen Grass Pod,Bleeding Crown,Deer Heart,Elves Ear,Goldfish,Jon's Giant Abecean Longfin,Lavender,Mudcrab Chitin,Polished Bear Eye,Sabre Cat Claws,Sabre Cat Tooth,Slaughterfish Egg,Snowberries,Thistle Branch,Tundra Cotton | Agea Arden | Gravia |
| Agea sa Gravia   (Magicka) | Briar Heart,Crimson Nirnroot,Ectoplasm,Glow Dust,Hagraven Feathers,Nirnroot,Spriggan Sap,Taproot | Bear Tooth,Ectoplasm,Grass Pod,Sabre Cat Heart,White Cap | Agea | Gravia |
| Altadoon ry Bet sa Gravia   (Diseases) | Berit's Ashes,Vampire Dust |  | Altadoon ry Bet | Gravia |
| Altadoon sa Gravia   (Weapons) | Hagraven Claw |  | Altadoon | Gravia |
| Ayammis Malata sa Gravia   (Souls) | Ectoplasm,Glow Dust,Strange Remains,Wisp Wrappings |  | Ayammis Malata | Gravia |
| Ayammis sa Gravia   (Life) | Spriggan Sap,Taproot | Blue Dartwing,Blue Mountain Flower,Cyrodilic Spadetail,Panacea,Pearl,Powdered Mammoth Tusk,Sabre Cat Claws,Small Pearl | Ayammis | Gravia |
| Bal sa Gravia   (Earth) | Berit's Ashes,Fire Salts,Frost Salts,Void Salts |  | Bal | Gravia |
| Betaltadoon sa Gravia   (Poisons) | Ancestor Moth Wing,Emperor Parasol Moss,Fire Salts,Frost Salts,Giant's Toe,Glow Dust,Hagraven Feathers,Mammoth Heart,Nirnroot,Spawn Ash,Spriggan Sap,Taproot,Void Salts | Boiled Skeever Tail,Deer Heart,Falmer Ear,Hagraven Feathers,Troll Fat | Betaltadoon | Gravia |
| Betayammis sa Gravia   (Creatures) | Ancestor Moth Wing,Daedra Heart,Giant's Toe,Hagraven Claw,Hagraven Feathers,Mammoth Heart,Polished Mammoth Eye |  | Betayammis | Gravia |
| Dunayammis sa Gravia   (Undead) | Berit's Ashes,Briar Heart,Ectoplasm,Glow Dust,Spawn Ash,Vampire Dust |  | Dunayammis | Gravia |
| Ghartok sa Gravia   (Stamina) | Ancestor Moth Wing,Giant's Toe,Spawn Ash,Wisp Wrappings | Berit's Ashes,Bone Meal,Sabre Cat Tooth | Ghartok | Gravia |
| Karan Kogo sa Gravia   (Force) | Hagraven Claw,Vampire Dust | Abecean Longfin,Ash Hopper Jelly,Bear Tooth,Bleeding Crown,Ectoplasm,Hagraven Claw,Hagraven Feathers,Jon's Giant Abecean Longfin,Lavender,Polished Hare Eye,Sabre Cat Claws,Sabre Cat Tooth,Small Pearl,Tundra Cotton,White Cap | Karan Kogo | Gravia |
| Karan ry Ayammis sa Gravia   (Health) | Crimson Nirnroot,Daedra Heart,Emperor Parasol Moss,Nirnroot,Poisonous Bloom,Polished Mammoth Eye | Blue Mountain Flower | Karan ry Ayammis | Gravia |
| Karan sa Gravia   (Armor) | Hagraven Feathers,Wisp Wrappings |  | Karan | Gravia |
| Latta sa Gravia   (Light) | Crimson Nirnroot,Glow Dust,Nirnroot,Strange Remains,Vampire Dust,Wisp Wrappings |  | Latta | Gravia |
| Mafre sa Gravia   (Frost) | Fire Salts,Frost Salts,Wisp Wrappings |  | Mafre | Gravia |
| Malatu Magicka sa Gravia   (Arcane Energy) | Briar Heart,Crimson Nirnroot,Fire Salts,Frost Salts,Glow Dust,Hagraven Claw,Hagraven Feathers,Nirnroot,Void Salts,Wisp Wrappings | Ash Hopper Jelly,Bear Tooth,Berit's Ashes,Blue Dartwing,Blue Mountain Flower,Bone Meal,Ectoplasm,Elves Ear,Goldfish,Grass Pod,Hagraven Claw,Lavender,Mudcrab Chitin,Panacea,Pearl,Polished Werewolf Eye,Sabre Cat Claws,Small Pearl,Snowberries,Spawn Ash,Strange Remains,Thistle Branch | Malatu Magicka | Gravia |
| Mallari sa Gravia   (Metal) | Ingot: Ebony,Ingot: Gold,Ingot: Malachite,Ingot: Quicksilver | Polished Hare Eye | Mallari | Gravia |
| Mer Ayammis sa Gravia   (Mortals) | Briar Heart,Ectoplasm,Giant's Toe,Hagraven Claw,Hagraven Feathers,Vampire Dust |  | Mer Ayammis | Gravia |
| Mer Garlas sa Gravia   (Flesh) | Berit's Ashes,Briar Heart,Daedra Heart,Giant's Toe,Hagraven Feathers,Mammoth Heart,Polished Mammoth Eye,Vampire Dust |  | Mer Garlas | Gravia |
| Mer ry Wel sa Gravia   (Apparitions) | Ectoplasm,Glow Dust,Wisp Wrappings |  | Mer ry Wel | Gravia |
| Molag sa Gravia   (Fire) | Burnt Spriggan Wood,Fire Salts,Frost Salts,Spawn Ash |  | Molag | Gravia |
| Mora sa Gravia   (Nature) | Crimson Nirnroot,Emperor Parasol Moss,Nirnroot,Spriggan Sap,Taproot |  | Mora | Gravia |
| Pellenni Ayammis sa Gravia   (Daedra) | Daedra Heart,Fire Salts,Frost Salts,Void Salts |  | Pellenni Ayammis | Gravia |
| Relleis sa Gravia   (Water) | Daedra Heart | Falmer Ear,Troll Fat | Relleis | Gravia |
| Rellers ry Molag sa Gravia   (Acid) |  | Spawn Ash | Rellers ry Molag | Gravia |
| Volen Magicka sa Gravia   (Magical Constructs) | Briar Heart,Glow Dust,Hagraven Claw,Hagraven Feathers,Spriggan Sap,Taproot,Wisp Wrappings |  | Volen Magicka | Gravia |
| Wel sa Belle sa Gravia   (Shock) | Void Salts |  | Wel sa Belle | Gravia |
| Wel sa Gravia   (Air) | Ancestor Moth Wing,Hagraven Feathers,Mammoth Heart,Polished Mammoth Eye |  | Wel | Gravia |
| Agea Arden sa Baune   (Resistances) |  | Boar Eye,Felsaad Tern Feathers,Glowing Mushroom,Jazbay Grapes,Large Mudcrab Chitin,Sapphire Glitterdust | Agea Arden | Baune |
| Agea sa Baune   (Magicka) |  | Briar Heart,Jazbay Grapes | Agea | Baune |
| Altadoon sa Baune   (Weapons) |  | Canis Root | Altadoon | Baune |
| Betaltadoon sa Baune   (Poisons) |  | Animal Fat,Canis Root,Charred Hawk Beak,Sapphire Glitterdust,Werewolf Heart | Betaltadoon | Baune |
| Ghartok sa Baune   (Stamina) |  | Honeycomb,Large Bear Claws | Ghartok | Baune |
| Karan Kogo sa Baune   (Force) |  | Beehive Husk,Briar Heart,Dragon's Tongue,Felsaad Tern Feathers,Glowing Mushroom,Jazbay Grapes,Large Mudcrab Chitin,Polished Dragon Eye | Karan Kogo | Baune |
| Karan ry Ayammis sa Baune   (Health) |  | Bear Eye,Werewolf Heart | Karan ry Ayammis | Baune |
| Karan sa Baune   (Armor) |  | Honeycomb,Slaughterfish Scales | Karan | Baune |
| Malatu Magicka sa Baune   (Arcane Energy) |  | Beehive Husk,Briar Heart,Dragon's Tongue,Felsaad Tern Feathers,Glowing Mushroom | Malatu Magicka | Baune |
| Mallari sa Baune   (Metal) |  | Canis Root | Mallari | Baune |
| Relleis sa Baune   (Water) |  | Animal Fat,Sapphire Glitterdust | Relleis | Baune |
| Agea Arden sa Adonai   (Resistances) |  | Angler Larvae,Bee,Bull Horn,Dwarven Oil,Emperor Parasol Moss,Gleamblossom,Hare Eye,Hawk Beak,Moon Sugar,Nordic Barnacle,Taproot | Agea Arden | Adonai |
| Agea sa Adonai   (Magicka) |  | Dwarven Oil,Moon Sugar,Taproot | Agea | Adonai |
| Altadoon sa Adonai   (Weapons) | Jon's Giant Abecean Longfin |  | Altadoon | Adonai |
| Ayammis sa Adonai   (Life) |  | Bear Heart,Bull Horn | Ayammis | Adonai |
| Betaltadoon sa Adonai   (Poisons) |  | Bear Heart,Nirnroot | Betaltadoon | Adonai |
| Betayammis sa Adonai   (Creatures) | Jon's Giant Abecean Longfin |  | Betayammis | Adonai |
| Ghartok sa Adonai   (Stamina) |  | Bee | Ghartok | Adonai |
| Karan Kogo sa Adonai   (Force) | Jon's Giant Abecean Longfin | Angler Larvae,Bee,Bull Horn,Dwarven Oil,Emperor Parasol Moss,Gleamblossom,Hare Eye,Moon Sugar,Mora Tapinella,Taproot,Wisp Wrappings | Karan Kogo | Adonai |
| Karan ry Ayammis sa Adonai   (Health) |  | Emperor Parasol Moss | Karan ry Ayammis | Adonai |
| Malatu Magicka sa Adonai   (Arcane Energy) |  | Dwarven Oil,Gleamblossom,Hawk Beak,Moon Sugar,Mora Tapinella,Nirnroot,Pearlfish,Taproot,Wisp Wrappings | Malatu Magicka | Adonai |
| Mer Garlas sa Adonai   (Flesh) | Jon's Giant Abecean Longfin |  | Mer Garlas | Adonai |
| Relleis sa Adonai   (Water) | Jon's Giant Abecean Longfin |  | Relleis | Adonai |
| Wel sa Adonai   (Air) |  | Nordic Barnacle | Wel  | Adonai |
| Agea Arden sa Sila (Resistances) |  | Mammoth Heart,Polished Boar Eye,Polished Mammoth Eye,Polished Troll Eye,Salmon Roe,Salt,Scaly Pholiota,Void Salts,Yellow Mountain Flower | Agea Arden | Sila |
| Agea sa Sila (Magicka) |  | Ancestor Moth Wing,Chaurus Hunter Antennae,Fire Salts,Glow Dust,Hanging Moss,Heart,Pygmy Sunfish,Salmon Roe | Agea | Sila |
| Altadoon ry Bet sa Sila (Diseases) |  | Doe Antlers (Superlative) | Altadoon ry Bet | Sila |
| Ayammis sa Sila (Life) |  | Cured Skeever Hide,Daedra Heart,Polished Troll Eye,Wheat | Ayammis | Sila |
| Betaltadoon sa Sila (Poisons) |  | Ancestor Moth Wing,Blue Butterfly Wing,Boar Heart,Chaurus Hunter Antennae,Crimson Nirnroot,Giant's Toe,Glow Dust,Hanging Moss,Heart,Nightshade,Red Glitterdust,Yellow Mountain Flower | Betaltadoon | Sila |
| Betayammis sa Sila   (Creatures) | Dragon Bone,Dragon Eye,Dragon Heart,Dragon Scale,Polished Dragon Eye |  | Betayammis | Sila |
| Ghartok sa Sila (Stamina) |  | Bear Claws,Buck Antlers,Dyed Hawk Feathers,Giant's Toe,Histcarp,Silverside Perch,Troll Heart | Ghartok | Sila |
| Karan Kogo sa Sila (Force) |  | Ancestor Moth Wing,Bear Claws,Bonesap,Buck Antlers,Burnt Spriggan Wood,Chaurus Hunter Antennae,Creep Cluster,Deathbell,Fire Salts,Frost Salts,Poisonous Bloom,Polished Mammoth Eye,Salmon Roe,Troll Heart,Wolf Claws | Karan Kogo | Sila |
| Karan ry Ayammis sa Sila (Health) |  | Cured Skeever Hide,Daedra Heart,Wheat | Karan ry Ayammis | Sila |
| Malatu Magicka sa Sila (Arcane Energy) |  | Crimson Nirnroot,Cured Skeever Hide,Daedra Heart,Fire Salts,Frost Salts,Polished Troll Eye,Pygmy Sunfish,Salt,Scaly Pholiota,Silverside Perch,Spriggan Sap,Yellow Mountain Flower | Malatu Magicka | Sila |
| Mer Garlas sa Sila   (Flesh) | Dragon Eye,Dragon Heart,Polished Dragon Eye |  | Mer Garlas | Sila |
| Wel sa Sila   (Air) | Dragon Bone,Dragon Scale | Angelfish | Wel | Sila |

</div>

---

## Next Steps

- **[Return to Spell Research Cheat Sheet](https://wiki.wildlandermod.com/12Cheat-Sheets/Spell-Research-Cheat-Sheet/)** - Main reference page
- **[Effect View](https://wiki.wildlandermod.com/12Cheat-Sheets/Effect View/)** - See potion effects and their archetypes
- **[Ingredient View](https://wiki.wildlandermod.com/12Cheat-Sheets/Ingredient View/)** - Find what solutions you can make from ingredients
