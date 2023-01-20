---
layout: default
title: Weapons
nav_order: 2
has_toc: true
has_children: false

---

# Weapons

<a class="btn btn-pink" href="https://docs.google.com/spreadsheets/d/1Xp1LE79R4uHC2yP7KkA2p1sS-l_TkaRAQfdHV4t0aOM/edit#gid=0" target="_blank" rel="noopener noreferrer">Direct link <svg viewBox="0 0 24 24" aria-labelledby="svg-external-link-title" width="1em" height="1em"><use xlink:href="#svg-external-link"></use></svg></a>


<input type="text" id="myInputBox" onkeyup="FilterTable()" placeholder="Search for names.." >


FULL Name|Base Damage (excluding perks)|Value|Weight|Time Per Swing (Seconds)|Reach|Damage Per Second (Not including Enchants)
--|--|--|--|--|--|--|
Aegisbane|114|60|24|0.6|0.91|68
Aetherial Staff|0|1250|8|1|1.3|0
Akaviri Katana|66|315|10|1|0.7|66
Alessandra's Dagger|24|10|2|1.3|0.49|31
Alik'ri Fishing Rod|24|75|2|1.2|0.7|29
{: #FilterTable }

<script>
function FilterTable(){
// Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("FilterTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>