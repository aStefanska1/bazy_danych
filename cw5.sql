CREATE TABLE zamowienia(
	id_produktu        INT, 
	nazwa_produktu     VARCHAR(255) UNIQUE, 
	id_klienta         INT,
	nazwa_klienta      VARCHAR(255) UNIQUE, 
	data_zamowienia    DATE, 
	cena_produktu      DECIMAL(10,2), 
	ilość              INT, 
	VAT                DECIMAL(4,2), 
	suma_brutto        DECIMAL(10,2), 
	suma_netto         DECIMAL(10,2)
	PRIMARY KEY (id_produktu)
);

id_produktu->nazwa_produktu,cena_produktu,VAT
nazwa_produktu->id_produktu,cena_produktu,VAT
data_zamowienia,id_klienta->ilość, id_produktu
id_produktu, id_klienta, data_zamowienia -> suma_brutto, suma_netto
id_produktu, VAT, ilość->suma_brutto
suma_brutto, VAT->suma_netto, suma_netto
id_produktu->cena_produktu, VAT
id_produktu->nazwa_produktu
id_klienta-> nazwa_klienta
id_klienta,id_produktu, data_zamowienia->nazwa_produktu,nazwa_klienta, cena_produktu, ilość, VAT, suma_brutto, suma_netto 


klucze_kandydujące-> id_klienta,id_produktu, data_zamowienia


CREATE TABLE pomieszczenia(
	id_pomieszczenia          INT  UNIQUE,  
	numer_pomieszczenia       INT, 
	id_budynku                INT,  
	powierzchnia              DECIMAL(10, 2), 
	liczba_okien              INT, 
	liczba_drzwi              INT, 
	ulica                     VARCHAR(255), 
	miasto                    VARCHAR(255), 
	kod_pocztowy              INT
);

miasto->kod_pocztowy
id_pomieszczenia->numer_pomieszczenia, liczba_okien, liczba_drzwi, id_budynku
id_budynku->ulica, miasto, kod_pocztowy, powierzchnia


klucz_kandydujacy - id_budynku, numer_pomieszczenia
klucz_glowny - id_pomieszczenia
