param(
    [string]$RecipePath = 'I:\Wildlander Core R4\ConstructibleObjects',
    [string]$ItemPath = 'I:\Wildlander Core R4',
    [string]$OutputPath = 'recipe-data-enhanced.csv'
)

Write-Host '======== PHASE 2.1 ENHANCED =========' -ForegroundColor Cyan
Write-Host 'Recipe Extraction with Item Name Resolution' -ForegroundColor Cyan
Write-Host '======================================' -ForegroundColor Cyan
Write-Host ''

Write-Host 'Step 1: Building item name lookup...' -ForegroundColor Yellow
$itemCache = @{}
$folders = @('MiscItems', 'Ingestibles', 'Weapons', 'Ingredients')

foreach ($fld in $folders) {
    $path = Join-Path $ItemPath $fld
    if (Test-Path $path) {
        Write-Host "  $fld..." -NoNewline
        $ct = 0
        @(Get-ChildItem "$path/*.json" -ErrorAction SilentlyContinue) | ForEach-Object {
            try {
                $j = Get-Content $_.FullName -Encoding UTF8 | ConvertFrom-Json -EA SilentlyContinue
                if ($j.FormKey -and $j.Name) {
                    $n = if ($j.Name.Value) { $j.Name.Value } else { $j.Name }
                    $itemCache[$j.FormKey] = $n
                    $ct++
                }
            } catch { }
        }
        Write-Host " $ct"
    }
}
Write-Host "Cached: $($itemCache.Count) items"
Write-Host ''

Write-Host 'Step 2: Building keyword lookup...' -ForegroundColor Yellow
$keywordCache = @{}
$kpath = Join-Path $ItemPath 'Keywords'
if (Test-Path $kpath) {
    $kct = 0
    @(Get-ChildItem "$kpath/*.json" -ErrorAction SilentlyContinue) | ForEach-Object {
        try {
            $j = Get-Content $_.FullName -Encoding UTF8 | ConvertFrom-Json -EA SilentlyContinue
            if ($j.FormKey -and $j.EditorID) {
                $fid = ($j.FormKey -split ':')[0]
                $keywordCache[$fid] = $j.EditorID
                $kct++
            }
        } catch { }
    }
    Write-Host "Cached: $kct keywords"
}
Write-Host ''

Write-Host 'Step 3: Extracting recipes...' -ForegroundColor Yellow
if (-not (Test-Path $RecipePath)) {
    Write-Host 'ERROR: Recipe path not found' -ForegroundColor Red
    exit 1
}

$rfiles = @(Get-ChildItem "$RecipePath/*.json" -ErrorAction SilentlyContinue)
Write-Host "Found: $($rfiles.Count) recipe files"
Write-Host ''

$recipes = @()
for ($i = 0; $i -lt $rfiles.Count; $i++) {
    if (($i + 1) % 1000 -eq 0) {
        Write-Host "Progress: $($i + 1) / $($rfiles.Count)" -ForegroundColor Cyan
    }
    
    try {
        $j = Get-Content $rfiles[$i].FullName -Encoding UTF8 | ConvertFrom-Json -EA SilentlyContinue
        if (-not $j -or -not $j.EditorID) { continue }
        
        $outName = if ($j.CreatedObject) { $itemCache[$j.CreatedObject] } else { 'UNKNOWN' }
        if (-not $outName) { $outName = $j.CreatedObject }
        
        $wbName = if ($j.WorkbenchKeyword) { $keywordCache[($j.WorkbenchKeyword -split ':')[0]] } else { 'UNKNOWN' }
        if (-not $wbName) { $wbName = $j.WorkbenchKeyword }
        
        $ingCount = if ($j.Items) { @($j.Items).Count } else { 0 }
        
        $recipe = [PSCustomObject]@{
            EditorID = $j.EditorID
            OutputName = $outName
            OutputQty = $j.CreatedObjectCount
            IngredientCount = $ingCount
            WorkbenchKeyword = $wbName
        }
        
        $recipes += $recipe
    } catch { }
}

Write-Host "  Extracted: $($recipes.Count) valid recipes"
Write-Host ''

Write-Host 'Step 4: Saving CSV...' -ForegroundColor Yellow
$recipes | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8 -Force
Write-Host "  Saved: $OutputPath" -ForegroundColor Green
Write-Host ''
Write-Host 'Done!' -ForegroundColor Cyan
