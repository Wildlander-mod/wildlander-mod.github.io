import csv
import re

# Read the CSV file
csv_file = r"C:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\_includes\DataFromAirtable\Known Issues 2-Grid view.csv"
output_file = r"C:\Users\mieek\Documents\GitHub\wildlander-mod.github.io\_includes\KnownIssuesTable.md"

# Read CSV with proper handling for multi-line cells
with open(csv_file, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    rows = list(reader)

# Process rows and create markdown table
markdown_lines = []
markdown_lines.append("| Issue ID | Category | Summary | Status |")
markdown_lines.append("|----------|----------|---------|--------|")

for row in rows:
    issue_id = row.get('Issue ID', '').strip()
    category = row.get('Our Category', '').strip()
    summary = row.get('Summary', '').strip()
    status = row.get('Status', '').strip()
    
    # Clean up markdown special characters and multi-line content
    summary = summary.replace('\n', ' ').replace('|', '\\|')
    
    # Skip empty rows
    if issue_id:
        markdown_lines.append(f"| {issue_id} | {category} | {summary} | {status} |")

# Write the markdown file
with open(output_file, 'w', encoding='utf-8') as f:
    f.write('\n'.join(markdown_lines))

print(f"Converted {len(rows)} rows to markdown table")
print(f"Output written to: {output_file}")
