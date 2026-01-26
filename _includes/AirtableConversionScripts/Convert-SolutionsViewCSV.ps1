$csvPath = 'DataFromAirtable/Solutions View.csv'
$outputFile = 'SolutionsViewTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Solution | Base Ingredient | Primary Effect | Archetypes | Rank |'
$md += '|:---|:---|:---|:---|---:|'

foreach ($row in $data) {
  if ($row.'Name') {
    $name = $row.'Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $baseIng = $row.'Base' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $effect = $row.'Effect' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $archs = $row.'ArchType' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $rank = $row.'Rank' -replace '\|', '\|'
    
    $md += "| $name | $baseIng | $effect | $archs | $rank |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Converted Solutions view to $outputFile. Total rows: $($data.Count)"
