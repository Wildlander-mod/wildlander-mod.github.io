<#
.SYNOPSIS
    Extract recipe data from Wildlander R4 ConstructibleObjects JSON files.

.DESCRIPTION
    Reads all JSON files from the ConstructibleObjects folder and extracts:
    - EditorID (for prefix-based categorization)
    - FormKey (for output item lookup)
    - Items array (input ingredient list)
    - CreatedObject (output item FormKey)
    - CreatedObjectCount (quantity made)
    Outputs structured CSV for further processing.

.PARAMETER InputPath
    Path to ConstructibleObjects folder. Default: I:\Wildlander Core R4\ConstructibleObjects

.PARAMETER OutputPath
    Path to save extracted recipe CSV. Default: wip\_scripts\recipe-data-extracted.csv

.PARAMETER Verbose
    Show detailed progress output for each file processed.

.EXAMPLE
    .\Extract-RecipeData.ps1
    .\Extract-RecipeData.ps1 -OutputPath "C:\temp\recipes.csv" -Verbose
#>

param(
    [string]$InputPath = "I:\Wildlander Core R4\ConstructibleObjects",
    [string]$OutputPath = "recipe-data-extracted.csv",
    [switch]$Verbose
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "PHASE 2.1: Extract Recipe Data from JSON" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Validate input path
if (-not (Test-Path $InputPath)) {
    Write-Host "ERROR: Input path not found: $InputPath" -ForegroundColor Red
    exit 1
}

$jsonFiles = @(Get-ChildItem "$InputPath/*.json" -ErrorAction SilentlyContinue)
Write-Host "Found: $($jsonFiles.Count) JSON recipe files" -ForegroundColor Green
Write-Host "Processing recipes..." -ForegroundColor Yellow
Write-Host ""

$recipes = @()
$processed = 0
$skipped = 0
$errors = 0

for ($i = 0; $i -lt $jsonFiles.Count; $i++) {
    $file = $jsonFiles[$i]
    try {
        $processed++
        if ($processed % 1000 -eq 0) {
            Write-Host "  Progress: $processed / $($jsonFiles.Count) files processed..."
        }
        
        # Read file content safely
        $content = Get-Content $file.FullName -Encoding UTF8 -ErrorAction Stop
        if (-not $content) { 
            $skipped++
            continue 
        }
        
        # Parse JSON with error handling
        $json = $content | ConvertFrom-Json -ErrorAction SilentlyContinue
        if (-not $json) {
            $errors++
            if ($Verbose) {
                Write-Host "  ERROR: $($file.Name) - JSON parse failed" -ForegroundColor Red
            }
            continue
        }
        
        # Extract key fields
        $editorID = $json.EditorID
        $formKey = $json.FormKey
        
        # Skip if missing critical fields
        if (-not $editorID -or -not $formKey) {
            $skipped++
            if ($Verbose) {
                Write-Host "  SKIP: $($file.Name) - missing EditorID or FormKey" -ForegroundColor Gray
            }
            continue
        }
        
        # Extract ingredients (Items array)
        $ingredientCount = 0
        $ingredients = @()
        if ($json.Items -and $json.Items.Count -gt 0) {
            $ingredientCount = $json.Items.Count
            foreach ($item in $json.Items) {
                # Items.Item is a string FormKey, not an object
                if ($item.Item) {
                    # If it's an object, get FormKey; if it's a string, use it directly
                    if ($item.Item -is [PSCustomObject]) {
                        $ingredients += $item.Item.FormKey
                    } else {
                        # Parse string like "CC0654:Update.esm"
                        $itemStr = "$($item.Item)" -replace '@.*?;?\s*', '' -replace '[{}]', ''
                        if ($itemStr) { $ingredients += $itemStr }
                    }
                }
            }
        }
        
        # Extract output item (CreatedObject is a FormKey string, not an object)
        $createdObject = $null
        $createdObjectCount = 1
        if ($json.CreatedObject) {
            # CreatedObject is a string FormKey already
            $createdObject = "$($json.CreatedObject)"
            if ($json.CreatedObjectCount) {
                $createdObjectCount = $json.CreatedObjectCount
            }
        }
        
        # Skip if no output defined
        if (-not $createdObject) {
            $skipped++
            continue
        }
        
        # Extract prefix from EditorID for categorization
        $prefix = $editorID -replace '_.*', ''
        
        # Build recipe object
        $recipe = [PSCustomObject]@{
            EditorID = $editorID
            Prefix = $prefix
            FormKey = $formKey
            CreatedObject_FormKey = $createdObject
            CreatedObjectCount = $createdObjectCount
            IngredientCount = $ingredientCount
            IngredientFormKeys = ($ingredients -join '|')
        }
        
        $recipes += $recipe
        
    } catch {
        $errors++
        if ($Verbose) {
            Write-Host "  ERROR: $($file.Name) - $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host "Processing Complete:" -ForegroundColor Green
Write-Host "  Processed: $processed files"
Write-Host "  Recipes Extracted: $($recipes.Count)"
Write-Host "  Skipped: $skipped (no output item)"
Write-Host "  Errors: $errors"
Write-Host ""

# Export to CSV
if ($recipes.Count -gt 0) {
    Write-Host "Exporting to: $OutputPath" -ForegroundColor Yellow
    $recipes | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8
    Write-Host "SUCCESS: Recipe data exported" -ForegroundColor Green
    Write-Host ""
    Write-Host "CSV Preview (first 5 recipes):"
    $recipes | Select-Object -First 5 | Format-Table -AutoSize
} else {
    Write-Host "ERROR: No recipes extracted!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Next: Run Resolve-ItemNames.ps1 to map FormKeys to display names" -ForegroundColor Cyan
