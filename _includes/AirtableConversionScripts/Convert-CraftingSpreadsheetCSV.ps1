# Convert All Crafting Recipes CSV to Markdown Table with all 8 columns
# Run from _includes directory

$csvPath = 'DataFromAirtable/All Crafting Recipes-All recipes.csv'
$outputFile = 'CraftingSpreadsheetTable.md'

$data = Import-Csv $csvPath

$md = @()
$md += '| Produced Item Name | Crafting Workbench | Qty Made | Perks Needed | Toolkits Required | Proximity | Items Required | Additional Requirements |'
$md += '|:---|:---|:---:|:---|:---|:---|:---|:---|'

foreach ($row in $data) {
  if ($row.'Produced Item Name') {
    $itemName = $row.'Produced Item Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $workbench = $row.'Crafting WorkBench' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $qtyMade = $row.'Qty Made' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $perks = $row.'Perks Needed' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $toolkits = $row.'Toolkits Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $proximity = $row.'Proximity (When None)' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $items = $row.'Items Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $additional = $row.'Additional Requirements' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $itemName | $workbench | $qtyMade | $perks | $toolkits | $proximity | $items | $additional |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($md.Count - 2) data rows"
