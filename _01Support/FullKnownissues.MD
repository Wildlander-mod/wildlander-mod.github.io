---
layout: home
title: Current Known Issues
nav_exclude: true
has_children: false
description: All Known Issues and Fixes
---



<div class="known-issues-controls">
  <input type="text" id="knownIssuesSearch" placeholder="Search" />
  <select id="categoryFilter">
    <option value="">All Categories</option>
  </select>
  <select id="statusFilter">
    <option value="">All Status</option>
  </select>
</div>
<div class="filter-result-count" id="filterResultCount"></div>

<div class="known-issues-table" markdown="1">

{% include KnownIssuesTable.md %}

</div>