$csvPath = 'DataFromAirtable/Armor.csv'
$outputFile = 'ArmorTable.md'

$data = Import-Csv $csvPath
$md = @()

# Create table header - removed individual piece AR columns (Chest/Helmet/Gloves/Boots/Shield)
# Kept: Type, Set Name, Full Set AR, Set Wt, Ranged/Pierce/Blunt/Slash AR, and Tier columns
$md += '| Type | Set Name | Full Set AR* | Set Wt | Ranged AR | Pierce AR | Blunt AR | Slash AR | Ranged Tier | Blunt Tier | Pierce Tier | Slash Tier |'
$md += '|:---|:---|---:|---:|---:|---:|---:|---:|:---:|:---:|:---:|:---:|'

foreach ($row in $data) {
  if ($row.Type) {
    $type = $row.Type -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $setName = $row.'Set Name' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    # Get the "Full set AR*" column - it has a newline in the header
    $fullSetARKey = $row.PSObject.Properties.Name | Where-Object { $_ -match 'Full set' }
    $fullSetAR = if ($fullSetARKey) { $row.$fullSetARKey -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' ' } else { '' }
    $setWeight = $row.'Set Total weight' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $rangedAR = $row.'Ranged AR' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $pierceAR = $row.'Pierce AR' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $bluntAR = $row.'Blunt AR' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $slashAR = $row.'Slash AR' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $rangedTier = $row.'Ranged Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $bluntTier = $row.'Blunt Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $pierceTier = $row.'Pierce Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $slashTier = $row.'Slash Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    # Only include the 12 columns (removed Chest/Helmet/Gloves/Boots/Shield AR)
    $md += "| $type | $setName | $fullSetAR | $setWeight | $rangedAR | $pierceAR | $bluntAR | $slashAR | $rangedTier | $bluntTier | $pierceTier | $slashTier |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) armor sets"
