param([string]$Action = "test")

$repFile = Join-Path $PSScriptRoot 'solution-replacements.txt'
$srcFile = Join-Path $PSScriptRoot 'Solutions-View.md'

$content = [IO.File]::ReadAllText($srcFile, [Text.Encoding]::UTF8)
$replacements = Get-Content $repFile

$count = 0
foreach ($item in $replacements) {
    $parts = $item -split ' \| ', 2
    if ($parts.Count -eq 2) {
        $old = $parts[0]
        $new = $parts[1]
        if ($content.Contains($old)) {
            $content = $content.Replace($old, $new)
            $count++
        }
    }
}

[IO.File]::WriteAllText($srcFile, $content, [Text.Encoding]::UTF8)
Write-Host "Applied $count replacements"
