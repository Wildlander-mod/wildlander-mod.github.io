# Convert Cooking Recipes CSV by merging Ingestables data with recipe requirements

$csvPathRecipes = "DataFromAirtable\All Crafting Recipes-Cooking Recipes.csv"
$csvPathIngestibles = "DataFromAirtable\Ingestables.csv"
$outputFile = "CookingRecipesTable.md"

# Import both CSV files (Ingestibles uses tab delimiter)
$recipes = Import-Csv $csvPathRecipes
$ingestibles = Import-Csv $csvPathIngestibles -Delimiter "`t"

# Create a hashtable for quick lookup of ingestibles by FULL name
$ingestiblesMap = @{}
foreach ($item in $ingestibles) {
    if ($item.FULL) {
        $ingestiblesMap[$item.FULL] = @{
            'Effects' = $item.Effects
            'Magnitude' = $item.Magnitude
            'Duration' = $item.Duration
            'EffectValue' = $item.'Effect Value'
            'CalculatedValue' = $item.CalculatedValue
        }
    }
}

# Build markdown table
$output = @()
$output += "| Item Name | Type | Effects | Items Required | Qty Made | Perks Needed | Toolkits Required | Proximity | Additional Requirements |"
$output += "|-----------|------|---------|-----------------|----------|--------------|-------------------|-----------|-------------------------|"

foreach ($recipe in $recipes) {
    $itemName = $recipe.'Produced Item Name' -replace '\|', '\|'
    $itemName = $itemName -replace '\n', ' ' -replace '\r', ' '
    
    $itemType = $recipe.'Type' -replace '\|', '\|'
    
    # Look up the ingestible details
    $ingestibleData = $ingestiblesMap[$itemName]
    
    if ($ingestibleData) {
        $effects = $ingestibleData.Effects -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    } else {
        $effects = ""
    }
    
    $itemsRequired = $recipe.'Items Required' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    $qtyMade = $recipe.'Qty Made' -replace '\|', '\|'
    $perksNeeded = $recipe.'Perks Needed' -replace '\|', '\|'
    $toolkitsRequired = $recipe.'Toolkits Required' -replace '\|', '\|'
    $proximity = $recipe.'Proximity (When None)' -replace '\|', '\|'
    $additionalRequirements = $recipe.'Additional Requirements' -replace '\|', '\|' -replace '\n', ' ' -replace '\r', ' '
    
    if ($itemName) {
        $output += "| $itemName | $itemType | $effects | $itemsRequired | $qtyMade | $perksNeeded | $toolkitsRequired | $proximity | $additionalRequirements |"
    }
}

$output | Out-File -Encoding UTF8 $outputFile
Write-Host "Generated $($output.Count) lines in $outputFile (includes header)"
Write-Host "Total recipes: $($recipes.Count)"
Write-Host "Matched ingestibles: $(($recipes | Where-Object { $ingestiblesMap[$_.'Produced Item Name'] }).Count)"
