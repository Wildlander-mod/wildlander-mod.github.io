$csvPath = 'DataFromAirtable/Alchemy Ing Effects.csv'
$outputFile = 'AlchemyIngredientEffectsTable.md'

$data = Import-Csv $csvPath
$md = @()

# Create table header
$md += '| Ingredient | Effect | Magnitude | Duration |'
$md += '|:---|:---|---:|---:|'

foreach ($row in $data) {
  if ($row.Ingredient) {
    $ingredient = $row.Ingredient -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $description = $row.Description -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $magnitude = $row.Magnitude -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $duration = $row.Duration -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $ingredient | $description | $magnitude | $duration |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) ingredients"
