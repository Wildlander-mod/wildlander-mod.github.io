$csvPath = 'DataFromAirtable/Armor.csv'
$outputFile = 'ArmorTable.md'

$data = Import-Csv $csvPath
$md = @()

# Create table header with AR abbreviation explanation
$md += '| Type | Set Name | Full Set AR* | Set Wt | Ranged AR | Pierce AR | Blunt AR | Slash AR | Chest AR | Helmet AR | Gloves AR | Boots AR | Shield AR | Ranged Tier | Blunt Tier | Pierce Tier | Slash Tier |'
$md += '|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|:---:|:---:|:---:|:---:|'

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
    $chestAR = $row.'Chest Armor Resistance' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $helmetAR = $row.'Helmet Armor Resistance' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $glovesAR = $row.'Gloves Armor Resistance' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $bootsAR = $row.'Boots Armor Resistance' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $shieldAR = $row.'Shield Armor Resistance' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $rangedTier = $row.'Ranged Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $bluntTier = $row.'Blunt Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $pierceTier = $row.'Pierce Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $slashTier = $row.'Slash Tier' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    $md += "| $type | $setName | $fullSetAR | $setWeight | $rangedAR | $pierceAR | $bluntAR | $slashAR | $chestAR | $helmetAR | $glovesAR | $bootsAR | $shieldAR | $rangedTier | $bluntTier | $pierceTier | $slashTier |"
  }
}

$md | Out-File $outputFile -Encoding UTF8
Write-Host "Generated $outputFile with $($data.Count) armor sets"
