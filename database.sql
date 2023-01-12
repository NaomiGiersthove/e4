-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 12 jan 2023 om 16:15
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `excellenttaste`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingen`
--

CREATE TABLE `bestellingen` (
  `ID` int(11) NOT NULL,
  `Reservering_ID` int(11) NOT NULL,
  `Menuitem_ID` int(11) NOT NULL,
  `Aantal` int(11) DEFAULT NULL,
  `Geserveerd` tinyint(4) DEFAULT 0,
  `Klaar` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `bestellingen`
--

INSERT INTO `bestellingen` (`ID`, `Reservering_ID`, `Menuitem_ID`, `Aantal`, `Geserveerd`, `Klaar`) VALUES
(1, 1, 2, 2, 0, 1),
(2, 2, 15, 4, 0, 0),
(3, 3, 8, 1, 1, 1),
(4, 3, 15, 2, 1, 1),
(5, 6, 7, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerechtcategorieen`
--

CREATE TABLE `gerechtcategorieen` (
  `ID` int(11) NOT NULL,
  `Code` varchar(3) DEFAULT NULL,
  `Naam` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gerechtcategorieen`
--

INSERT INTO `gerechtcategorieen` (`ID`, `Code`, `Naam`) VALUES
(1, 'Dr', 'Dranken'),
(2, 'Hap', 'Hapjes'),
(3, 'Voo', 'Voorgerechten'),
(4, 'Hoo', 'Hoofdgerechten'),
(5, 'Nag', 'Nagerechten');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerechtsoorten`
--

CREATE TABLE `gerechtsoorten` (
  `ID` int(11) NOT NULL,
  `Code` varchar(3) DEFAULT NULL,
  `Naam` varchar(20) DEFAULT NULL,
  `Gerechtcategorie_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gerechtsoorten`
--

INSERT INTO `gerechtsoorten` (`ID`, `Code`, `Naam`, `Gerechtcategorie_ID`) VALUES
(1, 'B', 'Bieren', 1),
(2, 'F', 'Frisdranken', 1),
(3, 'WD', 'Warme dranken', 1),
(4, 'W', 'Wijnen', 1),
(5, 'KH', 'Koude hapjes', 2),
(6, 'WH', 'Warme hapjes', 2),
(7, 'KV', 'Koud', 3),
(8, 'WV', 'Warm', 3),
(9, 'Veg', 'Vegetarisch', 4),
(10, 'Vis', 'Vis', 4),
(11, 'Vls', 'Vlees', 4),
(12, 'Ijs', 'Ijs', 5),
(13, 'Mou', 'Mousse', 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klanten`
--

CREATE TABLE `klanten` (
  `ID` int(11) NOT NULL,
  `Naam` varchar(20) NOT NULL,
  `Telefoon` varchar(11) NOT NULL,
  `Email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `klanten`
--

INSERT INTO `klanten` (`ID`, `Naam`, `Telefoon`, `Email`) VALUES
(1, 'Jeroen Krabber', '0632659825', 'Jeroenkrabber@gmail.com'),
(2, 'Piet Hein', '0537726986', 'Piethein@gmail.com'),
(4, 'Joke Smit', '0612345678', 'Jokesmit@hotmail.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `menuitems`
--

CREATE TABLE `menuitems` (
  `ID` int(11) NOT NULL,
  `Code` varchar(4) DEFAULT NULL,
  `Naam` varchar(30) DEFAULT NULL,
  `Gerechtsoort_ID` int(11) NOT NULL,
  `Prijs` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `menuitems`
--

INSERT INTO `menuitems` (`ID`, `Code`, `Naam`, `Gerechtsoort_ID`, `Prijs`) VALUES
(1, 'Pils', 'Pilsner', 1, '2.50'),
(2, 'Chau', 'Chaudfontaine rood', 2, '2.49'),
(3, 'Koff', 'Koffie', 3, '2.00'),
(4, 'Glas', 'Per glas', 4, '2.50'),
(5, 'KaMo', 'Portie kaas met mosterd', 5, '5.50'),
(6, 'BiMo', 'Portie bitterballetjes met mos', 6, '4.50'),
(7, 'Sala', 'Salade met geitenkaas', 7, '11.50'),
(8, 'Toma', 'Tomatensoep', 8, '10.75'),
(9, 'GeBa', 'Gebakken banaan', 9, '7.50'),
(10, 'GeMa', 'Gebakken makreel', 10, '9.00'),
(11, 'Wien', 'Wienerschnitzel', 11, '8.50'),
(12, 'Vruc', 'Vruchtenijs', 12, '3.50'),
(13, 'Choc', 'Chocolademousse', 13, '3.50'),
(15, 'Cas', 'Cassis', 2, '2.50');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reserveringen`
--

CREATE TABLE `reserveringen` (
  `ID` int(11) NOT NULL,
  `Tafel` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Tijd` time NOT NULL,
  `Klant_ID` int(11) NOT NULL,
  `Aantal` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1,
  `Datum_toegevoegd` timestamp NOT NULL DEFAULT current_timestamp(),
  `Allergieen` text DEFAULT NULL,
  `Opmerkingen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `reserveringen`
--

INSERT INTO `reserveringen` (`ID`, `Tafel`, `Datum`, `Tijd`, `Klant_ID`, `Aantal`, `Status`, `Datum_toegevoegd`, `Allergieen`, `Opmerkingen`) VALUES
(1, 4, '2022-06-30', '10:11:30', 2, 4, 1, '2023-01-12 13:43:18', NULL, 'Bij het raam'),
(2, 2, '2022-06-24', '09:15:00', 2, 3, 1, '2023-01-12 13:43:18', 'Seafood', NULL),
(3, 1, '2023-01-12', '15:39:25', 4, 4, 1, '2023-01-12 14:40:06', 'Sesam', NULL),
(6, 3, '2023-01-15', '13:49:00', 2, 3, 1, '2023-01-12 14:49:27', NULL, NULL),
(7, 5, '2023-01-13', '08:48:18', 2, 10, 1, '2023-01-12 15:13:16', NULL, NULL);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `Reservering_ID` (`Reservering_ID`),
  ADD KEY `Menuitem_ID` (`Menuitem_ID`);

--
-- Indexen voor tabel `gerechtcategorieen`
--
ALTER TABLE `gerechtcategorieen`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `Code` (`Code`);

--
-- Indexen voor tabel `gerechtsoorten`
--
ALTER TABLE `gerechtsoorten`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD KEY `Gerechtcategorie_ID` (`Gerechtcategorie_ID`);

--
-- Indexen voor tabel `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexen voor tabel `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD KEY `Gerechtsoort_ID` (`Gerechtsoort_ID`);

--
-- Indexen voor tabel `reserveringen`
--
ALTER TABLE `reserveringen`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `ID_2` (`ID`,`Datum`,`Tijd`),
  ADD KEY `Klant_ID` (`Klant_ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `gerechtcategorieen`
--
ALTER TABLE `gerechtcategorieen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `gerechtsoorten`
--
ALTER TABLE `gerechtsoorten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `klanten`
--
ALTER TABLE `klanten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT voor een tabel `reserveringen`
--
ALTER TABLE `reserveringen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD CONSTRAINT `bestellingen_ibfk_1` FOREIGN KEY (`Reservering_ID`) REFERENCES `reserveringen` (`ID`),
  ADD CONSTRAINT `bestellingen_ibfk_2` FOREIGN KEY (`Menuitem_ID`) REFERENCES `menuitems` (`ID`);

--
-- Beperkingen voor tabel `gerechtsoorten`
--
ALTER TABLE `gerechtsoorten`
  ADD CONSTRAINT `gerechtsoorten_ibfk_1` FOREIGN KEY (`Gerechtcategorie_ID`) REFERENCES `gerechtcategorieen` (`ID`);

--
-- Beperkingen voor tabel `menuitems`
--
ALTER TABLE `menuitems`
  ADD CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`Gerechtsoort_ID`) REFERENCES `gerechtsoorten` (`ID`);

--
-- Beperkingen voor tabel `reserveringen`
--
ALTER TABLE `reserveringen`
  ADD CONSTRAINT `reserveringen_ibfk_1` FOREIGN KEY (`Klant_ID`) REFERENCES `klanten` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
