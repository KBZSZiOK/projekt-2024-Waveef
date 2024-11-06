-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Lis 06, 2024 at 11:36 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kino`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilety`
--

CREATE TABLE `bilety` (
  `id` int(11) NOT NULL,
  `seans_id` int(11) DEFAULT NULL,
  `sprzedawca_id` int(11) DEFAULT NULL,
  `klient_id` int(11) DEFAULT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bilety`
--

INSERT INTO `bilety` (`id`, `seans_id`, `sprzedawca_id`, `klient_id`, `cena`) VALUES
(1, 1, 1, 1, 30),
(2, 4, 3, 2, 35),
(3, 2, 2, 3, 40);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Filmy`
--

CREATE TABLE `Filmy` (
  `id` int(11) NOT NULL,
  `tytul` varchar(80) DEFAULT NULL,
  `rezyser` varchar(80) DEFAULT NULL,
  `czas_trwania` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Filmy`
--

INSERT INTO `Filmy` (`id`, `tytul`, `rezyser`, `czas_trwania`) VALUES
(2, 'Moonfall', 'Roland Emmerich', 130),
(3, 'Dywizjon 303', 'Denis Delić', 99),
(4, 'Top Gun: Maverick', 'Joseph Kosinski', 131),
(5, 'Minionki', 'Pierre Coffin, Kyle Balda', 90),
(6, 'Oppenheimer', 'Christopher Nolan', 180);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Filmy_rodzaj`
--

CREATE TABLE `Filmy_rodzaj` (
  `id` int(11) NOT NULL,
  `filmy_id` int(11) DEFAULT NULL,
  `rodzaj_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Filmy_rodzaj`
--

INSERT INTO `Filmy_rodzaj` (`id`, `filmy_id`, `rodzaj_id`) VALUES
(1, 2, 5),
(2, 3, 8),
(3, 4, 3),
(4, 5, 9),
(5, 6, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(200) NOT NULL,
  `mail` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `mail`) VALUES
(1, 'Joanna', 'Roszkiewicz', 'joannaroszkiewicz@gmail.com'),
(2, 'Mikołaj', 'Pączkowski', 'mikolajpaczkowski11@gmail.com'),
(3, 'Aleksander', 'Parus', 'aleksanderparus1922@tlen.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_filmu`
--

CREATE TABLE `rodzaj_filmu` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rodzaj_filmu`
--

INSERT INTO `rodzaj_filmu` (`id`, `nazwa`) VALUES
(1, 'Komedia'),
(2, 'Dramat'),
(3, 'Akcja'),
(4, 'Biograficzny'),
(5, 'Science Fiction'),
(6, 'Fantasy'),
(7, 'Historyczny'),
(8, 'Wojenny'),
(9, 'Familijny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `ilosc_miejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `ilosc_miejsc`) VALUES
(1, 80),
(2, 54),
(3, 53),
(4, 74),
(5, 69),
(6, 63),
(7, 60),
(8, 75);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seanse`
--

CREATE TABLE `seanse` (
  `id` int(11) NOT NULL,
  `termin` datetime NOT NULL,
  `sala_id` int(11) DEFAULT NULL,
  `film_id` int(11) DEFAULT NULL,
  `liczba_wolnych_miejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seanse`
--

INSERT INTO `seanse` (`id`, `termin`, `sala_id`, `film_id`, `liczba_wolnych_miejsc`) VALUES
(1, '2024-10-29 13:12:00', 1, 2, 10),
(2, '2024-10-29 15:30:00', 2, 3, 14),
(3, '2024-10-29 14:10:00', 3, 4, 32),
(4, '2024-10-29 17:20:00', 4, 5, 23),
(5, '2024-10-29 18:40:00', 5, 6, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedawcy`
--

CREATE TABLE `sprzedawcy` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sprzedawcy`
--

INSERT INTO `sprzedawcy` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Edmund', 'Zdeb'),
(2, 'Włodzimierz', 'Śliwowski'),
(3, 'Iwona', 'Czachor');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seans_id` (`seans_id`),
  ADD KEY `sprzedawca_id` (`sprzedawca_id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- Indeksy dla tabeli `Filmy`
--
ALTER TABLE `Filmy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Filmy_rodzaj`
--
ALTER TABLE `Filmy_rodzaj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filmy_id` (`filmy_id`),
  ADD KEY `rodzaj_id` (`rodzaj_id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rodzaj_filmu`
--
ALTER TABLE `rodzaj_filmu`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sala_id` (`sala_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Indeksy dla tabeli `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bilety`
--
ALTER TABLE `bilety`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Filmy`
--
ALTER TABLE `Filmy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Filmy_rodzaj`
--
ALTER TABLE `Filmy_rodzaj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rodzaj_filmu`
--
ALTER TABLE `rodzaj_filmu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seanse`
--
ALTER TABLE `seanse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilety`
--
ALTER TABLE `bilety`
  ADD CONSTRAINT `bilety_ibfk_1` FOREIGN KEY (`seans_id`) REFERENCES `seanse` (`id`),
  ADD CONSTRAINT `bilety_ibfk_2` FOREIGN KEY (`sprzedawca_id`) REFERENCES `sprzedawcy` (`id`),
  ADD CONSTRAINT `bilety_ibfk_3` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id`);

--
-- Constraints for table `Filmy_rodzaj`
--
ALTER TABLE `Filmy_rodzaj`
  ADD CONSTRAINT `Filmy_rodzaj_ibfk_1` FOREIGN KEY (`filmy_id`) REFERENCES `Filmy` (`id`),
  ADD CONSTRAINT `Filmy_rodzaj_ibfk_2` FOREIGN KEY (`rodzaj_id`) REFERENCES `rodzaj_filmu` (`id`);

--
-- Constraints for table `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `seanse_ibfk_1` FOREIGN KEY (`sala_id`) REFERENCES `sale` (`id`),
  ADD CONSTRAINT `seanse_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `Filmy` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
