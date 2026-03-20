param(
    [string]$InputDir = 'recipe-final',
    [string]$OutputDir = 'wiki-updates'
)

Write-Host '===== PHASE 3: Prepare Wiki Updates =====' -ForegroundColor Cyan
Write-Host ''

if (-not (Test-Path $InputDir)) {
    Write-Host "ERROR: Input directory not found: $InputDir" -ForegroundColor Red
    exit 1
}

Write-Host 'Step 1: Mapping categories to wiki pages...' -ForegroundColor Yellow

$pageMapping = @{
    'Alch-recipes' = 'AlchIng.md'
    'AlchFood-recipes' = 'CookingRecipes.md'
    'Ammo-recipes' = 'Ammunition.md'
    'Armor-recipes' = 'Armor-Table-Recipes.md'
    'Weap-recipes' = 'blacksmith.md'
    'Misc-recipes' = 'misc.md'
    'Ingr-recipes' = 'raw.md'
}

Write-Host "Registered: $($pageMapping.Count) category-to-page mappings"
Write-Host ''

Write-Host 'Step 2: Building WikiBench to Page routing...' -ForegroundColor Yellow

$benchToPage = @{
    'CraftingArmorTable' = 'Armor-Table-Recipes.md'
    'CraftingSmithingAnvil' = 'blacksmith.md'
    'CraftingSmelter' = 'raw.md'
    'CraftingTanningRack' = 'raw.md'
    'CraftingEnchantingTable' = 'enchanting.md'
    'CraftingAlchemyLab' = 'AlchIng.md'
    'CraftingCookingPot' = 'CookingRecipes.md'
    'CraftingSharpener' = 'Sharpening-Wheel.md'
    'CraftingBreakdown' = 'Breakdown-Recipes.md'
}

Write-Host "Registered: $($benchToPage.Count) workbench-to-page mappings"
Write-Host ''

Write-Host 'Step 3: Processing recipe files...' -ForegroundColor Yellow

if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

$pageRecipes = @{}
$sorted = @('Ingr-recipes', 'Alch-recipes', 'Ammo-recipes', 'AlchFood-recipes', 'Misc-recipes', 'Weap-recipes', 'Armor-recipes', 'Book-recipes', 'OTHER-recipes')

foreach ($category in $sorted) {
    $csvFile = Join-Path $InputDir "$category.csv"
    if (-not (Test-Path $csvFile)) {
        Write-Host "  [SKIP] $category (not found)"
        continue
    }
    
    $recipes = @(Import-Csv $csvFile)
    Write-Host "  [$($recipes.Count).ToString().PadLeft(4))] $category" -NoNewline
    
    if ($category -eq 'OTHER-recipes') {
        Write-Host " (routing by WorkbenchKeyword)"
        foreach ($recipe in $recipes) {
            $targetPage = $benchToPage[$recipe.WorkbenchKeyword]
            if (-not $targetPage) {
                $targetPage = 'misc.md'
            }
            
            if (-not $pageRecipes.ContainsKey($targetPage)) {
                $pageRecipes[$targetPage] = @()
            }
            $pageRecipes[$targetPage] += $recipe
        }
    } else {
        $targetPage = $pageMapping[$category]
        Write-Host " -> $targetPage"
        
        if (-not $pageRecipes.ContainsKey($targetPage)) {
            $pageRecipes[$targetPage] = @()
        }
        $pageRecipes[$targetPage] += $recipes
    }
}

Write-Host ''
Write-Host 'Step 4: Exporting by wiki page...' -ForegroundColor Yellow
Write-Host ''

$pageRecipes.GetEnumerator() | Sort-Object -Property @{Expression={@($_.Value).Count}} -Descending | ForEach-Object {
    $page = $_.Key
    $recipes = $_.Value
    $count = @($recipes).Count
    
    $outfile = Join-Path $OutputDir ($page -replace '\.md$', '.csv')
    $recipes | Export-Csv -Path $outfile -NoTypeInformation -Encoding UTF8 -Force
    
    Write-Host "  $($page.PadRight(30)): $($count.ToString().PadLeft(5)) recipes"
}

Write-Host ''
Write-Host 'Done!' -ForegroundColor Green
Write-Host "Output: $OutputDir/" -ForegroundColor Cyan
Write-Host ''
Write-Host 'Ready for wiki page updates!' -ForegroundColor Yellow
