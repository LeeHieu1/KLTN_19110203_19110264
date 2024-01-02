-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 02, 2024 at 03:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopthoitrang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_image`) VALUES
(2, 'Admin', 'admin@gmail.com', '123', '00626-3406267920.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `p_size` varchar(255) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `p_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) NOT NULL,
  `category_title` varchar(255) NOT NULL,
  `category_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`, `category_desc`) VALUES
(2, 'Nữ', ''),
(3, 'Nam', '');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(100) NOT NULL,
  `coupon_used` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(12, 33, 'tesr', '590', 'test', 99, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `customer_password`, `customer_image`, `customer_ip`) VALUES
(28, 'User Test', 'user@gmail.com', '0123456789', 'HCM', '$2y$10$UKYpGB1LAmMXe1Fv9NfiH.FWiV0kZ0UzylPEpp1CIyDNGA6FfeUI2', '186459515_515604526308215_5245455360375216631_n.jpg', '::1'),
(30, 'User1', 'user1@gmail.com', '028395', 'abc', '$2y$10$1pcJc8Cr/nqROifWaHGk.eprkyGv3nsfPp./SMFsEmWCL1YjST0b2', '2023-10-04_02-58-33.png', '::1'),
(31, 'abc', 'abc@gmail.com', '0123456789', 'abc', '$2y$10$sP3naXkmq2SNv5QJlhvno.FSU9Pec.EPIEWHTZjV3t1yzAh0mSMQC', '00074-4146499890.png', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_quantity` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `product_id`, `product_size`, `product_quantity`, `order_date`, `order_status`) VALUES
(184, 28, 590000, 502936968, 33, '2', 1, '2023-12-26', 'Complete'),
(185, 28, 590000, 502936968, 31, '1', 1, '2023-12-26', 'Pending'),
(186, 28, 590000, 1025290619, 30, '1', 1, '2023-12-26', 'Complete'),
(187, 28, 810000, 2006634580, 27, '1', 1, '2023-12-26', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `product_category_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_image_1` text NOT NULL,
  `product_image_2` text NOT NULL,
  `product_image_3` text NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_label` text NOT NULL,
  `product_sale` varchar(255) NOT NULL,
  `product_total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_category_id`, `category_id`, `date`, `product_title`, `product_price`, `product_image_1`, `product_image_2`, `product_image_3`, `product_keywords`, `product_description`, `product_label`, `product_sale`, `product_total`) VALUES
(19, 1, 2, '2020-10-20 02:52:29', 'Kota Dress', '650000', 'product_images/72126862_2399196567007918_36652662493544448_o.jpg', 'product_images/60337718_2294678607459715_7587335581248520192_o.jpg', 'product_images/72300551_2399191497008425_479029857280327680_o.jpg', 'dress, vay', 'BST mới nhất của Lalla lấy cảm hứng từ bộ phim Crash Landing on You - Hạ cánh nơi anh ✈️ với hình ảnh người phụ nữ hiện đại, năng động và đầy quyền lực. Chất tơ xốp Hàn bên ngoài và đầm lụa lót b&a', 'sale', '590000', 20),
(21, 1, 2, '2021-01-03 09:10:49', 'Honu Dress', '590000', 'product_images/49274283_2207455782848665_5964890596895096832_o.jpg', 'product_images/49210956_2207455802848663_2798101486024785920_o.jpg', 'product_images/49210956_2207455802848663_2798101486024785920_o.jpg', 'dress, vay', 'Với gam màu pastel nhẹ nhàng : Trắng , hồng , xanh, chiếc đầm Honu dress của Lalla sẽ giúp bạn thật thanh lịch và nữ tính dù ở bất cứ đâu.\r\n\r\n <br><br><br>\r\n\r\n-Màu: xanh, hồng', 'new', '0', 19),
(23, 1, 2, '2021-01-03 11:07:38', 'Jubi Jumpsuit', '590000', 'product_images/47084530_2183357158591861_4386413819816050688_o.jpg', 'product_images/47084963_2183357118591865_5765777940277100544_o.jpg', 'product_images/47084963_2183357118591865_5765777940277100544_o.jpg', 'dress, vay', 'Jumpsuit Jubi của #lalla thích hợp cho các cô gái yêu thích vẻ năng động, bồng bềnh nhưng vẫn cá tính đây !!!\r\nChất vải mỏng nhẹ , form jumpsuit vừa vặn tạo độ thoải', 'new', '0', 13),
(24, 9, 2, '2021-01-03 09:10:49', 'Codo top, Taca skirt', '970000', 'product_images/53678183_2250640148530228_1014424498826379264_o.jpg', 'product_images/53488075_2250638645197045_8604971770719502336_o.jpg', 'product_images/53488075_2250638645197045_8604971770719502336_o.jpg', 'top skirt', 'Nếu bạn đang tìm bộ cánh thanh lịch mà vẫn sang chảnh thì đừng bỏ lỡ set trang phục này của Lalla nhé ❤️\r\n\r\n <br><br><br>\r\n\r\n- Màu:  Kem , đỏ', 'sale', '870000', 13),
(25, 1, 2, '2023-02-11 03:33:26', 'Beda Dress', '590000', 'product_images/89021214_2535040043423569_2145711342630207488_o.jpg', 'product_images/87385314_2535040080090232_936441791245189120_o.jpg', 'product_images/87385314_2535040080090232_936441791245189120_o.jpg', 'dress, vay', 'Không gì cuốn hút hơn 1 cô gái mặc váy lụa đỏ ?vì khi ấy nàng như một đoá hồng rực rỡ và kiêu sa đến não lòng ...\r\n<br><br><br>\r\n \r\n\r\n- Màu: đỏ - rê', 'new', '0', 5),
(26, 1, 2, '2021-01-06 02:36:16', 'Lino Dress', '690000', 'product_images/64828089_2338504446410464_7369705783019175936_o.jpg', 'product_images/67586870_2338504523077123_5408338306498822144_o.jpg', 'product_images/67091089_2338504719743770_1933520626560008192_o.jpg', 'dress, vay', 'Lalla chính thức lên kệ với những thiết kế nhẹ nhàng, trẻ trung và lãng đãng như chính tên gọi của BST.\r\n\r\n<br><br><br>\r\n\r\n- Màu: Xanh lá - Xanh cẩm thạch', 'new', '0', 34),
(27, 9, 2, '2023-12-26 08:20:08', 'Cobi Top, Tuta Skirt', '900000', 'product_images/46514410_2178404795753764_580730220378587136_o.jpg', 'product_images/46485713_2178404872420423_524984813346619392_o.jpg', 'product_images/46519328_2178404842420426_1736984318959419392_o.jpg', 'top skirt', 'Thiết kế mới toanh trong BST mới của Lalla là chiếc áo Cobi top với chất voan lụa thoáng mát điểm xuyết chấm bi duyên dáng, Cobi Top 390.000, Tuta Skirt 420.000', 'sale', '810000', 37),
(28, 9, 2, '2023-12-26 08:20:08', 'Nono Top, Nuno Skirt', '840000', 'product_images/65719129_2324549207805988_7892096113996464128_o.jpg', 'product_images/65370961_2324549577805951_8650683996709060608_o.jpg', 'product_images/65188678_2324549714472604_7817738556381593600_o.jpg', 'top skirt', 'Ngọt ngào nhưng vẫn vô cùng cá tính với những mẫu thiết kế mới nhất trong BST SUMMER VIBE của #Lalla', 'new', '0', 59),
(30, 1, 2, '2023-12-26 08:11:51', 'Dada Dress', '690000', 'product_images/97478285_2596228327304740_6979566454387507200_o (1).jpg', 'product_images/96809365_2596228173971422_4155707954999328768_o.jpg', 'product_images/96809365_2596228173971422_4155707954999328768_o.jpg', 'dress, vay', 'BST mới nhất của Lalla lấy cảm hứng từ bộ phim Crash Landing on You - Hạ cánh nơi anh ✈️ với hình ảnh người phụ nữ hiện đại, năng động và đầy quyền lực. Chất tơ xốp Hàn bên ngoài và đầm lụa lót b&a', 'sale', '590000', 59),
(31, 1, 2, '2023-12-26 08:11:37', 'Doly Dress', '590000', 'product_images/106719668.jpg', 'product_images/107693707.jpg', 'product_images/107663751.jpg', 'dress, vay', 'BST S/S 2020 của Lalla lấy cảm hứng từ khu vườn thiên nhiên với những sắc hoa pastel hồng, tím, baby blue nhẹ nhàng thanh thoát sẽ giúp mùa hè của bạn trở nên tươi trẻ và rực rỡ. Thiết kế độc quyền của thương hiệu thời trang Lalla. ', 'new', '0', 27),
(32, 1, 2, '2023-12-25 04:30:39', 'Lola Dress', '690000', 'product_images/129841855_2778718839055687_4921207847791622071_o.jpg', 'product_images/129646589_2778719239055647_5672869489056169002_o.jpg', 'product_images/129938944_2778719585722279_3449075532910701693_o.jpg', 'dress, vay', 'XMAS PREMIUM COLLECTION là BST thời trang cao cấp độc quyền từ thương hiệu #Lalla của diễn viên MIDU ra mắt đặc biệt cho mùa lễ hội. Với tiêu chí Giá trị cao - Giá thành ưu đãi. Những sản phẩm của #Lalla luôn ưu tiên cho chất lượng, form dáng và giá thành vô cùng ưu đãi chỉ #590k', 'sale', '590000', 17),
(33, 1, 2, '2023-12-29 12:21:30', 'Bata Dress', '590000', 'product_images/82196573_2481185252142382_7444610077085925376_o.jpg', 'product_images/81070717_2481184978809076_2107956170621714432_o.jpg', 'product_images/81090549_2481185388809035_7955383887327133696_o.jpg', 'dress, vay', 'Tết năm nay, hãy cùng Lalla, Midu và Jun Vũ tự tin trở thành người phụ nữ biết yêu thương và giải phóng chính bản thân mình bạn nhé.', 'new', '0', 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_category_id` int(10) NOT NULL,
  `product_category_title` varchar(255) NOT NULL,
  `product_category_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_category_id`, `product_category_title`, `product_category_desc`) VALUES
(1, 'Dress', '\"Mùa hè và những bông hoa cúc dại\" rất thơ và lãng mạn của Lalla chính thức lên kệ với những thiết kế nhẹ nhàng, trẻ trung và lãng đãng như chính tên gọi của BST'),
(9, 'Top + Skirt', 'Thiết kế nhẹ nhàng, trẻ trung và lãng đãng');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `slide_id` int(10) NOT NULL,
  `slide_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`slide_id`, `slide_image`) VALUES
(1, 'slides_images/slide01b.jpg'),
(2, 'slides_images/slide02.jpg'),
(3, 'slides_images/slide03.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`slide_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `product_category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
