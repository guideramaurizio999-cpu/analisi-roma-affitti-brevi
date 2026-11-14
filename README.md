# Analisi degli affitti brevi a Roma

Progetto di analisi in SQL (PostgreSQL) sui dati di Inside Airbnb per Roma, (17 settembre 2026).

## Domanda
Dove si concentra il valore degli affitti brevi a Roma? Prezzo e domanda vanno insieme nei vari quartieri?

## Cosa ho fatto
- **01-05**: controllo dei dati (righe, prezzi nulli, prezzi più bassi e più alti)
- **06-08**: prezzo medio, domanda (recensioni degli ultimi 12 mesi) e confronto tra i due per quartiere, solo quartieri con almeno 50 annunci
- **09**: prezzo e domanda per tipo di alloggio
- **10-11**: verifica dell'effetto dei prezzi oltre 1.000 € a notte (476 annunci, circa l'1,4%)

## Risultati principali
- Il Centro Storico ha più della metà degli annunci (17.672 su 33.933) ed è il quartiere più caro e più richiesto.
- Alcuni quartieri sfuggono alla regola: Prenestino/Centocelle ha prezzi bassi (circa 133 €) e domanda alta, mentre Cassia/Flaminia ha prezzi medio-alti (circa 169 €) e poca domanda.
- Le case intere sono circa il 75% degli annunci e il tipo di alloggio più costoso e richiesto.
- Pochi annunci con prezzi estremi alteravano le medie: a Tiburtina il prezzo medio passa da circa 229 € a 140 € escludendo gli annunci sopra i 1.000 € a notte.

## Limiti
- Il prezzo è quello dell'annuncio, non quello realmente pagato.
- Le recensioni sono un indicatore indiretto della domanda.
- La soglia di 1.000 € è una mia scelta e va considerata un controllo di robustezza.
