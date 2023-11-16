-- --------------------------------------------------------------------------------------------------
--
--                                   MORTADELA MMA
--
--                                  JAKUB NAMYSLAK
--                                   OLIVER SKIBA
--                                   MICHAŁ OPAŁKA
--
-- --------------------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS mortadelamma;
CREATE DATABASE mortadelamma;
USE mortadelamma;

CREATE TABLE kat_wagowa(
    id_kategorii int UNSIGNED NOT NULL AUTO_INCREMENT,
    kat_wagowa varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (id_kategorii)
);

CREATE TABLE zawodnicy(
	id_zawodnika int UNSIGNED NOT NULL AUTO_INCREMENT,
	imie varchar(255) NOT NULL,
    nazwisko varchar(255) NOT NULL,
    wiek int UNSIGNED NOT NULL,
    miasto_urodzenia varchar(255),
    kraj_urodzenia varchar(255) NOT NULL DEFAULT 'Polska',
    wzrost int(3) NOT NULL,
    zasieg numeric(6,2) NOT NULL,
    waga numeric(6,2) NOT NULL,
    kat_wagowa int UNSIGNED,
    pesel int(11) UNSIGNED NOT NULL UNIQUE,
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

CREATE TABLE gale(
	id_gali int UNSIGNED NOT NULL AUTO_INCREMENT,
	pelna_nazwa_gali varchar(255) NOT NULL UNIQUE,
	data_gali datetime NOT NULL,
	ilosc_rezerwacji int(3) UNSIGNED NOT NULL DEFAULT 0,
	max_ilosc_rezerwacji int(3) UNSIGNED NOT NULL DEFAULT 100,
	koszt_wstepu numeric(6,2) UNSIGNED NOT NULL,
    PRIMARY KEY (id_gali)
);

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

