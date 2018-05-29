-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Хост: pi271258.mysql.ukraine.com.ua
-- Время создания: Дек 03 2017 г., 19:58
-- Версия сервера: 5.7.16-10-log
-- Версия PHP: 7.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pi271258_testsig`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_skupka_category`
--

CREATE TABLE `oc_skupka_category` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_skupka_category`
--

INSERT INTO `oc_skupka_category` (`category_id`, `category_name`) VALUES
(1, 'Телефоны'),
(2, 'Планшеты'),
(4, 'Ноутбуки');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_skupka_products`
--

CREATE TABLE `oc_skupka_products` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(64) NOT NULL,
  `product_category` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_skupka_products`
--

INSERT INTO `oc_skupka_products` (`product_id`, `product_name`, `product_category`) VALUES
(4, 'DEXP XL145', 1),
(2, 'Samsung Galaxy J3 2016', 1),
(3, ' Samsung SM-T210 Galaxy Tab 3 ', 2),
(24, 'Sony Xperia XA', 1),
(6, 'ipad', 2),
(19, 'Huawei Honor 4C Pro', 1),
(20, 'Samsung Galaxy J7', 1),
(21, 'Asus Zenfone Go', 1),
(22, 'ZTE Nubia Z9 Max', 1),
(23, 'Sony Xperia Z2', 1),
(25, 'LG K10 LTE', 1),
(26, 'iPhone 5S', 1),
(27, 'Highscreen Zera S Power', 1),
(28, 'Xiaomi Redmi 3 Pro', 0),
(30, 'Xiaomi Redmi 3 Pro', 1),
(31, 'iPhone X', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_skupka_settings`
--

CREATE TABLE `oc_skupka_settings` (
  `id` int(10) NOT NULL,
  `skupka_meta_title` varchar(64) NOT NULL,
  `skupka_meta_descr` varchar(64) NOT NULL,
  `pagehead` varchar(64) NOT NULL,
  `pagedescr` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_skupka_settings`
--

INSERT INTO `oc_skupka_settings` (`id`, `skupka_meta_title`, `skupka_meta_descr`, `pagehead`, `pagedescr`) VALUES
(1, 'Купим телефоны ДОРОГО. Прием телефонов на запчасти', 'Сдать телефон на запчасти в Волгограде, Краснодаре', 'Купим телефоны ДОРОГО. Прием телефонов на запчасти.', 'Купим дорого сотовые телефоны, планшеты в любом состоянии. (можно не полностью рабочие, а также с разбитыми дисплеями и тачскринами).');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_skupka_category`
--
ALTER TABLE `oc_skupka_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `oc_skupka_products`
--
ALTER TABLE `oc_skupka_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_skupka_settings`
--
ALTER TABLE `oc_skupka_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_skupka_category`
--
ALTER TABLE `oc_skupka_category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_skupka_products`
--
ALTER TABLE `oc_skupka_products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `oc_skupka_settings`
--
ALTER TABLE `oc_skupka_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
