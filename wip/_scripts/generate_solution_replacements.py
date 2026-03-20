#!/usr/bin/env python3
"""
Generate Solutions-View.md replacement pairs
Converts old Ayleid names to new Alchemical Solution format
"""

import re
import sys
from pathlib import Path

# Archetype mapping (Ayleid name -> Archetype)
ARCHETYPE_MAP = {
    "Agea": "Magicka",
    "Agea Arden": "Resistances",
    "Aka ry Relleis": "Time",
    "Altadoon": "Weapons",
    "Altadoon ry Bet": "Diseases",
    "Arden": "Shield",
    "Ayammis": "Life",
    "Ayammis Malata": "Souls",
    "Bal": "Earth",
    "Betaltadoon": "Poisons",
    "Betayammis": "Creatures",
    "Dunayammis": "Undead",
    "Dunruhn": "Trap",
    "Ghartok": "Stamina",
    "Karan": "Armor",
    "Karan Kogo": "Force",
    "Karen Kogo": "Force",
    "Karan ry Ayammis": "Health",
    "Latta": "Light",
    "Latta Loria": "Shadow",
    "Mafre": "Frost",
    "Mallari": "Metal",
    "Malatu Magicka": "Arcane Energy",
    "Mer Ayammis": "Mortals",
    "Mer ry Wel": "Apparitions",
    "Mer Garlas": "Flesh",
    "Molag": "Fire",
    "Mora": "Nature",
    "Pellenni Ayammis": "Daedra",
    "Relleis": "Water",
    "Rellers ry Molag": "Acid",
    "Varla ye Wel": "Sun",
    "Volen Magicka": "Magical Constructs",
    "Wel": "Air",
    "Wel sa Belle": "Shock",
}

# Strength mapping (suffix -> strength name)
STRENGTH_MAP = {
    "sa Haelia": "Diluted",
    "sa Goria": "Weak",
    "sa Gravia": "Mild",
    "sa Baune": "Strong",
    "sa Adonai": "Potent",
    "sa Sila": "Concentrated",
}

def parse_solution_row(raw_solution):
    """
    Parse a solution name and extract components.
    Returns: (ayleid_name, strength_suffix, archetype_in_parens) or None
    """
    # Normalize multiple spaces
    trimmed = re.sub(r'\s+', ' ', raw_solution.strip())
    
    # Extract (Archetype) from the end
    match = re.match(r'^(.+?)\s*\((.+?)\)\s*$', trimmed)
    if not match:
        return None
    
    name_and_strength = match.group(1).strip()
    archetype_in_parens = match.group(2).strip()
    
    # Parse the Ayleid name and strength
    # Look for "sa " as the separator
    sa_match = re.match(r'^(.+?)\s+(sa\s+\w+)\s*$', name_and_strength)
    if not sa_match:
        return None
    
    ayleid_name = sa_match.group(1).strip()
    strength_suffix = sa_match.group(2).strip()
    
    return (ayleid_name, strength_suffix, archetype_in_parens)

def main():
    file_path = Path(r"c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\Solutions-View.md")
    output_file = Path(r"c:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\wip\solution-replacements.txt")
    
    if not file_path.exists():
        print(f"ERROR: File not found: {file_path}")
        sys.exit(1)
    
    # Read the file
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    lines = content.split('\n')
    
    replacements = []
    in_table = False
    
    for line in lines:
        # Skip until we find the table header
        if re.match(r'^\|\s*Solution\s*\|\s*Base\s*Ingredient', line):
            in_table = True
            continue
        
        # Stop when we hit the closing div
        if line.strip() == "</div>" and in_table:
            in_table = False
            break
        
        # Process table rows
        if in_table and line.startswith("|"):
            # Skip separator rows
            if re.match(r'^\|\s*:?---', line):
                continue
            
            # Extract solution name from first cell
            match = re.match(r'^\|\s*(.+?)\s*\|\s*', line)
            if not match:
                continue
            
            solution_raw = match.group(1).strip()
            
            # Skip if it's a header
            if solution_raw == "Solution":
                continue
            
            # Skip empty rows
            if not solution_raw:
                continue
            
            print(f"Processing: {solution_raw}")
            
            # Parse the solution
            parse_result = parse_solution_row(solution_raw)
            if not parse_result:
                print(f"  WARNING: Could not parse: {solution_raw}")
                continue
            
            ayleid_name, strength_suffix, archetype_in_parens = parse_result
            
            # Look up the archetype
            archetype = ARCHETYPE_MAP.get(ayleid_name)
            
            # Look up the strength
            strength = STRENGTH_MAP.get(strength_suffix)
            
            if archetype and strength:
                new_name = f"Alchemical Solution of {archetype} ({strength})"
                replacement = f"{solution_raw} | {new_name}"
                replacements.append(replacement)
                print(f"  -> {new_name}")
            else:
                print(f"  ERROR: Could not map")
                print(f"    Ayleid: {ayleid_name} (found: {archetype})")
                print(f"    Strength: {strength_suffix} (found: {strength})")
    
    # Remove duplicates and sort
    unique_replacements = sorted(set(replacements))
    
    # Write output
    print(f"\n=== SUMMARY ===")
    print(f"Total unique replacements: {len(unique_replacements)}")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        for replacement in unique_replacements:
            f.write(replacement + '\n')
    
    print(f"Output saved to: {output_file}")
    print(f"\nFirst 10 replacements:")
    for replacement in unique_replacements[:10]:
        print(f"  {replacement}")

if __name__ == "__main__":
    main()
