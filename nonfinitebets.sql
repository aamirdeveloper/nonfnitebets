-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 09:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nonfinitebets`
--

-- --------------------------------------------------------

--
-- Table structure for table `bets`
--

CREATE TABLE `bets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `team1` varchar(100) NOT NULL,
  `team2` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bets`
--

INSERT INTO `bets` (`id`, `userId`, `team1`, `team2`, `amount`, `createdAt`, `updatedAt`) VALUES
(1, 3, 'test team 1', 'test team 2', 100, '2024-03-13 08:19:53', '2024-03-13 08:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `matchId` int(11) NOT NULL,
  `first` varchar(100) NOT NULL,
  `second` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `league` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`matchId`, `first`, `second`, `date`, `league`) VALUES
(52, 'Arsenal', 'Crystal Palace', '2024-01-20T12:30:00+00:00', 'Premier League'),
(53, 'Brentford', 'Nottingham Forest', '2024-01-20T17:30:00+00:00', 'Premier League'),
(54, 'Celta Vigo', 'Real Sociedad', '2024-01-20T20:00:00+00:00', 'LaLiga'),
(55, 'Valencia', 'Athletic Club', '2024-01-20T17:30:00+00:00', 'LaLiga'),
(56, 'Villarreal', 'Mallorca', '2024-01-20T15:15:00+00:00', 'LaLiga'),
(57, 'Rayo Vallecano', 'Las Palmas', '2024-01-20T13:00:00+00:00', 'LaLiga'),
(58, 'Real Madrid', 'Almeria', '2024-01-21T15:15:00+00:00', 'LaLiga'),
(59, 'Real Betis', 'Barcelona', '2024-01-21T17:30:00+00:00', 'LaLiga'),
(60, 'Osasuna', 'Getafe', '2024-01-21T13:00:00+00:00', 'LaLiga'),
(61, 'Brighton', 'Wolverhampton', '2024-01-22T19:45:00+00:00', 'Premier League'),
(62, 'Granada', 'Atletico Madrid', '2024-01-22T20:00:00+00:00', 'LaLiga'),
(63, 'Almeria', 'Deportivo Alaves', '2024-01-26T20:00:00+00:00', 'LaLiga'),
(64, 'Barcelona', 'Villarreal', '2024-01-27T17:30:00+00:00', 'LaLiga'),
(65, 'Las Palmas', 'Real Madrid', '2024-01-27T15:15:00+00:00', 'LaLiga'),
(66, 'Mallorca', 'Real Betis', '2024-01-27T20:00:00+00:00', 'LaLiga'),
(67, 'Real Sociedad', 'Rayo Vallecano', '2024-01-27T13:00:00+00:00', 'LaLiga'),
(68, 'Atletico Madrid', 'Valencia', '2024-01-28T20:00:00+00:00', 'LaLiga'),
(69, 'Celta Vigo', 'Girona', '2024-01-28T13:00:00+00:00', 'LaLiga'),
(70, 'Cadiz', 'Athletic Club', '2024-01-28T15:15:00+00:00', 'LaLiga'),
(71, 'Sevilla', 'Osasuna', '2024-01-28T17:30:00+00:00', 'LaLiga'),
(72, 'Getafe', 'Granada', '2024-01-29T20:00:00+00:00', 'LaLiga'),
(73, 'Aston Villa', 'Newcastle', '2024-01-30T20:15:00+00:00', 'Premier League'),
(74, 'Fulham', 'Everton', '2024-01-30T19:45:00+00:00', 'Premier League'),
(75, 'Luton', 'Brighton', '2024-01-30T19:45:00+00:00', 'Premier League'),
(76, 'Nottingham Forest', 'Arsenal', '2024-01-30T19:30:00+00:00', 'Premier League'),
(77, 'Crystal Palace', 'Sheffield United', '2024-01-30T20:00:00+00:00', 'Premier League'),
(78, 'Tottenham', 'Brentford', '2024-01-31T19:30:00+00:00', 'Premier League'),
(79, 'Liverpool', 'Chelsea', '2024-01-31T20:15:00+00:00', 'Premier League'),
(80, 'Manchester City', 'Burnley', '2024-01-31T19:30:00+00:00', 'Premier League'),
(81, 'Atletico Madrid', 'Rayo Vallecano', '2024-01-31T20:00:00+00:00', 'LaLiga'),
(82, 'Barcelona', 'Osasuna', '2024-01-31T18:00:00+00:00', 'LaLiga'),
(83, 'West Ham', 'Bournemouth', '2024-02-01T19:30:00+00:00', 'Premier League'),
(84, 'Wolverhampton', 'Manchester United', '2024-02-01T20:15:00+00:00', 'Premier League'),
(85, 'Getafe', 'Real Madrid', '2024-02-01T20:00:00+00:00', 'LaLiga'),
(86, 'Athletic Club', 'Mallorca', '2024-02-02T20:00:00+00:00', 'LaLiga'),
(87, 'Girona', 'Real Sociedad', '2024-02-03T20:00:00+00:00', 'LaLiga'),
(88, 'Granada', 'Las Palmas', '2024-02-03T15:15:00+00:00', 'LaLiga'),
(89, 'Deportivo Alaves', 'Barcelona', '2024-02-03T17:30:00+00:00', 'LaLiga'),
(90, 'Valencia', 'Almeria', '2024-02-03T13:00:00+00:00', 'LaLiga'),
(91, 'Real Betis', 'Getafe', '2024-02-04T17:30:00+00:00', 'LaLiga'),
(92, 'Real Madrid', 'Atletico Madrid', '2024-02-04T20:00:00+00:00', 'LaLiga'),
(93, 'Villarreal', 'Cadiz', '2024-02-04T13:00:00+00:00', 'LaLiga'),
(94, 'Osasuna', 'Celta Vigo', '2024-02-04T15:15:00+00:00', 'LaLiga'),
(95, 'Brentford', 'Manchester City', '2024-02-05T20:00:00+00:00', 'Premier League'),
(96, 'Rayo Vallecano', 'Sevilla', '2024-02-05T20:00:00+00:00', 'LaLiga'),
(97, 'Cadiz', 'Real Betis', '2024-02-09T20:00:00+00:00', 'LaLiga'),
(98, 'Las Palmas', 'Valencia', '2024-02-10T20:00:00+00:00', 'LaLiga'),
(99, 'Deportivo Alaves', 'Villarreal', '2024-02-10T13:00:00+00:00', 'LaLiga'),
(100, 'Real Madrid', 'Girona', '2024-02-10T17:30:00+00:00', 'LaLiga'),
(101, 'Real Sociedad', 'Osasuna', '2024-02-10T15:15:00+00:00', 'LaLiga'),
(102, 'Barcelona', 'Granada', '2024-02-11T20:00:00+00:00', 'LaLiga'),
(103, 'Mallorca', 'Rayo Vallecano', '2024-02-11T15:15:00+00:00', 'LaLiga'),
(104, 'Sevilla', 'Atletico Madrid', '2024-02-11T17:30:00+00:00', 'LaLiga'),
(105, 'Getafe', 'Celta Vigo', '2024-02-11T13:00:00+00:00', 'LaLiga'),
(106, 'Aston Villa', 'Manchester United', '2024-02-11T16:30:00+00:00', 'Premier League'),
(107, 'West Ham', 'Arsenal', '2024-02-11T14:00:00+00:00', 'Premier League'),
(108, 'Crystal Palace', 'Chelsea', '2024-02-12T20:00:00+00:00', 'Premier League'),
(109, 'Almeria', 'Athletic Club', '2024-02-12T20:00:00+00:00', 'LaLiga'),
(110, '', '', '', ''),
(111, '', '', '', ''),
(112, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `coinType` varchar(10) NOT NULL,
  `amount` double NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `userId`, `coinType`, `amount`, `createdAt`, `updatedAt`) VALUES
(1, 3, 'BTC', 5, '2024-03-13 08:24:38', '2024-03-13 08:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `userBalance` double NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `userBalance`, `createdAt`, `updatedAt`) VALUES
(3, 'New user 1', 'new1@gmail.com', '$2a$10$JQ/2PKwQJPjkpLD17EqS6uRaGaZAJSMsvRJq07GDS6LbYmeVxe.zC', 0, '2024-03-12 10:40:22', '2024-03-12 10:46:46'),
(4, 'Aabha', 'aabha@gmail.com', '$2a$10$LKg60isrN5YDHLU7kkRRJ.krd/LJkQ7nPajZOMFW.lAeXzNFnyYQC', 0, '2024-03-12 10:46:11', '2024-03-12 10:46:11'),
(5, 'Aabha', 'aabha1@gmail.com', '$2a$10$LvMn7HKBHuURJw3jWeXBv.MlUW9z1DTpSAqwlhqgxw89pgmuZINUy', 0, '2024-03-13 06:44:06', '2024-03-13 06:44:06'),
(6, 'Aabha', 'aabha2@gmail.com', '$2a$10$FtNI5nTlFtk24YCKiyPP7epRyUws0fRqoHfbsRjaxlQNcpWXgCBfG', 0, '2024-03-13 06:45:38', '2024-03-13 06:45:38'),
(7, 'New user', 'new_user1@gmail.com', '$2a$10$ftCmxQ2JLwpvbg.Kaysc6OhjEG3pRF5faMzmVEbGpfKYvyvXhMisK', 0, '2024-03-13 06:47:03', '2024-03-13 06:47:03'),
(8, 'New user 2', 'new_user2@gmail.com', '$2a$10$TIqCJa8dX7erfuoTDbX1B.8k6vnsvFQVKkQDXHcjb4qI1rMPbIMQW', 0, '2024-03-13 06:57:02', '2024-03-13 06:57:02'),
(9, 'New user 3', 'new_user3@gmail.com', '$2a$10$B1a2XcDW..oNBu0Qe/cVcOmO2umyjSWrz7M/yu4E7u9cK8yAPJZOS', 0, '2024-03-13 06:58:39', '2024-03-13 06:58:39'),
(10, 'New user 4', 'new_user4@gmail.com', '$2a$10$Lo1IjaeDk0BslDdC4DUkq.X.FQd6o2VMTWaHlfLcq2DZhTARsh1Uq', 0, '2024-03-13 06:59:43', '2024-03-13 06:59:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`matchId`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bets`
--
ALTER TABLE `bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `matchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
