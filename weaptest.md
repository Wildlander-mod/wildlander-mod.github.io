---
layout: default
title: Embedded sheet
nav_order: 1
description: "Wildlander Weapons Test."
permalink: /
has_toc: true
---


<div id="json"></div>


<script>

var id = '1Xp1LE79R4uHC2yP7KkA2p1sS-l_TkaRAQfdHV4t0aOM';
var gid = '0';
var url = 'https://docs.google.com/spreadsheets/d/'+id+'/gviz/tq?tqx=out:json&tq&gid='+gid;

fetch(url)
  .then(response => response.text())
  .then(data => document.getElementById("json").innerHTML=myItems(data.substring(47).slice(0, -2))  
  );
  
function myItems(jsonString){
  var json = JSON.parse(jsonString);
  var table = '<table><tr>'
  json.table.cols.forEach(colonne => table += '<th>' + colonne.label + '</th>')
  table += '</tr>'
  json.table.rows.forEach(ligne => {
    table += '<tr>'
    ligne.c.forEach(cellule => {
        try{var valeur = cellule.f ? cellule.f : cellule.v}
        catch(e){var valeur = ''}
        table += '<td>' + valeur + '</td>'
      }
    )
    table += '</tr>'
    }
  )
  table += '</table>'
  return table
} 
</script>
