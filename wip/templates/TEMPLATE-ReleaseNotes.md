---
layout: default
title: Release Notes - V[VERSION]
nav_exclude: true
description: Release notes - Wildlander - Version [VERSION]
---

## Wildlander V[VERSION] Release Notes

Detailed list of all bug fixes, changes, and resolutions for Wildlander V[VERSION].

[OPTIONAL: Insert YouTube embed if available]
```html
<iframe class="yt-embed" width="560" height="315" src="[YOUTUBE_URL]" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```

---

<style>
.release-notes-controls {
  display: flex;
  gap: 10px;
  align-items: center;
  margin-bottom: 15px;
  flex-wrap: wrap;
}

#releaseNotesSearch,
#labelFilter {
  padding: 8px 12px;
  background-color: #462b53;
  border: 2px solid #50098a;
  border-radius: 4px;
  color: #e6e6e6;
  font-size: 14px;
  font-family: inherit;
}

#releaseNotesSearch {
  min-width: 300px;
}

#releaseNotesSearch::placeholder {
  color: #999;
}

#releaseNotesSearch:focus,
#labelFilter:focus {
  outline: none;
  border-color: #f77ef1;
  box-shadow: 0 0 8px rgba(247, 126, 241, 0.3);
}

button {
  padding: 8px 16px;
  background-color: #50098a;
  border: 2px solid #50098a;
  border-radius: 4px;
  color: #e6e6e6;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.2s;
}

button:hover {
  background-color: #f77ef1;
  border-color: #f77ef1;
  color: #000;
}

#filterResultCount {
  color: #e6e6e6;
  font-size: 14px;
}

.release-notes-table table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.release-notes-table th {
  background-color: #50098a;
  color: #e6e6e6;
  padding: 12px;
  text-align: left;
  font-weight: bold;
}

.release-notes-table td {
  padding: 10px 12px;
  border-bottom: 1px solid #444;
}

.release-notes-table tbody tr:nth-child(odd) {
  background-color: #2a2a2a;
}

.release-notes-table tbody tr:nth-child(even) {
  background-color: #333;
}

.release-notes-table tbody tr:hover {
  background-color: #3d2454;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

function initReleaseNotesFilters() {
  const table = document.querySelector('.release-notes-table table');
  if (!table) {
    console.warn('Release Notes table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const labels = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 4) {
      const labelText = cells[3].textContent.trim();
      if (labelText && labelText !== 'Labels') {
        labelText.split(';').forEach(label => labels.add(label.trim()));
      }
    }
  });
  
  const labelFilter = document.getElementById('labelFilter');
  Array.from(labels).sort().forEach(label => {
    const option = document.createElement('option');
    option.value = label;
    option.textContent = label;
    labelFilter.appendChild(option);
  });
  
  document.getElementById('releaseNotesSearch').addEventListener('input', filterReleaseNotesTable);
  labelFilter.addEventListener('change', filterReleaseNotesTable);
  
  updateReleaseNotesResultCount();
}

function filterReleaseNotesTable() {
  const table = document.querySelector('.release-notes-table table');
  if (!table) return;
  
  const searchTerm = document.getElementById('releaseNotesSearch').value.toLowerCase();
  const labelFilter = document.getElementById('labelFilter').value;
  
  const rows = table.querySelectorAll('tbody tr');
  let visibleCount = 0;
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length < 4) {
      row.style.display = 'none';
      return;
    }
    
    const key = cells[0].textContent.toLowerCase();
    const summary = cells[1].textContent.toLowerCase();
    const resolution = cells[2].textContent.toLowerCase();
    const labels = cells[3].textContent;
    
    const matchesSearch = !searchTerm || 
                         key.includes(searchTerm) ||
                         summary.includes(searchTerm) ||
                         resolution.includes(searchTerm);
    
    const matchesLabel = !labelFilter || labels.includes(labelFilter);
    
    const isVisible = matchesSearch && matchesLabel;
    row.style.display = isVisible ? '' : 'none';
    
    if (isVisible) visibleCount++;
  });
  
  updateReleaseNotesResultCount(visibleCount, rows.length);
}

function updateReleaseNotesResultCount(visible, total) {
  const table = document.querySelector('.release-notes-table table');
  if (!table) return;
  
  if (visible === undefined) {
    visible = Array.from(table.querySelectorAll('tbody tr')).filter(row => row.style.display !== 'none').length;
    total = table.querySelectorAll('tbody tr').length;
  }
  
  const countElement = document.getElementById('filterResultCount');
  if (countElement) {
    countElement.textContent = 'Showing ' + visible + ' of ' + total + ' issues';
  }
}

function clearReleaseNotesFilters() {
  document.getElementById('releaseNotesSearch').value = '';
  document.getElementById('labelFilter').value = '';
  filterReleaseNotesTable();
}

initReleaseNotesFilters();

});
</script>

## Release Summary

<div class="release-notes-controls">
  <input type="text" id="releaseNotesSearch" placeholder="Search Release Notes..." />
  <select id="labelFilter">
    <option value="">All Labels</option>
  </select>
  <button onclick="clearReleaseNotesFilters()">Clear Filters</button>
  <div id="filterResultCount"></div>
</div>

<div class="release-notes-table" markdown="1">

| Key | Summary | Resolution | Labels |
|-----|---------|-----------|--------|
| [TICKET-1] | [Brief issue title] | [How it was fixed/resolved] | [Category label] |
| [TICKET-2] | [Brief issue title] | [How it was fixed/resolved] | [Category label] |
| [TICKET-3] | [Brief issue title] | [How it was fixed/resolved] | [Category label] |

</div>

---

## Installation & Updates

[Include any special installation steps or compatibility notes for this version]

### Prerequisites
- [List any requirements]

### Update Notes
[Any special instructions for updating from previous versions]

---

## Known Issues

[If applicable, document any known issues that weren't fixed in this release]

---

## Contributors & Credits

[Acknowledge team members and external contributors for this release]

---

## Version History

[Optional: Link to previous versions or release notes]
- [V1.1.5 Release Notes](https://wiki.wildlandermod.com/14ModlistVersions/V1-1-5/)
- [V1.1.4 Release Notes](https://wiki.wildlandermod.com/14ModlistVersions/V1-1-4/)

