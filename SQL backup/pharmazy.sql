-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2019 at 06:42 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmazy`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(101, 'Tablets');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(30) NOT NULL,
  `p_price` float NOT NULL,
  `p_weight` float NOT NULL,
  `p_description` varchar(200) NOT NULL,
  `p_image` varchar(200) NOT NULL,
  `p_mnf_date` date NOT NULL,
  `p_exp_date` date NOT NULL,
  `p_stock` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_name`, `p_price`, `p_weight`, `p_description`, `p_image`, `p_mnf_date`, `p_exp_date`, `p_stock`, `cat_id`) VALUES
(1001, 'Stop Ache', 10, 5, 'All in one Pain Killer', 'https://www.netmeds.com/pub/media/catalog/product/cache/image/57453768b1c789093496adaa9e415a9d/c/r/crocin-650mg-tablet-15-s-405741158.jpg', '2019-10-05', '2020-05-05', 150, 101),
(1002, 'Xcell Caps', 150, 15, 'Joint Pains Tablates', 'https://xieonlife.com/pack-shots/COL-T%20TAB.jpg', '2019-10-10', '2020-05-05', 25, 101),
(1003, 'Antoxipan Tablet', 580, 50, 'Nutritional supplement.', 'https://5.imimg.com/data5/PU/IN/VA/GLADMIN-3061/antoxipan-nutritional-supplement-tablet-15-tab-strip-500x500.png', '2019-10-10', '2020-05-05', 20, 101),
(1004, 'Metacine', 10, 5, 'All in one Pain Killer', 'https://www.netmeds.com/pub/media/catalog/product/cache/image/57453768b1c789093496adaa9e415a9d/c/r/crocin-650mg-tablet-15-s-405741158.jpg', '2019-10-05', '2020-05-05', 150, 101);

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `temp`
--

INSERT INTO `temp` (`Name`, `Email`, `Password`, `Contact`) VALUES
('Mohit', 'mohit@gmail.com', '123456', 84909243);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  `u_fname` varchar(255) DEFAULT NULL,
  `u_lname` varchar(255) DEFAULT NULL,
  `u_mobile` varchar(255) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_email`, `u_fname`, `u_lname`, `u_mobile`, `u_password`) VALUES
(5, 'mohitmurlidhar@gmail.com', 'Mohit', 'Tanwani', '08490924384', '$2a$10$kKeFf39VOu2ppnZNx3vRMuJpCfXGavBdPjdF6ha2/reD3sVZ16bEa'),
(6, 'pratibha@gmail.com', 'Pratibha', 'Hotwani', '8758508742', '$2a$10$npgj7n3lmRJNtx..Sw3REeKvovxdIzr7dVsY2x6cMwdeaoyASYMZS'),
(7, 'vishal@gmail.com', 'Vishal', 'Tanwani', '7894561230', '$2a$10$O3acbOz1aODrL59eORc5s.O4qAWoC7Osfx.dqQs5pYx4.0hlynHHG'),
(8, 'pratik@gmail.com', 'Partik', 'Gupta', '789456123', '$2a$10$XiV426bRSZy/cZIP5Lpf.e9emZBFHtCrWit96jQbLGGL2pv3dnx7a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
