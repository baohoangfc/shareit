-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2017 at 03:57 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shareit`
--

-- --------------------------------------------------------

--
-- Table structure for table `cat`
--

CREATE TABLE `cat` (
  `id_cat` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat`
--

INSERT INTO `cat` (`id_cat`, `name`, `id_parent`) VALUES
(0, '---Không Có---', 0),
(2, 'Tin Tức', 0),
(4, 'An Ninh Mạng', 2),
(5, 'Thủ Thuật', 0),
(10, 'Đánh Giá', 0),
(11, 'Máy Ảnh', 10),
(12, 'Laptop', 10),
(13, 'Di Động', 10),
(20, 'Thế Giới Số', 2);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(255) NOT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cat` int(255) NOT NULL,
  `id_news` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `fullname`, `content`, `email`, `date_create`, `id_cat`, `id_news`) VALUES
(3, '', 'sssssssssssssssssss', 's', '2017-07-14 10:45:00', 2, 2),
(4, '', 'sssssssssssssssssss', 's', '2017-07-14 10:45:03', 2, 2),
(6, 'ABC', 'a', 'a@gmail.com', '14/07/2017', 0, 2),
(11, 'a', 'a', 'a@gmail.com', '14/07/2017', 0, 2),
(12, 'a', 'a', 'a@gmail.com', '14/07/2017', 0, 2),
(16, 'a', 'a', 'a@gmail.com', '15/07/2017', 0, 6),
(20, 'sdsdsdsdsdsd', 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 'a@gmail.com', '17/07/2017', 0, 9),
(21, 'a', 'sssssssssssssssssssss', 'ad@gmail.com', '17/07/2017', 0, 6),
(35, 'a', 'sdsds', 'sdsd@gmail.com', '17/07/2017', 0, 10),
(50, 'a', 'a', 'a', '17/07/2017', 0, 10),
(51, 'sdsds', 'sdsd', 'sdsd@gmail.com', '17/07/2017', 0, 13),
(52, 'á', 'sdsd', 'sd', '17/07/2017', 0, 11),
(53, 'ajjjjj', 'sd', 'sdsd@gmail.com', '19/07/2017', 0, 6),
(54, '', '', '', '20/07/2017', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mod_user`
--

CREATE TABLE `mod_user` (
  `id_mod` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mod_user`
--

INSERT INTO `mod_user` (`id_mod`, `name`) VALUES
(1, 'Admin'),
(2, 'Trial Mod'),
(3, 'Mod');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id_news` int(255) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `preview` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_cat` int(255) NOT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(255) DEFAULT NULL,
  `is_slide` int(2) DEFAULT NULL,
  `id_status` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id_news`, `name`, `preview`, `detail`, `date_create`, `id_cat`, `picture`, `created_by`, `is_slide`, `id_status`) VALUES
(11, 'a', 'a', 'a', '2017-07-16 16:38:33', 14, '_4288027382210.', 7, 1, 1),
(13, 'aaaaaaaaaaaaaaaaaaaaaaaa', '', '', '2017-07-17 16:00:38', 9, '544d9d71-f5b4-4bcb-92d8-36c9edd78fcc_45572477956693.jpg', 7, 1, 1),
(15, '4.800 người Trung Quốc bị bắt vì đánh cắp dữ liệu cá nhân', 'Theo thông tin từ Bộ Công an Trung Quốc, cảnh sát đã bắt giữ hơn 4.800 nghi phạm trên toàn quốc kể từ tháng 3 đến nay vì tội ăn cắp thông tin cá nhân.', '<p>Trong hơn bốn th&aacute;ng ra qu&acirc;n, cảnh s&aacute;t Trung Quốc cho biết, họ đ&atilde; xử l&yacute; hơn 1.800 vụ &aacute;n li&ecirc;n quan đến khoảng 50 tỷ mẩu th&ocirc;ng tin c&aacute; nh&acirc;n bị đ&aacute;nh cắp.</p>\r\n\r\n<p>Dữ liệu c&aacute; nh&acirc;n của c&aacute;c nh&acirc;n vi&ecirc;n c&ocirc;ng ty hoặc c&aacute;c cơ quan c&ocirc;ng quyền l&agrave; mục ti&ecirc;u của bọn trộm. Ch&uacute;ng thường thu thập th&ocirc;ng tin n&agrave;y v&agrave; b&aacute;n bất hợp ph&aacute;p cho c&aacute;c đối tượng kh&aacute;c nhằm giả mạo hoặc tống tiền.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, Bộ C&ocirc;ng an cũng cảnh b&aacute;o một xu hướng ng&agrave;y c&agrave;ng tăng của tin tặc l&agrave; ăn cắp dữ liệu từ c&aacute;c doanh nghiệp v&agrave; c&aacute;c nh&agrave; cung cấp dịch vụ tr&ecirc;n mạng. Trang điện tử The Paper của Thượng Hải đưa tin ng&agrave;y 18/7 rằng, đ&acirc;y l&agrave; c&aacute;c rủi ro nội bộ m&agrave; c&aacute;c c&ocirc;ng ty Trung Quốc đang phải đối mặt.</p>\r\n\r\n<p>B&aacute;o n&agrave;y tr&iacute;ch dẫn lời cảnh s&aacute;t th&agrave;nh phố Cẩm Ch&acirc;u cho biết, một nh&acirc;n vi&ecirc;n của dịch vụ chuyển ph&aacute;t c&oacute; chi nh&aacute;nh tại tỉnh Hồ Bắc đ&atilde; hối lộ nh&acirc;n vi&ecirc;n của một c&ocirc;ng ty ở địa phương n&agrave;y để tiếp cận hệ thống dữ liệu c&ocirc;ng ty v&agrave; thu thập th&ocirc;ng tin c&aacute; nh&acirc;n v&agrave; b&aacute;n tr&ecirc;n thị trường chợ đen.</p>\r\n\r\n<p>Dữ liệu c&aacute; nh&acirc;n bị đ&aacute;nh cắp bao gồm th&ocirc;ng tin như danh s&aacute;ch những người mua sản phẩm chăm s&oacute;c sức khoẻ.</p>\r\n\r\n<p>Nh&acirc;n vi&ecirc;n hối lộ ở Hồ Bắc đ&atilde; bị bắt sau khi c&ocirc;ng ty nhận thấy c&ocirc; n&agrave;y thường đăng nhập v&agrave;o hệ thống th&ocirc;ng tin kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>Một trong những người gi&aacute;m s&aacute;t tại c&ocirc;ng ty chuyển ph&aacute;t nhanh kia cũng bị bắt sau đ&oacute;, sau khi cảnh s&aacute;t ph&aacute;t hiện ra rằng anh ta đang b&aacute;n dữ liệu của kh&aacute;ch h&agrave;ng.</p>\r\n', '2017-07-20 09:32:58', 4, 'monitor_32GJFC_6922641745251.jpg', 12, 1, 1),
(16, 'Mã độc GhostCtrl: Đánh cắp mọi thứ từ smartphone Android!', 'Android dường như đã trở thành mục tiêu tấn công ưa thích của các nhóm chuyên viết phần mềm virus trên thế giới, với các phần mềm độc hại có cách thức lây nhiễm vào nhiều thiết bị khác nhau được phát hiện mỗi ngày.', '<p>Mới đ&acirc;y, c&ocirc;ng ty chuy&ecirc;n về Bảo mật - Trend Micro đ&atilde; đưa ra cảnh b&aacute;o về một backdoor mới tr&ecirc;n Android c&oacute; t&ecirc;n gọi l&agrave; GhostCtrl v&agrave; l&agrave; một phi&ecirc;n bản của phần mềm OmniRAT nổi tiếng đ&atilde; được ph&aacute;t hiện v&agrave;o cuối năm 2015, g&acirc;y ảnh hưởng đến một loạt c&aacute;c nền tảng, bao gồm Windows, Linux v&agrave; Mac.</p>\r\n\r\n<p>Backdoor l&agrave; một chương tr&igrave;nh (program) hoặc c&oacute; li&ecirc;n quan đến chương tr&igrave;nh, được hacker sử dụng để c&agrave;i đặt tr&ecirc;n hệ thống đ&iacute;ch, nhằm mục đ&iacute;ch cho anh ta truy cập trở lại hệ thống v&agrave;o lần sau. Mục đ&iacute;ch của backdoor l&agrave; x&oacute;a bỏ một c&aacute;ch minh chứng hệ thống ghi nhật k&yacute;.<img alt="" src="/shareit/files/images/monitor_32GJFC.jpg" style="height:449px; width:665px" /></p>\r\n\r\n<p>GhostCtrl đặc biệt cố gắng l&acirc;y nhiễm v&agrave;o c&aacute;c thiết bị Android v&agrave; n&oacute; l&acirc;y lan th&agrave;nh c&aacute;c APK độc lập c&oacute; t&ecirc;n như App, MMS, Whatsapp, hoặc Pokemon GO. APK l&agrave; viết tắt của cụm từ tiếng Anh &quot;Android application package&quot; (tạm dịch l&agrave; bộ c&agrave;i đặt ứng dụng tr&ecirc;n hệ điều h&agrave;nh Android). Phần mềm độc hại đ&atilde; được ph&aacute;t hiện trong ba phi&ecirc;n bản kh&aacute;c nhau, với những hacker tay nghề cao c&oacute; thể kiểm so&aacute;t ho&agrave;n to&agrave;n thiết bị, chiếm quyền truy cập v&agrave; chuyển dữ liệu lưu trữ cục bộ.</p>\r\n\r\n<p>Theo c&aacute;c chuy&ecirc;n gia, APK độc hại, sau khi được k&iacute;ch hoạt một c&aacute;ch tự động bởi một g&oacute;i APK, sẽ y&ecirc;u cầu người d&ugrave;ng c&agrave;i đặt n&oacute;. Ngay cả khi người d&ugrave;ng hủy bỏ y&ecirc;u cầu &ldquo;c&agrave;i đặt trang&quot;, tin nhắn vẫn sẽ bật l&ecirc;n ngay lập tức. APK độc hại kh&ocirc;ng c&oacute; biểu tượng. Sau khi c&agrave;i đặt, APK wrapper sẽ khởi chạy một dịch vụ cho ph&eacute;p APK nguy hiểm, chạy tr&ecirc;n nền.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2017-07-20 09:42:01', 4, 'monitor_images_7558671863173.jpg', 12, 1, 1),
(17, 'Lại bùng phát lừa đảo nhắc nợ cước qua điện thoại cố định', 'Hiện tượng giả mạo VNPT nhắc nợ cước để lừa đảo đang bùng phát trở lại, nguy hiểm hơn kẻ xấu đã sử dụng đầu số bán hàng 18001166 của VNPT để lừa đảo gây hoang mang cho khách hàng, đã có không ít người dùng mất cảnh giác đã bị kẻ xấu lừa đảo gây thiệt hại về tài sản.', '<p><img alt="" src="/shareit/files/images/monitor_32GJFC.jpg" style="height:449px; width:665px" />VNPT mới đ&acirc;y đ&atilde; khuyến c&aacute;o c&aacute;c kh&aacute;ch h&agrave;ng đang sử dụng dịch vụ điện thoại cố định hết sức cảnh gi&aacute;c khi nhận được c&aacute;c cuộc gọi xưng danh l&agrave; VNPT nhắc nợ cước, bởi đ&acirc;y c&oacute; thể l&agrave; thủ đoạn của kẻ cấu nhằm chiếm đoạt tiền v&agrave; th&ocirc;ng tin người d&ugrave;ng.</p>\r\n\r\n<p>&quot;Kịch bản&quot; thường thấy l&agrave; kẻ lừa đảo giả mạo tổng đ&agrave;i VNPT gọi đến số cố định để nhắc nợ cước điện thoại với số tiền lớn y&ecirc;u cầu thanh to&aacute;n ngay nếu kh&ocirc;ng sẽ tạm dừng li&ecirc;n lạc v&agrave; khởi kiện ra t&ograve;a. Mục đ&iacute;ch của ch&uacute;ng l&agrave; thu thập tr&aacute;i ph&eacute;p c&aacute;c kh&ocirc;ng tin c&aacute; nh&acirc;n của kh&aacute;ch h&agrave;ng (t&ecirc;n, tuổi, địa chỉ, số CMTND, hộ khẩu, t&agrave;i khoản ng&acirc;n h&agrave;ng ...) chiếm đoạt tiền bằng c&aacute;ch cung cấp số t&agrave;i khoản để kh&aacute;ch h&agrave;ng thanh to&aacute;n hoặc dẫn dụ kh&aacute;ch h&agrave;ng bấm số gọi lại với mục đ&iacute;ch chuyển tiếp cuộc gọi từ m&aacute;y của kh&aacute;ch h&agrave;ng v&agrave;o c&aacute;c đầu số dịch vụ gi&aacute; cước cao sau đ&oacute; c&aacute;c đối tượng n&agrave;y sẽ trục lợi từ việc hưởng cước ph&iacute; do người d&ugrave;ng thực hiện cuộc gọi đi.</p>\r\n\r\n<p>Hoặc, trong một v&agrave;i trường hợp, ch&uacute;ng giả mạo l&agrave; cơ quan chức năng c&ocirc;ng an đang điều tra c&aacute;c vụ bu&ocirc;n lậu, c&aacute;c vụ việc ... y&ecirc;u cầu kh&aacute;ch h&agrave;ng chuyển tiền từ t&agrave;i khoản c&aacute; nh&acirc;n v&agrave;o t&agrave;i khoản của cơ quan điều tra x&aacute;c minh sau đ&oacute; chiếm đoạt tiền. Đ&aacute;ng n&oacute;i l&agrave;, c&aacute;c cuộc gọi thường xuất ph&aacute;t từ tổng đ&agrave;i nước ngo&agrave;i gọi về Việt Nam qua giao thức kết nối Internet (VoIP) n&ecirc;n việc x&aacute;c minh, điều tra của c&aacute;c cơ quan chức năng sẽ rất kh&oacute; khăn v&agrave; mất thời gian cũng như cần phải c&oacute; sự phối hợp đồng bộ của nhiều đơn vị, nh&agrave; mạng c&oacute; li&ecirc;n quan (kể cả c&aacute;c nh&agrave; mạng quốc tế).</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2017-07-20 09:48:12', 4, 'monitor_Lua-dao-qua-dien-thoai-co-dinh_7930761056407.jpg', 12, 1, 1),
(18, 'Apple chính thức phát hành bản cập nhật iOS 10.3.3', 'Sau nhiều lần thử nghiệm, Apple đã chính thức phát hành iOS 10.3.3 cho toàn bộ người dùng. Trước đó, phiên bản iOS 10.3.2 được công ty công nghệ Mỹ tung ra cách đây khoảng hai tháng.', '<p>Cập nhật lần n&agrave;y gi&uacute;p sửa lỗ hổng cho ph&eacute;p tin tặc khai th&aacute;c một m&atilde; tr&ecirc;n chip Wi-Fi của Broadcom được t&iacute;ch hợp trong nhiều thiết bị chạy iOS. Vấn đề n&agrave;y từng được c&ocirc;ng ty c&ocirc;ng nghệ Mỹ đề cập đến tr&ecirc;n phi&ecirc;n bản iOS 10.3.1.</p>\r\n\r\n<p>Để tiến h&agrave;nh n&acirc;ng cấp l&ecirc;n nền tảng mới nhất, người d&ugrave;ng iPhone, iPad truy cập Settings &gt; General &gt; Software Update sau đ&oacute; bấm chọn Download and Install để m&aacute;y tải về rồi c&agrave;i đặt. C&aacute;ch kh&aacute;c l&agrave; cập nhật thiết bị qua iTunes tr&ecirc;n m&aacute;y t&iacute;nh.</p>\r\n\r\n<p><img alt="" src="/shareit/files/images/monitor_1473277160ios-10-01storynqfy.jpg" style="height:430px; width:665px" /></p>\r\n\r\n<p>Những thay đổi Apple dành cho iOS 10 đang ít dần khi công ty chuẩn bị phát hành chính thức iOS mới, iOS 11, lần đầu xuất hiện tại WWDC hồi tháng 6. iOS 10.3.3 có thể là bản cập nhật cuối cùng đối với iOS 10.</p>\r\n\r\n<p>Ngoài iOS 10.3.3, Apple cũng phát hành bản cập nhật macOS 10.12.6 cho các máy tính Mac, watchOS 3.2.3 với đồng hồ Apple Watch và Apple TV có tvOS 10.2.2. Các thay đổi trên đó chủ yếu là khắc phục lỗi bảo mật, tăng tính ổn định.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2017-07-20 10:04:01', 2, 'monitor_1473277160ios-10-01storynqfy_8383950903123.jpg', 12, 1, 1),
(19, 'Bộ đôi Galaxy S8 và S8+ có thêm phiên bản màu xanh Coral Blue', 'Samsung sẽ bổ sung thêm một phiên bản màu nữa cho bộ đôi Galaxy S8 và S8+ (hay còn gọi là S8 Plus) đó là màu xanh san hô (Coral Blue) tại thị trường Mỹ.', '<p>Phi&ecirc;n bản Coral Blue của Galaxy S8 v&agrave; Galaxy S8 của Samsung kết hợp với m&agrave;u Đen Midnight Black, Bạc Arctic Silver, X&aacute;m Orchid Grey v&agrave; V&agrave;ng Maple Gold sẽ c&oacute; mặt tr&ecirc;n cửa h&agrave;ng trực tuyến Samsung.com v&agrave;o thứ S&aacute;u, ng&agrave;y 21/7 n&agrave;y.</p>\r\n\r\n<p><img alt="" src="/shareit/files/images/170572.jpg" style="height:1200px; width:1200px" /></p>\r\n\r\n<p>Samsung cũng sẽ cung cấp c&aacute;c phi&ecirc;n bản Coral Blue v&agrave; Midnight Black của Galaxy S8 v&agrave; Galaxy S8 + với mức giảm gi&aacute; 150 USD (3,5 triệu đồng) trong một khoảng thời gian giới hạn nếu bạn mua thiết bị từ cửa h&agrave;ng trực tuyến samsung.com.</p>\r\n\r\n<p>Ngo&agrave;i ra, Samsung cũng &aacute;p dụng chương tr&igrave;nh đổi điện thoại cũ lấy điện thoại mới v&agrave; nhận ch&iacute;nh s&aacute;ch giảm gi&aacute; nếu muốn mua phi&ecirc;n bản mở kh&oacute;a của Galaxy S8 hoặc Galaxy S8 + với hai phi&ecirc;n bản m&agrave;u n&oacute;i tr&ecirc;n. Người d&ugrave;ng cũng c&oacute; thể trang bị cho Galaxy S8 v&agrave; S8 + một bộ vỏ mới bằng c&aacute;ch đặt h&agrave;ng tại trang Best Buy hoặc Samsung.com.</p>\r\n', '2017-07-20 10:08:07', 20, '170572_8838002365009.jpg', 12, 1, 1),
(20, 'Đánh giá Oppo F3 Lite: tự sướng vẫn mạnh, mọi thứ ổn song thiếu sự đổi mới', 'Năm nay, nhà sản xuất điện thoại Trung Quốc Oppo tập trung nhiều hơn vào phân khúc tầm trung và cận cao cấp. Chiếc Oppo F3 Lite là phiên bản giá thấp nhất ra mắt từ đầu năm đến nay của Oppo ở Việt Nam. Mặc dù vậy, sản phẩm này vẫn được kế thừa một số yếu tố nổi trội trên các điện thoại của Oppo, điển hình là khả năng chụp tự sướng.', '<p>Chiếc Oppo F3 Lite b&aacute;n ra thị trường Việt Nam v&agrave;o giữa th&aacute;ng S&aacute;u với gi&aacute; 5,49 triệu đồng. Mặc d&ugrave; c&oacute; t&ecirc;n l&agrave; Oppo F3 Lite (c&ograve;n c&oacute; t&ecirc;n kh&aacute;c l&agrave; Oppo A57) nhưng sản phẩm n&agrave;y kh&ocirc;ng phải l&agrave; phi&ecirc;n bản r&uacute;t gọn của chiếc Oppo F3 m&agrave; n&oacute; thực chất l&agrave; phi&ecirc;n bản chip Snapdragon c&ugrave;ng một số n&acirc;ng cấp kh&aacute;c (camera, cảm biến v&acirc;n tay) của chiếc Oppo A39 hoặc cũng c&oacute; thể coi l&agrave; phi&ecirc;n cỡ nhỏ của chiếc Oppo F1s 2017. Cả về kiểu d&aacute;ng v&agrave; cấu h&igrave;nh của m&aacute;y đều c&oacute; nhiều điểm giống với chiếc Oppo A39 v&agrave; F1s 2017. Ch&iacute;nh v&igrave; vậy, trải nghiệm sản phẩm cũng kh&ocirc;ng kh&aacute;c biệt qu&aacute; nhiều so với hai mẫu điện thoại tr&ecirc;n.</p>\r\n\r\n<p>C&aacute;c điện thoại Oppo gần đ&acirc;y c&oacute; hai điểm c&oacute; rất &iacute;t sự thay đổi l&agrave; kiểu d&aacute;ng thiết kế v&agrave; phần mềm. Chiếc Oppo F3 Lite cũng vậy. Điện thoại n&agrave;y hiện c&oacute; hai lựa chọn m&agrave;u l&agrave; đen nh&aacute;m v&agrave; m&agrave;u v&agrave;ng. Thiết kế của m&aacute;y c&oacute; lẽ l&agrave; giống hệt với chiếc Oppo A39 trước đ&oacute; ch&uacute;ng t&ocirc;i đ&atilde; c&oacute; b&agrave;i đ&aacute;nh gi&aacute;. Chiếc F3 Lite (hay Oppo A57) v&agrave; A39 c&oacute; c&ugrave;ng k&iacute;ch cỡ m&agrave;n h&igrave;nh, th&ocirc;ng số k&iacute;ch thước (d&agrave;i, rộng v&agrave; độ d&agrave;y) v&agrave; trọng lượng. C&aacute;c chi tiết, đường n&eacute;t thiết kế v&agrave; chất liệu cũng tương tự. Điểm kh&aacute;c ở F3 Lite l&agrave; c&oacute; th&ecirc;m cảm biến v&acirc;n tay đặt ph&iacute;a mặt trước c&ugrave;ng với camera trước 16MP lấy từ chiếc Oppo F1s sang.</p>\r\n\r\n<p><img alt="" src="/shareit/files/images/1681132.jpg" style="height:431px; width:670px" /></p>\r\n\r\n<p>Điện thoại n&agrave;y c&oacute; th&acirc;n m&aacute;y bằng nhựa, mặt lưng c&oacute; m&agrave;u sắc đồng nhất với khung m&aacute;y v&agrave; gắn kết liền mạch n&ecirc;n tạo cảm gi&aacute;c như một sản phẩm nguy&ecirc;n khối. Ở ph&iacute;a mặt trước, viền m&agrave;n h&igrave;nh được tối ưu ở mức trung b&igrave;nh với tỷ lệ m&agrave;n h&igrave;nh/mặt trước đạt khoảng 69% v&agrave; quanh viền được bo cong 2.5D. Hai ph&iacute;m điều hướng (đa nhiệm v&agrave; back) đặt hai b&ecirc;n ph&iacute;m Home t&iacute;ch hợp cảm biến v&acirc;n tay dạng chạm, chỉ cần chạm để mở kho&aacute; chứ kh&ocirc;ng cần bấm. Tốc độ nhận diện của cảm biến v&acirc;n tay kh&aacute; nhanh, chỉ cần chạm l&agrave; m&agrave;n h&igrave;nh đ&atilde; mở kho&aacute; tức th&igrave;. Ngo&agrave;i việc mở m&agrave;n h&igrave;nh th&igrave; cảm biến v&acirc;n tay c&oacute; thể d&ugrave;ng để mở kho&aacute; bảo mật c&aacute;c ứng dụng.</p>\r\n\r\n<p><img alt="" src="/shareit/files/images/1681144.jpg" style="height:431px; width:670px" /></p>\r\n\r\n<p>Chất lượng ho&agrave;n thiện của Oppo F3 Lite c&oacute; thể n&oacute;i l&agrave; kh&aacute; tốt. Mặt lưng được sơn mịn, kh&ocirc;ng trơn tay v&agrave; &iacute;t b&aacute;m bẩn. Phần lưng nhựa ăn khớp v&agrave; gắn kết với khung m&aacute;y kh&iacute;t. Ở điện thoại n&agrave;y, nh&agrave; sản xuất cũng d&aacute;n sẵn tấm d&aacute;n kh&aacute; d&agrave;y giống như c&aacute;c m&aacute;y kh&aacute;c gần đ&acirc;y của họ. Do viền m&agrave;n h&igrave;nh cong 2.5D n&ecirc;n tấm d&aacute;n m&agrave;n kh&ocirc;ng phủ hết phần cong 2.5D, tạo ra phần gờ mỏng g&acirc;y ra cảm gi&aacute;c gai tay khi vuốt l&ecirc;n m&eacute;p m&aacute;y. Th&aacute;o tấm d&aacute;n n&agrave;y ra th&igrave; hiện tượng gai tay kh&ocirc;ng c&ograve;n nữa.</p>\r\n\r\n<p>B&ecirc;n cạnh thiết kế th&igrave; phần mềm cũng l&agrave; chi tiết c&oacute; rất &iacute;t sự thay đổi tr&ecirc;n c&aacute;c điện thoại Oppo. Đến thời điểm n&agrave;y, rất nhiều h&atilde;ng đ&atilde; cập nhật phần mềm Android 7 tr&ecirc;n c&aacute;c smartphone th&igrave; Oppo vẫn dừng lại ở bản Android 6. Cả giao diện v&agrave; c&aacute;c t&iacute;nh năng phần mềm tr&ecirc;n chiếc Oppo F3 Lite đều giống với c&aacute;c m&aacute;y Oppo ch&uacute;ng t&ocirc;i c&oacute; b&agrave;i đ&aacute;nh gi&aacute; gần đ&acirc;y như Oppo F1s 2017 hay Oppo A39. Bạn đọc quan t&acirc;m c&oacute; thể tham khảo b&agrave;i đ&aacute;nh gi&aacute; c&aacute;c sản phẩm đ&oacute; (<a href="http://vnreview.vn/danh-gia-chi-tiet-di-dong/-/view_content/content/2022566/danh-gia-oppo-a39-ban-rut-gon-nhe-cua-oppo-f1s">đ&aacute;nh gi&aacute;&nbsp;</a><a href="http://vnreview.vn/danh-gia-chi-tiet-di-dong/-/view_content/content/2022566/danh-gia-oppo-a39-ban-rut-gon-nhe-cua-oppo-f1s">Oppo A39</a>,&nbsp;<a href="http://vnreview.vn/danh-gia-chi-tiet-di-dong/-/view_content/content/2081408/danh-gia-oppo-f1s-2017-chi-la-ban-ram-4gb-va-bo-nho-64gb-cua-f1s">đ&aacute;nh gi&aacute; Oppo F1s 2017</a>) để t&igrave;m hiểu th&ecirc;m về phần mềm.</p>\r\n', '2017-07-20 10:15:20', 13, '1681123_9558144857352.jpg', 12, 1, 1),
(21, 'Bphone 2 lộ cấu hình, màn hình 5,5 inch, RAM 4GB, máy ảnh 21MP', 'Chiếc máy thế hệ tiếp theo của Bphone được cho là có màn hình 5,5 inch, camera 21MP và hai phiên bản cấu hình khác nhau.', '<p>Gần tới ng&agrave;y ra mắt, chiếc điện thoại tiếp theo của Bkav bắt đầu lộ ra th&ocirc;ng tin chi tiết. Theo một nguồn tin kh&ocirc;ng ch&iacute;nh thức, chiếc điện thoại c&oacute; thể được gọi l&agrave; Bphone 2017 sẽ c&oacute; m&agrave;n h&igrave;nh 5,5 inch độ ph&acirc;n giải Full HD 1080p, d&ugrave;ng bộ vi xử l&yacute; 8 nh&acirc;n tốc độ 2GHz. M&aacute;y sẽ c&oacute; camera ch&iacute;nh độ ph&acirc;n giải đạt 21MP quay video 4K, camera trước 5MP.</p>\r\n\r\n<p>Hiện chưa r&otilde; Bkav d&ugrave;ng bộ xử l&yacute; n&agrave;o cho Bphone, tuy nhi&ecirc;n nguồn tin tiết lộ m&aacute;y c&oacute; thể d&ugrave;ng Qualcomm Snapdragon 835. C&oacute; thể c&oacute; th&ecirc;m phi&ecirc;n bản Bphone kh&aacute;c chạy vi xử l&yacute; thấp hơn, như Snapdragon 625 chẳng hạn.</p>\r\n\r\n<p><img alt="" src="/shareit/files/images/photo-0-1500540951980.jpg" style="height:456px; width:660px" /></p>\r\n\r\n<p>Tương ứng với vi xử l&yacute; Snapdragon 835, chiếc Bphone sẽ d&ugrave;ng RAM 4GB, phi&ecirc;n bản thấp hơn sẽ d&ugrave;ng RAM 3GB.</p>\r\n\r\n<p>Theo tr&agrave;o lưu hiện nay, Bphone c&oacute; khả năng rất lớn sẽ d&ugrave;ng cổng giao tiếp USB-C thay cho cổng microUSB th&ocirc;ng thường.</p>\r\n\r\n<p>M&aacute;y c&oacute; thể sẽ d&ugrave;ng khung kim loại với hai mặt k&iacute;nh trước v&agrave; sau như đ&atilde; từng thiết kế tr&ecirc;n Bphone ra mắt năm 2015.</p>\r\n\r\n<p>Như vậy, đợt ra mắt lần n&agrave;y - dự kiến diễn ra ng&agrave;y 8/8 - Bkav c&oacute; thể tung &iacute;t nhất 2 phi&ecirc;n bản Bphone với cấu h&igrave;nh kh&aacute;c nhau. Thế Giới Di Động đ&atilde; x&aacute;c nhận sẽ b&aacute;n Bphone ở hệ thống n&agrave;y.</p>\r\n\r\n<p>Hiện Bkav chưa đưa ra bất kỳ th&ocirc;ng tin ch&iacute;nh thức n&agrave;o về ng&agrave;y b&aacute;n, cấu h&igrave;nh, t&ecirc;n gọi của chiếc Bphone thế hệ tiếp theo sẽ ra mắt đầu th&aacute;ng 8 n&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2017-07-20 10:18:21', 13, 'photo-0-1500540951980_9740020273458.jpg', 12, 1, 1),
(22, 'Đánh giá Lenovo ideapad 700: laptop giải trí kiêm game giá tốt', 'Nếu như vào năm ngoài, Lenovo đánh dấu việc lần đầu tiên tham gia vào thị trường Laptop Gaming bằng 2 chiếc Y50 và Y70 Touch thì năm nay hãng này lại nâng cấp dòng giải trí ideapad với cấu hình mạnh mẽ hơn để hướng đến đối tượng game thủ.', '<p>Thị trường laptop chuy&ecirc;n game tại Việt Nam đang ng&agrave;y một s&ocirc;i động với sự tham gia của nhiều nh&agrave; sản xuất. V&agrave;i năm trước, nếu người d&ugrave;ng muốn sở hữu một chiếc laptop mạnh mẽ, cấu h&igrave;nh cao để c&oacute; thể &quot;ph&aacute; đảo thế giới ảo&quot; th&igrave; họ chỉ c&oacute; một v&agrave;i lựa chọn &iacute;t ỏi từ Asus, Dell hay MSI. Bắt đầu từ năm ngo&aacute;i, Acer, HP v&agrave; Lenovo đều đ&aacute;nh dấu những bước đi đầu ti&ecirc;n v&agrave;o mảng laptop gaming tại Việt Nam với một loạt model từ thấp đến cao.</p>\r\n\r\n<p>Chiếc ideapad 700 l&agrave; model laptop chuy&ecirc;n game mới nhất của Lenovo vừa được ra mắt tại Việt Nam v&agrave;o cuối th&aacute;ng 02/2016. M&aacute;y kế thừa những đặc điểm của d&ograve;ng Lenovo Y Series năm ngo&aacute;i với kiểu d&aacute;ng mỏng nhẹ, gọn g&agrave;ng d&ugrave; m&agrave;n h&igrave;nh k&iacute;ch thước lớn.</p>\r\n\r\n<p><img alt="" src="/shareit/files/images/1510329.jpg" style="height:447px; width:670px" /></p>\r\n\r\n<p>Lenovo ideapad 700 thừa hưởng kiểu d&aacute;ng mỏng nhẹ, gọn g&agrave;ng từ thế hệ tiền nhiệm với c&acirc;n nặng chỉ 2.3Kg v&agrave; độ d&agrave;y tối thiểu chỉ 22.7mm d&ugrave; k&iacute;ch thước m&agrave;n h&igrave;nh l&ecirc;n tới 15.6 inch. M&aacute;y tỏ ra mỏng v&agrave; nhẹ hơn đ&aacute;ng kể so với chiếc&nbsp;<a href="http://vnreview.vn/tin-tuc-san-pham-moi/-/view_content/content/1756766/trai-nghiem-nhanh-laptop-choi-game-dell-inspiron-15-7559">Dell Inspiron 15 7559</a>&nbsp;(2.57Kg, 25.3mm) m&agrave; VnReview mới trải nghiệm gần đ&acirc;y. Nhờ ưu điểm n&agrave;y, m&aacute;y c&oacute; thể dễ d&agrave;ng mang theo b&ecirc;n m&igrave;nh, nằm gọn trong những t&uacute;i đựng laptop loại vừa m&agrave; kh&ocirc;ng qu&aacute; cồng kềnh, vướng v&iacute;u.</p>\r\n\r\n<p>Chiếc laptop n&agrave;y vẫn được phủ lớp sơn đen l&agrave;m chủ đạo nhưng thay v&igrave; sử dụng chất liệu kim loại phay xước như tr&ecirc;n d&ograve;ng Y Series m&aacute;y chuyển sang d&ugrave;ng chất liệu nhựa mịn cho cảm gi&aacute;c tiếp x&uacute;c tốt nhưng kh&aacute; b&aacute;m v&acirc;n tay v&agrave; vết mồ h&ocirc;i. 2 đường v&aacute;t ch&eacute;o hơi gồ l&ecirc;n tr&ecirc;n của những chiếc&nbsp;<a href="http://vnreview.vn/danh-gia-laptop-chi-tiet/-/view_content/content/1375450/danh-gia-laptop-choi-game-lenovo-y50">Y50</a>,&nbsp;<a href="http://vnreview.vn/danh-gia-laptop-chi-tiet/-/view_content/content/1431306/danh-gia-laptop-chuyen-game-lenovo-y70-touch">Y70 Touch</a>&nbsp;năm ngo&aacute;i cũng được loại bỏ đi khiến ideapad 700 c&oacute; phần n&agrave;o đ&oacute; hơi &quot;hiền&quot;, kh&ocirc;ng c&aacute; t&iacute;nh v&agrave; hấm hố bằng những người đ&agrave;n anh.</p>\r\n\r\n<p>Sự &quot;hiền l&agrave;nh&quot; của ideapad 700 c&ograve;n thể hiện qua những chi tiết như khe tản nhiệt, khu vực b&agrave;n ph&iacute;m, hệ thống loa kh&ocirc;ng c&ograve;n cầu kỳ v&agrave; phối m&agrave;u đen đỏ nổi bật như tr&ecirc;n thế hệ tiền nhiệm. C&oacute; lẽ, Lenovo vẫn muốn d&ograve;ng Y Series trở th&agrave;nh những chiếc laptop d&agrave;nh cho game thủ &quot;hard core&quot; c&ograve;n ideapad 700 sẽ ph&ugrave; hợp với đại đa số game thủ kể cả &quot;newbie&quot;.</p>\r\n\r\n<p><img alt="" src="/shareit/files/images/1510368.jpg" style="height:447px; width:670px" /></p>\r\n\r\n<p>Kh&ocirc;ng c&oacute; vẻ hầm hố của một laptop chơi game nhưng ideapad 700 vẫn rất chắc chắn, cứng c&aacute;p nhờ c&aacute;c chi tiết vỏ m&aacute;y, khớp nối đều được gia c&ocirc;ng cẩn thận. Kh&ocirc;ng hề c&oacute; ch&uacute;t lỏng lẻo, ọp ẹp n&agrave;o khi đ&oacute;ng mở m&agrave;n h&igrave;nh, hay khi ấn mạnh v&agrave;o lớp vỏ ph&iacute;a tr&ecirc;n. C&aacute;c khe tản nhiệt cũng được bố tr&iacute; hợp l&yacute; ở cạnh sau v&agrave; mặt dưới, gi&uacute;p m&aacute;y tho&aacute;t kh&iacute; n&oacute;ng tốt hơn nhưng kh&ocirc;ng g&acirc;y kh&oacute; chịu cho người d&ugrave;ng kể cả khi đặt m&aacute;y tr&ecirc;n đ&ugrave;i.</p>\r\n', '2017-07-20 11:41:44', 12, '1510298_14522927096017.jpg', 12, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_mod` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `id_mod`) VALUES
(6, 'admindemo', 'e10adc3949ba59abbe56e057f20f883e', 'Bão', 2),
(12, 'baobui', 'e10adc3949ba59abbe56e057f20f883e', 'Bão', 1),
(14, 'bao', 'e10adc3949ba59abbe56e057f20f883e', '123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mod_user`
--
ALTER TABLE `mod_user`
  ADD PRIMARY KEY (`id_mod`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat`
--
ALTER TABLE `cat`
  MODIFY `id_cat` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `mod_user`
--
ALTER TABLE `mod_user`
  MODIFY `id_mod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
