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

**Controlli sugli indicatori (12-15)**
- `12_quota_annunci_senza_recensioni`: quota di annunci senza recensioni negli ultimi 12 mesi, per quartiere
- `13_annunci_non_disponibili_e_senza_recensioni`: Quanti annunci non sono prenotabili o non hanno recensioni
- `14_prezzi_estremi_e_attivita`: annunci sopra 1.000 € a notte che sono anche inattivi o senza recensioni
- `15_confronto_media_mediana`: confronto tra media e mediana del prezzo per quartiere

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

### Perché la media e non la mediana
### Perché la media e non la mediana
Ho scelto la media perché, partendo dalla tabella già raggruppata per quartiere (prezzo medio e numero di annunci), permette di ricavare in seguito la media di tutta Roma, basta pesare ogni media per il numero di annunci del quartiere (con gli annunci fino a 1.000 € viene circa 223 €). Con le mediane ciò non è possibile. In questo modo la tabella resta riutilizzabile anche in altri progetti, senza ripartire dai dati originali.

La media è però sensibile ai valori estremi, per questo motivo ho escluso gli annunci sopra i 1.000 € a notte e ho confrontato il risultato con la mediana (tabella qui sotto).

| Quartiere | Media (tutti gli annunci) | Media (fino a 1.000 €) | Mediana (tutti gli annunci) |
|---|---|---|---|
| I Centro Storico | 306 | 273 | 236 |
| VIII Appia Antica | 231 | 162 | 145 |
| XIII Aurelia | 230 | 200 | 174 |
| IV Tiburtina | 229 | 140 | 125 |
| II Parioli/Nomentano | 216 | 197 | 171 |
| VII San Giovanni/Cinecittà | 213 | 170 | 150 |
| IX Eur | 197 | 154 | 127 |
| XII Monte Verde | 190 | 174 | 157 |
| XV Cassia/Flaminia | 188 | 169 | 135 |
| XIV Monte Mario | 178 | 159 | 143 |
| III Monte Sacro | 178 | 151 | 128 |
| XI Arvalia/Portuense | 166 | 150 | 136 |
| V Prenestino/Centocelle | 153 | 133 | 122 |
| X Ostia/Acilia | 146 | 135 | 120 |
| VI Roma delle Torri | 133 | 121 | 113 |

### Cosa mostra la tabella
- **La mediana è leggermente più bassa della media**: la media filtrata sta in media circa 20 € sopra la mediana.
- **Gli estremi pesano soprattutto su alcuni quartieri.** Tiburtina passa da 229 € a 140 € escludendo gli annunci sopra i 1.000 €, e Appia Antica da 231 € a 162 €. Con la media non filtrata sembravano tra i più cari (4° e 2° posto); con la media filtrata o con la mediana scendono al 12° posto e al 6°-7°.
- **La classifica è stabile agli estremi.** Il Centro Storico è primo e Roma delle Torri ultima con tutti e tre gli indicatori, e i primi cinque quartieri (Centro Storico, Aurelia, Parioli/Nomentano, Monte Verde, San Giovanni) sono gli stessi e nello stesso ordine con la media filtrata e con la mediana.
- **Nelle posizioni intermedie la classifica dipende dall'indicatore**: ad esempio Cassia/Flaminia è sesta con la media filtrata e nona con la mediana. Le differenze di pochi euro tra quartieri vicini in classifica vanno quindi lette con cautela.

**Conclusione:** il filtro a 1.000 € e la mediana portano allo stesso quadro generale, mentre la media non filtrata sovrastima alcuni quartieri. Le conclusioni sui quartieri più cari e più economici sono solide; il dettaglio delle posizioni centrali lo è meno.

## Possibili sviluppi
- Boost alla Dashbord: filtro nella dashboard per includere o escludere i valori estremi.
- Analisi degli host con più annunci: verificare la presenza di super proprietari (host che gestiscono più annunci) e determinare quanti B&B sono gestiti da super proprietari rispetto a quelli gestiti da piccoli proprietari.
