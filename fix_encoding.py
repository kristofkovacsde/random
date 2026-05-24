import io

path = r'D:\DB\game\DB Begriffe website\data.js'

with io.open(path, 'r', encoding='utf-8') as f:
    content = f.read()

# Mojibake from double UTF-8 encoding (UTF-8 bytes read as Latin-1, then re-encoded as UTF-8)
replacements = [
    ('Ã¤', 'ä'),  # Ã¤ -> ä
    ('Ã¶', 'ö'),  # Ã¶ -> ö
    ('Ã¼', 'ü'),  # Ã¼ -> ü
    ('Ã', 'ß'),  # ÃŸ -> ß
    ('Ã', 'Ä'),  # Ã„ -> Ä
    ('Ã', 'Ö'),  # Ã– -> Ö
    ('Ã', 'Ü'),  # Ãœ -> Ü
    ('Â§', '§'),  # Â§ -> §
    ('Â°', '°'),  # Â° -> °
]

before = content
for bad, good in replacements:
    n = content.count(bad)
    content = content.replace(bad, good)
    print(f'  {bad!r:20} -> {good!r:6}  ({n} replacements)')

if content == before:
    print('No changes needed.')
else:
    with io.open(path, 'w', encoding='utf-8', newline='') as f:
        f.write(content)
    print('File updated.')

# Verify
with io.open(path, 'r', encoding='utf-8') as f:
    content = f.read()
import re
# Count cards
m = re.findall(r'\{\s*id:\s*(\d+)', content)
print(f'Total cards: {len(m)}')
# Show category samples
for marker in ['Grundsätze & Räume', 'Geodäsie & Systeme', 'Gleisgeometrie & Trassierung']:
    n = content.count(f'"{marker}"')
    print(f'  cat "{marker}": {n}')
