# Convert Airtable Current Modlist CSV to Markdown Table
# Usage: From _includes/ folder, run: .\AirtableConversionScripts\Convert-ModlistCSV.ps1

$csv = Import-Csv "DataFromAirtable\Current Mod list.csv"
$output = @()
$output += "| Group | MO2 Name | Lookup URL | Version | Nexus URL | Nexus Mod Name | Category | Author | Author URL | Kofi | Paypal | Patreon |"
$output += "|-------|----------|-----------|---------|-----------|----------------|----------|--------|-----------|------|--------|---------|"

foreach ($row in $csv) {
  $group = $row.'Group' -replace '\|', '\|'
  $mo2Name = ($row.'Mo2 Name' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $lookupUrl = ($row.'Lookup URL' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $version = $row.'Version' -replace '\|', '\|'
  $nexusUrl = $row.'Nexus URL' -replace '\|', '\|'
  $nexusModName = ($row.'Nexus Mod Name' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $category = $row.'Category' -replace '\|', '\|'
  $author = ($row.'Author' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $authorUrl = ($row.'Author URL' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $kofi = ($row.'Kofi' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $paypal = ($row.'Paypal' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $patreon = ($row.'Patreon' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  
  if ($mo2Name) {
    $output += "| $group | $mo2Name | $lookupUrl | $version | $nexusUrl | $nexusModName | $category | $author | $authorUrl | $kofi | $paypal | $patreon |"
  }
}

$output | Out-File -Encoding UTF8 "ModlistTable.md"
$rowCount = $csv | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "Updated markdown table with $rowCount rows"
