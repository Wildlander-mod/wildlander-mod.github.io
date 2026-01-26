# Convert Ammunition CSV to Markdown Table
$csvPath = 'DataFromAirtable/All Crafting Recipes-Ammunition.csv'
$outputFile = 'AmmunitionTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Produced Item Name | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required | Additional Requirements |'
$md += '|:---|:---:|:---|:---|:---|:---|:---|'

foreach ($row in $data) {
  if ($row.'Produced Item Name') {
    $itemName = $row.'Produced Item Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $qtyMade = $row.'Qty Made' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $perksNeeded = $row.'Perks Needed' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $toolkitsRequired = $row.'Toolkits Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $proximity = $row.'Proximity (When None)' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $itemsRequired = $row.'Items Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $additionalRequirements = $row.'Additional Requirements' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $itemName | $qtyMade | $perksNeeded | $toolkitsRequired | $proximity | $itemsRequired | $additionalRequirements |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) rows"
