# Fix mojibake using explicit Unicode codepoints (avoids any source-encoding ambiguity)
import io, sys, re

path = r'D:\DB\game\DB Begriffe website\data.js'

with io.open(path, 'r', encoding='utf-8') as f:
    c = f.read()

# Mojibake patterns: a UTF-8 string was decoded as Latin-1, then re-encoded as UTF-8.
# Result: each original UTF-8 byte becomes one Unicode codepoint in the latin-1 range,
# then re-encoded those become multi-byte UTF-8 sequences.
# When the file is now read as UTF-8, those codepoints come back as-is.
#
# So we need to: find sequences of latin-1-range codepoints, convert them to bytes,
# decode as UTF-8 to recover the original character.

mojibake_map = {
    'Ã¤': 'ä',  # ä
    'Ã¶': 'ö',  # ö
    'Ã¼': 'ü',  # ü
    'Ã': 'ß',  # ß
    'Ã': 'Ä',  # Ä
    'Ã': 'Ö',  # Ö
    'Ã': 'Ü',  # Ü
    'Â§': '§',  # §
    'Â°': '°',  # °
    'Â·': '·',  # ·
    'â': '—',  # —  em dash
    'â': '–',  # –  en dash
    'â': '’',  # '  right single quote
    'â': '“',  # "  left double quote
    'â': '”',  # "  right double quote
    'â¦': '…',  # ...
}

orig = c
report = []
for bad, good in mojibake_map.items():
    n = c.count(bad)
    if n:
        c = c.replace(bad, good)
        report.append((repr(bad), repr(good), n))

if report:
    for b, g, n in report:
        sys.stdout.write(f'  {b} -> {g}: {n}\n')

# General-purpose recovery: try to recover any remaining mojibake sequences
# Pattern: codepoints in U+0080-U+00FF that, when reinterpreted as latin-1 bytes,
# form valid UTF-8.
def try_recover(s):
    # Find runs of latin-1-extended characters
    out = []
    i = 0
    while i < len(s):
        # Start of a possible mojibake run
        if 0x80 <= ord(s[i]) <= 0xFF:
            j = i
            while j < len(s) and 0x80 <= ord(s[j]) <= 0xFF:
                j += 1
            chunk = s[i:j]
            try:
                bytes_ = chunk.encode('latin-1')
                recovered = bytes_.decode('utf-8')
                out.append(recovered)
            except (UnicodeEncodeError, UnicodeDecodeError):
                out.append(chunk)
            i = j
        else:
            out.append(s[i])
            i += 1
    return ''.join(out)

c2 = try_recover(c)
if c2 != c:
    sys.stdout.write(f'General recovery changed {len(c) - len(c2)} chars (length diff)\n')
    c = c2

if c != orig:
    with io.open(path, 'w', encoding='utf-8', newline='') as f:
        f.write(c)
    sys.stdout.write('File updated.\n')
else:
    sys.stdout.write('No changes.\n')

# Verify - check that category names are now correct
import re
ids = re.findall(r'id:\s*(\d+)', c)
sys.stdout.write(f'Total cards: {len(ids)}\n')

# Use codepoint-based string comparison
target_cats = [
    ('Grundsätze & Räume', 30),
    ('Geodäsie & Systeme', 45),
    ('Gleisgeometrie & Trassierung', 25),
]
for cat, expected in target_cats:
    n = c.count(f'cat: "{cat}"')
    sys.stdout.write(f'  cat U+{ord(cat[0]):04X}...: expected {expected}, found {n}\n')

# Show one sample card
m = re.search(r'\{ id: 203,[^}]+\}', c)
if m:
    sample = m.group(0)
    sys.stdout.write(f'\nSample card 203 (length {len(sample)}):\n')
    sys.stdout.write(repr(sample[:200]) + '\n')
