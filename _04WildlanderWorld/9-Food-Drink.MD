---
layout: default
title: Food & Drink
nav_order: 7
description: Food, drinks, and sustenance in Wildlander
---

<style>
#foodDrinkSearch {
  padding: 8px 12px;
  background-color: #462b53;
  border: 2px solid #50098a;
  border-radius: 4px;
  color: #e6e6e6;
  font-size: 14px;
  font-family: inherit;
  min-width: 200px;
}

#foodDrinkSearch::placeholder {
  color: #999;
}

#foodDrinkSearch:focus {
  outline: none;
  border-color: #f77ef1;
  box-shadow: 0 0 8px rgba(247, 126, 241, 0.3);
}

#clearFoodDrinkFilters {
  padding: 8px 16px;
  background-color: #50098a;
  border: 2px solid #50098a;
  border-radius: 4px;
  color: #e6e6e6;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
}

#clearFoodDrinkFilters:hover {
  background-color: #f77ef1;
  color: #222222;
  border-color: #f77ef1;
}

.food-drink-controls {
  margin-bottom: 20px;
  padding: 15px 20px;
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
  align-items: center;
  background: linear-gradient(135deg, #2a2a2a 0%, #1f1f1f 100%);
  border: 2px solid #50098a;
  border-radius: 4px;
}

.filter-result-count-food-drink {
  color: #f77ef1;
  font-size: 14px;
  font-weight: 500;
  padding-left: 10px;
}

.food-drink-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initFoodDrinkFilters() {
  const table = document.querySelector('.food-drink-table table');
  if (!table) {
    console.warn('Food Drink table not found');
    return;
  }
  
  document.getElementById('foodDrinkSearch').addEventListener('input', filterFoodDrinkTable);
  updateFilterCountFoodDrink();
}

function filterFoodDrinkTable() {
  const table = document.querySelector('.food-drink-table table');
  if (!table) return;
  
  const searchTerm = document.getElementById('foodDrinkSearch').value.toLowerCase();
  const rows = table.querySelectorAll('tbody tr');
  let visibleCount = 0;
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length < 3) return;
    
    const foodItem = cells[0].textContent.toLowerCase();
    const ingredients = cells[1].textContent.toLowerCase();
    const effects = cells[2].textContent.toLowerCase();
    
    const matchesSearch = !searchTerm || 
                         foodItem.includes(searchTerm) ||
                         ingredients.includes(searchTerm) ||
                         effects.includes(searchTerm);
    
    row.style.display = matchesSearch ? '' : 'none';
    if (matchesSearch) visibleCount++;
  });
  
  updateFilterCountFoodDrink(visibleCount, rows.length);
}

function updateFilterCountFoodDrink(visible, total) {
  const table = document.querySelector('.food-drink-table table');
  if (!table) return;
  
  if (visible === undefined) {
    visible = Array.from(table.querySelectorAll('tbody tr')).filter(row => row.style.display !== 'none').length;
    total = table.querySelectorAll('tbody tr').length;
  }
  
  const countElement = document.getElementById('filterResultCountFoodDrink');
  if (countElement) {
    countElement.textContent = 'Showing ' + visible + ' of ' + total + ' items';
  }
}

function clearFoodDrinkFilters() {
  document.getElementById('foodDrinkSearch').value = '';
  filterFoodDrinkTable();
}

initFoodDrinkFilters();

});
</script>

<div class="food-drink-controls">
  <input type="text" id="foodDrinkSearch" placeholder="Search food & drink..." />
  <button id="clearFoodDrinkFilters" onclick="clearFoodDrinkFilters()">Clear</button>
  <div id="filterResultCountFoodDrink" class="filter-result-count-food-drink"></div>
</div>

<div class="food-drink-table" markdown="1">

| Food Item | Ingredients | Effects |
|-----------|-----------|----------|
Ale Braised Sabre Cat|1 Ale 1 Raw Sabre Cat Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds.
Apple Cabbage Stew|1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water)|Consumed out of combat, it restores 50 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth
Apple Dumpling|2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter|Consumed out of combat, it restores 5 Stamina and Magicka.,Ranged weapons deal 5% more damage for 1200 seconds.
Apple Pie|1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter|Consumed out of combat, it restores 50 Stamina and Magicka.,Magicka is increased by 10 points for 1200 seconds.
Ash Yam||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina.
Bear and Bear Chowder|1 Ale 1 Goat Cheese Slice 1 Blue Mountain Flower 1 Bottled Milk 1 Raw Bear Meat|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth
Bear Carrot Stew|1 Carrot 1 Raw Bear Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 25 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth
Bear Jerky|6 Salt 1 Raw Bear Meat|Consumed out of combat, it restores 1 Stamina.
Beef Jerky|6 Salt 1 Raw Beef|Consumed out of combat, it restores 1 Stamina.
Beef Stew|1 Salt 1 Garlic 1 Carrot 1 Raw Beef 1 Glass Bottle (Water)|Consumed out of combat, it restores 75 Stamina and Magicka.,Health is increased by 50 points for 1800 seconds.,Carry weight is increased by 25 points for 1800 seconds.,Your meal improves your warmth
Beggar's Broth|1 Raw Horse Meat 2 Purple Mountain Flower 1 Glass Bottle (Water)|Consumed out of combat, it restores 20 Stamina and Magicka.,Carry weight is increased by 35 points for 7200 seconds.,Your meal improves your warmth
Bestial Stew|1 Raw Salmon Steak 1 Bottled Milk 1 Wolf Heart 3 Raw Wolf Meat|A stew tartare which restores 2 Stamina per second for 1800 seconds.,Consumed out of combat, it restores 200 Stamina and Magicka.,Your meal improves your warmth,Only they can enjoy this meal without vomiting.
Boar Jerky|6 Salt 1 Raw Boar Meat|Consumed out of combat, it restores 1 Stamina.
Boar Leek Stew|1 Leek 1 Raw Boar Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 900 seconds.,Your meal improves your warmth
Boar Potato Stew|1 Potato 1 Raw Boar Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 900 seconds.,Your meal improves your warmth
Boiled Cabbage and Mammoth|1 Cabbage 1 Raw Mammoth Meat|Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth
Boiled Creme Treat||Consumed out of combat, it restores 25 Stamina and Magicka.,Magicka is increased by 5 points for 300 seconds.
Braided Bread|1 Salt 2 Flour 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Carry weight is increased by 10 points for 1200 seconds.
Breaded Elk Cutlet|1 Chicken's Egg 1 Bread Loaf 1 Raw Elk Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.
Bread Half-Loaf||Consumed out of combat, it restores 20 Stamina and Magicka.
Bread Loaf|1 Salt 1 Flour 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.
Butter|1 Bottled Milk|Consumed out of combat, it restores 2 Stamina and Magicka.
Cabbage||Consumed out of combat, it restores 10 Stamina and Magicka.
Cabbage Potato Soup|1 Salt 1 Cabbage 1 Potato 1 Leek 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 20% faster for 1200 seconds.,Your meal improves your warmth
Cabbage Soup|1 Salt 1 Cabbage 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 15% faster for 1200 seconds.,Your meal improves your warmth
Carrot||Consumed out of combat, it restores 5 Stamina and Magicka.
Chaurus Jerky|6 Salt 1 Raw Chaurus Meat|Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable.
Chaurus Pie|2 Salt 1 Red Apple 1 Carrot 1 Potato 1 Tomato 1 Honeycomb 1 Raw Chaurus Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1200 seconds.
Cheesy Potato Mammoth|1 Nord Mead 1 Goat Cheese Slice 1 Potato 1 Bottled Milk 1 Raw Mammoth Meat|Consumed out of combat, it restores 25 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth
Chicken Dumpling|1 Salt 1 Garlic 2 Leek 2 Raw Chicken Breast 1 Flour|Consumed out of combat, it restores 15 Stamina and Magicka.,One-handed weapons do 5% more damage for 1200 seconds.,Two-handed weapons do 5% more damage for 1200 seconds.
Chicken Jerky|6 Salt 1 Raw Chicken Breast|Consumed out of combat, it restores 1 Stamina.
Clam Chowder|1 Potato 1 Raw Clam Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 75 Stamina and Magicka.,Your meal improves your warmth
Cooked Angelfish|1 Angelfish|Consumed out of combat, it restores 40 Stamina.,,Restores 1 points of Health per second for 300 seconds.
Cooked Angler|1 Raw Angler|Consumed out of combat, it restores 150 Stamina.
Cooked Angler Larvae|1 Angler Larvae|Consumed out of combat, it restores 40 Stamina.
Cooked Arctic Char|1 Raw Arctic Char|Consumed out of combat, it restores 100 Stamina.,
Cooked Arctic Grayling|1 Raw Arctic Grayling|Consumed out of combat, it restores 50 Stamina.,
Cooked Ash Hopper Leg||Consumed out of combat, it restores 30 Stamina.
Cooked Ash Hopper Meat||Consumed out of combat, it restores 30 Stamina.
Cooked Bear Meat|1 Raw Bear Meat|Consumed out of combat, it restores 65 Stamina and Magicka.
Cooked Beef|1 Raw Beef|Consumed out of combat, it restores 140 Stamina.
Cooked Boar Meat||Consumed out of combat, it restores 135 Stamina.
Cooked Brook Bass|1 Raw Brook Bass|Consumed out of combat, it restores 50 Stamina.,
Cooked Carp|1 Raw Carp|Consumed out of combat, it restores 50 Stamina.,
Cooked Catfish|1 Raw Catfish|Consumed out of combat, it restores 100 Stamina.,
Cooked Chaurus Meat|1 Raw Chaurus Meat|Consumed out of combat, it restores 10 Stamina and Magicka.
Cooked Chicken Breast|2 Raw Chicken Breast|Consumed out of combat, it restores 50 Stamina.
Cooked Cod|1 Raw Cod|Consumed out of combat, it restores 100 Stamina and Magicka.,
Cooked Direfish|1 Raw Direfish|Consumed out of combat, it restores 100 Stamina.,
Cooked Dog Meat|1 Raw Dog Meat|Consumed out of combat, it restores 15 Stamina and Magicka.
Cooked Dragon Meat|1 Raw Dragon Meat|Consumed out of combat, it restores 30 Stamina and Magicka.,Restores 1 points of Stamina per second for 5400 seconds.
Cooked Elk Meat|1 Raw Elk Meat|Consumed out of combat, it restores 20 Stamina and Magicka.
Cooked Fat|1 Animal Fat|Consumed out of combat, it restores 1 Stamina.
Cooked Fox Meat|1 Raw Fox Meat|Consumed out of combat, it restores 10 Stamina and Magicka.
Cooked Glass Catfish|1 Raw Glass Catfish|Consumed out of combat, it restores 50 Stamina and Magicka.,
Cooked Glassfish|1 Glassfish|Consumed out of combat, it restores 40 Stamina and Magicka.,
Cooked Goat Leg|1 Raw Goat Leg|Consumed out of combat, it restores 130 Stamina.
Cooked Goat Meat|1 Raw Goat Meat|Consumed out of combat, it restores 40 Stamina and Magicka.
Cooked Goldfish|1 Goldfish|Consumed out of combat, it restores 40 Stamina.,
Cooked Horker Meat|1 Raw Horker Meat|Consumed out of combat, it restores 110 Stamina.
Cooked Horse Meat|1 Raw Horse Meat|Consumed out of combat, it restores 120 Stamina.
Cooked Juvenile Mudcrab|1 Juvenile Mudcrab|Consumed out of combat, it restores 40 Stamina.,
Cooked Leeks|1 Leek|Consumed out of combat, it restores 15 Stamina and Magicka.
Cooked Lyretail Anthias|1 Lyretail Anthias|Consumed out of combat, it restores 40 Stamina and Magicka.,,Magicka is increased by 50 points for 300 seconds.
Cooked Mammoth Meat|1 Raw Mammoth Meat|Consumed out of combat, it restores 150 Stamina.
Cooked Mammoth Snout|1 Raw Mammoth Snout|Consumed out of combat, it restores 200 Stamina.
Cooked Mudcrab|1 Raw Mudcrab Meat|Consumed out of combat, it restores 10 Stamina and Magicka.
Cooked Mudcrab Legs|1 Raw Mudcrab Legs|Consumed out of combat, it restores 40 Stamina.
Cooked Pearlfish|1 Pearlfish|Consumed out of combat, it restores 40 Stamina and Magicka.,
Cooked Pheasant Breast|1 Raw Pheasant Breast|Consumed out of combat, it restores 50 Stamina.
Cooked Pogfish|1 Raw Pogfish|Consumed out of combat, it restores 100 Stamina.,
Cooked Potatoes|1 Potato|Consumed out of combat, it restores 10 Stamina and Magicka.
Cooked Pygmy Sunfish|1 Pygmy Sunfish|Consumed out of combat, it restores 40 Stamina.,
Cooked Rabbit Leg|1 Raw Rabbit Leg|Consumed out of combat, it restores 50 Stamina.
Cooked Rabbit Meat|1 Raw Rabbit Meat|Consumed out of combat, it restores 20 Stamina and Magicka.
Cooked Sabre Cat Meat|1 Raw Sabre Cat Meat|Consumed out of combat, it restores 50 Stamina and Magicka.
Cooked Salmon Steak|1 Raw Salmon|Consumed out of combat, it restores 40 Stamina.
Cooked Scorpion Fish|1 Raw Scorpion Fish|Consumed out of combat, it restores 100 Stamina.,,Resists 60% of poison effects for 300 seconds.
Cooked Skeever Meat|1 Raw Skeever Meat|Consumed out of combat, it restores 30 Stamina.
Cooked Slaughterfish|1 Raw Slaughterfish|Consumed out of combat, it restores 50 Stamina.
Cooked Spadefish|1 Spadefish|Consumed out of combat, it restores 40 Stamina.,
Cooked Spider Meat|1 Raw Spider Meat|Consumed out of combat, it restores 10 Stamina and Magicka.,Sticky and sweet.
Cooked Tripod Spiderfish|1 Raw Tripod Spiderfish|Consumed out of combat, it restores 50 Stamina.,
Cooked Troll Meat|1 Raw Troll Meat|Consumed out of combat, it restores 20 Stamina and Magicka.
Cooked Vampire Fish|1 Raw Vampire Fish|Consumed out of combat, it restores 100 Stamina and Magicka.,
Cooked Venison|1 Raw Venison|Consumed out of combat, it restores 150 Stamina.
Cooked Wolf Meat|1 Raw Wolf Meat|Consumed out of combat, it restores 35 Stamina and Magicka.
Crab Cakes|1 Salt 1 Flour 1 Raw Mudcrab Meat|Consumed out of combat, it restores 40 Stamina.,Blocking absorbs 5% more damage for 300 seconds.,
Crab Stew|1 Garlic 1 Potato 1 Leek 1 Raw Mudcrab Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 75 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth
Creamy Crab Bisque|1 Salt 1 Flour 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Stamina is increased by 25 points for 1200 seconds.,Your meal improves your warmth,Restores 1 points of Magicka per second for 1200 seconds.
Deviled Chaurus|1 Thistle Branch 1 Bleeding Crown 1 Raw Chaurus Meat|Consumed out of combat, it restores 10 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.
Dog Jerky|6 Salt 1 Raw Dog Meat|Consumed out of combat, it restores 1 Stamina.,A cheap iron ration.
Dragon Blood Pudding|1 Jazbay Grapes 1 Moon Sugar 1 Dragon's Blood|Health regenerates 4% faster for 600 seconds.,Restores 2 points of Stamina per second for 3000 seconds.,Your meal improves your warmth
Dragon Heart Stew|1 Ale 1 Fire Salts 1 Potato 1 Tomato 1 Dragon Heart|Consumed out of combat, it restores 45 Stamina and Magicka.,Resists 15% of fire damage for 3000 seconds.,Your meal improves your warmth,Called revenge if served chilled.
Dragon Jerky|6 Salt 1 Raw Dragon Meat|Consumed out of combat, it restores 1 Stamina.
Dragon Stuffed Rabbit|2 Dragon's Tongue 1 Raw Rabbit Meat|Consumed out of combat, it restores 5 Stamina and Magicka.,Restores 1 points of Stamina per second for 6000 seconds.,An excellent ironic ration.
Dragon Vegetable Stew|2 Carrot 2 Potato 1 Raw Dragon Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 35 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds.,Your meal improves your warmth
Edible Berries||Consumed out of combat, it restores 10 Stamina and Magicka.
Edible Berry||Consumed out of combat, it restores 3 Stamina and Magicka.
Edible Flower||Consumed out of combat, it restores 3 Stamina and Magicka.
Edible Insect||Consumed out of combat, it restores 3 Stamina and Magicka.
Edible Mushroom||Consumed out of combat, it restores 3 Stamina and Magicka.
Edible Root||Consumed out of combat, it restores 3 Stamina and Magicka.
Eidar Cheese Slice||Consumed out of combat, it restores 15 Stamina and Magicka.
Eidar Cheese Wedge||Consumed out of combat, it restores 30 Stamina and Magicka.
Eidar Cheese Wheel||Consumed out of combat, it restores 90 Stamina and Magicka.
Elf Eared Elk|2 Elves Ear 1 Raw Elk Meat|Consumed out of combat, it restores 25 Stamina and Magicka.,Funny garnish, great taste.
Elsweyr Fondue|1 Ale 6 Eidar Cheese Slice 1 Leek 1 Moon Sugar|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka is increased by 50 points for 1800 seconds.,Restores 1 points of Magicka per second for 1800 seconds.
Marinated Mammoth in Elsweyr Sauce|2 Honningbrew Mead 1 Moon Sugar 1 Raw Mammoth Meat|Restores 1 points of Stamina per second for 7200 seconds.,A long-forgotten secret recipe.,Restores 1 points of Magicka per second for 3600 seconds.
Farmer's Breakfast|1 Tomato 1 Mora Tapinella 1 Raw Boar Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.
Fatty Fin Fry|1 Garlic 1 Raw Horker Meat 1 Grass Pod|Consumed out of combat, it restores 10 Stamina and Magicka.
Fish with Crab Sauce|1 Alto Noir Wine 1 Raw Slaughterfish 1 Raw Mudcrab Meat|Consumed out of combat, it restores 35 Stamina and Magicka.
Flaming Dragon|1 Red Mountain Flower 1 Mulled Wine 1 Raw Dragon Meat|Restores 1 points of Magicka per second for 1200 seconds.,Restores 1 points of Stamina per second for 3000 seconds.,Your meal improves your warmth
Fox Apple Stew|1 Green Apple 1 Raw Fox Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Hunter's comfort food.,Your meal improves your warmth
Fox Herb Cutlet|2 Frost Mirriam 1 Raw Fox Meat|Consumed out of combat, it restores 30 Stamina and Magicka.,Restores 1 points of Stamina per second for 1200 seconds.
Fox in a Hole|1 Carrot 1 Potato 1 Raw Fox Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.
Fox Jerky|6 Salt 1 Raw Fox Meat|Consumed out of combat, it restores 1 Stamina.
Garlic Boar|1 Salt 1 Garlic 1 Raw Boar Meat|Consumed out of combat, it restores 15 Stamina and Magicka.
Garlic Bread|1 Garlic 1 Bread Loaf 1 Butter|Consumed out of combat, it restores 20 Stamina and Magicka.,Increases Disease Resistance by 20% for 1200 seconds.
Glazed Goat Loin|2 Snowberries 1 Honey 1 Raw Goat Meat|Consumed out of combat, it restores 10 Stamina and Magicka.
Goat and Potato Stew|1 Potato 1 Raw Goat Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth
Goat Cheese Slice||Consumed out of combat, it restores 12 Stamina and Magicka.
Goat Cheese Wedge||Consumed out of combat, it restores 24 Stamina and Magicka.
Goat Cheese Wheel||Consumed out of combat, it restores 72 Stamina and Magicka.
Goat Jerky|6 Salt 1 Raw Goat Leg|Consumed out of combat, it restores 1 Stamina.,A cheap iron ration.
Gourd||Consumed out of combat, it restores 5 Stamina and Magicka.
Green Apple||Consumed out of combat, it restores 5 Stamina and Magicka.
High King's Stew|1 Carrot 1 Leek 1 Raw Dragon Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth
Homecooked Meal||With this delicious meal, your beloved spouse has proven to be one of the best cooks you've ever met - even smelling it makes you feel stronger and motivated, increasing Stamina and Magicka regeneration by 50% for 3600 seconds.,
Honey||Consumed out of combat, it restores 15 Stamina and Magicka.,Magicka is increased by 10 points for 300 seconds.
Honeyed Mammoth Roast|1 Honey 1 Raw Mammoth Meat|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.
Honey Nut Treat||Consumed out of combat, it restores 10 Stamina and Magicka.,Magicka is increased by 5 points for 300 seconds.
Horker and Ash Yam Stew|1 Salt 1 Garlic 1 Raw Horker Meat 3 Ash Yam 1 Glass Bottle (Water)|Consumed out of combat, it restores 150 Stamina and Magicka.,Restores 1 points of Stamina per second for 3200 seconds.,Your meal improves your warmth
Horker Jerky|6 Salt 1 Raw Horker Meat|Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable.
Horker Stew|1 Garlic 1 Lavender 1 Tomato 1 Raw Horker Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 75 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth
Horse Jerky|6 Salt 1 Raw Horse Meat|Consumed out of combat, it restores 10 Stamina and Magicka.,A cheap iron ration.
Hot Honey Horker|1 Raw Horker Meat 1 Honey|Consumed out of combat, it restores 10 Stamina and Magicka.,A delight on cold Skyrim nights.,Restores 1 points of Stamina per second for 3000 seconds.
Hunter's Hearty Stew|1 Cabbage 1 Potato 1 Raw Venison 1 Raw Elk Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth
Jazbay Crostata|10 Jazbay Grapes 1 Honey 1 Flour 1 Butter|Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of fire damage for 1200 seconds.
Juniper Berry Crostata|10 Juniper Berries 1 Honey 1 Flour 1 Butter|Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of shock damage for 1200 seconds.
Lavender Honey Dumpling|6 Lavender 1 Moon Sugar 1 Honey 1 Flour|Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of magic for 1200 seconds.
Leek||Consumed out of combat, it restores 5 Stamina and Magicka.
Long Taffy Treat||Consumed out of combat, it restores 5 Stamina and Magicka.,Magicka is increased by 5 points for 300 seconds.
Mammoth Balls|1 Garlic 1 Tomato 1 Raw Mammoth Meat|Consumed out of combat, it restores 5 Stamina and Magicka.,
Mammoth Cheese Bowl||Consumed out of combat, it restores 40 Stamina and Magicka.,Its raw taste is revolting to anyone but those with a strong stomach.,Restores 1 points of Health per second for 300 seconds.
Mammoth Jerky|6 Salt 1 Raw Mammoth Snout|Consumed out of combat, it restores 1 Stamina.,The iron ration of choice for the truly hardened northern hunter.
Mammoth Tomato Stew|2 Tomato 1 Raw Mammoth Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 25 Stamina and Magicka.,Restores 1 points of Stamina per second for 7200 seconds.,Your meal improves your warmth
Mashed Troll|1 Garlic 1 Potato 1 Raw Troll Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.
Mead Braised Bear|1 Nord Mead 1 Raw Bear Meat|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 2400 seconds.
Minced Marinated Bear|1 Salt 2 Juniper Berries 1 Raw Bear Meat|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 2400 seconds.
Morthal Mudders|1 Ale 1 Swamp Fungal Pod 1 Raw Mudcrab Meat|Consumed out of combat, it restores 10 Stamina and Magicka.,Restores 1 points of Stamina per second for 1600 seconds.
Mudcrab Chowder|1 Potato 1 Bottled Milk 1 Raw Mudcrab Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,A stew tartare which restores 1 Stamina per second for 2400 seconds.,Your meal improves your warmth
Mudcrab Egg Scramble|1 Chicken's Egg 1 Raw Mudcrab Meat|Restores 1 points of Stamina per second for 900 seconds.,A hearty, savory breakfast.
Mudcrab Jerky|6 Salt 1 Raw Mudcrab Legs|Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable.
Mullwine Braised Mammoth|1 Mulled Wine 1 Raw Mammoth Meat|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 7200 seconds.
Ocean's Kiss|1 Salt 1 Garlic 1 Raw Clam Meat|Consumed out of combat, it restores 5 Stamina and Magicka.
Pet Bait: Fox (Strange Brew)|1 Raw Chicken Breast 1 Strange Brew|This tasty chicken might lure a wild fox, if I can get close.,Consumed out of combat, it restores 20 Stamina and Magicka.
Placeholder||Consumed out of combat, it restores 35 Stamina and Magicka.
Pet Bait: Rabbit (Strange Brew)|1 Carrot 1 Strange Brew|This tasty carrot might lure a wild hare, if I can get close.,Consumed out of combat, it restores 10 Stamina and Magicka.
Pet Bait: Wolf (Strange Brew)|1 Strange Brew 1 Raw Elk Meat|This odorous meat might lure a wild animal, if I leave it lying out.,Consumed out of combat, it restores 20 Stamina and Magicka.
Pheasant Jerky|6 Salt 1 Raw Pheasant Breast|Consumed out of combat, it restores 1 Stamina.
Poisoner's Stew|1 Nightshade 1 Raw Chaurus Meat 1 Chaurus Venom (Crude)|Drains the target's Health by 1 points per second for 150 seconds.,Resists 80% of poison effects for 120 seconds.,Your meal improves your warmth,A hot and sour soup of questionable value.
Potato||Consumed out of combat, it restores 5 Stamina and Magicka.,Its raw taste is revolting to anyone but those with a strong stomach.
Potato Bread|1 Salt 1 Potato 1 Flour 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Health regenerates 75% faster for 1200 seconds.
Potato Crab Chowder|1 Potato 1 Bottled Milk 1 Butter 1 Raw Mudcrab Meat|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 25% faster for 1200 seconds.,Your meal improves your warmth
Potato Soup|1 Salt 1 Potato 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 10% faster for 1200 seconds.,Your meal improves your warmth
Predator's Price|1 Garlic 1 Raw Venison 1 Raw Bear Meat 1 Raw Wolf Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth
Rabbit Jerky|6 Salt 1 Raw Rabbit Leg|Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable.
Rabbit Mushroom Stew|1 Mora Tapinella 1 Raw Rabbit Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 2000 seconds.,Your meal improves your warmth
Rarebit Ragout|1 Goat Cheese Slice 1 Bread Half-Loaf 1 Raw Rabbit Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1600 seconds.,Your meal improves your warmth
Raw Angler||Consumed out of combat, it restores 90 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Arctic Char||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Arctic Grayling||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Ash Hopper Leg||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 30 Stamina.
Raw Ash Hopper Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 35 Stamina.
Raw Bear Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Raw Beef||Consumed out of combat, it restores 100 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Boar Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 50 Stamina.
Raw Brook Bass||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Carp||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Catfish||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Chaurus Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Raw Chicken Breast||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Clam Meat||Consumed out of combat, it restores 10 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Cod||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Direfish||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Dog Meat||Consumed out of combat, it restores 40 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Dragon Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 30 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Seems remarkably well-preserved.
Raw Elk Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Raw Fox Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Raw Glass Catfish||Consumed out of combat, it restores 30 Stamina and Magicka.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Goat Leg||Consumed out of combat, it restores 90 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Goat Meat||Its raw taste is revolting to anyone but those with a strong stomach.
Raw Horker Meat||Consumed out of combat, it restores 80 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Horse Heart||You move 10% faster if outdoors.,Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Raw Horse Meat||Consumed out of combat, it restores 90 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Human Meat||Consumed out of combat, it restores 50 Stamina and Magicka.,Restores 2 points of Stamina and Magicka per second for 300 seconds - there's just nothing more motivating than the sweet taste of a slain enemy's flesh.,
Raw Mammoth Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 15 Stamina and Magicka.
Raw Mammoth Snout||Consumed out of combat, it restores 125 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Mudcrab Legs||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Mudcrab Meat||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Ox Heart||Carrying capacity increases by 10 if outdoors.,Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Raw Pheasant Breast||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Pogfish||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Rabbit Leg||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Rabbit Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 5 Stamina and Magicka.
Raw Sabre Cat Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Raw Salmon||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Salmon Steak|1 Raw Salmon|Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Scorpion Fish||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Skeever Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 5 Stamina and Magicka.
Raw Slaughterfish||Consumed out of combat, it restores 90 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Spider Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.,Tastes as nasty as it smells, feels as nasty as it looks.
Raw Tripod Spiderfish||Consumed out of combat, it restores 30 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Troll Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 15 Stamina and Magicka.
Raw Vampire Fish||Consumed out of combat, it restores 60 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.,Only they can enjoy this meal without vomiting.
Raw Venison||Consumed out of combat, it restores 100 Stamina.,Its raw taste is revolting to anyone but those with a strong stomach.
Raw Wolf Meat||Its raw taste is revolting to anyone but those with a strong stomach.,Consumed out of combat, it restores 10 Stamina and Magicka.
Reachman Soup|1 Sabre Cat Tooth 2 Edible Mushroom 2 Edible Root 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 600 seconds.,Your meal improves your warmth
Red Apple||Consumed out of combat, it restores 5 Stamina and Magicka.
Roasted Tomato Crab Bisque|1 Salt 1 Tomato 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka is increased by 20 points for 1200 seconds.,Your meal improves your warmth,Restores 1 points of Magicka per second for 1200 seconds.
Root Bear (Strange Brew)|1 Nirnroot 2 Bear Tooth 1 Raw Bear Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 20 Stamina and Magicka.,Stamina is increased by 20 points for 2400 seconds.,Your meal improves your warmth
Sabre Cat Jerky|6 Salt 1 Raw Sabre Cat Meat|Consumed out of combat, it restores 1 Stamina.
Sabre Cat Pot Roast|1 Leek 1 Gourd 1 Raw Sabre Cat Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.
Salmon Bake|1 Thistle Branch 2 Raw Salmon Steak 1 Honey|Consumed out of combat, it restores 10 Stamina and Magicka.
Dried Salmon Jerky|6 Salt 1 Raw Salmon Steak|Consumed out of combat, it restores 1 Stamina.
Salty Sabre Stew|2 Salt 1 Canis Root 1 Raw Sabre Cat Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 20 Stamina and Magicka.,Restores 1 points of Stamina per second for 3600 seconds.,Your meal improves your warmth
Sausaged Skeever|1 Garlic 1 Skeever Tail 1 Raw Skeever Meat|Consumed out of combat, it restores 10 Stamina and Magicka.
Sauteed Dog and Mushrooms|2 Garlic 1 Fly Amanita 1 White Cap 1 Raw Dog Meat|Consumed out of combat, it restores 10 Stamina and Magicka.,Makes you feel better. Unless you just lost your dog.
Skeevender Stew|2 Lavender 2 Raw Skeever Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,It really just tastes like lavender stew.,Your meal improves your warmth
Skeever Jerky|6 Salt 1 Raw Skeever Meat|Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable.
Skeever Scramble|1 Chicken's Egg 1 Leek 1 Raw Skeever Meat|Consumed out of combat, it restores 5 Stamina and Magicka.
Skewered Skeever|1 Red Apple 1 Goat Cheese Slice 1 Raw Skeever Meat|Consumed out of combat, it restores 5 Stamina and Magicka.
Dried Slaughterfish Jerky|6 Salt 1 Raw Slaughterfish|Consumed out of combat, it restores 1 Stamina.,A cheap iron ration.
Smoked Elk Roast|1 Salt 1 Raw Elk Meat|Consumed out of combat, it restores 15 Stamina and Magicka.
Snowberry Crostata|10 Snowberries 1 Honey 1 Flour 1 Butter|Consumed out of combat, it restores 15 Stamina and Magicka.,Resists 5% of frost damage for 1200 seconds.
Snowbery Wolf Chop|2 Snowberries 1 Raw Wolf Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 2400 seconds.,A little tart, a little sweet.
Boiled Mushrooms||Boiled mushrooms are safe to eat, and can be added to soup.,Recover magicka 25% faster for 60 seconds.
Spiced Beef||Consumed out of combat, it restores 175 Stamina.
Spiced Diced Goat|1 Purple Mountain Flower 1 Creep Cluster 1 Raw Goat Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Sublime, exotic flavor.,Your meal improves your warmth
Spider Fry|1 Ale 2 Salt 1 Raw Spider Meat|Consumed out of combat, it restores 50 Stamina and Magicka.
Spider Jerky|6 Salt 1 Raw Spider Meat|Consumed out of combat, it restores 1 Stamina.,Tough and tasteless, but imperishable.
Spider Soup|1 Salt 1 Potato 1 Raw Spider Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 1200 seconds.,Your meal improves your warmth
Spider Surprise|1 Leek 1 Spider Egg 1 Bottled Milk 1 Raw Spider Meat|Consumed out of combat, it restores 10 Stamina and Magicka.,Your meal improves your warmth
Spotted Wolf Meat|1 Ale 1 Jazbay Grapes 1 Raw Wolf Meat|Consumed out of combat, it restores 10 Stamina and Magicka.
Sweetroll|1 Chicken's Egg 1 Salt 1 Honey 1 Bottled Milk 1 Flour 1 Butter|Consumed out of combat, it restores 15 Stamina and Magicka.,Magicka is increased by 5 points for 300 seconds.
Sweetwolf (Strange Brew)|1 Red Apple 1 Honey 1 Raw Wolf Meat|Consumed out of combat, it restores 15 Stamina and Magicka.,Health is increased by 10 points for 600 seconds.
Tomato||Consumed out of combat, it restores 5 Stamina and Magicka.
Tomato Soup|1 Salt 1 Garlic 1 Tomato 1 Leek 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 25% faster for 1200 seconds.,Your meal improves your warmth
Troll Jerky|6 Salt 1 Raw Troll Meat|Consumed out of combat, it restores 7 Stamina and Magicka.,Tough and tasteless, but imperishable.
Vegetable Soup|1 Cabbage 1 Potato 1 Tomato 1 Leek 1 Glass Bottle (Water)|Consumed out of combat, it restores 40 Stamina and Magicka.,Magicka regenerates 20% faster for 1200 seconds.,Your meal improves your warmth
Velvet Slaughterfish|1 Velvet LeChance 1 Raw Slaughterfish|Consumed out of combat, it restores 1 Stamina.,An expensive way to cook a very angry fish.
Venison Jerky|6 Salt 1 Raw Elk Meat|Consumed out of combat, it restores 5 Stamina and Magicka.
Venison Stew|1 Salt 1 Potato 1 Raw Venison 1 Leek 1 Glass Bottle (Water)|Consumed out of combat, it restores 75 Stamina and Magicka.,Restores 1 points of Stamina per second for 1800 seconds.,Your meal improves your warmth
Venison Tenderloin|1 Ale 1 Raw Venison|Consumed out of combat, it restores 10 Stamina and Magicka.
Watermelon||Consumed out of combat, it restores 15 Stamina and Magicka.
Watermelon Gazpacho|1 Salt 1 Elves Ear 1 Goat Cheese Slice 1 Tomato 1 Watermelon|Restores 15 points of Stamina per second for 0 seconds.,Restores 1 points of Stamina per second for 300 seconds.,This soup tastes amazing!
Wolf Cabbage Stew|1 Cabbage 1 Raw Wolf Meat 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds.,Your meal improves your warmth
Wolf Jerky|6 Salt 1 Raw Wolf Meat|Consumed out of combat, it restores 1 Stamina.,A cheap iron ration.
Wyrm and Chips|1 Salt 2 Potato 1 Raw Dragon Meat|Consumed out of combat, it restores 35 Stamina and Magicka.,Restores 1 points of Stamina per second for 3000 seconds.,Tastes best with hot Nord mead.,Restores 1 points of Magicka per second for 1200 seconds.
Ale|4 Wheat|Numbs your sense of pain, making you feel 15 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 10% and twice that for Magicka for 450 seconds. 
Alto Blanc Wine||Numbs your sense of pain, making you feel 75 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. 
Alto Noir Wine||Numbs your sense of pain, making you feel 75 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. 
Argonian Ale||Numbs your sense of pain, making you feel 75 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 50% and twice that for Magicka for 450 seconds. 
Argonian Bloodwine||Numbs your sense of pain, making you feel 75 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. ,Resists 10% of poison effects for 900 seconds.
Ashfire Mead|1 Juniper Berries 1 Honey 1 Ashen Grass Pod|Numbs your sense of pain, making you feel 80 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 25% and twice that for Magicka for 450 seconds. 
Black-Briar Mead||Numbs your sense of pain, making you feel 40 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 25% and twice that for Magicka for 450 seconds. 
Black-Briar Reserve|4 Wheat|Numbs your sense of pain, making you feel 100 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 50% and twice that for Magicka for 900 seconds. 
Bottled Milk||Consumed out of combat, it restores 10 Stamina and Magicka.,Stamina is increased by 5 points for 1200 seconds.
Cinnabar Beer|1 Ale 1 Jazbay Grapes 1 Creep Cluster|This ale smells of minerals leached from the volcanic wastelands. Enhances your focus, giving you 15 extra points of magicka for 300 seconds.,That might feel good for a short time... or it might just shorten your time.
Cliff Racer|1 Firebrand Wine 1 Cyrodilic Brandy 1 Flin 1 Sujamma|Numbs your sense of pain, making you feel 70 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 40% and twice that for Magicka for 900 seconds. ,Resists 10% of frost damage for 600 seconds.
Colovian Brandy||Numbs your sense of pain, making you feel 80 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. ,You haggle for 20% better prices for 900 seconds.
Cyrodilic Brandy||Numbs your sense of pain, making you feel 80 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 25% and twice that for Magicka for 900 seconds. 
Dragon's Breath Mead|2 Dragon's Tongue 1 Honey|Numbs your sense of pain, making you feel 55 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 450 seconds. 
Emberbrand Wine||Numbs your sense of pain, making you feel 130 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 60% and twice that for Magicka for 900 seconds. 
Firebrand Wine||Numbs your sense of pain, making you feel 75 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 40% and twice that for Magicka for 900 seconds. ,Resists 15% of frost damage for 600 seconds.
Flin||Numbs your sense of pain, making you feel 75 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 10% and twice that for Magicka for 900 seconds. 
Flin (Aged)||Numbs your sense of pain, making you feel 90 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 25% and twice that for Magicka for 1350 seconds. 
Glass Bottle (Salt Water)||Drinking saltwater will increase thirst. Distill at a cooking station for drinkable water.
Glass Bottle (Water)|1 Glass Bottle (Salt Water)|Restores thirst.
Honningbrew Mead|2 Green Apple 1 Honey|Numbs your sense of pain, making you feel 50 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 20% and twice that for Magicka for 450 seconds. 
Jessica's Wine||Numbs your sense of pain, making you feel 100 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. 
Juniper Berry Mead|2 Juniper Berries 1 Honey|Numbs your sense of pain, making you feel 40 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 20% and twice that for Magicka for 450 seconds. ,Health regenerates 25% faster for 300 seconds.
Juniper Tea|3 Juniper Berries 1 Honeycomb 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,This earthy tea slightly improves your warmth and stamina.,Your meal improves your warmth .
Lavender Tea|2 Lavender 3 Purple Mountain Flower 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,This delicate tea slightly improves your warmth and magicka.,Your meal improves your warmth .
Mazte||Numbs your sense of pain, making you feel 20 points healthier for 300 seconds.,Resists 20% of frost damage for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 10% and twice that for Magicka for 450 seconds. 
Moon Dance Tea|2 Luna Moth Wing 1 Moon Sugar 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,A mildly narcotic brew with mercurial effects.,Your meal improves your warmth .
Mountain Flower Tea|1 Blue Mountain Flower 1 Red Mountain Flower 1 Purple Mountain Flower 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,This flavorful tea slightly improves your warmth.,Your meal improves your warmth .
Mulled Wine||Numbs your sense of pain, making you feel 50 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 25% and twice that for Magicka for 900 seconds. 
Nirn Spring Tea|1 Nirnroot 1 Sleeping Tree Sap 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,An astringent brew, its potent ingredients draw upon the essence of Mundus.,Your meal improves your warmth .
Nord Mead|1 Honey|Numbs your sense of pain, making you feel 20 points healthier for 300 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 15% and twice that for Magicka for 450 seconds. 
Sadri's Sujamma||Numbs your sense of pain, making you feel 90 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. 
Shein||Numbs your sense of pain, making you feel 50 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 25% and twice that for Magicka for 900 seconds. 
Snowberry Tea|3 Snowberries 2 Red Mountain Flower 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,A warm draught against Skyrim's chilly nights and heights.,Your meal improves your warmth .
Stros M'Kai Rum||Numbs your sense of pain, making you feel 95 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 60% and twice that for Magicka for 1350 seconds. 
Sujamma||Numbs your sense of pain, making you feel 85 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. 
Surilie Brothers Wine||Numbs your sense of pain, making you feel 85 points healthier for 900 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 1350 seconds. 
Ten Dragons Tea|10 Dragon's Tongue 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,This flavorful tea slightly improves your warmth.,Your meal improves your warmth .
Velvet LeChance||Numbs your sense of pain, making you feel 40 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 20% and twice that for Magicka for 900 seconds. ,Resists 10% of shock damage for 600 seconds.
Village Red Wine||Numbs your sense of pain, making you feel 30 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 20% and twice that for Magicka for 900 seconds. 
Village White Wine||Numbs your sense of pain, making you feel 30 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 20% and twice that for Magicka for 900 seconds. 
Waterskin |1 Waterskin (Salt Water) Or Fill Empty Waterskin from a fresh water source|Restores thirst.
Waterskin (Salt Water)||Drinking saltwater will increase thirst. Distill at a cooking station for drinkable water.
Wheat Boon Tea|3 Wheat 1 Hanging Moss 1 Glass Bottle (Water)|Consumed out of combat, it restores 15 Stamina and Magicka.,Bitter tasting but reputed for its balsamaceous properties.,Your meal improves your warmth .
White-Gold Tower|1 Nord Mead 1 Lavender 1 Dragon's Tongue 1 Bottled Milk|Numbs your sense of pain, making you feel 60 points healthier for 600 seconds.,Impairs coordination and focus, slowing the regeneration of Stamina by 30% and twice that for Magicka for 900 seconds. ,Resists 10% of fire damage for 600 seconds.

</div>

## Next Steps

1. **Read [Trainers](https://wiki.wildlandermod.com/_04WildlanderWorld/6-Trainers/)** - Skill training locations
2. **Read [The Quests](https://wiki.wildlandermod.com/_04WildlanderWorld/5-The-Quests/)** - Available quests and starts
3. **Read [Followers and Mercenaries](https://wiki.wildlandermod.com/_04WildlanderWorld/7-Available-Followers/)** - Recruit and manage companions

**Remember:** Proper nutrition and hydration are survival essentials—always carry food and water.