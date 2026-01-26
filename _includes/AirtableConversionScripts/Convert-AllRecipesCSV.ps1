$csvPath = 'DataFromAirtable/All Crafting Recipes-All recipes.csv'
$outputFile = 'AllRecipesTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Item Name | Qty Made | Perks Needed | Proximity | Items Required | Additional Requirements |'
$md += '|:---|:---:|:---|:---:|:---|:---|'

foreach ($row in $data) {
  if ($row.'Produced Item Name') {
    $itemName = $row.'Produced Item Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $qtyMade = $row.'Qty Made' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $perksNeeded = $row.'Perks Needed' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $proximity = $row.'Proximity (When None)' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $itemsRequired = $row.'Items Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $additionalRequirements = $row.'Additional Requirements' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $itemName | $qtyMade | $perksNeeded | $proximity | $itemsRequired | $additionalRequirements |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Converted All Recipes to $outputFile. Total rows: $($data.Count)"
