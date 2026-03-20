# Map: Old Ayleid archetype names to new "Alchemical Solution of [Archetype]" names (no strength)

$archetypeMap = @{
    'Agea' = 'Alchemical Solution of Magicka'
    'Agea Arden' = 'Alchemical Solution of Resistances'
    'Aka ry Relleis' = 'Alchemical Solution of Time'
    'Altadoon' = 'Alchemical Solution of Weapons'
    'Altadoon ry Bet' = 'Alchemical Solution of Diseases'
    'Arden' = 'Alchemical Solution of Shield'
    'Ayammis' = 'Alchemical Solution of Life'
    'Ayammis Malata' = 'Alchemical Solution of Souls'
    'Bal' = 'Alchemical Solution of Earth'
    'Betaltadoon' = 'Alchemical Solution of Poisons'
    'Betayammis' = 'Alchemical Solution of Creatures'
    'Dunayammis' = 'Alchemical Solution of Undead'
    'Dunruhn' = 'Alchemical Solution of Trap'
    'Ghartok' = 'Alchemical Solution of Stamina'
    'Karan' = 'Alchemical Solution of Armor'
    'Karen Kogo' = 'Alchemical Solution of Force'
    'Karan ry Ayammis' = 'Alchemical Solution of Health'
    'Latta' = 'Alchemical Solution of Light'
    'Latta Loria' = 'Alchemical Solution of Shadow'
    'Mafre' = 'Alchemical Solution of Frost'
    'Mallari' = 'Alchemical Solution of Metal'
    'Malatu Magicka' = 'Alchemical Solution of Arcane Energy'
    'Mer Ayammis' = 'Alchemical Solution of Mortals'
    'Mer ry Wel' = 'Alchemical Solution of Apparitions'
    'Mer Garlas' = 'Alchemical Solution of Flesh'
    'Molag' = 'Alchemical Solution of Fire'
    'Mora' = 'Alchemical Solution of Nature'
    'Pellenni Ayammis' = 'Alchemical Solution of Daedra'
    'Relleis' = 'Alchemical Solution of Water'
    'Rellers ry Molag' = 'Alchemical Solution of Acid'
    'Varla ye Wel' = 'Alchemical Solution of Sun'
    'Volen Magicka' = 'Alchemical Solution of Magical Constructs'
    'Wel' = 'Alchemical Solution of Air'
    'Wel sa Belle' = 'Alchemical Solution of Shock'
}

$srcFile = Join-Path $PSScriptRoot 'Elixir View.md'
Write-Host "Reading $srcFile..."
$content = [IO.File]::ReadAllText($srcFile, [Text.Encoding]::UTF8)

$count = 0
foreach ($old in $archetypeMap.Keys) {
    $new = $archetypeMap[$old]
    if ($content.Contains($old)) {
        $content = $content.Replace($old, $new)
        $count++
    }
}

[IO.File]::WriteAllText($srcFile, $content, [Text.Encoding]::UTF8)
Write-Host "Applied $count archetype replacements"
