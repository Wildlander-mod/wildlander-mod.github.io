$csvPath = 'DataFromAirtable/Effects view.csv'
$outputFile = 'EffectsViewTable.md'

$data = Import-Csv $csvPath

$md = @()
$md += '| Effect | Archetypes |'
$md += '|:---|:---|'

foreach ($row in $data) {
  if ($row.Effect) {
    $effect = $row.Effect -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $archetypes = $row.Archtypes -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $md += "| $effect | $archetypes |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Converted Effects view to $outputFile. Total rows: $($data.Count)"
