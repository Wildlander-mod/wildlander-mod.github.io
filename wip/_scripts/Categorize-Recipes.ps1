<#
.SYNOPSIS
    Categorize recipes and route to correct wiki pages.

.DESCRIPTION
    Takes resolved recipe data and categorizes it by EditorID prefix.
    Routes recipes to their target wiki pages (CookingRecipes, blacksmith, Ammunition, etc.)
    
    Outputs separate CSV files for each wiki page, ready for Phase 3 wiki updates.

.PARAMETER RecipePath
    Path to CSV from Resolve-ItemNames.ps1. Default: recipe-data-with-names.csv

.PARAMETER OutputDir
    Directory to save categorized recipe CSVs. Default: recipe-categories/

.EXAMPLE
    .\Categorize-Recipes.ps1
    .\Categorize-Recipes.ps1 -RecipePath "C:\temp\recipes-named.csv" -OutputDir "C:\temp\categories\"
#>

param(
    [string]$RecipePath = "recipe-data-with-names.csv",
    [string]$OutputDir = "recipe-categories"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "PHASE 2.3: Categorize Recipes by Wiki Page" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Validate input
if (-not (Test-Path $RecipePath)) {
    Write-Host "ERROR: Recipe file not found: $RecipePath" -ForegroundColor Red
    Write-Host "Run Resolve-ItemNames.ps1 first" -ForegroundColor Yellow
    exit 1
}

# Load recipe data
Write-Host "Loading recipe data from: $RecipePath" -ForegroundColor Yellow
$recipes = Import-Csv -Path $RecipePath
Write-Host "Loaded: $($recipes.Count) recipes" -ForegroundColor Green
Write-Host ""

# Create output directory
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

# Define prefix -> wiki page routing table
$routingTable = @{
    "AlchFood" = @{
        WikiPage = "CookingRecipes"
        Description = "Food and cooking recipes"
        Priority = "HIGH"
    }
    "Alch" = @{
        WikiPage = "AlchIng"
        Description = "Alchemy ingredient processing"
        Priority = "MEDIUM"
    }
    "Ammo" = @{
        WikiPage = "Ammunition"
        Description = "Arrow and projectile crafting"
        Priority = "MEDIUM"
    }
    "Armor" = @{
        WikiPage = "Armor-Table-Recipes & blacksmith"
        Description = "Armor crafting (multiple pages)"
        Priority = "HIGH"
    }
    "Weap" = @{
        WikiPage = "blacksmith & Breakdown-Recipes"
        Description = "Weapon crafting and breakdown"
        Priority = "HIGH"
    }
    "Misc" = @{
        WikiPage = "misc & raw"
        Description = "Miscellaneous crafted items"
        Priority = "MEDIUM"
    }
    "Book" = @{
        WikiPage = "NONE (investigate if craftable)"
        Description = "Book crafting (unlikely to be craftable)"
        Priority = "LOW"
    }
    "Ingr" = @{
        WikiPage = "NONE (raw materials)"
        Description = "Raw ingredient processing"
        Priority = "LOW"
    }
}

# Categorize recipes
Write-Host "Categorizing recipes by prefix..." -ForegroundColor Yellow
Write-Host ""

$categories = @{}
$uncategorized = @()

foreach ($recipe in $recipes) {
    $prefix = $recipe.Prefix
    
    if ($routing -eq $null -or -not $routingTable.ContainsKey($prefix)) {
        $uncategorized += $recipe
    } else {
        if (-not $categories.ContainsKey($prefix)) {
            $categories[$prefix] = @()
        }
        $categories[$prefix] += $recipe
    }
}

# Output results by category
$categoryFiles = @()

foreach ($prefix in ($categories.Keys | Sort-Object)) {
    $data = $categories[$prefix]
    $targetPage = $routingTable[$prefix].WikiPage
    $priority = $routingTable[$prefix].Priority
    $count = $data.Count
    
    # Create output filename
    $fileName = "$prefix-recipes.csv"
    $filePath = Join-Path $OutputDir $fileName
    
    # Export category
    $data | Export-Csv -Path $filePath -NoTypeInformation -Encoding UTF8
    $categoryFiles += $filePath
    
    Write-Host "  $prefix`: $count recipes -> $targetPage [$priority]" -ForegroundColor Green
    Write-Host "    Saved to: $fileName" -ForegroundColor Gray
}

Write-Host ""
if ($uncategorized.Count -gt 0) {
    Write-Host "UNCATEGORIZED (no matching wiki page): $($uncategorized.Count) recipes" -ForegroundColor Yellow
    $uncategorizedPath = Join-Path $OutputDir "Uncategorized-recipes.csv"
    $uncategorized | Export-Csv -Path $uncategorizedPath -NoTypeInformation -Encoding UTF8
    Write-Host "  Saved to: Uncategorized-recipes.csv" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "CATEGORIZATION COMPLETE" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Print summary of routing
Write-Host "Recipe Routing Summary:" -ForegroundColor Cyan
Write-Host ""

$sortedRouting = $routingTable.Keys | Sort-Object

foreach ($prefix in $sortedRouting) {
    $route = $routingTable[$prefix]
    $count = if ($categories.ContainsKey($prefix)) { $categories[$prefix].Count } else { 0 }
    
    $status = if ($count -gt 0) { "✓" } else { "○" }
    Write-Host "$status $prefix`.* - $count recipes -> $($route.WikiPage) [$($route.Priority)]"
}

Write-Host ""
Write-Host "Output Directory: $OutputDir"
Write-Host "Total Categories: $($categories.Count)"
Write-Host "Total Categorized: $(($categories.Values | Measure-Object -Sum).Sum)"
Write-Host "Total Uncategorized/Edge Cases: $($uncategorized.Count)"
Write-Host ""

Write-Host "Next Steps for Phase 3:" -ForegroundColor Cyan
Write-Host "1. Review categorized recipe files in $OutputDir/" -ForegroundColor Yellow
Write-Host "2. Update wiki pages with new recipe data:"
Write-Host "   - CookingRecipes.md (AlchFood recipes)"
Write-Host "   - blacksmith.md & Armor-Table-Recipes.md (Armor & Weap)"
Write-Host "   - Ammunition.md"
Write-Host "   - AlchIng.md"
Write-Host "   - misc.md & raw.md"
Write-Host ""
Write-Host "Reference categorized recipe files for current R4 recipe lists" -ForegroundColor Cyan
