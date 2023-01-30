---
title: Crafting spreadsheet
layout: default
nav_order: 2
description: Crafting Spreadsheet
---

<a class="btn btn-pink" href="https://docs.google.com/spreadsheets/d/1utEfot7czAGslnbL2OP_gIoI31CI6J8Zn5nvqED21xE/edit#gid=0" target="_blank" rel="noopener noreferrer">All Recipes Spreadsheet <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInputBox").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<input type="text" id="myInputBox" placeholder="Search for Recipe.." >

<table id="myTable">
	<thead>
    <tr>
        <th>Item Name</th>
        <th>Perks Needed</th>
        <th>Toolkits Required</th>
        <th>Workbench Near When Player Crafting</th>
        <th>Components</th>
        <th>Additional Requirements</th>
    </tr>
	</thead>
	<tbody>
    <tr>
        <td>Aetherial Crown</td>
        <td></td>
        <td>None Required</td>
        <td>Aetherium Forge</td>
        <td>2 Ingot: Gold 2 Gem: Sapphire (Flawless) 2 Ingot: Dwarven 1 Aetherium Crest</td>
        <td></td>
    </tr>
    <tr>
        <td>Aetherial Shield</td>
        <td></td>
        <td>None Required</td>
        <td>Aetherium Forge</td>
        <td>2 Ingot: Malachite 4 Ingot: Dwarven 1 Aetherium Crest</td>
        <td></td>
    </tr>
    <tr>
        <td>Aetherial Staff</td>
        <td></td>
        <td>None Required</td>
        <td>Aetherium Forge</td>
        <td>2 Ingot: Ebony 1 Ingot: Gold 2 Ingot: Dwarven 1 Aetherium Crest</td>
        <td></td>
    </tr>
    <tr>
        <td>Akaviri Katana</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips</td>
        <td>Main Quest - Alduins Wall Complete</td>
    </tr>
    <tr>
        <td>Alchemist's Crown</td>
        <td></td>
        <td>Smiths,Jewelers</td>
        <td>Forge</td>
        <td>1 Infused Ingot 3 Rubyluce</td>
        <td></td>
    </tr>
    <tr>
        <td>Ale</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>4 Wheat</td>
        <td></td>
    </tr>
    <tr>
        <td>Ale Braised Sabre Cat</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 1 Raw Sabre Cat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Alik'ri Fishing Rod</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths,Survivalists,Alchemists</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Wood</td>
        <td>Fishing - Unlocked Alikri Rod</td>
    </tr>
    <tr>
        <td>Amethyst</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Amethyst (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Akatosh Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Arkay Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Gem: Ruby (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Dibella Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Leather Strips 1 Pearl</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Julianos Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Gold Ring 1 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Mara Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Stendarr Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Gold Ring 1 Ingot: Corundum 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Talos Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Gold Ring 1 Leather Strips 1 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of the Elder Council Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Ingot: Quicksilver 1 Gem: Onyx</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of the Kynareth Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Small Pearl</td>
        <td></td>
    </tr>
    <tr>
        <td>Amulet of Zenithar Replica</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Amulet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Leather Strips 1 Animal Bone (Small)</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Battleaxe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 4 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Linen Wrap 2 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Greatsword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Helmet - Antlers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Helmet - Antlers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Doe Antlers 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Battleaxe</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Ingot: Corundum 1 Ancient Nordic Honed Battleaxe 3 Leather Strips</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Boots 3 Ingot: Steel 2 Fur Plate</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 1 Ancient Nordic Boots 3 Ingot: Steel</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Cuirass 4 Ingot: Steel 3 Fur Plate</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Cuirass 1 Pelt: Cave Bear 4 Ingot: Steel</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Dagger</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Ancient Nordic Honed Dagger</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Gauntlets 2 Ingot: Steel 1 Leather</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Greatsword</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Greatsword 2 Leather Strips</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Heavy Bow</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Ancient Nordic Honed Heavy Bow 2 Hide Lace</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Heavy Crossbow</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Ingot: Corundum 1 Leather 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Helm</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Mace</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Ancient Nordic Honed Mace</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Sword</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed Sword 1 Leather Strips</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero War Axe</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Ingot: Corundum 1 Ancient Nordic Honed War Axe 2 Leather Strips</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Hero Warhammer</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Corundum 3 Leather Strips 1 Ancient Nordic Honed Warhammer</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Ancient Nordic Honed Battleaxe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Battleaxe 2 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Honed Greatsword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Greatsword 2 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Honed Heavy Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Light Bow 2 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Honed Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Sword 1 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Honed War Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic War Axe 1 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Light Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Leather Strips 1 Animal Bone (Small)</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ancient Nordic War Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Apple Cabbage Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Red Apple 1 Cabbage 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Apple Dumpling</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>2 Red Apple 2 Green Apple 1 Honey 1 Flour 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Apple Pie</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Chicken's Egg 1 Salt 2 Red Apple 2 Green Apple 1 Flour 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Aquamarine</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Aquamarine (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Archmage's Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Silk Thread 3 Silk Cloth - Brown</td>
        <td>College - The Eye of Magnus Complete</td>
    </tr>
    <tr>
        <td>Archmage's Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan</td>
        <td>College - The Eye of Magnus Complete</td>
    </tr>
    <tr>
        <td>Archmage's Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 2 Leather 4 Silk Thread 4 Silk Cloth - Brown 1 Silk Cloth - Tan</td>
        <td>College - The Eye of Magnus Complete</td>
    </tr>
    <tr>
        <td>Argonian Fishing Rod</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths,Survivalists,Alchemists</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 1 Wood</td>
        <td>Fishing - Unlocked Argonian Rod</td>
    </tr>
    <tr>
        <td>Arrow: Ancient Nordic</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Ancient Nordic Hero</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Ingot: Corundum 1 Wood</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Crude)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Fragment: Bone 1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Less or Equal to 2</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Crude)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Wood 3 Fragment: Bone</td>
        <td>Animal Harvesting Skill Less or Equal to 2</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Decent)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Fragment: Bone 1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 3,Animal Harvesting Skill Less or Equal to 4</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Decent)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Wood 3 Fragment: Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 3,Animal Harvesting Skill Less or Equal to 4</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Good)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Fragment: Bone 1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 5,Animal Harvesting Skill Less or Equal to 6</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Good)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Wood 3 Fragment: Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 5,Animal Harvesting Skill Less or Equal to 6</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Great)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Fragment: Bone 1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 7,Animal Harvesting Skill Less or Equal to 8</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Great)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Wood 3 Fragment: Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 7,Animal Harvesting Skill Less or Equal to 8</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Superlative)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Fragment: Bone 1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 9</td>
    </tr>
    <tr>
        <td>Arrow: Bone (Superlative)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Wood 3 Fragment: Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 9</td>
    </tr>
    <tr>
        <td>Arrow: Daedric</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>150 Arrow: Ebony 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Daedric Fire</td>
        <td> Arcane Craftsmanship,Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Daedric 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Daedric Ice</td>
        <td> Arcane Craftsmanship,Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Daedric 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Daedric Shock</td>
        <td> Arcane Craftsmanship,Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Daedric 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dragonbone</td>
        <td>Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Bone 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dragonbone Fire</td>
        <td> Arcane Craftsmanship,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Arrow: Dragonbone</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dragonbone Ice</td>
        <td> Arcane Craftsmanship,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Arrow: Dragonbone</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dragonbone Shock</td>
        <td> Arcane Craftsmanship,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Arrow: Dragonbone</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dwarven</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Wood 1 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dwarven Fire</td>
        <td> Arcane Craftsmanship,Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Dwarven 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dwarven Ice</td>
        <td> Arcane Craftsmanship,Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Dwarven 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Dwarven Shock</td>
        <td> Arcane Craftsmanship,Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Dwarven 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Ebony Fire</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Ebony 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Ebony Ice</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Ebony 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Ebony Shock</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Ebony 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Elven</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Wood 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Elven Fire</td>
        <td> Arcane Craftsmanship,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Elven 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Elven Ice</td>
        <td> Arcane Craftsmanship,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Elven 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Elven Shock</td>
        <td> Arcane Craftsmanship,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Elven 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Falmer</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Chaurus Chitin 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Forsworn</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Doe Antlers 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Glass</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Malachite 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Glass Fire</td>
        <td> Arcane Craftsmanship,Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Glass 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Glass Ice</td>
        <td> Arcane Craftsmanship,Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Glass 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Glass Shock</td>
        <td> Arcane Craftsmanship,Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Glass 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Iron</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Iron Fire</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Iron 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Iron Ice</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Iron 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Iron Shock</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Iron 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Nordic</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Wood 1 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Nordic Fire</td>
        <td> Arcane Craftsmanship,Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Arrow: Nordic</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Nordic Frost</td>
        <td> Arcane Craftsmanship,Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Arrow: Nordic</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Nordic Shock</td>
        <td> Arcane Craftsmanship,Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Arrow: Nordic</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Orcish</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Orcish Fire</td>
        <td> Arcane Craftsmanship,Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Orcish 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Orcish Ice</td>
        <td> Arcane Craftsmanship,Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Orcish 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Orcish Shock</td>
        <td> Arcane Craftsmanship,Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Orcish 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Silver</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 1 Ingot: Steel 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Silver Fire</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Arrow: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Silver Ice</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Arrow: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Silver Shock</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Arrow: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Skyforge Steel</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Wood 1 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Arrow: Stalhrim</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Wood 1 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Arrow: Stalhrim Fire</td>
        <td> Arcane Craftsmanship,Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Arrow: Stalhrim</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Stalhrim Frost</td>
        <td> Arcane Craftsmanship,Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Arrow: Stalhrim</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Stalhrim Shock</td>
        <td> Arcane Craftsmanship,Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Arrow: Stalhrim</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Steel</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Steel Fire</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Steel 1 Fire Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Steel Ice</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Steel 1 Frost Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Steel Shock</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>15 Arrow: Steel 1 Void Salts</td>
        <td></td>
    </tr>
    <tr>
        <td>Arrow: Stone (Crude)</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Wood 1 Sharp Rock</td>
        <td>Animal Harvesting Skill Less or Equal to 2</td>
    </tr>
    <tr>
        <td>Ashfire Mead</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>1 Juniper Berries 1 Honey 1 Ashen Grass Pod</td>
        <td>Dragonborn - Retaking Thirsk Complete,Dragonborn - Retaking Thirsk Complete</td>
    </tr>
    <tr>
        <td>Auriel's Bow Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips</td>
        <td>DawnGuard - Touching the Sky Complete</td>
    </tr>
    <tr>
        <td>Auriel's Shield Replica</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Moonstone 2 Ingot: Quicksilver 2 Leather Strips</td>
        <td>DawnGuard - Touching the Sky Complete</td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Bandage</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Barrel</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood 1 Iron Nails</td>
        <td></td>
    </tr>
    <tr>
        <td>Bear and Bear Chowder</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 1 Goat Cheese Slice 1 Blue Mountain Flower 1 Bottled Milk 1 Raw Bear Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Bear Carrot Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Carrot 1 Raw Bear Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Bear Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Bear Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Bear 2 Bear Claws 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Cave Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Cloak - White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>3 Pelt: Snow Bear 2 Bear Claws 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Cave Bear 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Cave Bear 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Snow Bear 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Cave Bear 1 Leather Strips 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 1 Leather Strips 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Snow Bear 1 Leather Strips 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Bearskin Hood - White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Snow Bear 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Beef Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Beef</td>
        <td></td>
    </tr>
    <tr>
        <td>Beef Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Garlic 1 Carrot 1 Raw Beef 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Beggar's Broth</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Raw Horse Meat 2 Purple Mountain Flower 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Bestial Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Raw Salmon Steak 1 Bottled Milk 1 Wolf Heart 3 Raw Wolf Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Black-Briar Reserve</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>4 Wheat</td>
        <td></td>
    </tr>
    <tr>
        <td>Blade of Sacrifice Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips</td>
        <td>Daedra - Boethiahs Calling</td>
    </tr>
    <tr>
        <td>Blade of Woe Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips</td>
        <td>Dark Brotherhood - Death Incarnate Complete</td>
    </tr>
    <tr>
        <td>Blades Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td>Main Quest - Alduins Wall Complete</td>
    </tr>
    <tr>
        <td>Blades Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td>Main Quest - Alduins Wall Complete</td>
    </tr>
    <tr>
        <td>Blades Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td>Main Quest - Alduins Wall Complete</td>
    </tr>
    <tr>
        <td>Blades Helmet</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather</td>
        <td>Main Quest - Alduins Wall Complete</td>
    </tr>
    <tr>
        <td>Blades Shield</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips</td>
        <td>Main Quest - Alduins Wall Complete</td>
    </tr>
    <tr>
        <td>Blood of the Hunt (Strange Brew)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Bear Heart 1 Deer Heart 1 Goat Heart 1 Wolf Heart 1 Mammoth Heart</td>
        <td>Brewing Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Blood-Conserving Phial</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>3 Salt 1 Ingot: Gold 1 Building Glass 3 Mild Acid</td>
        <td></td>
    </tr>
    <tr>
        <td>Blood-Conserving Phial</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>3 Salt 1 Ingot: Gold 1 Building Glass 3 Strong Acid</td>
        <td></td>
    </tr>
    <tr>
        <td>Bloodskal Blade Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 2 Leather Strips 3 Ingot: Galatite</td>
        <td>Dragonborn - The Final Decent Complete</td>
    </tr>
    <tr>
        <td>Boar Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Boar Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Boar Leek Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Leek 1 Raw Boar Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Boar Potato Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Potato 1 Raw Boar Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Boiled Cabbage and Mammoth</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Cabbage 1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Boiled Skeever Tail</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Skeever Tail</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bolt: Ancient Nordic Hero</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Ancient Nordic Hero Fire</td>
        <td> Arcane Craftsmanship,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Ancient Nordic Hero</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Ancient Nordic Hero Frost</td>
        <td> Arcane Craftsmanship,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Ancient Nordic Hero</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Ancient Nordic Hero Shock</td>
        <td> Arcane Craftsmanship,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Ancient Nordic Hero</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Daedric</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Soul Gem: Black 1 Daedra Heart 150 Bolt: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Daedric Fire</td>
        <td> Arcane Craftsmanship,Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Daedric</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Daedric Ice</td>
        <td> Arcane Craftsmanship,Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Daedric</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Daedric Shock</td>
        <td> Arcane Craftsmanship,Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Daedric</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dark Brotherhood</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dark Brotherhood Fire</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Dark Brotherhood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dark Brotherhood Frost</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Dark Brotherhood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dark Brotherhood Shock</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Dark Brotherhood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dawnguard</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dawnguard Fire</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Dawnguard</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dawnguard Frost</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Dawnguard</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dawnguard Shock</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Dawnguard</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dragonbone</td>
        <td>Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Bone 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dragonbone Fire</td>
        <td> Arcane Craftsmanship,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Dragonbone</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dragonbone Ice</td>
        <td> Arcane Craftsmanship,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Dragonbone</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dragonbone Shock</td>
        <td> Arcane Craftsmanship,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Dragonbone</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dwarven</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Wood 1 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dwarven Fire</td>
        <td> Arcane Craftsmanship,Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dwarven Fireburst</td>
        <td>Dwarven Blacksmithing, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Dwarven</td>
        <td>Read Dwemer Bolt of Fire Schematic</td>
    </tr>
    <tr>
        <td>Bolt: Dwarven Ice</td>
        <td> Arcane Craftsmanship,Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dwarven Iceburst</td>
        <td>Dwarven Blacksmithing, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Dwarven</td>
        <td>Read Dwemer Bolt of Ice Schematic</td>
    </tr>
    <tr>
        <td>Bolt: Dwarven Shock</td>
        <td> Arcane Craftsmanship,Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Dwarven Shockburst</td>
        <td>Dwarven Blacksmithing, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Dwarven</td>
        <td>Read Dwemer Bolt of Shock Schematic</td>
    </tr>
    <tr>
        <td>Bolt: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Ebony Fire</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Ebony Ice</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Ebony Shock</td>
        <td> Arcane Craftsmanship,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Elven</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Wood 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Elven Fire</td>
        <td> Arcane Craftsmanship,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Elven</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Elven Ice</td>
        <td> Arcane Craftsmanship,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Elven</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Elven Shock</td>
        <td> Arcane Craftsmanship,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Elven</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Glass</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Malachite 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Glass Fire</td>
        <td> Arcane Craftsmanship,Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Glass</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Glass Ice</td>
        <td> Arcane Craftsmanship,Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Glass</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Glass Shock</td>
        <td> Arcane Craftsmanship,Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Glass</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Imperial</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Imperial Fire</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Imperial</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Imperial Frost</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Imperial</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Imperial Shock</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Imperial</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Iron</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Iron Fire</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Iron Ice</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Iron Shock</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Orcish</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Orcish Fire</td>
        <td> Arcane Craftsmanship,Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Orcish</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Orcish Ice</td>
        <td> Arcane Craftsmanship,Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Orcish</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Orcish Shock</td>
        <td> Arcane Craftsmanship,Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Orcish</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Silver</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 1 Ingot: Steel 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Silver Fire</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Silver Ice</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Silver Shock</td>
        <td> Arcane Craftsmanship,Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Stalhrim</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Bolt: Stalhrim Fire</td>
        <td> Arcane Craftsmanship,Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Stalhrim</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Stalhrim Frost</td>
        <td> Arcane Craftsmanship,Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Stalhrim</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Stalhrim Shock</td>
        <td> Arcane Craftsmanship,Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Stalhrim</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Steel</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Steel Fire</td>
        <td> Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Steel</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Steel Ice</td>
        <td> Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Steel</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Steel Shock</td>
        <td> Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Steel</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Stormcloak</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Stormcloak Fire</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Stormcloak</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Stormcloak Frost</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Stormcloak</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Stormcloak Shock</td>
        <td>Craftsmanship, Arcane Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Stormcloak</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Thieves Guild</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Thieves Guild Fire</td>
        <td> Arcane Craftsmanship,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Fire Salts 15 Bolt: Thieves Guild</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Thieves Guild Frost</td>
        <td> Arcane Craftsmanship,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 15 Bolt: Thieves Guild</td>
        <td></td>
    </tr>
    <tr>
        <td>Bolt: Thieves Guild Shock</td>
        <td> Arcane Craftsmanship,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 15 Bolt: Thieves Guild</td>
        <td></td>
    </tr>
    <tr>
        <td>Bone Amulet of the Beaver Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Buck Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Flower Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Harvest Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Hunter's Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Long Night</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Pink Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Snow Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Strawberry Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Sturgeon Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Wolf Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Amulet of the Worm Moon</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Hide Lace 3 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Divining Knife</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Leather Strips 3 Fragment: Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Bone Hawk Amulet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>2 Leather Strips 1 Bone Hawk Skull 6 Bone Hawk Feathers</td>
        <td></td>
    </tr>
    <tr>
        <td>Bone Hawk Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>3 Bone Hawk Claw 3 Fragment: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Bone Hawk Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>3 Silver Ring 3 Bone Hawk Claw</td>
        <td></td>
    </tr>
    <tr>
        <td>Bone Hunting Knife</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Idol of the Elm Rite (Strange Brew)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Elm Ritual Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 7</td>
    </tr>
    <tr>
        <td>Bone Idol of the Oak Rite (Strange Brew)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Oak Ritual Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 9</td>
    </tr>
    <tr>
        <td>Bone Idol of the Yew Rite (Strange Brew)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Yew Ritual Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Bone Jagged Ring</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Bone Lucky Ring</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Bone Masterwork Sword</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>2 Hawk Feathers 3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative)</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Bone Masterwork War Axe</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>2 Hide Lace 3 Wolf Claws 2 Animal Bone (Large) 1 Animal Bone (Superlative)</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Bone Meal</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>3 Fragment: Bone</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bone Ring of the Elm Rite</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Strange Bear Claw</td>
        <td>Animal Harvesting Skill Greater or Equal to 7</td>
    </tr>
    <tr>
        <td>Bone Ring of the Oak Rite</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Strange Cat Claw</td>
        <td>Animal Harvesting Skill Greater or Equal to 9</td>
    </tr>
    <tr>
        <td>Bone Ring of the Yew Rite</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Strange Wolf Claw</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Bone Silvered Ring (Strange Brew)</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>Forge</td>
        <td>1 Animal Bone (Small) 8 Fragment: Silver</td>
        <td>Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Bone Smooth Ring</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Bone Staff</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>2 Leather Strips 1 Animal Bone (Large) 2 Animal Bone (Superlative)</td>
        <td>Animal Harvesting Skill Greater or Equal to 4</td>
    </tr>
    <tr>
        <td>Bone Sword</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Hide Lace 1 Animal Bone (Large) 1 Animal Bone (Superlative)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Bone Thorned Ring</td>
        <td></td>
        <td>Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Animal Bone (Small)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Bone War Axe</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>2 Leather Strips 2 Animal Bone (Large) 1 Animal Bone (Superlative)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Bonemold Boots</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>6 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Bonemold Cuirass</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>8 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Bonemold Gauntlets</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Bone Meal 1 Ingot: Iron 2 Leather Strips 1 Netch Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Bonemold Helmet</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>6 Bone Meal 1 Ingot: Iron 1 Leather Strips 1 Netch Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Bonemold Improved Boots</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather</td>
        <td>Read Bonemold Formula</td>
    </tr>
    <tr>
        <td>Bonemold Improved Cuirass</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>8 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather</td>
        <td>Read Bonemold Formula</td>
    </tr>
    <tr>
        <td>Bonemold Improved Gauntlets</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 2 Leather Strips 1 Netch Jelly 1 Netch Leather</td>
        <td>Read Bonemold Formula</td>
    </tr>
    <tr>
        <td>Bonemold Improved Helmet</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>6 Bone Meal 1 Salt 1 Ingot: Iron 1 Powdered Mammoth Tusk 1 Leather Strips 1 Netch Jelly 1 Netch Leather</td>
        <td>Read Bonemold Formula</td>
    </tr>
    <tr>
        <td>Bonemold Improved Pauldroned Cuirass</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>10 Bone Meal 2 Salt 2 Ingot: Iron 2 Powdered Mammoth Tusk 4 Leather Strips 2 Netch Jelly 2 Netch Leather</td>
        <td>Read Bonemold Formula</td>
    </tr>
    <tr>
        <td>Bonemold Improved Shield</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>8 Bone Meal 2 Salt 1 Ingot: Iron 2 Powdered Mammoth Tusk 2 Netch Jelly 1 Netch Leather</td>
        <td>Read Bonemold Formula</td>
    </tr>
    <tr>
        <td>Bonemold Pauldroned Cuirass</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Bonemold Pauldroned Cuirass - Guard's</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>10 Bone Meal 2 Ingot: Iron 4 Leather Strips 2 Netch Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Bonemold Shield</td>
        <td>Morrowind Smithing 1</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>8 Bone Meal 1 Ingot: Iron 1 Netch Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Bonesap</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Bone Meal 1 Spriggan Sap</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Braided Bread</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Salt 2 Flour 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Bread Loaf</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Salt 1 Flour 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Breaded Elk Cutlet</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Chicken's Egg 1 Bread Loaf 1 Raw Elk Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Building Glass</td>
        <td>Craftsmanship</td>
        <td>Builders ,Alchemists</td>
        <td>Smelter</td>
        <td>20 Fragment: Building Glass</td>
        <td></td>
    </tr>
    <tr>
        <td>Butter</td>
        <td></td>
        <td>None Required</td>
        <td>Butter Churn</td>
        <td>1 Bottled Milk</td>
        <td></td>
    </tr>
    <tr>
        <td>Cabbage Potato Soup</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Cabbage 1 Potato 1 Leek 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Cabbage Soup</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Cabbage 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Champion's Cudgel Replica</td>
        <td>Advanced Light Smithing,Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Leather Strips 5 Ingot: Galatite</td>
        <td>Dragonborn - March Of The Dead Complete,Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Fishing Rod</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Toolkit: Tailor's</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Toolkit: Survivalist's</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Toolkit: Brewer's</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Toolkit: Alchemist's</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Iron Pickaxe</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Torch (Bright)</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Lute</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Flute</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Arrow: Practice</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Torch</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Light Bow</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Drum</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Ladle</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Spigot</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Pitchfork</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Iron Pitchfork</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Well Bucket</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Roped Bucket</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Broom</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Bellows</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Bowl</td>
        <td></td>
    </tr>
    <tr>
        <td>Charcoal</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Wooden Heavy Bow</td>
        <td></td>
    </tr>
    <tr>
        <td>Charred Hawk Beak</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Hawk Beak</td>
        <td></td>
    </tr>
    <tr>
        <td>Charred Skeever Hide</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Pelt: Skeever (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Chaurus Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Chaurus Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Chaurus Pie</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>2 Salt 1 Red Apple 1 Carrot 1 Potato 1 Tomato 1 Honeycomb 1 Raw Chaurus Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Chaurus Venom (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>2 Chaurus Venom (Crude)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Chaurus Venom (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Falmer Ear 1 Chaurus Venom (Good) 1 Chaurus Venom (Crude)</td>
        <td>Animal Harvesting Skill Greater or Equal to 4</td>
    </tr>
    <tr>
        <td>Chaurus Venom (Superlative)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Chaurus Eggs 1 Chaurus Venom (Great)</td>
        <td>Animal Harvesting Skill Greater or Equal to 6</td>
    </tr>
    <tr>
        <td>Cheesy Potato Mammoth</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Nord Mead 1 Goat Cheese Slice 1 Potato 1 Bottled Milk 1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Chest</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Chest</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Chest</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Chicken Dumpling</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Salt 1 Garlic 2 Leek 2 Raw Chicken Breast 1 Flour</td>
        <td></td>
    </tr>
    <tr>
        <td>Chicken Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Chicken Breast</td>
        <td></td>
    </tr>
    <tr>
        <td>Child's Chest</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Child's Chest</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Child's Doll</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Tundra Cotton 1 Leather Strips 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Chillrend Replica</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Frost Salts 2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium</td>
        <td>TG - The Pursuit Complete</td>
    </tr>
    <tr>
        <td>Chitin Heavy Boots</td>
        <td>Morrowind Smithing 2,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 4 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Heavy Cuirass</td>
        <td>Morrowind Smithing 2,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Corundum 4 Leather Strips 2 Netch Leather 6 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Heavy Gauntlets</td>
        <td>Morrowind Smithing 2,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 2 Leather Strips 1 Netch Leather 3 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Heavy Helmet</td>
        <td>Morrowind Smithing 2,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Leather Strips 1 Netch Leather 4 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Light Boots</td>
        <td>Morrowind Smithing 2</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 2 Netch Leather 2 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Light Bracers</td>
        <td>Morrowind Smithing 2</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 1 Netch Leather 2 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Light Cuirass</td>
        <td>Morrowind Smithing 2</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Leather Strips 3 Netch Leather 4 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Light Helmet</td>
        <td>Morrowind Smithing 2</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips 1 Netch Leather 3 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Chitin Light Shield</td>
        <td>Morrowind Smithing 2</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Netch Leather 4 Chitin Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Cinnabar Beer</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>1 Ale 1 Jazbay Grapes 1 Creep Cluster</td>
        <td>Sidequest - On Hogithum Complete</td>
    </tr>
    <tr>
        <td>Circle Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Leather 3 Ingot: Galatite 2 Fur Plate</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Circle Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 2 Leather Strips 1 Leather 3 Ingot: Galatite</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Circle Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Leather Strips 2 Leather 5 Ingot: Galatite 6 Fur Plate</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Circle Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Pelt: Snow Bear 4 Leather Strips 2 Leather 5 Ingot: Galatite</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Circle Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Leather 2 Ingot: Galatite 2 Fur Plate</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Circle Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 2 Leather Strips 1 Leather 2 Ingot: Galatite</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Circle Helmet</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Leather Strips 1 Leather 3 Ingot: Galatite</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Circle Shield</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 5 Ingot: Galatite</td>
        <td>Companions - Silver Hand Complete</td>
    </tr>
    <tr>
        <td>Clam Chowder</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Potato 1 Raw Clam Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Cliff Racer</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>1 Firebrand Wine 1 Cyrodilic Brandy 1 Flin 1 Sujamma</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Angelfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Angelfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Angelfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Angelfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Angler</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Angler</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Angler</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Angler</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Angler Larvae</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Angler Larvae</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Angler Larvae</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Angler Larvae</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Arctic Char</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Arctic Char</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Arctic Char</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Arctic Char</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Arctic Grayling</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Arctic Grayling</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Arctic Grayling</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Arctic Grayling</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Bear Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Bear Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Bear Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Bear Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Beef</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Beef</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Beef</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Beef</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Brook Bass</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Brook Bass</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Brook Bass</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Brook Bass</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Carp</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Carp</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Carp</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Carp</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Catfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Catfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Catfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Catfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Chaurus Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Chaurus Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Chaurus Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Chaurus Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Chicken Breast</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>2 Raw Chicken Breast</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Chicken Breast</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Chicken Breast</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Cod</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Cod</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Cod</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Cod</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Direfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Direfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Direfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Direfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Dog Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Dog Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Dog Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Dog Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Dragon Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Dragon Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Dragon Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Dragon Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Elk Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Elk Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Elk Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Elk Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Fat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Fat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Fox Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Fox Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Fox Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Fox Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Glass Catfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Glass Catfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Glass Catfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Glass Catfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Glassfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Glassfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Glassfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Glassfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Goat Leg</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Goat Leg</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Goat Leg</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Goat Leg</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Goat Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Goat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Goat Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Goat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Goldfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Goldfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Goldfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Goldfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Horker Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Horker Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Horker Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Horker Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Horse Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Horse Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Horse Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Horse Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Juvenile Mudcrab</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Juvenile Mudcrab</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Juvenile Mudcrab</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Juvenile Mudcrab</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Leeks</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Leek</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Leeks</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Leek</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Lyretail Anthias</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Lyretail Anthias</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Lyretail Anthias</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Lyretail Anthias</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mammoth Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mammoth Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mammoth Snout</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Mammoth Snout</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mammoth Snout</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Mammoth Snout</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mudcrab</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mudcrab</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mudcrab Legs</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Mudcrab Legs</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Mudcrab Legs</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Mudcrab Legs</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pearlfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Pearlfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pearlfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Pearlfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pheasant Breast</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Pheasant Breast</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pheasant Breast</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Pheasant Breast</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pogfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Pogfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pogfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Pogfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Potatoes</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Potato</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Potatoes</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Potato</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pygmy Sunfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Pygmy Sunfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Pygmy Sunfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Pygmy Sunfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Rabbit Leg</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Rabbit Leg</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Rabbit Leg</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Rabbit Leg</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Rabbit Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Rabbit Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Rabbit Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Rabbit Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Sabre Cat Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Sabre Cat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Sabre Cat Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Sabre Cat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Salmon Steak</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Salmon</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Salmon Steak</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Salmon Steak</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Salmon Steak</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Salmon</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Salmon Steak</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Salmon Steak</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Scorpion Fish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Scorpion Fish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Scorpion Fish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Scorpion Fish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Skeever Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Skeever Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Skeever Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Skeever Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Slaughterfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Slaughterfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Slaughterfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Slaughterfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Slaughterfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Slaughterfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Spadefish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Spadefish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Spadefish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Spadefish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Spider Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Spider Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Spider Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Spider Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Tripod Spiderfish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Tripod Spiderfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Tripod Spiderfish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Tripod Spiderfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Troll Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Troll Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Troll Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Troll Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Vampire Fish</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Vampire Fish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Vampire Fish</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Vampire Fish</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Venison</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Venison</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Venison</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Venison</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Wolf Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Raw Wolf Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Cooked Wolf Meat</td>
        <td></td>
        <td>None Required</td>
        <td>Any Fire Source,Cook pot</td>
        <td>1 Raw Wolf Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Amber Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amber 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Amethyst Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Amethyst Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Aquamarine Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Aquamarine Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Diamond Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Diamond Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Emerald Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Emerald Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Garnet Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Garnet Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Onyx Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Onyx 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Opal Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Opal 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Peridot Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Peridot Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Ruby Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Ruby Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Sapphire Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Copper Sapphire Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire (Flawless) 1 Copper Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Boots - Thalmor</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Thread 3 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Spinning Wheel</td>
        <td>3 Tundra Cotton</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Indigo</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Purple</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cloth - Yellow</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 1 Dye - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cuffed Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Thread 3 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Cultist Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather 2 Cotton Thread 2 Cotton Cloth - Brown</td>
        <td>Dragonborn - Dragonborn Complete</td>
    </tr>
    <tr>
        <td>Cotton Cultist Gloves</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Bone Meal 2 Cotton Thread 2 Cotton Cloth - Brown</td>
        <td>Dragonborn - Dragonborn Complete</td>
    </tr>
    <tr>
        <td>Cotton Cultist Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Bone Meal 4 Leather 4 Cotton Thread 5 Cotton Cloth - Brown</td>
        <td>Dragonborn - Dragonborn Complete</td>
    </tr>
    <tr>
        <td>Cotton Fine Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>6 Gold 1 Leather 2 Cotton Thread 3 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fine Clothes - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fine Clothes - Indigo</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fine Hat</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather Strips 1 Cotton Thread 3 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fine Hat</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather Strips 1 Pelt: Snow Fox 1 Cotton Thread 3 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fine Shoes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fur-Mantled Clothes - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fur-Mantled Clothes - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 2 Cotton Cloth 4 Cotton Thread 2 Cotton Cloth - Blue 1 Cotton Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fur-Mantled Clothes - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Fur-Mantled Clothes - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 4 Cotton Thread 1 Cotton Cloth - Brown 4 Cotton Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Gloves - Mythic Dawn</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Cotton Thread 2 Cotton Cloth - Red</td>
        <td>Daedra - Pieces of the Past</td>
    </tr>
    <tr>
        <td>Cotton Gloves - Thalmor</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Thread 2 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Hood - Mythic Dawn</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Thread 3 Cotton Cloth - Red</td>
        <td>Daedra - Pieces of the Past</td>
    </tr>
    <tr>
        <td>Cotton Jester's Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Thread 3 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Jester's Clothes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather Strips 4 Cotton Thread 1 Cotton Cloth - Black 4 Cotton Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Jester's Gloves</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Thread 2 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Jester's Hat</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Thread 1 Cotton Cloth - Black 2 Cotton Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Mage Boots - Common</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Cotton Thread 1 Cotton Cloth - Blue 2 Cotton Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Mage Boots - Embellished</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Cotton Thread 1 Cotton Cloth - Brown 2 Cotton Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Merchant's Hat</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Thread 3 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Quilted Clothes - Black and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Quilted Clothes - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 4 Cotton Thread 2 Cotton Cloth - Blue 3 Cotton Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Quilted Clothes - Brown and Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Cotton Thread 3 Cotton Cloth - Brown 2 Cotton Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Quilted Clothes - Brown and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Cloth 4 Cotton Thread 3 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Quilted Clothes - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 4 Cotton Thread 4 Cotton Cloth - Brown 1 Cotton Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Quilted Clothes - Orange and Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Reclamations Temple Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown 1 Cotton Cloth - Grey</td>
        <td>Dragonborn - Clean Sweep Complete</td>
    </tr>
    <tr>
        <td>Cotton Reclamations Temple Hood</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Thread 3 Cotton Cloth - Blue</td>
        <td>Dragonborn - Clean Sweep Complete</td>
    </tr>
    <tr>
        <td>Cotton Reclamations Temple Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Netch Leather 4 Cotton Thread 2 Cotton Cloth - Black 3 Cotton Cloth - Blue 2 Cotton Cloth - Grey</td>
        <td>Dragonborn - Clean Sweep Complete</td>
    </tr>
    <tr>
        <td>Cotton Robes - Mythic Dawn</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Cotton Thread 4 Cotton Cloth - Red 1 Cotton Cloth - Yellow</td>
        <td>Daedra - Pieces of the Past</td>
    </tr>
    <tr>
        <td>Cotton Robes - Thalmor</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Cotton Thread 5 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Shoes - Mythic Dawn</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Cotton Thread 2 Cotton Cloth - Brown</td>
        <td>Daedra - Pieces of the Past</td>
    </tr>
    <tr>
        <td>Cotton Tall Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Cotton Thread 4 Cotton Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Telvanni Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Netch Leather 4 Cotton Thread 1 Cotton Cloth - Black 3 Cotton Cloth - Red 1 Cotton Cloth - Yellow</td>
        <td>Dragonborn - Old Friends Complete</td>
    </tr>
    <tr>
        <td>Cotton Telvanni Shoes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Netch Leather 2 Cotton Thread 2 Cotton Cloth - Brown</td>
        <td>Dragonborn - Old Friends Complete</td>
    </tr>
    <tr>
        <td>Cotton Thread</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Spinning Wheel</td>
        <td>3 Tundra Cotton</td>
        <td></td>
    </tr>
    <tr>
        <td>Cotton Vaermina Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Cotton Thread 5 Cotton Cloth - Purple</td>
        <td>Daedra - Waking Nightmare</td>
    </tr>
    <tr>
        <td>Crab Cakes</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Salt 1 Flour 1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Crab Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Garlic 1 Potato 1 Leek 1 Raw Mudcrab Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Creamy Crab Bisque</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Flour 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Cured Skeever Hide</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Salt 1 Pelt: Skeever</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Daedric Battleaxe</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Battleaxe 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Battlestaff</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Soul Gem: Black 1 Daedra Heart 1 Ebony Battlestaff</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Boots</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Boots 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Cuirass</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Cuirass 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Dagger</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Dagger 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Gauntlets</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Gauntlets 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Greatsword</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Greatsword 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Heavy Bow</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Heavy Bow 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Heavy Crossbow</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Soul Gem: Black 1 Daedra Heart 1 Ebony Heavy Crossbow 4 Silk Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Helmet</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Helmet 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Hunting Knife</td>
        <td>Daedric Smithing</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Daedra Heart 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Mace</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Mace 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Shield</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Shield 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Sword</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Sword 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric War Axe</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony War Axe 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Daedric Warhammer</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ebony Warhammer 1 Soul Gem: Black 1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Dark Brotherhood Heavy Crossbow</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Ingot: Ebony 2 Wood 1 Leather 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Dawnbreaker Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 3 Ingot: Calcinium</td>
        <td>Daedra - The Break of Dawn</td>
    </tr>
    <tr>
        <td>Dawnguard Heavy Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Heavy Cuirass - Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Heavy Cuirass - Grey</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 4 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Grey</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Heavy Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Heavy Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather 4 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Heavy Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Improved Light Crossbow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Corundum 1 Dawnguard Light Crossbow</td>
        <td>Read Improved Crossbow Schematic</td>
    </tr>
    <tr>
        <td>Dawnguard Light Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 2 Leather 3 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Light Crossbow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 3 Wood 4 Hide Lace</td>
        <td>Dawnguard - A New Order complete and spoken to Sorine about crossbow construction</td>
    </tr>
    <tr>
        <td>Dawnguard Light Cuirass - Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Black</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Light Cuirass - Red</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Dye - Red</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Light Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 2 Leather 2 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Light Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 2 Leather 4 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Reinforced Light Cuirass - Blue</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 3 Ingot: Steel 4 Leather Strips 4 Leather 1 Dye - Blue</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Rune Shield Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 3 Ingot: Steel 1 Ingot: Ebony 2 Leather Strips</td>
        <td>DawnGuard - Lost Relic Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Rune War Axe Replica</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver</td>
        <td>DawnGuard - Lost Relic Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Rune Warhammer Replica</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver</td>
        <td>DawnGuard - Lost Relic Complete</td>
    </tr>
    <tr>
        <td>Dawnguard War Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Wood 2 Leather Strips 4 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Dawnguard Warhammer</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 2 Wood 3 Leather Strips 7 Fragment: Silver</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Decorative War Horn</td>
        <td></td>
        <td>Builders</td>
        <td>None</td>
        <td>1 Ingot: Iron 1 Animal Bone (Superlative)</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Deviled Chaurus</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Thistle Branch 1 Bleeding Crown 1 Raw Chaurus Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Diamond</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Diamond (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Dog Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Dog Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon Blood Pudding</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Jazbay Grapes 1 Moon Sugar 1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon Heart Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 1 Fire Salts 1 Potato 1 Tomato 1 Dragon Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Dragon Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon Priest Dagger</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon Stuffed Rabbit</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Dragon's Tongue 1 Raw Rabbit Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon Vegetable Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Carrot 2 Potato 1 Raw Dragon Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Blood Poison (Crude)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Wolf Eye 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Equal to 1</td>
    </tr>
    <tr>
        <td>Dragon's Blood Poison (Decent)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Wolf Eye 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Equal to 2</td>
    </tr>
    <tr>
        <td>Dragon's Blood Poison (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Wolf Eye 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Equal to 3</td>
    </tr>
    <tr>
        <td>Dragon's Blood Poison (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Wolf Eye 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Equal to 4</td>
    </tr>
    <tr>
        <td>Dragon's Blood Poison (Remarkable)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Wolf Eye 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Dragon's Blood Potion (Decent)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Equal to 2</td>
    </tr>
    <tr>
        <td>Dragon's Blood Potion (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Equal to 3</td>
    </tr>
    <tr>
        <td>Dragon's Blood Potion (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Equal to 4</td>
    </tr>
    <tr>
        <td>Dragon's Blood Potion (Remarkable)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werewolf's Blood</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Dragon's Breath Mead</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>2 Dragon's Tongue 1 Honey</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of Firebloom</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of Furious Speed</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of Ghostly Passage</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of Kyne's Peace</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of Slowed Time</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of Swiftness</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of the Living Circle</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of the Shade</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of the Storm</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Elixir of the Unseen</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Venom of Death</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Venom of Disarming</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Venom of Explosive Force</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Venom of Terrible Frost</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragon's Venom of Torpor</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Battleaxe</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Dragon Bone 2 Ingot: Ebony 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Dagger</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Greatsword</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Heavy Bow</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Heavy Crossbow</td>
        <td>Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Dragon Bone 2 Ingot: Ebony 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Hunting Knife</td>
        <td>Draconic Blacksmithing</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Mace</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Dragon Bone 1 Ingot: Ebony 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Sword</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone War Axe</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonbone Warhammer</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Dragon Bone 2 Ingot: Ebony 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonplate Boots</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonplate Cuirass</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Scales 4 Dragon Bone 2 Ingot: Ebony 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonplate Gauntlets</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonplate Helmet</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonplate Shield</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Dragon Bone 2 Ingot: Ebony 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonplate Wolfskin Hood - Noble White</td>
        <td>Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragonplate Helmet 1 Wolfskin Hood - Noble White</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonscale Boots</td>
        <td>Glass Blacksmithing,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonscale Cuirass</td>
        <td>Glass Blacksmithing,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonscale Gauntlets</td>
        <td>Glass Blacksmithing,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonscale Helmet</td>
        <td>Glass Blacksmithing,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Dragon Scales 1 Dragon Bone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Dragonscale Shield</td>
        <td>Glass Blacksmithing,Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Dragon Scales 2 Dragon Bone 2 Ingot: Quicksilver 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Dried Salmon Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Salmon Steak</td>
        <td></td>
    </tr>
    <tr>
        <td>Dried Slaughterfish Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Slaughterfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Battleaxe</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 3 Leather Strips 3 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Boots</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 1 Leather 3 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Cuirass</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Leather Strips 2 Leather 5 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Dagger</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Fishing Rod</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths,Survivalists,Alchemists</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Ingot: Dwarven</td>
        <td>Fishing - Unlocked Dwarven Rod</td>
    </tr>
    <tr>
        <td>Dwarven Gauntlets</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 1 Leather 2 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Greatsword</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Heavy Bow</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 3 Ingot: Dwarven 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Heavy Crossbow</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Wood 3 Ingot: Dwarven 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Helmet</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips 1 Leather 3 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Hunting Knife</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips 1 Ingot: Dwarven 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Improved Light Crossbow</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 4 Ingot: Dwarven</td>
        <td>Read Dwemer Crossbow Schematic</td>
    </tr>
    <tr>
        <td>Dwarven Mace</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 3 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Masterwork Light Crossbow</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 1 Dwarven Improved Light Crossbow</td>
        <td>Improved Dwemer Crossbow Schematic</td>
    </tr>
    <tr>
        <td>Dwarven Shield</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 4 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Sword</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips 2 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven War Axe</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 2 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dwarven Warhammer</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 3 Leather Strips 4 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Black</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Nightshade</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Bleach</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Salt</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Blue</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Indigo 1 Dye - Bleach</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Blue</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Blue Mountain Flower</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Brown</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Black 1 Dye - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Brown</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Canis Root</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Green</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Blue 1 Dye - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Green</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Hanging Moss</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Grey</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Black 1 Dye - Bleach</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Grey</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Giant Lichen</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Indigo</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Black 1 Dye - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Indigo</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Deathbell</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Orange</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Red 1 Dye - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Orange</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Creep Cluster</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Purple</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Blue 1 Dye - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Purple</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Purple Mountain Flower</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Red</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Red Mountain Flower</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Tan</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dye - Brown 1 Dye - Bleach</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Tan</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Grass Pod</td>
        <td></td>
    </tr>
    <tr>
        <td>Dye - Yellow</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Tailors</td>
        <td>Cook pot</td>
        <td>1 Dragon's Tongue</td>
        <td></td>
    </tr>
    <tr>
        <td>Dyed Hawk Feathers</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>3 Hawk Feathers 1 Dye - Black</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Ebony Battleaxe</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Battlestaff</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 2 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Blade Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips</td>
        <td>Daedra - The Whispering Door</td>
    </tr>
    <tr>
        <td>Ebony Boots</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Boots - Gilded</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Boots - Silvered</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 3 Ingot: Ebony 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Cuirass</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Cuirass - Gilded</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Cuirass - Silvered</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Dagger</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Gauntlets</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Gauntlets - Gilded</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Gauntlets - Silvered</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 2 Ingot: Ebony 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Greatsword</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Heavy Bow</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 1 Ingot: Quicksilver 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Heavy Crossbow</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 2 Ingot: Quicksilver 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Helmet</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Helmet - Gilded</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 1 Ingot: Gold 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Helmet - Silvered</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 3 Ingot: Ebony 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Hunting Knife</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Mace</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Mail</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Ebony Mail</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Mail</td>
        <td></td>
        <td>None Required</td>
        <td>None</td>
        <td>1 Ebony Mail</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Mail Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td>Daedra - Boethiahs Calling</td>
    </tr>
    <tr>
        <td>Ebony Mail Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Ebony 2 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td>Daedra - Boethiahs Calling</td>
    </tr>
    <tr>
        <td>Ebony Mail Replica - Gilded</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Mail Replica - Gilded</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Ebony 2 Ingot: Gold 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Mail Replica - Silvered</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Silver 4 Ingot: Ebony 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Mail Replica - Silvered</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Silver 5 Ingot: Ebony 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Shield</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Shield - Gilded</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Ebony 1 Ingot: Gold 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Shield - Silvered</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 4 Ingot: Ebony 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Sword</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony War Axe</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Ebony Warhammer</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Ebony 2 Ingot: Quicksilver 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Elf Eared Elk</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Elves Ear 1 Raw Elk Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Elsweyr Fondue</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 6 Eidar Cheese Slice 1 Leek 1 Moon Sugar</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Battleaxe</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 3 Leather Strips 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Boots</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Boots - Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Boots - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Boots - Thalmor Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 2 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Cuirass</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Cuirass - Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Cuirass - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 4 Leather Strips 2 Leather 5 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Cuirass - Thalmor Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Gold 4 Leather Strips 2 Leather 5 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Dagger</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Gauntlets</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Gauntlets - Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Gauntlets - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Gauntlets - Thalmor Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 2 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Greatsword</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Helmet</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Helmet - Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Helmet - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Helmet - Thalmor Gilded</td>
        <td>Advanced Light Smithing,Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 1 Leather Strips 1 Leather 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Hunting Knife</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Boots</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Boots - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Bow</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Crossbow</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 2 Hide Lace 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Cuirass</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Cuirass - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Gauntlets</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Gauntlets - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Helmet</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Light Helmet - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Mace</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Shield</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Shield - Gilded</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Shield - Thalmor</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 4 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Shield - Thalmor Gilded</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold 2 Leather Strips 4 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Sword</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven War Axe</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Elven Warhammer</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 3 Leather Strips 4 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Emerald</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Emerald (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Emperor's Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red</td>
        <td>Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Emperor's Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 4 Silk Cloth - Black 1 Silk Cloth - Red</td>
        <td>Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Engraved Bone of Hircine</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Engraved Bone of Julianos</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Engraved Bone of Kynareth</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Falmer Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Chaurus Chitin 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Chaurus Chitin 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Chaurus Chitin 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Hardened Boots</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Hardened Cuirass</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Chaurus Chitin 2 Ingot: Ebony 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Hardened Gauntlets</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Chaurus Chitin 1 Ingot: Ebony 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Hardened Helmet</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Chaurus Chitin 1 Ingot: Ebony 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Heavy Boots</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Chaurus Chitin 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Heavy Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Chaurus Chitin 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Heavy Cuirass</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Chaurus Chitin 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Heavy Gauntlets</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Chaurus Chitin 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Heavy Helmet</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Chaurus Chitin 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Chaurus Chitin 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Honed Light Bow</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Falmer Heavy Bow 2 Ingot: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Honed Sword</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Falmer Sword 1 Ingot: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Honed War Axe</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Falmer War Axe 1 Ingot: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Chaurus Chitin 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Chaurus Chitin 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Falmer War Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Chaurus Chitin 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Farmer's Breakfast</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Tomato 1 Mora Tapinella 1 Raw Boar Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Fatty Fin Fry</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Garlic 1 Raw Horker Meat 1 Grass Pod</td>
        <td></td>
    </tr>
    <tr>
        <td>Fish with Crab Sauce</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Alto Noir Wine 1 Raw Slaughterfish 1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Flaming Dragon</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Red Mountain Flower 1 Mulled Wine 1 Raw Dragon Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Flammable Oil</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>2 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Flare Coating</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>3 Torchbug Thorax</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Floral Head Wreath</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>12 Tundra Cotton</td>
        <td></td>
    </tr>
    <tr>
        <td>Flour</td>
        <td></td>
        <td>None Required</td>
        <td>Grain Mill</td>
        <td>2 Wheat</td>
        <td></td>
    </tr>
    <tr>
        <td>Focusing Gloves</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Cotton Thread 2 Cotton Cloth - Black</td>
        <td>College - Out Of Balance Complete</td>
    </tr>
    <tr>
        <td>Forsworn Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Pelt: Goat 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Hagraven Feathers 4 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Hagraven Feathers 4 Pelt: Goat 4 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Pelt: Goat 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Headdress</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Hagraven Feathers 1 Doe Antlers 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Headdress</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Hagraven Feathers 1 Pelt: Goat 1 Doe Antlers</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Light Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Doe Antlers 2 Wood 5 Leather Strips 1 Hawk Feathers</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>6 Sabre Cat Tooth 2 Wood 4 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Forsworn War Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Sabre Cat Tooth 3 Wood 5 Leather Strips 1 Quarried Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Fox Apple Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Green Apple 1 Raw Fox Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fox Herb Cutlet</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Frost Mirriam 1 Raw Fox Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Fox in a Hole</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Carrot 1 Potato 1 Raw Fox Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fox Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Fox Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Backpack - Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>4 Leather Strips 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Backpack - Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>4 Leather Strips 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Backpack - White</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>4 Leather Strips 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Bedroll</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>2 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Boots</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>2 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Bracers</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>2 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Cuirass</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>4 Hide Lace 5 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>2 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Guard's Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Guard's Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Goat 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - Falkreath</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - Haafingar</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - Hjaalmarch</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - The Pale</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - The Reach</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - The Rift</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - Whiterun</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Cuirass - Winterhold</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Fur Guard's Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Guard's Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Goat 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Helmet</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>1 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Kilt</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>3 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Large Tent</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Large Tent (Two Bedrolls)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Large Tent</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>4 Wood 2 Leather 12 Fur Plate 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Large Tent (Four Bedrolls)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Large Tent (Three Bedrolls) 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Large Tent (Three Bedrolls)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Large Tent (Four Bedrolls)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Large Tent (Three Bedrolls)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Large Tent (Two Bedrolls) 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Large Tent (Two Bedrolls)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Large Tent (Three Bedrolls)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Large Tent (Two Bedrolls)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Large Tent 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Mantled Kilt</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>3 Hide Lace 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Wolf</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>2 Pelt: Wolf (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Werewolf</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Werewolf (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Sabre Cat</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Sabre Cat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Deer</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Deer (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Troll</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Troll (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snowy Sabre Cat</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snowy Sabre Cat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>3 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Bear</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Bear (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>2 Pelt: Skeever</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>3 Pelt: Skeever (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Sabre Cat</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Sabre Cat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Mammoth Section</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Mammoth Section (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Ice Wolf</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>2 Pelt: Ice Wolf (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Horse</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Horse (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Goat</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>3 Pelt: Goat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Frost Troll</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Frost Troll (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>3 Pelt: Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>2 Pelt: Fox (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Elk</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Elk (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Deer</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Deer (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cow</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cow (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cave Bear</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cave Bear (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Boar</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Boar (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Bear</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Plate</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Bear (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Shoes</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>2 Hide Lace 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Sleeveless Cuirass</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Smiths</td>
        <td>None</td>
        <td>4 Hide Lace 4 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Small Tent</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Small Tent (Two Bedrolls)</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Small Tent</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>2 Wood 2 Leather 6 Fur Plate 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Fur Small Tent (Two Bedrolls)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Fur Small Tent 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Furred Robes - Dark</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Fur Plate 2 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Furred Robes - Pale</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Fur Plate 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Garlic Boar</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Garlic 1 Raw Boar Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Garlic Bread</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Garlic 1 Bread Loaf 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Garnet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Garnet (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gem: Amber</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Amber (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gem: Onyx</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Onyx (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gem: Opal</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Opal (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Alembic</td>
        <td>Craftsmanship</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 5 Building Glass</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Battleaxe</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Battlestaff</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Moonstone 2 Ingot: Malachite 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Boots</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Boots - Thalmor</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 3 Ingot: Malachite 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Boots - Vvardenfell</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Bottle (Empty)</td>
        <td>Craftsmanship</td>
        <td>Alchemists,Survivalists,Builders ,Brewers,Smiths</td>
        <td>Forge</td>
        <td>5 Building Glass</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Bottle (Water)</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Glass Bottle (Salt Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Cuirass</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Cuirass - Thalmor</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Corundum 5 Ingot: Malachite 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Cuirass - Vvardenfell</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Malachite 4 Leather Strips 2 Leather 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Dagger</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Gauntlets</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Gauntlets - Thalmor</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 2 Ingot: Malachite 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Gauntlets - Vvardenfell</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Malachite 2 Leather Strips 1 Leather 1 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Greatsword</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Helmet</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Helmet - Thalmor</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 3 Ingot: Malachite 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Helmet - Vvardenfell</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 1 Leather Strips 1 Leather 1 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Hunting Knife</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Light Bow</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 2 Hide Lace 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Light Crossbow</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 2 Hide Lace 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Mace</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Shield</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Shield - Thalmor</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 4 Ingot: Malachite 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Shield - Vvardenfell</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Malachite 2 Leather Strips 1 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Sword</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Malachite 1 Leather Strips 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass War Axe</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Malachite 2 Leather Strips 1 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glass Warhammer</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Malachite 3 Leather Strips 2 Ingot: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Glazed Goat Loin</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Snowberries 1 Honey 1 Raw Goat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Goat and Potato Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Potato 1 Raw Goat Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Goat Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Goat Leg</td>
        <td></td>
    </tr>
    <tr>
        <td>Goat Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Goat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amber Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amber 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amber Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Necklace 1 Gem: Amber</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amber Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Amber</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amethyst Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amethyst Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amethyst Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Amethyst 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amethyst Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Amethyst (Flawless) 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amethyst Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Amethyst</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Amethyst Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Amethyst (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Aquamarine Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Aquamarine Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Aquamarine Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Necklace 1 Gem: Aquamarine</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Aquamarine Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Necklace 1 Gem: Aquamarine (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Aquamarine Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Aquamarine</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Aquamarine Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Aquamarine (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Diamond Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Diamond Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Diamond Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Diamond 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Diamond Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Diamond (Flawless) 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Diamond Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Diamond</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Diamond Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Diamond (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Emerald Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Emerald Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Emerald Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Emerald 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Emerald Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Emerald (Flawless) 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Emerald Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Emerald</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Emerald Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Emerald (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Garnet Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Garnet Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Garnet Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Garnet 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Garnet Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Garnet (Flawless) 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Garnet Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Garnet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Garnet Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Garnet (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>4 Fragment: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Necklace (5)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Onyx Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Onyx 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Onyx Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Necklace 1 Gem: Onyx</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Onyx Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Onyx</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Opal Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Opal 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Opal Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Necklace 1 Gem: Opal</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Opal Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Opal</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Peridot Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Peridot Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Peridot Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Necklace 1 Gem: Peridot</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Peridot Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Necklace 1 Gem: Peridot (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Peridot Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Peridot</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Peridot Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Peridot (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>2 Fragment: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ring (10)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ruby Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ruby Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ruby Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Ruby 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ruby Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Ruby (Flawless) 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ruby Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Ruby</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Ruby Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Ruby (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Sapphire Circlet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Sapphire Circlet (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire (Flawless) 1 Gold Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Sapphire Necklace</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Sapphire 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Sapphire Necklace (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Sapphire (Flawless) 1 Gold Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Sapphire Ring</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Sapphire</td>
        <td></td>
    </tr>
    <tr>
        <td>Gold Sapphire Ring (Flawless)</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gold Ring 1 Gem: Sapphire (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Greybeard's Hood</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Cotton Thread 3 Cotton Cloth - Grey</td>
        <td>Main Quest - The Way of the Voice Complete</td>
    </tr>
    <tr>
        <td>Greybeard's Robes</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>4 Cotton Thread 5 Cotton Cloth - Grey</td>
        <td>Main Quest - The Way of the Voice Complete</td>
    </tr>
    <tr>
        <td>Greybeard's Shoes</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Leather 2 Cotton Thread 3 Cotton Cloth - Grey</td>
        <td>Main Quest - The Way of the Voice Complete</td>
    </tr>
    <tr>
        <td>Harkon's Sword Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 1 Ingot: Quicksilver 2 Leather Strips</td>
        <td>DawnGuard - Killed Harkon</td>
    </tr>
    <tr>
        <td>Healing Poultice</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>5 Medicinal Salve 1 Bandage</td>
        <td></td>
    </tr>
    <tr>
        <td>Helm of Yngol Replica</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic Helmet 3 Ingot: Steel 1 Leather</td>
        <td>Sidequest - Escape Yngols Barrow Complete,Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Hide Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Elk 2 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 4 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 4 Leather Strips 3 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Elk 1 Ingot: Iron 4 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Furred Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Lace</td>
        <td>Craftsmanship</td>
        <td>Smiths,Tailors,Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Lace</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Fox (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Lace</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Ruined</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 2 Leather Strips 4 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Hide Skaal Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Fur Plate</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Hide Skaal Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Hide Skaal Coat</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>5 Leather Strips 6 Fur Plate</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Hide Skaal Coat</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Pelt: Elk 5 Leather Strips 4 Pelt: Snow Fox</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Hide Skaal Gloves</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Fur Plate</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Hide Skaal Gloves</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Elk 2 Leather Strips 1 Pelt: Snow Fox</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Hide Skaal Hat</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Strips 2 Fur Plate</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Hide Skaal Hat</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Elk 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>High King's Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Carrot 1 Leek 1 Raw Dragon Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Honeyed Mammoth Roast</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Honey 1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Honningbrew Mead</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>2 Green Apple 1 Honey</td>
        <td></td>
    </tr>
    <tr>
        <td>Horker and Ash Yam Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Garlic 1 Raw Horker Meat 3 Ash Yam 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Horker Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Horker Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Horker Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Garlic 1 Lavender 1 Tomato 1 Raw Horker Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Big Game Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Troll Skull 1 Mammoth Tusk 1 Ingot: Iron 6 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Big Game Saddle - Adorned</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Rueful Axe 1 Horse Armor: Big Game Saddle</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Black Hand Barding and Saddle</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Black Hand Barding and Saddle - Adorned</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ancient Nordic War Axe 1 Wooden Lute 1 Horse Armor: Black Hand Barding and Saddle</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Cleric Barding and Saddle</td>
        <td>Elven Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 8 Ingot: Moonstone 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Daedric Barding and Saddle</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Daedra Heart 1 Ingot: Steel 10 Ingot: Ebony 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Dawnguard Barding and Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Horse Armor: Dawnguard Barding and Saddle - Adorned</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Steel Heavy Crossbow 8 Bolt: Steel 1 Dawnguard War Axe 1 Dawnguard Heavy Shield 1 Horse Armor: Dawnguard Barding and Saddle</td>
        <td>DawnGuard - Prophet (Hunter) Complete</td>
    </tr>
    <tr>
        <td>Horse Armor: Divine Aegis Barding and Saddle</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Briar Heart 2 Ingot: Gold 8 Ingot: Malachite 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Dragonbone Barding and Saddle</td>
        <td>Draconic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Dragon Scales 8 Dragon Bone 1 Ingot: Steel 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Dwarven Barding and Saddle</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 10 Leather Strips 6 Leather 8 Ingot: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Ebony Barding and Saddle</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Ebony Barding and Saddle - Mail</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 8 Ingot: Ebony 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Elven Barding and Saddle - Amber</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Elven Barding and Saddle - Dusk</td>
        <td>Elven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 8 Ingot: Moonstone 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Frost Aegis Barding and Saddle</td>
        <td>Glass Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Frost Salts 2 Ingot: Quicksilver 8 Ingot: Malachite 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Fur Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Hunter's Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Wolf 1 Ingot: Iron 6 Leather Strips 1 Pelt: Fox 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Hunter's Saddle - Adorned</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>8 Arrow: Steel 1 Horse Armor: Hunter's Saddle</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Imperial Barding and Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 2 Ingot: Steel 10 Leather Strips 7 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Imperial Barding and Saddle - Adorned</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Iron Sword 1 Imperial Heavy Shield 1 Imperial Heavy Bow 8 Arrow: Iron 1 Horse Armor: Imperial Barding and Saddle</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Imperial Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 6 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Knight's Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 2 Wood 6 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Knight's Saddle - Adorned</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Steel Helmet 1 Steel Shield 1 Steel Greatsword 1 Steel Sword 1 Horse Armor: Knight's Saddle</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Leather Barding and Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 10 Leather Strips 10 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Leather Barding and Saddle - Mail</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 10 Leather Strips 10 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Minstrel's Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 6 Leather Strips 1 Wooden Lute 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Minstrel's Saddle - Adorned</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>8 Arrow: Steel 1 Horse Armor: Minstrel's Saddle</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Nordic Barding and Saddle</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>8 Ingot: Steel 2 Ingot: Corundum 10 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Ornate Barding and Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>6 Linen Wrap 2 Ingot: Iron 10 Leather Strips 10 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Shadowmere's Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 6 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Stormcloak Barding and Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 2 Ingot: Iron 10 Leather Strips 7 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Stormcloak Barding and Saddle - Adorned</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Iron Sword 8 Arrow: Iron 1 Wooden Light Bow 1 Horse Armor: Stormcloak Barding and Saddle</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Armor: Traveler's Saddle</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Linen Wrap 1 Corundum Flagon 1 Ingot: Iron 6 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Horse Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Horse Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Hot Honey Horker</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Raw Horker Meat 1 Honey</td>
        <td></td>
    </tr>
    <tr>
        <td>Hunter's Hearty Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Cabbage 1 Potato 1 Raw Venison 1 Raw Elk Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Crested Heavy Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial General Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 5 Leather Strips 6 Leather</td>
        <td>Civil War - Joined Imperials,Civil War - Conquered a hold</td>
    </tr>
    <tr>
        <td>Imperial Heavy Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 3 Leather Strips 1 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Heavy Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 3 Wood 3 Hide Lace</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Heavy Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Heavy Crossbow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Heavy Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 4 Leather Strips 6 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Heavy Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Heavy Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 2 Wood 2 Leather Strips</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Light Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Light Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Light Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>5 Leather Strips 6 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Light Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Strips 2 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Light Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Wood 2 Leather Strips</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Officer Heavy Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td>Civil War - Joined Imperials,Civil War - Conquered a hold</td>
    </tr>
    <tr>
        <td>Imperial Outcast Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Outcast Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Outcast Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Outcast Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Elk 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Outcast Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Outcast Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 5 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Outcast Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 1 Ingot: Iron 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Imperial Studded Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 5 Leather Strips 6 Leather</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Imperial Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Leather Strips</td>
        <td>Civil War - Joined Imperials</td>
    </tr>
    <tr>
        <td>Ingot: Calcinium</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Calcinium</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Calcinium</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Calcinium</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Calcinium</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>6 Fragment: Corundum 14 Fragment: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Calcinium</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>2 Ingot: Corundum 4 Ingot: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Calcinium</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Ingot: Corundum 2 Ingot: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>60 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Corundum</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Dwarven</td>
        <td>Dwarven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Dwarven</td>
        <td>Dwarven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Dwarven</td>
        <td>Dwarven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Any Dwarven scrap metal</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Dwarven</td>
        <td>Dwarven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Dwarven</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Ebony</td>
        <td>Ebony Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Ebony</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Galatite</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Galatite</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Galatite</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Galatite</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>14 Fragment: Steel 6 Fragment: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Galatite</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>4 Ingot: Steel 2 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Galatite</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>2 Ingot: Steel 1 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Gold</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Gold</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>60 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Iron</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Malachite</td>
        <td>Glass Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Malachite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Moonstone</td>
        <td>Elven Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Moonstone</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Orichalcum</td>
        <td>Orcish Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Quicksilver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>5 Ore: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ore: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ore: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>3 Ore: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>30 Ore: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Silver</td>
        <td>Advanced Blacksmithing</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>15 Ore: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Steel</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>100 Fragment: Steel</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Steel</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>200 Fragment: Steel</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Steel</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>20 Fragment: Steel</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Steel</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Ingot: Iron 1 Charcoal</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Steel</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>50 Ingot: Iron 50 Charcoal</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Steel</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>25 Ingot: Iron 25 Charcoal</td>
        <td></td>
    </tr>
    <tr>
        <td>Ingot: Steel</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>10 Ingot: Iron 10 Charcoal</td>
        <td></td>
    </tr>
    <tr>
        <td>Irkngthand War Axe</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Ebony 3 Leather Strips 1 Ingot: Dwarven</td>
        <td>Fishing - Unlocked Dwarven Axe</td>
    </tr>
    <tr>
        <td>Iron Banded Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Cuirass - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Cuirass - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 4 Leather Strips 2 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Cuirass - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Pelt: Goat 5 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Masterwork Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Masterwork Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Masterwork Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Quality Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Quality Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Quality Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 5 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Quality Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Banded Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Battleaxe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 2 Wood 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Battlestaff</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Boots - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Boots - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Boots - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Goat 3 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Boots (Engraved)</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Iron Boots</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cauldron</td>
        <td>Craftsmanship</td>
        <td>Smiths,Alchemists</td>
        <td>Forge</td>
        <td>8 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cooking Pot</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cuirass - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cuirass - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 4 Leather Strips 2 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Cuirass - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Goat 4 Ingot: Iron 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Dagger</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Fittings</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>1 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Fittings</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>10 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Fittings</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>5 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Furred Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 2 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Gauntlets - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Gauntlets - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 2 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Gauntlets - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Goat 2 Ingot: Iron 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Greatsword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - Eastmarch</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Civil War - Joined Stormcloaks</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - Falkreath</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Ingot: Corundum 5 Leather Strips 3 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - Haafingar</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - Hjaalmarch</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 5 Leather Strips 6 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - The Pale</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - The Reach</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 3 Leather 3 Ingot: Dwarven</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - The Rift</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 6 Leather Strips 6 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - Whiterun</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 3 Ingot: Steel 5 Leather Strips 3 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Guard's Cuirass - Winterhold</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 5 Leather Strips 6 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Hammer</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Heavy Crossbow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 3 Wood 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Heavy Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 2 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Heavy Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Iron Dented Shield</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Helmet - Engraved</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Helmet - Ram</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Helmet - Ram</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Hinge</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>1 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Hinge</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>10 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Hinge</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>5 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Hunting Knife</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Lantern</td>
        <td>Craftsmanship</td>
        <td>Smiths,Thieves,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - Falkreath</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - Haafingar</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - Hjaalmarch</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - The Pale</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - The Reach</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - The Rift</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - Whiterun</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Helmet - Winterhold</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - Eastmarch</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - Falkreath</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - Haafingar</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - Hjaalmarch</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - The Pale</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - The Reach</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - The Rift</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - Whiterun</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Light Guard's Shield - Winterhold</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Wood 2 Leather Strips</td>
        <td>Thane of Hold</td>
    </tr>
    <tr>
        <td>Iron Lock</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Lock</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>10 Ingot: Iron 10 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Lock</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 5 Ingot: Corundum</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Mace</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Helmet</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Masterwork Shield</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Nails</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>1 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Nails</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>10 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Nails</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>5 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Pickaxe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Pickaxe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 3 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 4 Ingot: Iron 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cow 2 Ingot: Iron 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Ingot: Corundum 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Quality Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Iron 1 Ingot: Corundum 2 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Reinforced Armor (Engraved)</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Iron Banded Cuirass</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Robed Cuirass - Dark</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Robed Cuirass - Pale</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 4 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Tongs</td>
        <td>Craftsmanship</td>
        <td>Smiths,Builders</td>
        <td>Forge</td>
        <td>1 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron War Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 1 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Warhammer</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Iron 2 Wood 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Woodcutter's Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Woodcutter's Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Iron Woodcutter's Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 2 Deadwood</td>
        <td></td>
    </tr>
    <tr>
        <td>Jagged Crown Replica</td>
        <td>Draconic Blacksmithing,Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Dragon Scales 2 Dragon Bone 1 Ingot: Ebony 1 Leather Strips 1 Leather</td>
        <td>Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete,Civil War - The Jagged Crown (Imperial Or Stormcloak) Complete</td>
    </tr>
    <tr>
        <td>Jarl of Eastmarch Armguards</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 2 Leather: Dark</td>
        <td></td>
    </tr>
    <tr>
        <td>Jarl of Eastmarch Armor</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 4 Leather Strips 2 Leather: Dark 4 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Jarl of Eastmarch Armor</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather: Dark</td>
        <td></td>
    </tr>
    <tr>
        <td>Jazbay Crostata</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>10 Jazbay Grapes 1 Honey 1 Flour 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Juniper Berry Crostata</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>10 Juniper Berries 1 Honey 1 Flour 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Juniper Berry Mead</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>2 Juniper Berries 1 Honey</td>
        <td></td>
    </tr>
    <tr>
        <td>Juniper Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>3 Juniper Berries 1 Honeycomb 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Keening Replica</td>
        <td>Dwarven Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Dwarven Gyro 1 Ingot: Dwarven</td>
        <td>College - Arniels Endeavor Complete</td>
    </tr>
    <tr>
        <td>Kindling</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Branches</td>
        <td></td>
    </tr>
    <tr>
        <td>Kindling</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Kindling</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Deadwood</td>
        <td></td>
    </tr>
    <tr>
        <td>Kindling</td>
        <td></td>
        <td>None Required</td>
        <td>Smelter</td>
        <td>1 Iron Woodcutter's Axe</td>
        <td></td>
    </tr>
    <tr>
        <td>Knucklebones (Strange Brew)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>3 Fragment: Bone</td>
        <td>Brewing Skill Greater or Equal to 3,Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Lavender Honey Dumpling</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>6 Lavender 1 Moon Sugar 1 Honey 1 Flour</td>
        <td></td>
    </tr>
    <tr>
        <td>Lavender Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Lavender 3 Purple Mountain Flower 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Wolf</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Werewolf</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Sabre Cat</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Sabre Cat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Deer</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Troll</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Troll (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snowy Sabre Cat</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Bear</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Bear (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>2 Pelt: Skeever</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Sabre Cat</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Sabre Cat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Mammoth Section</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Ice Wolf</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Horse</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Goat</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Frost Troll</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Frost Troll (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Elk</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Deer</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cow</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cave Bear</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cave Bear (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Boar</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Bear</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Bear (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Ornate Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Ornate Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Ornate White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Trimmed Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Trimmed Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - Trimmed White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bearskin Hood - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Bearskin Hood - White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 4 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Clothes - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Leather 2 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Clothes - Black and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather 2 Linen Cloth - Black 1 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 5 Leather Strips 6 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Doublet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather 2 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Doublet - Dark</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather 3 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Executioner's Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Executioner's Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Pelt: Ice Wolf 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Executioner's Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 5 Leather Strips 6 Leather: Dark 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Executioner's Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Ice Wolf 1 Ingot: Steel 5 Leather Strips 6 Leather: Dark</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Executioner's Gloves</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Leather Strips 2 Leather: Dark 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Executioner's Gloves</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Ice Wolf 1 Ingot: Steel 2 Leather Strips 2 Leather: Dark</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Executioner's Hood</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Dark</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Hood</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Dark</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Large Tent</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Leather Large Tent (Two Bedrolls)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Large Tent</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>2 Wood 12 Leather 4 Fur Plate 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Large Tent (Three Bedrolls)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Leather Large Tent (Two Bedrolls) 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Large Tent (Two Bedrolls)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Leather Large Tent (Three Bedrolls)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Large Tent (Two Bedrolls)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Leather Large Tent 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Quilted Clothes - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 4 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Small Tent</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Leather Small Tent (Two Bedrolls)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Small Tent</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>2 Wood 6 Leather 2 Fur Plate 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Small Tent (Two Bedrolls)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Leather Small Tent 1 Fur Bedroll</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>Smiths,Tailors,Survivalists,Jewelers</td>
        <td>None</td>
        <td>1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Wolf (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Werewolf (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Deer (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snowy Sabre Cat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Fox (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Skeever (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Ruined</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Mammoth Section (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Ice Wolf (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Horse (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Goat (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Fox (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Elk (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Deer (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cow (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Strips</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Boar (Poor)</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Tiled Clothes - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 4 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Tiled Clothes - Brown and Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Dark Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Dark Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Dark Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Dark Trimmed White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Light Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Light Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Light Trimmed Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Light Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Light Trimmed White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Noble Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Noble Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Noble Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Noble Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Noble White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Noble White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Ornate Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Ornate Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - Ornate White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather Wolfskin Hood - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather Helmet 1 Wolfskin Hood - White</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Dark</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>5 Ore: Iron 5 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Dark</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Ore: Iron 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Dark</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Ore: Iron 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Dark</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>5 Ore: Iron 5 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Red</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>10 Creep Cluster 5 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Red</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Creep Cluster 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Red</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>2 Creep Cluster 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Leather: Red</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>10 Creep Cluster 5 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Alik'r Boots - Dark</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather 3 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Alik'r Boots - Tan</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather 3 Linen Cloth - Tan 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Alik'r Garb - Red</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Linen Cloth - Red 2 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Alik'r Garb - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Leather 1 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Alik'r Hood - Blue</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Linen Cloth - Blue 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Alik'r Hood - Red</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Linen Cloth - Red 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Arm Bandages</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Barkeep's Clothes - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Barkeep's Clothes - White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Linen Cloth - Brown 4 Linen Thread 4 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Blacksmith's Apron - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 3 Linen Cloth - Red 2 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Blacksmith's Apron - White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 2 Linen Cloth - Grey 4 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Blacksmith's Shoes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cap</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Chef's Hat</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Chef's Tunic</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Leather Strips 4 Linen Thread 5 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Linen Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Spinning Wheel</td>
        <td>3 Northern Flax</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Black 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Blue 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Brown 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Green 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Grey 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Indigo</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Indigo 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Orange 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Purple</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Purple 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Red 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Tan 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cloth - Yellow</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Dye - Yellow 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Black and Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Black, Grey, and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Brown and Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Brown and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Brown, Grey, and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 2 Linen Cloth - Grey 1 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Brown, White, and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Collared Brown and Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Collared Orange and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Orange, Grey, and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Grey 1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Orange, White, and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Linen Cloth - Brown 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Clothes - Orange, White, and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Linen Cloth - Tan 2 Linen Cloth - Orange 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Blue 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Green 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Green 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Grey 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Orange 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Purple</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Purple 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Red 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cowl - Yellow</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Yellow 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Cuffed Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 3 Linen Cloth - Tan 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Doublet - Brown and Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Doublet - Brown and Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Doublet - Brown and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Doublet - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Doublet - Tan and Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Grey 3 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Doublet - Tan, Grey, and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Dunmer Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Netch Leather 2 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Dunmer Hood - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Indigo 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Dunmer Hood - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Dunmer Hood - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Red 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Dunmer Tunic - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Netch Leather 3 Linen Cloth - Blue 1 Linen Cloth - Grey 1 Linen Cloth - Indigo 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Dunmer Tunic - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Netch Leather 3 Linen Cloth - Brown 1 Linen Cloth - Green 1 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Dunmer Tunic - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Netch Leather 3 Linen Cloth - Red 1 Linen Cloth - Brown 1 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Farm Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Footwraps</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Wrap 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Gloves - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 2 Linen Thread</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Linen Gloves - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Blue 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Gloves - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Gloves - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Green 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Gloves - Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Grey 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Gloves - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Red 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Head Bandages</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Headscarf</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 1 Linen Thread</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Linen Hood - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Green 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Robes - Black and Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Robes - Black and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Robes - Brown and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Robes - Brown and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Robes - Green and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Green 2 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Robes - Tan and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Tunic - Blue and Quilted Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Blue 2 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Tunic - Grey and Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 3 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Tunic - Grey and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Tunic - White and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Tunic - White and Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Orange 4 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Tunic - White and Quilted Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mage Tunic - White, Green, and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Linen Cloth - Brown 2 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather 3 Linen Cloth - Green 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Clothes - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Clothes - Grey and Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Grey 2 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Clothes - Orange and Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Clothes - Orange and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Clothes - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 2 Linen Cloth - Green 3 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Clothes - White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 2 Linen Cloth - Brown 4 Linen Thread 3 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Miner's Clothes - Yellow and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 3 Linen Cloth - Yellow 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Monk Boots - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Monk Boots - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 3 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Moth Priest Blindfold</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Linen Cloth - Grey 1 Linen Thread</td>
        <td>DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Linen Moth Priest Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Grey 4 Linen Thread</td>
        <td>DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Linen Moth Priest Sandals</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 1 Linen Cloth - Brown 1 Linen Thread</td>
        <td>DawnGuard - Prophet (Hunter) Complete,DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Linen Mourner's Clothes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 5 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Mourner's Headscarf</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Grey and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Grey and Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Grey and Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Mantled Grey and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 3 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Mantled Grey and Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Grey 2 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Mantled Grey and Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Red 3 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Mantled Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Mantled Orange and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Plain Robes - Orange and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 3 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Prisoner's Rags</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Wrap 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Ragged Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Wrap 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Ragged Cap</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Wrap 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Ragged Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Wrap 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Robes - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Robes - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Robes - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Green 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Robes - Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Robes - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Robes - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Linen Cloth - Red 4 Linen Thread 4 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Roughspun Tunic</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Wrap 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Shoes - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Skirt - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Skirt - Green and Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 3 Linen Cloth - Green 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Skirt - Indigo and Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 3 Linen Cloth - Indigo 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Skirt - Orange and Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 3 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Skirt - Quilted Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Linen Cloth - Brown 4 Linen Thread 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Stitched Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 3 Linen Cloth - Brown 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Surcoat - Black and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Surcoat - Black and Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tavern Clothes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Linen Cloth - Brown 3 Linen Cloth - Green 1 Linen Cloth - Yellow 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Thread</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Spinning Wheel</td>
        <td>3 Northern Flax</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Black and Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Black and Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Cloth - Orange 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Black, Brown, and Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Green 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Black, Brown, and Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 2 Linen Cloth - Brown 1 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Black, Tan, and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Black 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Brown and Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 2 Linen Cloth - Grey 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Brown and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Brown, Tan, and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Brown 2 Linen Cloth - Tan 4 Linen Thread 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Purple, Orange, and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Orange 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Traveler Robes - Purple, Tan, and White</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Linen Cloth - Tan 2 Linen Cloth - Purple 4 Linen Thread 1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tunic - Belted Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>5 Linen Cloth - Black 4 Linen Thread</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Linen Tunic - Belted Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 3 Linen Cloth - Green 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tunic - Belted Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 3 Linen Cloth - Brown 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tunic - Belted Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 3 Linen Cloth - Tan 4 Linen Thread 2 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tunic - Blue and Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 2 Linen Cloth - Blue 2 Linen Cloth - Brown 1 Linen Cloth - Tan 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tunic - Embroidered Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 1 Linen Cloth - Brown 2 Linen Cloth - Purple 2 Linen Cloth - Yellow 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tunic - Indigo and Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 3 Linen Cloth - Black 2 Linen Cloth - Green 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Tunic - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Cloth - Yellow 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Linen Work Boots - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Linen Cloth - Black 2 Linen Thread</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Linen Work Boots - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Linen Cloth - Brown 1 Linen Cloth - Green 2 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Lockpick</td>
        <td>Cheap Tricks,Craftsmanship</td>
        <td>Smiths,Thieves,Survivalists</td>
        <td>Forge</td>
        <td>4 Fragment: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Lockpick</td>
        <td>Cheap Tricks,Craftsmanship</td>
        <td>Smiths,Thieves,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Iron</td>
        <td></td>
    </tr>
    <tr>
        <td>Mace of Molag Bal Replica</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Daedra Heart 3 Ingot: Ebony 2 Leather Strips</td>
        <td>Daedra - The House of Horrors</td>
    </tr>
    <tr>
        <td>Mail and Hide</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Mail and Jacket</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Mail and Leather Surcoat</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather 4 Hide Lace 1 Linen Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Mail and Leathers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Mail and Pauldroned Leather</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Mail and Surcoat</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Mail and Tunic</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 3 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Mammoth Balls</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Garlic 1 Tomato 1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Mammoth Bone Club</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Leather Strips 1 Animal Bone (Enormous)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Mammoth Bone Masterwork Club</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Troll Fat 3 Hide Lace 1 Animal Bone (Enormous)</td>
        <td>Animal Harvesting Skill Greater or Equal to 4</td>
    </tr>
    <tr>
        <td>Mammoth Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Mammoth Snout</td>
        <td></td>
    </tr>
    <tr>
        <td>Mammoth Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Mammoth Tomato Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Tomato 1 Raw Mammoth Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Marinated Mammoth in Elsweyr Sauce</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Honningbrew Mead 1 Moon Sugar 1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Mashed Troll</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Garlic 1 Potato 1 Raw Troll Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Masque of Clavicus Vile Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Ebony 1 Ingot: Quicksilver 1 Leather Strips 1 Leather</td>
        <td>Daedra - A Daedras Best Friend</td>
    </tr>
    <tr>
        <td>Mead Braised Bear</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Nord Mead 1 Raw Bear Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Meat Pie</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Salt 1 Raw Beef 1 Bottled Milk 1 Flour 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Panacea</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cured Skeever Hide</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Wheat</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Swamp Fungal Pod</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Sabre Cat Eye</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Blisterwort</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Imp Stool</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Blue Mountain Flower</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Monarch Wing</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Blue Dartwing</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Daedra Heart</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Charred Skeever Hide</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Rock Warbler Egg</td>
        <td></td>
    </tr>
    <tr>
        <td>Medicinal Salve</td>
        <td>Craftsmanship,Alchemical Lore 1</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Northern Flax</td>
        <td></td>
    </tr>
    <tr>
        <td>Mehrunes' Razor Replica</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Daedra Heart 1 Ingot: Steel 1 Ingot: Ebony 1 Leather Strips</td>
        <td>Daedra - Pieces of the Past</td>
    </tr>
    <tr>
        <td>Mild Acid</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>2 Spider Venom (Crude)</td>
        <td></td>
    </tr>
    <tr>
        <td>Mild Acid</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>5 Spider Egg</td>
        <td></td>
    </tr>
    <tr>
        <td>Mild Acid</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Chaurus Venom (Crude)</td>
        <td></td>
    </tr>
    <tr>
        <td>Minced Marinated Bear</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 2 Juniper Berries 1 Raw Bear Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Miraak's Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather 2 Silk Thread 2 Silk Cloth - Brown</td>
        <td>Killed Miraak</td>
    </tr>
    <tr>
        <td>Miraak's Gloves</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Silk Thread 2 Silk Cloth - Brown</td>
        <td>Killed Miraak</td>
    </tr>
    <tr>
        <td>Miraak's Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Brown</td>
        <td>Killed Miraak</td>
    </tr>
    <tr>
        <td>Miraak's Sword Replica</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Daedra Heart 2 Ingot: Ebony 1 Netch Leather</td>
        <td>Killed Miraak</td>
    </tr>
    <tr>
        <td>Moon Dance Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Luna Moth Wing 1 Moon Sugar 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Mortar and Pestle</td>
        <td></td>
        <td>Survivalists,Alchemists</td>
        <td>None</td>
        <td>1 Animal Bone (Small) 1 Animal Bone (Large)</td>
        <td>Animal Harvesting Skill Greater than 0</td>
    </tr>
    <tr>
        <td>Morthal Mudders</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 1 Swamp Fungal Pod 1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Mountain Flower Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Blue Mountain Flower 1 Red Mountain Flower 1 Purple Mountain Flower 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Mudcrab Chowder</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Potato 1 Bottled Milk 1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Mudcrab Egg Scramble</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Chicken's Egg 1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Mudcrab Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Mudcrab Legs</td>
        <td></td>
    </tr>
    <tr>
        <td>Mudcrab Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Mullwine Braised Mammoth</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Mulled Wine 1 Raw Mammoth Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Nightingale Armor</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Void Salts 6 Leather Strips 5 Leather: Dark</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Nightingale Blade</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 2 Ingot: Ebony 1 Leather Strips</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Nightingale Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Void Salts 2 Leather Strips 3 Leather: Dark</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Nightingale Bow</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Void Salts 3 Ingot: Ebony 2 Leather Strips</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Nightingale Gloves</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Void Salts 2 Leather Strips 3 Leather: Dark</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Nightingale Hood</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Void Salts 2 Leather Strips 3 Leather: Dark</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Nirn Spring Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Nirnroot 1 Sleeping Tree Sap 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Noble Armguards</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 3 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Noble Gilded Wristguards</td>
        <td>Advanced Blacksmithing</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Gold Ring 3 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Nord Mead</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>1 Honey</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Battleaxe</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 3 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - Black</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Boots - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - Black</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite 4 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Cuirass - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 2 Ingot: Orichalcum 4 Leather Strips 2 Leather 5 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Dagger</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 1 Leather Strips 1 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - Black</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Gauntlets - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Greatsword</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Heavy Bow</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Heavy Crossbow</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Helmet - Black</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 1 Leather Strips 1 Leather 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Mace</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 3 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - Black</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - Black</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - Brown</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Shield - White</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 1 Ingot: Orichalcum 2 Leather Strips 1 Leather 4 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Sword</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 1 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic War Axe</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum 2 Leather Strips 2 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Nordic Warhammer</td>
        <td>Nordic Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Orichalcum 3 Leather Strips 4 Ingot: Galatite</td>
        <td></td>
    </tr>
    <tr>
        <td>Ocean's Kiss</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Garlic 1 Raw Clam Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Oiled Mail and Hide</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 2 Leather 4 Hide Lace 1 Flammable Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Oiled Mail and Jacket</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Oiled Mail and Tunic</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Flammable Oil 3 Linen Cloth - Black 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Battleaxe</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 3 Ingot: Orichalcum 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Boots</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 3 Ingot: Orichalcum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Cuirass</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Corundum 5 Ingot: Orichalcum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Dagger</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Gauntlets</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 2 Ingot: Orichalcum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Greatsword</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Heavy Bow</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Heavy Crossbow</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 3 Ingot: Orichalcum 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Helmet</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 3 Ingot: Orichalcum 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Hunting Knife</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Ingot: Orichalcum 1 Leather Strips 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Mace</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 3 Ingot: Orichalcum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Shield</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Corundum 4 Ingot: Orichalcum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Sword</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Ingot: Orichalcum 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish War Axe</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Ingot: Orichalcum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orcish Warhammer</td>
        <td>Orcish Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Ingot: Orichalcum 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Amber Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amber 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Amethyst Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Amethyst Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Aquamarine Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Aquamarine Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Orichalcum</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Diamond Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Diamond Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Emerald Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Emerald Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Garnet Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Garnet Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Onyx Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Onyx 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Opal Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Opal 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Peridot Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Peridot Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Ruby Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Ruby Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Sapphire Circlet</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Orichalc Sapphire Circlet (Flawless)</td>
        <td>Orcish Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire (Flawless) 1 Orichalc Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Bear (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Bear (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Boar</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Boar (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Boar (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Boar (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Cave Bear</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cave Bear (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Cave Bear (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cave Bear (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Cow</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cow (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Cow (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Cow (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Deer</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Deer (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Deer (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Deer (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Elk</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Elk (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Elk (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Elk (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Fox</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Fox (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Fox (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Fox (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Frost Troll</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Frost Troll (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Frost Troll (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Frost Troll (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Goat</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Goat (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Goat (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Goat (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Horse</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Horse (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Horse (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Horse (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Ice Wolf</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Ice Wolf (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Ice Wolf (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Ice Wolf (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Mammoth Section</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Mammoth Section (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Mammoth Section (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Mammoth Section (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Sabre Cat</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Sabre Cat (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Sabre Cat (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Sabre Cat (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Skeever</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Skeever (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Skeever (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Skeever (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Snow Bear</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Bear (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Snow Bear (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Bear (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Snow Fox</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Fox (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Snow Fox (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snow Fox (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Snowy Sabre Cat</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snowy Sabre Cat (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Snowy Sabre Cat (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Snowy Sabre Cat (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Troll</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Troll (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Troll (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Troll (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Vale Deer</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Deer (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Vale Deer (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Deer (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Vale Sabre Cat</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Sabre Cat (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Vale Sabre Cat (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Vale Sabre Cat (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Werewolf</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Werewolf (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Werewolf (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Werewolf (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Wolf</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Wolf (Fine)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pelt: Wolf (Fine)</td>
        <td></td>
        <td>None Required</td>
        <td>Tanning Rack</td>
        <td>1 Pelt: Wolf (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Peridot</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Peridot (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Pet Bait: Fox (Strange Brew)</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Raw Chicken Breast 1 Strange Brew</td>
        <td>Brewing Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Pet Bait: Rabbit (Strange Brew)</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Carrot 1 Strange Brew</td>
        <td>Brewing Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Pet Bait: Wolf (Strange Brew)</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Strange Brew 1 Raw Elk Meat</td>
        <td>Brewing Skill Greater or Equal to 0</td>
    </tr>
    <tr>
        <td>Pet Bait: Wolf (Strange Brew)</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Raw Venison 1 Strange Brew</td>
        <td>Brewing Skill Greater or Equal to 0</td>
    </tr>
    <tr>
        <td>Pheasant Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Pheasant Breast</td>
        <td></td>
    </tr>
    <tr>
        <td>Poison of Fear (Remarkable)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Dragon's Blood</td>
        <td></td>
    </tr>
    <tr>
        <td>Poisoner's Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Nightshade 1 Raw Chaurus Meat 1 Chaurus Venom (Crude)</td>
        <td></td>
    </tr>
    <tr>
        <td>Polished Bear Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Bear Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Polished Boar Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Boar Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Polished Dragon Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Dragon Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Polished Fox Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Fox Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Polished Hare Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Hare Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Polished Mammoth Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Mammoth Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 4</td>
    </tr>
    <tr>
        <td>Polished Sabre Cat Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Sabre Cat Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Polished Slaughterfish Scales</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Slaughterfish Scales</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Polished Troll Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Troll Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 4</td>
    </tr>
    <tr>
        <td>Polished Werewolf Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Werewolf Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Polished Wolf Eye</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Wolf Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Portable Enchanting Supplies</td>
        <td>Enchanter's Insight</td>
        <td>Survivalists,Alchemists</td>
        <td>None</td>
        <td>1 Troll Skull 4 Spriggan Sap 1 Gem: Amethyst (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Potato Bread</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Salt 1 Potato 1 Flour 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Potato Crab Chowder</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Potato 1 Bottled Milk 1 Butter 1 Raw Mudcrab Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Potato Soup</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Potato 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Potion of Arcane Metabolisis</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>2 Polished Fox Eye 1 Dragon's Blood</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Potion of Boneblood</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>10 Bone Meal 1 Blood of the Hunt (Strange Brew)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Potion of Hircine's Agony (Strange Brew)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Nord Mead 2 Wolf Claws 2 Buck Antlers (Superlative)</td>
        <td>Brewing Skill Greater or Equal to 0</td>
    </tr>
    <tr>
        <td>Potion of Hircine's Cloak (Strange Brew)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Wolf Heart 2 Polished Sabre Cat Eye</td>
        <td>Brewing Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Powdered Mammoth Tusk</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Mammoth Tusk</td>
        <td></td>
    </tr>
    <tr>
        <td>Powdered Mudcrab Chitin</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Large Mudcrab Chitin</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Predator's Price</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Garlic 1 Raw Venison 1 Raw Bear Meat 1 Raw Wolf Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Rabbit Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Rabbit Leg</td>
        <td></td>
    </tr>
    <tr>
        <td>Rabbit Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Rabbit Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Rabbit Mushroom Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Mora Tapinella 1 Raw Rabbit Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Rarebit Ragout</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Goat Cheese Slice 1 Bread Half-Loaf 1 Raw Rabbit Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Raw Salmon Steak</td>
        <td></td>
        <td>Chefs,Survivalists</td>
        <td>Cook pot</td>
        <td>1 Raw Salmon</td>
        <td></td>
    </tr>
    <tr>
        <td>Raw Salmon Steak</td>
        <td></td>
        <td>Chefs,Survivalists</td>
        <td>None</td>
        <td>1 Raw Salmon</td>
        <td></td>
    </tr>
    <tr>
        <td>Reachman Soup</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Sabre Cat Tooth 2 Edible Mushroom 2 Edible Root 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Red Glitterdust</td>
        <td>Advanced Blacksmithing</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>1 Gem: Ruby (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Red Glitterdust</td>
        <td>Advanced Blacksmithing</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>1 Gem: Ruby</td>
        <td></td>
    </tr>
    <tr>
        <td>Red Glitterdust</td>
        <td>Advanced Blacksmithing</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>2 Gem: Garnet (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Red Glitterdust</td>
        <td>Advanced Blacksmithing</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>3 Gem: Garnet</td>
        <td></td>
    </tr>
    <tr>
        <td>Ring of Bones</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Bone Meal 1 Ingot: Corundum</td>
        <td>Daedra - The Taste of Death</td>
    </tr>
    <tr>
        <td>Roasted Tomato Crab Bisque</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Tomato 1 Butter 1 Raw Mudcrab Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Robed Mail</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 3 Linen Cloth - Brown 4 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Root Bear (Strange Brew)</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Nirnroot 2 Bear Tooth 1 Raw Bear Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Ruby</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Ruby (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Rueful Axe Replica</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 4 Ingot: Steel 3 Leather Strips</td>
        <td>Daedra - A Daedras Best Friend</td>
    </tr>
    <tr>
        <td>Sabre Cat Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Sabre Cat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Sabre Cat Pot Roast</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Leek 1 Gourd 1 Raw Sabre Cat Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Salmon Bake</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Thistle Branch 2 Raw Salmon Steak 1 Honey</td>
        <td></td>
    </tr>
    <tr>
        <td>Salt</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Glass Bottle (Salt Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Salt</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Waterskin (Salt Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Salty Sabre Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Salt 1 Canis Root 1 Raw Sabre Cat Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Sapphire</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Sapphire (Rough)</td>
        <td></td>
    </tr>
    <tr>
        <td>Sapphire Glitterdust</td>
        <td>Advanced Blacksmithing</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>1 Gem: Sapphire (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Sapphire Glitterdust</td>
        <td>Advanced Blacksmithing</td>
        <td>Alchemists</td>
        <td>Forge</td>
        <td>1 Gem: Sapphire</td>
        <td></td>
    </tr>
    <tr>
        <td>Sausaged Skeever</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Garlic 1 Skeever Tail 1 Raw Skeever Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Sauteed Dog and Mushrooms</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Garlic 1 Fly Amanita 1 White Cap 1 Raw Dog Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Savior's Hide Replica</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate</td>
        <td>Daedra - Ill Met By Moonlight Complete</td>
    </tr>
    <tr>
        <td>Savior's Hide Replica</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td>Daedra - Ill Met By Moonlight Complete</td>
    </tr>
    <tr>
        <td>Savior's Hide Replica - Black</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate</td>
        <td>Daedra - Ill Met By Moonlight Complete</td>
    </tr>
    <tr>
        <td>Savior's Hide Replica - Black</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td>Daedra - Ill Met By Moonlight Complete</td>
    </tr>
    <tr>
        <td>Savior's Hide Replica - White</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Fur Plate</td>
        <td>Daedra - Ill Met By Moonlight Complete</td>
    </tr>
    <tr>
        <td>Savior's Hide Replica - White</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Snow Bear 3 Ingot: Steel 1 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td>Daedra - Ill Met By Moonlight Complete</td>
    </tr>
    <tr>
        <td>Scaled Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Bracers</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Bracers</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Bracers</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Sabre Cat 2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Leather Strips 5 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass - Horned</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Leather Strips 5 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass - Horned</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass - Horned</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Sabre Cat 1 Pelt: Goat 2 Ingot: Steel 4 Leather Strips 3 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass - Horned</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 4 Leather Strips 4 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Cuirass - Horned</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Sabre Cat 2 Ingot: Steel 4 Leather Strips 4 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Helmet</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Scaled Helmet</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Shellbug Helmet</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Ebony 1 Leather Strips 1 Leather 2 Shellbug Chitin</td>
        <td></td>
    </tr>
    <tr>
        <td>Sheogorath's Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Purple</td>
        <td>Daedra - The Mind of Madness</td>
    </tr>
    <tr>
        <td>Sheogorath's Garb</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Silk Thread 1 Silk Cloth 1 Silk Cloth - Orange 3 Silk Cloth - Purple</td>
        <td>Daedra - The Mind of Madness</td>
    </tr>
    <tr>
        <td>Shield of Ysgramor Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Ebony 2 Leather Strips 1 Ingot: Galatite</td>
        <td>Companions - Glory of the Dead Complete</td>
    </tr>
    <tr>
        <td>Shrouded Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 1 Leather: Dark 1 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Cowl</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Dark 1 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Cowl - Maskless</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Dark</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 5 Leather: Dark 2 Leather: Red</td>
        <td>Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 3 Leather: Dark 2 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Gloves</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Hand Wraps</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Silk Thread 1 Silk Cloth - Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Robes</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>4 Silk Thread 3 Silk Cloth - Black 2 Silk Cloth - Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Shoes</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Silk Thread 2 Silk Cloth - Black</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Sleeveless Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 3 Leather: Dark 2 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid,Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Supple Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 2 Leather: Dark 1 Leather: Red</td>
        <td>Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Supple Cowl</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 3 Leather: Dark 1 Leather: Red</td>
        <td>Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Supple Cowl - Maskless</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 3 Leather: Dark</td>
        <td>Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Supple Gloves</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 1 Leather: Dark 2 Leather: Red</td>
        <td>Dark Brotherhood Main Quest Complete</td>
    </tr>
    <tr>
        <td>Shrouded Veil</td>
        <td>Craftsmanship</td>
        <td>Smiths,Tailors</td>
        <td>None</td>
        <td>1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Worn Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 1 Leather: Dark 1 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Worn Cowl</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Dark 1 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Worn Cowl - Maskless</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Dark</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Worn Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 3 Leather: Dark 2 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Shrouded Worn Gloves</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather: Red</td>
        <td>Dark Brotherhood - Joined,Dark Brotherhood - Killed Astrid</td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td></td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Salt 1 Silk Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Spinning Wheel</td>
        <td>3 Spider Egg</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Black</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Brown</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Grey</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Indigo</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Orange</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Purple</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cloth - Yellow</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Cloth 1 Dye - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Cuffed Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Silk Thread 3 Silk Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Embroidered Raiment - Blue</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Blue 2 Silk Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Embroidered Raiment - Red</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Ingot: Steel 4 Leather Strips 1 Leather 4 Silk Thread 4 Silk Cloth - Red 2 Silk Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Embellished Robes - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Embellished Robes - Green</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Green 1 Silk Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Embellished Robes - Indigo</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Indigo 3 Silk Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Embellished Robes - Indigo</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Snow Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Indigo 1 Silk Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Embellished Robes - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Embellished Robes - Tan</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Bear 2 Hawk Feathers 4 Silk Thread 1 Silk Cloth - Black 3 Silk Cloth - Brown 1 Silk Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Lined Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 1 Fur Plate 2 Silk Thread 3 Silk Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Trimmed Clothes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Fur-Trimmed Clothes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Pelt: Wolf 2 Leather Strips 2 Leather 4 Silk Thread 2 Silk Cloth - Blue 2 Silk Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Mage Boots - Ornate</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Silk Thread 3 Silk Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Nocturnal Hood</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Silk Thread 2 Silk Cloth - Black 1 Silk Cloth - Grey</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Silk Nocturnal Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>4 Silk Thread 3 Silk Cloth - Black 1 Silk Cloth - Grey</td>
        <td>TG - Darkness Returns Complete</td>
    </tr>
    <tr>
        <td>Silk Pleated Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Silk Thread 3 Silk Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Psijic Boots</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Leather 2 Silk Thread 1 Silk Cloth - Grey 1 Silk Cloth - Red 2 Silk Cloth - Yellow</td>
        <td>College - The Eye of Magnus Complete</td>
    </tr>
    <tr>
        <td>Silk Psijic Gloves</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Ingot: Quicksilver 2 Silk Thread 2 Silk Cloth - Brown</td>
        <td>College - The Eye of Magnus Complete</td>
    </tr>
    <tr>
        <td>Silk Psijic Hood</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>3 Silk Thread 1 Silk Cloth - Red 2 Silk Cloth - Yellow</td>
        <td>College - The Eye of Magnus Complete</td>
    </tr>
    <tr>
        <td>Silk Psijic Robes</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>2 Ingot: Quicksilver 4 Silk Thread 1 Silk Cloth - Black 1 Silk Cloth - Grey 1 Silk Cloth - Red 3 Silk Cloth - Yellow</td>
        <td>College - The Eye of Magnus Complete</td>
    </tr>
    <tr>
        <td>Silk Thread</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Spinning Wheel</td>
        <td>3 Spider Egg</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Wedding Finery</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Silk Wedding Finery</td>
        <td>Craftsmanship</td>
        <td>Tailors</td>
        <td>None</td>
        <td>1 Pelt: Snow Bear 1 Cotton Cloth 4 Cotton Thread 4 Cotton Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amber Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amber 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amber Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Necklace 1 Gem: Amber</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amber Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Amber</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amethyst Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amethyst Circlet (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Amethyst (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amethyst Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Amethyst 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amethyst Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Amethyst (Flawless) 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amethyst Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Amethyst</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Amethyst Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Amethyst (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Aquamarine Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Aquamarine Circlet (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Aquamarine (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Aquamarine Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Necklace 1 Gem: Aquamarine</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Aquamarine Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Necklace 1 Gem: Aquamarine (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Aquamarine Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Aquamarine</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Aquamarine Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Aquamarine (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Battlestaff</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Silver 2 Ingot: Steel 1 Gem: Amethyst</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Diamond Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Diamond Circlet (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Diamond (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Diamond Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Diamond 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Diamond Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Diamond (Flawless) 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Diamond Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Diamond</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Diamond Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Diamond (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Emerald Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Emerald Circlet (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Emerald (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Emerald Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Emerald 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Emerald Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Emerald (Flawless) 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Emerald Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Emerald</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Emerald Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Emerald (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Garnet Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Garnet Circlet (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Garnet (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Garnet Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Garnet 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Garnet Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Garnet (Flawless) 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Garnet Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Garnet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Garnet Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Garnet (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Greatsword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 3 Ingot: Steel 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>4 Fragment: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Necklace (5)</td>
        <td>Craftsmanship</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Onyx Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Onyx 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Onyx Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Necklace 1 Gem: Onyx</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Onyx Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Onyx</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Opal Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Opal 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Opal Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Necklace 1 Gem: Opal</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Opal Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Opal</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Peridot Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Peridot Circlet (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Peridot (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Peridot Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Necklace 1 Gem: Peridot</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Peridot Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Necklace 1 Gem: Peridot (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Peridot Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Peridot</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Peridot Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Peridot (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>2 Fragment: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ring (10)</td>
        <td>Craftsmanship</td>
        <td>Jewelers,Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ruby Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ruby Circlet, Flawless</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Ruby (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ruby Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Ruby 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ruby Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Ruby (Flawless) 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ruby Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Ruby</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Ruby Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Ruby (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Sapphire Circlet</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Sapphire Circlet (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>3 Gem: Sapphire (Flawless) 1 Silver Circlet</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Sapphire Necklace</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Sapphire 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Sapphire Necklace (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Gem: Sapphire (Flawless) 1 Silver Necklace</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Sapphire Ring</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Sapphire</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Sapphire Ring (Flawless)</td>
        <td>Craftsmanship</td>
        <td>Jewelers</td>
        <td>None</td>
        <td>1 Silver Ring 1 Gem: Sapphire (Flawless)</td>
        <td></td>
    </tr>
    <tr>
        <td>Silver Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Silver 2 Ingot: Steel 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Skaal Amulet</td>
        <td>Advanced Blacksmithing</td>
        <td>Jewelers</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Stalhrim</td>
        <td>Dragonborn - The Fate of the Skaal Complete</td>
    </tr>
    <tr>
        <td>Skeevender Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Lavender 2 Raw Skeever Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Skeever Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Skeever Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Skeever Scramble</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Chicken's Egg 1 Leek 1 Raw Skeever Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Skewered Skeever</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Red Apple 1 Goat Cheese Slice 1 Raw Skeever Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Skyforge Steel Aegis</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Wood 2 Leather Strips 4 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel Battleaxe</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Leather Strips 4 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel Dagger</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Leather Strips 1 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel Greatsword</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 3 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel Heavy Bow</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Wood 3 Leather Strips 1 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel Mace</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 3 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel Sword</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Leather Strips 2 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel War Axe</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 2 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Skyforge Steel Warhammer</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Leather Strips 5 Ingot: Galatite</td>
        <td>Currently Uncraftable - Global Disabled</td>
    </tr>
    <tr>
        <td>Slaughterfish Scales</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Raw Slaughterfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Small Chest</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Small Chest</td>
        <td></td>
        <td>None Required</td>
        <td>Furniture Workbench</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Smoked Elk Roast</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Raw Elk Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Snow Elf Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather</td>
        <td>DawnGuard - Touching the Sky Complete</td>
    </tr>
    <tr>
        <td>Snow Elf Circlet</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Snow Elf Crown</td>
        <td>DawnGuard - Touching the Sky Complete</td>
    </tr>
    <tr>
        <td>Snow Elf Crown</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Moonstone 1 Ingot: Quicksilver 1 Leather Strips 1 Leather</td>
        <td>DawnGuard - Touching the Sky Complete</td>
    </tr>
    <tr>
        <td>Snow Elf Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Moonstone 2 Ingot: Quicksilver 4 Leather Strips 2 Leather</td>
        <td>DawnGuard - Touching the Sky Complete</td>
    </tr>
    <tr>
        <td>Snow Elf Gauntlets</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Moonstone 1 Ingot: Quicksilver 2 Leather Strips 1 Leather</td>
        <td>DawnGuard - Touching the Sky Complete</td>
    </tr>
    <tr>
        <td>Snowberry Crostata</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>10 Snowberries 1 Honey 1 Flour 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Snowberry Extract</td>
        <td>Alchemical Lore 1</td>
        <td>Survivalists,Alchemists</td>
        <td>Cook pot</td>
        <td>20 Snowberries</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Snowberry Extract</td>
        <td>Alchemical Lore 1</td>
        <td>Survivalists,Alchemists</td>
        <td>None</td>
        <td>20 Snowberries</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Snowberry Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>3 Snowberries 2 Red Mountain Flower 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Snowbery Wolf Chop</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>2 Snowberries 1 Raw Wolf Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soap - Blue Mountain</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>Cook pot</td>
        <td>1 Salt 3 Blue Mountain Flower 1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soap - Dragon's Tongue</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>Cook pot</td>
        <td>1 Salt 3 Dragon's Tongue 1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soap - Lavender</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>Cook pot</td>
        <td>1 Salt 3 Lavender 1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soap - Plain</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soap - Purple Mountain Flower</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>Cook pot</td>
        <td>1 Salt 3 Purple Mountain Flower 1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soap - Red Mountain Flower</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>Cook pot</td>
        <td>1 Salt 3 Red Mountain Flower 1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soap - Superior Mountain Flower</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>Cook pot</td>
        <td>1 Salt 2 Blue Mountain Flower 2 Red Mountain Flower 2 Purple Mountain Flower 1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Gem: Black</td>
        <td>Soul Gem Mastery</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Soul Gem: Grand 1 Human Skull</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Gem: Common</td>
        <td>Soul Gem Mastery</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Ingot: Moonstone 1 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Gem: Grand</td>
        <td>Soul Gem Mastery</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>3 Ingot: Moonstone 3 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Gem: Greater</td>
        <td>Soul Gem Mastery</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>2 Ingot: Moonstone 2 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Gem: Lesser</td>
        <td>Soul Gem Mastery</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Ingot: Moonstone 1 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Gem: Petty</td>
        <td>Soul Gem Mastery</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Ingot: Moonstone 1 Ingot: Quicksilver</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Tomato: Common</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Soul Gem: Lesser 1 Tomato</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Tomato: Corrupted</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Soul Gem: Grand 1 Tomato</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Tomato: Grand</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Soul Gem: Greater 1 Tomato</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Tomato: Greater</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Soul Gem: Common 1 Tomato</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Tomato: Lesser</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Soul Gem: Petty 1 Tomato</td>
        <td></td>
    </tr>
    <tr>
        <td>Soul Tomato: Petty</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Tomato</td>
        <td></td>
    </tr>
    <tr>
        <td>Spell Research Journal</td>
        <td>Craftsmanship</td>
        <td>Alchemists,Survivalists</td>
        <td>None</td>
        <td>5 Paper Roll 1 Leather 1 Linen Thread</td>
        <td></td>
    </tr>
    <tr>
        <td>Spellbreaker Replica</td>
        <td>Orcish Blacksmithing,Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Soul Gem: Grand 1 Ingot: Quicksilver 2 Leather Strips 3 Ingot: Dwarven 2 Ingot: Calcinium</td>
        <td>Daedra - The Only Cure Complete</td>
    </tr>
    <tr>
        <td>Spiced Diced Goat</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Purple Mountain Flower 1 Creep Cluster 1 Raw Goat Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Spider Fry</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 2 Salt 1 Raw Spider Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Spider Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Spider Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Spider Soup</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Potato 1 Raw Spider Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Spider Surprise</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Leek 1 Spider Egg 1 Bottled Milk 1 Raw Spider Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Spider Venom (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>2 Spider Venom (Crude)</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Spider Venom (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>3 Bleeding Crown 1 Spider Venom (Good)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Spider Venom (Superlative)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Spider Egg 1 Spider Venom (Great)</td>
        <td>Animal Harvesting Skill Greater or Equal to 3</td>
    </tr>
    <tr>
        <td>Spinning Wheel</td>
        <td>Craftsmanship</td>
        <td>Builders ,Survivalists</td>
        <td>None</td>
        <td>8 Wood 5 Iron Nails</td>
        <td></td>
    </tr>
    <tr>
        <td>Spotted Wolf Meat</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 1 Jazbay Grapes 1 Raw Wolf Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Spriggan Sap</td>
        <td></td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Taproot</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Staff of Banishing</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Calm</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Illusion 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Chain Lightning</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Courage</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Illusion 1 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Daedric Command</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Dread Zombies</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Expulsion</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Fear</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Illusion 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Fireballs</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Firebolts</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Flames</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 1 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Frenzy</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Illusion 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Frostbite</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 1 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Fury</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Illusion 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Grand Turning</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Restoration 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Heal Other</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Restoration 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Ice Spikes</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Ice Storms</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Icy Spears</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Incineration</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Inspiration</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Illusion 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Lightning Bolts</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Magelight</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Alteration 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Minor Turning</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Restoration 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Paralysis</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Alteration 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Reanimation</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Repulsion</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Restoration 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Repulsion</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Restoration 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Revenants</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Soul Trapping</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Sparks</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 1 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Flame Atronach</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Flame Wall</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Frost Atronach</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Frost Wall</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Healing Hand</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Restoration 2 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Spirit Wolf</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 1 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Storm Atronach</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of the Storm Wall</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Thunderbolts</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Destruction 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Turning</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Restoration 3 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Vanquishing</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Illusion 4 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Staff of Zombies</td>
        <td>Enchanter's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Unenchanted Staff of Conjuration 1 Heart Stone</td>
        <td></td>
    </tr>
    <tr>
        <td>Stalhrim Battleaxe</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Leather Strips 1 Ingot: Galatite 4 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Battlestaff</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Dagger</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Leather Strips 1 Ingot: Galatite 1 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Greatsword</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Ingot: Galatite 3 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Heavy Boots</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Heavy Crossbow</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Heavy Cuirass</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Leather Strips 2 Leather 2 Ingot: Galatite 5 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Heavy Gauntlets</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Leather 1 Ingot: Galatite 2 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Heavy Helmet</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Leather Strips 1 Leather 1 Ingot: Galatite 3 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Light Boots</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 3 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Light Bow</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Ingot: Galatite 3 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Light Cuirass</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 4 Leather Strips 2 Leather 4 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Light Gauntlets</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 2 Leather Strips 1 Leather 2 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Light Helmet</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Quicksilver 1 Leather Strips 1 Leather 3 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Light Shield</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Quicksilver 2 Leather Strips 4 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Mace</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Ingot: Galatite 3 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Staff of Paralysis</td>
        <td>Artificer's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Stalhrim Battlestaff</td>
        <td></td>
    </tr>
    <tr>
        <td>Stalhrim Staff of the Frost Atronach</td>
        <td>Artificer's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Stalhrim Battlestaff</td>
        <td></td>
    </tr>
    <tr>
        <td>Stalhrim Staff of the Storm Atronach</td>
        <td>Artificer's Insight</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Stalhrim Battlestaff</td>
        <td></td>
    </tr>
    <tr>
        <td>Stalhrim Sword</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Leather Strips 1 Ingot: Galatite 2 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim War Axe</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Leather Strips 1 Ingot: Galatite 2 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Stalhrim Warhammer</td>
        <td>Stalhrim Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Leather Strips 2 Ingot: Galatite 4 Stalhrim</td>
        <td>A New Source of Stalhrim</td>
    </tr>
    <tr>
        <td>Steel Battleaxe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 2 Wood 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Battlestaff</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 4 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Ornate Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Ornate Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Ornate White</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Trimmed Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Trimmed Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - Trimmed White</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bearskin Hood - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Bearskin Hood - White</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Boots - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Boots - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Boots - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Ice Wolf 3 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Braced Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Cuirass - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 4 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Cuirass - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Cuirass - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Ice Wolf 4 Ingot: Steel 4 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Dagger</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Furred Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Furred Plate Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 2 Ingot: Corundum 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Gauntlets - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Gauntlets - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Gauntlets - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Ice Wolf 2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Greatsword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Greaves</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Heavy Crossbow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 3 Wood 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Helmet - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Helmet - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather 1 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Helmet - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Ice Wolf 3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Horned Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Horned Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather 1 Goat Horns</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Hunting Knife</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 1 Leather Strips 1 Fragment: Bone</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Mace</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Pauldroned Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Pauldroned Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Pauldroned Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Wolf 5 Ingot: Steel 4 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Pauldroned Cuirass - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 4 Leather Strips 1 Leather 3 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Plate Boots</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Plate Cuirass</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 2 Ingot: Corundum 4 Leather Strips 2 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Plate Gauntlets</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Plate Helmet</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Plate Shield</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 1 Ingot: Corundum 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Scimitar</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Ingot: Corundum 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Ingot: Steel 2 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel War Axe</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 1 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Warhammer</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 2 Wood 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Dark Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Dark Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Dark Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Dark Trimmed White</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Light Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Light Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Light Trimmed Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Light Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Light Trimmed White</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Noble Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Noble Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Noble Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Noble Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Noble White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Noble White</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Ornate Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Ornate Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - Ornate White</td>
        <td></td>
    </tr>
    <tr>
        <td>Steel Wolfskin Hood - White</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>1 Steel Helmet 1 Wolfskin Hood - White</td>
        <td></td>
    </tr>
    <tr>
        <td>Stone Hatchet</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Wood 1 Sharp Rock</td>
        <td></td>
    </tr>
    <tr>
        <td>Stone Hatchet</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>2 Deadwood 1 Sharp Rock</td>
        <td></td>
    </tr>
    <tr>
        <td>Stone Hunting Knife</td>
        <td></td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>1 Sharp Rock 1 Bone Hunting Knife</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Stormcloak General Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 2 Leather: Dark</td>
        <td></td>
    </tr>
    <tr>
        <td>Stormcloak Heavy Crossbow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 4 Ingot: Steel 2 Wood 1 Leather 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Stormcloak Heavy Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Iron 1 Leather Strips 1 Leather</td>
        <td>Civil War - Joined Stormcloaks</td>
    </tr>
    <tr>
        <td>Stormcloak Light Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 4 Leather</td>
        <td>Civil War - Joined Stormcloaks</td>
    </tr>
    <tr>
        <td>Stormcloak Officer Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 2 Leather</td>
        <td>Civil War - Joined Stormcloaks,Civil War - Conquered a hold</td>
    </tr>
    <tr>
        <td>Stormcloak Officer Bracers</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 2 Leather</td>
        <td>Civil War - Joined Stormcloaks,Civil War - Conquered a hold</td>
    </tr>
    <tr>
        <td>Stormcloak Officer Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 3 Ingot: Steel 4 Leather Strips 4 Leather</td>
        <td>Civil War - Joined Stormcloaks,Civil War - Conquered a hold</td>
    </tr>
    <tr>
        <td>Stormcloak Officer Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 2 Ingot: Steel 1 Leather Strips</td>
        <td>Civil War - Joined Stormcloaks,Civil War - Conquered a hold</td>
    </tr>
    <tr>
        <td>Stormcloak Sleeved Heavy Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 5 Leather Strips 5 Leather</td>
        <td>Civil War - Joined Stormcloaks</td>
    </tr>
    <tr>
        <td>Strange Brew</td>
        <td></td>
        <td>Survivalists,Alchemists</td>
        <td>Cook pot</td>
        <td>2 Nightshade 1 Sleeping Tree Sap 2 Mora Tapinella</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Strange Brew</td>
        <td></td>
        <td>Survivalists,Alchemists</td>
        <td>Cook pot</td>
        <td>2 Nightshade 1 Nord Mead 1 Wolf Eye</td>
        <td>Animal Harvesting Skill Greater or Equal to 1</td>
    </tr>
    <tr>
        <td>Strong Acid</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Spider Venom (Great)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Strong Acid</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Chaurus Venom (Good)</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Strong Acid</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>3 Chaurus Eggs</td>
        <td>Animal Harvesting Skill Greater or Equal to 2</td>
    </tr>
    <tr>
        <td>Studded Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Leather Strips 4 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Studded Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Iron 4 Leather Strips 4 Leather 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Studded Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Elk 2 Ingot: Iron 4 Leather Strips 4 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Studded Furred Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>4 Leather 4 Hide Lace 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Sweetroll</td>
        <td></td>
        <td>Chefs</td>
        <td>Oven</td>
        <td>1 Chicken's Egg 1 Salt 1 Honey 1 Bottled Milk 1 Flour 1 Butter</td>
        <td></td>
    </tr>
    <tr>
        <td>Sweetwolf (Strange Brew)</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Red Apple 1 Honey 1 Raw Wolf Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Tanning Rack</td>
        <td>Craftsmanship</td>
        <td>Tailors,Survivalists,Builders ,Smiths</td>
        <td>None</td>
        <td>3 Wood 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Tanning Rack</td>
        <td>Craftsmanship</td>
        <td>Tailors,Survivalists,Builders ,Smiths</td>
        <td>None</td>
        <td>3 Wood 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Ten Dragons Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>10 Dragon's Tongue 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Thieves Guild Boots</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 2 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Boots - Grey</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 2 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Cowl</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Cowl - Grey</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Cuirass</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 6 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Cuirass - Grey</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 6 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Gloves</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Gloves - Grey</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Hood</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Hood - Grey</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 2 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Boots - Grey</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 2 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 6 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Cuirass - Grey</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 6 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Gloves</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Gloves - Grey</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Hood</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Hood - Grey</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 2 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Improved Sleeveless Cuirass - Grey</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 5 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Light Crossbow</td>
        <td>Advanced Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Ingot: Corundum 2 Wood 1 Leather: Dark 4 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Thieves Guild Master's Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>3 Leather Strips 3 Leather: Dark</td>
        <td>TG - Under New Management Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Master's Cowl</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 3 Leather: Dark</td>
        <td>TG - Under New Management Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Master's Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 8 Leather: Dark</td>
        <td>TG - Under New Management Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Master's Gloves</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 3 Leather: Dark</td>
        <td>TG - Under New Management Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Master's Hood</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>2 Leather Strips 3 Leather: Dark</td>
        <td>TG - Under New Management Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Master's Sleeveless Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 6 Leather: Dark</td>
        <td>TG - Under New Management Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Sleeveless Cuirass</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 5 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Sleeveless Cuirass - Grey</td>
        <td>Craftsmanship,Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 5 Leather 1 Dye - Grey</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Thieves Guild Sleeveless Improved Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>6 Leather Strips 5 Leather</td>
        <td>TG - Loud and Clear Complete</td>
    </tr>
    <tr>
        <td>Throwable Flame Powder</td>
        <td>Alchemical Lore 2</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Fire Salts 1 Dwarven Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Throwable Frost Powder</td>
        <td>Alchemical Lore 2</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Frost Salts 1 Dwarven Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Throwable Shock Powder</td>
        <td>Alchemical Lore 2</td>
        <td>Alchemists</td>
        <td>None</td>
        <td>1 Void Salts 1 Dwarven Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Northern Flax</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Wrap</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Crude)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Kindling</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Silk Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Mora Tapinella</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Decent)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Canis Root</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Tundra Cotton</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Paper Roll</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Hanging Moss</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Yellow</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Tan</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Red</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Purple</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Orange</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Indigo</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Grey</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Green</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Brown</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Blue</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Cotton Cloth - Black</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Animal Fat</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Good)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Tree Bark</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Great)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Straw</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Great)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Beehive Husk</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Superlative)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Flammable Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Tinder (Superlative)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Dwarven Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Tomato Soup</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Garlic 1 Tomato 1 Leek 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Alchemist's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Alchemist's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>None</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Brewer's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Brewer's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>None</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Builder's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Chef's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Jeweler's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Smith's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Survivalist's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Survivalist's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>None</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Tailor's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Tailor's</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>None</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Toolkit: Thieves'</td>
        <td>Craftsmanship</td>
        <td>None Required</td>
        <td>Forge</td>
        <td>1 Ingot: Steel 2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Troll Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Troll Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Troll's Blood Poison (Crude)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Fat 1 Troll Blood</td>
        <td>Animal Harvesting Skill Equal to 1</td>
    </tr>
    <tr>
        <td>Troll's Blood Poison (Decent)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Fat 1 Troll Blood</td>
        <td>Animal Harvesting Skill Equal to 2</td>
    </tr>
    <tr>
        <td>Troll's Blood Poison (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Fat 1 Troll Blood</td>
        <td>Animal Harvesting Skill Equal to 3</td>
    </tr>
    <tr>
        <td>Troll's Blood Poison (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Fat 1 Troll Blood</td>
        <td>Animal Harvesting Skill Equal to 4</td>
    </tr>
    <tr>
        <td>Troll's Blood Poison (Remarkable)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Fat 1 Troll Blood</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Troll's Blood Potion (Crude)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Blood 1 Medicinal Salve</td>
        <td>Animal Harvesting Skill Equal to 1</td>
    </tr>
    <tr>
        <td>Troll's Blood Potion (Decent)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Blood 1 Medicinal Salve</td>
        <td>Animal Harvesting Skill Equal to 2</td>
    </tr>
    <tr>
        <td>Troll's Blood Potion (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Blood 1 Medicinal Salve</td>
        <td>Animal Harvesting Skill Equal to 3</td>
    </tr>
    <tr>
        <td>Troll's Blood Potion (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Blood 1 Medicinal Salve</td>
        <td>Animal Harvesting Skill Equal to 4</td>
    </tr>
    <tr>
        <td>Troll's Blood Potion (Remarkable)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Troll Blood 1 Medicinal Salve</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Unenchanted Forsworn Staff</td>
        <td> Arcane Craftsmanship</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Hagraven Feathers 6 Sabre Cat Tooth 3 Wood 4 Leather Strips 2 Hawk Beak</td>
        <td></td>
    </tr>
    <tr>
        <td>Unenchanted Staff of Alteration</td>
        <td> Arcane Craftsmanship</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Ingot: Steel 3 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Unenchanted Staff of Conjuration</td>
        <td> Arcane Craftsmanship</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Ingot: Steel 3 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Unenchanted Staff of Destruction</td>
        <td> Arcane Craftsmanship</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Ingot: Steel 3 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Unenchanted Staff of Illusion</td>
        <td> Arcane Craftsmanship</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Ingot: Steel 3 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Unenchanted Staff of Restoration</td>
        <td> Arcane Craftsmanship</td>
        <td>None Required</td>
        <td>Staff Enchanter</td>
        <td>1 Soul Gem: Grand 1 Ingot: Steel 3 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Vampire Boots</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 3 Leather Strips 2 Leather: Dark</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Vampire Cuirass - Dark</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>5 Leather Strips 5 Leather: Dark</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Vampire Cuirass - Grey</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>5 Leather Strips 5 Leather 1 Dye - Grey</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Vampire Cuirass - Red</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>None</td>
        <td>5 Leather Strips 5 Leather: Red</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Vampire Gauntlets</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 2 Leather Strips 2 Leather: Dark</td>
        <td>DawnGuard - Prophet (Vampire) Complete</td>
    </tr>
    <tr>
        <td>Vampire Royal Cuirass</td>
        <td>Advanced Light Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 5 Leather Strips 6 Leather: Dark</td>
        <td>DawnGuard - Prophet (Vampire) Complete,DawnGuard - Killed Harkon</td>
    </tr>
    <tr>
        <td>Vegetable Soup</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Cabbage 1 Potato 1 Tomato 1 Leek 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Velvet Slaughterfish</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Velvet LeChance 1 Raw Slaughterfish</td>
        <td></td>
    </tr>
    <tr>
        <td>Venison Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Elk Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Venison Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Venison</td>
        <td></td>
    </tr>
    <tr>
        <td>Venison Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Potato 1 Raw Venison 1 Leek 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Venison Tenderloin</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Ale 1 Raw Venison</td>
        <td></td>
    </tr>
    <tr>
        <td>Volendrung Replica</td>
        <td>Daedric Smithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Daedra Heart 4 Ingot: Ebony 3 Leather Strips</td>
        <td>Daedra - The Cursed Tribe Complete</td>
    </tr>
    <tr>
        <td>Watermelon Gazpacho</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 1 Elves Ear 1 Goat Cheese Slice 1 Tomato 1 Watermelon</td>
        <td></td>
    </tr>
    <tr>
        <td>Waterskin (3/3)</td>
        <td></td>
        <td>None Required</td>
        <td>Cook pot</td>
        <td>1 Waterskin (Salt Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Waterskin (Empty)</td>
        <td>Craftsmanship</td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Leather Strips 1 Leather</td>
        <td></td>
    </tr>
    <tr>
        <td>Werebear's Blood Poison (Crude)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Bear Eye 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Equal to 1</td>
    </tr>
    <tr>
        <td>Werebear's Blood Poison (Decent)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Bear Eye 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Equal to 2</td>
    </tr>
    <tr>
        <td>Werebear's Blood Poison (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Bear Eye 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Equal to 3</td>
    </tr>
    <tr>
        <td>Werebear's Blood Poison (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Bear Eye 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Equal to 4</td>
    </tr>
    <tr>
        <td>Werebear's Blood Poison (Remarkable)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Bear Eye 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Werebear's Blood Potion (Decent)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Equal to 2</td>
    </tr>
    <tr>
        <td>Werebear's Blood Potion (Good)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Equal to 3</td>
    </tr>
    <tr>
        <td>Werebear's Blood Potion (Great)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Equal to 4</td>
    </tr>
    <tr>
        <td>Werebear's Blood Potion (Remarkable)</td>
        <td></td>
        <td>Alchemists</td>
        <td>Cook pot</td>
        <td>1 Luna Moth Wing 1 Werebear's Blood</td>
        <td>Animal Harvesting Skill Greater or Equal to 5</td>
    </tr>
    <tr>
        <td>Wheat Boon Tea</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>3 Wheat 1 Hanging Moss 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>White-Gold Tower</td>
        <td></td>
        <td>None Required</td>
        <td>Brewing Barrel</td>
        <td>1 Nord Mead 1 Lavender 1 Dragon's Tongue 1 Bottled Milk</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolf Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolf Boots</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 3 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolf Cabbage Stew</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Cabbage 1 Raw Wolf Meat 1 Glass Bottle (Water)</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolf Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 4 Leather Strips 2 Leather 6 Fur Plate</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolf Cuirass</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Pelt: Cave Bear 5 Ingot: Steel 4 Leather Strips 2 Leather</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolf Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>2 Ingot: Steel 2 Leather Strips 1 Leather 2 Fur Plate</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolf Gauntlets</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Pelt: Cave Bear 2 Ingot: Steel 2 Leather Strips 1 Leather</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolf Helmet</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Steel 1 Leather Strips 1 Leather</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolf Jerky</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>6 Salt 1 Raw Wolf Meat</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolf Shield</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>5 Ingot: Steel 2 Leather Strips</td>
        <td>Companions - Proving Honor Complete</td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips 1 Charcoal</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Dark Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips 2 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Dark Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Dark Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Ice Wolf 3 Leather Strips 1 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Light Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Light Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Light Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Ice Wolf 3 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips 1 Charcoal 3 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Wolf 3 Leather Strips 3 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Ice Wolf 3 Leather Strips 3 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Cloak - White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>4 Pelt: Ice Wolf 3 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 1 Charcoal</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Dark Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 2 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Dark Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Dark Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Ice Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Light Trimmed Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Light Trimmed Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Light Trimmed White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Noble Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 2 Charcoal 2 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Noble Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 2 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Noble White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Ice Wolf 1 Leather Strips 2 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Ornate Black</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 1 Charcoal 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Ornate Brown</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Wolf 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - Ornate White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Ice Wolf 1 Leather Strips 1 Pelt: Snow Fox</td>
        <td></td>
    </tr>
    <tr>
        <td>Wolfskin Hood - White</td>
        <td>Craftsmanship</td>
        <td>Survivalists,Tailors</td>
        <td>None</td>
        <td>1 Pelt: Ice Wolf 1 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Barrel</td>
        <td>Craftsmanship</td>
        <td>Builders ,Survivalists</td>
        <td>None</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Battlestaff</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Chest</td>
        <td>Craftsmanship</td>
        <td>Builders ,Survivalists</td>
        <td>None</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Common Bed</td>
        <td>Craftsmanship</td>
        <td>Builders ,Survivalists</td>
        <td>None</td>
        <td>5 Wood 2 Fur Plate</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Common Chair</td>
        <td>Craftsmanship</td>
        <td>Builders ,Survivalists</td>
        <td>None</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Common Table</td>
        <td>Craftsmanship</td>
        <td>Builders ,Survivalists</td>
        <td>None</td>
        <td>5 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Fishing Rod</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists,Alchemists</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 1 Wood</td>
        <td>Fishing - Unlocked Dwarven Rod</td>
    </tr>
    <tr>
        <td>Wooden Flute</td>
        <td>Craftsmanship</td>
        <td>Builders</td>
        <td>None</td>
        <td>1 Salt 1 Wood 1 Bottled Milk</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Heavy Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>3 Wood 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Heavy Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>4 Hide Lace 2 Deadwood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Light Bow</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>2 Wood 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Light Crossbow</td>
        <td>Craftsmanship</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>1 Ingot: Iron 4 Wood 2 Hide Lace</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Sword</td>
        <td>Craftsmanship</td>
        <td>Smiths,Survivalists</td>
        <td>None</td>
        <td>2 Wood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Torch</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Wrap 1 Wood 1 Flammable Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Torch (10)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>10 Linen Wrap 10 Wood 10 Flammable Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Torch (5)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>5 Linen Wrap 5 Wood 5 Flammable Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Torch (Bright)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>1 Linen Wrap 1 Wood 1 Dwarven Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Torch (Bright) (5)</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>5 Linen Wrap 5 Wood 5 Dwarven Oil</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Walking Stick</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>2 Leather Strips 4 Deadwood</td>
        <td></td>
    </tr>
    <tr>
        <td>Wooden Walking Stick</td>
        <td></td>
        <td>Survivalists</td>
        <td>None</td>
        <td>2 Wood 2 Leather Strips</td>
        <td></td>
    </tr>
    <tr>
        <td>Wuuthrad Replica</td>
        <td>Ebony Blacksmithing</td>
        <td>Smiths</td>
        <td>Forge</td>
        <td>3 Ingot: Ebony 3 Leather Strips 2 Ingot: Galatite</td>
        <td>Companions - Glory of the Dead Complete</td>
    </tr>
    <tr>
        <td>Wyrm and Chips</td>
        <td></td>
        <td>Chefs</td>
        <td>Cook pot</td>
        <td>1 Salt 2 Potato 1 Raw Dragon Meat</td>
        <td></td>
    </tr>
	</tbody>
</table>