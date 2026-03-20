# Apply solution replacements to Solutions-View.md
$replacementsFile = Join-Path $PSScriptRoot 'solution-replacements.txt'
$targetFile = Join-Path $PSScriptRoot 'Solutions-View.md'

Write-Host "Reading replacements from: $replacementsFile"
Write-Host "Target file: $targetFile"

# Read the entire file as string
$content = [System.IO.File]::ReadAllText($targetFile, [System.Text.Encoding]::UTF8)
Write-Host "File size before: $($content.Length) characters"

# Read replacement pairs
$lines = Get-Content $replacementsFile -Encoding UTF8
$replacementCount = 0
$appliedCount = 0

foreach ($line in $lines) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    
    $parts = $line -split '\s*\|\s*', 2
    if ($parts.Count -ne 2) { 
        Write-Host "Skipping invalid line: $line"
        continue 
    }
    
    $old = $parts[0]
    $new = $parts[1]
    $replacementCount++
    
    # Check if the old value exists in the content
    if ($content.Contains($old)) {
        $content = $content.Replace($old, $new)
        $appliedCount++
        if ($appliedCount -le 5 -or $appliedCount % 25 -eq 0) {
            Write-Host "✓ Replaced ($appliedCount/$replacementCount): $old"
        }
    }
}

Write-Host ""
Write-Host "Applied $appliedCount out of $replacementCount replacements"
Write-Host "File size after: $($content.Length) characters"

# Save the file
[System.IO.File]::WriteAllText($targetFile, $content, [System.Text.Encoding]::UTF8)
Write-Host "File saved successfully!"
