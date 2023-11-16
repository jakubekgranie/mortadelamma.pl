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
    kat_wagowa int UNSIGNED NOT NULL,
    pesel int(11) UNSIGNED NOT NULL UNIQUE,
    PRIMARY KEY (id_zawodnika),
    FOREIGN KEY (kat_wagowa) REFERENCES kat_wagowa(id_kategorii)
);

CREATE TABLE gale_junction(
    id_zawodnika int UNSIGNED NOT NULL,
    id_gali
);
