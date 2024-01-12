DROP TABLE pracownicy CASCADE;
DROP TABLE godziny CASCADE;
DROP TABLE pensje;
DROP TABLE premie;
DROP TABLE wynagrodzenie; 

CREATE TABLE pracownicy(
	id_pracownika    INT PRIMARY KEY,  
	imie             VARCHAR(80), 
	nazwisko         VARCHAR(80),
    adres            VARCHAR(80), 
	telefon          int

);

CREATE TABLE godziny(
	id_godziny       INT PRIMARY KEY , 
	data             date   , 
	liczba_godzin    int, 
	id_pracownika    INT
);

CREATE TABLE pensje(
	id_pensji        INT PRIMARY KEY , 
	stanowisko       VARCHAR(80), 
	kwota            DECIMAL(10, 2)
	
);
CREATE TABLE premie(
	id_premii        INT PRIMARY KEY , 
	rodzaj           VARCHAR(80), 
	kwota            DECIMAL(10, 2)
);
CREATE TABLE wynagrodzenie (
    id_wynagrodzenia INT PRIMARY KEY,
    data DATE,
    id_pracownika INT,
    id_godziny INT,
    id_pensji INT,
    id_premii INT,
    FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika),
    FOREIGN KEY (id_godziny) REFERENCES godziny(id_godziny),
    FOREIGN KEY (id_pensji) REFERENCES pensje(id_pensji),
    FOREIGN KEY (id_premii) REFERENCES premie(id_premii)
);
INSERT INTO  pracownicy(id_pracownika, imie, nazwisko, adres,telefon)
VALUES (1, 'Jan', 'Kowalski', 'Rzeszów', 658974585),
       (2, 'Anna', 'Nowak', 'Płock', 789854678),
       (3, 'Marek', 'Wiśniewski', 'Tczew', 549874565),
	   (4, 'Maja', 'Smolińska', 'Gdańsk', 789844678),
	   (5, 'Joanna', 'Pawelec', 'Zabrze', 799854678),
	   (6, 'Barbara', 'Olencka', 'Zabrze', 799854678),
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
	   
	   
INSERT INTO  pensje(id_pensji, stanowisko, kwota)
VALUES (1, 'Menager', 9600 ),
       (2, 'Analityk biznesowy', 200 ),
       (3, 'Programista', 800 ),
	   (4, 'Kontroler finansowy', 840 ),
	   (5, 'Specjalista ds. marketingu', 7000 ),
	   (6, 'Sekretarka', 4500),
	   (7, 'Specjalista ds. sprzedaży', 7800),
	   (8, 'Prawnik', 5500 ),
       (9, 'Menedżer marketingu', 6900),
	   (10, 'Przedstawiciel handlowy', 1400);

INSERT INTO premie  (id_premii, rodzaj, kwota)
VALUES(1, 'Nagroda roczna', 1000.00),
	  (2, 'Premia kwartalna', 500.00),
      (3, 'Bonus świąteczny', 300.00),
      (4, 'Motywacyjna', 700.00),
      (5, 'Dodatkowa premia', 400.00),
      (6, 'Premia za efektywność', 600.00),
      (7, 'Nagroda za staż', 800.00),
      (8, 'Premia za projekt', 900.00),
      (9, 'Bonus relokacyjny', 1000.00),
      (10, 'Premia za zdobycie klienta', 1200.00);

INSERT INTO  wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (1, '2023-11-07', 1, 1, 1, NULL ),
       (2, '2023-10-11',2, 2, 2, 2),
       (3, '2023-01-02',3, 3, 3,3 ),
	   (4, '2023-12-17',4, 4, 4, 4),
	   (5, '2023-03-27', 5, 5, 5, NULL ),
	   (6, '2023-05-15',6, 6, 6, 6 ),
	   (7, '2023-07-16',7, 7, 7, 7),
	   (8, '2023-06-22',8, 8, 8, 8 ),
       (9, '2023-10-25', 9, 9, 9, 9),
	   (10, '2023-09-06',10, 10, 10, NULL );
	   
--a
SELECT id_pracownika, nazwisko FROM pracownicy;
--b
SELECT w.id_pracownika, p.kwota
FROM wynagrodzenie w
JOIN pensje p ON w.id_pensji = p.id_pensji
WHERE p.kwota > 1000;
--c
SELECT w.id_pracownika
FROM wynagrodzenie w
JOIN pensje p ON w.id_pensji = p.id_pensji
LEFT JOIN premie pr ON w.id_premii = pr.id_premii
WHERE pr.id_premii IS NULL AND p.kwota > 2000;
--d
SELECT id_pracownika FROM pracownicy WHERE imie LIKE'J%';
--e
SELECT id_pracownika FROM pracownicy WHERE nazwisko LIKE '%n%a';
--f
UPDATE godziny
SET liczba_godzin = 180;

SELECT p.imie, p.nazwisko, w.liczba_godzin -160 AS nadgodziny
FROM pracownicy p
JOIN wynagrodzenie wn ON p.id_pracownika = wn.id_pracownika
JOIN godziny w ON wn.id_godziny = w.id_godziny
--g
UPDATE pensje
SET kwota = 1800
WHERE id_pensji = 5;

SELECT pr.imie, pr.nazwisko
FROM wynagrodzenie w
JOIN pensje p ON w.id_pensji = p.id_pensji
JOIN pracownicy pr ON w.id_pracownika = pr.id_pracownika
WHERE p.kwota BETWEEN 1500 AND 3000;
--h
SELECT imie, nazwisko
FROM wynagrodzenie w
JOIN godziny ON w.id_pracownika = godziny.id_pracownika
JOIN pracownicy pr ON w.id_pracownika = pr.id_pracownika
WHERE liczba_godzin >160  AND id_premii IS NULL ;
--i
SELECT pr.imie, pr.nazwisko, p.kwota AS pensja
FROM pracownicy pr
JOIN wynagrodzenie w ON pr.id_pracownika = w.id_pracownika
JOIN pensje p ON w.id_pensji = p.id_pensji
ORDER BY p.kwota;
--j
SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota , premie.kwota 
FROM pracownicy 
JOIN wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN pensje  ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN premie ON wynagrodzenie.id_premii = premie.id_premii
ORDER BY pensje.kwota DESC, premie.kwota DESC;
--k
UPDATE pensje
SET stanowisko = 'kierownik'
WHERE id_pensji = 4;
UPDATE pensje
SET stanowisko = 'kierownik'
WHERE id_pensji = 8;

SELECT stanowisko, COUNT(stanowisko)
FROM pensje
GROUP BY stanowisko;

--l
SELECT stanowisko  AVG(CAST(pensje.kwota AS DECIMAL)), MIN(pensje.kwota), MAX(pensje.kwota)
FROM pensje
JOIN 
WHERE stanowisko = 1;
--m
SELECT  SUM(kwota)
FROM pensje;
--n 
SELECT stanowisko, SUM(pensje.kwota)  AS suma_wynagrodzen
FROM pensje
GROUP BY stanowisko;
--o
SELECT stanowisko, COUNT(*)
FROM wynagrodzenie
JOIN pensje ON wynagrodzenie.id_pensji =  pensje.id_pensji
JOIN premie ON wynagrodzenie.id_premii =  premie.id_premii
GROUP BY stanowisko;

--p
DELETE FROM pracownicy
WHERE id_pracownika IN(
SELECT pracownicy.id_pracownika
FROM pracownicy
JOIN wynagrodzenie  ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN pensje  ON wynagrodzenie.id_pensji = pensje.id_pensji
WHERE pensje.kwota < 1200);

--zajecia 6
--a
UPDATE pracownicy
SET telefon = 
