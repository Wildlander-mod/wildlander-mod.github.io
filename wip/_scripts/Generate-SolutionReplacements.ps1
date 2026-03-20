# Generate Solutions-View.md replacement pairs
# Converts old Ayleid names to new Alchemical Solution format

param(
    [string]$FilePath = "c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\Solutions-View.md",
    [string]$OutputFile = "c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\solution-replacements.txt"
)

# Archetype mapping (Ayleid name -> Archetype)
$archetypeMap = @{
    "Agea" = "Magicka"
    "Agea Arden" = "Resistances"
    "Aka ry Relleis" = "Time"
    "Altadoon" = "Weapons"
    "Altadoon ry Bet" = "Diseases"
    "Arden" = "Shield"
    "Ayammis" = "Life"
    "Ayammis Malata" = "Souls"
    "Bal" = "Earth"
    "Betaltadoon" = "Poisons"
    "Betayammis" = "Creatures"
    "Dunayammis" = "Undead"
    "Dunruhn" = "Trap"
    "Ghartok" = "Stamina"
    "Karan" = "Armor"
    "Karan Kogo" = "Force"
    "Karen Kogo" = "Force"
    "Karan ry Ayammis" = "Health"
    "Latta" = "Light"
    "Latta Loria" = "Shadow"
    "Mafre" = "Frost"
    "Mallari" = "Metal"
    "Malatu Magicka" = "Arcane Energy"
    "Mer Ayammis" = "Mortals"
    "Mer ry Wel" = "Apparitions"
    "Mer Garlas" = "Flesh"
    "Molag" = "Fire"
    "Mora" = "Nature"
    "Pellenni Ayammis" = "Daedra"
    "Relleis" = "Water"
    "Rellers ry Molag" = "Acid"
    "Varla ye Wel" = "Sun"
    "Volen Magicka" = "Magical Constructs"
    "Wel" = "Air"
    "Wel sa Belle" = "Shock"
}

# Strength mapping (suffix -> strength name)
$strengthMap = @{
    "sa Haelia" = "Diluted"
    "sa Goria" = "Weak"
    "sa Gravia" = "Mild"
    "sa Baune" = "Strong"
    "sa Adonai" = "Potent"
    "sa Sila" = "Concentrated"
}

# Read the file
$content = Get-Content -Path $FilePath -Raw

# Extract all solution names from the table (lines that aren't headers and are within the table)
# Pattern: | [Solution Name] | ... |
$lines = $content -split "`n"

$solutions = @()
$inTable = $false
$replacements = @()

foreach ($line in $lines) {
    # Skip until we find the table header
    if ($line -match "^\| Solution \| Base Ingredient") {
        $inTable = $true
        continue
    }
    
    # Stop when we hit the closing div
    if ($line -eq "</div>" -and $inTable) {
        $inTable = $false
        break
    }
    
    # Process table rows
    if ($inTable -and $line.StartsWith("|")) {
        # Skip separator rows
        if ($line -match "^\|\s*:?---") {
            continue
        }
        
        # Extract solution name from first cell
        # Pattern: "| Solution Name | ..."
        $match = $line -match "^\|\s*(.+?)\s*\|\s*"
        if ($match) {
            $solutionRaw = $matches[1].Trim()
            
            # Skip if it's a header
            if ($solutionRaw -eq "Solution") {
                continue
            }
            
            # Skip empty rows
            if ([string]::IsNullOrWhiteSpace($solutionRaw)) {
                continue
            }
            
            # Extract the Ayleid name and strength suffix
            # Pattern: "Ayleid Name sa StrengthSuffix   (Archetype)"
            $trimmed = $solutionRaw -replace '\s+', ' '
            
            Write-Host "Processing: $trimmed" -ForegroundColor Yellow
            
            # Try to extract (Archetype) from the end
            $archetypeMatch = $trimmed -match '(.+?)\s*\((.+?)\)\s*$'
            if ($archetypeMatch) {
                $nameAndStrength = $matches[1].Trim()
                $archetypeInParen = $matches[2].Trim()
                
                # Now parse the Ayleid name and strength
                # Look for "sa " as the separator
                $saMatch = $nameAndStrength -match '^(.+?)\s+(sa\s+\w+)\s*$'
                if ($saMatch) {
                    $ayeleidName = $matches[1].Trim()
                    $strengthSuffix = $matches[2].Trim()
                    
                    # Look up the archetype from our map
                    $archetype = $null
                    foreach ($key in $archetypeMap.Keys) {
                        if ($ayeleidName -eq $key) {
                            $archetype = $archetypeMap[$key]
                            break
                        }
                    }
                    
                    # Look up the strength from our map
                    $strength = $strengthMap[$strengthSuffix]
                    
                    if ($archetype -and $strength) {
                        $newName = "Alchemical Solution of $archetype ($strength)"
                        $replacement = "$solutionRaw | $newName"
                        $replacements += $replacement
                        Write-Host "  -> $newName" -ForegroundColor Green
                    } else {
                        Write-Host "  ERROR: Could not map" -ForegroundColor Red
                        Write-Host "    Ayleid: $ayeleidName (found: $archetype)" -ForegroundColor Red
                        Write-Host "    Strength: $strengthSuffix (found: $strength)" -ForegroundColor Red
                    }
                }
            }
        }
    }
}

# Remove duplicates and sort
$uniqueReplacements = $replacements | Select-Object -Unique | Sort-Object

# Write output
Write-Host "`n=== SUMMARY ===" -ForegroundColor Cyan
Write-Host "Total unique replacements: $($uniqueReplacements.Count)" -ForegroundColor Cyan

# Output to file
$uniqueReplacements | Out-File -FilePath $OutputFile -Encoding UTF8

Write-Host "Output saved to: $OutputFile" -ForegroundColor Green
Write-Host "`nFirst 10 replacements:" -ForegroundColor Cyan
$uniqueReplacements | Select-Object -First 10 | ForEach-Object { Write-Host $_ }
