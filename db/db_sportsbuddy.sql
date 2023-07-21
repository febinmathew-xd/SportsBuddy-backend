-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2023 at 05:25 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sportsbuddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userid`, `productid`, `price`, `status`) VALUES
(3, 14, 1, 3800, 1),
(6, 15, 1, 3800, 0);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(20) NOT NULL,
  `userid` int(30) NOT NULL,
  `turfid` int(100) NOT NULL,
  `title` varchar(333) NOT NULL,
  `complaint` varchar(222) NOT NULL,
  `replytitle` varchar(200) DEFAULT NULL,
  `reply` varchar(333) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `userid`, `turfid`, `title`, `complaint`, `replytitle`, `reply`) VALUES
(3, 15, 13, 'test', 'retetrtrt', 'title test', 'reply test'),
(4, 15, 13, 'this not a turf..its kandam', 'worst', 'Sorry Bro', 'we ll solve this problem soon'),
(5, 15, 9, 'testing xd', 'lo', '', NULL),
(6, 15, 9, 'Over priced', 'They charged me 5000 per hour..its not fare..its robbary', NULL, NULL),
(7, 14, 13, 'too bad', 'kandam is better than this turf', NULL, NULL),
(8, 15, 9, 'Too small ground', 'Small ground and high rate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id` int(11) NOT NULL,
  `username` varchar(222) NOT NULL,
  `contact` bigint(22) NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `lat` text NOT NULL,
  `lng` text NOT NULL,
  `loginid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id`, `username`, `contact`, `address`, `description`, `lat`, `lng`, `loginid`) VALUES
(9, 'test', 6677888876, 'Kollam Railway Station', 'ghfytyty', '8.8858968', '76.595131', 17),
(10, 'feb', 7789988877, 'TD Place', 'ere', '45.3984036', '-75.6835729', 18);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `userid` int(222) NOT NULL,
  `title` varchar(200) NOT NULL,
  `feedback` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `userid`, `title`, `feedback`) VALUES
(1, 14, 'Excellent App', 'Nice app...Good developer');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `usertype` int(11) NOT NULL COMMENT '0:admin\r\n1:user\r\n2:distributor\r\n3:turf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `usertype`) VALUES
(9, 'niji@gmail.com', '123', 3),
(12, 'admin@gmail.com', 'admin', 0),
(13, 'millenium@gmail.com', '123', 3),
(14, 'aslam@gmail.com', '123', 1),
(15, 'feby@gmail.com', '123', 1),
(16, 'mfebin24@gmail.com', '123', 1),
(17, 'test@gmail.com', '123', 2),
(18, 'febn@gmail.com', '123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `createdat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `createdat`) VALUES
(3, 'After spin trial, India lose pace battle against Bangladesh', 'Marufa Akter troubled the Indians with pace and movement to snare 4/29 while leg-spinner Rabeya Khan returned figures of 3/30 as India went down by 40 runs (DLS method) in a rain-affected game', '1689583995_Indian-women.jpg', '2023-07-17 14:23:16'),
(4, 'In the Land of Football, a Cricket Oasis Rises Outside Houston', 'Cricket’s swift rise in Houston has attracted international attention and helped make Texas the launch pad for the sport’s first American professional league, Major League Cricket, whose inaugural season began Thursday outside Dallas.', '1689584430_Major-League-Cricket.jpg', '2023-07-17 14:30:32'),
(5, 'Gary Neville responds after Erik ten Hag', 'Erik ten Hag will name a new Manchester United skipper shortly after taking the armband from Harry Maguire - with the Englishman tipped to complete a summer transfer', '1689584752_0_GettyImages-1494094108.jpg', '2023-07-17 14:35:54'),
(6, 'Liverpool drop £40million transfer hint', 'Fabinho has been left out of Liverpool\'s squad for their pre-season tour of Germany as rumours continue to circulate over the Brazilian\'s proposed move to Saudi Arabia', '1689584864_1_Liverpool-Training-Session.jpg', '2023-07-17 14:37:45'),
(7, 'Dream\' Wimbledon triumph could be the start of a new era: Carlos', 'Carlos Alcaraz believes that his \"dream\" Wimbledon victory over Novak Djokovic', '1689585237_download (1).jpeg', '2023-07-17 14:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `accountno` bigint(22) NOT NULL,
  `accountname` varchar(222) NOT NULL,
  `cvv` int(11) NOT NULL,
  `expirydate` text NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `currentdate` date NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0:order placed\r\n1:accepted\r\n2:completed\r\n3:rejected'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `accountno`, `accountname`, `cvv`, `expirydate`, `userid`, `productid`, `price`, `currentdate`, `status`) VALUES
(1, 38787787878, 'test', 4545, '2023-06-30', 14, 3, 4500, '2023-06-24', 3),
(2, 38787787878, 'test', 4545, '2023-06-30', 14, 1, 3800, '2023-06-24', 2),
(3, 3435465756454, 'Febin Mathew', 825, '2222-04-23', 15, 3, 4500, '2023-07-11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productname` varchar(222) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `file` text NOT NULL,
  `distributorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productname`, `description`, `price`, `file`, `distributorid`) VALUES
(1, 'Cricket Kit', 'Complete Kit bag for youth sizes includes all the gear that you need', 3800, '1687596953_710pNImAtXS._AC_UF1000,1000_QL80_.jpg', 7),
(3, 'Football Kit', 'Labh Traders 1 Football, ONE Pair of Wrist Band, ONE Head Band, 1 Pair of Socks, AIR Pump, 1 Pump, 1 KIT Bag Bag, 1 Water Bottle', 4500, '1687609536_football-kit-1562069838-4981081.jpeg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `ticketbooking`
--

CREATE TABLE `ticketbooking` (
  `id` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `accountno` bigint(22) NOT NULL,
  `accountname` varchar(200) NOT NULL,
  `cvv` int(20) NOT NULL,
  `expiry` text NOT NULL,
  `ticketcount` int(20) NOT NULL,
  `amount` int(20) NOT NULL,
  `tournamentid` int(20) NOT NULL,
  `bookeddate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticketbooking`
--

INSERT INTO `ticketbooking` (`id`, `userid`, `accountno`, `accountname`, `cvv`, `expiry`, `ticketcount`, `amount`, `tournamentid`, `bookeddate`) VALUES
(1, 15, 53453543, 'rerrer', 353, '2034-02-12', 1, 1100, 6, '2023-07-12 17:38:03'),
(2, 15, 3433445678, 'Febin mathew', 456, '2045-03-23', 3, 3300, 6, '2023-07-12 17:39:12'),
(3, 15, 434343434, 'tete', 343, '2023-03-03', 1, 999, 9, '2023-07-13 13:40:12'),
(4, 15, 3456678975, 'Gopika', 543, '2034-05-05', 7, 4893, 8, '2023-07-13 16:21:09'),
(5, 15, 4545454545, 'aslam', 543, '2034-03-03', 13, 9087, 8, '2023-07-13 16:23:56'),
(6, 15, 453545454, 'Apsara', 545, '2045-03-05', 3, 1800, 4, '2023-07-13 16:30:14'),
(7, 15, 53453454, 'fdhdfdf', 454, '5445-04-04', 1, 700, 5, '2023-07-13 16:35:52'),
(8, 15, 454545, 'rer', 454, '0277-04-04', 1, 988, 7, '2023-07-13 18:09:11'),
(9, 15, 545454, 'fdfdfd', 454, '5454-04-04', 1, 988, 7, '2023-07-13 18:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `id` int(11) NOT NULL,
  `turfid` int(11) NOT NULL,
  `name` varchar(222) NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  `time` time NOT NULL,
  `description` text NOT NULL,
  `ticketprice` int(20) NOT NULL,
  `ticketsavailable` int(20) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `turfid`, `name`, `datefrom`, `dateto`, `time`, `description`, `ticketprice`, `ticketsavailable`) VALUES
(1, 9, 'All Kerala U20', '2023-01-08', '2023-01-09', '01:00:00', 'tests', 400, 100),
(4, 13, 'Under 18 Cricket Match', '2023-01-08', '2023-01-09', '01:00:00', 'test', 600, 45),
(5, 9, 'IND vs AUS', '2023-07-23', '2023-07-24', '09:36:07', 'ODI Series', 700, 0),
(6, 9, 'RCB vs CSK', '2023-07-25', '2023-07-26', '11:30:50', 'Final', 1100, 20),
(7, 9, 'Kwf vs Afb', '2023-07-27', '2023-07-29', '11:30:50', 'Semifinals', 988, 2),
(8, 13, 'IND vs ENG', '2023-07-29', '2023-07-23', '09:36:07', 'T20 series', 699, 0),
(9, 13, 'KBFC vs BFC', '2023-07-19', '2023-07-20', '11:30:50', 'Group Round', 999, 120);

-- --------------------------------------------------------

--
-- Table structure for table `turf`
--

CREATE TABLE `turf` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `contact` bigint(22) NOT NULL,
  `address` text NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `lat` text NOT NULL,
  `lng` text NOT NULL,
  `loginid` int(11) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turf`
--

INSERT INTO `turf` (`id`, `username`, `contact`, `address`, `price`, `description`, `lat`, `lng`, `loginid`, `file`) VALUES
(9, 'Sports Arena', 7845124578, 'Trivandrum Central Railway Station', 420, 'Sod, also known as turf, is the upper layer of soil with the grass growing on it that is often harvested into rolls. In British and Australian English, sod is more commonly known as turf, and the word \"sod\" is limited mainly to agricultural senses.', '8.4870451', '76.9527248', 9, '1687674235_artificial-soccer-turf.jpg'),
(13, 'Millenium Turf', 9744753334, 'Kollam District Hospital', 450, 'Sod, also known as turf, is the upper layer of soil with the grass growing on it that is often harvested into rolls. In British and Australian English, sod is more commonly known as turf, and the word \"sod\" is limited mainly to agricultural senses.', '8.8884107', '76.5858916', 13, '1687674247_1630669298_sky-turf.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `turfbooking`
--

CREATE TABLE `turfbooking` (
  `id` int(11) NOT NULL,
  `accountno` bigint(22) NOT NULL,
  `accountname` varchar(222) NOT NULL,
  `cvv` int(11) NOT NULL,
  `expirydate` text NOT NULL,
  `userid` int(11) NOT NULL,
  `hoursneeded` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `bookingdate` text NOT NULL,
  `time` text NOT NULL,
  `turfid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turfbooking`
--

INSERT INTO `turfbooking` (`id`, `accountno`, `accountname`, `cvv`, `expirydate`, `userid`, `hoursneeded`, `price`, `bookingdate`, `time`, `turfid`, `status`) VALUES
(2, 38787787878, 'test', 434, '2023-06-28', 14, 2, 840, '2023-06-28', '14:00', 9, 2),
(3, 44545646464646, '4545454566', 646, '4444-05-04', 15, 1, 450, '2024-03-31', '12:00', 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `contact` bigint(22) NOT NULL,
  `address` text NOT NULL,
  `description` text DEFAULT NULL,
  `lat` text NOT NULL,
  `lng` text NOT NULL,
  `loginid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `contact`, `address`, `description`, `lat`, `lng`, `loginid`) VALUES
(12, 'Aslam', 7854215487, 'KAZHAKUTTOM JUNCTION', NULL, '8.5660298', '76.87475', 14),
(13, 'Febin', 9747990207, 'Mount Sinai Beth Israel', NULL, '40.7331881', '-73.9820909', 15),
(14, 'Febin Mathew', 9747990207, 'Thiruvananthapuram Zoo', NULL, '8.5105939', '76.9549377', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticketbooking`
--
ALTER TABLE `ticketbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turf`
--
ALTER TABLE `turf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turfbooking`
--
ALTER TABLE `turfbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticketbooking`
--
ALTER TABLE `ticketbooking`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `turf`
--
ALTER TABLE `turf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `turfbooking`
--
ALTER TABLE `turfbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
