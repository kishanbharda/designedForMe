-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 22, 2018 at 05:08 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dforme`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `USERID` int(10) NOT NULL,
  `FULLNAME` varchar(50) NOT NULL,
  `MOBILE` varchar(10) NOT NULL,
  `PINCODE` varchar(6) NOT NULL,
  `FULL_ADDRESS` varchar(200) NOT NULL,
  `CITY` varchar(20) NOT NULL,
  `STATE` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `USERNAME` varchar(10) character set cp1250 collate cp1250_czech_cs NOT NULL,
  `PASSWORD` varchar(10) character set cp1250 collate cp1250_czech_cs NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`USERNAME`, `PASSWORD`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `USERID` int(10) NOT NULL,
  `ITEM_ID` int(10) NOT NULL,
  `ITEM_NAME` varchar(100) NOT NULL,
  `IMAGE` varchar(200) NOT NULL,
  `SIZE` varchar(4) NOT NULL,
  `PRICE` int(10) NOT NULL,
  `DISCOUNT` int(10) NOT NULL,
  `QUANTITY` int(10) NOT NULL,
  `TOTAL` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--


-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(9) NOT NULL auto_increment,
  `MAIN_CATEGORY` varchar(50) NOT NULL,
  `SUB_CATEGORY` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `MAIN_CATEGORY`, `SUB_CATEGORY`) VALUES
(1, 'Men', 'Shirts'),
(2, 'Women', 'Dress'),
(3, 'Kid', 'T-Shirts'),
(4, 'Women', 'Sari'),
(5, 'Men', 'Jeans Pents'),
(6, 'Men', 'Formal Shirts'),
(7, 'Women', 'Top'),
(8, 'Kid', 'Pents'),
(10, 'Women', 'Hat'),
(18, 'Kid', 'Night');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `USERID` int(10) NOT NULL,
  `FIRSTNAME` varchar(30) NOT NULL,
  `LASTNAME` varchar(30) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `MESSAGE` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`USERID`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `MESSAGE`) VALUES
(9171, 'kishan', 'bharda', 'kishanlilabharda@gmail.com', 'this is good .');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `USERID` int(10) NOT NULL,
  `ITEM_ID` int(10) NOT NULL,
  `ITEM_NAME` varchar(100) NOT NULL,
  `IMAGE` varchar(200) NOT NULL,
  `SIZE` varchar(4) NOT NULL,
  `PRICE` int(10) NOT NULL,
  `DISCOUNT` int(10) NOT NULL,
  `QUANTITY` int(10) NOT NULL,
  `TOTAL` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`USERID`, `ITEM_ID`, `ITEM_NAME`, `IMAGE`, `SIZE`, `PRICE`, `DISCOUNT`, `QUANTITY`, `TOTAL`) VALUES
(7116, 6, 'Jeans Pents', '6.jpg', 'M', 260, 0, 1, 260),
(7116, 12, 'Kolkata sari', 'Red-sarees-2.jpg', 'M', 900, 50, 1, 850),
(7116, 14, 'kids shirts', '2016-Spring-Autumn-Boys-Plaid-Shirts-Children-s-Clothing-6-13-years-Kids-shirts-long-sleeve.jpg', 'M', 320, 20, 1, 300),
(7116, 18, 'Cotton pents', '6.jpg', 'M', 620, 100, 1, 520),
(7116, 9, 'Gujarati sari', '15Sept_CasualSaree_4x1.jpg', 'M', 800, 20, 1, 780),
(7116, 13, 'Special Dress', 'abcdef.jpg', 'M', 1200, 0, 1, 1200),
(7116, 11, 'Nike T-Shirts', '4.jpg', 'M', 600, 50, 1, 550);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(200) NOT NULL,
  `MAIN_CATEGORY` varchar(20) NOT NULL,
  `SUB_CATEGORY` varchar(20) NOT NULL,
  `SIZE` varchar(10) NOT NULL,
  `COLOR` varchar(10) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `DISCOUNT` int(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `IMAGE` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `NAME`, `MAIN_CATEGORY`, `SUB_CATEGORY`, `SIZE`, `COLOR`, `PRICE`, `DISCOUNT`, `QUANTITY`, `IMAGE`, `DESCRIPTION`) VALUES
(6, 'Jeans Pents', 'Men', 'Pents', 'L', 'blue', 260, 0, 98, '6.jpg', 'This is the our new brand jeans pents.'),
(7, 'Style Dress', 'Women', 'Dress', 'L', 'multiple', 620, 0, 9, '1579_MBLKGOLD_PROM_PROD11_072.jpg', 'This is the most trending dress.'),
(8, 'Child T-shirts', 'Kid', 'Shirts', 'S', 'white', 120, 0, 9, 'Boys-font-b-Shirts-b-font-Cotton-Fashion-Children-Clothing-High-Quality-School-font-b-Uniform.jpg', 'This is onlu for the kid.'),
(9, 'Gujarati sari', 'Women', 'Sari', 'L', 'multiple', 800, 20, 19, '15Sept_CasualSaree_4x1.jpg', 'The best gujarati sari.'),
(10, 'Formal Shirts For Bussiness', 'Men', 'Formal', 'L', 'White', 500, 0, 98, '3.jpg', 'This is the formal shirts for bussiness men.'),
(11, 'Nike T-Shirts', 'Men', 'T-Shirts', 'M', 'multiple', 600, 50, 96, '4.jpg', 'New branded nike t-shirts'),
(12, 'Kolkata sari', 'Women', 'Sari', 'XL', 'multiple', 900, 50, 8, 'Red-sarees-2.jpg', 'This is the kolkata saries.'),
(13, 'Special Dress', 'Women', 'Dress', 'M', 'Red', 1200, 0, 3, 'abcdef.jpg', 'Special dress of our stock.'),
(14, 'kids shirts', 'Kid', 'Shirts', 'S', 'blue', 320, 20, 295, '2016-Spring-Autumn-Boys-Plaid-Shirts-Children-s-Clothing-6-13-years-Kids-shirts-long-sleeve.jpg', 'Speical kids shirts'),
(15, 'Kids Jeans', 'Kid', 'Pents', 'S', 'Blue', 120, 0, 199, '15.jpg', 'kids jeans pents.'),
(16, 'Punjabi Sari', 'Women', 'Sari', 'XL', 'red', 900, 100, 99, 'Red Panjabi.jpg', 'New punjabi sari.'),
(17, 'Women Top', 'Women', 'Top', 'S', 'multiple', 500, 60, 18, 'bb1.jpg', 'Stylish top.'),
(18, 'Cotton pents', 'Men', 'Pents', 'L', 'white', 620, 100, 195, '6.jpg', 'cotton pents,party wear');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USERID` int(10) NOT NULL,
  `MOBILE` varchar(10) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

