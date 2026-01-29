---
layout: home
title: Current Known Issues
nav_exclude: true
has_children: false
description: All Known Issues and Fixes
---

<style>
#clearFilters {
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

#clearFilters:hover {
  background-color: #f77ef1;
  color: #222222;
  border-color: #f77ef1;
}

#knownIssuesSearch,
#categoryFilter,
#statusFilter {
  padding: 8px 12px;
  background-color: #462b53;
  border: 2px solid #50098a;
  border-radius: 4px;
  color: #e6e6e6;
  font-size: 14px;
  font-family: inherit;
  min-width: 150px;
}

#knownIssuesSearch::placeholder {
  color: #999;
}

#knownIssuesSearch:focus,
#categoryFilter:focus,
#statusFilter:focus {
  outline: none;
  border-color: #f77ef1;
  box-shadow: 0 0 8px rgba(247, 126, 241, 0.3);
}

.known-issues-controls {
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

.filter-result-count {
  color: #f77ef1;
  font-size: 14px;
  font-weight: 500;
  padding-left: 10px;
}

.known-issues-table table tbody tr:hover {
  background-color: #3d2454;
  transition: background-color 0.2s ease;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  
function initKnownIssuesFilters() {
  const table = document.querySelector('.known-issues-table table');
  if (!table) {
    console.warn('Known Issues table not found');
    return;
  }
  
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const categories = new Set();
  const statuses = new Set();
  
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    if (cells.length >= 5) {
      categories.add(cells[1].textContent.trim());
      statuses.add(cells[4].textContent.trim());
    }
  });
  
  const categoryFilter = document.getElementById('categoryFilter');
  const statusFilter = document.getElementById('statusFilter');
  
  Array.from(categories).sort().forEach(cat => {
    const option = document.createElement('option');
    option.value = cat;
    option.textContent = cat;
    categoryFilter.appendChild(option);
  });
  
  Array.from(statuses).sort().forEach(status => {
    const option = document.createElement('option');
    option.value = status;
    option.textContent = status;
    statusFilter.appendChild(option);
  });
  
  document.getElementById('knownIssuesSearch').addEventListener('input', filterKnownIssuesTable);
  document.getElementById('categoryFilter').addEventListener('change', filterKnownIssuesTable);
  document.getElementById('statusFilter').addEventListener('change', filterKnownIssuesTable);
  
  initKnownIssuestooltips();
  updateFilterCount(rows.length, rows.length);
}

function initKnownIssuestooltips() {
  const table = document.querySelector('.known-issues-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  rows.forEach(row => {
    const idCell = row.querySelector('td:first-child');
    idCell.style.cursor = 'pointer';
    idCell.addEventListener('mouseenter', (e) => showKnownIssuestooltip(e, row));
    idCell.addEventListener('mouseleave', hideKnownIssuestooltip);
  });
}

function showKnownIssuestooltip(event, row) {
  const cells = row.querySelectorAll('td');
  const data = {
    id: cells[0]?.textContent || '',
    category: cells[1]?.textContent || '',
    summary: cells[2]?.textContent || '',
    description: cells[3]?.textContent || '',
    status: cells[4]?.textContent || '',
    investigation: cells[5]?.textContent || '',
    notes: cells[6]?.textContent || ''
  };
  
  let tooltip = document.getElementById('issue-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'issue-tooltip';
    tooltip.className = 'issue-tooltip';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = '<div><strong>ID:</strong> ' + data.id + '</div>' +
    '<div><strong>Category:</strong> ' + data.category + '</div>' +
    '<div><strong>Summary:</strong> ' + data.summary + '</div>' +
    '<div><strong>Description:</strong> ' + data.description + '</div>' +
    '<div><strong>Status:</strong> ' + data.status + '</div>' +
    '<div><strong>Investigation:</strong> ' + data.investigation + '</div>' +
    '<div><strong>Notes:</strong> ' + data.notes + '</div>';
  tooltip.style.display = 'block';
  tooltip.style.left = (event.clientX + 10) + 'px';
  tooltip.style.top = (event.clientY + 10) + 'px';
}

function hideKnownIssuestooltip() {
  const tooltip = document.getElementById('issue-tooltip');
  if (tooltip) tooltip.style.display = 'none';
}

function filterKnownIssuesTable() {
  const searchTerm = document.getElementById('knownIssuesSearch').value.toLowerCase();
  const categoryFilter = document.getElementById('categoryFilter').value;
  const statusFilter = document.getElementById('statusFilter').value;
  
  const table = document.querySelector('.known-issues-table table');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  
  let visibleCount = 0;
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const summary = cells[2]?.textContent.toLowerCase() || '';
    const description = cells[3]?.textContent.toLowerCase() || '';
    const notes = cells[6]?.textContent.toLowerCase() || '';
    const category = cells[1]?.textContent.trim() || '';
    const status = cells[4]?.textContent.trim() || '';
    
    const matchesSearch = summary.includes(searchTerm) || description.includes(searchTerm) || notes.includes(searchTerm);
    const matchesCategory = !categoryFilter || category === categoryFilter;
    const matchesStatus = !statusFilter || status === statusFilter;
    
    const isVisible = matchesSearch && matchesCategory && matchesStatus;
    row.style.display = isVisible ? '' : 'none';
    if (isVisible) visibleCount++;
  });
  
  updateFilterCount(visibleCount, rows.length);
}

function updateFilterCount(visible, total) {
  const counter = document.getElementById('filterResultCount');
  counter.textContent = `Showing ${visible} of ${total} issues`;
}

function clearKnownIssuesFilters() {
  document.getElementById('knownIssuesSearch').value = '';
  document.getElementById('categoryFilter').value = '';
  document.getElementById('statusFilter').value = '';
  filterKnownIssuesTable();
}

initKnownIssuesFilters();

});
</script>


<div class="known-issues-controls">
  <input type="text" id="knownIssuesSearch" placeholder="Search" />
  <select id="categoryFilter">
    <option value="">All Categories</option>
  </select>
  <select id="statusFilter">
    <option value="">All Status</option>
  </select>
  <button id="clearFilters" onclick="clearKnownIssuesFilters()">Clear Filters</button>
</div>
<div class="filter-result-count" id="filterResultCount"></div>

<div class="known-issues-table" markdown="1">

{% include KnownIssuesTable.md %}

</div>