param(
    [string]$InputDir = 'recipe-categories',
    [string]$OutputDir = 'recipe-final'
)

Write-Host '===== PHASE 2.3: Filter & Refine =====' -ForegroundColor Cyan
Write-Host ''

if (-not (Test-Path $InputDir)) {
    Write-Host "ERROR: Input directory not found: $InputDir" -ForegroundColor Red
    exit 1
}

Write-Host 'Step 1: Building workbench friendly names...' -ForegroundColor Yellow

$benchmarkNames = @{
    'CraftingArmorTable' = 'Armor Table'
    'CraftingSmithingAnvil' = 'Blacksmith Forge'
    'CraftingSmelter' = 'Smelter'
    'CraftingTanningRack' = 'Tanning Rack'
    'CraftingEnchantingTable' = 'Enchanting Table'
    'CraftingAlchemyLab' = 'Alchemy Lab'
    'CraftingCookingPot' = 'Cook Pot'
    'CraftingSharpener' = 'Sharpening Wheel'
    'CraftingArmorBench' = 'Armor Workbench'
    'CraftingForgeTool' = 'Forge'
    'CraftingWeaponTable' = 'Weapon Table'
    'CraftingJewelryTable' = 'Jewelry Workbench'
    'CraftingSailorBench' = 'Tailoring Bench'
    'CraftingBreakdown' = 'Breakdown Station'
}

Write-Host "Registered: $($benchmarkNames.Count) workbenches"
Write-Host ''

Write-Host 'Step 2: Filtering recipes...' -ForegroundColor Yellow
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

$unresolved = @()
$disabled = 0
$valid = 0

$csvFiles = @(Get-ChildItem "$InputDir/*.csv")
Write-Host "Processing: $($csvFiles.Count) category files"
Write-Host ''

foreach ($file in $csvFiles) {
    Write-Host "  $($file.BaseName)..." -NoNewline
    $recipes = @(Import-Csv $file.FullName)
    $filtered = @()
    
    foreach ($recipe in $recipes) {
        $count = @($filtered).Count
        
        if (!$recipe.OutputName -or $recipe.OutputName -eq 'UNKNOWN' -or $recipe.OutputName -match '^[A-F0-9:]+$') {
            $unresolved += [PSCustomObject]@{
                EditorID = $recipe.EditorID
                Category = $file.BaseName
                FormKey = $recipe.OutputFormKey
                WorkbenchKeyword = $recipe.WorkbenchKeyword
            }
            continue
        }
        
        if ($recipe.ConditionCount -gt 5) {
            $disabled++
            continue
        }
        
        $filtered += $recipe
        $valid++
    }
    
    if ($filtered.Count -gt 0) {
        $outfile = Join-Path $OutputDir $file.Name
        $filtered | Export-Csv -Path $outfile -NoTypeInformation -Encoding UTF8 -Force
        Write-Host " OK ($($filtered.Count) recipes)" -ForegroundColor Green
    } else {
        Write-Host " EMPTY" -ForegroundColor Yellow
    }
}

Write-Host ''
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  Valid recipes: $valid"
Write-Host "  Disabled/filtered: $disabled"
Write-Host "  Unresolved items: $($unresolved.Count)"
Write-Host ''

if ($unresolved.Count -gt 0) {
    Write-Host "Step 3: Saving unresolved items for review..." -ForegroundColor Yellow
    $unresolvedFile = Join-Path $OutputDir 'UNRESOLVED-ITEMS.csv'
    $unresolved | Export-Csv -Path $unresolvedFile -NoTypeInformation -Encoding UTF8 -Force
    Write-Host "  Saved: $unresolvedFile" -ForegroundColor Yellow
    Write-Host "  ACTION: User should review and provide FormKey mappings"
    Write-Host ''
}

Write-Host 'Done!' -ForegroundColor Green
Write-Host "Output: $OutputDir/" -ForegroundColor Cyan
Write-Host ''
Write-Host "Next: Review UNRESOLVED-ITEMS.csv, then run Phase 3 wiki updates"
