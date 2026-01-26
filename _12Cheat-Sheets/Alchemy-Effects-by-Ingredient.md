---
title: Alchemy Effects by Ingredient
layout: default
nav_order: 2
has_children: false
description: 712 collected alchemy ingredients and their effects, organized by ingredient for quick reference.
---

## Alchemy Effects by Ingredient

This comprehensive database contains all 712 collected alchemy ingredients found throughout Skyrim and their associated effects. Use this as a reference when searching for ingredients to craft specific potions or poisons, or to identify what effects a collected ingredient provides.

For alchemy recipes you can craft at an alchemy lab workstation, see [Alchemy Crafting Recipes](https://wiki.wildlandermod.com/_10-Crafting/AlchIng/).

---

## How to Use This Page

**Hover over any Ingredient name** to see the complete details including:
- All effects this ingredient provides
- Magnitude (potency) of each effect
- Duration of effects
- Effect category (Fortify, Damage, Restore, etc.)
- Full effect description

Use the search bar and filters below to find specific ingredients by effect type, ingredient name, or effect category.

---

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  // Tooltip and filter initialization
  initAlchemyIngredientstooltips();
  initAlchemyIngredientsFilters();
});

function initAlchemyIngredientstooltips() {
  const table = document.querySelector('.alchemy-ingredients-table table');
  if (!table) return;
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const ingredientCell = row.querySelector('td:first-child');
    if (!ingredientCell) return;
    ingredientCell.style.cursor = 'pointer';
    ingredientCell.addEventListener('mouseenter', (e) => showAlchemyIngredientstooltip(e, row));
    ingredientCell.addEventListener('mousemove', updateAlchemyIngredientstooltipPosition);
    ingredientCell.addEventListener('mouseleave', hideAlchemyIngredientstooltip);
  });
}

function showAlchemyIngredientstooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    ingredient: cells[0]?.textContent?.trim() || '',
    effect: cells[1]?.textContent?.trim() || '',
    magnitude: cells[2]?.textContent?.trim() || '',
    duration: cells[3]?.textContent?.trim() || '',
    description: cells[4]?.textContent?.trim() || '',
    category: cells[5]?.textContent?.trim() || ''
  };
  
  let tooltip = document.getElementById('alchemy-ingredients-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'alchemy-ingredients-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    tooltip.style.backgroundColor = '#2a2a2a';
    tooltip.style.border = '1px solid #50098a';
    tooltip.style.padding = '10px';
    tooltip.style.borderRadius = '4px';
    tooltip.style.color = '#e6e6e6';
    tooltip.style.fontSize = '12px';
    tooltip.style.maxWidth = '300px';
    tooltip.style.wordWrap = 'break-word';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Ingredient:</strong> ${data.ingredient}</div>
    <div><strong>Effect:</strong> ${data.effect}</div>
    <div><strong>Magnitude:</strong> ${data.magnitude}</div>
    <div><strong>Duration:</strong> ${data.duration}s</div>
    <div><strong>Category:</strong> ${data.category}</div>
    <div style="margin-top: 8px; border-top: 1px solid #50098a; padding-top: 8px; font-size: 11px;"><strong>Description:</strong> ${data.description}</div>
  `;
  tooltip.style.display = 'block';
  updateAlchemyIngredientstooltipPosition(event);
}

function updateAlchemyIngredientstooltipPosition(event) {
  const tooltip = document.getElementById('alchemy-ingredients-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideAlchemyIngredientstooltip() {
  const tooltip = document.getElementById('alchemy-ingredients-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initAlchemyIngredientsFilters() {
  const table = document.querySelector('.alchemy-ingredients-table table');
  if (!table) return;
  
  const effectFilter = document.getElementById('alchemyEffectFilter');
  const categoryFilter = document.getElementById('alchemyCategoryFilter');
  
  const effects = new Set();
  const categories = new Set();
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells[1]) effects.add(cells[1].textContent.trim());
    if (cells[5]) categories.add(cells[5].textContent.trim());
  });
  
  const sortedEffects = Array.from(effects).sort();
  const sortedCategories = Array.from(categories).sort();
  
  sortedEffects.forEach(effect => {
    const option = document.createElement('option');
    option.value = effect;
    option.textContent = effect;
    effectFilter.appendChild(option);
  });
  
  sortedCategories.forEach(category => {
    const option = document.createElement('option');
    option.value = category;
    option.textContent = category;
    categoryFilter.appendChild(option);
  });
  
  document.getElementById('alchemyIngredientsSearch').addEventListener('input', filterAlchemyIngredientsTable);
  effectFilter.addEventListener('change', filterAlchemyIngredientsTable);
  categoryFilter.addEventListener('change', filterAlchemyIngredientsTable);
  document.getElementById('clearAlchemyIngredientsFilters').addEventListener('click', clearAlchemyIngredientsFilters);
}

function filterAlchemyIngredientsTable() {
  const searchTerm = document.getElementById('alchemyIngredientsSearch').value.toLowerCase();
  const effectFilter = document.getElementById('alchemyEffectFilter').value;
  const categoryFilter = document.getElementById('alchemyCategoryFilter').value;
  
  const table = document.querySelector('.alchemy-ingredients-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const ingredient = cells[0]?.textContent?.toLowerCase() || '';
    const effect = cells[1]?.textContent?.trim() || '';
    const description = cells[4]?.textContent?.toLowerCase() || '';
    const category = cells[5]?.textContent?.trim() || '';
    
    const searchMatch = ingredient.includes(searchTerm) || description.includes(searchTerm);
    const effectMatch = !effectFilter || effect === effectFilter;
    const categoryMatch = !categoryFilter || category === categoryFilter;
    
    const isVisible = searchMatch && effectMatch && categoryMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateAlchemyIngredientsFilterCount();
  initAlchemyIngredientstooltips();
}

function updateAlchemyIngredientsFilterCount() {
  const table = document.querySelector('.alchemy-ingredients-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const visibleCount = rows.filter(row => row.style.display !== 'none').length;
  const totalCount = rows.length;
  document.getElementById('alchemyIngredientsFilterCount').textContent = `Showing ${visibleCount} of ${totalCount} ingredients`;
}

function clearAlchemyIngredientsFilters() {
  document.getElementById('alchemyIngredientsSearch').value = '';
  document.getElementById('alchemyEffectFilter').value = '';
  document.getElementById('alchemyCategoryFilter').value = '';
  filterAlchemyIngredientsTable();
}
</script>

<div class="alchemy-ingredients-controls">
  <input type="text" id="alchemyIngredientsSearch" placeholder="Search ingredients or effects..." style="width: 250px; padding: 8px; margin-right: 10px; border: 1px solid #50098a; background-color: #333; color: #e6e6e6;">
  <select id="alchemyEffectFilter" style="padding: 8px; margin-right: 10px; border: 1px solid #50098a; background-color: #333; color: #e6e6e6;">
    <option value="">All Effects</option>
  </select>
  <select id="alchemyCategoryFilter" style="padding: 8px; margin-right: 10px; border: 1px solid #50098a; background-color: #333; color: #e6e6e6;">
    <option value="">All Categories</option>
  </select>
  <button id="clearAlchemyIngredientsFilters" onclick="clearAlchemyIngredientsFilters()" style="padding: 8px 15px; background-color: #50098a; color: #f77ef1; border: none; cursor: pointer; border-radius: 4px;">Clear Filters</button>
</div>
<div id="alchemyIngredientsFilterCount" class="filter-result-count" style="margin-top: 10px; color: #f77ef1; font-size: 13px;">Showing 712 of 712 ingredients</div>

<div class="alchemy-ingredients-table" markdown="1">

| Ingredient | Effect | Magnitude | Duration | Description | Category |
|:---|:---|:---:|:---:|:---|:---|
| Abecean Longfin | Weakness to Frost | 3 | 30 | The target is (Magnitude)% weaker to frost damage for (duration) seconds. | Weakness |
| Abecean Longfin | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Abecean Longfin | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Abecean Longfin | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Ancestor Moth Wing | Fortify Conjuration | 5 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Ancestor Moth Wing | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Ancestor Moth Wing | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Ancestor Moth Wing | Fortify Magicka | 1 | 30 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Angelfish | Fortify Marksman | 5 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Angelfish | Waterbreathing | 0 | 10 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Angelfish | Resist Fire | 4 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Angelfish | Fortify Health Regen | 6 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Angler Larvae | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Angler Larvae | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Angler Larvae | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Angler Larvae | Waterbreathing | 0 | 5 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Animal Fat | Resist Poison | 4 | 180 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Animal Fat | Damage Health | 2 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Animal Fat | Frenzy | 1 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Animal Fat | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Ash Creep Cluster | Invisibility | 0 | 4 | Grants invisibility for (duration) seconds. | Other |
| Ash Creep Cluster | Resist Fire | 2 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Ash Creep Cluster | Fortify Destruction | 5 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Ash Creep Cluster | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Ash Hopper Jelly | Fortify Armor Rating | 4 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Ash Hopper Jelly | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Ash Hopper Jelly | Weakness to Frost | 3 | 30 | The target is (Magnitude)% weaker to frost damage for (duration) seconds. | Weakness |
| Ash Hopper Jelly | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Ashen Grass Pod | Fortify Lockpicking | 2 | 30 | Lockpicking skill is increased by (Magnitude) for (duration) seconds. | Fortify |
| Ashen Grass Pod | Fortify Sneak | 2 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Ashen Grass Pod | Weakness to Shock | 3 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Ashen Grass Pod | Resist Fire | 4 | 80 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Bear Claws | Fortify Stamina Regen | 10 | 60 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Bear Claws | Fortify Armor Rating | 6 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Bear Claws | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Bear Claws | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Bear Eye | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Bear Eye | Exploit Weakness | 0 | 10 | Once affected by this poison, further venoming causes the victim to stagger. Lasts (duration) seconds. | Other |
| Bear Eye | Fortify Health Regen | 6 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Bear Eye | Detect Life | 0 | 30 | Nearby living creatures can be sensed while you are outdoors. | Other |
| Bear Heart | Fortify Destruction | 1 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Bear Heart | Damage Stamina | 5 | 5 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Bear Heart | Frenzy | 2 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Bear Heart | Fortify Health | 5 | 300 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Bear Tooth | Fortify Alteration | 4 | 60 | Alteration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Bear Tooth | Fortify Armor Rating | 5 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Bear Tooth | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Bear Tooth | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Bee | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Bee | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Bee | Weakness to Shock | 3 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Bee | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Beehive Husk | Fortify Armor Rating | 5 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Beehive Husk | Fortify Sneak | 2 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Beehive Husk | Resist Poison | 2 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Beehive Husk | Fortify Destruction | 5 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Berit's Ashes | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Berit's Ashes | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Berit's Ashes | Fortify Conjuration | 5 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Berit's Ashes | Resist Fire | 3 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Bleeding Crown | Fortify Block | 4 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Bleeding Crown | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Bleeding Crown | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Bleeding Crown | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Blisterwort | Restore Health | 2 | 10 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Blisterwort | Damage Stamina | 3 | 10 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Blisterwort | Frenzy | 2 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Blisterwort | Fortify Stamina Regen | 4 | 30 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Blue Butterfly Wing | Fortify Conjuration | 5 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Blue Butterfly Wing | Fortify Illusion | 3 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Blue Butterfly Wing | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Blue Butterfly Wing | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Blue Dartwing | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Blue Dartwing | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Blue Dartwing | Fortify Pickpocket | 4 | 60 | Pickpocketing is (Magnitude)% easier for (duration) seconds. | Fortify |
| Blue Dartwing | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Blue Mountain Flower | Restore Health | 0 | 10 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Blue Mountain Flower | Fortify Health | 2 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Blue Mountain Flower | Fortify Conjuration | 2 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Blue Mountain Flower | Damage Magicka Regen | 5 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Boar Eye | Hircine's Sight | 0 | 10 | For (duration) seconds, you can focus to see farther when aiming a bow. | Other |
| Boar Eye | Exploit Weakness | 0 | 10 | Once affected by this poison, further venoming causes the victim to stagger. Lasts (duration) seconds. | Other |
| Boar Eye | Resist Fire | 3 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Boar Eye | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Boar Heart | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Boar Heart | Frenzy | 1 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Boar Heart | Damage Stamina | 4 | 1 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Boar Heart | Thrill | 5 | 600 | Imbued with the thrill of the hunt, you move more swiftly and your stamina regenerates (Magnitude)% faster. The effect ends indoors. | Other |
| Boar Tusk | Fortify Block | 1 | 20 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Boar Tusk | Fortify Stamina | 1 | 20 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Boar Tusk | Frenzy | 2 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Boar Tusk | Fortify Health | 1 | 20 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Boiled Skeever Tail | Damage Health | 10 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Boiled Skeever Tail | Frenzy | 1 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Boiled Skeever Tail | Ineptitude | 0 | 10 | For (duration) seconds, may cause stumbling. | Other |
| Boiled Skeever Tail | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Bone Meal | Resist Fire | 2 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Bone Meal | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Bone Meal | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Bone Meal | Fortify Conjuration | 3 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Bonesap | Paralysis | 0 | 1 | The target is paralyzed for (duration) seconds. | Other |
| Bonesap | Discerning | 1 | 30 | Within (duration) seconds, you will discern a random effect of the first ingredient you consume.  | Other |
| Bonesap | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Bonesap | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Briar Heart | Paralysis | 0 | 1 | The target is paralyzed for (duration) seconds. | Other |
| Briar Heart | Fortify Block | 2 | 120 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Briar Heart | Restore Magicka | 2 | 30 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Briar Heart | Fortify Magicka | 4 | 120 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Buck Antlers | Fortify Stamina | 5 | 120 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Buck Antlers | Restore Stamina | 105 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Buck Antlers | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Buck Antlers | Damage Stamina Regen | 50 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Buck Antlers (Superlative) | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Buck Antlers (Superlative) | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Buck Antlers (Superlative) | Resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Buck Antlers (Superlative) | Fortify Marksman | 4 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Bull Horn | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Bull Horn | Frenzy | 2 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Bull Horn | Fortify Stamina | 4 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Bull Horn | Fortify Health | 4 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Burnt Spriggan Wood | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Burnt Spriggan Wood | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Burnt Spriggan Wood | Fortify Alteration | 4 | 60 | Alteration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Burnt Spriggan Wood | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Canine Tooth | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Canine Tooth | Damage Health | 3 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Canine Tooth | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Canine Tooth | Fortify One-Handed | 4 | 60 | One-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Canis Root | Fortify One-Handed | 4 | 60 | One-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Canis Root | Fortify Marksman | 4 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Canis Root | Damage Health | 10 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Canis Root | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Charred Hawk Beak | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Charred Hawk Beak | Damage Health | 5 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Charred Hawk Beak | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Charred Hawk Beak | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Charred Skeever Hide | Waterbreathing | 0 | 20 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Charred Skeever Hide | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Charred Skeever Hide | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Charred Skeever Hide | Resist Poison | 2 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Chaurus Eggs | Weakness to Poison | 4 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Chaurus Eggs | Invisibility | 0 | 4 | Grants invisibility for (duration) seconds. | Other |
| Chaurus Eggs | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Chaurus Eggs | Fortify Stamina | 4 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Chaurus Hunter Antennae | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Chaurus Hunter Antennae | Fortify Conjuration | 5 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Chaurus Hunter Antennae | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Chaurus Hunter Antennae | Fortify Magicka | 1 | 30 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Chicken's Egg | Waterbreathing | 0 | 5 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Chicken's Egg | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Chicken's Egg | Damage Magicka Regen | 50 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Chicken's Egg | Lingering Damage Stamina | 1 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Creep Cluster | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Creep Cluster | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Creep Cluster | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Creep Cluster | Weakness to Magic | 2 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Crimson Nirnroot | Resist Magic | 5 | 180 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Crimson Nirnroot | Invisibility | 0 | 24 | Grants invisibility for (duration) seconds. | Other |
| Crimson Nirnroot | Damage Stamina | 20 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Crimson Nirnroot | Damage Health | 20 | 2 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Cured Skeever Hide | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Cured Skeever Hide | Fortify Health | 5 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Cured Skeever Hide | Prowling | 2 | 600 | You are (Magnitude)% harder to detect. The effect ends indoors. | Other |
| Cured Skeever Hide | Resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Cyrodilic Spadetail | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Cyrodilic Spadetail | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Cyrodilic Spadetail | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Cyrodilic Spadetail | Fear | 3 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Daedra Heart | Lingering Damage Health | 100 | 30 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Daedra Heart | Restore Stamina | 100 | 30 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Daedra Heart | Restore Magicka | 100 | 30 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Daedra Heart | Restore Health | 100 | 30 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Deathbell | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Deathbell | Damage Max Stamina | 2 | 20 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Deathbell | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Deathbell | Damage Health | 3 | 5 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Deer Heart | Resist Fire | 3 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Deer Heart | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Deer Heart | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Deer Heart | Damage Stamina | 4 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Doe Antlers | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Doe Antlers | Lingering Damage Stamina | 1 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Doe Antlers | Damage Health | 2 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Doe Antlers | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Doe Antlers (Superlative) | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Doe Antlers (Superlative) | Hunter's Boon | 2 | 600 | Bows do (Magnitude)% more damage. The effect ends indoors. | Other |
| Doe Antlers (Superlative) | Lingering Damage Stamina | 1 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Doe Antlers (Superlative) | Resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Dragon Eye | Damage Max Health | 3 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Dragon Eye | Fortify Destruction | 6 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Dragon Eye | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Dragon Eye | Detect Life | 0 | 60 | Nearby living creatures can be sensed while you are outdoors. | Other |
| Dragon Heart | Lingering Damage Stamina | 2 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Dragon Heart | Paralysis | 0 | 3 | The target is paralyzed for (duration) seconds. | Other |
| Dragon Heart | Resist Fire | 4 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Dragon Heart | Lingering Damage Health | 2 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Dragon's Tongue | Fortify Illusion | 3 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Dragon's Tongue | Fortify Barter | 2 | 30 | You haggle for (Magnitude)% better prices for (duration) seconds. | Fortify |
| Dragon's Tongue | Resist Fire | 3 | 80 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Dragon's Tongue | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Dwarven Oil | Weakness to Magic | 2 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Dwarven Oil | Fortify Illusion | 5 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Dwarven Oil | Restore Magicka | 2 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Dwarven Oil | Fortify Magicka Regen | 5 | 300 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Other |
| Dyed Hawk Feathers | Fortify Stamina | 4 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Dyed Hawk Feathers | Damage Stamina | 5 | 5 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Dyed Hawk Feathers | Cure Disease | 5 | 0 | Cures all diseases. | Other |
| Dyed Hawk Feathers | Thrill | 5 | 600 | Imbued with the thrill of the hunt, you move more swiftly and your stamina regenerates (Magnitude)% faster. The effect ends indoors. | Other |
| Ectoplasm | Damage Health | 2 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Ectoplasm | Restore Magicka | 3 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Ectoplasm | Fortify Destruction | 4 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Ectoplasm | Fortify Magicka | 4 | 60 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Elves Ear | Weakness to Frost | 2 | 30 | The target is (Magnitude)% weaker to frost damage for (duration) seconds. | Weakness |
| Elves Ear | Resist Fire | 3 | 30 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Elves Ear | Fortify Marksman | 4 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Elves Ear | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Emperor Parasol Moss | Fortify Magicka | 2 | 60 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Emperor Parasol Moss | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Emperor Parasol Moss | Damage Health | 3 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Emperor Parasol Moss | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Falmer Ear | Damage Health | 3 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Falmer Ear | Fortify Lockpicking Expertise | 2 | 30 | Lockpicking expertise is increased by (Magnitude) for (duration) seconds. | Fortify |
| Falmer Ear | Resist Poison | 5 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Falmer Ear | Frenzy | 3 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Felsaad Tern Feathers | Resist Magic | 1 | 120 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Felsaad Tern Feathers | Resist Poison | 5 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Felsaad Tern Feathers | Restore Health | 1 | 10 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Felsaad Tern Feathers | Fortify Armor Rating | 4 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Fire Salts | Weakness to Frost | 3 | 30 | The target is (Magnitude)% weaker to frost damage for (duration) seconds. | Weakness |
| Fire Salts | Resist Fire | 3 | 300 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Fire Salts | Fortify Magicka Regen | 5 | 300 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Fire Salts | Restore Magicka | 3 | 45 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Flawless Bear Tooth | Lingering Damage Stamina | 1 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Flawless Bear Tooth | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Flawless Bear Tooth | Paralysis | 0 | 1 | The target is paralyzed for (duration) seconds. | Other |
| Flawless Bear Tooth | Damage Stamina | 5 | 5 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Flawless Sabre Cat Tooth | Muddle | 0 | 10 | Any spells cast for the next (duration) seconds cost double mana. | Other |
| Flawless Sabre Cat Tooth | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Flawless Sabre Cat Tooth | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Flawless Sabre Cat Tooth | Lingering Damage Magicka | 1 | 10 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Fly Amanita | Resist Fire | 3 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Fly Amanita | Frenzy | 2 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Fly Amanita | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Fly Amanita | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Fox Eye | Pathifinding | 0 | 3 | Very briefly, you sense the path to your goal. | Other |
| Fox Eye | Weakness to Fire | 3 | 60 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Fox Eye | Fortify Armor Rating | 5 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Fox Eye | Hircine's Sight | 0 | 10 | For (duration) seconds, you can focus to see farther when aiming a bow. | Other |
| Frost Mirriam | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Frost Mirriam | Damage Max Magicka | 2 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Frost Mirriam | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Frost Mirriam | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Frost Salts | Resist Frost | 6 | 300 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Frost Salts | Weakness to Fire | 3 | 60 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Frost Salts | Fortify Conjuration | 5 | 180 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Frost Salts | Restore Magicka | 4 | 45 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Garlic | Resist Poison | 2 | 300 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Garlic | Fortify Magicka Regen | 5 | 60 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Garlic | Fortify Stamina | 1 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Garlic | Fortify Health Regen | 5 | 60 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Giant Lichen | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Giant Lichen | Weakness to Shock | 3 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Giant Lichen | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Giant Lichen | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Giant's Toe | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Giant's Toe | Fortify Health | 4 | 300 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Giant's Toe | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Giant's Toe | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Glassfish | Night Vision | 0 | 60 | Night Eye for (duration) seconds. | Other |
| Glassfish | Restore Magicka | 2 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Glassfish | Fortify Illusion | 3 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Glassfish | Invisibility | 0 | 4 | Grants invisibility for (duration) seconds. | Other |
| Gleamblossom | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Gleamblossom | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Gleamblossom | Paralysis | 0 | 1 | The target is paralyzed for (duration) seconds. | Other |
| Gleamblossom | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Glow Dust | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Glow Dust | Night Vision | 0 | 45 | Night Eye for (duration) seconds. | Other |
| Glow Dust | Fortify Destruction | 5 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Glow Dust | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Glowing Mushroom | Fortify Stamina | 4 | 30 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Glowing Mushroom | Fortify Health | 4 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Glowing Mushroom | Fortify Destruction | 5 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Glowing Mushroom | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Goat Heart | Muddle | 0 | 10 | Any spells cast for the next (duration) seconds cost double mana. | Other |
| Goat Heart | Thrill | 5 | 600 | Imbued with the thrill of the hunt, you move more swiftly and your stamina regenerates (Magnitude)% faster. The effect ends indoors. | Other |
| Goat Heart | Consumption | 1 | 60 | Wastes away (Magnitude) health and stamina, per second, over (duration) seconds. | Other |
| Goat Heart | Ineptitude | 0 | 10 | For (duration) seconds, may cause stumbling. | Other |
| Goldfish | Waterbreathing | 0 | 5 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Goldfish | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Goldfish | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Goldfish | Fortify Armor Rating | 6 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Grass Pod | Fortify Alteration | 4 | 60 | Alteration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Grass Pod | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Grass Pod | Resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Grass Pod | Damage Max Magicka | 2 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Hagraven Claw | Resist Magic | 1 | 120 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Hagraven Claw | Lingering Damage Magicka | 1 | 10 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Hagraven Claw | Soulreaping | 0 | 4 | The target becomes vulnerable to soulgems for (dur) seconds. | Other |
| Hagraven Claw | Fortify Illusion | 4 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Hagraven Feathers | Frenzy | 3 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Hagraven Feathers | Fortify Conjuration | 5 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Hagraven Feathers | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Hagraven Feathers | Weakness to Shock | 3 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Hanging Moss | Fortify Health | 4 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Hanging Moss | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Hanging Moss | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Hanging Moss | Fortify One-Handed | 4 | 60 | One-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Hare Eye | Cure Disease | 5 | 0 | Cures all diseases. | Other |
| Hare Eye | Fortify Stamina Regen | 5 | 60 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Hare Eye | Fortify Pickpocket | 4 | 300 | Pickpocketing is (Magnitude)% easier for (duration) seconds. | Fortify |
| Hare Eye | Weakness to Shock | 3 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Hawk Beak | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Hawk Beak | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Hawk Beak | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Hawk Beak | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Hawk Feathers | Fortify Armor Rating | 8 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Hawk Feathers | Cure Disease | 100 | 0 | Cures all diseases. | Other |
| Hawk Feathers | Fortify One-Handed | 4 | 60 | One-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Hawk Feathers | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Hawk's Egg | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Hawk's Egg | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Hawk's Egg | Lingering Damage Stamina | 1 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Hawk's Egg | Waterbreathing | 0 | 5 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Heart | Damage Magicka | 5 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Heart | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Heart | Damage Health | 5 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Heart | Frenzy | 3 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Histcarp | Fortify Magicka | 4 | 60 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Histcarp | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Histcarp | Waterbreathing | 0 | 5 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Histcarp | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Honeycomb | Fortify Armor Rating | 5 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Honeycomb | Damage Max Stamina | 10 | 30 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Honeycomb | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Honeycomb | Fortify Block | 4 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Human Flesh | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Human Flesh | Paralysis | 0 | 1 | The target is paralyzed for (duration) seconds. | Other |
| Human Flesh | Damage Health | 2 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Human Flesh | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Ice Wraith Teeth | Invisibility | 0 | 4 | Grants invisibility for (duration) seconds. | Other |
| Ice Wraith Teeth | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Ice Wraith Teeth | Soulreaping | 0 | 2 | The target becomes vulnerable to soulgems for (dur) seconds. | Other |
| Ice Wraith Teeth | Weakness to Frost | 3 | 30 | The target is (Magnitude)% weaker to frost damage for (duration) seconds. | Weakness |
| Imp Stool | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Imp Stool | Damage Health | 3 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Imp Stool | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Imp Stool | Fortify Carry Weight | 5 | 60 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Jarrin Root | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Jarrin Root | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Jarrin Root | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Jarrin Root | Damage Health | 200 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Jazabay Grapes | Damage Max Health | 1 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Jazabay Grapes | Fortify Magicka | 2 | 60 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Jazabay Grapes | Fortify Magicka Regen | 2 | 300 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Jazabay Grapes | Weakness to Magic | 1 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Juniper Berries | Fortify Marksman | 4 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Juniper Berries | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Juniper Berries | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Juniper Berries | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Juvenile Mudcrab | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Juvenile Mudcrab | Cure Disease | 100 | 0 | Cures all diseases. | Other |
| Juvenile Mudcrab | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Juvenile Mudcrab | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Large Bear Claws | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Large Bear Claws | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Large Bear Claws | Damage Stamina | 4 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Large Bear Claws | Fortify Barter | 2 | 300 | You haggle for (Magnitude)% better prices for (duration) seconds. | Fortify |
| Large Mudcrab Chitin | Fortify Stamina | 4 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Large Mudcrab Chitin | Cure Disease | 5 | 0 | Cures all diseases. | Other |
| Large Mudcrab Chitin | Fortify Armor Rating | 5 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Large Mudcrab Chitin | Fortify Health | 4 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Large Sabre Cat Claws | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Large Sabre Cat Claws | Frenzy | 1 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Large Sabre Cat Claws | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Large Sabre Cat Claws | Fortify Lockpicking | 2 | 30 | Lockpicking skill is increased by (Magnitude) for (duration) seconds. | Fortify |
| Lavender | Fortify Stamina | 4 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Lavender | Fortify Conjuration | 4 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Lavender | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Lavender | Damage Max Magicka | 2 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Luna Moth Wing | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Luna Moth Wing | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Luna Moth Wing | Fortify Armor Rating | 6 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Luna Moth Wing | Invisibility | 0 | 4 | Grants invisibility for (duration) seconds. | Other |
| Lyretail Anthias | Fortify Conjuration | 5 | 60 | Conjurations spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Lyretail Anthias | Fortify Alteration | 5 | 60 | Alteration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Lyretail Anthias | Restore Magicka | 3 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Lyretail Anthias | Fortify Carry Weight | 5 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Mammoth Eye | Fortify Block | 4 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Mammoth Eye | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Mammoth Eye | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Mammoth Eye | Fortify Health Regen | 6 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Mammoth Heart | Fortify Health | 10 | 180 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Mammoth Heart | Fortify Armor Rating | 10 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Mammoth Heart | Fortify Stamina | 5 | 300 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Mammoth Heart | Fortify Carry Weight | 3 | 600 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Monarch Wing | Fortify Barter | 2 | 30 | You haggle for (Magnitude)% better prices for (duration) seconds. | Fortify |
| Monarch Wing | Lingering Damage Stamina | 1 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Monarch Wing | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Monarch Wing | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Moon Moon Sugar | Ineptitude | 0 | 30 | For (duration) seconds, may cause stumbling. | Other |
| Moon Moon Sugar | Ineptitude | 0 | 30 | For (duration) seconds, may cause stumbling. | Other |
| Moon Moon Sugar | Ineptitude | 0 | 30 | For (duration) seconds, may cause stumbling. | Other |
| Moon Moon Sugar | Ineptitude | 0 | 30 | For (duration) seconds, may cause stumbling. | Other |
| Moon Sugar | Fortify Magicka Regen | 5 | 300 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Moon Sugar | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Moon Sugar | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Moon Sugar | Restore Magicka | 3 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Mora Tapinella | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Mora Tapinella | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Mora Tapinella | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Mora Tapinella | Fortify Illusion | 4 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Mudcrab Chitin | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Mudcrab Chitin | Resist Shock | 4 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Mudcrab Chitin | Resist Poison | 5 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Mudcrab Chitin | Resist Fire | 3 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Namira's Rot | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Namira's Rot | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Namira's Rot | Fortify Lockpicking Expertise | 1 | 30 | Lockpicking expertise is increased by (Magnitude) for (duration) seconds. | Fortify |
| Namira's Rot | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Netch Jelly | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Netch Jelly | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Netch Jelly | Damage Health | 10 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Netch Jelly | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Nightshade | Lingering Damage Stamina | 1 | 10 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Nightshade | Damage Health | 5 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Nightshade | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Nightshade | Fortify Destruction | 4 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Nirnroot | Damage Health | 15 | 0 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Nirnroot | Resist Magic | 4 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Nirnroot | Invisibility | 0 | 16 | Grants invisibility for (duration) seconds. | Other |
| Nirnroot | Damage Stamina | 15 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Nordic Barnacle | Waterbreathing | 0 | 5 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Nordic Barnacle | Fortify Pickpocket | 4 | 60 | Pickpocketing is (Magnitude)% easier for (duration) seconds. | Fortify |
| Nordic Barnacle | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Nordic Barnacle | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Northern Flax | Fortify Restoration | 2 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Northern Flax | Resist Frost | 2 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Northern Flax | Lingering Damage Magicka | 1 | 19 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Northern Flax | Restore Health | 0 | 10 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Oil of Vitriol | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Oil of Vitriol | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Oil of Vitriol | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Oil of Vitriol | Damage Health | 3 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Orange Dartwing | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Orange Dartwing | Damage Max Magicka | 2 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Orange Dartwing | Fortify Pickpocket | 4 | 60 | Pickpocketing is (Magnitude)% easier for (duration) seconds. | Fortify |
| Orange Dartwing | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Panacea | Restore Magicka | 2 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Panacea | Fortify Block | 4 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Panacea | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Panacea | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Pearl | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Pearl | Restore Magicka | 2 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Pearl | Fortify Block | 4 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Pearl | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Pearlfish | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Pearlfish | Fortify One-Handed | 4 | 60 | One-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Pearlfish | Spell Absorption | 20 | 30 | Allows you to absorb (Magnitude)% of the Magicka from hostile spells for (duration) seconds. | Other |
| Pearlfish | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Pine Thrush Egg | Fortify Lockpicking Expertise | 1 | 30 | Lockpicking expertise is increased by (Magnitude) for (duration) seconds. | Fortify |
| Pine Thrush Egg | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Pine Thrush Egg | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Pine Thrush Egg | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Poisonous Bloom | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Poisonous Bloom | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Poisonous Bloom | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Poisonous Bloom | Damage Health | 3 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Polished Bear Eye | Exploit Weakness | 0 | 10 | Once affected by this poison, further venoming causes the victim to stagger. Lasts (duration) seconds. | Other |
| Polished Bear Eye | Fortify Health | 4 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Polished Bear Eye | Fortify Stamina | 5 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Polished Bear Eye | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Polished Boar Eye | Fortify Health Regen | 5 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Polished Boar Eye | Hunter's Boon | 2 | 600 | Bows do (Magnitude)% more damage. The effect ends indoors. | Other |
| Polished Boar Eye | Ineptitude | 0 | 10 | For (duration) seconds, may cause stumbling. | Other |
| Polished Boar Eye | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Polished Dragon Eye | Fortify Shouts | 0 | 120 | Time between shouts is reduced 10%. | Fortify |
| Polished Dragon Eye | Fortify Armor Rating | 5 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Polished Dragon Eye | Resist Magic | 3 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Polished Dragon Eye | Fear | 3 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Polished Fox Eye | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Polished Fox Eye | Resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Polished Fox Eye | Discerning | 1 | 30 | Within (duration) seconds, you will discern a random effect of the first ingredient you consume.  | Other |
| Polished Fox Eye | Invisibility | 0 | 4 | Grants invisibility for (duration) seconds. | Other |
| Polished Hare Eye | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Polished Hare Eye | Fortify Marksman | 4 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Polished Hare Eye | Weakness to Shock | 3 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Polished Hare Eye | Fortify Lockpicking | 2 | 30 | Lockpicking skill is increased by (Magnitude) for (duration) seconds. | Fortify |
| Polished Mammoth Eye | Fortify Health | 6 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Polished Mammoth Eye | Resist Shock | 4 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Polished Mammoth Eye | Fortify Carry Weight | 5 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Polished Mammoth Eye | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Polished Sabre Cat Eye | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Polished Sabre Cat Eye | Prowling | 2 | 600 | You are (Magnitude)% harder to detect. The effect ends indoors. | Other |
| Polished Sabre Cat Eye | Resist Fire | 3 | 90 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Polished Sabre Cat Eye | Invisibility | 0 | 5 | Grants invisibility for (duration) seconds. | Other |
| Polished Slaughterfish Scale | Resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Polished Slaughterfish Scale | Waterbreathing | 0 | 10 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Polished Slaughterfish Scale | Frenzy | 1 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Polished Slaughterfish Scale | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Polished Troll Eye | Fortify Health | 4 | 300 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Polished Troll Eye | Resist Fire | 3 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Polished Troll Eye | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Polished Troll Eye | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Polished Werewolf Eye | Fortify Unarmed Damage | 10 | 60 | Unarmed strikes do 10 additional damage for 60 Seconds. | Fortify |
| Polished Werewolf Eye | Frenzy | 2 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Polished Werewolf Eye | Invisibility | 0 | 4 | Grants invisibility for (duration) seconds. | Other |
| Polished Werewolf Eye | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Polished Wolf Eye | Frenzy | 1 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Polished Wolf Eye | Hunter's Boon | 2 | 600 | Bows do (Magnitude)% more damage. The effect ends indoors. | Other |
| Polished Wolf Eye | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Polished Wolf Eye | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Powdered Mammoth Tusk | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Powdered Mammoth Tusk | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Powdered Mammoth Tusk | Weakness to Fire | 3 | 30 | The target is (Magnitude)% weaker to fire damage for (duration) seconds. | Weakness |
| Powdered Mammoth Tusk | Restore Stamina | 3 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Powdered Mudcrab Chitin | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Powdered Mudcrab Chitin | Damage Health | 5 | 0 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Powdered Mudcrab Chitin | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Powdered Mudcrab Chitin | Consumption | 1 | 60 | Wastes away (Magnitude) health and stamina, per second, over (duration) seconds. | Other |
| Purple Mountain Flower | Restore Stamina | 0 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Purple Mountain Flower | Lingering Damage Magicka | 1 | 5 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Purple Mountain Flower | Resist Frost | 1 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Purple Mountain Flower | Fortify Sneak | 2 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Pygmy Sunfish | Lingering Damage Magicka | 1 | 10 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Pygmy Sunfish | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Pygmy Sunfish | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Pygmy Sunfish | Fortify Restoration | 5 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Red Glitterdust | Damage Stamina | 3 | 60 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Red Glitterdust | Restore Magicka | 2 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Red Glitterdust | Damage Health | 10 | 0 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Red Glitterdust | Fortify Carry Weight | 5 | 600 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Red Mountain Flower | Damage Max Magicka | 1 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Red Mountain Flower | Fortify Magicka | 2 | 60 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Red Mountain Flower | Restore Magicka | 0 | 10 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Red Mountain Flower | Damage Health | 1 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| River Betty | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| River Betty | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| River Betty | Damage Health | 5 | 0 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| River Betty | Fortify Alteration | 4 | 60 | Alteration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Rock Warbler Egg | Weakness to Magic | 2 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Rock Warbler Egg | Fortify One-Handed | 4 | 60 | One-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Rock Warbler Egg | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Rock Warbler Egg | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Sabre Cat Claws | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Sabre Cat Claws | Fortify Health | 4 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Sabre Cat Claws | Fortify Illusion | 4 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Sabre Cat Claws | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Sabre Cat Eye | Thermal Vision | 0 | 20 | Predator Vision for (duration) seconds. | Other |
| Sabre Cat Eye | Restore Stamina | 2 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Sabre Cat Eye | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Sabre Cat Eye | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Sabre Cat Heart | Damage Magicka | 5 | 10 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Sabre Cat Heart | Resist Magic | 3 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Sabre Cat Heart | Damage Max Magicka | 4 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Sabre Cat Heart | Fortify Sneak | 2 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Sabre Cat Tooth | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Sabre Cat Tooth | Fortify Stamina | 4 | 30 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Sabre Cat Tooth | Fortify Armor Rating | 5 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Sabre Cat Tooth | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Salmon Roe | Restore Stamina | 2 | 0 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Salmon Roe | Fortify Magicka Regen | 5 | 300 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Salmon Roe | Fortify Magicka | 50 | 5 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Salmon Roe | Waterbreathing | 0 | 60 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Salt | Weakness to Magic | 1 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Salt | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Salt | Fortify Magicka Regen | 5 | 300 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Salt | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Salt Pile | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Salt Pile | Weakness to Magic | 2 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Salt Pile | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Salt Pile | Fortify Magicka Regen | 5 | 300 | Magicka regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Sapphire Glitterdust | Damage Stamina | 3 | 60 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Sapphire Glitterdust | Waterbreathing | 0 | 30 | The imbiber grants the ability to breathe underwater for (duration) seconds. | Other |
| Sapphire Glitterdust | Cure Poison | 5 | 0 | Stops poison's continuing effects. | Other |
| Sapphire Glitterdust | Resist Poison | 5 | 180 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Scaly Pholiota | Fortify Illusion | 4 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Scaly Pholiota | Weakness to Magic | 2 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Scaly Pholiota | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Scaly Pholiota | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Scathecraw | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Scathecraw | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Scathecraw | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Scathecraw | Damage Max Magicka | 2 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Silverside Perch | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Silverside Perch | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Silverside Perch | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Silverside Perch | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Skeever Tail | Damage Health | 2 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Skeever Tail | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Skeever Tail | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Skeever Tail | Fortify Armor Rating | 6 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Slaughterfish Egg | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Slaughterfish Egg | Fortify Pickpocket | 4 | 60 | Pickpocketing is (Magnitude)% easier for (duration) seconds. | Fortify |
| Slaughterfish Egg | resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Slaughterfish Egg | Fortify Stamina | 4 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Slaughterfish Scales | Fortify Block | 4 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Slaughterfish Scales | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Slaughterfish Scales | Fortify Armor Rating | 8 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Slaughterfish Scales | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Small Pearl | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Small Pearl | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Small Pearl | Fortify One-Handed | 4 | 60 | One-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Small Pearl | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Snowberries | Resist Shock | 2 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Snowberries | Fortify Stamina Regen | 1 | 20 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Snowberries | Resist Frost | 2 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Snowberries | Resist Fire | 2 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Spadefish | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Spadefish | Fortify Pickpocket | 4 | 60 | Pickpocketing is (Magnitude)% easier for (duration) seconds. | Fortify |
| Spadefish | Fortify Lockpicking Expertise | 2 | 30 | Lockpicking expertise is increased by (Magnitude) for (duration) seconds. | Fortify |
| Spadefish | Cure Disease | 100 | 0 | Cures all diseases. | Other |
| Spawn Ash | Resist Fire | 2 | 60 | Resists (Magnitude)% of fire damage for (duration) seconds. | Resist |
| Spawn Ash | Damage Max Magicka | 2 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| Spawn Ash | Fortify Illusion | 3 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Spawn Ash | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Spider Egg | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Spider Egg | Damage Stamina | 3 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Spider Egg | Fortify Lockpicking Expertise | 1 | 30 | Lockpicking expertise is increased by (Magnitude) for (duration) seconds. | Fortify |
| Spider Egg | Fortify Marksman | 4 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Spriggan Sap | Fortify Alteration | 4 | 60 | Alteration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Spriggan Sap | Damage Magicka Regen | 100 | 5 | Decreases the target's Magicka regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Spriggan Sap | Fortify Restoration | 4 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Spriggan Sap | Fortify Illusion | 4 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Strange Remains | Resist Shock | 5 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Strange Remains | Fortify Destruction | 5 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Strange Remains | Invisibility | 0 | 60 | Grants invisibility for (duration) seconds. | Other |
| Strange Remains | Soulreaping | 0 | 10 | The target becomes vulnerable to soulgems for (dur) seconds. | Other |
| Swamp Fungal Pod | Resist Shock | 3 | 60 | Resists (Magnitude)% of shock damage for (duration) seconds. | Resist |
| Swamp Fungal Pod | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Swamp Fungal Pod | Lingering Damage Magicka | 1 | 10 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Swamp Fungal Pod | Damage Health | 5 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Taproot | Fortify Illusion | 4 | 60 | Illusion spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Taproot | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| Taproot | Fortify Marksman | 5 | 300 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Taproot | Weakness to Magic | 2 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Thistle Branch | Resist Frost | 3 | 60 | Resists (Magnitude)% of frost damage for (duration) seconds. | Resist |
| Thistle Branch | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Thistle Branch | Fortify Armor Rating | 6 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Thistle Branch | Resist Poison | 3 | 0 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Torchbug Abdomen | Restore Stamina | 1 | 20 | Restores (Magnitude) points of Stamina for (duration) seconds. | Restore |
| Torchbug Abdomen | Weakness to Magic | 2 | 30 | The target is (Magnitude)% weaker to magic for (duration) seconds. | Weakness |
| Torchbug Abdomen | Lingering Damage Magicka | 1 | 10 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Torchbug Abdomen | Fortify Stamina | 4 | 60 | Stamina is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Trama Root | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Trama Root | Weakness to Shock | 3 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Trama Root | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Trama Root | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Troll Eye | Fortify Health Regen | 6 | 300 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Troll Eye | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Troll Eye | Fortify Block | 4 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Troll Eye | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Troll Fat | Frenzy | 2 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Troll Fat | Resist Poison | 4 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Troll Fat | Fortify Two-Handed | 4 | 60 | Two-handed weapons do (Magnitude)% more damage for (duration) seconds. | Fortify |
| Troll Fat | Damage Health | 2 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Troll Heart | Fortify Stamina Regen | 5 | 300 | Stamina regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Troll Heart | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Troll Heart | Damage Stamina | 5 | 0 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Troll Heart | Damage Max Stamina | 2 | 10 | Concentrated poison temporarily reduces maximum and current Stamina by (Magnitude) points for (duration) seconds. | Damage |
| Tundra Cotton | Fortify Magicka | 3 | 60 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Tundra Cotton | Fortify Block | 3 | 60 | Blocking absorbs (Magnitude)% more damage for (duration) seconds. | Fortify |
| Tundra Cotton | Fortify Barter | 2 | 30 | You haggle for (Magnitude)% better prices for (duration) seconds. | Fortify |
| Tundra Cotton | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Vampire Dust | Sanguinare Vampiris | 20 | 4 | Chance of contracting the disease | Other |
| Vampire Dust | Invisibility | 0 | 15 | Grants invisibility for (duration) seconds. | Other |
| Vampire Dust | Thermal Vision | 0 | 20 | Predator Vision for (duration) seconds. | Other |
| Vampire Dust | Cure Poison | 5 | 0 | Stops poison's continuing effects. | Other |
| Venomous Spittle | Paralysis | 0 | 1 | The target is paralyzed for (duration) seconds. | Other |
| Venomous Spittle | Damage Health | 10 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Venomous Spittle | Lingering Damage Health | 1 | 60 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Venomous Spittle | Lingering Damage Stamina | 1 | 60 | Drains the target's Stamina by (Magnitude) points per second for (duration) seconds. | Lingering |
| Void Salts | Damage Health | 10 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Void Salts | Fortify Magicka | 8 | 300 | Magicka is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Void Salts | Weakness to Shock | 20 | 30 | The target is (Magnitude)% weaker to shock damage for (duration) seconds. | Weakness |
| Void Salts | Resist Magic | 3 | 300 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Werewolf Eye | Hunter's Boon | 2 | 600 | Bows do (Magnitude)% more damage. The effect ends indoors. | Other |
| Werewolf Eye | Resist Poison | 5 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Werewolf Eye | Fortify Sneak | 4 | 60 | You are (Magnitude)% harder to detect for (duration) seconds. | Fortify |
| Werewolf Eye | Fear | 2 | 30 | Creatures and people up to level (Magnitude) flee from combat for (duration) seconds. | Other |
| Werewolf Heart | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Werewolf Heart | Fortify Health Regen | 5 | 0 | Health regenerates (Magnitude)% faster for (duration) seconds. | Fortify |
| Werewolf Heart | Frenzy | 1 | 10 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Werewolf Heart | Damage Health | 5 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Wheat | Restore Health | 1 | 20 | Restores (Magnitude) points of Health for (duration) seconds. | Restore |
| Wheat | Lingering Damage Magicka | 1 | 10 | Drains the target's Magicka by (Magnitude) points per second for (duration) seconds. | Lingering |
| Wheat | Fortify Health | 2 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Wheat | Damage Stamina Regen | 100 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| White Cap | Weakness to Frost | 3 | 30 | The target is (Magnitude)% weaker to frost damage for (duration) seconds. | Weakness |
| White Cap | Restore Magicka | 1 | 20 | Restores (Magnitude) Magicka for (duration) seconds. | Restore |
| White Cap | Damage Max Magicka | 2 | 10 | Concentrated poison temporarily reduces maximum and current Magicka by (Magnitude) points for (duration) seconds. | Damage |
| White Cap | Fortify Armor Rating | 6 | 60 | Increases armor rating by (Magnitude) points for (duration) seconds. | Fortify |
| Wisp Wrappings | Resist Magic | 1 | 60 | Resists (Magnitude)% of magic for (duration) seconds. | Resist |
| Wisp Wrappings | Fortify Carry Weight | 4 | 300 | Carrying capacity increases by (Magnitude) for (duration) seconds. | Fortify |
| Wisp Wrappings | Fortify Destruction | 5 | 60 | Destruction spells cost (Magnitude)% less for (duration) seconds. | Fortify |
| Wisp Wrappings | Soulreaping | 0 | 4 | The target becomes vulnerable to soulgems for (dur) seconds. | Other |
| Wolf Claws | Fortify Marksman | 4 | 60 | Ranged weapons deal (Magnitude)% more damage for (duration) seconds. | Fortify |
| Wolf Claws | Weakness to Poison | 2 | 30 | The target is (Magnitude)% weaker to poison for (duration) seconds. | Weakness |
| Wolf Claws | Damage Max Health | 2 | 10 | Concentrated poison temporarily reduces maximum and current Health by (Magnitude) points for (duration) seconds. | Damage |
| Wolf Claws | Tardiness | 50 | 5 | Decreases the target's movement speed drastically for (duration) seconds. | Other |
| Wolf Eye | Hircine's Sight | 0 | 10 | For (duration) seconds, you can focus to see farther when aiming a bow. | Other |
| Wolf Eye | Damage Health | 4 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Wolf Eye | Lingering Damage Health | 1 | 10 | Drains the target's Health by (Magnitude) points per second for (duration) seconds. | Lingering |
| Wolf Eye | Night Vision | 0 | 60 | Night Eye for (duration) seconds. | Other |
| Wolf Heart | Damage Stamina | 5 | 5 | Drains the target's Stamina by (Magnitude) points over (duration) Seconds. | Damage |
| Wolf Heart | Damage Magicka | 3 | 0 | Immediately drains the target's Magicka by (Magnitude) points. | Damage |
| Wolf Heart | Damage Health | 3 | 1 | Immediately drains the target's Health by (Magnitude) points. | Damage |
| Wolf Heart | Frenzy | 2 | 20 | Creatures and people up to level (Magnitude) will attack anything nearby for (duration) seconds. | Other |
| Yellow Mountain Flower | Damage Stamina Regen | 50 | 5 | Decreases the target's Stamina regeneration by (Magnitude)% for (duration) seconds. | Damage |
| Yellow Mountain Flower | Resist Poison | 2 | 60 | Resists (Magnitude)% of poison effects for (duration) seconds. | Resist |
| Yellow Mountain Flower | Fortify Health | 5 | 60 | Health is increased by (Magnitude) points for (duration) seconds. | Fortify |
| Yellow Mountain Flower | Fortify Restoration | 2 | 60 | Restoration spells cost (Magnitude)% less for (duration) seconds. | Fortify |

</div>