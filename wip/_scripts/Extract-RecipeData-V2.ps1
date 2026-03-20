<#
.SYNOPSIS
    Extract recipe data from Wildlander R4 with enhanced item name resolution.

.DESCRIPTION
    Phase 2.1 Enhanced - Reads ConstructibleObjects and resolves:
    - EditorID, FormKey, Items[], CreatedObject, CreatedObjectCount
    - Item display names from MiscItems/Weapons/Ingestibles/Ingredients
    - WorkbenchKeyword names from Keywords folder
    - Quantities and perk requirements from Conditions
    
    Outputs structured CSV with resolved names for wiki page updates.

.PARAMETER RecipePath
    ConstructibleObjects folder. Default: I:\Wildlander Core R4\ConstructibleObjects

.PARAMETER ItemPath
    Item lookup folders. Default: I:\Wildlander Core R4

.PARAMETER OutputPath
    Save location. Default: recipe-data-extracted-v2.csv
#>

param(
    [string]$RecipePath = "I:\Wildlander Core R4\ConstructibleObjects",
    [string]$ItemPath = "I:\Wildlander Core R4",
    [string]$OutputPath = "recipe-data-extracted-v2.csv"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "PHASE 2.1 ENHANCED: Recipe Extraction" -ForegroundColor Cyan
Write-Host "with Item Name Resolution" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# STEP 1: Build item name lookup cache
Write-Host "Step 1: Building item name lookup cache..." -ForegroundColor Yellow
$itemCache = @{}
$itemFolders = @('MiscItems', 'Ingestibles', 'Weapons', 'Ingredients')

foreach ($folder in $itemFolders) {
    $folderPath = Join-Path $ItemPath $folder
    if (Test-Path $folderPath) {
        Write-Host "  Reading $folder..."
        $itemFiles = @(Get-ChildItem "$folderPath/*.json" -ErrorAction SilentlyContinue)
        foreach ($file in $itemFiles) {
            try {
                $json = Get-Content $file.FullName -Encoding UTF8 | ConvertFrom-Json -ErrorAction SilentlyContinue
                if ($json.FormKey -and $json.Name) {
                    $displayName = $json.Name | ForEach-Object {
                        if ($_.Value) { $_.Value } else { $_ }
                    }
                    $itemCache[$json.FormKey] = $displayName
                }
            } catch {
                # Skip malformed files
            }
        }
    }
}
Write-Host "  Cached $($itemCache.Count) item names" -ForegroundColor Green
Write-Host ""

# STEP 2: Build keyword lookup cache (for WorkbenchKeyword mapping)
Write-Host "Step 2: Building WorkbenchKeyword lookup..." -ForegroundColor Yellow
$keywordCache = @{}
$keywordPath = Join-Path $ItemPath "Keywords"
if (Test-Path $keywordPath) {
    $keywordFiles = @(Get-ChildItem "$keywordPath/*.json" -ErrorAction SilentlyContinue)
    Write-Host "  Found $($keywordFiles.Count) keyword files"
    foreach ($file in $keywordFiles) {
        try {
            $json = Get-Content $file.FullName -Encoding UTF8 | ConvertFrom-Json -ErrorAction SilentlyContinue
            if ($json.FormKey -and $json.EditorID) {
                # Extract FormID part (before :)
                $formId = $json.FormKey -split ':' | Select-Object -First 1
                $keywordCache[$formId] = $json.EditorID
            }
        } catch {
            # Skip
        }
    }
}
Write-Host "  Cached $($keywordCache.Count) keywords" -ForegroundColor Green
Write-Host ""

# STEP 3: Extract recipes
Write-Host "Step 3: Extracting recipe data..." -ForegroundColor Yellow
if (-not (Test-Path $RecipePath)) {
    Write-Host "ERROR: Recipe path not found: $RecipePath" -ForegroundColor Red
    exit 1
}

$recipeFiles = @(Get-ChildItem "$RecipePath/*.json" -ErrorAction SilentlyContinue)
Write-Host "  Processing $($recipeFiles.Count) recipes..."
Write-Host ""

$recipes = @()
$processed = 0

for ($i = 0; $i -lt $recipeFiles.Count; $i++) {
    if (($i + 1) % 1000 -eq 0) {
        Write-Host "  Progress: $($i + 1) / $($recipeFiles.Count) recipes ($(($recipes.Count)) valid recipes)" -ForegroundColor Cyan
    }
    
    $file = $recipeFiles[$i]
    try {
        $json = Get-Content $file.FullName -Encoding UTF8 | ConvertFrom-Json -ErrorAction SilentlyContinue
        if (-not $json -or -not $json.EditorID) {
            continue
        }
        
        # Get display name for output item
        $outputName = "UNKNOWN"
        if ($json.CreatedObject) {
            $outputName = $itemCache[$json.CreatedObject]
            if (-not $outputName) {
                $outputName = $json.CreatedObject # Fallback to FormKey if not in cache
            }
        }
        
        # Get workbench keyword name
        $workbenchName = "UNKNOWN"
        if ($json.WorkbenchKeyword) {
            $kwFormId = $json.WorkbenchKeyword -split ':' | Select-Object -First 1
            $workbenchName = $keywordCache[$kwFormId]
            if (-not $workbenchName) {
                $workbenchName = $json.WorkbenchKeyword
            }
        }
        
        # Count input ingredients
        $ingredientCount = if ($json.Items) { $json.Items.Count } else { 0 }
        
        # Extract perk requirement from Conditions if present
        $perksNeeded = ""
        if ($json.Conditions) {
            $perkConditions = @($json.Conditions | Where-Object { $_.Data.Perk })
            if ($perkConditions.Count -gt 0) {
                $perksNeeded = ($perkConditions | ForEach-Object { "Perk: $($_.Data.Perk)" }) -join "; "
            }
        }
        
        # Create recipe object
        $recipe = [PSCustomObject]@{
            EditorID = $json.EditorID
            FormKey = $json.FormKey
            OutputName = $outputName
            OutputFormKey = $json.CreatedObject
            OutputQuantity = $json.CreatedObjectCount
            IngredientCount = $ingredientCount
            Ingredients = if ($json.Items) { ($json.Items | ForEach-Object { [string]($_.Count) + 'x ' + ($itemCache[$_.Item] -or $_.Item) }) -join '; ' } else { '' }
            WorkbenchKeyword = $workbenchName
            PerksRequired = $perksNeeded
            ConditionCount = if ($json.Conditions) { $json.Conditions.Count } else { 0 }
        }
        
        $recipes += $recipe
        $processed++
    } catch {
        # Skip files with errors
    }
}

Write-Host ""
Write-Host "  Extracted: $($recipes.Count) valid recipes" -ForegroundColor Green
Write-Host ""

# STEP 4: Save to CSV
Write-Host "Step 4: Saving to CSV..." -ForegroundColor Yellow
try {
    $recipes | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8 -Force
    Write-Host "  ✓ Saved: $OutputPath" -ForegroundColor Green
    Write-Host ""
    Write-Host "Summary:" -ForegroundColor Cyan
    Write-Host "  Total recipes: $($recipes.Count)"
    Write-Host "  Item cache size: $($itemCache.Count)"
    Write-Host "  Keyword cache size: $($keywordCache.Count)"
    Write-Host ""
    Write-Host "Next: Run PowerShell -File .\Categorize-Recipes.ps1" -ForegroundColor Yellow
} catch {
    Write-Host "ERROR: Failed to save CSV" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}
