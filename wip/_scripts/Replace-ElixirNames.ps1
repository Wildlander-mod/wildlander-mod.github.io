param(
    [string]$ElixirViewFile = "c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\Elixir View.md",
    [string]$ReplacementsFile = "c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\elixir-replacements.txt",
    [switch]$Apply
)

# Load and parse the replacements mapping
Write-Host "Loading replacements mapping from: $ReplacementsFile" -ForegroundColor Cyan

$replacementMap = @{}
$replacements = Get-Content $ReplacementsFile | Where-Object { $_ -match '\|' -and $_ -notmatch '^Old Name' -and $_ -notmatch '^={4,}' }

foreach ($line in $replacements) {
    if ($line -match '(.+?)\s*\|\s*(.+)') {
        $oldName = $matches[1].Trim()
        $newName = $matches[2].Trim()
        $replacementMap[$oldName] = $newName
    }
}

Write-Host ("Loaded " + $replacementMap.Count + " replacement mappings") -ForegroundColor Green
Write-Host ""

# Read the markdown file
Write-Host ("Reading Elixir View file: " + $ElixirViewFile) -ForegroundColor Cyan
$lines = Get-Content $ElixirViewFile

# Find and replace table rows
$successCount = 0
$failureCount = 0
$updatedLines = @()

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Match table rows with pattern: | [Strength] Elixir | [Effect] | ...
    if ($line -match '^\|\s*(.+?)\s+Elixir\s*\|\s*(.+?)\s*\|') {
        $strength = $matches[1].Trim()
        $effect = $matches[2].Trim()
        
        # Build lookup key: "Effect (Strength)"
        $lookupKey = $effect + " (" + $strength + ")"
        
        # Try to find the replacement
        if ($replacementMap.ContainsKey($lookupKey)) {
            $newName = $replacementMap[$lookupKey]
            $oldElixirPart = $strength + " Elixir"
            $newLine = $line.Replace("| " + $oldElixirPart + " |", "| " + $newName + " |")
            
            $updatedLines += $newLine
            Write-Host ("[OK] Line " + ($i+1) + ": Replaced '" + $oldElixirPart + "' with '" + $newName + "' (Effect: " + $effect + ")") -ForegroundColor Green
            $successCount++
        } else {
            # Check for alternative patterns in the mappings
            $found = $false
            foreach ($key in $replacementMap.Keys) {
                if ($key -like "*$effect*" -and $key -like "*$strength*") {
                    $newName = $replacementMap[$key]
                    $oldElixirPart = $strength + " Elixir"
                    $newLine = $line.Replace("| " + $oldElixirPart + " |", "| " + $newName + " |")
                    
                    $updatedLines += $newLine
                    Write-Host ("[OK] Line " + ($i+1) + ": Replaced '" + $oldElixirPart + "' with '" + $newName + "' (matched alternative)") -ForegroundColor Green
                    $successCount++
                    $found = $true
                    break
                }
            }
            
            if (-not $found) {
                $updatedLines += $line
                Write-Host ("[FAIL] Line " + ($i+1) + ": NO MATCH for '" + $lookupKey + "'") -ForegroundColor Yellow
                $failureCount++
            }
        }
    } else {
        # Non-matching line, keep as-is
        $updatedLines += $line
    }
}

Write-Host ""
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host ("  Successfully matched: " + $successCount) -ForegroundColor Green
Write-Host ("  Failed to match: " + $failureCount) -ForegroundColor $(if ($failureCount -gt 0) { 'Yellow' } else { 'Green' })

if ($Apply) {
    Write-Host ""
    Write-Host "Applying changes to file..." -ForegroundColor Cyan
    $updatedLines | Out-File -FilePath $ElixirViewFile -Encoding UTF8
    Write-Host "File updated successfully!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Preview mode - use -Apply flag to write changes to file" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Example: .\Replace-ElixirNames.ps1 -Apply" -ForegroundColor Gray
}
