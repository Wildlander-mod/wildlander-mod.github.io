# Convert Airtable Current Modlist CSV to Markdown Table
# Usage: From _includes/ folder, run: .\AirtableConversionScripts\Convert-ModlistCSV.ps1

$csv = Import-Csv "DataFromAirtable\Current Mod list.csv"
$output = @()
$output += "| Group | MO2 Name | Version | Nexus Mod Name | Category | Author | Nexus URL |"
$output += "|-------|----------|---------|----------------|----------|--------|-----------|"

foreach ($row in $csv) {
  $group = $row.'Group' -replace '\|', '\|'
  $mo2Name = ($row.'Mo2 Name' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $version = $row.'Version' -replace '\|', '\|'
  $nexusModName = ($row.'Nexus Mod Name' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $category = $row.'Category' -replace '\|', '\|'
  $author = ($row.'Author' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $nexusUrl = $row.'Nexus URL' -replace '\|', '\|'
  
  if ($mo2Name) {
    $output += "| $group | $mo2Name | $version | $nexusModName | $category | $author | $nexusUrl |"
  }
}

$output | Out-File -Encoding UTF8 "ModlistTable.md"
$rowCount = $csv | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "Updated markdown table with $rowCount rows"
