$repFile = Join-Path $PSScriptRoot 'solution-replacements.txt'
$srcFile = Join-Path $PSScriptRoot 'Elixir View.md'

Write-Host "Applying solution replacements to Elixir View.md Solutions column..."
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
Write-Host "Applied $count solution replacements to Elixir View.md"
