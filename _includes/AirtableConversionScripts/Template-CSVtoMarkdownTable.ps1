# Template: Convert Airtable CSV Export to Markdown Table
# 
# USAGE:
# 1. Customize variables below for your Airtable table
# 2. Save CSV export to: _includes/DataFromAirtable/[YourTableName].csv
# 3. Run from _includes/ folder: .\AirtableConversionScripts\Template-CSVtoMarkdownTable.ps1
#
# CUSTOMIZATION VARIABLES:

$csvPath = "DataFromAirtable\Your-Table-Name.csv"      # Path to CSV export
$outputFile = "YourTableNameMarkdown.md"               # Output markdown file name
$columnHeaders = @(                                     # CSV column names to extract (in order)
    'ColumnName1',
    'ColumnName2',
    'ColumnName3'
)
$tableHeaderRow = "| Column 1 | Column 2 | Column 3 |" # Markdown table header
$tableSeparator = "|----------|----------|----------|" # Separator row (one dash per column)

# SCRIPT (DO NOT MODIFY):

$csv = Import-Csv $csvPath
$output = @()
$output += $tableHeaderRow
$output += $tableSeparator

foreach ($row in $csv) {
  $cells = @()
  
  foreach ($col in $columnHeaders) {
    $value = $row.$col
    # Standard replacements:
    # - Replace newlines with spaces (multiline cells to single line)
    # - Escape pipe characters (prevents markdown table syntax conflicts)
    $value = $value -replace '\n', ' ' -replace '\r', ' ' -replace '\|', '\|'
    $cells += $value
  }
  
  # Only output rows where the first column is not empty
  if ($cells[0]) {
    $output += "| " + ($cells -join " | ") + " |"
  }
}

$output | Out-File -Encoding UTF8 $outputFile
$rowCount = $csv | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "Updated $outputFile with $rowCount rows"
