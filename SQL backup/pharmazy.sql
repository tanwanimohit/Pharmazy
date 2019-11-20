-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2019 at 09:52 AM
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
(1001, 'Stop Ache', 10, 5, 'All in one Pain Killer', 'https://www.netmeds.com/pub/media/catalog/product/cache/image/57453768b1c789093496adaa9e415a9d/c/r/crocin-650mg-tablet-15-s-405741158.jpg', '2019-10-05', '2020-05-05', 0, 101),
(1002, 'Xcell Caps', 150, 15, 'Joint Pains Tablates', 'https://xieonlife.com/pack-shots/COL-T%20TAB.jpg', '2019-10-10', '2020-05-05', 25, 101),
(1003, 'Antoxipan Tablet', 580, 50, 'Nutritional supplement.', 'https://5.imimg.com/data5/PU/IN/VA/GLADMIN-3061/antoxipan-nutritional-supplement-tablet-15-tab-strip-500x500.png', '2019-10-10', '2020-05-05', 20, 101),
(1004, 'Metacine', 10, 5, 'All in one Pain Killer', 'https://www.netmeds.com/pub/media/catalog/product/cache/image/57453768b1c789093496adaa9e415a9d/c/r/crocin-650mg-tablet-15-s-405741158.jpg', '2019-10-05', '2020-05-05', 150, 101);

-- --------------------------------------------------------

--
-- Table structure for table `spring_session`
--

CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `spring_session`
--

INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
('489fd97b-b2c6-464d-8b87-27d2d235bdff', '448d3efa-b656-4d7f-bfc8-8864290ae829', 1574148973733, 1574149147766, 1800, 1574150947766, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spring_session_attributes`
--

CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `spring_session_attributes`
--

INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
('489fd97b-b2c6-464d-8b87-27d2d235bdff', 'sessionid', 0xaced00057400186d6f6869746d75726c696468617240676d61696c2e636f6d);

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
  `u_password` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `email_verify` tinyint(1) NOT NULL,
  `forget_password` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_email`, `u_fname`, `u_lname`, `u_mobile`, `u_password`, `token`, `email_verify`, `forget_password`) VALUES
(6, 'pratibha@gmail.com', 'Pratibha', 'Hotwani', '8758508742', '$2a$10$npgj7n3lmRJNtx..Sw3REeKvovxdIzr7dVsY2x6cMwdeaoyASYMZS', 'temp', 1, 0),
(7, 'vishal@gmail.com', 'Vishal', 'Tanwani', '7894561230', '$2a$10$O3acbOz1aODrL59eORc5s.O4qAWoC7Osfx.dqQs5pYx4.0hlynHHG', 'temp2', 1, 0),
(8, 'pratik@gmail.com', 'Partik', 'Gupta', '789456123', '$2a$10$XiV426bRSZy/cZIP5Lpf.e9emZBFHtCrWit96jQbLGGL2pv3dnx7a', 'temp2', 1, 0),
(10, 'temp@gmail.com', 'Temp', 'User', '789456132', '$2a$10$bIpTo1cvcrn.vIG83yBjyu3gjspf4hIb0t8rNcCU92gOY4gb6nzgu', '7b6e68bd-9836-4bd1-a22f-85a6c1c252c7', 1, 0),
(15, 'mohitmurlidhar@gmail.com', 'Mohit', 'Tanwani', '08490924384', '$2a$10$hJqaJ1UvwBXZBvjvQPqv3eRCn6sJXxoD1ElM4Hcst3WVBAxuhMjnC', '953b489c-e758-461f-94b9-d8adc74d7c83', 1, 0);

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
-- Indexes for table `spring_session`
--
ALTER TABLE `spring_session`
  ADD PRIMARY KEY (`PRIMARY_ID`),
  ADD UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  ADD KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  ADD KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`);

--
-- Indexes for table `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
  ADD PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`);

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
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
  ADD CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
