$csvPath = 'DataFromAirtable/Elixirs Chear sheet.csv'
$outputFile = 'ElixirsViewTable.md'

$data = Import-Csv $csvPath
$md = @()
$md += '| Elixir Name | Effect | Required Solutions | Magnitude | Duration | Strength |'
$md += '|:---|:---|:---|:---:|:---:|:---:|'

foreach ($row in $data) {
  if ($row.'Default name') {
    $name = $row.'Default name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $effect = $row.'Effect' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $ingred = $row.'1.1.11 Ingredients' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $mag = $row.'Magnitude' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $dur = $row.'Duration' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $str = $row.'Strength' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $name | $effect | $ingred | $mag | $dur | $str |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $(($md.Count - 2)) data rows"
