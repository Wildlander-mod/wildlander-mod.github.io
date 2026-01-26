$csvPath = 'DataFromAirtable/Spells & Archetypes.csv'
$outputFile = 'SpellsViewTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Spell | School | Spell Level | Cast Type | Target | Tome Crafting | Scroll Crafting | Notes |'
$md += '|:---|:---|:---:|:---|:---|:---|:---|:---|'

foreach ($row in $data) {
  if ($row.'Spell') {
    $spell = $row.'Spell' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $school = $row.'School' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $level = $row.'Spell Level' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $cast = $row.'Cast Type' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $target = $row.'Target' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $tome = $row.'Tome Crafting' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $scroll = $row.'Scroll Crafting' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $notes = $row.'Notes' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $spell | $school | $level | $cast | $target | $tome | $scroll | $notes |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $(($md.Count - 2)) data rows"
