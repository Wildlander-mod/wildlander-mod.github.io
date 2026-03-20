param(
    [string]$MainCSVPath = 'i:\Main.csv',
    [string]$OutputDir = 'wiki-table-updates'
)

Write-Host '===== Processing Main.csv for Wiki Updates =====' -ForegroundColor Cyan
Write-Host ''

if (-not (Test-Path $MainCSVPath)) {
    Write-Host "ERROR: Main.csv not found at: $MainCSVPath" -ForegroundColor Red
    exit 1
}

Write-Host "Loading Main.csv (tab-delimited)..." -ForegroundColor Yellow
$allRecipesRaw = @(Import-Csv $MainCSVPath -Encoding UTF8 -Delimiter "`t")
Write-Host "Loaded: $($allRecipesRaw.Count) total recipes" -ForegroundColor Green

# Filter out disabled recipes
$allRecipes = @($allRecipesRaw | Where-Object { $_.'Crafting WorkBench' -ne 'disabled recipe' })
$disabledCount = $allRecipesRaw.Count - $allRecipes.Count

Write-Host "Filtered: $disabledCount disabled recipes skipped" -ForegroundColor Yellow
Write-Host "Processing: $($allRecipes.Count) active recipes" -ForegroundColor Green
Write-Host ''

Write-Host 'Step 1: Mapping Editor Names and Crafting WorkBench to wiki pages...' -ForegroundColor Yellow

$editorPrefixMapping = @{
    'Armor' = 'Armor-Table-Recipes.md'
    'Weap' = 'blacksmith.md'
    'AlchFood' = 'CookingRecipes.md'
    'Alch' = 'AlchIng.md'
    'Misc' = 'misc.md'
    'Ingr' = 'raw.md'
    'Ammo' = 'Ammunition.md'
}

$workbenchMapping = @{
    'Forge' = 'Armor-Table-Recipes.md'
    'Cook pot' = 'CookingRecipes.md'
    'Alchemy Lab' = 'AlchIng.md'
    'Smelter' = 'raw.md'
    'Tanning Rack' = 'raw.md'
    'Breakdown' = 'Breakdown-Recipes.md'
    'Sharpening Wheel' = 'Sharpening-Wheel.md'
    'Player Crafting' = 'misc.md'
    'Enchanting Table' = 'enchanting.md'
    'Armor Table' = 'Armor-Table-Recipes.md'
    'Staff Enchanter' = 'enchanting.md'
    'CraftingTable' = 'misc.md'
    'Skyforge' = 'Armor-Table-Recipes.md'
    'Oven' = 'CookingRecipes.md'
    'Furniture Workbench' = 'misc.md'
    'Aetherium Forge' = 'Armor-Table-Recipes.md'
    'CraftingSurvivalUnused' = 'misc.md'
    'Grain Mill' = 'CookingRecipes.md'
    'Spinning Wheel' = 'Tailor.md'
}

Write-Host "Registered: $($editorPrefixMapping.Count) editor prefix mappings"
Write-Host "Registered: $($workbenchMapping.Count) workbench mappings"
Write-Host ''

Write-Host 'Step 2: Categorizing recipes by Editor Name prefix, then by Crafting WorkBench...' -ForegroundColor Yellow

$pageRecipes = @{}
$uncategorized = @()
$skipped = 0

foreach ($recipe in $allRecipes) {
    # Skip empty workbench entries
    if ([string]::IsNullOrWhiteSpace($recipe.'Crafting WorkBench')) {
        $skipped++
        continue
    }
    
    $editorName = $recipe.'Editor Name'
    $workbench = $recipe.'Crafting WorkBench'
    
    # Check workbench first for special cases (e.g., Spinning Wheel should always go to Tailor)
    $foundPage = $null
    if ($workbench -eq 'Spinning Wheel') {
        $foundPage = 'Tailor.md'
    }
    
    # If no workbench special case, try editor prefix
    if (-not $foundPage) {
        foreach ($prefix in $editorPrefixMapping.Keys) {
            if ($editorName -like "$prefix*") {
                $foundPage = $editorPrefixMapping[$prefix]
                break
            }
        }
    }
    
    # If no editor prefix match, try workbench mapping
    if (-not $foundPage) {
        $foundPage = $workbenchMapping[$workbench]
    }
    
    if ($foundPage) {
        if (-not $pageRecipes.ContainsKey($foundPage)) {
            $pageRecipes[$foundPage] = @()
        }
        $pageRecipes[$foundPage] += $recipe
    } else {
        $uncategorized += $recipe
    }
}

Write-Host "Skipped: $skipped recipes with empty workbench" -ForegroundColor Yellow

Write-Host ""
Write-Host 'Categorization Results:' -ForegroundColor Cyan
$pageRecipes.GetEnumerator() | Sort-Object -Property @{Expression={@($_.Value).Count}} -Descending | ForEach-Object {
    Write-Host "  $($_.Key.PadRight(30)): $(@($_.Value).Count.ToString().PadLeft(5)) recipes"
}

if ($uncategorized.Count -gt 0) {
    Write-Host "  [UNCATEGORIZED] $($uncategorized.Count) recipes (no workbench match)" -ForegroundColor Yellow
}

Write-Host ''
Write-Host 'Step 3: Creating output directory...' -ForegroundColor Yellow

if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

Write-Host ''
Write-Host 'Step 4: Generating markdown tables...' -ForegroundColor Yellow
Write-Host ''

foreach ($page in $pageRecipes.Keys | Sort-Object) {
    $recipes = $pageRecipes[$page]
    $count = @($recipes).Count
    
    # Build markdown table
    $tableLines = @()
    $tableLines += '| Item Name | Qty Made | Perks | Proximity | Components |'
    $tableLines += '|:---|:---:|:---|:---|:---|'
    
    foreach ($recipe in $recipes) {
        $itemName = $recipe.'Item Name'
        $qtyMade = $recipe.'Qty Made'
        $perks = $recipe.'Perks'
        $proximity = $recipe.'Proximity(When Player Crafting)'
        $components = $recipe.'Components'
        
        # Escape pipe characters in components
        $components = $components -replace '\|', '\|'
        
        $tableLines += "| $itemName | $qtyMade | $perks | $proximity | $components |"
    }
    
    # Save markdown table
    $outFile = Join-Path $OutputDir ($page -replace '\.md$', '-TABLE.md')
    $tableLines | Out-File -FilePath $outFile -Encoding UTF8 -Force
    
    Write-Host "  [$($count.ToString().PadLeft(5)) recipes] $page -> $outFile"
}

Write-Host ''
Write-Host 'Done!' -ForegroundColor Green
Write-Host "Output directory: $OutputDir/" -ForegroundColor Cyan
Write-Host ''
Write-Host 'Next steps:' -ForegroundColor Yellow
Write-Host '  1. Copy markdown table content to each wiki page'
Write-Host '  2. Remove "Toolkits Required" column from existing pages'
Write-Host '  3. Test wiki page rendering'
