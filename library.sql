-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Cze 2020, 16:12
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `library`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autorzy`
--

CREATE TABLE `autorzy` (
  `id_autor` int(11) NOT NULL,
  `imie` varchar(30) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `autorzy`
--

INSERT INTO `autorzy` (`id_autor`, `imie`, `nazwisko`) VALUES
(1, 'Jan', 'Brzechwa'),
(3, 'Adam', 'Mickiewicz'),
(4, 'Juliusz', 'Słowacki'),
(10, 'Julian', 'Tuwim'),
(11, 'Albert', 'hanys');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `krzyz`
--

CREATE TABLE `krzyz` (
  `id_bibl` int(11) NOT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `id_tytul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `krzyz`
--

INSERT INTO `krzyz` (`id_bibl`, `id_autor`, `id_tytul`) VALUES
(1, 1, 1),
(8, 3, 5),
(9, 4, 6),
(15, 10, 12),
(16, 11, 17);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tytuly`
--

CREATE TABLE `tytuly` (
  `id_tytul` int(11) NOT NULL,
  `tytul` varchar(30) DEFAULT NULL,
  `ISBN` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `tytuly`
--

INSERT INTO `tytuly` (`id_tytul`, `tytul`, `ISBN`) VALUES
(1, 'Akademia Pana Kleksa', '978-83-01-00000-1'),
(2, 'Quo vadis', '846-83-11-87235-2'),
(5, 'Pan Tadeusz', '124-32-54-36754-4'),
(6, 'Kordian', '765-45-34-34568-8'),
(12, 'Poezje', '122-32-23-23145-8'),
(16, 'Placki cz.3', '997-72-11-68235-2'),
(17, 'polityk', '978-83-01-00000-3');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indeksy dla tabeli `krzyz`
--
ALTER TABLE `krzyz`
  ADD PRIMARY KEY (`id_bibl`),
  ADD KEY `autor` (`id_autor`),
  ADD KEY `tytul` (`id_tytul`);

--
-- Indeksy dla tabeli `tytuly`
--
ALTER TABLE `tytuly`
  ADD PRIMARY KEY (`id_tytul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `krzyz`
--
ALTER TABLE `krzyz`
  MODIFY `id_bibl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `tytuly`
--
ALTER TABLE `tytuly`
  MODIFY `id_tytul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `krzyz`
--
ALTER TABLE `krzyz`
  ADD CONSTRAINT `krzyz_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autorzy` (`id_autor`),
  ADD CONSTRAINT `krzyz_ibfk_2` FOREIGN KEY (`id_tytul`) REFERENCES `tytuly` (`id_tytul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
