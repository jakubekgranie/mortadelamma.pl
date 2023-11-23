-- ------------------------------------------------------------------------------
--
--                                   MORTADELA MMA
--
--                                  JAKUB NAMYŚLAK
--                                   MICHAŁ OPAŁKA
--
-- ------------------------------------------------------------------------------

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
(1, "Oliver", "Skiba", "@mujhin", 18, "Opole", "Polska", 183, 68, 5, "Lewa", "Stipe Miocic", 07272762191, "+48123456789", "alberto6alpaka@gmail.com", "Kadłub Turawski", "46-045", "Faggotów", "1"),
(2, "Maksymilian", "Janiszewski", "@janik-wolf", 18, "Opole", "Polska", 180, 66, 5, "Lewa", "Stipe Miocic", 07242558616, "+48234567890", "janikwolf@gmail.com", "Daniec", "46-053", "Stalina", "1"),
(3, "Remigiusz", "Łukasik", "@amarok", 18, "Opole", "Polska", 183, 69, 5, "Lewa", "Stipe Miocic", 08321438599, "+48345678901", "amarok@gmail.com", "Strzelce Op.", "47-100", "Bolesława Chrobrego", "1"),
(4, "Bartosz", "Łukasik", "@niszczyciel5000pl", 18, "Opole", "Polska", 183, 69, 5, "Lewa", "Stipe Miocic", 08231782771, "+48456789012", "niszczyciel5000pl@gmail.com", "Strzelce Op.", "47-100", "Bolesława Chrobrego", "1"),
(5, "Tomasz", "Róg", "@Życie Pawła", 18, "Opole", "Polska", 183, 80, 7, "Lewa", "Stipe Miocic", 07281368672, "+48567890123", "stempel@gmail.com", "Chmielowice", "45-001", "Imperatora Tomasza", "69/420"),
(6, "Jakub", "Czerniak", "@wisniuxx", 18, "Opole", "Polska", 183, 84, 7, "Lewa", "Stipe Miocic", 07220858457, "+48678901234", "wisniuxx@gmail.com", "Chabry", "45-221", "Słoneczna", "7"),
(7, "Jakub", "Tataruch", "@kubixl", 18, "Opole", "Polska", 191, 71, 6, "Lewa", "Stipe Miocic", 07240574597, "+48789012345", "kubixforcznajt@gmail.com", "Luboszyce", "46-022", "Lgbt", "15"),
(8, "Filip", "Morścianek", "@fifek098", 18, "Opole", "Polska", 168, 71, 6, "Lewa", "Stipe Miocic", 08270491777, "+48890123456", "fikusny@gmail.com", "Ligota Turawska", "46-046", "Kołłątaja", "4"),
(9, "Oliver", "Konior", "@oliver.konior", 18, "Opole", "Polska", 185, 70, 5, "Lewa", "Stipe Miocic", 08232617753, "+48901234567", "okonior@gmail.com", "Opole", "45-000", "Dubois", "9/4"),
(10, "Artur", "Sondej", "@arturro", 18, "Opole", "Polska", 180, 69, 5, "Lewa", "Stipe Miocic", 08321011673, "+48012345678", "arturro@gmail.com", "Opole", "45-000", "Witosa", "34");


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
(1, "Mortadela MMA: guwno guwno guwno", "2023-11-19 18:45:00", 0, 300, 0);

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

CREATE TABLE rodzaj_stazu(
	id_rodzaju int UNSIGNED NOT NULL AUTO_INCREMENT,
	rodzaj_stazu varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY (id_rodzaju)
);
INSERT INTO rodzaj_stazu(rodzaj_stazu) VALUES
("Ekspert ds. transmisji"),
("Księgowy"),
("Webmaster"),
("HR"),
("Ochroniarz"),
("Prowadzący"),
("Sprzątacz"),
("Sędzia"),
("Technik reklamy"),
("Ekspert ds. bezpieczeństwa"),
("PR"),
("Cheerleader"),
("Obsługa klienta");

CREATE TABLE etaty(
	id_etatu int UNSIGNED NOT NULL AUTO_INCREMENT,
	etat numeric(4,2) NOT NULL UNIQUE,
	PRIMARY KEY (id_etatu)
);
INSERT INTO etaty(etat) VALUES
(2),
(1.5),
(1),
(0.75),
(0.5),
(0.25);

CREATE TABLE pracownicy(
	id_pracownika int UNSIGNED NOT NULL AUTO_INCREMENT,
	imie varchar(255) NOT NULL,
	nazwisko varchar(255) NOT NULL,
	pesel bigint(11) ZEROFILL NOT NULL UNIQUE,
	numer_telefonu varchar(12) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE,
	miasto varchar(255) NOT NULL,
	kod_pocztowy varchar(6) NOT NULL,
	ulica varchar(255) NOT NULL,
	numer_akomodacji varchar(15) NOT NULL,
	PRIMARY KEY (id_pracownika)
);
INSERT INTO pracownicy VALUES
(1, "Michał", "Opałka", 08322919871, "+48213742069", "michoo@gmail.com", "Grudzice", "09-982", "Sandru Ciorby", "2"),
(2, "Jakub", "Namyślak", 07270296177, "+48537437724", "kawkattv1@gmail.com", "Ozimek", "46-040", "Korczaka", "2/4"),
(3, "Jakub", "Tataruch", 08302362837, "+48324551753", "kubixw@interia.pl", "Luboszyce", "12-845", "Tłuszczu", "7"),
(4, "Oliver", "Skiba",  07272762191, "+48123456789", "alberto6alpaka@gmail.com", "Kadłub Turawski", "46-045", "Faggotów", "1"),
(5, "Tomasz", "Róg", 07281368672, "+48567890123", "stempel@gmail.com", "Chmielowice", "45-001", "Imperatora Tomasza", "69/420"),
(6, "Filip", "Morścianek", 08270491777, "+48890123456", "fikusny@gmail.com", "Ligota Turawska", "46-046", "Kołłątaja", "4"),
(7, "Dominika", "Kopańska", 08323037635, "+48562333452", "gengonwo@uwukitty.cn", "Chełmno", "57-341", "Kaczopa", "6"),
(8, "Jan", "Beton", 07290944775, "+48500900213", "betonjanbeton@janbeton.gb",  "Kadłub Turawski", "46-045", "Faggotów", "3"),
(9, "Dawid", "Jasper", 07242074859, "+48883322100", "dawidjasperkruljutub@interia.pl", "Pabianice", "53-341", "Szkolna", "5/17"),
(10, "Jacek", "Jaworek", 08221184138, "+48775641234", "janikpiechur@aol.com", "Złoty Stok", "61-342", "Krasnali", "4"),
(11, "Nico", "Grzeschik", 07311994392, "+48703461172", "obslugaklienta@lotos.pl", "Ligota Turawska", "46-046", "Kołłątaja", "12"),
(12, "Charles", "White Jr.", 08280432931, "+48045387657", "penguinz0@outlook.net", "Antoniów", "46-040", "Długa", "3"),
(13, "Linus", "Sebastian", 08311266553, "+48703143442", "linustechtips@gmail.com", "Ozimek", "46-040", "Sikorskiego", "6/5"),
(14, "Joel", "Vargskelethor", 07310887259, "+48767545321", "vargskelethorjoel@mail.jp", "Opole", "45-001", "Sienkiewicza", "21/41");

CREATE TABLE staze(
	id_pracownika int UNSIGNED NOT NULL,
	rodzaj_stazu int UNSIGNED NOT NULL,
	etat int UNSIGNED NOT NULL,
	data_rozpoczecia_pracy date NOT NULL,
	data_wygasniecia_umowy date NOT NULL,
	umowa text NOT NULL UNIQUE,
	FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	PRIMARY KEY (id_pracownika),
	FOREIGN KEY (rodzaj_stazu) REFERENCES rodzaj_stazu(id_rodzaju)
	ON UPDATE CASCADE
	ON DELETE RESTRICT,
	FOREIGN KEY (etat) REFERENCES etaty(id_etatu)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);
INSERT INTO staze VALUES
(1, 1, 3, "2023-11-01", "9999-12-31", "tu daj umowę 1"),
(2, 3, 3, "2023-11-01", "9999-12-31", "tu daj umowę 2"),
(3, 13, 4, "2023-11-01", "9999-12-31", "tu daj umowę 3"),
(4, 2, 2, "2023-11-01", "9999-12-31", "tu daj umowę 4"),
(5, 6, 3, "2023-11-01", "9999-12-31", "tu daj umowę 5"),
(6, 4, 3, "2023-11-01", "9999-12-31", "tu daj umowę 6"),
(7, 12, 3, "2023-11-01", "9999-12-31", "tu daj umowę 7"),
(8, 5, 3, "2023-11-01", "9999-12-31", "tu daj umowę 8"),
(9, 8, 3, "2023-11-01", "9999-12-31", "tu daj umowę 9"),
(10, 5, 3, "2023-11-01", "9999-12-31", "tu daj umowę 10"),
(11, 11, 3, "2023-11-01", "2030-11-01", "tu daj umowę 11"),
(12, 10, 4, "2023-11-01", "2030-11-01", "tu daj umowę 12"),
(13, 7, 5, "2023-11-01", "9999-12-31", "tu daj umowę 13"),
(14, 9, 3, "2023-11-01", "9999-12-31", "tu daj umowę 14");

CREATE VIEW pracownicy_lookup AS
SELECT pracownicy.*, rodzaj_stazu.rodzaj_stazu, etaty.etat, staze.data_rozpoczecia_pracy, staze.data_wygasniecia_umowy, staze.umowa FROM pracownicy
RIGHT JOIN staze
ON pracownicy.id_pracownika = staze.id_pracownika
INNER JOIN etaty
ON staze.etat = etaty.id_etatu
INNER JOIN rodzaj_stazu
ON staze.rodzaj_stazu = rodzaj_stazu.id_rodzaju
ORDER BY pracownicy.id_pracownika ASC;

CREATE TABLE status_konta(
	id_statusu int UNSIGNED NOT NULL AUTO_INCREMENT,
	status_ varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (id_statusu)
);
INSERT INTO status_konta(status_) VALUES
("Aktywne"),
("Zawieszone"),
("Ograniczone");

CREATE TABLE uzytkownicy(
	id_uzytkownika int UNSIGNED NOT NULL AUTO_INCREMENT,
	haslo varchar(32) NOT NULL,
	imie varchar(255) NOT NULL,
	nazwisko varchar(255) NOT NULL,
	numer_telefonu varchar(12) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE,
	miasto varchar(255) NOT NULL,
	kod_pocztowy varchar(6) NOT NULL,
	ulica varchar(255) NOT NULL,
	numer_akomodacji varchar(15) NOT NULL,
	status_konta int UNSIGNED DEFAULT 1,
	PRIMARY KEY (id_uzytkownika),
	FOREIGN KEY (status_konta) REFERENCES status_konta(id_statusu)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
);
INSERT INTO uzytkownicy VALUES
(1, "mikkel332", "Maciej", "Pietrzyk", "+48789456123", "mp@gmail.com", "Lipinki Łużyckie", "68-213", "Dj-a Albonisty", "8", 1),
(2, "'luboszycesmierdza'", "Sandra", "Michalak", "+48456789123", "sandra321519@gmail.com", "Grodziec", "46-040", "Powstańców Śląskich", "2", 1),
(3, "!janinachoryfordily415", "Damian", "Rębajło", "+48123456789", "domix@onet.ru", " Ozimek", "46-040", "Janiny Zasłużonej", "9/3", 1),
(4, "yell0wSubmarin3123", "Sławomir", "Mentzen", "+48999888777", "jemypieski@szkolnahosting.tk", "Turawa", "69-420", "Fortnite", "0", 1),
(5, ";zniszczesamostnosz666;", "Tadeusz", "Rydzyk", "+40888777666", "radiomaryja@chatgpt.com", "Toszek", "11-223", "Dynastyji Krulefskiej", "23", 1),
(6, "d1gid0n6##", "Oswald", "Hoffman", "+41872213443", "ss@deutschemedia.de", "Nowy Frankfurt", "99-009", "Marzipankartoffeln", "1/2", 1),
(7, "$miec998", "Sobiesław", "Rakowski", "+48908201031", "fidelkastra@t.media.ca", "Daniec", "00-000", "Targowa", "3", 1),
(8, "kompjutermikd0s_", "Henryk", "Płatek", "+48999123543", "henriquegonzales@onet.pl", "Gniezno", "84-423", "Kolonii Francuskich", "29", 1);

CREATE TABLE pracownicy_uzytkownicy_junction(
	id_uzytkownika int UNSIGNED NOT NULL,
	id_pracownika int UNSIGNED NOT NULL,
	detale_problemu varchar(512) DEFAULT "Brak",
	FOREIGN KEY (id_uzytkownika) REFERENCES uzytkownicy(id_uzytkownika)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	PRIMARY KEY (id_uzytkownika, id_pracownika)
);
INSERT INTO pracownicy_uzytkownicy_junction VALUES
(1, 9, NULL),
(1, 1, NULL),
(1, 5, "Użytkownik nie umie w komputer."),
(5, 1, "Resetowanie hasła po włamaniu na konto."),
(2, 3, NULL),
(7, 6, "Skarga na bukmachera."),
(3, 3, "Niepożądana oferta erotyczna, konto użytkownika zablokowane"),
(8, 4, "Żądanie chrystianizacji Mortadela MMA. Chwała chrześcijańskiej dyktaturze!"),
(4, 2, "Złożenie CV (obsługa klienta).");

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