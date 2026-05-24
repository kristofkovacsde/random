import io, sys, os

files = [
    r'D:\DB\game\DB Begriffe website\data.js',
    r'D:\DB\game\DB Begriffe website\app.jsx',
    r'D:\DB\game\DB Begriffe website\styles.css',
    r'D:\DB\game\DB Begriffe website\index.html',
]

for path in files:
    with io.open(path, 'rb') as f:
        raw = f.read()
    name = os.path.basename(path)
    has_bom = raw.startswith(b'\xef\xbb\xbf')
    try:
        c = raw.decode('utf-8')
        utf8_ok = True
    except Exception as e:
        utf8_ok = False
        c = raw.decode('utf-8', errors='replace')

    # Look for common mojibake patterns
    patterns = {
        'Ã': c.count('Ã'),   # Ã prefix (ä->Ã¤ etc)
        'Â': c.count('Â'),   # Â prefix (§->Â§)
        'â': c.count('â'),  # â€ prefix (smart quotes)
        '\\xef\\xbf\\xbd': c.count('�'),  # replacement char
    }
    mojibake = {k: v for k, v in patterns.items() if v > 0}
    print(f'{name:14} utf8_ok={utf8_ok} bom={has_bom} bytes={len(raw)} mojibake={mojibake}')
