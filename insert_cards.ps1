$dataPath = "D:\DB\game\DB Begriffe website\data.js"

$cards = @'
,
  // ============================================================
  // EXAMENS-KARTEIKARTEN · Ril 883.9010 (Fokus-Glossar, 100 Karten)
  // ============================================================
  { id: 203, cat: "Grundsätze & Räume", de: "Der Fahrweg (EBO § 4 (1))", en: "", def: "Umfasst alle Bauwerke und sonstigen Einrichtungen der Eisenbahn, die unter Berücksichtigung der örtlichen Verhältnisse zur Abwicklung oder Sicherung des Reise- oder Güterverkehrs auf der Schiene erforderlich sind. Dazu gehören laut § 4 (1) EBO auch Nebenbetriebsanlagen sowie sonstige Anlagen, die das Be- und Entladen sowie den Zu- und Abgang ermöglichen oder fördern." },
  { id: 204, cat: "Grundsätze & Räume", de: "Nebenbetriebsanlagen", en: "", def: "Anlagen einer Eisenbahn, die das Be- und Entladen sowie den Zu- und Abgang ermöglichen oder fördern (gemäß § 4 (1) EBO)." },
  { id: 205, cat: "Grundsätze & Räume", de: "Die Fahrbahn (Ril 883.9010)", en: "", def: "Der Teil des Fahrweges, welcher der unmittelbaren Führung der Fahrzeuge dient (Gleise und Weichen) sowie die ortsfesten Anlagen, welche unmittelbaren Einfluss auf Trassierungen und den Lichtraum haben." },
  { id: 206, cat: "Grundsätze & Räume", de: "Ortsfeste Anlagen", en: "", def: "Bauwerke (z. B. Mauern) oder technische Einrichtungen (z. B. Maste), die an ihrer Position mit dem Aufstellort (z. B. Erdreich, Fundament) stoff- bzw. kraftschlüssig verbunden und für einen längerfristigen Verbleib an dieser Stelle ausgelegt sind." },
  { id: 207, cat: "Grundsätze & Räume", de: "Ausschlusskriterien für ortsfeste Anlagen", en: "", def: "Natürliche Geländeformationen und Erdbauwerke (z. B. Bahndämme, Einschnitte) sind keine ortsfesten Anlagen im Sinne der Richtlinie." },
  { id: 208, cat: "Grundsätze & Räume", de: "Anerkannte Regeln der Technik (VV Bau)", en: "", def: "Alle auf wissenschaftlichen Erkenntnissen basierenden, in der Praxis bewährten und bei der überwiegenden Mehrheit der Anwender bekannten Regeln. Hierzu zählen auch die vom EBA als Technische Baubestimmungen verbindlich eingeführten Regeln." },
  { id: 209, cat: "Grundsätze & Räume", de: "Handbuch HB 88301", en: "", def: "Das technische Regelwerk für die Gleis- und Bauvermessung. Vom EBA per Schreiben vom 07.12.2020 mit Wirkung zum 01.01.2021 offiziell in die EiTB (Eisenbahn-Infrastruktur-Technische Baubestimmungen) aufgenommen." },
  { id: 210, cat: "Grundsätze & Räume", de: "Zuständigkeitsbereich des EBA", en: "", def: "Der rechtliche Einzugsbereich des Eisenbahn-Bundesamtes, innerhalb dessen die EiTB und das Handbuch HB 88301 für alle Eisenbahninfrastrukturunternehmen verbindlich anzuwenden sind." },
  { id: 211, cat: "Grundsätze & Räume", de: "Gleise (Sammelbegriff im HB 88301)", en: "", def: "Aus Gründen der leichteren Lesbarkeit wird im HB 88301 vereinfacht die Formulierung Gleise und Weichen benutzt, sofern keine weitere Unterscheidung erforderlich ist. Gleise steht dann für alle Gleise." },
  { id: 212, cat: "Grundsätze & Räume", de: "Weichen (Sammelbegriff im HB 88301)", en: "", def: "Sammelbezeichnung, die stellvertretend für Weichen, Bogenweichen, Kreuzungen, Kreuzungsweichen, Schienenauszüge und Hemmschuhauswurfvorrichtungen steht." },
  { id: 213, cat: "Grundsätze & Räume", de: "Streckengleise (Ril-Fam. 885)", en: "", def: "Gleise, für die eine vierstellige Streckennummer nach Ril-Fam. 885 vergeben ist." },
  { id: 214, cat: "Grundsätze & Räume", de: "Hauptgleise", en: "", def: "Die von Zügen planmäßig befahrenen Gleise." },
  { id: 215, cat: "Grundsätze & Räume", de: "Durchgehende Hauptgleise", en: "", def: "Die Hauptgleise der freien Strecke und ihre Fortsetzung in den Bahnhöfen." },
  { id: 216, cat: "Grundsätze & Räume", de: "Nebengleise", en: "", def: "Alle übrigen Gleise, die keine Hauptgleise sind (z. B. Rangiergleise, Abstellgleise, Ladegleise)." },
  { id: 217, cat: "Grundsätze & Räume", de: "Regelbauarten (Weichen)", en: "", def: "Standardisierte, in der Richtlinie Ril 800.0120 katalogisierte Konstruktionsformen von Weichen und Kreuzungen." },
  { id: 218, cat: "Grundsätze & Räume", de: "Sonderbauarten (Weichen)", en: "", def: "Spezifische, vom Standard abweichende geometrische Sonderkonstruktionen für besondere betriebliche Anforderungen, ebenfalls geregelt in Ril 800.0120." },
  { id: 219, cat: "Grundsätze & Räume", de: "Maßnahmenbereich", en: "", def: "Das Gebiet vor Ort, in dem die bauliche Maßnahme bzw. die örtliche Untersuchung oder Überwachung stattfindet." },
  { id: 220, cat: "Grundsätze & Räume", de: "Geodätischer Vermessungsbereich", en: "", def: "Der räumlich begrenzte Bereich vor Ort, der so zu begrenzen ist, dass der Maßnahmenbereich vollständig erfasst, die Verdichtung des Festpunktfeldes durchgeführt und die Vermessung in einer längeren Geraden bzw. einem längeren Bogen begonnen und beendet werden kann." },
  { id: 221, cat: "Grundsätze & Räume", de: "Vollständigkeitsgebot (Vermessungsbereich)", en: "", def: "Die Anforderung, dass der geodätische Vermessungsbereich den Maßnahmenbereich vor Ort vollständig und lückenlos umschließen muss." },
  { id: 222, cat: "Grundsätze & Räume", de: "Verdichtung des Festpunktfeldes", en: "", def: "Die geodätische Einmessung und Vermarkung zusätzlicher Anschlusspunkte im Nahbereich des Maßnahmenbereichs gemäß den Vorgaben der Richtlinie." },
  { id: 223, cat: "Grundsätze & Räume", de: "Geometrischer Vermessungsanschluss", en: "", def: "Die Vorschrift, dass die Vermessung von Gleisen und Weichen zwingend in einer längeren Geraden oder in einem längeren Bogen beginnen und enden muss." },
  { id: 224, cat: "Grundsätze & Räume", de: "Zwangspunktanschluss", en: "", def: "Die Sicherstellung des Anschlusses einer neuen Trassierung an Zwangspunkte der Trassierung in den Abschnitten, die an den Maßnahmenbereich anschließen." },
  { id: 225, cat: "Grundsätze & Räume", de: "Zwangspunktbereiche (Messvorschrift)", en: "", def: "Räumliche Abschnitte um ein trassierungsbestimmendes Objekt herum, die im Zuge einer Maßnahme zwingend vollständig mit vermessen und trassiert werden müssen." },
  { id: 226, cat: "Grundsätze & Räume", de: "Längenbegrenzung für Übergangssysteme", en: "", def: "Vorschrift, dass zwischen einer neuen Trassierung im DB_REF2016 und dem anschließenden Bestandsbereich (ebenfalls im DB_REF2016) keine Abschnitte mit anderen Bezugs- oder Abbildungssystemen verbleiben dürfen, die eine Länge kleiner oder gleich 1000 m aufweisen." },
  { id: 227, cat: "Grundsätze & Räume", de: "Geschäftsbereich Fahrweg", en: "", def: "Die betriebliche Organisationseinheit innerhalb der DB InfraGO AG, für die die technischen Bestimmungen der Richtlinie 883.9010 bindend sind." },
  { id: 228, cat: "Grundsätze & Räume", de: "Streckenachse", en: "", def: "Achse, die zur Charakterisierung des Streckenverlaufs dient. Sie kann die Symmetrieachse der Fahrbahnen sein. Zu unterscheiden von der Kilometrierungslinie." },
  { id: 229, cat: "Grundsätze & Räume", de: "Kilometrierungslinie", en: "", def: "Die offizielle, im Bestandswerk festgelegte Referenzlinie für Entfernungsangaben einer Strecke, von der die reale Streckenachse im Detail geometrisch abweichen kann." },
  { id: 230, cat: "Grundsätze & Räume", de: "Ril 800.0110", en: "", def: "Die bautechnische Richtlinie der DB für die Linienführung beim Entwurf von Schienenwegen (Netzinfrastruktur; Technik entwerfen)." },
  { id: 231, cat: "Grundsätze & Räume", de: "Ril 800.0120", en: "", def: "Die Richtlinie zur Auswahl der Weichen, Kreuzungen und Hemmschuhauswurfvorrichtungen." },
  { id: 232, cat: "Grundsätze & Räume", de: "Ril 800.0130", en: "", def: "Das Regelwerk für die Gestaltung und Bemessung von Streckenquerschnitten auf Erdkörpern." },
  { id: 233, cat: "Geodäsie & Systeme", de: "DB_REF-Festpunktfeld", en: "", def: "Das einheitliche geodätische Festpunktfeld der Deutschen Bahn AG mit örtlicher Realisierung durch dauerhafte Vermarkungspunkte." },
  { id: 234, cat: "Geodäsie & Systeme", de: "Exklusivitätsgebot des DB_REF", en: "", def: "Die Vorschrift, dass das DB_REF einheitlich und ausschließlich als geodätisches Bezugs- und Abbildungssystem für alle raumbezogenen Anwendungen der DB zu nutzen ist." },
  { id: 235, cat: "Geodäsie & Systeme", de: "Raumbezogene Anwendungen (DB_REF)", en: "", def: "Umfassen insbesondere geodätische Vermessungen, Trassierungen, Lichtraumvermessungen/-analysen, Geo-Monitoring, Ortung und Navigation, Dokumentation von Ergebnissen der Gleis- und Bauvermessung sowie Planungen." },
  { id: 236, cat: "Geodäsie & Systeme", de: "Koordinatenreferenzsystem (CRS)", en: "", def: "Satz von Parametern, der das Geodätische Datum und das Koordinatensystem umfasst (nach DIN 18709-6)." },
  { id: 237, cat: "Geodäsie & Systeme", de: "Geodätisches Datum (DIN 18709-6)", en: "", def: "Ein Satz von Parametern, mit denen die Lage des Ursprungs, die Orientierung der Koordinatenachsen und der Maßstab eines Koordinatensystems in Bezug auf den Erdkörper festgelegt werden." },
  { id: 238, cat: "Geodäsie & Systeme", de: "3D-Datumsparameter (Anzahl)", en: "", def: "Für ein dreidimensionales Koordinatensystem wird das geodätische Datum durch 7 Parameter angegeben: 3 für die Position des Ursprungs, 3 für die Orientierung der Achsen und 1 für den Maßstab." },
  { id: 239, cat: "Geodäsie & Systeme", de: "Zusammensetzung des DB_REF", en: "", def: "Umfasst das ETRS89 (Realisierung 2002), das 3°-Gauß-Krüger-Meridianstreifensystem auf einem Bessel-Ellipsoid sowie die Quasi-Geoidmodelle GCG2016 und EGG97DB_REF als physikalischen und mathematischen Teil des Koordinatenreferenzsystems." },
  { id: 240, cat: "Geodäsie & Systeme", de: "Geodätisches Bezugssystem DB_REF2016", en: "", def: "Das geodätische Bezugssystem aller Neuvermessungen und deren Dokumentation ab dem Stichtag 01.12.2016." },
  { id: 241, cat: "Geodäsie & Systeme", de: "Lagekomponente DB_REF2016", en: "", def: "Geodätisches Datum identisch zum ETRS89, abgebildet über das Gauß-Krüger-Meridianstreifensystem auf dem Bessel-Ellipsoid." },
  { id: 242, cat: "Geodäsie & Systeme", de: "Höhenkomponente DB_REF2016", en: "", def: "Normalhöhen, berechnet über das Quasi-Geoidmodell GCG2016 auf dem GRS80-Ellipsoid." },
  { id: 243, cat: "Geodäsie & Systeme", de: "Geodätische Grundnetzpunkte PS0", en: "", def: "Der Bezugsrahmen des DB_REF-Festpunktfeldes. Sie bilden den Bezugsrahmen sowohl des DB_REF2003 als auch des DB_REF2016." },
  { id: 244, cat: "Geodäsie & Systeme", de: "PS1-Punkte", en: "", def: "Punkte des DB-Festpunktfeldes, die mit physikalischem Höhenanschluss an PS0-Punkte bestimmt wurden." },
  { id: 245, cat: "Geodäsie & Systeme", de: "Geodätisches Bezugssystem DB_REF2003", en: "", def: "Bezugssystem der DB für ältere Datenbestände. Lageidentisch zu DB_REF2016, nutzt jedoch für die Höhen das EGG97DB_REF-Geoid auf dem Bessel-Ellipsoid." },
  { id: 246, cat: "Geodäsie & Systeme", de: "Höhenkomponente DB_REF2003", en: "", def: "Normalhöhen basierend auf dem modifizierten europäischen Geoidmodell EGG97DB_REF auf dem Bessel-Ellipsoid." },
  { id: 247, cat: "Geodäsie & Systeme", de: "Bestanpassung des DB_REF", en: "", def: "Das geodätische Datum des DB_REF wurde bestanpassend an das DHDN90 gewählt und ist aus dem ETRS89 ableitbar." },
  { id: 248, cat: "Geodäsie & Systeme", de: "Bessel-Ellipsoid (Parameter a)", en: "", def: "Die große Halbachse des im DB_REF genutzten Bessel-Referenzellipsoids: a = 6.377.397,155 m." },
  { id: 249, cat: "Geodäsie & Systeme", de: "Bessel-Ellipsoid (Parameter 1/f)", en: "", def: "Der Kehrwert der Abplattung des Bessel-Ellipsoids: 1/f = 299,15281." },
  { id: 250, cat: "Geodäsie & Systeme", de: "Datumsübergang", en: "", def: "Der Koordinatenwechsel zwischen den Systemen ETRS89 und DB_REF mittels einer 7-Parameter-Transformation (Helmert-Transformation)." },
  { id: 251, cat: "Geodäsie & Systeme", de: "Translation dX (ETRS89 nach DB_REF)", en: "", def: "Verschiebungswert entlang der X-Achse: dX = -584,9567 m." },
  { id: 252, cat: "Geodäsie & Systeme", de: "Translation dY (ETRS89 nach DB_REF)", en: "", def: "Verschiebungswert entlang der Y-Achse: dY = -107,7277 m." },
  { id: 253, cat: "Geodäsie & Systeme", de: "Translation dZ (ETRS89 nach DB_REF)", en: "", def: "Verschiebungswert entlang der Z-Achse: dZ = -413,8036 m." },
  { id: 254, cat: "Geodäsie & Systeme", de: "Maßstabsfaktor (ETRS89 nach DB_REF)", en: "", def: "Maßstäbliche Anpassung beim Datumsübergang: -7,992171 ppm (parts per million)." },
  { id: 255, cat: "Geodäsie & Systeme", de: "Rotation rX (ETRS89 nach DB_REF)", en: "", def: "Achsendrehung um die X-Achse: rX = +1,1155257601 Bogensekunden." },
  { id: 256, cat: "Geodäsie & Systeme", de: "Rotation rY (ETRS89 nach DB_REF)", en: "", def: "Achsendrehung um die Y-Achse: rY = +0,2824170155 Bogensekunden." },
  { id: 257, cat: "Geodäsie & Systeme", de: "Rotation rZ (ETRS89 nach DB_REF)", en: "", def: "Achsendrehung um die Z-Achse: rZ = -3,1384505907 Bogensekunden." },
  { id: 258, cat: "Geodäsie & Systeme", de: "Inverser Datumsübergang (DB_REF nach ETRS89)", en: "", def: "Die Rücktransformation von Koordinaten aus dem DB_REF in das globale ETRS89 unter Verwendung der inversen Parameter." },
  { id: 259, cat: "Geodäsie & Systeme", de: "Translation dX (DB_REF nach ETRS89)", en: "", def: "Inverser Verschiebungswert entlang der X-Achse: dX = +584,9636 m." },
  { id: 260, cat: "Geodäsie & Systeme", de: "Translation dY (DB_REF nach ETRS89)", en: "", def: "Inverser Verschiebungswert entlang der Y-Achse: dY = +107,7175 m." },
  { id: 261, cat: "Geodäsie & Systeme", de: "Translation dZ (DB_REF nach ETRS89)", en: "", def: "Inverser Verschiebungswert entlang der Z-Achse: dZ = +413,8067 m." },
  { id: 262, cat: "Geodäsie & Systeme", de: "Maßstabsfaktor (DB_REF nach ETRS89)", en: "", def: "Inverser Maßstabsfaktor der Rücktransformation: +7,992235 ppm." },
  { id: 263, cat: "Geodäsie & Systeme", de: "Rotation rX (DB_REF nach ETRS89)", en: "", def: "Inverse Achsendrehung um die X-Achse: rX = -1,1155214628 Bogensekunden." },
  { id: 264, cat: "Geodäsie & Systeme", de: "Rotation rY (DB_REF nach ETRS89)", en: "", def: "Inverse Achsendrehung um die Y-Achse: rY = -0,2824339890 Bogensekunden." },
  { id: 265, cat: "Geodäsie & Systeme", de: "Rotation rZ (DB_REF nach ETRS89)", en: "", def: "Inverse Achsendrehung um die Z-Achse: rZ = +3,1384490633 Bogensekunden." },
  { id: 266, cat: "Geodäsie & Systeme", de: "Gauß-Krüger-Abbildung (Meridianstreifen)", en: "", def: "Das Abbildungsverfahren zur Verebnung des DB_REF, ausgeführt in 3° breiten Meridianstreifen." },
  { id: 267, cat: "Geodäsie & Systeme", de: "Mittelmeridiane für Deutschland", en: "", def: "Die zentralen Längengrade für die Streifenbildung der Gauß-Krüger-Projektion: 6°, 9°, 12° und 15° östliche Länge." },
  { id: 268, cat: "Geodäsie & Systeme", de: "Ellipsoidische Höhe (Geometrische Höhe)", en: "", def: "Der senkrechte Abstand eines Punktes von der geometrischen Oberfläche des gewählten Referenzellipsoids (GRS80). Erhält keine Schwerkraftkomponente." },
  { id: 269, cat: "Geodäsie & Systeme", de: "Normalhöhen (Physikalische Höhen)", en: "", def: "Schwerebezogene, physikalische Höhen, die auf dem amtlichen Normalhöhennull-Niveau basieren." },
  { id: 270, cat: "Geodäsie & Systeme", de: "Quasi-Geoidmodell GCG2016 (Zweck)", en: "", def: "German Combined Quasigeoid 2016. Repräsentiert die Höhenbezugsfläche des amtlichen bundesweit einheitlichen Höhenbezugsrahmens und ermöglicht die Überführung von geometrisch definierten ellipsoidischen Höhen im ETRS89 in physikalisch definierte Normalhöhen." },
  { id: 271, cat: "Geodäsie & Systeme", de: "EGG97DB_REF-Geoid (Charakteristik)", en: "", def: "Ein modifiziertes europäisches EGG97-Geoidmodell, das zusätzlich über rund 340 Nivellementspunkte der I. Ordnung gelagert wurde. Hat eine höhere innere Genauigkeit als das EGG97." },
  { id: 272, cat: "Geodäsie & Systeme", de: "Höhenhorizont (Definition)", en: "", def: "Die durch die DB_REF-GGP im Raum konkret realisierte und definierte Bezugsfläche für alle Höhenmessungen." },
  { id: 273, cat: "Geodäsie & Systeme", de: "Höhenanschluss (Zwingende Vorschrift)", en: "", def: "Der Höhenanschluss muss ausschließlich durch Anschluss an die DB_REF-GGP erfolgen." },
  { id: 274, cat: "Geodäsie & Systeme", de: "Geodätische Altsysteme", en: "", def: "Systeme ungleich dem DB_REF2003 oder dem DB_REF2016." },
  { id: 275, cat: "Geodäsie & Systeme", de: "Abweichung DB_REF zu DHDN90", en: "", def: "Die Gauß-Krüger-Abbildungen des DB_REF und des DHDN90 weichen um 0,5 m bis 1,0 m voneinander ab, in den Grenzbereichen der BRD um bis zu 3 m." },
  { id: 276, cat: "Geodäsie & Systeme", de: "Transformationsverbot für Ingenieurberechnungen", en: "", def: "Aus dem DHDN90 transformierte Koordinaten dürfen nicht für Berechnungen, Trassierungen, geodätische Aufnahmen oder ähnliches verwendet werden." },
  { id: 277, cat: "Geodäsie & Systeme", de: "Zulässiger Verwendungszweck für DHDN90-Altdaten", en: "", def: "Die Verwendung transformierter Koordinaten aus dem DHDN90 ist ausschließlich auf grafische Darstellungen begrenzt und mit Hinweis auf die Herkunft aus Transformation zu versehen." },
  { id: 278, cat: "Gleisgeometrie & Trassierung", de: "Geodätische Sicht", en: "", def: "Die absolute Betrachtungsweise des Fahrweges, verankert im globalen Festpunktfeld zur Sicherung der langfristigen Raumstabilität und Zwangspunktkonformität." },
  { id: 279, cat: "Gleisgeometrie & Trassierung", de: "Geometrische Sicht", en: "", def: "Die relative Betrachtungsweise des Gleisverlaufs in sich zur Überprüfung und Einhaltung von Toleranzen mittels spezifischer Messverfahren." },
  { id: 280, cat: "Gleisgeometrie & Trassierung", de: "Relative Gleisgeometrie (Innere Geometrie)", en: "", def: "Die Beschreibung der Form von Gleisen und Weichen als Raumkurve (Trasse) mittels geometrischer Trassierungselemente." },
  { id: 281, cat: "Gleisgeometrie & Trassierung", de: "Stetigkeitskriterium", en: "", def: "Das maßgebliche Kriterium für die innere Gleisgeometrie. Sie wird bestimmt durch die Stetigkeit benachbarter Gleispunkte in Lage, Höhe und Überhöhung." },
  { id: 282, cat: "Gleisgeometrie & Trassierung", de: "Pfeilhöhenmessung", en: "", def: "Das Messverfahren zur Ermittlung von Lage und Höhe der relativen Gleisgeometrie über Pfeilhöhen auf Bezugssehnen." },
  { id: 283, cat: "Gleisgeometrie & Trassierung", de: "Relevanz der inneren Gleisgeometrie", en: "", def: "Die relative Gleisgeometrie ist wesentlich für den Fahrkomfort und den Verschleiß der Gleise und Weichen." },
  { id: 284, cat: "Gleisgeometrie & Trassierung", de: "Absolute Gleisgeometrie (Äußere Geometrie)", en: "", def: "Die Beschreibung von Gleisen und Weichen als geodätisch absolut in einem übergeordneten geodätischen Bezugsrahmen (DB_REF-Festpunktfeld) positionierte Raumkurve (Trasse)." },
  { id: 285, cat: "Gleisgeometrie & Trassierung", de: "Bestimmungselemente der äußeren Geometrie", en: "", def: "Wird bestimmt durch Achshauptpunkte mit Koordinaten im DB_REF2016 und geometrische Trassierungselemente zwischen benachbarten Achshauptpunkten." },
  { id: 286, cat: "Gleisgeometrie & Trassierung", de: "Relevanz der äußeren Gleisgeometrie", en: "", def: "Sie ist wesentlich für den Bezug zu Zwangspunkten der Trassierung, die Lichtraumfreiheit und die Erhaltung der absoluten Gleisposition." },
  { id: 287, cat: "Gleisgeometrie & Trassierung", de: "Die Trasse (DIN 18709)", en: "", def: "Räumlicher Verlauf einer langgestreckten Anlage (gemäß DIN 18709)." },
  { id: 288, cat: "Gleisgeometrie & Trassierung", de: "Die Trassierung (DIN 18709)", en: "", def: "Festlegung einer dreidimensionalen Linienführung als Folge von geometrisch definierten Linienelementen für eine Trasse (gemäß DIN 18709)." },
  { id: 289, cat: "Gleisgeometrie & Trassierung", de: "Der Trassierungsentwurf (DIN 18709)", en: "", def: "Darstellung einer geplanten Trassierung (gemäß DIN 18709)." },
  { id: 290, cat: "Gleisgeometrie & Trassierung", de: "Achshauptpunkte (Allgemein)", en: "", def: "Punkte, die repräsentieren, an welchen Stellen geometrische Trassierungselemente beginnen, enden oder unterbrochen werden. Sie sind im DB_REF2016 koordiniert." },
  { id: 291, cat: "Gleisgeometrie & Trassierung", de: "Achshauptpunkte der Lage (Beispiele)", en: "", def: "Horizontale Übergangspunkte: BA (Bogenanfang), BW (Bogenwechsel), BE (Bogenende), UA (Übergangsbogenanfang) und UE (Übergangsbogenende)." },
  { id: 292, cat: "Gleisgeometrie & Trassierung", de: "Bloss-Hauptpunkte (Lage)", en: "", def: "Kennzeichnungen für Übergangsbögen nach Bloss: UAB (Anfang) und UEB (Ende)." },
  { id: 293, cat: "Gleisgeometrie & Trassierung", de: "S-Form-Hauptpunkte (Lage)", en: "", def: "Hauptpunkte für s-förmig geschwungene Übergangsbögen: UAS (Anfang) und UES (Ende). Daneben existieren UABS/UEBS (Bloss s-Form) und UASS/UESS." },
  { id: 294, cat: "Gleisgeometrie & Trassierung", de: "Achshauptpunkte der Höhe", en: "", def: "Punkte zur Definition der Gradiente im Aufriss: AA (Anfang), NW (Neigungswechsel) und AE (Ende)." },
  { id: 295, cat: "Gleisgeometrie & Trassierung", de: "Achshauptpunkte der Überhöhung", en: "", def: "Punkte im Überhöhungsverlauf: RA (Rampenanfang), RE (Rampenende) sowie deren Bloss- (RAB/REB) und S-Form-Varianten (RAS/RES)." },
  { id: 296, cat: "Gleisgeometrie & Trassierung", de: "Achshauptpunkte für Weichen", en: "", def: "Referenzpunkte einer Weichenkonstruktion: WA (Weichenanfang), WTS (Weichentangentenschnittpunkt), WE (Weichenende) und WEZ (Weichenendzentrum)." },
  { id: 297, cat: "Gleisgeometrie & Trassierung", de: "Geometrisches Trassierungselement", en: "", def: "Geometrisch-mathematisch eindeutig beschreibbares Element einer Trasse (gemäß DIN 18709)." },
  { id: 298, cat: "Gleisgeometrie & Trassierung", de: "Lageelemente (Typen)", en: "", def: "Im Grundriss zulässige Elemente: Gerade, Kreisbogen, Übergangsbogen mit gerader Krümmungslinie (Klothoide), UB mit geschwungener Krümmungslinie nach Bloss und UB mit s-förmig geschwungener Krümmungslinie." },
  { id: 299, cat: "Gleisgeometrie & Trassierung", de: "Höhenelemente (Typen)", en: "", def: "Im Aufriss der Gradiente zulässige Elemente: Gerade und Ausrundungsbogen bei NW (Neigungswechsel)." },
  { id: 300, cat: "Gleisgeometrie & Trassierung", de: "Überhöhungselemente (Typen)", en: "", def: "Für die Überhöhung zulässig: Rampe mit gerader Neigung, Rampe mit geschwungener Krümmungslinie nach Bloss und Rampe mit s-förmig geschwungener Krümmungslinie." },
  { id: 301, cat: "Gleisgeometrie & Trassierung", de: "Achsparameter", en: "", def: "Größen, die die metrische Größe und geometrische Form eines geometrischen Trassierungselementes bestimmen (z. B. Radien, Längen, Neigungen)." },
  { id: 302, cat: "Gleisgeometrie & Trassierung", de: "Zwangspunkte der Trassierung (Kriterien)", en: "", def: "Positionen von Objekten im Gleis oder in Gleisnähe, welche die Trassierung bedingen, Einfluss auf den freizuhaltenden Lichtraum oder Sicherheitsraum haben, durch Veränderungen der Trassenführung Einfluss bekommen könnten oder zu Einschränkungen der Hebungsreserve führen." }
'@

$content = [System.IO.File]::ReadAllText($dataPath, [System.Text.Encoding]::UTF8)

# Insert the new cards right before the final "];"
# The last existing card ends with `" }` then newline then `];`
# We need to change `" }\r\n];` to `" },\r\n  <new cards>\r\n];`
# But our $cards string starts with ",\n  // ===..." so we just need to inject before the `];`

# Find the position of the trailing "];" - it's the last occurrence
$idx = $content.LastIndexOf("];")
if ($idx -lt 0) { throw "Closing bracket not found" }

# Insert $cards before the `];`
$newContent = $content.Substring(0, $idx) + $cards + "`r`n" + $content.Substring($idx)

[System.IO.File]::WriteAllText($dataPath, $newContent, (New-Object System.Text.UTF8Encoding $false))

# Verify
$verifyContent = [System.IO.File]::ReadAllText($dataPath, [System.Text.Encoding]::UTF8)
$count = ([regex]::Matches($verifyContent, '\{\s*id:\s*\d+')).Count
"Total cards now: $count"
