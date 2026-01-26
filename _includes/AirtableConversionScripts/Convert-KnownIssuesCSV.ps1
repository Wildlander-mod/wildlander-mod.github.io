# Convert Airtable Known Issues CSV to Markdown Table
# Usage: From _includes/ folder, run: .\AirtableConversionScripts\Convert-KnownIssuesCSV.ps1

$csv = Import-Csv "DataFromAirtable\Known Issues 2-Grid view.csv"
$output = @()
$output += "| ID | Category | Summary | Description | Status | Investigation | Notes |"
$output += "|----------|----------|---------|-------------|--------|-----------------|-------|"

foreach ($row in $csv) {
  $issueId = ($row.'Issue ID' -split ' - ')[0] -replace '\|', '\|'
  $category = $row.'Our Category' -replace '\|', '\|'
  $summary = ($row.'Summary' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $description = ($row.'Description' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $status = $row.'Status' -replace '\|', '\|'
  $investigation = ($row.'Investigation' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  $notes = ($row.'Notes for Known Issues' -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|')
  
  if ($issueId) {
    $output += "| $issueId | $category | $summary | $description | $status | $investigation | $notes |"
  }
}

$output | Out-File -Encoding UTF8 "KnownIssuesTable.md"
$rowCount = $csv | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "Updated markdown table with $rowCount rows"
