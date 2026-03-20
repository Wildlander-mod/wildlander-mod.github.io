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

.ingredient-view-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
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
| Abecean Longfin | 0.50 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Frost (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Water (Diluted) | 15 | Alchemical Solution of Force (Mild),Alchemical Solution of Resistances (Mild) |
| Ancestor Moth Wing | 0.10 | Alchemical Solution of Air (Mild),Alchemical Solution of Creatures (Mild),Alchemical Solution of Poisons (Mild),Alchemical Solution of Stamina (Mild) | 2 | Alchemical Solution of Force (Concentrated),Alchemical Solution of Magicka (Concentrated),Alchemical Solution of Poisons (Concentrated) |
| Angelfish | 0.25 |  | 48 | Alchemical Solution of Air (Concentrated) |
| Angler Larvae | 0.25 |  | 65 | Alchemical Solution of Force (Potent),Alchemical Solution of Resistances (Potent) |
| Animal Fat | 0.50 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Water (Weak) | 25 | Alchemical Solution of Poisons (Strong),Alchemical Solution of Water (Strong) |
| Ash Creep Cluster | 0.25 |  | 5 |  |
| Ash Hopper Jelly | 0.25 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Health (Weak) | 10 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Resistances (Mild) |
| Ashen Grass Pod | 0.10 | Alchemical Solution of Fire (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted) | 7 | Alchemical Solution of Resistances (Mild) |
| Bear Claws | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Weapons (Weak) | 35 | Alchemical Solution of Force (Concentrated),Alchemical Solution of Stamina (Concentrated) |
| Bear Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Life (Weak) | 15 | Alchemical Solution of Health (Strong) |
| Bear Heart | 1.75 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Poisons (Weak) | 40 | Alchemical Solution of Life (Potent),Alchemical Solution of Poisons (Potent) |
| Bear Tooth | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Magicka (Weak) | 17 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Magicka (Mild) |
| Bee | 0.05 | Alchemical Solution of Air (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Stamina (Diluted) | 3 | Alchemical Solution of Force (Potent),Alchemical Solution of Resistances (Potent),Alchemical Solution of Stamina (Potent) |
| Beehive Husk | 1.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Earth (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Resistances (Weak) | 5 | Alchemical Solution of Arcane Energy (Strong),Alchemical Solution of Force (Strong) |
| Berit's Ashes | 0.20 | Alchemical Solution of Diseases (Mild),Alchemical Solution of Earth (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Undead (Mild) | 5 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Stamina (Mild) |
| Bleeding Crown | 0.30 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Fire (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted) | 10 | Alchemical Solution of Force (Mild),Alchemical Solution of Resistances (Mild) |
| Blisterwort | 0.20 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Stamina (Diluted) | 12 | Alchemical Solution of Life (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak) |
| Blue Butterfly Wing | 0.01 | Alchemical Solution of Air (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Stamina (Diluted) | 2 | Alchemical Solution of Poisons (Concentrated) |
| Blue Dartwing | 0.03 | Alchemical Solution of Air (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Shock (Diluted) | 1 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Life (Mild) |
| Blue Mountain Flower | 0.10 | Alchemical Solution of Health (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Health (Mild),Alchemical Solution of Life (Mild) |
| Boar Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Stamina (Weak) | 31 | Alchemical Solution of Resistances (Strong) |
| Boar Heart | 2.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 42 | Alchemical Solution of Poisons (Concentrated) |
| Boar Tusk | 0.50 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Stamina (Weak) | 5 | Alchemical Solution of Life (Weak),Alchemical Solution of Resistances (Weak) |
| Boiled Skeever Tail | 0.20 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) | 23 | Alchemical Solution of Poisons (Mild) |
| Bone Meal | 0.50 | Alchemical Solution of Diseases (Diluted),Alchemical Solution of Earth (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Stamina (Diluted),Alchemical Solution of Undead (Diluted) | 5 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Stamina (Mild) |
| Bonesap | 0.20 | Alchemical Solution of Earth (Weak) | 33 | Alchemical Solution of Force (Concentrated) |
| Briar Heart | 0.50 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Magical Constructs (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Mortals (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Undead (Mild) | 100 | Alchemical Solution of Arcane Energy (Strong),Alchemical Solution of Force (Strong),Alchemical Solution of Magicka (Strong) |
| Buck Antlers | 2.00 | Alchemical Solution of Armor (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Weapons (Weak) | 25 | Alchemical Solution of Force (Concentrated),Alchemical Solution of Stamina (Concentrated) |
| Buck Antlers (Superlative) | 2.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak) | 38 |  |
| Bull Horn | 3.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 21 | Alchemical Solution of Force (Potent),Alchemical Solution of Life (Potent),Alchemical Solution of Resistances (Potent) |
| Burnt Spriggan Wood | 0.50 | Alchemical Solution of Fire (Mild) | 24 | Alchemical Solution of Force (Concentrated) |
| Canine Tooth | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) | 8 | Alchemical Solution of Force (Weak),Alchemical Solution of Health (Weak) |
| Canis Root | 0.10 | Alchemical Solution of Nature (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Water (Weak) | 15 | Alchemical Solution of Metal (Strong),Alchemical Solution of Poisons (Strong),Alchemical Solution of Weapons (Strong) |
| Charred Hawk Beak | 0.25 | Alchemical Solution of Fire (Weak),Alchemical Solution of Health (Weak) | 45 | Alchemical Solution of Poisons (Strong) |
| Charred Skeever Hide | 0.50 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Diseases (Diluted),Alchemical Solution of Fire (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Stamina (Diluted) | 1 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Life (Weak),Alchemical Solution of Resistances (Weak),Alchemical Solution of Water (Weak) |
| Chaurus Eggs | 0.20 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Life (Weak),Alchemical Solution of Light (Weak),Alchemical Solution of Nature (Weak),Alchemical Solution of Poisons (Weak) | 10 | Alchemical Solution of Force (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Resistances (Weak) |
| Chaurus Hunter Antennae | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak) | 54 | Alchemical Solution of Force (Concentrated),Alchemical Solution of Magicka (Concentrated),Alchemical Solution of Poisons (Concentrated) |
| Chicken's Egg | 0.50 | Alchemical Solution of Arcane Energy (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Life (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted) | 2 |  |
| Creep Cluster | 0.20 | Alchemical Solution of Acid (Diluted),Alchemical Solution of Earth (Diluted),Alchemical Solution of Magicka (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Force (Concentrated) |
| Crimson Nirnroot | 0.20 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Health (Mild),Alchemical Solution of Light (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Nature (Mild) | 350 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Poisons (Concentrated) |
| Cured Skeever Hide | 0.50 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak) | 13 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Health (Concentrated),Alchemical Solution of Life (Concentrated) |
| Cyrodilic Spadetail | 0.25 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Stamina (Diluted),Alchemical Solution of Water (Diluted) | 15 | Alchemical Solution of Life (Mild) |
| Daedra Heart | 1.00 | Alchemical Solution of Creatures (Mild),Alchemical Solution of Daedra (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Health (Mild),Alchemical Solution of Water (Mild) | 1500 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Health (Concentrated),Alchemical Solution of Life (Concentrated) |
| Deathbell | 0.10 | Alchemical Solution of Health (Weak),Alchemical Solution of Nature (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Water (Weak) | 4 | Alchemical Solution of Force (Concentrated) |
| Deer Heart | 1.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 19 | Alchemical Solution of Poisons (Mild),Alchemical Solution of Resistances (Mild) |
| Doe Antlers | 1.50 | Alchemical Solution of Armor (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Weapons (Weak) | 15 | Alchemical Solution of Force (Weak),Alchemical Solution of Poisons (Weak) |
| Doe Antlers (Superlative) | 1.50 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) | 30 | Alchemical Solution of Diseases (Concentrated) |
| Dragon Eye | 0.10 | Alchemical Solution of Creatures (Concentrated),Alchemical Solution of Flesh (Concentrated) | 169 |  |
| Dragon Heart | 5.00 | Alchemical Solution of Creatures (Concentrated),Alchemical Solution of Flesh (Concentrated) | 218 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Diseases (Weak) |
| Dragon's Tongue | 0.10 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Fire (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 5 | Alchemical Solution of Arcane Energy (Strong),Alchemical Solution of Force (Strong) |
| Dwarven Oil | 0.25 | Alchemical Solution of Earth (Weak),Alchemical Solution of Force (Weak),Alchemical Solution of Metal (Weak),Alchemical Solution of Poisons (Weak) | 38 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Force (Potent),Alchemical Solution of Magicka (Potent),Alchemical Solution of Resistances (Potent) |
| Dyed Hawk Feathers | 0.10 | Alchemical Solution of Air (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Diseases (Weak) | 39 | Alchemical Solution of Stamina (Concentrated) |
| Ectoplasm | 0.10 | Alchemical Solution of Apparitions (Mild),Alchemical Solution of Mortals (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Souls (Mild),Alchemical Solution of Undead (Mild) | 13 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Magicka (Mild) |
| Elves Ear | 0.10 | Alchemical Solution of Magicka (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Water (Diluted) | 10 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Resistances (Mild) |
| Emperor Parasol Moss | 0.25 | Alchemical Solution of Health (Mild),Alchemical Solution of Nature (Mild),Alchemical Solution of Poisons (Mild) | 9 | Alchemical Solution of Force (Potent),Alchemical Solution of Health (Potent),Alchemical Solution of Resistances (Potent) |
| Falmer Ear | 0.20 | Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Mortals (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Water (Weak) | 10 | Alchemical Solution of Poisons (Mild),Alchemical Solution of Water (Mild) |
| Felsaad Tern Feathers | 0.10 | Alchemical Solution of Air (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Health (Weak) | 11 | Alchemical Solution of Arcane Energy (Strong),Alchemical Solution of Force (Strong),Alchemical Solution of Resistances (Strong) |
| Fire Salts | 0.25 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Daedra (Mild),Alchemical Solution of Earth (Mild),Alchemical Solution of Fire (Mild),Alchemical Solution of Frost (Mild),Alchemical Solution of Poisons (Mild) | 250 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Force (Concentrated),Alchemical Solution of Magicka (Concentrated) |
| Flawless Bear Tooth | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak) | 53 | Alchemical Solution of Force (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak) |
| Flawless Sabre Cat Tooth | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Magicka (Weak),Alchemical Solution of Poisons (Weak) | 55 | Alchemical Solution of Magicka (Weak) |
| Fly Amanita | 0.10 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Fire (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted) | 2 |  |
| Fox Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 4 | Alchemical Solution of Force (Weak) |
| Frost Mirriam | 0.10 | Alchemical Solution of Frost (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 1 |  |
| Frost Salts | 0.25 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Daedra (Mild),Alchemical Solution of Earth (Mild),Alchemical Solution of Fire (Mild),Alchemical Solution of Frost (Mild),Alchemical Solution of Poisons (Mild) | 217 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Force (Concentrated) |
| Garlic | 0.25 | Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 10 |  |
| Giant Lichen | 0.25 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Earth (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Shock (Diluted),Alchemical Solution of Water (Diluted) | 5 | Alchemical Solution of Force (Weak),Alchemical Solution of Resistances (Weak) |
| Giant's Toe | 1.00 | Alchemical Solution of Creatures (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Mortals (Mild),Alchemical Solution of Poisons (Mild),Alchemical Solution of Stamina (Mild) | 20 | Alchemical Solution of Poisons (Concentrated),Alchemical Solution of Stamina (Concentrated) |
| Glassfish | 0.25 |  | 30 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Shadow (Weak) |
| Gleamblossom | 0.10 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Light (Weak),Alchemical Solution of Nature (Weak),Alchemical Solution of Resistances (Weak) | 5 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Force (Potent),Alchemical Solution of Resistances (Potent) |
| Glow Dust | 0.50 | Alchemical Solution of Apparitions (Mild),Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Magical Constructs (Mild),Alchemical Solution of Light (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Poisons (Mild),Alchemical Solution of Souls (Mild),Alchemical Solution of Undead (Mild) | 25 | Alchemical Solution of Magicka (Concentrated),Alchemical Solution of Poisons (Concentrated) |
| Glowing Mushroom | 0.20 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Light (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Shock (Diluted) | 5 | Alchemical Solution of Arcane Energy (Strong),Alchemical Solution of Force (Strong),Alchemical Solution of Resistances (Strong) |
| Goat Heart | 0.50 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Poisons (Weak) | 19 |  |
| Goldfish | 0.25 |  | 24 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Resistances (Mild) |
| Grass Pod | 0.10 | Alchemical Solution of Life (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Resistances (Diluted) | 1 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Magicka (Mild) |
| Hagraven Claw | 0.25 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Magical Constructs (Mild),Alchemical Solution of Creatures (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Mortals (Mild),Alchemical Solution of Resistances (Mild),Alchemical Solution of Weapons (Mild) | 20 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Force (Mild) |
| Hagraven Feathers | 0.10 | Alchemical Solution of Air (Mild),Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Armor (Mild),Alchemical Solution of Magical Constructs (Mild),Alchemical Solution of Creatures (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Mortals (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Poisons (Mild) | 20 | Alchemical Solution of Force (Mild),Alchemical Solution of Poisons (Mild) |
| Hanging Moss | 0.25 | Alchemical Solution of Magicka (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Magicka (Concentrated),Alchemical Solution of Poisons (Concentrated) |
| Hare Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Stamina (Weak) | 8 | Alchemical Solution of Force (Potent),Alchemical Solution of Resistances (Potent) |
| Hawk Beak | 0.25 | Alchemical Solution of Air (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Weapons (Weak) | 15 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Resistances (Potent) |
| Hawk Feathers | 0.10 | Alchemical Solution of Air (Weak),Alchemical Solution of Armor (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Diseases (Weak),Alchemical Solution of Flesh (Weak) | 15 |  |
| Heart | 1.00 | Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Mortals (Weak),Alchemical Solution of Poisons (Weak) | 77 | Alchemical Solution of Magicka (Concentrated),Alchemical Solution of Poisons (Concentrated) |
| Histcarp | 0.25 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Stamina (Diluted),Alchemical Solution of Water (Diluted) | 6 | Alchemical Solution of Stamina (Concentrated) |
| Honeycomb | 0.20 |  | 12 | Alchemical Solution of Armor (Strong),Alchemical Solution of Stamina (Strong) |
| Human Flesh | 0.25 | Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Mortals (Weak),Alchemical Solution of Poisons (Weak) | 25 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Poisons (Weak) |
| Ice Wraith Teeth | 0.25 | Alchemical Solution of Magical Constructs (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Frost (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Souls (Weak) | 30 | Alchemical Solution of Force (Weak),Alchemical Solution of Resistances (Weak) |
| Imp Stool | 0.30 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Health (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted) | 12 | Alchemical Solution of Health (Weak) |
| Jazbay Grapes | 0.10 | Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted) | 1 | Alchemical Solution of Force (Strong),Alchemical Solution of Magicka (Strong),Alchemical Solution of Resistances (Strong) |
| Jon's Giant Abecean Longfin | 30.00 | Alchemical Solution of Creatures (Potent),Alchemical Solution of Flesh (Potent),Alchemical Solution of Force (Potent),Alchemical Solution of Water (Potent),Alchemical Solution of Weapons (Potent) | 15 | Alchemical Solution of Force (Mild),Alchemical Solution of Resistances (Mild) |
| Juniper Berries | 0.10 | Alchemical Solution of Fire (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Water (Diluted) | 1 |  |
| Juvenile Mudcrab | 0.25 |  | 73 |  |
| Large Bear Claws | 0.20 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak) | 22 | Alchemical Solution of Stamina (Strong) |
| Large Mudcrab Chitin | 2.00 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Diseases (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Water (Diluted) | 29 | Alchemical Solution of Force (Strong),Alchemical Solution of Resistances (Strong) |
| Large Sabre Cat Claws | 0.20 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) | 17 | Alchemical Solution of Poisons (Weak) |
| Lavender | 0.10 | Alchemical Solution of Arcane Energy (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 5 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Resistances (Mild) |
| Luna Moth Wing | 0.01 | Alchemical Solution of Air (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Light (Diluted),Alchemical Solution of Magicka (Diluted),Alchemical Solution of Poisons (Diluted) | 5 |  |
| Lyretail Anthias | 0.25 |  | 38 |  |
| Mammoth Eye | 0.20 | Alchemical Solution of Air (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak) | 44 |  |
| Mammoth Heart | 5.00 | Alchemical Solution of Air (Mild),Alchemical Solution of Creatures (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Poisons (Mild) | 258 | Alchemical Solution of Resistances (Concentrated) |
| Monarch Wing | 0.01 | Alchemical Solution of Air (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Health (Diluted) | 3 |  |
| Moon Moon Sugar | 0.25 | Alchemical Solution of Nature (Weak),Alchemical Solution of Poisons (Weak) | 1004 |  |
| Moon Sugar | 0.25 | Alchemical Solution of Earth (Weak),Alchemical Solution of Fire (Weak),Alchemical Solution of Magicka (Weak),Alchemical Solution of Nature (Weak),Alchemical Solution of Poisons (Weak) | 45 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Force (Potent),Alchemical Solution of Magicka (Potent),Alchemical Solution of Resistances (Potent) |
| Mora Tapinella | 0.25 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Magicka (Diluted),Alchemical Solution of Nature (Diluted) | 4 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Force (Potent) |
| Mudcrab Chitin | 0.50 | Alchemical Solution of Armor (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Shield (Diluted),Alchemical Solution of Stamina (Diluted),Alchemical Solution of Water (Diluted) | 7 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Resistances (Mild) |
| Namira's Rot | 0.25 | Alchemical Solution of Diseases (Diluted),Alchemical Solution of Earth (Diluted),Alchemical Solution of Magicka (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted) | 12 |  |
| Netch Jelly | 0.50 |  | 38 |  |
| Nightshade | 0.10 | Alchemical Solution of Health (Weak),Alchemical Solution of Nature (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Water (Weak) | 8 | Alchemical Solution of Poisons (Concentrated) |
| Nirnroot | 0.20 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Health (Mild),Alchemical Solution of Light (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Nature (Mild),Alchemical Solution of Poisons (Mild) | 100 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Poisons (Potent) |
| Nordic Barnacle | 0.20 | Alchemical Solution of Armor (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Life (Diluted),Alchemical Solution of Magicka (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Water (Diluted) | 5 | Alchemical Solution of Air (Potent),Alchemical Solution of Resistances (Potent) |
| Northern Flax | 0.20 |  | 1 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Life (Weak) |
| Oil of Vitriol | 0.50 | Alchemical Solution of Acid (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) | 15 | Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) |
| Orange Dartwing | 0.03 | Alchemical Solution of Air (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Stamina (Diluted) | 1 |  |
| Panacea | 0.50 | Alchemical Solution of Diseases (Weak),Alchemical Solution of Nature (Weak) | 12 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Life (Mild) |
| Pearl | 0.10 | Alchemical Solution of Armor (Weak),Alchemical Solution of Earth (Weak),Alchemical Solution of Resistances (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Water (Weak) | 16 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Life (Mild) |
| Pearlfish | 0.25 |  | 24 | Alchemical Solution of Arcane Energy (Potent) |
| Pine Thrush Egg | 0.50 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Life (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Stamina (Diluted) | 2 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Resistances (Weak) |
| Poisonous Bloom | 0.25 | Alchemical Solution of Health (Mild) | 5 | Alchemical Solution of Force (Concentrated) |
| Polished Bear Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Stamina (Weak) | 21 | Alchemical Solution of Resistances (Mild) |
| Polished Boar Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak) | 51 | Alchemical Solution of Resistances (Concentrated) |
| Polished Dragon Eye | 0.10 | Alchemical Solution of Creatures (Concentrated),Alchemical Solution of Flesh (Concentrated) | 220 | Alchemical Solution of Force (Strong) |
| Polished Fox Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 9 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Resistances (Weak) |
| Polished Hare Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Weapons (Weak) | 22 | Alchemical Solution of Force (Mild),Alchemical Solution of Metal (Mild) |
| Polished Mammoth Eye | 0.20 | Alchemical Solution of Air (Mild),Alchemical Solution of Creatures (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Health (Mild) | 35 | Alchemical Solution of Force (Concentrated),Alchemical Solution of Resistances (Concentrated) |
| Polished Sabre Cat Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Light (Weak) | 34 |  |
| Polished Slaughterfish Scales | 0.10 | Alchemical Solution of Air (Weak),Alchemical Solution of Armor (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Water (Weak) | 29 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Resistances (Weak),Alchemical Solution of Water (Weak) |
| Polished Troll Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak) | 42 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Life (Concentrated),Alchemical Solution of Resistances (Concentrated) |
| Polished Werewolf Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Mortals (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Weapons (Weak) | 55 | Alchemical Solution of Arcane Energy (Mild) |
| Polished Wolf Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 14 |  |
| Powdered Mammoth Tusk | 0.10 | Alchemical Solution of Air (Weak),Alchemical Solution of Armor (Weak),Alchemical Solution of Creatures (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Weapons (Weak) | 25 | Alchemical Solution of Life (Mild) |
| Powdered Mudcrab Chitin | 0.10 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Health (Diluted),Alchemical Solution of Water (Diluted) | 18 | Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) |
| Purple Mountain Flower | 0.10 | Alchemical Solution of Nature (Diluted),Alchemical Solution of Stamina (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Arcane Energy (Weak) |
| Pygmy Sunfish | 0.25 |  | 34 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Magicka (Concentrated) |
| Red Glitterdust | 0.30 | Alchemical Solution of Earth (Weak) | 78 | Alchemical Solution of Poisons (Concentrated) |
| Red Mountain Flower | 0.10 | Alchemical Solution of Magicka (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Magicka (Weak) |
| River Betty | 0.25 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Health (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Water (Diluted) | 15 |  |
| Rock Warbler Egg | 0.50 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Health (Diluted),Alchemical Solution of Life (Diluted),Alchemical Solution of Water (Diluted) | 2 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Force (Weak) |
| Sabre Cat Claws | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Magicka (Weak) | 11 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Life (Mild),Alchemical Solution of Resistances (Mild) |
| Sabre Cat Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Light (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Water (Weak) | 12 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Life (Weak) |
| Sabre Cat Heart | 1.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 35 | Alchemical Solution of Magicka (Mild) |
| Sabre Cat Tooth | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Weapons (Weak) | 28 | Alchemical Solution of Force (Mild),Alchemical Solution of Resistances (Mild),Alchemical Solution of Stamina (Mild) |
| Salmon Roe | 0.20 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Water (Weak) | 2 | Alchemical Solution of Force (Concentrated),Alchemical Solution of Magicka (Concentrated),Alchemical Solution of Resistances (Concentrated) |
| Salt | 0.20 | Alchemical Solution of Acid (Diluted),Alchemical Solution of Earth (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Water (Diluted) | 5 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Resistances (Concentrated) |
| Sapphire Glitterdust | 0.30 | Alchemical Solution of Earth (Weak) | 106 | Alchemical Solution of Poisons (Strong),Alchemical Solution of Resistances (Strong),Alchemical Solution of Water (Strong) |
| Scaly Pholiota | 0.25 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted) | 4 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Resistances (Concentrated) |
| Scathecraw | 0.10 | Alchemical Solution of Health (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted) | 8 | Alchemical Solution of Acid (Weak),Alchemical Solution of Health (Weak) |
| Silverside Perch | 0.25 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Stamina (Diluted),Alchemical Solution of Water (Diluted) | 15 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Stamina (Concentrated) |
| Skeever Tail | 0.20 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Diseases (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Stamina (Diluted) | 3 |  |
| Slaughterfish Egg | 0.20 | Alchemical Solution of Creatures (Diluted),Alchemical Solution of Life (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 3 | Alchemical Solution of Resistances (Mild) |
| Slaughterfish Scales | 0.10 | Alchemical Solution of Armor (Weak),Alchemical Solution of Earth (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Water (Weak) | 3 | Alchemical Solution of Armor (Strong) |
| Small Pearl | 0.10 | Alchemical Solution of Armor (Weak),Alchemical Solution of Earth (Weak),Alchemical Solution of Resistances (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Water (Weak) | 16 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Life (Mild) |
| Snowberries | 0.10 | Alchemical Solution of Fire (Diluted),Alchemical Solution of Frost (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Resistances (Mild) |
| Spadefish | 0.25 |  | 49 |  |
| Spawn Ash | 0.10 | Alchemical Solution of Fire (Mild),Alchemical Solution of Poisons (Mild),Alchemical Solution of Stamina (Mild),Alchemical Solution of Undead (Mild) | 13 | Alchemical Solution of Acid (Mild),Alchemical Solution of Arcane Energy (Mild) |
| Spider Egg | 0.20 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Life (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Stamina (Weak),Alchemical Solution of Water (Weak) | 5 |  |
| Spriggan Sap | 0.20 | Alchemical Solution of Magical Constructs (Mild),Alchemical Solution of Life (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Nature (Mild),Alchemical Solution of Poisons (Mild) | 50 | Alchemical Solution of Arcane Energy (Concentrated) |
| Strange Remains | 0.75 | Alchemical Solution of Light (Mild),Alchemical Solution of Souls (Mild) | 774 | Alchemical Solution of Arcane Energy (Mild) |
| Swamp Fungal Pod | 0.25 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Shock (Diluted),Alchemical Solution of Water (Diluted) | 5 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Health (Weak) |
| Taproot | 0.50 | Alchemical Solution of Magical Constructs (Mild),Alchemical Solution of Life (Mild),Alchemical Solution of Magicka (Mild),Alchemical Solution of Nature (Mild),Alchemical Solution of Poisons (Mild) | 15 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Force (Potent),Alchemical Solution of Magicka (Potent),Alchemical Solution of Resistances (Potent) |
| Thistle Branch | 0.10 | Alchemical Solution of Frost (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Resistances (Mild) |
| Torchbug Abdomen | 0.04 | Alchemical Solution of Air (Diluted),Alchemical Solution of Creatures (Diluted),Alchemical Solution of Fire (Diluted),Alchemical Solution of Flesh (Diluted),Alchemical Solution of Light (Diluted),Alchemical Solution of Stamina (Diluted) | 1 | Alchemical Solution of Arcane Energy (Weak),Alchemical Solution of Force (Weak),Alchemical Solution of Resistances (Weak),Alchemical Solution of Stamina (Weak) |
| Trama Root | 0.20 | Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Shock (Diluted) | 7 |  |
| Troll Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Health (Weak) | 29 |  |
| Troll Fat | 1.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Poisons (Weak),Alchemical Solution of Resistances (Weak) | 25 | Alchemical Solution of Poisons (Mild),Alchemical Solution of Water (Mild) |
| Troll Heart | 2.00 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Poisons (Weak) | 101 | Alchemical Solution of Force (Concentrated),Alchemical Solution of Stamina (Concentrated) |
| Tundra Cotton | 0.10 | Alchemical Solution of Arcane Energy (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Resistances (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Force (Mild),Alchemical Solution of Resistances (Mild) |
| Vampire Dust | 0.20 | Alchemical Solution of Diseases (Mild),Alchemical Solution of Flesh (Mild),Alchemical Solution of Force (Mild),Alchemical Solution of Mortals (Mild),Alchemical Solution of Light (Mild),Alchemical Solution of Undead (Mild) | 318 |  |
| Void Salts | 0.20 | Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Daedra (Mild),Alchemical Solution of Earth (Mild),Alchemical Solution of Poisons (Mild),Alchemical Solution of Shock (Mild) | 500 | Alchemical Solution of Resistances (Concentrated) |
| Werewolf Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Mortals (Weak) | 33 |  |
| Werewolf Heart | 0.50 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak),Alchemical Solution of Mortals (Weak) | 42 | Alchemical Solution of Health (Strong),Alchemical Solution of Poisons (Strong) |
| Wheat | 0.10 | Alchemical Solution of Health (Diluted),Alchemical Solution of Life (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Water (Diluted) | 1 | Alchemical Solution of Health (Concentrated),Alchemical Solution of Life (Concentrated) |
| White Cap | 0.30 | Alchemical Solution of Earth (Diluted),Alchemical Solution of Frost (Diluted),Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted) | 12 | Alchemical Solution of Force (Mild),Alchemical Solution of Magicka (Mild) |
| Wisp Wrappings | 0.10 | Alchemical Solution of Apparitions (Mild),Alchemical Solution of Arcane Energy (Mild),Alchemical Solution of Armor (Mild),Alchemical Solution of Magical Constructs (Mild),Alchemical Solution of Frost (Mild),Alchemical Solution of Light (Mild),Alchemical Solution of Souls (Mild),Alchemical Solution of Stamina (Mild) | 30 | Alchemical Solution of Arcane Energy (Potent),Alchemical Solution of Force (Potent) |
| Wolf Claws | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Health (Weak),Alchemical Solution of Poisons (Weak) | 8 | Alchemical Solution of Force (Concentrated) |
| Wolf Eye | 0.10 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 5 | Alchemical Solution of Health (Weak) |
| Wolf Heart | 0.75 | Alchemical Solution of Creatures (Weak),Alchemical Solution of Flesh (Weak) | 39 | Alchemical Solution of Poisons (Weak) |
| Yellow Mountain Flower | 0.10 | Alchemical Solution of Nature (Diluted),Alchemical Solution of Poisons (Diluted),Alchemical Solution of Resistances (Diluted) | 1 | Alchemical Solution of Arcane Energy (Concentrated),Alchemical Solution of Poisons (Concentrated),Alchemical Solution of Resistances (Concentrated) |

</div>

---

## Next Steps

- **[Return to Spell Research Cheat Sheet](https://wiki.wildlandermod.com/12Cheat-Sheets/Spell-Research-Cheat-Sheet/)** - Main reference page
- **[Effect View](https://wiki.wildlandermod.com/12Cheat-Sheets/Effect View/)** - See potion effects and their archetypes
- **[Solutions View](https://wiki.wildlandermod.com/12Cheat-Sheets/Solutions-View/)** - Find which ingredients produce specific solutions
