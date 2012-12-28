-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas wygenerowania: 28 Gru 2012, 15:38
-- Wersja serwera: 5.5.27
-- Wersja PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `sklepasp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE IF NOT EXISTS `kategorie` (
  `kategoriaID` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`kategoriaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `kategorie`
--

INSERT INTO `kategorie` (`kategoriaID`, `nazwa`) VALUES
(1, 'Laptopy'),
(2, 'Procesory'),
(3, 'RAM');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE IF NOT EXISTS `koszyk` (
  `koszykID` varchar(36) COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`koszykID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk_produkt`
--

CREATE TABLE IF NOT EXISTS `koszyk_produkt` (
  `koszykID` varchar(36) COLLATE utf8_polish_ci NOT NULL,
  `produktID` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producenci`
--

CREATE TABLE IF NOT EXISTS `producenci` (
  `producentID` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`producentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `producenci`
--

INSERT INTO `producenci` (`producentID`, `nazwa`) VALUES
(1, 'Acer'),
(2, 'HP'),
(3, 'ASUS');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE IF NOT EXISTS `produkty` (
  `produktID` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `producent` int(11) NOT NULL,
  `kategoria` int(11) NOT NULL,
  `cena` decimal(10,0) NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `ilosc` int(11) NOT NULL,
  PRIMARY KEY (`produktID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`produktID`, `nazwa`, `producent`, `kategoria`, `cena`, `opis`, `ilosc`) VALUES
(1, 'Laptop Acer', 1, 1, 1000, '', 0),
(2, 'Laptop HP', 2, 1, 1700, 'Jakiś tam laptop HP', 10),
(3, 'Laptop ASUS', 3, 1, 1600, 'Jakiś tam laptop ASUS', 9),
(4, 'Laptop ASUS v2', 3, 1, 2199, 'Ulepszona wersja popularnego laptopa Acer!!!', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty_obrazki`
--

CREATE TABLE IF NOT EXISTS `produkty_obrazki` (
  `produktID` int(11) NOT NULL,
  `obrazek` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `produkty_obrazki`
--

INSERT INTO `produkty_obrazki` (`produktID`, `obrazek`) VALUES
(1, 'Laptop-Acer-z-linii-Ethos.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `pass` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `adres` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `kod` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `miejscowosc` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `blokada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`userID`, `login`, `pass`, `imie`, `nazwisko`, `adres`, `kod`, `miejscowosc`, `blokada`) VALUES
(1, 'asd@asd.pl', 'asdasd12', 'asdasd', 'asd aaa asd', 'asdasdasd 12/21', '12-123', 'Asdland', 0),
(2, 'asd@asd.eu', 'asdasd12', 'asd', 'asd', 'asd', '12-123', 'asd', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_zapamietaj`
--

CREATE TABLE IF NOT EXISTS `users_zapamietaj` (
  `userID` int(11) NOT NULL,
  `zapamietaneID` varchar(36) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`zapamietaneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users_zapamietaj`
--

INSERT INTO `users_zapamietaj` (`userID`, `zapamietaneID`) VALUES
(1, 'e53facb7-6e1c-434a-882d-8839bf5ac755');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ustawienia`
--

CREATE TABLE IF NOT EXISTS `ustawienia` (
  `licznik` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ustawienia`
--

INSERT INTO `ustawienia` (`licznik`) VALUES
(39);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE IF NOT EXISTS `zamowienia` (
  `zamowienieID` int(11) NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wysylka` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `platnosc` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `userID` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf8_polish_ci NOT NULL DEFAULT 'Oczekiwanie na płatność',
  PRIMARY KEY (`zamowienieID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`zamowienieID`, `data`, `wysylka`, `platnosc`, `userID`, `status`) VALUES
(3, '2012-12-25 16:19:04', 'Kurier', 'Przelew', 1, 'Oczekiwanie na płatność'),
(4, '2012-12-25 16:20:03', 'Kurier', 'Przelew', 1, 'Oczekiwanie na płatność'),
(5, '2012-12-26 13:31:54', 'Poczta Polska', 'Pay4U', 1, 'Oczekiwanie na płatność'),
(6, '2012-12-28 13:37:43', 'Kurier', 'Przelew', 1, 'Oczekiwanie na płatność');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia_produkty`
--

CREATE TABLE IF NOT EXISTS `zamowienia_produkty` (
  `zamowienieID` int(11) NOT NULL,
  `produktID` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zamowienia_produkty`
--

INSERT INTO `zamowienia_produkty` (`zamowienieID`, `produktID`, `ilosc`) VALUES
(3, 1, 11),
(3, 3, 1),
(4, 1, 11),
(4, 3, 1),
(5, 1, 1),
(6, 4, 10),
(6, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia_wysylka`
--

CREATE TABLE IF NOT EXISTS `zamowienia_wysylka` (
  `zamowienieID` int(11) NOT NULL,
  `imieNazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `adres` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `kod` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `miejscowosc` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zamowienia_wysylka`
--

INSERT INTO `zamowienia_wysylka` (`zamowienieID`, `imieNazwisko`, `adres`, `kod`, `miejscowosc`) VALUES
(3, 'asd asd', 'asdasdasd 12/213', '12-123', 'Asdland'),
(4, 'asd asd', 'asdasdasd 12/213', '12-123', 'Asdland'),
(5, 'asdasd asd aaa asd', 'asdasdasd 12/21', '12-123', 'Asdland'),
(6, 'asdasd asd aaa asd', 'asdasdasd 12/21', '12-123', 'Asdland');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
