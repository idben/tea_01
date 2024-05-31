-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2024 年 05 月 31 日 08:43
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `tea`
--

-- --------------------------------------------------------

--
-- 資料表結構 `tea`
--

CREATE TABLE `tea` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `tea`
--

INSERT INTO `tea` (`id`, `category_id`, `name`, `image_url`, `latitude`, `longitude`, `description`) VALUES
(1, 1, '紅茶1號', 'https://images.pexels.com/photos/3026801/pexels-photo-3026801.jpeg', 23.697800, 120.960500, '這是一款濃郁的紅茶，口感醇厚。'),
(2, 1, '紅茶2號', 'https://images.pexels.com/photos/322388/pexels-photo-322388.jpeg', 24.147700, 120.673600, '這是一款經典的紅茶，適合搭配甜點。'),
(3, 1, '紅茶3號', 'https://images.pexels.com/photos/1599927/pexels-photo-1599927.jpeg', 25.033000, 121.565400, '這是一款具有水果香氣的紅茶。'),
(4, 1, '紅茶4號', 'https://images.pexels.com/photos/2304776/pexels-photo-2304776.jpeg', 22.627300, 120.301400, '這是一款風味獨特的紅茶，適合冬季飲用。'),
(5, 1, '紅茶5號', 'https://images.pexels.com/photos/358574/pexels-photo-358574.jpeg', 23.973900, 120.982000, '這是一款口感細膩的紅茶。'),
(6, 2, '橙茶1號', 'https://images.pexels.com/photos/3026801/pexels-photo-3026801.jpeg', 23.697800, 120.960500, '這是一款具有橙香味的茶。'),
(7, 2, '橙茶2號', 'https://images.pexels.com/photos/322388/pexels-photo-322388.jpeg', 24.147700, 120.673600, '這是一款適合夏季飲用的橙茶。'),
(8, 3, '黃茶1號', 'https://images.pexels.com/photos/1599927/pexels-photo-1599927.jpeg', 25.033000, 121.565400, '這是一款口感甘甜的黃茶。'),
(9, 3, '黃茶2號', 'https://images.pexels.com/photos/2304776/pexels-photo-2304776.jpeg', 22.627300, 120.301400, '這是一款適合日常飲用的黃茶。'),
(10, 3, '黃茶3號', 'https://images.pexels.com/photos/358574/pexels-photo-358574.jpeg', 23.973900, 120.982000, '這是一款具有獨特香氣的黃茶。'),
(11, 4, '綠茶1號', 'https://images.pexels.com/photos/3026801/pexels-photo-3026801.jpeg', 23.697800, 120.960500, '這是一款清新的綠茶。'),
(12, 4, '綠茶2號', 'https://images.pexels.com/photos/322388/pexels-photo-322388.jpeg', 24.147700, 120.673600, '這是一款具有草本香氣的綠茶。'),
(13, 4, '綠茶3號', 'https://images.pexels.com/photos/1599927/pexels-photo-1599927.jpeg', 25.033000, 121.565400, '這是一款適合夏季飲用的綠茶。'),
(14, 4, '綠茶4號', 'https://images.pexels.com/photos/2304776/pexels-photo-2304776.jpeg', 22.627300, 120.301400, '這是一款具有花香的綠茶。'),
(15, 5, '藍茶1號', 'https://images.pexels.com/photos/3026801/pexels-photo-3026801.jpeg', 23.697800, 120.960500, '這是一款獨特的藍茶，口感新穎。'),
(16, 5, '藍茶2號', 'https://images.pexels.com/photos/322388/pexels-photo-322388.jpeg', 24.147700, 120.673600, '這是一款具有淡雅香氣的藍茶。');

-- --------------------------------------------------------

--
-- 資料表結構 `tea_category`
--

CREATE TABLE `tea_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `tea_category`
--

INSERT INTO `tea_category` (`id`, `name`) VALUES
(1, '紅茶'),
(2, '橙茶'),
(3, '黃茶'),
(4, '綠茶'),
(5, '藍茶');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `tea`
--
ALTER TABLE `tea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- 資料表索引 `tea_category`
--
ALTER TABLE `tea_category`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tea`
--
ALTER TABLE `tea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tea_category`
--
ALTER TABLE `tea_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `tea`
--
ALTER TABLE `tea`
  ADD CONSTRAINT `tea_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tea_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
