$csvPath = 'DataFromAirtable/All Crafting Recipes-Alchemy Recipes.csv'
$outputFile = 'AlchemyRecipesTable.md'

$data = Import-Csv $csvPath

# Build markdown table
$md = @()
$md += '| Item Name | Qty | Components | Perks Needed | Proximity | Additional Requirements |'
$md += '|:---|:---:|:---|:---|:---|:---|'

foreach ($row in $data) {
  if ($row.'Item Name') {
    $itemName = $row.'Item Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $qty = $row.'Qty Made' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $components = $row.'Components' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $perks = $row.'Perks Needed' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $proximity = $row.'Proximity (When None)' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $addReq = $row.'Additional Requirements' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $itemName | $qty | $components | $perks | $proximity | $addReq |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) rows"
