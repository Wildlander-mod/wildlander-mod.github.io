---
title: Ingredient View
layout: default
nav_order: 2
parent: Spell Research Cheat Sheet
description: Ingredients and their solutions in Spell Research
---

Shows all ingredients used in Spell Research and the solutions they create. Find what solutions you can make from each ingredient.

---

## How to Use This Page

**Search** - Find ingredients by name or effects
**Filter** - View solutions by ingredient type or value
**Weight & Value** - Check ingredient properties at a glance

Use the search box below to find ingredients and their base solutions.

---

<style>
#ingredient-view-tooltip {
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

#ingredient-view-tooltip div {
  margin: 4px 0;
}

#ingredient-view-tooltip strong {
  color: #f77ef1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  setTimeout(initIngredientViewPage, 300);
});

function initIngredientViewPage() {
  const table = document.querySelector('.ingredient-view-table table');
  if (!table) return;
  
  initIngredientViewFilters(table);
  initIngredientViewtooltips(table);
}

function initIngredientViewFilters(table) {
  const searchInput = document.getElementById('ingredientViewSearch');
  const clearButton = document.getElementById('ingredientViewClearFilters');
  
  if (searchInput) {
    searchInput.addEventListener('input', function() { filterIngredientViewTable(table); });
  }
  
  if (clearButton) {
    clearButton.addEventListener('click', function() { clearIngredientViewFilters(table); });
  }
  
  filterIngredientViewTable(table);
}

function initIngredientViewtooltips(table) {
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const ingredientCell = row.querySelector('td:first-child');
    if (!ingredientCell) return;
    
    ingredientCell.style.cursor = 'pointer';
    ingredientCell.style.color = '#f77ef1';
    ingredientCell.style.fontWeight = '500';
    ingredientCell.addEventListener('mouseenter', (e) => showIngredientViewtooltip(e, row));
    ingredientCell.addEventListener('mousemove', updateIngredientViewtooltipPosition);
    ingredientCell.addEventListener('mouseleave', hideIngredientViewtooltip);
  });
}

function showIngredientViewtooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const name = cells[0]?.textContent?.trim() || '';
  const weight = cells[1]?.textContent?.trim() || '';
  const baseSolutions = cells[2]?.textContent?.trim() || '';
  const value = cells[3]?.textContent?.trim() || '';
  const effects = cells[4]?.textContent?.trim() || '';
  
  let tooltip = document.getElementById('ingredient-view-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'ingredient-view-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>Ingredient:</strong> ' + name + '</div>' +
    '<div><strong>Weight:</strong> ' + weight + '</div>' +
    '<div><strong>Base Solutions:</strong> ' + baseSolutions + '</div>' +
    '<div><strong>Value:</strong> ' + value + '</div>' +
    '<div><strong>Effects:</strong> ' + effects + '</div>';
  
  tooltip.style.display = 'block';
  updateIngredientViewtooltipPosition(event);
}

function updateIngredientViewtooltipPosition(event) {
  const tooltip = document.getElementById('ingredient-view-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideIngredientViewtooltip() {
  const tooltip = document.getElementById('ingredient-view-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function filterIngredientViewTable(table) {
  const searchTerm = (document.getElementById('ingredientViewSearch')?.value || '').toLowerCase();
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const name = (cells[0]?.textContent || '').toLowerCase();
    const weight = (cells[1]?.textContent || '').toLowerCase();
    const baseSolutions = (cells[2]?.textContent || '').toLowerCase();
    const value = (cells[3]?.textContent || '').toLowerCase();
    const effects = (cells[4]?.textContent || '').toLowerCase();
    
    const searchMatch = name.includes(searchTerm) || weight.includes(searchTerm) || 
                        baseSolutions.includes(searchTerm) || value.includes(searchTerm) || 
                        effects.includes(searchTerm);
    
    row.style.display = searchMatch ? '' : 'none';
    if (searchMatch) visibleCount++;
  });
  
  updateIngredientViewFilterCount(visibleCount, rows.length);
}

function updateIngredientViewFilterCount(visible, total) {
  const counter = document.getElementById('ingredientViewFilterResultCount');
  if (counter) {
    counter.textContent = 'Showing ' + visible + ' of ' + total + ' ingredients';
  }
}

function clearIngredientViewFilters(table) {
  const searchInput = document.getElementById('ingredientViewSearch');
  if (searchInput) searchInput.value = '';
  
  filterIngredientViewTable(table);
}

function updateIngredientViewFilterCount(visible, total) {
  const counter = document.getElementById('ingredientViewFilterResultCount');
  if (counter) {
    counter.textContent = `Showing ${visible} of ${total} ingredients`;
  }
}

function clearIngredientViewFilters() {
  document.getElementById('ingredientViewSearch').value = '';
  filterIngredientViewTable();
}
</script>

<div class="ingredient-view-controls">
  <input type="text" id="ingredientViewSearch" placeholder="Search by name, effects, or solutions..." />
  <button id="ingredientViewClearFilters" onclick="clearIngredientViewFilters()">Clear Filters</button>
  <div id="ingredientViewFilterResultCount" class="filter-result-count-ingredient-view"></div>
</div>

<div class="ingredient-view-table" markdown="1">

| Ingredient | Weight | Base Solutions | Value | Effects |
|:---|---:|:---|---:|:---|
| Abecean Longfin | 0.50 | Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Mafre sa Haelia   (Frost),Betaltadoon sa Haelia   (Poisons),Relleis sa Haelia  (Water) | 15 | Karan Kogo sa Gravia   (Force),Agea Arden sa Gravia   (Resistances) |
| Ancestor Moth Wing | 0.10 | Wel sa Gravia   (Air),Betayammis sa Gravia   (Creatures),Betaltadoon sa Gravia   (Poisons),Ghartok sa Gravia   (Stamina) | 2 | Karan Kogo sa Sila (Force),Agea sa Sila (Magicka),Betaltadoon sa Sila (Poisons) |
| Angelfish | 0.25 |  | 48 | Wel sa Sila   (Air) |
| Angler Larvae | 0.25 |  | 65 | Karan Kogo sa Adonai   (Force),Agea Arden sa Adonai   (Resistances) |
| Animal Fat | 0.50 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Relleis sa Goria   (Water) | 25 | Betaltadoon sa Baune   (Poisons),Relleis sa Baune   (Water) |
| Ash Creep Cluster | 0.25 |  | 5 |  |
| Ash Hopper Jelly | 0.25 | Betayammis sa Goria   (Creatures),Karan ry Ayammis sa Goria   (Health) | 10 | Malatu Magicka sa Gravia   (Arcane Energy),Karan Kogo sa Gravia   (Force),Agea Arden sa Gravia   (Resistances) |
| Ashen Grass Pod | 0.10 | Molag sa Haelia   (Fire),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances) | 7 | Agea Arden sa Gravia   (Resistances) |
| Bear Claws | 0.10 | Betayammis sa Goria   (Creatures),Ghartok sa Goria   (Stamina),Altadoon sa Goria   (Weapons) | 35 | Karan Kogo sa Sila (Force),Ghartok sa Sila (Stamina) |
| Bear Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Ayammis sa Goria   (Life) | 15 | Karan ry Ayammis sa Baune   (Health) |
| Bear Heart | 1.75 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Betaltadoon sa Goria   (Poisons) | 40 | Ayammis sa Adonai   (Life),Betaltadoon sa Adonai   (Poisons) |
| Bear Tooth | 0.10 | Betayammis sa Goria   (Creatures),Agea sa Goria   (Magicka) | 17 | Malatu Magicka sa Gravia   (Arcane Energy),Karan Kogo sa Gravia   (Force),Agea sa Gravia   (Magicka) |
| Bee | 0.05 | Wel sa Haelia   (Air),Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Ghartok sa Haelia   (Stamina) | 3 | Karan Kogo sa Adonai   (Force),Agea Arden sa Adonai   (Resistances),Ghartok sa Adonai   (Stamina) |
| Beehive Husk | 1.00 | Betayammis sa Goria   (Creatures),Bal sa Goria   (Earth),Betaltadoon sa Goria   (Poisons),Agea Arden sa Goria   (Resistances) | 5 | Malatu Magicka sa Baune   (Arcane Energy),Karan Kogo sa Baune   (Force) |
| Berit's Ashes | 0.20 | Altadoon ry Bet sa Gravia   (Diseases),Bal sa Gravia   (Earth),Mer Garlas sa Gravia   (Flesh),Dunayammis sa Gravia   (Undead) | 5 | Malatu Magicka sa Gravia   (Arcane Energy),Ghartok sa Gravia   (Stamina) |
| Bleeding Crown | 0.30 | Bal sa Haelia   (Earth),Molag sa Haelia   (Fire),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons) | 10 | Karan Kogo sa Gravia   (Force),Agea Arden sa Gravia   (Resistances) |
| Blisterwort | 0.20 | Bal sa Haelia   (Earth),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Ghartok sa Haelia   (Stamina) | 12 | Ayammis sa Goria   (Life),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina) |
| Blue Butterfly Wing | 0.01 | Wel sa Haelia   (Air),Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Betaltadoon sa Haelia   (Poisons),Ghartok sa Haelia   (Stamina) | 2 | Betaltadoon sa Sila (Poisons) |
| Blue Dartwing | 0.03 | Wel sa Haelia   (Air),Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Agea Arden sa Haelia   (Resistances),Wel sa Belle sa Haelia   (Shock) | 1 | Malatu Magicka sa Gravia   (Arcane Energy),Ayammis sa Gravia   (Life) |
| Blue Mountain Flower | 0.10 | Karan ry Ayammis sa Haelia  (Health),Mora sa Haelia   (Nature),Relleis sa Haelia  (Water) | 1 | Malatu Magicka sa Gravia   (Arcane Energy),Karan ry Ayammis sa Gravia   (Health),Ayammis sa Gravia   (Life) |
| Boar Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Ghartok sa Goria   (Stamina) | 31 | Agea Arden sa Baune   (Resistances) |
| Boar Heart | 2.00 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 42 | Betaltadoon sa Sila (Poisons) |
| Boar Tusk | 0.50 | Betayammis sa Goria   (Creatures),Ghartok sa Goria   (Stamina) | 5 | Ayammis sa Goria   (Life),Agea Arden sa Goria   (Resistances) |
| Boiled Skeever Tail | 0.20 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) | 23 | Betaltadoon sa Gravia   (Poisons) |
| Bone Meal | 0.50 | Altadoon ry Bet sa Haelia   (Diseases),Bal sa Haelia   (Earth),Mer Garlas sa Haelia   (Flesh),Betaltadoon sa Haelia   (Poisons),Ghartok sa Haelia   (Stamina),Dunayammis sa Haelia   (Undead) | 5 | Malatu Magicka sa Gravia   (Arcane Energy),Ghartok sa Gravia   (Stamina) |
| Bonesap | 0.20 | Bal sa Goria   (Earth) | 33 | Karan Kogo sa Sila (Force) |
| Briar Heart | 0.50 | Malatu Magicka sa Gravia   (Arcane Energy),Volen Magicka sa Gravia   (Magical Constructs),Mer Garlas sa Gravia   (Flesh),Mer Ayammis sa Gravia   (Mortals),Agea sa Gravia   (Magicka),Dunayammis sa Gravia   (Undead) | 100 | Malatu Magicka sa Baune   (Arcane Energy),Karan Kogo sa Baune   (Force),Agea sa Baune   (Magicka) |
| Buck Antlers | 2.00 | Karan sa Goria   (Armor),Betayammis sa Goria   (Creatures),Ghartok sa Goria   (Stamina),Altadoon sa Goria   (Weapons) | 25 | Karan Kogo sa Sila (Force),Ghartok sa Sila (Stamina) |
| Buck Antlers (Superlative) | 2.00 | Betayammis sa Goria   (Creatures),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina) | 38 |  |
| Bull Horn | 3.00 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 21 | Karan Kogo sa Adonai   (Force),Ayammis sa Adonai   (Life),Agea Arden sa Adonai   (Resistances) |
| Burnt Spriggan Wood | 0.50 | Molag sa Gravia   (Fire) | 24 | Karan Kogo sa Sila (Force) |
| Canine Tooth | 0.10 | Betayammis sa Goria   (Creatures),Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) | 8 | Karan Kogo sa Goria   (Force),Karan ry Ayammis sa Goria   (Health) |
| Canis Root | 0.10 | Mora sa Goria   (Nature),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina),Relleis sa Goria   (Water) | 15 | Mallari sa Baune   (Metal),Betaltadoon sa Baune   (Poisons),Altadoon sa Baune   (Weapons) |
| Charred Hawk Beak | 0.25 | Molag sa Goria   (Fire),Karan ry Ayammis sa Goria   (Health) | 45 | Betaltadoon sa Baune   (Poisons) |
| Charred Skeever Hide | 0.50 | Betayammis sa Haelia   (Creatures),Altadoon ry Bet sa Haelia   (Diseases),Molag sa Haelia   (Fire),Mer Garlas sa Haelia   (Flesh),Ghartok sa Haelia   (Stamina) | 1 | Malatu Magicka sa Goria   (Arcane Energy),Ayammis sa Goria   (Life),Agea Arden sa Goria   (Resistances),Relleis sa Goria   (Water) |
| Chaurus Eggs | 0.20 | Betayammis sa Goria   (Creatures),Ayammis sa Goria   (Life),Latta sa Goria   (Light),Mora sa Goria   (Nature),Betaltadoon sa Goria   (Poisons) | 10 | Karan Kogo sa Goria   (Force),Betaltadoon sa Goria   (Poisons),Agea Arden sa Goria   (Resistances) |
| Chaurus Hunter Antennae | 0.10 | Betayammis sa Goria   (Creatures),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina) | 54 | Karan Kogo sa Sila (Force),Agea sa Sila (Magicka),Betaltadoon sa Sila (Poisons) |
| Chicken's Egg | 0.50 | Malatu Magicka sa Haelia   (Arcane Energy),Betayammis sa Haelia   (Creatures),Ayammis sa Haelia   (Life),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances) | 2 |  |
| Creep Cluster | 0.20 | Rellers ry Molag sa Haelia   (Acid),Bal sa Haelia   (Earth),Agea sa Haelia   (Magicka),Mora sa Haelia   (Nature),Relleis sa Haelia  (Water) | 1 | Karan Kogo sa Sila (Force) |
| Crimson Nirnroot | 0.20 | Malatu Magicka sa Gravia   (Arcane Energy),Karan ry Ayammis sa Gravia   (Health),Latta sa Gravia   (Light),Agea sa Gravia   (Magicka),Mora sa Gravia   (Nature) | 350 | Malatu Magicka sa Sila (Arcane Energy),Betaltadoon sa Sila (Poisons) |
| Cured Skeever Hide | 0.50 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health) | 13 | Malatu Magicka sa Sila (Arcane Energy),Karan ry Ayammis sa Sila (Health),Ayammis sa Sila (Life) |
| Cyrodilic Spadetail | 0.25 | Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Betaltadoon sa Haelia   (Poisons),Ghartok sa Haelia   (Stamina),Relleis sa Haelia  (Water) | 15 | Ayammis sa Gravia   (Life) |
| Daedra Heart | 1.00 | Betayammis sa Gravia   (Creatures),Pellenni Ayammis sa Gravia   (Daedra),Mer Garlas sa Gravia   (Flesh),Karan ry Ayammis sa Gravia   (Health),Relleis sa Gravia   (Water) | 1500 | Malatu Magicka sa Sila (Arcane Energy),Karan ry Ayammis sa Sila (Health),Ayammis sa Sila (Life) |
| Deathbell | 0.10 | Karan ry Ayammis sa Goria   (Health),Mora sa Goria   (Nature),Betaltadoon sa Goria   (Poisons),Relleis sa Goria   (Water) | 4 | Karan Kogo sa Sila (Force) |
| Deer Heart | 1.00 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 19 | Betaltadoon sa Gravia   (Poisons),Agea Arden sa Gravia   (Resistances) |
| Doe Antlers | 1.50 | Karan sa Goria   (Armor),Betayammis sa Goria   (Creatures),Betaltadoon sa Goria   (Poisons),Altadoon sa Goria   (Weapons) | 15 | Karan Kogo sa Goria   (Force),Betaltadoon sa Goria   (Poisons) |
| Doe Antlers (Superlative) | 1.50 | Betayammis sa Goria   (Creatures),Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) | 30 | Altadoon ry Bet sa Sila (Diseases) |
| Dragon Eye | 0.10 | Betayammis sa Sila   (Creatures),Mer Garlas sa Sila   (Flesh) | 169 |  |
| Dragon Heart | 5.00 | Betayammis sa Sila   (Creatures),Mer Garlas sa Sila   (Flesh) | 218 | Malatu Magicka sa Goria   (Arcane Energy),Altadoon ry Bet sa Goria   (Diseases) |
| Dragon's Tongue | 0.10 | Betayammis sa Haelia   (Creatures),Molag sa Haelia   (Fire),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 5 | Malatu Magicka sa Baune   (Arcane Energy),Karan Kogo sa Baune   (Force) |
| Dwarven Oil | 0.25 | Bal sa Goria   (Earth),Karan Kogo sa Goria   (Force),Mallari sa Goria  (Metal),Betaltadoon sa Goria   (Poisons) | 38 | Malatu Magicka sa Adonai   (Arcane Energy),Karan Kogo sa Adonai   (Force),Agea sa Adonai   (Magicka),Agea Arden sa Adonai   (Resistances) |
| Dyed Hawk Feathers | 0.10 | Wel sa Goria   (Air),Betayammis sa Goria   (Creatures),Altadoon ry Bet sa Goria   (Diseases) | 39 | Ghartok sa Sila (Stamina) |
| Ectoplasm | 0.10 | Mer ry Wel sa Gravia   (Apparitions),Mer Ayammis sa Gravia   (Mortals),Agea sa Gravia   (Magicka),Ayammis Malata sa Gravia   (Souls),Dunayammis sa Gravia   (Undead) | 13 | Malatu Magicka sa Gravia   (Arcane Energy),Karan Kogo sa Gravia   (Force),Agea sa Gravia   (Magicka) |
| Elves Ear | 0.10 | Agea sa Haelia   (Magicka),Mora sa Haelia   (Nature),Relleis sa Haelia  (Water) | 10 | Malatu Magicka sa Gravia   (Arcane Energy),Agea Arden sa Gravia   (Resistances) |
| Emperor Parasol Moss | 0.25 | Karan ry Ayammis sa Gravia   (Health),Mora sa Gravia   (Nature),Betaltadoon sa Gravia   (Poisons) | 9 | Karan Kogo sa Adonai   (Force),Karan ry Ayammis sa Adonai   (Health),Agea Arden sa Adonai   (Resistances) |
| Falmer Ear | 0.20 | Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health),Mer Ayammis sa Goria   (Mortals),Betaltadoon sa Goria   (Poisons),Relleis sa Goria   (Water) | 10 | Betaltadoon sa Gravia   (Poisons),Relleis sa Gravia   (Water) |
| Felsaad Tern Feathers | 0.10 | Wel sa Goria   (Air),Betayammis sa Goria   (Creatures),Karan ry Ayammis sa Goria   (Health) | 11 | Malatu Magicka sa Baune   (Arcane Energy),Karan Kogo sa Baune   (Force),Agea Arden sa Baune   (Resistances) |
| Fire Salts | 0.25 | Malatu Magicka sa Gravia   (Arcane Energy),Pellenni Ayammis sa Gravia   (Daedra),Bal sa Gravia   (Earth),Molag sa Gravia   (Fire),Mafre sa Gravia   (Frost),Betaltadoon sa Gravia   (Poisons) | 250 | Malatu Magicka sa Sila (Arcane Energy),Karan Kogo sa Sila (Force),Agea sa Sila (Magicka) |
| Flawless Bear Tooth | 0.10 | Betayammis sa Goria   (Creatures),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina) | 53 | Karan Kogo sa Goria   (Force),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina) |
| Flawless Sabre Cat Tooth | 0.10 | Betayammis sa Goria   (Creatures),Agea sa Goria   (Magicka),Betaltadoon sa Goria   (Poisons) | 55 | Agea sa Goria   (Magicka) |
| Fly Amanita | 0.10 | Bal sa Haelia   (Earth),Molag sa Haelia   (Fire),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances) | 2 |  |
| Fox Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 4 | Karan Kogo sa Goria   (Force) |
| Frost Mirriam | 0.10 | Mafre sa Haelia   (Frost),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 1 |  |
| Frost Salts | 0.25 | Malatu Magicka sa Gravia   (Arcane Energy),Pellenni Ayammis sa Gravia   (Daedra),Bal sa Gravia   (Earth),Molag sa Gravia   (Fire),Mafre sa Gravia   (Frost),Betaltadoon sa Gravia   (Poisons) | 217 | Malatu Magicka sa Sila (Arcane Energy),Karan Kogo sa Sila (Force) |
| Garlic | 0.25 | Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 10 |  |
| Giant Lichen | 0.25 | Betayammis sa Haelia   (Creatures),Bal sa Haelia   (Earth),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Wel sa Belle sa Haelia   (Shock),Relleis sa Haelia  (Water) | 5 | Karan Kogo sa Goria   (Force),Agea Arden sa Goria   (Resistances) |
| Giant's Toe | 1.00 | Betayammis sa Gravia   (Creatures),Mer Garlas sa Gravia   (Flesh),Mer Ayammis sa Gravia   (Mortals),Betaltadoon sa Gravia   (Poisons),Ghartok sa Gravia   (Stamina) | 20 | Betaltadoon sa Sila (Poisons),Ghartok sa Sila (Stamina) |
| Glassfish | 0.25 |  | 30 | Malatu Magicka sa Goria   (Arcane Energy),Latta Loria sa Goria   (Shadow) |
| Gleamblossom | 0.10 | Malatu Magicka sa Goria   (Arcane Energy),Latta sa Goria   (Light),Mora sa Goria   (Nature),Agea Arden sa Goria   (Resistances) | 5 | Malatu Magicka sa Adonai   (Arcane Energy),Karan Kogo sa Adonai   (Force),Agea Arden sa Adonai   (Resistances) |
| Glow Dust | 0.50 | Mer ry Wel sa Gravia   (Apparitions),Malatu Magicka sa Gravia   (Arcane Energy),Volen Magicka sa Gravia   (Magical Constructs),Latta sa Gravia   (Light),Agea sa Gravia   (Magicka),Betaltadoon sa Gravia   (Poisons),Ayammis Malata sa Gravia   (Souls),Dunayammis sa Gravia   (Undead) | 25 | Agea sa Sila (Magicka),Betaltadoon sa Sila (Poisons) |
| Glowing Mushroom | 0.20 | Bal sa Haelia   (Earth),Latta sa Haelia   (Light),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Wel sa Belle sa Haelia   (Shock) | 5 | Malatu Magicka sa Baune   (Arcane Energy),Karan Kogo sa Baune   (Force),Agea Arden sa Baune   (Resistances) |
| Goat Heart | 0.50 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Betaltadoon sa Goria   (Poisons) | 19 |  |
| Goldfish | 0.25 |  | 24 | Malatu Magicka sa Gravia   (Arcane Energy),Agea Arden sa Gravia   (Resistances) |
| Grass Pod | 0.10 | Ayammis sa Haelia   (Life),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Agea Arden sa Haelia   (Resistances) | 1 | Malatu Magicka sa Gravia   (Arcane Energy),Agea sa Gravia   (Magicka) |
| Hagraven Claw | 0.25 | Malatu Magicka sa Gravia   (Arcane Energy),Volen Magicka sa Gravia   (Magical Constructs),Betayammis sa Gravia   (Creatures),Karan Kogo sa Gravia   (Force),Mer Ayammis sa Gravia   (Mortals),Agea Arden sa Gravia   (Resistances),Altadoon sa Gravia   (Weapons) | 20 | Malatu Magicka sa Gravia   (Arcane Energy),Karan Kogo sa Gravia   (Force) |
| Hagraven Feathers | 0.10 | Wel sa Gravia   (Air),Malatu Magicka sa Gravia   (Arcane Energy),Karan sa Gravia   (Armor),Volen Magicka sa Gravia   (Magical Constructs),Betayammis sa Gravia   (Creatures),Mer Garlas sa Gravia   (Flesh),Mer Ayammis sa Gravia   (Mortals),Agea sa Gravia   (Magicka),Betaltadoon sa Gravia   (Poisons) | 20 | Karan Kogo sa Gravia   (Force),Betaltadoon sa Gravia   (Poisons) |
| Hanging Moss | 0.25 | Agea sa Haelia   (Magicka),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Relleis sa Haelia  (Water) | 1 | Agea sa Sila (Magicka),Betaltadoon sa Sila (Poisons) |
| Hare Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Ghartok sa Goria   (Stamina) | 8 | Karan Kogo sa Adonai   (Force),Agea Arden sa Adonai   (Resistances) |
| Hawk Beak | 0.25 | Wel sa Goria   (Air),Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Ghartok sa Goria   (Stamina),Altadoon sa Goria   (Weapons) | 15 | Malatu Magicka sa Adonai   (Arcane Energy),Agea Arden sa Adonai   (Resistances) |
| Hawk Feathers | 0.10 | Wel sa Goria   (Air),Karan sa Goria   (Armor),Betayammis sa Goria   (Creatures),Altadoon ry Bet sa Goria   (Diseases),Mer Garlas sa Goria   (Flesh) | 15 |  |
| Heart | 1.00 | Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health),Mer Ayammis sa Goria   (Mortals),Betaltadoon sa Goria   (Poisons) | 77 | Agea sa Sila (Magicka),Betaltadoon sa Sila (Poisons) |
| Histcarp | 0.25 | Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Ghartok sa Haelia   (Stamina),Relleis sa Haelia  (Water) | 6 | Ghartok sa Sila (Stamina) |
| Honeycomb | 0.20 |  | 12 | Karan sa Baune   (Armor),Ghartok sa Baune   (Stamina) |
| Human Flesh | 0.25 | Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health),Mer Ayammis sa Goria   (Mortals),Betaltadoon sa Goria   (Poisons) | 25 | Malatu Magicka sa Goria   (Arcane Energy),Betaltadoon sa Goria   (Poisons) |
| Ice Wraith Teeth | 0.25 | Volen Magicka sa Goria   (Magical Constructs),Betayammis sa Goria   (Creatures),Mafre sa Goria   (Frost),Betaltadoon sa Goria   (Poisons),Ayammis Malata sa Goria   (Souls) | 30 | Karan Kogo sa Goria   (Force),Agea Arden sa Goria   (Resistances) |
| Imp Stool | 0.30 | Bal sa Haelia   (Earth),Karan ry Ayammis sa Haelia  (Health),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons) | 12 | Karan ry Ayammis sa Goria   (Health) |
| Jazbay Grapes | 0.10 | Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons) | 1 | Karan Kogo sa Baune   (Force),Agea sa Baune   (Magicka),Agea Arden sa Baune   (Resistances) |
| Jon's Giant Abecean Longfin | 30.00 | Betayammis sa Adonai   (Creatures),Mer Garlas sa Adonai   (Flesh),Karan Kogo sa Adonai   (Force),Relleis sa Adonai   (Water),Altadoon sa Adonai   (Weapons) | 15 | Karan Kogo sa Gravia   (Force),Agea Arden sa Gravia   (Resistances) |
| Juniper Berries | 0.10 | Molag sa Haelia   (Fire),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Relleis sa Haelia  (Water) | 1 |  |
| Juvenile Mudcrab | 0.25 |  | 73 |  |
| Large Bear Claws | 0.20 | Betayammis sa Goria   (Creatures),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina) | 22 | Ghartok sa Baune   (Stamina) |
| Large Mudcrab Chitin | 2.00 | Betayammis sa Haelia   (Creatures),Altadoon ry Bet sa Haelia   (Diseases),Mer Garlas sa Haelia   (Flesh),Relleis sa Haelia  (Water) | 29 | Karan Kogo sa Baune   (Force),Agea Arden sa Baune   (Resistances) |
| Large Sabre Cat Claws | 0.20 | Betayammis sa Goria   (Creatures),Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) | 17 | Betaltadoon sa Goria   (Poisons) |
| Lavender | 0.10 | Malatu Magicka sa Haelia   (Arcane Energy),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 5 | Malatu Magicka sa Gravia   (Arcane Energy),Karan Kogo sa Gravia   (Force),Agea Arden sa Gravia   (Resistances) |
| Luna Moth Wing | 0.01 | Wel sa Haelia   (Air),Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Latta sa Haelia   (Light),Agea sa Haelia   (Magicka),Betaltadoon sa Haelia   (Poisons) | 5 |  |
| Lyretail Anthias | 0.25 |  | 38 |  |
| Mammoth Eye | 0.20 | Wel sa Goria   (Air),Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health) | 44 |  |
| Mammoth Heart | 5.00 | Wel sa Gravia   (Air),Betayammis sa Gravia   (Creatures),Mer Garlas sa Gravia   (Flesh),Betaltadoon sa Gravia   (Poisons) | 258 | Agea Arden sa Sila (Resistances) |
| Monarch Wing | 0.01 | Wel sa Haelia   (Air),Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Karan ry Ayammis sa Haelia  (Health) | 3 |  |
| Moon Moon Sugar | 0.25 | Mora sa Goria   (Nature),Betaltadoon sa Goria   (Poisons) | 1004 |  |
| Moon Sugar | 0.25 | Bal sa Goria   (Earth),Molag sa Goria   (Fire),Agea sa Goria   (Magicka),Mora sa Goria   (Nature),Betaltadoon sa Goria   (Poisons) | 45 | Malatu Magicka sa Adonai   (Arcane Energy),Karan Kogo sa Adonai   (Force),Agea sa Adonai   (Magicka),Agea Arden sa Adonai   (Resistances) |
| Mora Tapinella | 0.25 | Bal sa Haelia   (Earth),Agea sa Haelia   (Magicka),Mora sa Haelia   (Nature) | 4 | Malatu Magicka sa Adonai   (Arcane Energy),Karan Kogo sa Adonai   (Force) |
| Mudcrab Chitin | 0.50 | Karan sa Haelia   (Armor),Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Arden sa Haelia   (Sheild),Ghartok sa Haelia   (Stamina),Relleis sa Haelia  (Water) | 7 | Malatu Magicka sa Gravia   (Arcane Energy),Agea Arden sa Gravia   (Resistances) |
| Namira's Rot | 0.25 | Altadoon ry Bet sa Haelia   (Diseases),Bal sa Haelia   (Earth),Agea sa Haelia   (Magicka),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons) | 12 |  |
| Netch Jelly | 0.50 |  | 38 |  |
| Nightshade | 0.10 | Karan ry Ayammis sa Goria   (Health),Mora sa Goria   (Nature),Betaltadoon sa Goria   (Poisons),Relleis sa Goria   (Water) | 8 | Betaltadoon sa Sila (Poisons) |
| Nirnroot | 0.20 | Malatu Magicka sa Gravia   (Arcane Energy),Karan ry Ayammis sa Gravia   (Health),Latta sa Gravia   (Light),Agea sa Gravia   (Magicka),Mora sa Gravia   (Nature),Betaltadoon sa Gravia   (Poisons) | 100 | Malatu Magicka sa Adonai   (Arcane Energy),Betaltadoon sa Adonai   (Poisons) |
| Nordic Barnacle | 0.20 | Karan sa Haelia   (Armor),Betayammis sa Haelia   (Creatures),Ayammis sa Haelia   (Life),Agea sa Haelia   (Magicka),Betaltadoon sa Haelia   (Poisons),Relleis sa Haelia  (Water) | 5 | Wel sa Adonai   (Air),Agea Arden sa Adonai   (Resistances) |
| Northern Flax | 0.20 |  | 1 | Malatu Magicka sa Goria   (Arcane Energy),Ayammis sa Goria   (Life) |
| Oil of Vitriol | 0.50 | Rellers ry Molag sa Goria   (Acid),Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) | 15 | Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) |
| Orange Dartwing | 0.03 | Wel sa Haelia   (Air),Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Ghartok sa Haelia   (Stamina) | 1 |  |
| Panacea | 0.50 | Altadoon ry Bet sa Goria   (Diseases),Mora sa Goria   (Nature) | 12 | Malatu Magicka sa Gravia   (Arcane Energy),Ayammis sa Gravia   (Life) |
| Pearl | 0.10 | Karan sa Goria   (Armor),Bal sa Goria   (Earth),Agea Arden sa Goria   (Resistances),Ghartok sa Goria   (Stamina),Relleis sa Goria   (Water) | 16 | Malatu Magicka sa Gravia   (Arcane Energy),Ayammis sa Gravia   (Life) |
| Pearlfish | 0.25 |  | 24 | Malatu Magicka sa Adonai   (Arcane Energy) |
| Pine Thrush Egg | 0.50 | Betayammis sa Haelia   (Creatures),Ayammis sa Haelia   (Life),Mora sa Haelia   (Nature),Ghartok sa Haelia   (Stamina) | 2 | Malatu Magicka sa Goria   (Arcane Energy),Agea Arden sa Goria   (Resistances) |
| Poisonous Bloom | 0.25 | Karan ry Ayammis sa Gravia   (Health) | 5 | Karan Kogo sa Sila (Force) |
| Polished Bear Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Ghartok sa Goria   (Stamina) | 21 | Agea Arden sa Gravia   (Resistances) |
| Polished Boar Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health) | 51 | Agea Arden sa Sila (Resistances) |
| Polished Dragon Eye | 0.10 | Betayammis sa Sila   (Creatures),Mer Garlas sa Sila   (Flesh) | 220 | Karan Kogo sa Baune   (Force) |
| Polished Fox Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 9 | Malatu Magicka sa Goria   (Arcane Energy),Agea Arden sa Goria   (Resistances) |
| Polished Hare Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Altadoon sa Goria   (Weapons) | 22 | Karan Kogo sa Gravia   (Force),Mallari sa Gravia   (Metal) |
| Polished Mammoth Eye | 0.20 | Wel sa Gravia   (Air),Betayammis sa Gravia   (Creatures),Mer Garlas sa Gravia   (Flesh),Karan ry Ayammis sa Gravia   (Health) | 35 | Karan Kogo sa Sila (Force),Agea Arden sa Sila (Resistances) |
| Polished Sabre Cat Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Latta sa Goria   (Light) | 34 |  |
| Polished Slaughterfish Scales | 0.10 | Wel sa Goria   (Air),Karan sa Goria   (Armor),Betayammis sa Goria   (Creatures),Relleis sa Goria   (Water) | 29 | Malatu Magicka sa Goria   (Arcane Energy),Betaltadoon sa Goria   (Poisons),Agea Arden sa Goria   (Resistances),Relleis sa Goria   (Water) |
| Polished Troll Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health) | 42 | Malatu Magicka sa Sila (Arcane Energy),Ayammis sa Sila (Life),Agea Arden sa Sila (Resistances) |
| Polished Werewolf Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Mer Ayammis sa Goria   (Mortals),Betaltadoon sa Goria   (Poisons),Altadoon sa Goria   (Weapons) | 55 | Malatu Magicka sa Gravia   (Arcane Energy) |
| Polished Wolf Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 14 |  |
| Powdered Mammoth Tusk | 0.10 | Wel sa Goria   (Air),Karan sa Goria   (Armor),Betayammis sa Goria   (Creatures),Ghartok sa Goria   (Stamina),Altadoon sa Goria   (Weapons) | 25 | Ayammis sa Gravia   (Life) |
| Powdered Mudcrab Chitin | 0.10 | Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Karan ry Ayammis sa Haelia  (Health),Relleis sa Haelia  (Water) | 18 | Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) |
| Purple Mountain Flower | 0.10 | Mora sa Haelia   (Nature),Ghartok sa Haelia   (Stamina),Relleis sa Haelia  (Water) | 1 | Malatu Magicka sa Goria   (Arcane Energy) |
| Pygmy Sunfish | 0.25 |  | 34 | Malatu Magicka sa Sila (Arcane Energy),Agea sa Sila (Magicka) |
| Red Glitterdust | 0.30 | Bal sa Goria   (Earth) | 78 | Betaltadoon sa Sila (Poisons) |
| Red Mountain Flower | 0.10 | Agea sa Haelia   (Magicka),Mora sa Haelia   (Nature),Relleis sa Haelia  (Water) | 1 | Agea sa Goria   (Magicka) |
| River Betty | 0.25 | Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Karan ry Ayammis sa Haelia  (Health),Betaltadoon sa Haelia   (Poisons),Relleis sa Haelia  (Water) | 15 |  |
| Rock Warbler Egg | 0.50 | Betayammis sa Haelia   (Creatures),Karan ry Ayammis sa Haelia  (Health),Ayammis sa Haelia   (Life),Relleis sa Haelia  (Water) | 2 | Malatu Magicka sa Goria   (Arcane Energy),Karan Kogo sa Goria   (Force) |
| Sabre Cat Claws | 0.10 | Betayammis sa Goria   (Creatures),Agea sa Goria   (Magicka) | 11 | Malatu Magicka sa Gravia   (Arcane Energy),Karan Kogo sa Gravia   (Force),Ayammis sa Gravia   (Life),Agea Arden sa Gravia   (Resistances) |
| Sabre Cat Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Latta sa Goria   (Light),Ghartok sa Goria   (Stamina),Relleis sa Goria   (Water) | 12 | Malatu Magicka sa Goria   (Arcane Energy),Ayammis sa Goria   (Life) |
| Sabre Cat Heart | 1.00 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 35 | Agea sa Gravia   (Magicka) |
| Sabre Cat Tooth | 0.10 | Betayammis sa Goria   (Creatures),Ghartok sa Goria   (Stamina),Altadoon sa Goria   (Weapons) | 28 | Karan Kogo sa Gravia   (Force),Agea Arden sa Gravia   (Resistances),Ghartok sa Gravia   (Stamina) |
| Salmon Roe | 0.20 | Betayammis sa Goria   (Creatures),Ghartok sa Goria   (Stamina),Relleis sa Goria   (Water) | 2 | Karan Kogo sa Sila (Force),Agea sa Sila (Magicka),Agea Arden sa Sila (Resistances) |
| Salt | 0.20 | Rellers ry Molag sa Haelia   (Acid),Bal sa Haelia   (Earth),Betaltadoon sa Haelia   (Poisons),Relleis sa Haelia  (Water) | 5 | Malatu Magicka sa Sila (Arcane Energy),Agea Arden sa Sila (Resistances) |
| Sapphire Glitterdust | 0.30 | Bal sa Goria   (Earth) | 106 | Betaltadoon sa Baune   (Poisons),Agea Arden sa Baune   (Resistances),Relleis sa Baune   (Water) |
| Scaly Pholiota | 0.25 | Bal sa Haelia   (Earth),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons) | 4 | Malatu Magicka sa Sila (Arcane Energy),Agea Arden sa Sila (Resistances) |
| Scathecraw | 0.10 | Karan ry Ayammis sa Haelia  (Health),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons) | 8 | Rellers ry Molag sa Goria   (Acid),Karan ry Ayammis sa Goria   (Health) |
| Silverside Perch | 0.25 | Betayammis sa Haelia   (Creatures),Mer Garlas sa Haelia   (Flesh),Ghartok sa Haelia   (Stamina),Relleis sa Haelia  (Water) | 15 | Malatu Magicka sa Sila (Arcane Energy),Ghartok sa Sila (Stamina) |
| Skeever Tail | 0.20 | Betayammis sa Haelia   (Creatures),Altadoon ry Bet sa Haelia   (Diseases),Mer Garlas sa Haelia   (Flesh),Betaltadoon sa Haelia   (Poisons),Ghartok sa Haelia   (Stamina) | 3 |  |
| Slaughterfish Egg | 0.20 | Betayammis sa Haelia   (Creatures),Ayammis sa Haelia   (Life),Betaltadoon sa Haelia   (Poisons),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 3 | Agea Arden sa Gravia   (Resistances) |
| Slaughterfish Scales | 0.10 | Karan sa Goria   (Armor),Bal sa Goria   (Earth),Ghartok sa Goria   (Stamina),Relleis sa Goria   (Water) | 3 | Karan sa Baune   (Armor) |
| Small Pearl | 0.10 | Karan sa Goria   (Armor),Bal sa Goria   (Earth),Agea Arden sa Goria   (Resistances),Ghartok sa Goria   (Stamina),Relleis sa Goria   (Water) | 16 | Malatu Magicka sa Gravia   (Arcane Energy),Karan Kogo sa Gravia   (Force),Ayammis sa Gravia   (Life) |
| Snowberries | 0.10 | Molag sa Haelia   (Fire),Mafre sa Haelia   (Frost),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 1 | Malatu Magicka sa Gravia   (Arcane Energy),Agea Arden sa Gravia   (Resistances) |
| Spadefish | 0.25 |  | 49 |  |
| Spawn Ash | 0.10 | Molag sa Gravia   (Fire),Betaltadoon sa Gravia   (Poisons),Ghartok sa Gravia   (Stamina),Dunayammis sa Gravia   (Undead) | 13 | Rellers ry Molag sa Gravia   (Acid),Malatu Magicka sa Gravia   (Arcane Energy) |
| Spider Egg | 0.20 | Betayammis sa Goria   (Creatures),Ayammis sa Goria   (Life),Betaltadoon sa Goria   (Poisons),Ghartok sa Goria   (Stamina),Relleis sa Goria   (Water) | 5 |  |
| Spriggan Sap | 0.20 | Volen Magicka sa Gravia   (Magical Constructs),Ayammis sa Gravia   (Life),Agea sa Gravia   (Magicka),Mora sa Gravia   (Nature),Betaltadoon sa Gravia   (Poisons) | 50 | Malatu Magicka sa Sila (Arcane Energy) |
| Strange Remains | 0.75 | Latta sa Gravia   (Light),Ayammis Malata sa Gravia   (Souls) | 774 | Malatu Magicka sa Gravia   (Arcane Energy) |
| Swamp Fungal Pod | 0.25 | Bal sa Haelia   (Earth),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Wel sa Belle sa Haelia   (Shock),Relleis sa Haelia  (Water) | 5 | Malatu Magicka sa Goria   (Arcane Energy),Karan ry Ayammis sa Goria   (Health) |
| Taproot | 0.50 | Volen Magicka sa Gravia   (Magical Constructs),Ayammis sa Gravia   (Life),Agea sa Gravia   (Magicka),Mora sa Gravia   (Nature),Betaltadoon sa Gravia   (Poisons) | 15 | Malatu Magicka sa Adonai   (Arcane Energy),Karan Kogo sa Adonai   (Force),Agea sa Adonai   (Magicka),Agea Arden sa Adonai   (Resistances) |
| Thistle Branch | 0.10 | Mafre sa Haelia   (Frost),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 1 | Malatu Magicka sa Gravia   (Arcane Energy),Agea Arden sa Gravia   (Resistances) |
| Torchbug Abdomen | 0.04 | Wel sa Haelia   (Air),Betayammis sa Haelia   (Creatures),Molag sa Haelia   (Fire),Mer Garlas sa Haelia   (Flesh),Latta sa Haelia   (Light),Ghartok sa Haelia   (Stamina) | 1 | Malatu Magicka sa Goria   (Arcane Energy),Karan Kogo sa Goria   (Force),Agea Arden sa Goria   (Resistances),Ghartok sa Goria   (Stamina) |
| Trama Root | 0.20 | Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Wel sa Belle sa Haelia   (Shock) | 7 |  |
| Troll Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Karan ry Ayammis sa Goria   (Health) | 29 |  |
| Troll Fat | 1.00 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Betaltadoon sa Goria   (Poisons),Agea Arden sa Goria   (Resistances) | 25 | Betaltadoon sa Gravia   (Poisons),Relleis sa Gravia   (Water) |
| Troll Heart | 2.00 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Betaltadoon sa Goria   (Poisons) | 101 | Karan Kogo sa Sila (Force),Ghartok sa Sila (Stamina) |
| Tundra Cotton | 0.10 | Malatu Magicka sa Haelia   (Arcane Energy),Mora sa Haelia   (Nature),Agea Arden sa Haelia   (Resistances),Relleis sa Haelia  (Water) | 1 | Karan Kogo sa Gravia   (Force),Agea Arden sa Gravia   (Resistances) |
| Vampire Dust | 0.20 | Altadoon ry Bet sa Gravia   (Diseases),Mer Garlas sa Gravia   (Flesh),Karan Kogo sa Gravia   (Force),Mer Ayammis sa Gravia   (Mortals),Latta sa Gravia   (Light),Dunayammis sa Gravia   (Undead) | 318 |  |
| Void Salts | 0.20 | Malatu Magicka sa Gravia   (Arcane Energy),Pellenni Ayammis sa Gravia   (Daedra),Bal sa Gravia   (Earth),Betaltadoon sa Gravia   (Poisons),Wel sa Belle sa Gravia   (Shock) | 500 | Agea Arden sa Sila (Resistances) |
| Werewolf Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Mer Ayammis sa Goria   (Mortals) | 33 |  |
| Werewolf Heart | 0.50 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh),Mer Ayammis sa Goria   (Mortals) | 42 | Karan ry Ayammis sa Baune   (Health),Betaltadoon sa Baune   (Poisons) |
| Wheat | 0.10 | Karan ry Ayammis sa Haelia  (Health),Ayammis sa Haelia   (Life),Mora sa Haelia   (Nature),Relleis sa Haelia  (Water) | 1 | Karan ry Ayammis sa Sila (Health),Ayammis sa Sila (Life) |
| White Cap | 0.30 | Bal sa Haelia   (Earth),Mafre sa Haelia   (Frost),Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons) | 12 | Karan Kogo sa Gravia   (Force),Agea sa Gravia   (Magicka) |
| Wisp Wrappings | 0.10 | Mer ry Wel sa Gravia   (Apparitions),Malatu Magicka sa Gravia   (Arcane Energy),Karan sa Gravia   (Armor),Volen Magicka sa Gravia   (Magical Constructs),Mafre sa Gravia   (Frost),Latta sa Gravia   (Light),Ayammis Malata sa Gravia   (Souls),Ghartok sa Gravia   (Stamina) | 30 | Malatu Magicka sa Adonai   (Arcane Energy),Karan Kogo sa Adonai   (Force) |
| Wolf Claws | 0.10 | Betayammis sa Goria   (Creatures),Karan ry Ayammis sa Goria   (Health),Betaltadoon sa Goria   (Poisons) | 8 | Karan Kogo sa Sila (Force) |
| Wolf Eye | 0.10 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 5 | Karan ry Ayammis sa Goria   (Health) |
| Wolf Heart | 0.75 | Betayammis sa Goria   (Creatures),Mer Garlas sa Goria   (Flesh) | 39 | Betaltadoon sa Goria   (Poisons) |
| Yellow Mountain Flower | 0.10 | Mora sa Haelia   (Nature),Betaltadoon sa Haelia   (Poisons),Agea Arden sa Haelia   (Resistances) | 1 | Malatu Magicka sa Sila (Arcane Energy),Betaltadoon sa Sila (Poisons),Agea Arden sa Sila (Resistances) |

</div>

---

## Next Steps

- **[Return to Spell Research Cheat Sheet](https://wiki.wildlandermod.com/12Cheat-Sheets/Spell-Research-Cheat-Sheet/)** - Main reference page
- **[Effect View](https://wiki.wildlandermod.com/12Cheat-Sheets/Effect View/)** - See potion effects and their archetypes
- **[Solutions View](https://wiki.wildlandermod.com/12Cheat-Sheets/Solutions-View/)** - Find which ingredients produce specific solutions
