param(
    [string]$InputCsv = 'recipe-data-enhanced.csv',
    [string]$OutputDir = 'recipe-categories'
)

Write-Host '===== PHASE 2.2: Categorize Recipes =====' -ForegroundColor Cyan
Write-Host ''

if (-not (Test-Path $InputCsv)) {
    Write-Host "ERROR: Input CSV not found: $InputCsv" -ForegroundColor Red
    exit 1
}

Write-Host "Loading: $InputCsv" -ForegroundColor Yellow
$recipes = @(Import-Csv $InputCsv)
Write-Host "Loaded: $($recipes.Count) recipes"
Write-Host ''

Write-Host 'Categorizing by EditorID prefix...' -ForegroundColor Yellow
Write-Host ''

$routing = @{
    'Armor' = 'Armor-Table-Recipes'
    'Weap' = 'blacksmith'
    'AlchFood' = 'CookingRecipes'
    'Misc' = 'misc'
    'Ammo' = 'Ammunition'
    'Alch' = 'AlchIng'
    'Ingr' = 'raw'
    'Book' = 'UNKNOWN'
}

$byCategory = @{}
foreach ($recipe in $recipes) {
    $prefix = $recipe.EditorID -replace '_.*', ''
    if (-not $byCategory.ContainsKey($prefix)) {
        $byCategory[$prefix] = @()
    }
    $byCategory[$prefix] += $recipe
}

Write-Host 'Results:' -ForegroundColor Cyan
Write-Host ''
$total = 0
foreach ($prefix in @('Armor', 'Weap', 'AlchFood', 'Misc', 'Ammo', 'Alch', 'Ingr', 'Book')) {
    $count = if ($byCategory[$prefix]) { @($byCategory[$prefix]).Count } else { 0 }
    $target = $routing[$prefix]
    Write-Host "  $($prefix.PadRight(10)): $($count.ToString().PadLeft(5)) -> $target.md"
    $total += $count
}

$others = 0
foreach ($prefix in $byCategory.Keys) {
    if (-not $routing.ContainsKey($prefix)) {
        $others += @($byCategory[$prefix]).Count
    }
}
if ($others -gt 0) {
    Write-Host "  Other     : $($others.ToString().PadLeft(5)) -> UNCATEGORIZED"
}

Write-Host ""
Write-Host "  TOTAL     : $($total + $others) recipes"
Write-Host ''

Write-Host 'Exporting...' -ForegroundColor Yellow
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

foreach ($prefix in $routing.Keys) {
    if ($byCategory[$prefix]) {
        $outfile = Join-Path $OutputDir "$prefix-recipes.csv"
        $data = $byCategory[$prefix]
        $data | Export-Csv -Path $outfile -NoTypeInformation -Encoding UTF8 -Force
        Write-Host "  [OK] $prefix-recipes.csv ($(($data | Measure-Object).Count) items)"
    }
}

if ($others -gt 0) {
    $unknown = @()
    foreach ($prefix in $byCategory.Keys) {
        if (-not $routing.ContainsKey($prefix)) {
            $unknown += $byCategory[$prefix]
        }
    }
    if ($unknown.Count -gt 0) {
        $outfile = Join-Path $OutputDir "OTHER-recipes.csv"
        $unknown | Export-Csv -Path $outfile -NoTypeInformation -Encoding UTF8 -Force
        Write-Host "  [OK] OTHER-recipes.csv ($($unknown.Count) items)"
    }
}

Write-Host ''
Write-Host 'Done!' -ForegroundColor Green
Write-Host "Output: $OutputDir" -ForegroundColor Cyan
