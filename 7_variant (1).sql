-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 15 2020 г., 17:34
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `7_variant`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `delivery`
--

CREATE TABLE `delivery` (
  `ID` int(11) NOT NULL,
  `Provider_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Delivery_price` int(11) NOT NULL,
  `Delivery_time` time NOT NULL,
  `Amount` int(11) NOT NULL,
  `Account_number` int(11) NOT NULL,
  `Worker_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `position`
--

CREATE TABLE `position` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Quanity_in_stock` int(11) NOT NULL,
  `Units_measure_ID` int(11) NOT NULL,
  `Selling_price` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL,
  `Description` varchar(255) COLLATE utf8_bin NOT NULL,
  `Trademark_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `provider`
--

CREATE TABLE `provider` (
  `ID` int(11) NOT NULL,
  `Full_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Phone_number` varchar(255) COLLATE utf8_bin NOT NULL,
  `Address` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `realization`
--

CREATE TABLE `realization` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Worker_ID` int(11) NOT NULL,
  `Cost_of_goods` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Amount_to_pay` int(11) NOT NULL,
  `Paid` int(11) NOT NULL,
  `Change_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `realization_detail`
--

CREATE TABLE `realization_detail` (
  `ID` int(11) NOT NULL,
  `Realization_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `trademark`
--

CREATE TABLE `trademark` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Address` varchar(255) COLLATE utf8_bin NOT NULL,
  `Phone_number` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `units_measure`
--

CREATE TABLE `units_measure` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `worker`
--

CREATE TABLE `worker` (
  `ID` int(11) NOT NULL,
  `Full_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Position_ID` int(11) NOT NULL,
  `Phone_number` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Provider_ID` (`Provider_ID`),
  ADD KEY `Worker_ID` (`Worker_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Индексы таблицы `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Units_measure_ID` (`Units_measure_ID`),
  ADD KEY `Category_ID` (`Category_ID`),
  ADD KEY `Trademark_ID` (`Trademark_ID`);

--
-- Индексы таблицы `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `realization`
--
ALTER TABLE `realization`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Worker_ID` (`Worker_ID`);

--
-- Индексы таблицы `realization_detail`
--
ALTER TABLE `realization_detail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Realization_ID` (`Realization_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Индексы таблицы `trademark`
--
ALTER TABLE `trademark`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `units_measure`
--
ALTER TABLE `units_measure`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Position_ID` (`Position_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delivery`
--
ALTER TABLE `delivery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `position`
--
ALTER TABLE `position`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `provider`
--
ALTER TABLE `provider`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `realization`
--
ALTER TABLE `realization`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `realization_detail`
--
ALTER TABLE `realization_detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `trademark`
--
ALTER TABLE `trademark`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `units_measure`
--
ALTER TABLE `units_measure`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `worker`
--
ALTER TABLE `worker`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Provider_ID`) REFERENCES `provider` (`ID`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Worker_ID`) REFERENCES `worker` (`ID`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`ID`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Units_measure_ID`) REFERENCES `units_measure` (`ID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`Trademark_ID`) REFERENCES `trademark` (`ID`);

--
-- Ограничения внешнего ключа таблицы `realization`
--
ALTER TABLE `realization`
  ADD CONSTRAINT `realization_ibfk_1` FOREIGN KEY (`Worker_ID`) REFERENCES `worker` (`ID`);

--
-- Ограничения внешнего ключа таблицы `realization_detail`
--
ALTER TABLE `realization_detail`
  ADD CONSTRAINT `realization_detail_ibfk_1` FOREIGN KEY (`Realization_ID`) REFERENCES `realization` (`ID`),
  ADD CONSTRAINT `realization_detail_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`ID`);

--
-- Ограничения внешнего ключа таблицы `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`Position_ID`) REFERENCES `position` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
