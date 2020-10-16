-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 15 2020 г., 21:30
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
-- База данных: `7_variant_dv`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hab_category`
--

CREATE TABLE `hab_category` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_delivery`
--

CREATE TABLE `hab_delivery` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_position`
--

CREATE TABLE `hab_position` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_product`
--

CREATE TABLE `hab_product` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_provider`
--

CREATE TABLE `hab_provider` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_realization`
--

CREATE TABLE `hab_realization` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_trademark`
--

CREATE TABLE `hab_trademark` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_units_measure`
--

CREATE TABLE `hab_units_measure` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `hab_worker`
--

CREATE TABLE `hab_worker` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `link_delivery`
--

CREATE TABLE `link_delivery` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_provider_hash` binary(64) NOT NULL,
  `hab_worker_hash` binary(64) NOT NULL,
  `hab_product_hash` binary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `link_product`
--

CREATE TABLE `link_product` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_product_hash` binary(64) NOT NULL,
  `hab_units_measure_hash` binary(64) NOT NULL,
  `hab_category_hash` binary(64) NOT NULL,
  `hab_trademark_hash` binary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `link_realization_detail`
--

CREATE TABLE `link_realization_detail` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_realization_hash` binary(64) NOT NULL,
  `hab_product_hash` binary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `link_worker_position`
--

CREATE TABLE `link_worker_position` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_worker_hash` binary(64) NOT NULL,
  `hab_position_hash` binary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `link_worker_realization`
--

CREATE TABLE `link_worker_realization` (
  `hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_worker_hash` binary(64) NOT NULL,
  `hab_realization_hash` binary(64) NOT NULL
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
-- Структура таблицы `sat_category`
--

CREATE TABLE `sat_category` (
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_category_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_delivery`
--

CREATE TABLE `sat_delivery` (
  `Delivery_price` int(11) NOT NULL,
  `Delivery_time` time NOT NULL,
  `Amount` int(11) NOT NULL,
  `Account_number` int(11) NOT NULL,
  `hab_delivery_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_position`
--

CREATE TABLE `sat_position` (
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_position_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_product`
--

CREATE TABLE `sat_product` (
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Quanity_in_stock` int(11) NOT NULL,
  `Selling_price` int(11) NOT NULL,
  `Description` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_product_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_provider`
--

CREATE TABLE `sat_provider` (
  `Full_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Phone_number` varchar(255) COLLATE utf8_bin NOT NULL,
  `Address` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_provider_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_realization`
--

CREATE TABLE `sat_realization` (
  `Date` date NOT NULL,
  `Cost_of_goods` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Amount_to_pay` int(11) NOT NULL,
  `Paid` int(11) NOT NULL,
  `Change_1` int(11) NOT NULL,
  `hab_realization_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_realization_detail`
--

CREATE TABLE `sat_realization_detail` (
  `link_product_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_trademark`
--

CREATE TABLE `sat_trademark` (
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Address` varchar(255) COLLATE utf8_bin NOT NULL,
  `Phone_number` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_trademark_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_units_measure`
--

CREATE TABLE `sat_units_measure` (
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_units_measure_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_worker`
--

CREATE TABLE `sat_worker` (
  `Full_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Phone_number` varchar(255) COLLATE utf8_bin NOT NULL,
  `hab_worker_hash` binary(64) NOT NULL,
  `load_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record_source` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hab_category`
--
ALTER TABLE `hab_category`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_delivery`
--
ALTER TABLE `hab_delivery`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_position`
--
ALTER TABLE `hab_position`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_product`
--
ALTER TABLE `hab_product`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_provider`
--
ALTER TABLE `hab_provider`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_realization`
--
ALTER TABLE `hab_realization`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_trademark`
--
ALTER TABLE `hab_trademark`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_units_measure`
--
ALTER TABLE `hab_units_measure`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `hab_worker`
--
ALTER TABLE `hab_worker`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `link_delivery`
--
ALTER TABLE `link_delivery`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `hab_provider_hash` (`hab_provider_hash`),
  ADD KEY `hab_worker_hash` (`hab_worker_hash`),
  ADD KEY `hab_product_hash` (`hab_product_hash`);

--
-- Индексы таблицы `link_product`
--
ALTER TABLE `link_product`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `hab_product_hash` (`hab_product_hash`),
  ADD KEY `hab_units_measure_hash` (`hab_units_measure_hash`),
  ADD KEY `hab_category_hash` (`hab_category_hash`),
  ADD KEY `hab_trademark_hash` (`hab_trademark_hash`);

--
-- Индексы таблицы `link_realization_detail`
--
ALTER TABLE `link_realization_detail`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `hab_realization_hash` (`hab_realization_hash`),
  ADD KEY `hab_product_hash` (`hab_product_hash`);

--
-- Индексы таблицы `link_worker_position`
--
ALTER TABLE `link_worker_position`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `hab_worker_hash` (`hab_worker_hash`),
  ADD KEY `hab_position_hash` (`hab_position_hash`);

--
-- Индексы таблицы `link_worker_realization`
--
ALTER TABLE `link_worker_realization`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `hab_worker_hash` (`hab_worker_hash`),
  ADD KEY `hab_realization_hash` (`hab_realization_hash`);

--
-- Индексы таблицы `realization_detail`
--
ALTER TABLE `realization_detail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Realization_ID` (`Realization_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Индексы таблицы `sat_category`
--
ALTER TABLE `sat_category`
  ADD KEY `hab_category_hash` (`hab_category_hash`);

--
-- Индексы таблицы `sat_delivery`
--
ALTER TABLE `sat_delivery`
  ADD KEY `hab_delivery_hash` (`hab_delivery_hash`);

--
-- Индексы таблицы `sat_position`
--
ALTER TABLE `sat_position`
  ADD KEY `hab_position_hash` (`hab_position_hash`);

--
-- Индексы таблицы `sat_product`
--
ALTER TABLE `sat_product`
  ADD KEY `hab_product_hash` (`hab_product_hash`);

--
-- Индексы таблицы `sat_provider`
--
ALTER TABLE `sat_provider`
  ADD KEY `hab_provider_hash` (`hab_provider_hash`);

--
-- Индексы таблицы `sat_realization`
--
ALTER TABLE `sat_realization`
  ADD KEY `hab_realization_hash` (`hab_realization_hash`);

--
-- Индексы таблицы `sat_realization_detail`
--
ALTER TABLE `sat_realization_detail`
  ADD KEY `link_product_hash` (`link_product_hash`);

--
-- Индексы таблицы `sat_trademark`
--
ALTER TABLE `sat_trademark`
  ADD KEY `hab_trademark_hash` (`hab_trademark_hash`);

--
-- Индексы таблицы `sat_units_measure`
--
ALTER TABLE `sat_units_measure`
  ADD KEY `hab_units_measure_hash` (`hab_units_measure_hash`);

--
-- Индексы таблицы `sat_worker`
--
ALTER TABLE `sat_worker`
  ADD KEY `hab_worker_hash` (`hab_worker_hash`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `realization_detail`
--
ALTER TABLE `realization_detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
