# Analisi degli affitti brevi a Roma

Progetto di analisi sui dati di Inside Airbnb per Roma,(17 settembre 2026).

## Domanda
Dove si concentra il valore degli affitti brevi a Roma? Prezzo e domanda vanno insieme nei vari quartieri?

## Dati
- Fonte: Inside Airbnb, Roma 17 settembre 2026, file `listings.csv`, https://insideairbnb.com
- 33.933 annunci con prezzo valido; 476 esclusi perché sopra i 1.000 € a notte; 33.457 analizzati nei 15 quartieri.
- La domanda è misurata con le recensioni degli ultimi 12 mesi.

## Strumenti utilizzati 
- SQL (PostgreSQL) 
- Power BI
- Manus (ricerca)

## Le query (SQL)
**Controllo dei dati (01-05)**
- `01_conta_righe`, `02_prezzi_nulli`, `03_prezzi_non_nulli`: righe e valori mancanti
- `04_prezzi_crescenti`, `05_prezzi_decrescenti`: prezzi più bassi e più alti

**Analisi (06-09)**
- `06_prezzo_quartiere`: prezzo medio per quartiere
- `07_recensioni_quartiere`: recensioni medie per quartiere
- `08_confronto_prezzo_domanda`: i due indicatori insieme
- `09_prezzo_alloggio`: prezzo e recensioni per tipo di alloggio

**Valori estremi (10-11)**
- `10_annunci_sopra_i_mille`: dove si trovano gli annunci sopra i 1.000 € a notte
- `11_confronto_senza_prezzi_estremi`: il confronto senza di loro (usato nella dashboard)

**Controlli sugli indicatori (12-14)**
- `12_quota_annunci_senza_recensioni`: quota di annunci senza recensioni negli ultimi 12 mesi, per quartiere
- `13_annunci_non_disponibili_e_senza_recensioni`: Quanti annunci non sono prenotabili o non hanno recensioni
- `14_prezzi_estremi_e_attivita`: annunci sopra 1.000 € a notte che sono anche inattivi o senza recensioni

## Risultati principali
- Il Centro Storico ha il 52% degli annunci, il prezzo medio più alto (circa 273 €) e la domanda maggiore (circa 20 recensioni medie per annuncio).
- Centocelle e San Giovanni hanno prezzi più bassi e domanda alta; Cassia/Flaminia ed EUR prezzi medio-alti e poca domanda.

## Scelte e controlli
**Valori estremi.** Ho escluso gli annunci sopra i 1.000 € a notte (476 annunci, l'1,4%), alcuni annunci superavano i 30.000 € a notte, questo alterava la media. Esempio: a Tiburtina il prezzo medio è 229 € con gli estremi, ma scende a 140 € senza i prezzi estremi. La soglia è una mia scelta. 

**Annunci inattivi.** Ho verificato se togliere gli annunci inattivi cambiasse il quadro:
- Solo 1.245 annunci su 33.933 (circa il 3,7%) non sono prenotabili, e solo 6 dei 476 annunci snon sono prenotabili. Eliminarli non risolverebbe i prezzi anomali.
- Il 22,6% degli annunci non ha recensioni negli ultimi 12 mesi; tra gli annunci sopra i 1.000 € la quota sale al 40,5%. È un indizio che molti prezzi estremi siano poco credibili, ma non una prova.

## Limiti
- Il prezzo è quello dell'annuncio, non quello pagato.
- Le recensioni sono un indicatore indiretto della domanda, non le prenotazioni reali.

## Possibili sviluppi
- Boost alla Dashbord: filtro nella dashboard per includere o escludere i valori estremi.
- Analisi degli host con più annunci: verificare la presenza di super proprietari (host che gestiscono più annunci) e determinare quanti B&B sono gestiti da super proprietari rispetto a quelli gestiti da piccoli proprietari.
