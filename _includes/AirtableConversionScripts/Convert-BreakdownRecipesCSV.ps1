# Convert Breakdown Recipes CSV to Markdown Table
$csvPath = 'DataFromAirtable/All Crafting Recipes-Breakdown.csv'
$outputFile = 'BreakdownRecipesTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Produced Item Name | Qty Made | Perks Needed | Items Required |'
$md += '|:---|:---:|:---|:---|'

foreach ($row in $data) {
  if ($row.'Produced Item Name') {
    $itemName = $row.'Produced Item Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $qtyMade = $row.'Qty Made' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $perksNeeded = $row.'Perks Needed' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $itemsRequired = $row.'Items Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $itemName | $qtyMade | $perksNeeded | $itemsRequired |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) rows"
