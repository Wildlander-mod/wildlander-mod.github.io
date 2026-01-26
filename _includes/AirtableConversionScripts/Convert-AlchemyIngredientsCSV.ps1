$csvPath = 'DataFromAirtable/Alchemy - Collected.csv'
$outputFile = 'AlchemyIngredientsTable.md'

$data = Import-Csv $csvPath

# Build markdown table
$md = @()
$md += '| Ingredient | Effect | Magnitude | Duration | Description | Category |'
$md += '|:---|:---|:---:|:---:|:---|:---|'

foreach ($row in $data) {
  if ($row.'Ingredient') {
    $ingredient = $row.'Ingredient' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $effect = $row.'Effect' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $magnitude = $row.'Magnitude' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $duration = $row.'Duration' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $description = $row.'Description' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $category = $row.'Category' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $ingredient | $effect | $magnitude | $duration | $description | $category |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) rows"
