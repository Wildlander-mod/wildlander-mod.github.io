---
title:  Tailor Recipes
layout: default
nav_order: 11
description: Tailor Recipes
---

## Textile and Clothing Crafting

The tailor toolkit allows you to craft and modify cloth-based items and clothing. Access these recipes is available from Player Crafting.

**Available crafting includes:**
- Clothing and garment creation
- Textile modifications
- Robe and tunic variations

**Tip:** Tailor recipes are useful for creating custom outfits and specialized clothing for different environments.

For more information on obtaining toolkits, see [Crafting System Overview](https://wiki.wildlandermod.com/10-Crafting/1.1-Crafting-System/).

---

## How to Use This Page

**Hover over any Produced Item** to see the complete details including:
- Full item name
- Quantity produced
- All items required for the recipe
- Perks and proximity requirements
- Special conditions and quest requirements

Use the search bar and filters below to find specific recipes by item type or perks needed.

---

<style>
#tailor-tooltip {
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

#tailor-tooltip div {
  margin: 4px 0;
}

#tailor-tooltip strong {
  color: #f77ef1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  initTailortooltips();
  initTailorFilters();
});
</script>

<div class="tailor-controls">
  <input type="text" id="tailorSearch" placeholder="Search recipes..." />
  <select id="perksFilter">
    <option value="">All Perks</option>
  </select>
  <button onclick="clearTailorFilters()">Clear Filters</button>
  <div class="filter-result-count-tailor" id="filterResultCountTailor"></div>
</div>

<div class="tailor-table" markdown="1">

| Produced Item | Qty | Perks Needed | Proximity | Items Required | Additional Requirements |
|:---|:---:|:---|:---:|:---|:---|
| Archmage's Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Brown | College - The Eye of Magnus Complete |
| Archmage's Robes | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan | College - The Eye of Magnus Complete |
| Archmage's Robes | 1 | Craftsmanship | N/A | 2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan | College - The Eye of Magnus Complete |
| Bearskin Cloak - Black | 1 | Craftsmanship | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Brown | 1 | Craftsmanship | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Cloak - Ornate Black | 1 | Craftsmanship | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate Brown | 1 | Craftsmanship | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Ornate White | 1 | Craftsmanship | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Cloak - Trimmed Black | 1 | Craftsmanship | N/A | 3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed Brown | 1 | Craftsmanship | N/A | 3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - Trimmed White | 1 | Craftsmanship | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate |  |
| Bearskin Cloak - White | 1 | Craftsmanship | N/A | 3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips |  |
| Bearskin Hood - Black | 1 | Craftsmanship | N/A | 1 Pelt: Cave Bear 1 Leather Strips |  |
| Bearskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Pelt: Bear 1 Leather Strips |  |
| Bearskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Pelt: Cave Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Pelt: Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Leather Strips 1 Pelt: Snow Fox |  |
| Bearskin Hood - Trimmed Black | 1 | Craftsmanship | N/A | 1 Pelt: Cave Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed Brown | 1 | Craftsmanship | N/A | 1 Pelt: Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - Trimmed White | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Leather Strips 1 Fur Plate |  |
| Bearskin Hood - White | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Leather Strips |  |
| Child's Doll | 1 | Craftsmanship | N/A | 5 Tundra Cotton 1 Leather Strips 2 Linen Cloth |  |
| Cotton Boots - Thalmor | 1 | Craftsmanship | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Yellow |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Green |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Grey |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Tan |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Brown |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Indigo |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Black |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Orange |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Purple |  |
| Cotton Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Blue |  |
| Cotton Cloth | 1 |  | N/A | 1 Salt 1 Cotton Cloth - Red |  |
| Cotton Cloth - Black | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Black |  |
| Cotton Cloth - Blue | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Blue |  |
| Cotton Cloth - Brown | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Brown |  |
| Cotton Cloth - Green | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Green |  |
| Cotton Cloth - Grey | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Grey |  |
| Cotton Cloth - Indigo | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Indigo |  |
| Cotton Cloth - Orange | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Orange |  |
| Cotton Cloth - Purple | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Purple |  |
| Cotton Cloth - Red | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Red |  |
| Cotton Cloth - Tan | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Tan |  |
| Cotton Cloth - Yellow | 1 | Craftsmanship | N/A | 1 Cotton Cloth 1 Dye - Yellow |  |
| Cotton Cuffed Boots | 1 | Craftsmanship | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Cultist Boots | 1 | Craftsmanship | N/A | 2 Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Cultist Gloves | 1 | Craftsmanship | N/A | 4 Bone Meal 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Cultist Robes | 1 | Craftsmanship | N/A | 3 Bone Meal 4 Leather 4 Cotton Thread 5 Cotton Cloth - Brown | Dragonborn - Dragonborn Complete |
| Cotton Fine Boots | 1 | Craftsmanship | N/A | 6 Gold 1 Leather 2 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Clothes - Brown | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Grey |  |
| Cotton Fine Clothes - Indigo | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Indigo |  |
| Cotton Fine Hat | 1 | Craftsmanship | N/A | 1 Leather Strips 1 Pelt: Snow Fox 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Hat | 1 | Craftsmanship | N/A | 1 Leather Strips 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Fine Shoes | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown |  |
| Cotton Fur-Mantled Clothes - Blue | 1 | Craftsmanship | N/A | 2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo |  |
| Cotton Fur-Mantled Clothes - Blue | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo |  |
| Cotton Fur-Mantled Clothes - Green | 1 | Craftsmanship | N/A | 4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green |  |
| Cotton Fur-Mantled Clothes - Green | 1 | Craftsmanship | N/A | 1 Pelt: Bear 4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green |  |
| Cotton Gloves - Mythic Dawn | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Red | Daedra - Pieces of the Past |
| Cotton Gloves - Thalmor | 1 | Craftsmanship | N/A | 2 Cotton Thread 2 Cotton Cloth - Black |  |
| Cotton Hood - Mythic Dawn | 1 | Craftsmanship | N/A | 1 Cotton Thread 3 Cotton Cloth - Red | Daedra - Pieces of the Past |
| Cotton Jester's Boots | 1 | Craftsmanship | N/A | 2 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Jester's Clothes | 1 | Craftsmanship | N/A | 1 Leather Strips 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Red |  |
| Cotton Jester's Gloves | 1 | Craftsmanship | N/A | 2 Cotton Thread 2 Cotton Cloth - Black |  |
| Cotton Jester's Hat | 1 | Craftsmanship | N/A | 1 Cotton Thread 1 Cotton Cloth - Black 2 Cotton Cloth - Red |  |
| Cotton Mage Boots - Common | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 1 Cotton Cloth - Blue 2 Cotton Cloth - Grey |  |
| Cotton Mage Boots - Embellished | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 1 Cotton Cloth - Brown 2 Cotton Cloth - Grey |  |
| Cotton Merchant's Hat | 1 | Craftsmanship | N/A | 1 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Quilted Clothes - Black and White | 1 | Craftsmanship | N/A | 2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Black |  |
| Cotton Quilted Clothes - Blue | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 2 Cotton Cloth - Blue 3 Cotton Cloth - Indigo |  |
| Cotton Quilted Clothes - Brown and Orange | 1 | Craftsmanship | N/A | 4 Cotton Thread 3 Cotton Cloth - Brown 2 Cotton Cloth - Orange |  |
| Cotton Quilted Clothes - Brown and White | 1 | Craftsmanship | N/A | 2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Brown |  |
| Cotton Quilted Clothes - Orange | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Tan |  |
| Cotton Quilted Clothes - Orange and Black | 1 | Craftsmanship | N/A | 4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Orange |  |
| Cotton Reclamations Temple Boots | 1 | Craftsmanship | N/A | 1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown 1 Cotton Cloth - Grey | Dragonborn - Clean Sweep Complete |
| Cotton Reclamations Temple Hood | 1 | Craftsmanship | N/A | 1 Cotton Thread 3 Cotton Cloth - Blue | Dragonborn - Clean Sweep Complete |
| Cotton Reclamations Temple Robes | 1 | Craftsmanship | N/A | 3 Netch Leather 4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Blue 2 Cotton Cloth - Grey | Dragonborn - Clean Sweep Complete |
| Cotton Robes - Mythic Dawn | 1 | Craftsmanship | N/A | 4 Cotton Thread 4 Cotton Cloth - Red 1 Cotton Cloth - Yellow | Daedra - Pieces of the Past |
| Cotton Robes - Thalmor | 1 | Craftsmanship | N/A | 4 Cotton Thread 5 Cotton Cloth - Black |  |
| Cotton Shoes - Mythic Dawn | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Daedra - Pieces of the Past |
| Cotton Tall Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Cotton Thread 4 Cotton Cloth - Tan |  |
| Cotton Telvanni Robes | 1 | Craftsmanship | N/A | 3 Netch Leather 4 Cotton Thread 1 Cotton Cloth - Black 3 Cotton Cloth - Red 1 Cotton Cloth - Yellow | Dragonborn -  Old Friends Complete |
| Cotton Telvanni Shoes | 1 | Craftsmanship | N/A | 1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown | Dragonborn -  Old Friends Complete |
| Cotton Thread | 4 | Craftsmanship | Spinning Wheel | 3 Tundra Cotton |  |
| Cotton Vaermina Robes | 1 | Craftsmanship | N/A | 4 Cotton Thread 5 Cotton Cloth - Purple | Daedra - Waking Nightmare |
| Dye - Black | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Nightshade |  |
| Dye - Black | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Nightshade |  |
| Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Salt |  |
| Dye - Bleach | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Salt |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Blue Mountain Flower |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Indigo 1 Dye - Bleach |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Indigo 1 Dye - Bleach |  |
| Dye - Blue | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Blue Mountain Flower |  |
| Dye - Brown | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Canis Root |  |
| Dye - Brown | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Tan |  |
| Dye - Brown | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Black 1 Dye - Tan |  |
| Dye - Brown | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Canis Root |  |
| Dye - Green | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Hanging Moss |  |
| Dye - Green | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Blue 1 Dye - Yellow |  |
| Dye - Green | 1 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Hanging Moss |  |
| Dye - Green | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Blue 1 Dye - Yellow |  |
| Dye - Grey | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Bleach |  |
| Dye - Grey | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Giant Lichen |  |
| Dye - Grey | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Black 1 Dye - Bleach |  |
| Dye - Grey | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Giant Lichen |  |
| Dye - Indigo | 4 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Deathbell |  |
| Dye - Indigo | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Black 1 Dye - Blue |  |
| Dye - Indigo | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Black 1 Dye - Blue |  |
| Dye - Indigo | 4 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Deathbell |  |
| Dye - Orange | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Red 1 Dye - Yellow |  |
| Dye - Orange | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Creep Cluster |  |
| Dye - Orange | 1 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Creep Cluster |  |
| Dye - Orange | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Red 1 Dye - Yellow |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Purple Mountain Flower |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Blue 1 Dye - Red |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Purple Mountain Flower |  |
| Dye - Purple | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Blue 1 Dye - Red |  |
| Dye - Red | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Red Mountain Flower |  |
| Dye - Red | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Red Mountain Flower |  |
| Dye - Tan | 1 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Grass Pod |  |
| Dye - Tan | 2 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dye - Brown 1 Dye - Bleach |  |
| Dye - Tan | 2 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dye - Brown 1 Dye - Bleach |  |
| Dye - Tan | 1 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Grass Pod |  |
| Dye - Yellow | 5 | Craftsmanship,Alchemical Lore 1 | Cook pot | 1 Dragon's Tongue |  |
| Dye - Yellow | 5 | Craftsmanship,Alchemical Lore 1 | Spinning Wheel | 1 Dragon's Tongue |  |
| Emperor's Robes | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood Main Quest Complete |
| Emperor's Robes | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood Main Quest Complete |
| Floral Head Wreath | 1 | Craftsmanship | N/A | 12 Tundra Cotton |  |
| Focusing Gloves | 1 | Craftsmanship | N/A | 2 Cotton Thread 2 Cotton Cloth - Black | College - Out Of Balance Complete |
| Hide Lace | 4 | Craftsmanship | N/A | 1 Fur Plate |  |
| Leather Clothes - Black | 1 | Craftsmanship | N/A | 3 Leather 2 Linen Cloth - Black 4 Linen Thread |  |
| Leather Clothes - Black and Brown | 1 | Craftsmanship | N/A | 2 Leather 2 Linen Cloth - Black 1 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Quilted Clothes - Black | 1 | Craftsmanship | N/A | 1 Leather 4 Linen Cloth - Black 4 Linen Thread |  |
| Leather Strips | 4 | Craftsmanship | N/A | 1 Leather |  |
| Leather Tiled Clothes - Brown | 1 | Craftsmanship | N/A | 1 Leather 4 Linen Cloth - Brown 4 Linen Thread |  |
| Leather Tiled Clothes - Brown and Black | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Arm Bandages | 1 | Craftsmanship | N/A | 2 Linen Cloth |  |
| Linen Barkeep's Clothes - Brown | 1 | Craftsmanship | N/A | 2 Leather Strips 4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth |  |
| Linen Barkeep's Clothes - White | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Linen Cloth - Brown 4 Linen Thread 4 Linen Cloth |  |
| Linen Blacksmith's Apron - Red | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 3 Linen Cloth - Red 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Blacksmith's Apron - White | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 2 Linen Cloth - Grey 4 Linen Thread 3 Linen Cloth |  |
| Linen Blacksmith's Shoes | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Cap | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Chef's Hat | 1 | Craftsmanship | N/A | 1 Linen Thread 3 Linen Cloth |  |
| Linen Chef's Tunic | 1 | Craftsmanship | N/A | 4 Leather Strips 4 Linen Thread 5 Linen Cloth |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Grey |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Red |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Purple |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Yellow |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Tan |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Orange |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Black |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Brown |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Green |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Blue |  |
| Linen Cloth | 1 |  | N/A | 1 Salt 1 Linen Cloth - Indigo |  |
| Linen Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Northern Flax |  |
| Linen Cloth - Black | 1 | Craftsmanship | N/A | 1 Dye - Black 1 Linen Cloth |  |
| Linen Cloth - Blue | 1 | Craftsmanship | N/A | 1 Dye - Blue 1 Linen Cloth |  |
| Linen Cloth - Brown | 1 | Craftsmanship | N/A | 1 Dye - Brown 1 Linen Cloth |  |
| Linen Cloth - Green | 1 | Craftsmanship | N/A | 1 Dye - Green 1 Linen Cloth |  |
| Linen Cloth - Grey | 1 | Craftsmanship | N/A | 1 Dye - Grey 1 Linen Cloth |  |
| Linen Cloth - Indigo | 1 | Craftsmanship | N/A | 1 Dye - Indigo 1 Linen Cloth |  |
| Linen Cloth - Orange | 1 | Craftsmanship | N/A | 1 Dye - Orange 1 Linen Cloth |  |
| Linen Cloth - Purple | 1 | Craftsmanship | N/A | 1 Dye - Purple 1 Linen Cloth |  |
| Linen Cloth - Red | 1 | Craftsmanship | N/A | 1 Dye - Red 1 Linen Cloth |  |
| Linen Cloth - Tan | 1 | Craftsmanship | N/A | 1 Dye - Tan 1 Linen Cloth |  |
| Linen Cloth - Yellow | 1 | Craftsmanship | N/A | 1 Dye - Yellow 1 Linen Cloth |  |
| Linen Clothes - Black and Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Clothes - Black, Grey, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Clothes - Brown and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown, Grey, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Clothes - Brown, White, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Collared Brown and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Collared Orange and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Orange, Grey, and Tan | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Clothes - Orange, White, and Brown | 1 | Craftsmanship | N/A | 1 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Clothes - Orange, White, and Tan | 1 | Craftsmanship | N/A | 1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth |  |
| Linen Cowl - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 1 Linen Thread |  |
| Linen Cowl - Blue | 1 | Craftsmanship | N/A | 3 Linen Cloth - Blue 1 Linen Thread |  |
| Linen Cowl - Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 1 Linen Thread |  |
| Linen Cowl - Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Cowl - Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Cowl - Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 1 Linen Thread |  |
| Linen Cowl - Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Orange 1 Linen Thread |  |
| Linen Cowl - Purple | 1 | Craftsmanship | N/A | 3 Linen Cloth - Purple 1 Linen Thread |  |
| Linen Cowl - Red | 1 | Craftsmanship | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Cowl - White | 1 | Craftsmanship | N/A | 1 Linen Thread 3 Linen Cloth |  |
| Linen Cowl - Yellow | 1 | Craftsmanship | N/A | 3 Linen Cloth - Yellow 1 Linen Thread |  |
| Linen Cuffed Boots | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Tan 2 Linen Thread |  |
| Linen Doublet - Brown and Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Doublet - Brown and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Doublet - Brown and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan | 1 | Craftsmanship | N/A | 5 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan and Grey | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 3 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Doublet - Tan, Grey, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Dunmer Boots | 1 | Craftsmanship | N/A | 1 Netch Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Dunmer Hood - Blue | 1 | Craftsmanship | N/A | 3 Linen Cloth - Indigo 1 Linen Thread |  |
| Linen Dunmer Hood - Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 1 Linen Thread |  |
| Linen Dunmer Hood - Red | 1 | Craftsmanship | N/A | 3 Linen Cloth - Red 1 Linen Thread |  |
| Linen Dunmer Tunic - Blue | 1 | Craftsmanship | N/A | 1 Netch Leather 3 Linen Cloth - Blue 1 Linen Cloth - Grey 1 Linen Cloth - Indigo 4 Linen Thread |  |
| Linen Dunmer Tunic - Brown | 1 | Craftsmanship | N/A | 1 Netch Leather 3 Linen Cloth - Brown 1 Linen Cloth - Green 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Dunmer Tunic - Red | 1 | Craftsmanship | N/A | 1 Netch Leather 3 Linen Cloth - Red 1 Linen Cloth - Brown 1 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Farm Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Footwraps | 1 | Craftsmanship | N/A | 2 Linen Wrap 2 Linen Thread |  |
| Linen Gloves - Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Gloves - Blue | 1 | Craftsmanship | N/A | 2 Linen Cloth - Blue 2 Linen Thread |  |
| Linen Gloves - Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Gloves - Green | 1 | Craftsmanship | N/A | 2 Linen Cloth - Green 2 Linen Thread |  |
| Linen Gloves - Grey | 1 | Craftsmanship | N/A | 2 Linen Cloth - Grey 2 Linen Thread |  |
| Linen Gloves - Red | 1 | Craftsmanship | N/A | 2 Linen Cloth - Red 2 Linen Thread |  |
| Linen Head Bandages | 1 |  | N/A | 2 Linen Cloth |  |
| Linen Headscarf | 1 | Craftsmanship | N/A | 2 Linen Thread 3 Linen Cloth |  |
| Linen Hood - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 1 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Hood - Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 1 Linen Thread |  |
| Linen Mage Robes - Black and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Robes - Black and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Robes - Brown and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Mage Robes - Brown and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Robes - Green and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Green 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Mage Robes - Tan and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Mage Tunic - Blue and Quilted Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Mage Tunic - Grey and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Tunic - Grey and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Mage Tunic - White and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White and Orange | 1 | Craftsmanship | N/A | 2 Linen Cloth - Orange 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White and Quilted Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Mage Tunic - White, Green, and Brown | 1 | Craftsmanship | N/A | 1 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth |  |
| Linen Miner's Boots | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Leather 3 Linen Cloth - Green 2 Linen Thread |  |
| Linen Miner's Clothes - Brown | 1 | Craftsmanship | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Miner's Clothes - Grey and Tan | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Miner's Clothes - Orange and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Miner's Clothes - Orange and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Miner's Clothes - Tan | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Green 3 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Miner's Clothes - White | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth |  |
| Linen Miner's Clothes - Yellow and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Monk Boots - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Thread |  |
| Linen Monk Boots - Brown | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Moth Priest Blindfold | 1 | Craftsmanship | N/A | 1 Linen Cloth - Grey 1 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Moth Priest Robes | 1 | Craftsmanship | N/A | 5 Linen Cloth - Grey 4 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Moth Priest Sandals | 1 | Craftsmanship | N/A | 1 Leather 1 Linen Cloth - Brown 1 Linen Thread | DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete |
| Linen Mourner's Clothes | 1 | Craftsmanship | N/A | 2 Leather Strips 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Mourner's Headscarf | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Thread |  |
| Linen Plain Robes - Grey and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Grey and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Grey and Red | 1 | Craftsmanship | N/A | 2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Mantled Grey and Red | 1 | Craftsmanship | N/A | 2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Plain Robes - Mantled Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Mantled Orange and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Plain Robes - Orange and Brown | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Prisoner's Rags | 1 | Craftsmanship | N/A | 3 Linen Wrap 2 Linen Thread |  |
| Linen Ragged Boots | 1 | Craftsmanship | N/A | 2 Linen Wrap 2 Linen Thread |  |
| Linen Ragged Cap | 1 | Craftsmanship | N/A | 2 Linen Wrap 1 Linen Thread |  |
| Linen Ragged Robes | 1 | Craftsmanship | N/A | 5 Linen Wrap 4 Linen Thread |  |
| Linen Robes - Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Robes - Brown | 1 | Craftsmanship | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Robes - Green | 1 | Craftsmanship | N/A | 5 Linen Cloth - Green 4 Linen Thread |  |
| Linen Robes - Grey | 1 | Craftsmanship | N/A | 5 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Robes - Orange | 1 | Craftsmanship | N/A | 5 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Robes - Red | 1 | Craftsmanship | N/A | 1 Linen Cloth - Red 4 Linen Thread 4 Linen Cloth |  |
| Linen Roughspun Tunic | 1 | Craftsmanship | N/A | 3 Linen Wrap 2 Linen Thread |  |
| Linen Shoes - Brown | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Skirt - Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Skirt - Green and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Green 4 Linen Thread |  |
| Linen Skirt - Indigo and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Indigo 4 Linen Thread |  |
| Linen Skirt - Orange and Black | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Skirt - Quilted Brown | 1 | Craftsmanship | N/A | 4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth |  |
| Linen Stitched Boots | 1 | Craftsmanship | N/A | 1 Leather 3 Linen Cloth - Brown 2 Linen Thread |  |
| Linen Surcoat - Black and Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Surcoat - Black and Green | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Tavern Clothes | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Linen Cloth - Brown 3 Linen Cloth - Green 1 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Thread | 4 | Craftsmanship | Spinning Wheel | 3 Northern Flax |  |
| Linen Traveler Robes - Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread |  |
| Linen Traveler Robes - Black and Brown | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread |  |
| Linen Traveler Robes - Black and Orange | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Cloth - Orange 4 Linen Thread |  |
| Linen Traveler Robes - Black, Brown, and Green | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Green 4 Linen Thread |  |
| Linen Traveler Robes - Black, Brown, and Grey | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Traveler Robes - Black, Tan, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Black 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Brown and Grey | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread |  |
| Linen Traveler Robes - Brown and White | 1 | Craftsmanship | N/A | 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Traveler Robes - Brown, Tan, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Purple, Orange, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Orange 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth |  |
| Linen Traveler Robes - Purple, Tan, and White | 1 | Craftsmanship | N/A | 2 Linen Cloth - Tan 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth |  |
| Linen Tunic - Belted Black | 1 | Craftsmanship | N/A | 5 Linen Cloth - Black 4 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Tunic - Belted Green | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Belted Red | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Belted Tan | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth |  |
| Linen Tunic - Blue and Orange | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Blue 2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread |  |
| Linen Tunic - Embroidered Brown | 1 | Craftsmanship | N/A | 2 Leather Strips 1 Linen Cloth - Brown 2 Linen Cloth - Purple 2 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Tunic - Indigo and Green | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread |  |
| Linen Tunic - Tan | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Cloth - Yellow 4 Linen Thread |  |
| Linen Work Boots - Black | 1 | Craftsmanship | N/A | 3 Linen Cloth - Black 2 Linen Thread | DawnGuard - Prophet (Vampire) Complete |
| Linen Work Boots - Brown | 1 | Craftsmanship | N/A | 1 Leather 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Thread |  |
| Miraak's Boots | 1 | Craftsmanship | N/A | 2 Leather 2 Silk Thread 2 Silk Cloth - Brown | Killed Miraak |
| Miraak's Gloves | 1 | Craftsmanship | N/A | 2 Silk Thread 2 Silk Cloth - Brown | Killed Miraak |
| Miraak's Robes | 1 | Craftsmanship | N/A | 4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Brown | Killed Miraak |
| Noble Armguards | 1 | Craftsmanship | N/A | 2 Leather Strips 3 Leather |  |
| Noble Gilded Wristguards | 1 | Advanced Blacksmithing | N/A | 2 Gold Ring 3 Leather Strips 2 Leather |  |
| Sheogorath's Boots | 1 | Craftsmanship | N/A | 2 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Purple | Daedra - The Mind of Madness |
| Sheogorath's Garb | 1 | Craftsmanship | N/A | 4 Silk Thread 1 Silk Cloth 1 Silk Cloth - Orange 3 Silk Cloth - Purple | Daedra - The Mind of Madness |
| Shrouded Veil | 1 | Craftsmanship | N/A | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Red | Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Blue |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Red |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Tan |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Black |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Indigo |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Green |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Yellow |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Grey |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Orange |  |
| Silk Cloth | 1 | Craftsmanship | Spinning Wheel | 3 Spider Egg |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Purple |  |
| Silk Cloth | 1 |  | N/A | 1 Salt 1 Silk Cloth - Brown |  |
| Silk Cloth - Black | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Black |  |
| Silk Cloth - Blue | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Blue |  |
| Silk Cloth - Brown | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Brown |  |
| Silk Cloth - Green | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Green |  |
| Silk Cloth - Grey | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Grey |  |
| Silk Cloth - Indigo | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Indigo |  |
| Silk Cloth - Orange | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Orange |  |
| Silk Cloth - Purple | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Purple |  |
| Silk Cloth - Red | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Red |  |
| Silk Cloth - Tan | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Tan |  |
| Silk Cloth - Yellow | 1 | Craftsmanship | N/A | 1 Silk Cloth 1 Dye - Yellow |  |
| Silk Cuffed Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Grey |  |
| Silk Embroidered Raiment - Blue | 1 | Craftsmanship | N/A | 2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Blue 2 Silk Cloth - Purple |  |
| Silk Embroidered Raiment - Red | 1 | Craftsmanship | N/A | 2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Red 2 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Green | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Green | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow |  |
| Silk Fur-Embellished Robes - Indigo | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Indigo 1 Silk Cloth - Red |  |
| Silk Fur-Embellished Robes - Indigo | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Indigo 3 Silk Cloth - Red |  |
| Silk Fur-Embellished Robes - Tan | 1 | Craftsmanship | N/A | 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan |  |
| Silk Fur-Embellished Robes - Tan | 1 | Craftsmanship | N/A | 1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan |  |
| Silk Fur-Lined Boots | 1 | Craftsmanship | N/A | 1 Leather 1 Fur Plate 2 Silk Thread 3 Silk Cloth - Tan |  |
| Silk Fur-Trimmed Clothes | 1 | Craftsmanship | N/A | 3 Pelt: Wolf 2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green |  |
| Silk Fur-Trimmed Clothes | 1 | Craftsmanship | N/A | 2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green |  |
| Silk Mage Boots - Ornate | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Grey |  |
| Silk Nocturnal Hood | 1 | Craftsmanship | N/A | 1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Grey | TG - Darkness Returns Complete |
| Silk Nocturnal Robes | 1 | Craftsmanship | N/A | 4 Silk Thread 3 Silk Cloth - Black 1 Silk Cloth - Grey | TG - Darkness Returns Complete |
| Silk Pleated Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 3 Silk Cloth - Brown |  |
| Silk Psijic Boots | 1 | Craftsmanship | N/A | 1 Leather 2 Silk Thread 1 Silk Cloth - Grey 1 Silk Cloth - Red 2 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Psijic Gloves | 1 | Craftsmanship | N/A | 1 Ingot: Quicksilver 2 Silk Thread 2 Silk Cloth - Brown | College - The Eye of Magnus Complete |
| Silk Psijic Hood | 1 | Craftsmanship | N/A | 3 Silk Thread 1 Silk Cloth - Red 2 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Psijic Robes | 1 | Craftsmanship | N/A | 2 Ingot: Quicksilver 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Grey 1 Silk Cloth - Red 3 Silk Cloth - Yellow | College - The Eye of Magnus Complete |
| Silk Thread | 4 | Craftsmanship | Spinning Wheel | 3 Spider Egg |  |
| Silk Wedding Finery | 1 | Craftsmanship | N/A | 1 Pelt: Snow Bear 1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red |  |
| Silk Wedding Finery | 1 | Craftsmanship | N/A | 1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red |  |
| Tanning Rack | 1 | Craftsmanship | N/A | 3 Wood 2 Hide Lace |  |
| Tanning Rack | 1 | Craftsmanship | N/A | 3 Wood 1 Leather Strips |  |
| Wolfskin Cloak - Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal |  |
| Wolfskin Cloak - Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips |  |
| Wolfskin Cloak - Dark Trimmed Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Dark Trimmed White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Light Trimmed White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Black | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 1 Charcoal 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate Brown | 1 | Craftsmanship | N/A | 4 Pelt: Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - Ornate White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips 3 Pelt: Snow Fox |  |
| Wolfskin Cloak - White | 1 | Craftsmanship | N/A | 4 Pelt: Ice Wolf 3 Leather Strips |  |
| Wolfskin Hood - Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal |  |
| Wolfskin Hood - Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips |  |
| Wolfskin Hood - Dark Trimmed Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Dark Trimmed White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Light Trimmed White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Charcoal 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Noble White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 2 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Black | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate Brown | 1 | Craftsmanship | N/A | 1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - Ornate White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox |  |
| Wolfskin Hood - White | 1 | Craftsmanship | N/A | 1 Pelt: Ice Wolf 1 Leather Strips |  |

</div>

<script>
function initTailortooltips() {
  const table = document.querySelector('.tailor-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const itemCell = row.querySelector('td:first-child');
    itemCell.style.cursor = 'pointer';
    itemCell.addEventListener('mouseenter', (e) => showTailortooltip(e, row));
    itemCell.addEventListener('mousemove', updateTailortooltipPosition);
    itemCell.addEventListener('mouseleave', hideTailortooltip);
  });
}

function showTailortooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    itemName: cells[0]?.textContent || '',
    qty: cells[1]?.textContent || '',
    perks: cells[2]?.textContent || '',
    proximity: cells[3]?.textContent || '',
    items: cells[4]?.textContent || '',
    additional: cells[5]?.textContent || ''
  };
  
  let tooltip = document.getElementById('tailor-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'tailor-tooltip';
    tooltip.style.position = 'fixed';
    tooltip.style.zIndex = '10000';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div><strong>Item:</strong> ${data.itemName}</div>
    <div><strong>Qty:</strong> ${data.qty}</div>
    <div><strong>Perks:</strong> ${data.perks}</div>
    <div><strong>Proximity:</strong> ${data.proximity}</div>
    <div><strong>Items:</strong> ${data.items}</div>
    <div><strong>Additional:</strong> ${data.additional}</div>
  `;
  tooltip.style.display = 'block';
  updateTailortooltipPosition(event);
}

function updateTailortooltipPosition(event) {
  const tooltip = document.getElementById('tailor-tooltip');
  if (tooltip && tooltip.style.display === 'block') {
    tooltip.style.left = event.clientX + 10 + 'px';
    tooltip.style.top = event.clientY + 10 + 'px';
  }
}

function hideTailortooltip() {
  const tooltip = document.getElementById('tailor-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function initTailorFilters() {
  const table = document.querySelector('.tailor-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const perksSet = new Set();
  
  rows.forEach(row => {
    const perks = row.querySelector('td:nth-child(3)')?.textContent.trim();
    if (perks && perks !== '') perksSet.add(perks);
  });
  
  const perkFilter = document.getElementById('perksFilter');
  Array.from(perksSet).sort().forEach(perk => {
    const option = document.createElement('option');
    option.value = perk;
    option.textContent = perk;
    perkFilter.appendChild(option);
  });
  
  document.getElementById('tailorSearch').addEventListener('keyup', filterTailorTable);
  document.getElementById('perksFilter').addEventListener('change', filterTailorTable);
  updateFilterCountTailor();
}

function filterTailorTable() {
  const searchTerm = document.getElementById('tailorSearch').value.toLowerCase();
  const perksFilter = document.getElementById('perksFilter').value;
  
  const table = document.querySelector('.tailor-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const itemName = cells[0]?.textContent.toLowerCase() || '';
    const itemsRequired = cells[4]?.textContent.toLowerCase() || '';
    const perks = cells[2]?.textContent.trim() || '';
    
    const searchMatch = itemName.includes(searchTerm) || itemsRequired.includes(searchTerm);
    const filterMatch = !perksFilter || perks === perksFilter;
    
    const isVisible = searchMatch && filterMatch;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCountTailor();
  initTailortooltips();
}

function updateFilterCountTailor() {
  const table = document.querySelector('.tailor-table table');
  const totalRows = table.querySelectorAll('tbody tr').length;
  const visibleRows = Array.from(table.querySelectorAll('tbody tr')).filter(row => row.style.display !== 'none').length;
  const counter = document.getElementById('filterResultCountTailor');
  counter.textContent = `Showing ${visibleRows} of ${totalRows} recipes`;
}

function clearTailorFilters() {
  document.getElementById('tailorSearch').value = '';
  document.getElementById('perksFilter').value = '';
  filterTailorTable();
}
</script>

