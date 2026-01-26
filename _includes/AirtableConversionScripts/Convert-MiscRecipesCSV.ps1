# Convert Misc Recipes CSV to Markdown Table
$csvPath = 'DataFromAirtable/All Crafting Recipes-Misc Recipes.csv'
$outputFile = 'MiscRecipesTable.md'

# Import CSV
$data = Import-Csv $csvPath

# Create markdown table
$md = @()
$md += '| Item Name | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required | Additional Requirements |'
$md += '|:---|:---:|:---|:---|:---|:---|:---|'

foreach ($row in $data) {
  if ($row.'Produced Item Name') {
    $itemName = $row.'Produced Item Name' -replace '\|', '\|'
    $qtyMade = $row.'Qty Made'
    $perksNeeded = $row.'Perks Needed' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $toolkits = $row.'Toolkits Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $proximity = $row.'Proximity (When None)' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $itemsRequired = $row.'Items Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $additional = $row.'Additional Requirements' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $itemName | $qtyMade | $perksNeeded | $toolkits | $proximity | $itemsRequired | $additional |"
  }
}

# Write to file
$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) rows"
