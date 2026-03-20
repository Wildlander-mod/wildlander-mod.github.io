<#
.SYNOPSIS
    Resolve FormKeys to item display names from R4 item folders.

.DESCRIPTION
    Reads JSON files from item type folders (MiscItems, Ingestibles, Weapons, Ingredients)
    and builds a lookup table mapping FormKey -> DisplayName.
    
    Processes extracted recipe data from Extract-RecipeData.ps1 and adds display names
    for CreatedObject and all ingredients.

.PARAMETER RecipePath
    Path to CSV extracted by Extract-RecipeData.ps1. Default: recipe-data-extracted.csv

.PARAMETER R4Path
    Path to Wildlander Core R4 root folder. Default: I:\Wildlander Core R4

.PARAMETER OutputPath
    Path to save recipe data with resolved names. Default: recipe-data-with-names.csv

.EXAMPLE
    .\Resolve-ItemNames.ps1
    .\Resolve-ItemNames.ps1 -RecipePath "C:\temp\recipes.csv" -OutputPath "C:\temp\recipes-named.csv"
#>

param(
    [string]$RecipePath = "recipe-data-extracted.csv",
    [string]$R4Path = "I:\Wildlander Core R4",
    [string]$OutputPath = "recipe-data-with-names.csv"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "PHASE 2.2: Resolve Item Names from FormKeys" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Validate input recipe file
if (-not (Test-Path $RecipePath)) {
    Write-Host "ERROR: Recipe file not found: $RecipePath" -ForegroundColor Red
    Write-Host "Run Extract-RecipeData.ps1 first" -ForegroundColor Yellow
    exit 1
}

# Load recipe data
Write-Host "Loading recipe data from: $RecipePath" -ForegroundColor Yellow
$recipes = Import-Csv -Path $RecipePath
Write-Host "Loaded: $($recipes.Count) recipes" -ForegroundColor Green
Write-Host ""

# Build FormKey lookup table from item folders
Write-Host "Building FormKey -> DisplayName lookup..." -ForegroundColor Yellow

$itemLookup = @{}
$folderCount = 0

$itemFolders = @("MiscItems", "Ingestibles", "Weapons", "Ingredients", "Armors", "Ammo", "Books")

foreach ($folder in $itemFolders) {
    $folderPath = Join-Path $R4Path $folder
    
    if (-not (Test-Path $folderPath)) {
        Write-Host "  SKIP: $folder (folder not found)"
        continue
    }
    
    $jsonFiles = @(Get-ChildItem "$folderPath/*.json" -ErrorAction SilentlyContinue)
    Write-Host "  Scanning $folder`: $($jsonFiles.Count) items..." -ForegroundColor Gray
    
    foreach ($file in $jsonFiles) {
        try {
            $json = Get-Content $file.FullName -Encoding UTF8 | ConvertFrom-Json -ErrorAction Stop
            
            if ($json.FormKey -and $json.Name.Value) {
                $formKey = $json.FormKey
                $displayName = $json.Name.Value
                
                # Store in lookup (overwrite if duplicate, use latest)
                if (-not $itemLookup.ContainsKey($formKey)) {
                    $itemLookup[$formKey] = $displayName
                }
            }
        } catch {
            # Skip files with parse errors
        }
    }
    
    $folderCount++
}

Write-Host ""
Write-Host "Lookup table built:" -ForegroundColor Green
Write-Host "  Folders scanned: $folderCount"
Write-Host "  Unique FormKeys: $($itemLookup.Count)"
Write-Host ""

# Function to resolve FormKey to DisplayName
function Resolve-ItemName {
    param([string]$FormKey)
    
    if ($itemLookup.ContainsKey($FormKey)) {
        return $itemLookup[$FormKey]
    } else {
        return "[UNRESOLVED: $FormKey]"
    }
}

# Process recipes and resolve names
Write-Host "Resolving item names..." -ForegroundColor Yellow
$resolved = @()

foreach ($recipe in $recipes) {
    try {
        # Resolve output item name
        $outputName = Resolve-ItemName $recipe.CreatedObject_FormKey
        
        # Resolve ingredient names
        $ingredientNames = @()
        if ($recipe.IngredientFormKeys) {
            $ingredients = $recipe.IngredientFormKeys -split '\|'
            foreach ($ingredFormKey in $ingredients) {
                if ($ingredFormKey.Trim()) {
                    $ingredName = Resolve-ItemName $ingredFormKey.Trim()
                    $ingredientNames += $ingredName
                }
            }
        }
        
        # Build resolved recipe object
        $resolved += [PSCustomObject]@{
            EditorID = $recipe.EditorID
            Prefix = $recipe.Prefix
            CreatedObject_FormKey = $recipe.CreatedObject_FormKey
            CreatedObject_Name = $outputName
            CreatedObjectCount = $recipe.CreatedObjectCount
            IngredientCount = $recipe.IngredientCount
            IngredientFormKeys = $recipe.IngredientFormKeys
            IngredientNames = ($ingredientNames -join ' | ')
        }
        
    } catch {
        Write-Host "ERROR processing recipe $($recipe.EditorID): $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Export resolved data
Write-Host ""
Write-Host "Exporting resolved recipe data to: $OutputPath" -ForegroundColor Yellow
$resolved | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Host "SUCCESS: Recipe data with item names exported" -ForegroundColor Green
Write-Host ""
Write-Host "Data Preview (first 5 recipes):"
$resolved | Select-Object -First 5 | Format-Table -AutoSize -Wrap

# Summary stats
Write-Host ""
Write-Host "Resolution Summary:" -ForegroundColor Green
$unresolved = $resolved | Where-Object { $_.CreatedObject_Name -like "*UNRESOLVED*" }
if ($unresolved.Count -gt 0) {
    Write-Host "  Unresolved output items: $($unresolved.Count)"
    Write-Host "  Sample unresolved: " -NoNewline
    $unresolved | Select-Object -First 3 | ForEach-Object { Write-Host "$($_.CreatedObject_Name) " -NoNewline }
    Write-Host ""
} else {
    Write-Host "  All output items resolved: $($resolved.Count)"
}

Write-Host ""
Write-Host "Next: Run Categorize-Recipes.ps1 to route recipes to wiki pages" -ForegroundColor Cyan
