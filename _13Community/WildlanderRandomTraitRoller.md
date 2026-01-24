---
layout: default
title: Wildlander Trait Roller
nav_order: 5
parent: Community
has_toc: false
---

# Skyrim Wildlander Trait Roller

A random character trait roller for Wildlander playthroughs. Select how many traits you want from each category, and the roller will randomly select traits while respecting conflicts.

**[← Back to Wildlander Wiki](https://wiki.wildlandermod.com/)**

---

## Configure Trait Selection

<div class="trait-roller">

<div class="trait-inputs" id="inputs"></div>

---

## Selected Traits

<div id="traitGrid" class="trait-grid"></div>

<div id="traitDescriptions" class="trait-descriptions"></div>

---

## All Traits (Enable/Disable & Conflict Override)

| Category | Trait Name | Conflicts With | Description | Use? | Ignore Conflicts? |
|----------|-----------|-----------------|-------------|------|-------------------|
{table-body}

---

## Add New Trait

<div class="add-trait-form">
<label>Category:</label>
<select id="newTraitCategory"></select>

<label>Trait Name:</label>
<input type="text" id="newTraitName">

<label>Description:</label>
<input type="text" id="newTraitDesc" size="80">

<label>Conflicts With (hold Ctrl/Cmd to select multiple):</label>
<select id="newTraitConflicts" multiple size="5"></select>

<button onclick="addNewTrait()">Add Trait</button>
</div>

---

## Save / Load Traits

<button class="trait-roller-button" onclick="exportTraits()" style="margin-right: 10px;">Save Traits to JSON</button>

<input type="file" id="importFile" style="display:none" onchange="importTraits(event)">

<button class="trait-roller-button" onclick="document.getElementById('importFile').click()">Load Traits from JSON</button>

---

## How to Implement Traits In-Game

<button class="trait-roller-button" onclick="toggleImplementationTable()" style="margin-bottom: 15px;">Show / Hide</button>

<div id="implementationWrapper" style="display:none;">

| Trait | How to Implement |
|-------|------------------|
| Vegetarian | manually enforced roleplay |
| Anti-vax | manually enforced roleplay |
| Top Shelf | manually enforced roleplay |
| Alcoholic | manually enforced roleplay |
| Drug Addict | manually enforced roleplay |
| Sober | manually enforced roleplay |
| Fear of Exposure | manually enforced roleplay |
| Bad Knees | manually enforced roleplay |
| Crippled | manually enforced roleplay |
| Landlubber | manually enforced roleplay |
| Slow Metabolism | manually enforced roleplay |
| Naturalist | manually enforced roleplay |
| Superstitious | manually enforced roleplay |
| Outcast | manually enforced roleplay |
| Peddler | manually enforced roleplay |
| Illiterate | manually enforced roleplay |
| Fashionista | manually enforced roleplay |
| Le Random | manually enforced roleplay |
| Dark Visitor | manually enforced roleplay |
| Loner | manually enforced roleplay |
| Extrovert | manually enforced roleplay |
| City Boy/Girl | manually enforced roleplay |
| Camper | manually enforced roleplay |
| Vagrant | manually enforced roleplay |
| Nomadic | manually enforced roleplay |
| Pilgrim | manually enforced roleplay |
| Equal Worship | manually enforced roleplay |
| Iconoclast | manually enforced roleplay |
| Virtue Signalling | manually enforced roleplay |
| Kleptomaniac | manually enforced roleplay |
| Gambler | manually enforced roleplay |
| Chronic Illness | manually enforced roleplay |
| Caffeine Dependence | manually enforced roleplay |
| Burning The Candle | Set skillrate to 200% in Requiem MCM |
| Fast Learner | Use console command SPP <# of perks> to grant or remove perks as needed. |
| Slow Learner | Use console command SPP <# of perks> to grant or remove perks as needed. |
| Burst Learner | Use console command SPP <# of perks> to grant or remove perks as needed. |
| Early Peaker | Use console command SPP <# of perks> to grant or remove perks as needed. |
| Supremacy | Choose your own weapon type or use random selector below. Use console command SPP <# of perks> to grant first perk free. |
| Warrior's Honour | Choose combat skill yourself or use random selector below. Use "player.advskill <skill> 25". |
| Specialist | Choose magic school yourself or use random selector below. Use "player.advskill <school> 25". |
| Savant | Pick skill yourself or use random selector below. Use "player.setav <skill> 100" and "player.setav <skill> 0". Set skillrate to 50% in Requiem MCM |
| Monster Phobia | Pick enemy type yourself or use random selector below |
| Family Heirloom | Pick item slot yourself or use random selector below. Use player.additem <itemID> 1 to add item. |
| Zealot | Pick deity yourself or use random selector below |
| Vigilant | Use player.setav health <base+25> and player.setav magicka <base+50> |
| Barbarian | player.setav magicka 0, player.setav health <value>, player.setav stamina <value> |
| Scholar | player.setav magicka <value>, player.setav health <value>, player.setav stamina <value> |
| Juggernaut | player.setav health <value> |
| Balanced | player.setav magicka <value>, player.setav health <value>, player.setav stamina <value> |

</div>

---

## Random Selectors (Optional)

<div class="inline-selector">
  <span class="selector-label">Warrior's Honour (Combat Skill)</span>
  <div>
    <button class="trait-roller-button" onclick="rollRandom('warrior','warriorOut')">Roll</button>
    <span class="selector-output">— <strong id="warriorOut"></strong></span>
  </div>
</div>

<div class="inline-selector">
  <span class="selector-label">Specialist (Magic School)</span>
  <div>
    <button class="trait-roller-button" onclick="rollRandom('specialist','specialistOut')">Roll</button>
    <span class="selector-output">— <strong id="specialistOut"></strong></span>
  </div>
</div>

<div class="inline-selector">
  <span class="selector-label">Savant (Skill)</span>
  <div>
    <button class="trait-roller-button" onclick="rollRandom('savant','savantOut')">Roll</button>
    <span class="selector-output">— <strong id="savantOut"></strong></span>
  </div>
</div>

<div class="inline-selector">
  <span class="selector-label">Monster Phobia (Monster)</span>
  <div>
    <button class="trait-roller-button" onclick="rollRandom('phobia','phobiaOut')">Roll</button>
    <span class="selector-output">— <strong id="phobiaOut"></strong></span>
  </div>
</div>

<div class="inline-selector">
  <span class="selector-label">Family Heirloom (Slot)</span>
  <div>
    <button class="trait-roller-button" onclick="rollRandom('heirloom','heirloomOut')">Roll</button>
    <span class="selector-output">— <strong id="heirloomOut"></strong></span>
  </div>
</div>

<div class="inline-selector">
  <span class="selector-label">Zealot (Divine)</span>
  <div>
    <button class="trait-roller-button" onclick="rollRandom('zealot','zealotOut')">Roll</button>
    <span class="selector-output">— <strong id="zealotOut"></strong></span>
  </div>
</div>

</div>

<script>
// ============== TRAIT DATA ==============
let traits = {
"Consumables":[
["Vegetarian","cannot eat meat or food containing meat"],
["Anti-vax","cannot use potions at all, food is ok. Exceptions for traits Chronic Illness and Caffine dependence"],
["Top Shelf","must only buy the most expensive food and alcohol to sustain you. can only use potions of quality Great and above"],
["Alcoholic","must always be under the status effect of an alcohol"],
["Drug Addict","consume 3 skooma or 10 moon sugar each day"],
["Sober","no alcohol, sleeping tree sap, moon sugar or skooma"]
],
"Detriments":[
["Fear Of Exposure","you must always have a shield equipped"],
["Bad Knees","you cannot sprint, you can only walk when sneaking"],
["Crippled","you can use your offhand for casting spells only. You cannot equip a shield, you cannot use bows or crossbows, you cannot wield two handed weapons"],
["Landlubber","you can't swim unless under the effect of a waterbreathing potion or enchantment"],
["Slow Metabolism","only one potion effect can be active at a time"]
],
"Gear And Trade":[
["Naturalist","can only use gear made from natural materials (fur, bone, wood etc.)"],
["Superstitious","you cannot use any enchanted items, except for daedric or divine"],
["Family Heirloom","randomly pick an item slot (shield, gloves, boots, chest, head). Start the game with that item in dragonbone or dragonscale quality, but you may never unequip it. When you enchant this item (yourself or using a vendor) temporarily increase your/their enchanting skill by 50"],
["Supremacy","you can only use one weapon type (sword, axe or mace/warhammer). You receive the first perk for that weapon type for free"],
["Outcast","can only buy and sell goods from black market vendors"],
["Peddler","you cannot trade unless you pass the Speechcraft tree check of asking for training and succeed"]
],
"Perks/Skills":[
["Fast Learner","start with 12 perk points, every level up that's a multiple of 4, gain no perk point"],
["Slow Learner","start with 0 perk points, every level up that's a multiple of 4, gain two perk points"],
["Burst Learner","start with 0 perk points and gain 0 when you level up, except every level up that's a multiple of 4, gain 5 perk points"],
["Savant","make one skill 100, make every other skill 0, set levelling rate to 50% in Requiem MCM"],
["Early Peaker","You unlock all perks the moment they become available to you, but you cannot take any perk above skill level 50 "],
["Burning The Candle","set experience rate to double. You may not level up past 30"],
["Warrior's Honour","choose one combat skill to increase by +25. You must always fight to the death (no fleeing ever)"],
["Specialist","pick one magic school to increase your skill by +25, but you cannot use any other magic school"]
],
"Quirks":[
["Kleptomaniac","must steal 10 items per day, 1 must be a pickpocket"],
["Gambler","At the end of each day, gamble half your gold at the local inn. For example, if you have 1000 gold you must play 5 hands of blackjack at 100 gold each. If sick of the minigame flip a coin irl - if you guess right double half your gold, if not erase it. If genuinely not near an inn at day end you can skip"],
["Monster Phobia","Pick one enemy (wolves, bears, trolls, spiders, chaurus, dragons, mudcrabs, giants, mammoths, sabre cats, hagraven, werewolves) you must always flee this enemy, unless you are under the influence of alcohol or skooma"],
["Illiterate","you can't read - no opening and reading any books, notes, tomes etc."],
["Fashionista","you can only wear clothing while inside a city. You must replace one item in your wardrobe each time you travel to a different city"],
["Le Random","whenever a quest or encounter requires you to make a binary choice - flip a coin to make the decision for you"],
["Chronic Illness","must consume 3 health potions of good or higher quality per day outside combat"],
["Caffeine Dependence","must consume the highest available tier mana potion from the local alchemist each morning"]
],
"Religion":[
["Zealot","can only pray at shrines of one deity"],
["Pilgrim","can only pray at shrines outside cities and settlements"],
["Equal Worship","you can only pray to the 9 divines (or exclude Talos for your roleplay). When you pray, you must wait for the entire buff to run out, then you must pick the next divine in sequence and repeat"],
["Iconoclast","you cannot use any shrines"],
["Virtue Signalling","must always have a blessing active. you can only be under the effect of a divine blessing if you have that deity's amulet equipped. Start the game with one amulet of your choice"]
],
"Stats Archetype":[
["Vigilant","Increase health by 25 and Magicka by 50. you cannot contract vampirism or lycanthropy this playthrough"],
["Barbarian","set your magicka to 0, then evenly split your base magicka pool and add it to your health and stamina. You cannot use any of the magic skills, any spells, scrolls or staves"],
["Scholar","reduce your stamina and health by half and add them to your base Magicka. you are restricted to using battlestaffs or daggers in melee, cannot use bows or crossbows, you cannot wear armor, you cannot sprint, you cannot invest level ups in health or stamina"],
["Juggernaut","increase your health by 500. you cannot block, sprint or jump (unless necessary to continue through an area), you must wear heavy armor at all times"],
["Balanced","divide your base Magicka, Health and Stamina equally. You must always increase them equally when levelling up."]
],
"Travel And Companions":[
["Dark Visitor","you must murder one NPC each time you visit a major city (visit means one period of staying before moving to a next - e.g. 10 nights in one city and questing around it still counts as a single visit)"],
["Loner","you must always travel alone"],
["Extrovert","you must always travel with a humanoid companion"],
["City Boy/Girl","can only sleep indoors"],
["Camper","can only sleep outside"],
["Vagrant","can only sleep in free locations"],
["Nomadic","you cannot stay in/near the same settlement for more than one night"]
]
};

let conflicts = {
"Sober":["Alcoholic","Drug Addict","Monster Phobia"],
"Alcoholic":["Sober"],
"Drug Addict":["Sober"],
"Monster Phobia":["Sober"],
"Fear Of Exposure":["Crippled","Scholar"],
"Crippled":["Fear Of Exposure"],
"Scholar":["Fear Of Exposure","Vigilant","Barbarian","Juggernaut","Balanced"],
"Fast Learner":["Slow Learner","Burst Learner","Early Peaker"],
"Slow Learner":["Fast Learner","Burst Learner","Early Peaker"],
"Burst Learner":["Fast Learner","Slow Learner","Early Peaker"],
"Early Peaker":["Fast Learner","Slow Learner","Burst Learner"],
"Iconoclast":["Zealot","Pilgrim","Equal Worship","Virtue Signalling"],
"Zealot":["Iconoclast","Equal Worship"],
"Pilgrim":["Iconoclast"],
"Equal Worship":["Iconoclast","Zealot"],
"Virtue Signalling":["Iconoclast"],
"Loner":["Extrovert"],
"Extrovert":["Loner"],
"City Boy/Girl":["Camper"],
"Camper":["City Boy/Girl"],
"Vigilant":["Barbarian","Scholar","Juggernaut","Balanced"],
"Barbarian":["Vigilant","Scholar","Juggernaut","Balanced"],
"Juggernaut":["Vigilant","Barbarian","Scholar","Balanced"],
"Balanced":["Vigilant","Barbarian","Scholar","Juggernaut"]
};

// ============== STATE ==============
let currentSelection = {};
let allowedTraits = new Set();
let overrides = new Set();

// ============== UI BUILD ==============
const inputDiv = document.getElementById("inputs");
for (let category in traits) {
    const div = document.createElement("div");
    div.className = "trait-input-group";
    div.innerHTML = `
        <label>${category}</label>
        <input type="number" min="0" max="${traits[category].length}" value="0" id="input-${category}">
        <button onclick="rollCategory('${category}')">Roll</button>
    `;
    inputDiv.appendChild(div);
}

const tableBody = document.getElementById("traitTable") ? document.getElementById("traitTable").querySelector("tbody") : null;
function buildTraitTable() {
    if (!tableBody) return;
    tableBody.innerHTML = "";
    allowedTraits.clear();
    for (let category in traits) {
        for (let [name, desc] of traits[category]) {
            allowedTraits.add(name);
            const conflictList = conflicts[name] ? conflicts[name].join(", ") : "";
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${category}</td>
                <td>${name}</td>
                <td>${conflictList}</td>
                <td>${desc}</td>
                <td><input type="checkbox" checked data-trait="${name}" onchange="toggleTrait(event)"></td>
                <td><input type="checkbox" class="override" data-trait="${name}" onchange="toggleOverride(event)"></td>
            `;
            tableBody.appendChild(row);
        }
    }
}
buildTraitTable();

function populateCategoryOptions() {
    const select = document.getElementById("newTraitCategory");
    const conflictsSelect = document.getElementById("newTraitConflicts");
    select.innerHTML = "";
    conflictsSelect.innerHTML = "";
    for (let category in traits) {
        const opt = document.createElement("option");
        opt.value = category;
        opt.textContent = category;
        select.appendChild(opt);
        for (let [name] of traits[category]) {
            const opt2 = document.createElement("option");
            opt2.value = name;
            opt2.textContent = name;
            conflictsSelect.appendChild(opt2);
        }
    }
}
populateCategoryOptions();

// ============== FUNCTIONS ==============
function toggleTrait(e) {
    const name = e.target.dataset.trait;
    if (e.target.checked) allowedTraits.add(name);
    else allowedTraits.delete(name);
}

function toggleOverride(e) {
    const name = e.target.dataset.trait;
    if (e.target.checked) overrides.add(name);
    else overrides.delete(name);
}

function rollCategory(category) {
    const count = parseInt(document.getElementById(`input-${category}`).value);
    if (count <= 0) { delete currentSelection[category]; renderResults(); return; }
    delete currentSelection[category];

    const banned = rebuildBanned();
    const pool = traits[category].filter(t => allowedTraits.has(t[0]));
    shuffle(pool);

    const selected = [];
    for (let i = 0; i < pool.length && selected.length < count; i++) {
        const [name, desc] = pool[i];
        if (banned.has(name) && !overrides.has(name)) continue;
        selected.push({ name, desc });
        banned.add(name);
        if (conflicts[name]) conflicts[name].forEach(c => banned.add(c));
    }
    currentSelection[category] = selected;
    renderResults();
}

function rebuildBanned() {
    const banned = new Set();
    for (let category in currentSelection) {
        currentSelection[category].forEach(t => {
            banned.add(t.name);
            if (conflicts[t.name]) conflicts[t.name].forEach(c => banned.add(c));
        });
    }
    return banned;
}

function renderResults() {
    const grid = document.getElementById("traitGrid");
    const descList = document.getElementById("traitDescriptions");
    grid.innerHTML = "";
    descList.innerHTML = "";
    for (let category in traits) {
        if (!currentSelection[category]) continue;
        const col = document.createElement("div");
        col.className = "trait-column";
        col.innerHTML = `<h3>${category}</h3>`;
        currentSelection[category].forEach(t => {
            col.innerHTML += `<div class="trait">${t.name}</div>`;
            const descDiv = document.createElement("div");
            descDiv.className = "trait-desc-item";
            descDiv.innerHTML = `<strong>${t.name}:</strong> ${t.desc}`;
            descList.appendChild(descDiv);
        });
        grid.appendChild(col);
    }
}

function shuffle(array) {
    for (let i = array.length-1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i+1));
        [array[i], array[j]] = [array[j], array[i]];
    }
}

function addNewTrait() {
    const category = document.getElementById("newTraitCategory").value;
    const name = document.getElementById("newTraitName").value.trim();
    const desc = document.getElementById("newTraitDesc").value.trim();
    const selectedConflicts = Array.from(document.getElementById("newTraitConflicts").selectedOptions).map(o=>o.value);

    if(!name||!desc) return alert("Please fill in both name and description.");
    if(!traits[category]) traits[category]=[];
    traits[category].push([name, desc]);
    allowedTraits.add(name);

    if(selectedConflicts.length>0) conflicts[name]=selectedConflicts;
    selectedConflicts.forEach(c=>{
        if(!conflicts[c]) conflicts[c]=[];
        if(!conflicts[c].includes(name)) conflicts[c].push(name);
    });

    buildTraitTable();
    populateCategoryOptions();
}

// ============== SAVE / LOAD ==============
function exportTraits() {
    const data = {traits, conflicts};
    const blob = new Blob([JSON.stringify(data, null, 2)], {type: "application/json"});
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "wildlander_traits.json";
    a.click();
    URL.revokeObjectURL(url);
}

function importTraits(event) {
    const file = event.target.files[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = e => {
        try {
            const data = JSON.parse(e.target.result);
            traits = data.traits || traits;
            conflicts = data.conflicts || conflicts;
            currentSelection = {};
            allowedTraits.clear();
            overrides.clear();
            buildTraitTable();
            populateCategoryOptions();
            renderResults();
        } catch(err) {
            alert("Invalid JSON file");
        }
    };
    reader.readAsText(file);
}

// ============== IMPLEMENTATION TABLE TOGGLE ==============
function toggleImplementationTable() {
    const el = document.getElementById("implementationWrapper");
    el.style.display = (el.style.display === "none") ? "block" : "none";
}

// ============== RANDOM SELECTORS ==============
const randomSelectors = {
    supremacy: ["Sword", "Axe", "Hammer"],
    warrior: ["One Handed", "Two Handed", "Archery", "Heavy Armor", "Light Armour", "Block"],
    specialist: ["Enchanting", "Alteration", "Illusion", "Destruction", "Restoration", "Conjuration"],
    savant: [
        "One Handed","Two Handed","Archery","Block","Heavy Armor","Light Armor",
        "Smithing","Enchanting","Alchemy","Alteration","Illusion",
        "Destruction","Restoration","Conjuration","Sneak","Lockpicking",
        "Pickpocket","Speech"
    ],
    phobia: [
        "Wolves","Bears","Horkers","Draugr","Trolls","Spiders","Chaurus",
        "Dragons","Mudcrabs","Giants","Mammoths","Sabre Cats",
        "Hagraven","Werewolves"
    ],
    heirloom: ["Shield","Gloves","Boots","Chest","Head"],
    zealot: [
        "Akatosh","Arkay","Dibella","Julianos","Kynareth",
        "Mara","Stendarr","Talos","Zenithar"
    ]
};

function rollRandom(key, outputId) {
    const list = randomSelectors[key];
    const result = list[Math.floor(Math.random() * list.length)];
    document.getElementById(outputId).textContent = result;
}
</script>

---

**[← Back to Wildlander Wiki](https://wiki.wildlandermod.com/)**
