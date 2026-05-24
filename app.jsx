const { useState, useEffect, useMemo, useRef } = React;

// ---------- PIN Gate ----------
const PIN_CODE = "3311";
const MAX_ATTEMPTS = 2;

function PinGate({ children }) {
  const [unlocked, setUnlocked] = useState(false);
  const [pin, setPin] = useState("");
  const [attempts, setAttempts] = useState(0);
  const [error, setError] = useState("");

  function handleSubmit(e) {
    e.preventDefault();
    if (pin === PIN_CODE) {
      setUnlocked(true);
    } else {
      const next = attempts + 1;
      setAttempts(next);
      setPin("");
      if (next >= MAX_ATTEMPTS) {
        setError("Gesperrt. Zu viele Fehlversuche.");
      } else {
        setError("Falscher Code. Noch 1 Versuch.");
      }
    }
  }

  if (unlocked) return children;

  const locked = attempts >= MAX_ATTEMPTS;

  return (
    <div className="pin-gate">
      <div className="pin-box">
        <div className="pin-icon" aria-hidden="true">
          <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
            <rect x="6" y="14" width="20" height="14" rx="3" stroke="currentColor" strokeWidth="1.6"/>
            <path d="M10 14v-4a6 6 0 0112 0v4" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round"/>
            <circle cx="16" cy="21" r="2" fill="currentColor"/>
          </svg>
        </div>
        <h2 className="pin-title">Zugang <em>geschützt.</em></h2>
        {locked ? (
          <p className="pin-error pin-locked">Gesperrt. Zu viele Fehlversuche.</p>
        ) : (
          <form className="pin-form" onSubmit={handleSubmit}>
            {error && <p className="pin-error">{error}</p>}
            <input
              type="password"
              inputMode="numeric"
              className="pin-input"
              maxLength={4}
              value={pin}
              onChange={e => setPin(e.target.value.replace(/\D/g, "").slice(0, 4))}
              placeholder="· · · ·"
              autoFocus
              autoComplete="off"
            />
            <button type="submit" className="ctrl-btn primary pin-submit" disabled={pin.length !== 4}>
              Entsperren
            </button>
          </form>
        )}
      </div>
    </div>
  );
}

// ---------- Storage ----------
const STORAGE_KEY = "db_begriffe_v2";

function loadCards() {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw) {
      const parsed = JSON.parse(raw);
      if (Array.isArray(parsed) && parsed.length) return parsed;
    }
  } catch (e) {}
  return window.BEGRIFFE_DEFAULTS.slice();
}
function saveCards(cards) {
  try { localStorage.setItem(STORAGE_KEY, JSON.stringify(cards)); } catch (e) {}
}

// ---------- Utils ----------
function shuffle(arr) {
  const a = arr.slice();
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

const CATEGORIES = [
  "Bezugssysteme & Festpunkte",
  "Trassenelemente & Achsverlauf",
  "Außendienst & Instrumente",
  "Sicherheit, Betrieb & Rollen",
  "Richtlinie 883.9010",
  "Grundsätze & Räume",
  "Geodäsie & Systeme",
  "Gleisgeometrie & Trassierung"
];

// ---------- Root ----------
function App() {
  const [cards, setCards] = useState(loadCards);
  const [mode, setMode] = useState("karteikarten");
  const [activeCat, setActiveCat] = useState("Alle");
  const [editingCard, setEditingCard] = useState(null); // card object or {} for new
  const [showInfo, setShowInfo] = useState(false);

  useEffect(() => { saveCards(cards); }, [cards]);

  const visibleCards = useMemo(() => {
    if (activeCat === "Alle") return cards;
    return cards.filter(c => c.cat === activeCat);
  }, [cards, activeCat]);

  function upsertCard(card) {
    setCards(prev => {
      if (card.id && prev.some(c => c.id === card.id)) {
        return prev.map(c => c.id === card.id ? card : c);
      }
      const id = Math.max(0, ...prev.map(c => c.id || 0)) + 1;
      return [...prev, { ...card, id }];
    });
  }
  function deleteCard(id) {
    setCards(prev => prev.filter(c => c.id !== id));
  }
  return (
    <div className="app">
      <Header
        mode={mode} setMode={setMode}
        onAdd={() => setEditingCard({})}
        onInfo={() => setShowInfo(true)}
      />

      <CategoryBar
        activeCat={activeCat}
        setActiveCat={setActiveCat}
        cards={cards}
      />

      <main className="stage">
        {mode === "karteikarten" && (
          <KarteikartenView
            cards={visibleCards}
            onEdit={setEditingCard}
            onDelete={deleteCard}
          />
        )}
        {mode === "liste" && (
          <ListView
            cards={visibleCards}
            onEdit={setEditingCard}
            onDelete={deleteCard}
          />
        )}
      </main>


      {editingCard && (
        <CardEditor
          card={editingCard}
          onSave={(c) => { upsertCard(c); setEditingCard(null); }}
          onCancel={() => setEditingCard(null)}
          onDelete={editingCard.id ? () => { deleteCard(editingCard.id); setEditingCard(null); } : null}
        />
      )}
      {showInfo && <InfoModal onClose={() => setShowInfo(false)} />}
    </div>
  );
}

// ---------- Header ----------
function Header({ mode, setMode, onAdd, onInfo }) {
  return (
    <header className="site-header">
      <div className="brand">
        <div className="brand-mark" aria-hidden="true">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
            <rect x="2" y="6" width="20" height="12" rx="1.5" stroke="currentColor" strokeWidth="1.4"/>
            <path d="M2 11h20M6 18v2M18 18v2" stroke="currentColor" strokeWidth="1.4" strokeLinecap="round"/>
            <circle cx="8" cy="14.5" r="1" fill="currentColor"/>
            <circle cx="16" cy="14.5" r="1" fill="currentColor"/>
          </svg>
        </div>
        <div className="brand-text">
          <div className="brand-eyebrow">Lernkarten · Gleis- und Bauvermessung</div>
          <h1 className="brand-title">Begriffe &amp; <em>Definitionen</em></h1>
        </div>
      </div>

      <div className="header-actions">
        <div className="mode-switch" role="tablist">
          {[
            { k: "karteikarten", label: "Flashcards" },
            { k: "liste", label: "Glossar" }
          ].map(o => (
            <button
              key={o.k}
              role="tab"
              aria-selected={mode === o.k}
              className={"mode-btn " + (mode === o.k ? "is-active" : "")}
              onClick={() => setMode(o.k)}
            >{o.label}</button>
          ))}
        </div>
        <button className="icon-btn" title="Neue Karte" onClick={onAdd} aria-label="Neue Karte">
          <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
            <path d="M8 3v10M3 8h10" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round"/>
          </svg>
          <span>Neue Karte</span>
        </button>
        <button className="icon-btn ghost" title="Info" onClick={onInfo} aria-label="Info">
          <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
            <circle cx="8" cy="8" r="6.5" stroke="currentColor" strokeWidth="1.2"/>
            <path d="M8 7v4M8 5.2v.1" stroke="currentColor" strokeWidth="1.4" strokeLinecap="round"/>
          </svg>
        </button>
      </div>
    </header>
  );
}

// ---------- Category bar ----------
function CategoryBar({ activeCat, setActiveCat, cards }) {
  const counts = useMemo(() => {
    const out = { Alle: cards.length };
    for (const c of cards) out[c.cat] = (out[c.cat] || 0) + 1;
    return out;
  }, [cards]);
  return (
    <nav className="cat-bar">
      {["Alle", ...CATEGORIES].map(c => (
        <button
          key={c}
          className={"cat-pill " + (activeCat === c ? "is-active" : "")}
          onClick={() => setActiveCat(c)}
        >
          <span>{c}</span>
          <span className="cat-count">{counts[c] || 0}</span>
        </button>
      ))}
    </nav>
  );
}

// ============================================================
// KARTEIKARTEN MODE
// ============================================================
function KarteikartenView({ cards, onEdit, onDelete }) {
  const [order, setOrder] = useState(() => cards.map((_, i) => i));
  const [idx, setIdx] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [known, setKnown] = useState(() => new Set());
  const [autoplay, setAutoplay] = useState(false);
  const [direction, setDirection] = useState(1);
  const touchRef = useRef(null);

  // Reset when card list (length / ids) changes
  const sig = cards.map(c => c.id).join(",");
  useEffect(() => {
    setOrder(cards.map((_, i) => i));
    setIdx(0); setFlipped(false); setKnown(new Set());
  }, [sig]);

  useEffect(() => { setFlipped(false); }, [idx]);

  useEffect(() => {
    if (!autoplay) return;
    const t = setTimeout(() => {
      if (!flipped) setFlipped(true);
      else next();
    }, flipped ? 3200 : 2200);
    return () => clearTimeout(t);
  });

  const card = cards[order[idx]];
  if (!card) {
    return (
      <div className="empty">
        <p>Keine Karten in dieser Kategorie. <em>Wähle eine andere Kategorie oder lege eine neue Karte an.</em></p>
      </div>
    );
  }

  function next() {
    setDirection(1);
    setIdx(i => (i + 1) % order.length);
  }
  function prev() {
    setDirection(-1);
    setIdx(i => (i - 1 + order.length) % order.length);
  }
  function doShuffle() {
    setOrder(shuffle(cards.map((_, i) => i)));
    setIdx(0); setFlipped(false);
  }
  function toggleKnown() {
    setKnown(k => {
      const n = new Set(k);
      if (n.has(card.id)) n.delete(card.id); else n.add(card.id);
      return n;
    });
  }

  // Keyboard
  useEffect(() => {
    function onKey(e) {
      if (e.target.tagName === "INPUT" || e.target.tagName === "TEXTAREA") return;
      if (e.key === " ") { e.preventDefault(); setFlipped(f => !f); }
      else if (e.key === "ArrowRight") next();
      else if (e.key === "ArrowLeft") prev();
      else if (e.key === "s" || e.key === "S") doShuffle();
      else if (e.key === "k" || e.key === "K") toggleKnown();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  });

  const progress = ((idx + 1) / order.length) * 100;
  const isKnown = known.has(card.id);

  return (
    <div className="karteikarten">
      <div className="kk-meta">
        <div className="kk-progress">
          <div className="kk-progress-track">
            <div className="kk-progress-fill" style={{ width: `${progress}%` }}/>
          </div>
          <div className="kk-progress-label">
            <span className="kk-idx">{String(idx + 1).padStart(2, "0")}</span>
            <span className="kk-of">/ {String(order.length).padStart(2, "0")}</span>
          </div>
        </div>
        <div className="kk-known">
          <span className="kk-known-num">{known.size}</span> gewusst
        </div>
      </div>

      <div
        className="card-wrap"
        onTouchStart={e => { touchRef.current = { x: e.touches[0].clientX, y: e.touches[0].clientY }; }}
        onTouchEnd={e => {
          if (!touchRef.current) return;
          const dx = e.changedTouches[0].clientX - touchRef.current.x;
          const dy = e.changedTouches[0].clientY - touchRef.current.y;
          touchRef.current = null;
          if (Math.abs(dx) < 50 || Math.abs(dy) > Math.abs(dx)) return;
          if (dx < 0) next(); else prev();
        }}
      >
        <button className="nav-arrow left" onClick={prev} aria-label="Zurück">
          <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M12 4l-6 6 6 6" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
          </svg>
        </button>

        <div
          key={card.id + ":" + idx}
          className={"card-anim dir-" + (direction > 0 ? "next" : "prev")}
        >
          <Flashcard
            card={card}
            flipped={flipped}
            onFlip={() => setFlipped(f => !f)}
            isKnown={isKnown}
            onEdit={() => onEdit(card)}
          />
        </div>

        <button className="nav-arrow right" onClick={next} aria-label="Weiter">
          <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M8 4l6 6-6 6" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
          </svg>
        </button>
      </div>

      <div className="kk-controls">
        <button className="ctrl-btn" onClick={doShuffle}>
          <Icon name="shuffle"/> <span>Mischen</span>
          <kbd>S</kbd>
        </button>
        <button className="ctrl-btn primary" onClick={() => setFlipped(f => !f)}>
          <Icon name="flip"/> <span>{flipped ? "Vorderseite" : "Umdrehen"}</span>
          <kbd>Leertaste</kbd>
        </button>
        <button className={"ctrl-btn " + (isKnown ? "is-known" : "")} onClick={toggleKnown}>
          <Icon name="check"/> <span>{isKnown ? "Gewusst" : "Als gewusst markieren"}</span>
          <kbd>K</kbd>
        </button>
        <label className={"ctrl-toggle " + (autoplay ? "is-on" : "")}>
          <input type="checkbox" checked={autoplay} onChange={e => setAutoplay(e.target.checked)} />
          <span>Auto</span>
        </label>
      </div>

      <div className="kk-hint">
        <em>Leertaste</em> umdrehen · <em>←/→</em> blättern · <em>S</em> mischen · <em>K</em> als gewusst markieren
      </div>
    </div>
  );
}

function Flashcard({ card, flipped, onFlip, isKnown, onEdit }) {
  return (
    <div className={"flashcard " + (flipped ? "is-flipped" : "")} onClick={onFlip}>
      <div className="card-face card-front">
        <div className="card-corner-top">
          <div className="card-cat">{card.cat}</div>
          <button
            className="card-edit"
            onClick={(e) => { e.stopPropagation(); onEdit(); }}
            aria-label="Karte bearbeiten"
          >
            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
              <path d="M2 12h10M9 2.5l2.5 2.5L5 11.5H2.5V9L9 2.5z" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
          </button>
        </div>
        <div className="card-body">
          <div className="card-de">{card.de}</div>
        </div>
        <div className="card-corner-bot">
          <span className="card-id">№ {String(card.id).padStart(2, "0")}</span>
          <span className="card-hint">Karte umdrehen <span className="dot">·</span></span>
          {isKnown && <span className="card-known-mark">✓ gewusst</span>}
        </div>
      </div>
      <div className="card-face card-back">
        <div className="card-corner-top">
          <div className="card-cat">{card.cat}</div>
          <div className="card-side-label">Rückseite</div>
        </div>
        <div className="card-body">
          {card.en && <div className="card-en"><em>{card.en}</em></div>}
          <div className="card-def">{card.def}</div>
        </div>
        <div className="card-corner-bot">
          <span className="card-id">№ {String(card.id).padStart(2, "0")}</span>
          <span className="card-hint">Zurück <span className="dot">·</span></span>
          {isKnown && <span className="card-known-mark">✓ gewusst</span>}
        </div>
      </div>
    </div>
  );
}

function Icon({ name }) {
  const stroke = "currentColor";
  if (name === "shuffle") return (
    <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
      <path d="M2 3h2l6 8h2M2 11h2l2-2.6M10 3h2l-1.5 1.5M10 11h2l-1.5-1.5" stroke={stroke} strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
    </svg>
  );
  if (name === "flip") return (
    <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
      <path d="M3 5a4 4 0 014-2.5h3M11 9a4 4 0 01-4 2.5H4M9 1l2 2-2 2M5 13l-2-2 2-2" stroke={stroke} strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
    </svg>
  );
  if (name === "check") return (
    <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
      <path d="M2.5 7.5l3 3 6-7" stroke={stroke} strokeWidth="1.4" strokeLinecap="round" strokeLinejoin="round"/>
    </svg>
  );
  return null;
}

// ============================================================
// LIST / GLOSSAR
// ============================================================
function ListView({ cards, onEdit, onDelete }) {
  const [query, setQuery] = useState("");
  const grouped = useMemo(() => {
    const q = query.trim().toLowerCase();
    const filtered = q
      ? cards.filter(c =>
          c.de.toLowerCase().includes(q) ||
          c.en.toLowerCase().includes(q) ||
          c.def.toLowerCase().includes(q))
      : cards;
    const map = new Map();
    for (const c of filtered) {
      if (!map.has(c.cat)) map.set(c.cat, []);
      map.get(c.cat).push(c);
    }
    return map;
  }, [cards, query]);

  return (
    <div className="liste">
      <div className="liste-toolbar">
        <input
          className="liste-search"
          placeholder="Begriff, Übersetzung oder Definition suchen …"
          value={query}
          onChange={e => setQuery(e.target.value)}
        />
      </div>
      {[...grouped.entries()].map(([cat, items]) => (
        <section key={cat} className="liste-section">
          <h3 className="liste-cat">{cat.toUpperCase()}</h3>
          <div className="rule thin"></div>
          <div className="liste-grid">
            {items.map(c => (
              <article key={c.id} className="liste-card">
                <div className="liste-head">
                  <span className="liste-de">{c.de}</span>
                  <span className="liste-mid">·</span>
                  <em className="liste-en">{c.en}</em>
                </div>
                <p className="liste-def">{c.def}</p>
                <div className="liste-actions">
                  <button className="link-btn" onClick={() => onEdit(c)}>Bearbeiten</button>
                </div>
              </article>
            ))}
          </div>
        </section>
      ))}
      {grouped.size === 0 && (
        <div className="empty"><p>Keine Treffer für <em>{query}</em>.</p></div>
      )}
    </div>
  );
}

// ============================================================
// EDITOR MODAL
// ============================================================
function CardEditor({ card, onSave, onCancel, onDelete }) {
  const [de, setDe] = useState(card.de || "");
  const [en, setEn] = useState(card.en || "");
  const [def, setDef] = useState(card.def || "");
  const [cat, setCat] = useState(card.cat || CATEGORIES[0]);
  const isNew = !card.id;

  function submit(e) {
    e?.preventDefault();
    if (!de.trim() || !en.trim()) return;
    onSave({ ...card, de: de.trim(), en: en.trim(), def: def.trim(), cat });
  }
  return (
    <div className="modal-scrim" onClick={onCancel}>
      <form className="modal" onClick={e => e.stopPropagation()} onSubmit={submit}>
        <div className="modal-head">
          <div className="modal-eyebrow">{isNew ? "NEUE KARTE" : "KARTE BEARBEITEN"}</div>
          <h2>{isNew ? "Begriff hinzufügen" : <span><em>{card.de}</em> bearbeiten</span>}</h2>
        </div>
        <label className="field">
          <span>Deutscher Fachbegriff</span>
          <input value={de} onChange={e => setDe(e.target.value)} required autoFocus/>
        </label>
        <label className="field">
          <span>Englisches Pendant</span>
          <input value={en} onChange={e => setEn(e.target.value)} required/>
        </label>
        <label className="field">
          <span>Definition</span>
          <textarea rows="3" value={def} onChange={e => setDef(e.target.value)}/>
        </label>
        <label className="field">
          <span>Kategorie</span>
          <select value={cat} onChange={e => setCat(e.target.value)}>
            {CATEGORIES.map(c => <option key={c} value={c}>{c}</option>)}
          </select>
        </label>
        <div className="modal-foot">
          {onDelete && (
            <button type="button" className="link-btn danger" onClick={() => {
              if (confirm("Diese Karte wirklich löschen?")) onDelete();
            }}>Löschen</button>
          )}
          <div className="modal-foot-right">
            <button type="button" className="ctrl-btn" onClick={onCancel}>Abbrechen</button>
            <button type="submit" className="ctrl-btn primary">{isNew ? "Hinzufügen" : "Speichern"}</button>
          </div>
        </div>
      </form>
    </div>
  );
}

function InfoModal({ onClose }) {
  return (
    <div className="modal-scrim" onClick={onClose}>
      <div className="modal info" onClick={e => e.stopPropagation()}>
        <div className="modal-head">
          <div className="modal-eyebrow">ANKI-EMPFEHLUNG</div>
          <h2>Wie du den Stapel <em>lernst.</em></h2>
        </div>
        <p>
          Lege jeden Begriff als Karte an: vorne den deutschen Fachbegriff,
          hinten die englische Entsprechung und die einzeilige Definition.
          Für die wichtigsten zwanzig Begriffe eine zweite Kartenart mit
          Englisch → Deutsch anlegen, weil du das Vokabular nicht nur verstehen,
          sondern auch produzieren wirst.
        </p>
        <p>
          <strong>Zwanzig neue Karten täglich · zehn Wiederholungen täglich</strong>
          <span className="muted"> — in etwa drei Wochen sitzt der Stapel.</span>
        </p>
        <div className="info-shortcuts">
          <div className="info-eyebrow">TASTATUR</div>
          <ul>
            <li><kbd>Leertaste</kbd> Karte umdrehen</li>
            <li><kbd>←</kbd> <kbd>→</kbd> blättern</li>
            <li><kbd>S</kbd> mischen</li>
            <li><kbd>K</kbd> als gewusst markieren</li>
          </ul>
        </div>
        <div className="modal-foot">
          <div></div>
          <button className="ctrl-btn primary" onClick={onClose}>Verstanden</button>
        </div>
      </div>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById("root")).render(<PinGate><App/></PinGate>);
