
<# Generate elixir name mappings from R4 JSON files
   Maps old wiki names to new R4 elixir names
#>

param(
    [string]$InputDir = "i:\Wildlander Core R4\Ingredients",
    [string]$OutputFile = "c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\elixir-replacements.txt"
)

# Strength level mapping
$strengthMap = @{
    0 = "Dilute"
    1 = "Weak"
    2 = "Mild"
    3 = "Strong"
    4 = "Potent"
    5 = "Concentrated"
}

# Strength prefix in new names
$strengthPrefixMap = @{
    0 = "Diluted"
    1 = "Weak"
    2 = "Mild"
    3 = "Strong"
    4 = "Potent"
    5 = "Concentrated"
}

# Parse effect name from editor ID (e.g., "_SR_IngrCureDisease0" -> "CureDisease")
function Get-EffectNameFromEditorID {
    param([string]$EditorID)
    
    # Remove prefix "_SR_Ingr" and the strength number at end
    $match = [regex]::Match($EditorID, '_SR_Ingr(.+)([0-5])$')
    if ($match.Success) {
        return $match.Groups[1].Value
    }
    return $null
}

# Extract strength level from editor ID (last digit 0-5)
function Get-StrengthFromEditorID {
    param([string]$EditorID)
    
    $match = [regex]::Match($EditorID, '([0-5])$')
    if ($match.Success) {
        [int]$strength = $match.Groups[1].Value
        return $strength
    }
    return $null
}

# Convert camelCase effect name to space-separated (e.g., "CureDisease" -> "Cure Disease")
function Format-EffectName {
    param([string]$EffectName)
    
    # Insert space before capital letters (except the first one)
    $formatted = [regex]::Replace($EffectName, '(?<!^)([A-Z])', ' $1')
    return $formatted
}

# Read all _SR_Ingr JSON files
$jsonFiles = Get-ChildItem -Path $InputDir -Filter "_SR_Ingr*.json" | Sort-Object Name

Write-Host "Found $($jsonFiles.Count) elixir JSON files"

$mappings = @()
$errorCount = 0

foreach ($file in $jsonFiles) {
    try {
        $json = Get-Content -Path $file.FullName -Raw | ConvertFrom-Json
        
        $editorID = $json.EditorID
        $newName = $json.Name.Value
        
        $effectName = Get-EffectNameFromEditorID -EditorID $editorID
        $strength = Get-StrengthFromEditorID -EditorID $editorID
        
        if ($effectName -and $null -ne $strength) {
            $formattedEffectName = Format-EffectName -EffectName $effectName
            $strengthWord = $strengthMap[$strength]
            
            # Old format: "Effect Name (Strength)"
            $oldName = "$formattedEffectName ($strengthWord)"
            
            $mappings += @{
                OldName = $oldName
                NewName = $newName
                EditorID = $editorID
                EffectName = $effectName
                Strength = $strength
            }
        }
    }
    catch {
        $errorCount++
        Write-Warning "Error processing $($file.Name): $_"
    }
}

Write-Host "Processed $($mappings.Count) elixirs with $errorCount errors"

# Sort by effect name, then by strength
$mappings = $mappings | Sort-Object { $_.EffectName }, { $_.Strength }

# Write output file
$outputContent = "Old Name | New Name`n"
$outputContent += ("=" * 80) + "`n"

foreach ($mapping in $mappings) {
    $outputContent += "$($mapping.OldName) | $($mapping.NewName)`n"
}

Set-Content -Path $OutputFile -Value $outputContent -Encoding UTF8

Write-Host "Mapping file created: $OutputFile"
Write-Host "Total elixirs mapped: $($mappings.Count)"

# Display sample output
Write-Host "`nSample output (first 10):"
$mappings | Select-Object -First 10 | Format-Table -Property OldName, NewName -AutoSize
