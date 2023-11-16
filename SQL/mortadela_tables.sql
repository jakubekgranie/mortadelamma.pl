-- ------------------------------------------------------------------------------
--
--                                   MORTADELA MMA
--
--                                  JAKUB NAMYŚLAK
--                                   OLIVER SKIBA
--                                   MICHAŁ OPAŁKA
--
-- ------------------------------------------------------------------------------

-- DODAJ: PRACOWNICY
-- DODAJ: SŁOWNIKOWA PRACA

DROP DATABASE IF EXISTS mortadelamma;
CREATE DATABASE mortadelamma;
USE mortadelamma;

CREATE TABLE kat_wagowa(
    id_kategorii int UNSIGNED NOT NULL AUTO_INCREMENT,
    kat_wagowa varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (id_kategorii)
);
INSERT INTO kat_wagowa(kat_wagowa) VALUES
("kogucia"),
("musza"),
("słomkowa"),
("piórkowa"),
("lekka"),
("półśrednia"),
("średnia"),
("półciężka"),
("ciężka");

CREATE TABLE zawodnicy(
	id_zawodnika int UNSIGNED NOT NULL AUTO_INCREMENT,
	imie varchar(255) NOT NULL,
    nazwisko varchar(255) NOT NULL,
	pseudonim_medialny varchar(255) NOT NULL DEFAULT "Brak",
    wiek int UNSIGNED NOT NULL DEFAULT 18,
    miasto_urodzenia varchar(255) DEFAULT "Opole",
    kraj_urodzenia varchar(255) NOT NULL DEFAULT 'Polska',
    wzrost int(3) NOT NULL,
    waga int(3) NOT NULL,
    kat_wagowa int UNSIGNED DEFAULT 5,
	pozycja_walki varchar(255) DEFAULT "Lewa",
	postawa varchar(255) DEFAULT "Stipe Miocic",
    pesel bigint(11) ZEROFILL NOT NULL UNIQUE,
	numer_telefonu varchar(12) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE,
	miasto varchar(255) NOT NULL,
	kod_pocztowy varchar(6) NOT NULL,
	ulica varchar(255) NOT NULL,
	numer_akomodacji varchar(15) NOT NULL,
    PRIMARY KEY (id_zawodnika),
    FOREIGN KEY (kat_wagowa) REFERENCES kat_wagowa(id_kategorii)
	ON UPDATE CASCADE
	ON DELETE SET NULL
);
INSERT INTO zawodnicy VALUES
(1, "Oliver", "Skiba", "@mujhin", 18, "Opole", "Polska", 183, 68, 5, "Lewa", "Stipe Miocic", 07272762191, "+48123456789", "alberto6alpaka@gmail.com", "Kadłub Turawski", "46-045", "ul. Faggotów", "1"),
(2, "Maksymilian", "Janiszewski", "@janik-wolf", 18, "Opole", "Polska", 180, 66, 5, "Lewa", "Stipe Miocic", 07242558616, "+48234567890", "janikwolf@gmail.com", "Daniec", "46-053", "ul. Stalina", "1"),
(3, "Remigiusz", "Łukasik", "@amarok", 18, "Opole", "Polska", 183, 69, 5, "Lewa", "Stipe Miocic", 08321438599, "+48345678901", "amarok@gmail.com", "Strzelce Op.", "47-100", "ul. Bolesława Chrobrego", "1"),
(4, "Bartosz", "Łukasik", "@niszczyciel5000pl", 18, "Opole", "Polska", 183, 69, 5, "Lewa", "Stipe Miocic", 08231782771, "+48456789012", "niszczyciel5000pl@gmail.com", "Strzelce Op.", "47-100", "ul. Bolesława Chrobrego", "1"),
(5, "Tomasz", "Róg", "@Życie Pawła", 18, "Opole", "Polska", 183, 80, 7, "Lewa", "Stipe Miocic", 07281368672, "+48567890123", "stempel@gmail.com", "Chmielowice", "45-001", "ul. Imperatora Tomasza", "69/420"),
(6, "Jakub", "Czerniak", "@wisniuxx", 18, "Opole", "Polska", 183, 84, 7, "Lewa", "Stipe Miocic", 07220858457, "+48678901234", "wisniuxx@gmail.com", "Chabry", "45-221", "ul. Słoneczna", "7"),
(7, "Jakub", "Tataruch", "@kubixl", 18, "Opole", "Polska", 191, 71, 6, "Lewa", "Stipe Miocic", 07240574597, "+48789012345", "kubixforcznajt@gmail.com", "Luboszyce", "46-022", "ul. Lgbt", "15"),
(8, "Filip", "Morścianek", "@fifek098", 18, "Opole", "Polska", 168, 71, 6, "Lewa", "Stipe Miocic", 08270491777, "+48890123456", "fikusny@gmail.com", "Ligota Turawska", "46-046", "ul. Kołłątaja", "4"),
(9, "Oliver", "Konior", "@oliver.konior", 18, "Opole", "Polska", 185, 70, 5, "Lewa", "Stipe Miocic", 08232617753, "+48901234567", "okonior@gmail.com", "Opole", "45-000", "ul. Dubois", "9/4"),
(10, "Artur", "Sondej", "@arturro", 18, "Opole", "Polska", 180, 69, 5, "Lewa", "Stipe Miocic", 08321011673, "+48012345678", "arturro@gmail.com", "Opole", "45-000", "ul. Witosa", "34");


CREATE TABLE gale(
	id_gali int UNSIGNED NOT NULL AUTO_INCREMENT,
	pelna_nazwa_gali varchar(255) NOT NULL UNIQUE,
	data_gali datetime NOT NULL,
	ilosc_rezerwacji int(3) UNSIGNED NOT NULL DEFAULT 0,
	max_ilosc_rezerwacji int(3) UNSIGNED NOT NULL DEFAULT 100,
	koszt_wstepu numeric(6,2) UNSIGNED NOT NULL,
    PRIMARY KEY (id_gali)
);
INSERT INTO gale VALUES
(1, "Mortadela MMA: guwno guwno guwno", "2023-11-19 18:45:00", 0, 300, 0.0);

CREATE TABLE wyniki(
	id_wyniku int UNSIGNED AUTO_INCREMENT NOT NULL,
	wynik varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (id_wyniku)
);
INSERT INTO wyniki VALUES
(1, "Nie dotyczy"),
(2, "W trakcie"),
(3, "Zwycięstwo gracza nr 1"),
(4, "Zwycięstwo gracza nr 2");

CREATE TABLE walki(
	id_gali int UNSIGNED NOT NULL,
	id_walki int UNSIGNED NOT NULL AUTO_INCREMENT,
	zawodnik_1 int UNSIGNED NOT NULL,
	zawodnik_2 int UNSIGNED NOT NULL,
	czas_rozpoczecia time NOT NULL,
	wynik int UNSIGNED DEFAULT 1,
	PRIMARY KEY (id_walki),
	FOREIGN KEY (id_gali) REFERENCES gale(id_gali)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FOREIGN KEY (zawodnik_1) REFERENCES zawodnicy(id_zawodnika)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FOREIGN KEY (zawodnik_2) REFERENCES zawodnicy(id_zawodnika)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FOREIGN KEY (wynik) REFERENCES wyniki(id_wyniku)
	ON UPDATE CASCADE
	ON DELETE SET NULL,
	UNIQUE(id_gali, czas_rozpoczecia)
);
INSERT INTO walki VALUES
(1, 1, 9, 10, "19:00:00", 1),
(1, 2, 7, 8, "19:15:00", 1),
(1, 3, 5, 6, "19:30:00", 1),
(1, 4, 3, 4, "19:45:00", 1),
(1, 5, 1, 2, "20:00:00", 1);

CREATE VIEW osiagniecia AS
SELECT pelna_nazwa_gali, zawodnicy.id_zawodnika, CONCAT(zawodnicy.imie, " ", zawodnicy.nazwisko) AS "zawodnik", CONCAT(zaw1.imie, " ", zaw1.nazwisko, " VS ", zaw2.imie, " ", zaw2.nazwisko) AS "walka", wyniki.wynik FROM walki
INNER JOIN gale
ON walki.id_gali = gale.id_gali
INNER JOIN zawodnicy
ON zawodnicy.id_zawodnika = walki.zawodnik_1 OR zawodnicy.id_zawodnika = walki.zawodnik_2
INNER JOIN zawodnicy AS zaw1
ON zawodnik_1 = zaw1.id_zawodnika
INNER JOIN zawodnicy AS zaw2
ON zawodnik_2 = zaw2.id_zawodnika
INNER JOIN wyniki
ON walki.wynik = wyniki.id_wyniku
ORDER BY 2 ASC;

CREATE TABLE uzytkownicy(
	id_uzytkownika int UNSIGNED NOT NULL AUTO_INCREMENT,
	imie varchar(255) NOT NULL,
	nazwisko varchar(255) NOT NULL,
	numer_telefonu varchar(12) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE,
	miasto varchar(255) NOT NULL,
	kod_pocztowy varchar(6) NOT NULL,
	ulica varchar(255) NOT NULL,
	numer_akomodacji varchar(15) NOT NULL,
	PRIMARY KEY (id_uzytkownika)
);

CREATE TABLE gale_zawodnicy_junction(
    id_zawodnika int UNSIGNED NOT NULL,
    id_gali int UNSIGNED NOT NULL,
	FOREIGN KEY (id_zawodnika) REFERENCES zawodnicy(id_zawodnika)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FOREIGN KEY (id_gali) REFERENCES gale(id_gali)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	PRIMARY KEY (id_zawodnika, id_gali)
);
INSERT INTO gale_zawodnicy_junction VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

CREATE TABLE gale_uzytkownicy_junction(
	id_uzytkownika int UNSIGNED NOT NULL,
	id_gali int UNSIGNED NOT NULL,
	FOREIGN KEY (id_uzytkownika) REFERENCES uzytkownicy(id_uzytkownika)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FOREIGN KEY (id_gali) REFERENCES gale(id_gali)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE kandydaci(
	id_kandydata int UNSIGNED NOT NULL AUTO_INCREMENT,
	imie varchar(255) NOT NULL,
    nazwisko varchar(255) NOT NULL,
	pseudonim_medialny varchar(255) NOT NULL DEFAULT "Brak",
    wiek int UNSIGNED NOT NULL DEFAULT 18,
    miasto_urodzenia varchar(255) DEFAULT "Opole",
    kraj_urodzenia varchar(255) NOT NULL DEFAULT 'Polska',
    wzrost int(3) NOT NULL,
    waga int(3) NOT NULL,
    kat_wagowa int UNSIGNED DEFAULT 5,
	pozycja_walki varchar(255) DEFAULT "Lewa",
	postawa varchar(255) DEFAULT "Stipe Miocic",
    pesel bigint(11) ZEROFILL NOT NULL UNIQUE,
	numer_telefonu varchar(12) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE,
	miasto varchar(255) NOT NULL,
	kod_pocztowy varchar(6) NOT NULL,
	ulica varchar(255) NOT NULL,
	numer_akomodacji varchar(15) NOT NULL,
    PRIMARY KEY (id_kandydata),
    FOREIGN KEY (kat_wagowa) REFERENCES kat_wagowa(id_kategorii)
	ON UPDATE CASCADE
	ON DELETE SET NULL
);

DROP USER IF EXISTS 'administrator'@'127.0.0.1';
DROP USER IF EXISTS 'inputoutput'@'127.0.0.1';

CREATE USER 'administrator'@'127.0.0.1' IDENTIFIED BY 'databgart4TEWfg432443132';
GRANT ALL PRIVILEGES ON mortadelamma.* TO 'administrator'@'127.0.0.1';

CREATE USER 'inputoutput'@'127.0.0.1' IDENTIFIED BY 'sustromming624652';
GRANT SELECT, INSERT ON mortadelamma.* TO 'administrator'@'127.0.0.1';