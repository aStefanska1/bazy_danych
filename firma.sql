DROP TABLE pracownicy;
DROP TABLE godziny;
DROP TABLE pensje;
DROP TABLE premie;
CREATE TABLE pracownicy(
	id_pracownika varchar(80), 
	imie             VARCHAR(80), 
	nazwisko         VARCHAR(80),
    adres            VARCHAR(80), 
	telefon          int,
	PRIMARY KEY(id_pracownika)
);

CREATE TABLE godziny(
	id_godziny       varchar(80) , 
	data             date   , 
	liczba_godzin    int, 
	id_pracownika    VARCHAR(80),
	PRIMARY KEY(id_godziny)
);
CREATE TABLE pensje(
	id_pensji        VARCHAR(80), 
	stanowisko       VARCHAR(80), 
	kwota            int, 
	id_premii        VARCHAR(80),
	PRIMARY KEY(id_pensji)
);
CREATE TABLE premie(
	id_premii        VARCHAR(80), 
	rodzaj           VARCHAR(80), 
	kwota            int,
	PRIMARY KEY(id_premii)
);
INSERT INTO  pracownicy(id_pracownika, imie, nazwisko, adres,telefon)
VALUES (1, 'Jan', 'Kowalski', 'Rzeszów', 658974585),
       (2, 'Anna', 'Nowak', 'Płock', 789854678),
       (3, 'Marek', 'Wiśniewski', 'Tczew', 549874565),
	   (4, 'Maja', 'Smolińska', 'Gdańsk', 789844678),
	   (5, 'Joanna', 'Pawelec', 'Zabrze', 799854678),
	   (6, 'Barbara', 'Zabłocka', 'Zabrze', 799854678),
	   (7, 'Piotr', 'Bizon', 'Zielona Góra', 799854679),
	   (8, 'Kamil', 'Dworek', 'Frampol', 799854678),
       (9, 'Zenon', 'Popiołek', 'Międzyzdroje', 799814678),
	   (10, 'Kazimierz', 'Muzyk', 'Szczawnica', 790854678);



INSERT INTO godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (1, '2023-11-07', 8,  1),
       (2, '2023-10-11', 5,  2),
       (3, '2023-01-02', 10,  3),
	   (4, '2023-12-17', 1,  4),
	   (5, '2023-03-27', 5,  5),
	   (6, '2023-05-15', 2,  6),
	   (7, '2023-07-16', 6, 7),
	   (8, '2023-06-22', 4,  8),
       (9, '2023-10-25', 7,  9),
	   (10, '2023-09-06', 5, 10);
	   
	   
INSERT INTO  pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES (1, 'Menager', 9600, 45  ),
       (2, 'Analityk biznesowy', 7200, 26 ),
       (3, 'Programista', 6800, 30 ),
	   (4, 'Kontroler finansowy', 8400, 28 ),
	   (5, 'Specjalista ds. marketingu', 7000, 77 ),
	   (6, 'Sekretarka', 4500, 63 ),
	   (7, 'Specjalista ds. sprzedaży', 7800, 52),
	   (8, 'Prawnik', 5500, 17 ),
       (9, 'Menedżer marketingu', 6900, 42 ),
	   (10, 'Przedstawiciel handlowy', 8400, 88 );
	   
SELECT nazwisko, adres FROM pracownicy;


SELECT
	DATEPART(dy, data) AS NumerDniaTygodnia,
    DATENAME(dd, data) AS DzienTygodnia,
    DATEPART(mm, data) AS NumerMiesiaca,
    DATENAME(mm, data) AS Miesiac
FROM godziny;
SELECT 