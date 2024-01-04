-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 05, 2022 lúc 05:09 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `myclassroom`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activated` bit(1) DEFAULT b'0',
  `activate_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`username`, `firstname`, `lastname`, `email`, `password`, `activated`, `activate_token`) VALUES
('admin', 'Việt', 'Đặng', 'admin@gmail.com', '$2y$10$53aNy6LAgr0f.dkCWP2SZeeM..wOiYtKHshUe9bjdhqpUuNk7hNWC', b'1', '2c2f509e6249ee2e05e506fc2be5d970'),
('minhkhoi', 'Minh ', 'Khôi', 'dvviet37@gmail.com', '$2y$10$FH0kLKuIcacAyYcTXXVLfOQGLMXPL5n55.7kLpCQOflknoOn0xg5u', b'1', ''),
('viet1', 'Việt', 'Đặng', 'vanvietx62002@gmail.com', '$2y$10$53aNy6LAgr0f.dkCWP2SZeeM..wOiYtKHshUe9bjdhqpUuNk7hNWC', b'1', '2c2f509e6249ee2e05e506fc2be5d970');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_lophoc`
--

CREATE TABLE `account_lophoc` (
  `idaccount_lophoc` int(11) NOT NULL,
  `idLop` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account_lophoc`
--

INSERT INTO `account_lophoc` (`idaccount_lophoc`, `idLop`, `username`, `role`) VALUES
(44, 1, 'viet1', 2),
(61, 24, 'minhkhoi', 1),
(62, 24, 'admin', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baidang`
--

CREATE TABLE `baidang` (
  `idbaidang` int(11) NOT NULL,
  `idlophoc` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `fileupload` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thoigiandang` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baitap`
--

CREATE TABLE `baitap` (
  `idbaitap` int(11) NOT NULL,
  `usernamepost` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `idlophoc` int(11) NOT NULL,
  `tieude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileupload` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `thoigiandang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thoigianhethan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `idbl` int(11) NOT NULL,
  `idbaidang` int(11) NOT NULL,
  `noidungbl` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `usernamebl` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `thoigianbl` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan_baitap`
--

CREATE TABLE `binhluan_baitap` (
  `idbl_bt` int(11) NOT NULL,
  `id_baitap` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `noidungbl` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `thoigianbl` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaibaidang`
--

CREATE TABLE `loaibaidang` (
  `maloaibd` int(11) NOT NULL,
  `tenloai` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaibaidang`
--

INSERT INTO `loaibaidang` (`maloaibd`, `tenloai`) VALUES
(1, 'Thông báo'),
(2, 'Thảo luận'),
(3, 'Bài tập');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophoc`
--

CREATE TABLE `lophoc` (
  `idLop` int(11) NOT NULL,
  `tenLop` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `motaLop` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phanHoc` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phongHoc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chude` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codelop` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lophoc`
--

INSERT INTO `lophoc` (`idLop`, `tenLop`, `motaLop`, `phanHoc`, `phongHoc`, `chude`, `codelop`) VALUES
(1, 'Cấu trúc rời rạc', 'Discrete Structures	', 'Phần 2', 'C501', 'Triết học', 'VzER67nBEc'),
(3, 'Thực tập nghề nghiệp', 'Basic Career Requirement	', '', 'A302', 'tin học', '6ECRAhpkmC'),
(8, 'Giáo dục quốc phòng - Học phần 1', 'National Defense Education - 1st Course', '1', 'D401', '', 'tHWNyArBqCSdI0g'),
(14, 'Xác suất và thống kê ứng dụng cho Công nghệ thông tin', 'Applied Probability and Statistics for IT	', '1', 'C406', '', 'zTdFiyH5jwo41lD'),
(16, 'Cấu trúc dữ liệu và giải thuật 1', 'Data Structures and Algorithms 1	', '', '', '', 're61liZuDmFpLIo'),
(17, 'lớp Khoi', 'học máy', 'ấdfads', 'B123', 'adb', 'nXdAxQ3vKNVBMqJ'),
(18, 'lớp Khoi', 'học máy', 'ấdfads', 'B123', 'adb', 'EngRyIXaD2t97db'),
(19, 'lớp Khoi', 'học máy', 'ấdfads', 'B123', 'adb', 'bKJRN6yhsYGwjTf'),
(20, 'a', 'A', 'A', 'A', 'A', 'vhVduIcWtfxA8g2'),
(24, 'XeKhach', '', '', 'B333', 'ddd', 'ux8ncTtbS5Pfwel');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pending_invited`
--

CREATE TABLE `pending_invited` (
  `idinvite` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `codelophoc` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reset_token`
--

CREATE TABLE `reset_token` (
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reset_token`
--

INSERT INTO `reset_token` (`email`, `token`, `expire_on`) VALUES
('vanvietx62002@gmail.com', 'd9672bd71d9dc3f446cd859b88392c26', 1669902179);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `account_lophoc`
--
ALTER TABLE `account_lophoc`
  ADD PRIMARY KEY (`idaccount_lophoc`),
  ADD KEY `account_lophoc_username` (`username`),
  ADD KEY `fk_account_lophoc_idlop` (`idLop`);

--
-- Chỉ mục cho bảng `baidang`
--
ALTER TABLE `baidang`
  ADD PRIMARY KEY (`idbaidang`),
  ADD KEY `baidang_idlophoc` (`idlophoc`),
  ADD KEY `baidang_username` (`username`);

--
-- Chỉ mục cho bảng `baitap`
--
ALTER TABLE `baitap`
  ADD PRIMARY KEY (`idbaitap`),
  ADD KEY `baitap_idlop` (`idlophoc`),
  ADD KEY `baitap_username` (`usernamepost`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`idbl`),
  ADD KEY `binhluan_idbaidang` (`idbaidang`),
  ADD KEY `binhluan_username` (`usernamebl`);

--
-- Chỉ mục cho bảng `binhluan_baitap`
--
ALTER TABLE `binhluan_baitap`
  ADD PRIMARY KEY (`idbl_bt`),
  ADD KEY `binhluan_baitap_idbt` (`id_baitap`),
  ADD KEY `binhluan_baitap_username` (`username`);

--
-- Chỉ mục cho bảng `loaibaidang`
--
ALTER TABLE `loaibaidang`
  ADD PRIMARY KEY (`maloaibd`);

--
-- Chỉ mục cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  ADD PRIMARY KEY (`idLop`);

--
-- Chỉ mục cho bảng `pending_invited`
--
ALTER TABLE `pending_invited`
  ADD PRIMARY KEY (`idinvite`),
  ADD KEY `pending_invited_username` (`username`);

--
-- Chỉ mục cho bảng `reset_token`
--
ALTER TABLE `reset_token`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account_lophoc`
--
ALTER TABLE `account_lophoc`
  MODIFY `idaccount_lophoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `baidang`
--
ALTER TABLE `baidang`
  MODIFY `idbaidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `baitap`
--
ALTER TABLE `baitap`
  MODIFY `idbaitap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `idbl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `binhluan_baitap`
--
ALTER TABLE `binhluan_baitap`
  MODIFY `idbl_bt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `loaibaidang`
--
ALTER TABLE `loaibaidang`
  MODIFY `maloaibd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  MODIFY `idLop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `pending_invited`
--
ALTER TABLE `pending_invited`
  MODIFY `idinvite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account_lophoc`
--
ALTER TABLE `account_lophoc`
  ADD CONSTRAINT `account_lophoc_idlop` FOREIGN KEY (`idLop`) REFERENCES `lophoc` (`idLop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_lophoc_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_account_lophoc_idlop` FOREIGN KEY (`idLop`) REFERENCES `lophoc` (`idLop`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `baidang`
--
ALTER TABLE `baidang`
  ADD CONSTRAINT `baidang_idlophoc` FOREIGN KEY (`idlophoc`) REFERENCES `lophoc` (`idLop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `baidang_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `baitap`
--
ALTER TABLE `baitap`
  ADD CONSTRAINT `baitap_idlop` FOREIGN KEY (`idlophoc`) REFERENCES `lophoc` (`idLop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `baitap_username` FOREIGN KEY (`usernamepost`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_idbaidang` FOREIGN KEY (`idbaidang`) REFERENCES `baidang` (`idbaidang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `binhluan_username` FOREIGN KEY (`usernamebl`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `binhluan_baitap`
--
ALTER TABLE `binhluan_baitap`
  ADD CONSTRAINT `binhluan_baitap_idbt` FOREIGN KEY (`id_baitap`) REFERENCES `baitap` (`idbaitap`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `binhluan_baitap_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `pending_invited`
--
ALTER TABLE `pending_invited`
  ADD CONSTRAINT `pending_invited_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
