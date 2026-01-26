$csvPath = 'DataFromAirtable/All Crafting Recipes-Tailor Recipes.csv'
$outputFile = 'TailorRecipesTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Produced Item | Qty | Perks Needed | Proximity | Items Required | Additional Requirements |'
$md += '|:---|:---:|:---|:---:|:---|:---|'

foreach ($row in $data) {
  if ($row.'Produced Item Name') {
    $item = $row.'Produced Item Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $qty = $row.'Qty Made' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $perks = $row.'Perks Needed' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $proximity = $row.'Proximity (When None)' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $items = $row.'Items Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $additional = $row.'Additional Requirements' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $item | $qty | $perks | $proximity | $items | $additional |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Converted Tailor Recipes to $outputFile"
Write-Host "Total rows: $($md.Count - 2)"
