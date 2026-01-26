$csvPath = 'DataFromAirtable/Ingridient View.csv'
$outputFile = 'IngredientsViewTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Ingredient | Weight | Base Solutions | Value | Effects |'
$md += '|:---|---:|:---|---:|:---|'

foreach ($row in $data) {
  if ($row.'Name') {
    $name = $row.'Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $weight = $row.'Weight' -replace '\|', '\|'
    $baseSolutions = $row.'Base Solutions' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $value = $row.'Value' -replace '\|', '\|'
    $effects = $row.'Effects' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $name | $weight | $baseSolutions | $value | $effects |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Converted Ingredients view to $outputFile. Total rows: $($data.Count)"
