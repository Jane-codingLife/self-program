-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2026-07-14 16:02:02
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `self_website`
--
CREATE DATABASE IF NOT EXISTS `self_website` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `self_website`;

-- --------------------------------------------------------

--
-- 資料表結構 `about_timeline`
--

CREATE TABLE `about_timeline` (
  `id` int(11) NOT NULL,
  `index_id` int(11) NOT NULL,
  `time_start` varchar(10) NOT NULL,
  `time_end` varchar(10) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `en_title` varchar(20) DEFAULT NULL,
  `subtitle` varchar(20) DEFAULT NULL,
  `en_subtitle` varchar(20) DEFAULT NULL,
  `location` varchar(20) NOT NULL,
  `txt` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT '預設0 無排序',
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='時間軸-生命歷程表';

--
-- 傾印資料表的資料 `about_timeline`
--

INSERT INTO `about_timeline` (`id`, `index_id`, `time_start`, `time_end`, `title`, `en_title`, `subtitle`, `en_subtitle`, `location`, `txt`, `sort_order`, `create_date`, `update_date`) VALUES
(1, 1, '2026.02.02', '2026.08.03', '智慧生成全端程式與跨平台APP整合實務班', NULL, '勞動部勞動力發展署 中彰投分署　職前訓專', NULL, '勞動部勞動力發展署中彰投分署', '深耕全端技術架構（PHP, MySQL, Python），並將資料結構邏輯與跨平台應用程式整合（Vue 3, Bootstrap 5, Flutter），以此建構 Jane & Sami 品牌全端系統基礎。', 1, '2026-07-14', '2026-07-14'),
(2, 1, '2025.03', '', '機械製圖與創意列印班', NULL, '上益資訊　職前訓專班', NULL, '上益資訊', '平面與立體的圖形建構，再利用 3D 技術具現，由此搭建了達摩蹺蹺板的遊樂區之一。', 3, '2026-07-14', '2026-07-14'),
(3, 1, '2026.06.26', NULL, '中華民國技術士證', 'Technician Certifica', '網頁設計　丙級', 'Web Design　class C', '勞動部', 'Dreamweaver 前端網頁架設技能，包含影像、動圖簡易處理。', 2, '2026-07-14', '2026-07-14');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `aid` varchar(5) NOT NULL COMMENT '員編 1英文+ 4數字 A0001',
  `user_name` varchar(20) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `on_date` date NOT NULL COMMENT '啟用日',
  `is_used` int(11) NOT NULL DEFAULT 1 COMMENT '是否使用中',
  `user_desc` varchar(100) DEFAULT NULL COMMENT '簡述',
  `create_date` date NOT NULL,
  `update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `admin_users`
--

INSERT INTO `admin_users` (`id`, `aid`, `user_name`, `passwd`, `on_date`, `is_used`, `user_desc`, `create_date`, `update_date`) VALUES
(1, 'A0001', '米米', '0000', '2026-07-14', 1, '系統管理員', '2026-07-14', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `class_resource_library`
--

CREATE TABLE `class_resource_library` (
  `id` int(11) NOT NULL,
  `class_name` varchar(20) NOT NULL,
  `class_desc` varchar(20) NOT NULL,
  `CSS_path` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `class_resource_library`
--

INSERT INTO `class_resource_library` (`id`, `class_name`, `class_desc`, `CSS_path`) VALUES
(1, 'tag-skill', '首頁-關於我的技能標籤CSS', NULL),
(2, 'tag_life_technical', '生命卡-主題標籤 Hashtag', NULL),
(3, 'badge_learning', '生命卡-分類標籤：學習類', NULL),
(4, 'badge_certification', '生命卡-分類標籤：認證類', NULL),
(5, 'badge_code', '生命卡-分類標籤：專案類', NULL),
(6, 'badge_knitting', '生命卡-分類標籤：針織類', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `digital_data`
--

CREATE TABLE `digital_data` (
  `id` int(11) NOT NULL,
  `index_id` int(11) NOT NULL,
  `data_icon` varchar(20) DEFAULT NULL,
  `data_label` varchar(20) NOT NULL,
  `data_value` varchar(10) NOT NULL,
  `data_unit` varchar(10) NOT NULL,
  `sort_order` int(11) DEFAULT 0 COMMENT '預設0 無排序',
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='數據統計表';

--
-- 傾印資料表的資料 `digital_data`
--

INSERT INTO `digital_data` (`id`, `index_id`, `data_icon`, `data_label`, `data_value`, `data_unit`, `sort_order`, `create_date`, `update_date`) VALUES
(1, 1, 'fa-solid fa-briefcas', '工作經驗', '2-3', '年', 1, '2026-07-14', '2026-07-14'),
(2, 1, 'fa-brands fa-audible', '精選作品', '10+', '組', 2, '2026-07-14', '2026-07-14'),
(3, 1, 'fa-regular fa-id-car', '專業證照', '10', '份', 3, '2026-07-14', '2026-07-14'),
(4, 1, 'fa-solid fa-book-ope', '修讀時數', '600+', 'hr', 4, '2026-07-14', '2026-07-14');

-- --------------------------------------------------------

--
-- 資料表結構 `image_resource_library`
--

CREATE TABLE `image_resource_library` (
  `id` int(11) NOT NULL,
  `img_path` varchar(20) NOT NULL,
  `target_table` varchar(20) NOT NULL,
  `target_id` int(11) NOT NULL,
  `img_type` varchar(20) NOT NULL,
  `img_alt_text` varchar(20) NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='全萬能通用圖庫資源表';

--
-- 傾印資料表的資料 `image_resource_library`
--

INSERT INTO `image_resource_library` (`id`, `img_path`, `target_table`, `target_id`, `img_type`, `img_alt_text`, `create_date`, `update_date`) VALUES
(1, 'img/SamiLogo.jpg', 'index_main', 1, 'LOGO', 'Jane & Sami', '2026-07-14', '2026-07-14');

-- --------------------------------------------------------

--
-- 資料表結構 `index_main`
--

CREATE TABLE `index_main` (
  `id` int(11) NOT NULL,
  `logo_txt` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `en_title` varchar(20) DEFAULT NULL,
  `subtitle` varchar(20) DEFAULT NULL,
  `en_subtitle` varchar(20) DEFAULT NULL,
  `contact_info` varchar(20) DEFAULT NULL,
  `contact_local` varchar(20) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_mobile` varchar(20) DEFAULT NULL,
  `contact_email` varchar(20) DEFAULT NULL,
  `contact_lineID` varchar(20) DEFAULT NULL,
  `contact_weChat` varchar(20) DEFAULT NULL,
  `contact_else_1` varchar(20) DEFAULT NULL,
  `contact_else_2` varchar(20) DEFAULT NULL,
  `contact_else_3` varchar(20) DEFAULT NULL,
  `contact_time` varchar(20) DEFAULT NULL,
  `contact_infoTxt` text DEFAULT NULL,
  `footer_txt` text NOT NULL,
  `footer_link_1` varchar(20) DEFAULT NULL,
  `footer_link_1_icon` varchar(20) DEFAULT NULL,
  `footer_link_2` varchar(20) DEFAULT NULL,
  `footer_link_2_icon` varchar(20) DEFAULT NULL,
  `footer_link_3` varchar(20) DEFAULT NULL,
  `footer_link_3_icon` varchar(20) DEFAULT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `index_main`
--

INSERT INTO `index_main` (`id`, `logo_txt`, `title`, `en_title`, `subtitle`, `en_subtitle`, `contact_info`, `contact_local`, `contact_phone`, `contact_mobile`, `contact_email`, `contact_lineID`, `contact_weChat`, `contact_else_1`, `contact_else_2`, `contact_else_3`, `contact_time`, `contact_infoTxt`, `footer_txt`, `footer_link_1`, `footer_link_1_icon`, `footer_link_2`, `footer_link_2_icon`, `footer_link_3`, `footer_link_3_icon`, `create_date`, `update_date`) VALUES
(1, 'Jane & Sami', 'Jane & Sami', NULL, NULL, NULL, '聯絡資訊', '台中市豐原區', NULL, '0956566576', 'aehow4432@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '&copy; 2026 Jane & Sami. All Rights Reserved. Designed with Soul & Code.', '', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14', '2026-07-14');

-- --------------------------------------------------------

--
-- 資料表結構 `page_section_config`
--

CREATE TABLE `page_section_config` (
  `id` int(11) NOT NULL COMMENT '自動編號',
  `index_id` int(11) NOT NULL COMMENT '主表的自動編號 id',
  `section_html_id` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `en_title` varchar(20) DEFAULT NULL,
  `subtitle` varchar(20) DEFAULT NULL,
  `en_subtitle` varchar(20) DEFAULT NULL,
  `title_icon` varchar(20) DEFAULT NULL,
  `subtitle_icon` varchar(20) DEFAULT NULL,
  `section_txt` text DEFAULT NULL,
  `page_link` varchar(20) DEFAULT NULL,
  `sort_order` int(11) NOT NULL COMMENT '排序',
  `is_visible` int(11) NOT NULL DEFAULT 1 COMMENT '是否使用中：1-is, 0-not',
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='網頁區塊配置表';

--
-- 傾印資料表的資料 `page_section_config`
--

INSERT INTO `page_section_config` (`id`, `index_id`, `section_html_id`, `title`, `en_title`, `subtitle`, `en_subtitle`, `title_icon`, `subtitle_icon`, `section_txt`, `page_link`, `sort_order`, `is_visible`, `create_date`, `update_date`) VALUES
(1, 1, 'section_about', '關於我', 'About Me', '全端開發者 & 人文探索', NULL, 'fa-solid fa-map-sign', 'fa-solid fa-cloud-su', '我專注於 PHP 與 MySQL的後端邏輯構建，同時沉浸於針織手工藝的密網編織與塔羅星盤的理性演繹。對我而言，程式架構的嚴謹、手工藝的細緻觸感，以及命理系統的變易規律，本質皆是同一種對「秩序」與「規律」的深度解構。\\n我擅長將這些看似迥異的技能融會貫通於生活，運用工程師的邏輯思維去優化心靈諮詢的決策過程，並以手作的溫度細膩落實數位產品的介面交互。我相信程式碼不僅是運算指令，更是建構真實生活的橋樑，我熱衷於在數據與靈魂的交會處，發掘解決問題的無限可能，為每一位使用者打造既精準又具備人性溫度的數位體驗。', NULL, 1, 1, '2026-07-14', '2026-07-14'),
(2, 1, 'section_counter', '核心數據', 'Metrics', NULL, NULL, NULL, NULL, '實體經歷與專業累積的量化展現', NULL, 2, 1, '2026-07-14', '2026-07-14'),
(3, 1, 'section_portfolio', '精選作品', 'Portfolio', NULL, NULL, 'fa-solid fa-route ms', NULL, NULL, NULL, 3, 1, '2026-07-14', '2026-07-14'),
(4, 1, 'section_contact', '與我聯絡', 'Contact', NULL, NULL, 'fa-solid fa-seedling', NULL, NULL, NULL, 4, 1, '2026-07-14', '2026-07-14');

-- --------------------------------------------------------

--
-- 資料表結構 `table_descript`
--

CREATE TABLE `table_descript` (
  `id` int(11) NOT NULL,
  `table_name` varchar(40) NOT NULL,
  `table_ch_name` varchar(40) NOT NULL,
  `table_desc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `table_descript`
--

INSERT INTO `table_descript` (`id`, `table_name`, `table_ch_name`, `table_desc`) VALUES
(1, 'index_main', '首頁主表', '僅存放全站唯一的全域設定，如 LOGO 名字與頁尾版權。'),
(2, 'page_section_config', '網頁區塊配置表', '管理網頁上所有大區塊(Section)的大標題、小標題、Icon 與前後上下排序。'),
(3, 'digital_data', '數據統計表', '首頁主表上呈現的四格數據圖。'),
(4, 'about_timeline', '時間軸-生命歷程表', ''),
(5, 'works_gallery', '作品集大綱表', ''),
(6, 'work_description_node', '作品內文段落表', '對應到大綱集的詳細目錄與分段內文。'),
(7, 'image_resource_library', '全萬能通用圖庫資源表', ''),
(8, 'tag_resource_library', '全通用標籤資源表', ''),
(9, 'tag_resource_library_uesed', '全通用標籤資源表-指定使用', '針對需要 tag 的位置在分別去資源表中取用的關聯。PK：used_table + used_table_id + used_tag_id。'),
(10, 'user_member', '使用者建檔', '使用者資訊'),
(11, 'class_resource_library', '全通 class 標籤資源表', ''),
(12, 'target_resource_library', '全通目標對象資源表', ''),
(13, 'admin_users', '使用者管理庫', '');

-- --------------------------------------------------------

--
-- 資料表結構 `tag_resource_library`
--

CREATE TABLE `tag_resource_library` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(20) NOT NULL,
  `tag_name2` varchar(20) DEFAULT NULL,
  `tag_type` int(11) NOT NULL COMMENT '參照 target_resource_library - id',
  `is_used` int(11) NOT NULL DEFAULT 1 COMMENT '是否使用中'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='全通用標籤資源表';

--
-- 傾印資料表的資料 `tag_resource_library`
--

INSERT INTO `tag_resource_library` (`id`, `tag_name`, `tag_name2`, `tag_type`, `is_used`) VALUES
(1, 'Full-Stack Dev', '全端工程師', 1, 0),
(2, 'UI/UX Design', '', 1, 0),
(3, 'Knitting Handicrafts', '編織手工藝品', 1, 0),
(4, 'Herbalism', '草藥學', 1, 0),
(5, 'Tarot Chart Life Sci', '塔羅牌圖生命科學', 1, 0),
(6, '#前後端', NULL, 2, 1),
(7, '#HTML', NULL, 2, 1),
(8, '#CSS', NULL, 2, 1),
(9, '#JavaScript', NULL, 2, 1),
(10, '#Vue', NULL, 2, 1),
(11, '#PHP', NULL, 2, 1),
(12, '#MySQL', NULL, 2, 1),
(13, '#XAMPP', NULL, 2, 1),
(14, '#Flutter', NULL, 2, 1),
(15, '#3D列印', NULL, 2, 1),
(16, '#AutoCAD', NULL, 2, 1),
(17, '#Solidworks', NULL, 2, 1),
(18, '#UltiMakerCura', NULL, 2, 1),
(19, '專業培訓', NULL, 3, 1),
(20, '程式開發', NULL, 4, 1),
(21, '手作工藝', NULL, 4, 1),
(22, '玄學工作坊', NULL, 4, 1),
(23, '魔法藥草學', NULL, 4, 1),
(24, '證照執照', NULL, 3, 1),
(25, '工作資歷', NULL, 3, 1),
(26, '學歷學程', NULL, 3, 1),
(27, '全端工程師(前/後端)', NULL, 1, 1),
(28, 'UI/UX 介面設計', NULL, 1, 1),
(29, '日常生活文藝', NULL, 1, 1),
(30, '資料庫編撰(MySQL/SQLServe', NULL, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tag_resource_library_uesed`
--

CREATE TABLE `tag_resource_library_uesed` (
  `used_table` int(11) NOT NULL COMMENT '參照 table_descript - id',
  `used_table_id` int(11) NOT NULL,
  `used_tag_id` int(11) NOT NULL COMMENT '參照tag_resource_library - id',
  `used_target` int(11) NOT NULL COMMENT '參照 class_resource_library - id',
  `badge_class` int(11) DEFAULT NULL COMMENT '參照 target_resource_library - id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='全通用標籤資源表-指定使用 / 針對需要 tag 的位置在分別去資源表中取用的關聯。PK：used_table + us';

--
-- 傾印資料表的資料 `tag_resource_library_uesed`
--

INSERT INTO `tag_resource_library_uesed` (`used_table`, `used_table_id`, `used_tag_id`, `used_target`, `badge_class`) VALUES
(1, 1, 1, 1, 1),
(1, 1, 2, 1, 1),
(1, 1, 3, 1, 1),
(1, 1, 4, 1, 1),
(1, 1, 5, 1, 1),
(4, 1, 6, 2, 2),
(4, 1, 7, 2, 2),
(4, 1, 8, 2, 2),
(4, 1, 9, 2, 2),
(4, 1, 10, 2, 2),
(4, 1, 11, 2, 2),
(4, 1, 12, 2, 2),
(4, 1, 13, 2, 2),
(4, 1, 14, 2, 2),
(4, 1, 19, 3, 3),
(4, 2, 19, 3, 3),
(4, 3, 24, 3, 4),
(5, 1, 20, 4, 5),
(5, 2, 21, 4, 6);

-- --------------------------------------------------------

--
-- 資料表結構 `target_resource_library`
--

CREATE TABLE `target_resource_library` (
  `id` int(11) NOT NULL,
  `target_name` varchar(20) NOT NULL,
  `target_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `target_resource_library`
--

INSERT INTO `target_resource_library` (`id`, `target_name`, `target_desc`) VALUES
(1, 'about', '關於我'),
(2, 'life-card', '生命卡'),
(3, 'life-card-category', '生命卡類別'),
(4, 'works-category', '作品類別');

-- --------------------------------------------------------

--
-- 資料表結構 `works_gallery`
--

CREATE TABLE `works_gallery` (
  `id` int(11) NOT NULL,
  `breadcrumb_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `en_title` varchar(20) DEFAULT NULL,
  `subtitle` varchar(20) DEFAULT NULL,
  `en_subtitle` varchar(20) DEFAULT NULL,
  `outline_desc` text NOT NULL,
  `post_time` varchar(20) NOT NULL,
  `is_top3` int(11) NOT NULL DEFAULT 0 COMMENT '1-是, 0-否',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT '預設0 無排序',
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='作品集大綱表';

--
-- 傾印資料表的資料 `works_gallery`
--

INSERT INTO `works_gallery` (`id`, `breadcrumb_name`, `title`, `en_title`, `subtitle`, `en_subtitle`, `outline_desc`, `post_time`, `is_top3`, `sort_order`, `create_date`, `update_date`) VALUES
(1, 'Jane & Sami Website', 'Jane & Sami 個人品牌網建置', NULL, NULL, NULL, '綜合個人履歷展現、連結各分支作品瀏覽，讓每個作品都有獨屬自己的專頁介紹。', '2026.07.01 9:03:10', 1, 1, '2026-07-14', '2026-07-14'),
(2, '貓咪編織', '貓咪編織 @雀之翎毛線編織', NULL, NULL, NULL, '貓咪編織。', '2026.04.05 12:13:23', 1, 2, '2026-07-14', '2026-07-14');

-- --------------------------------------------------------

--
-- 資料表結構 `work_description_node`
--

CREATE TABLE `work_description_node` (
  `id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `node_order` int(11) NOT NULL COMMENT '文章序列',
  `node_title` varchar(20) NOT NULL,
  `node_title_icon` varchar(20) DEFAULT NULL,
  `node_html_content` text NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `work_description_node`
--

INSERT INTO `work_description_node` (`id`, `work_id`, `node_order`, `node_title`, `node_title_icon`, `node_html_content`, `create_date`, `update_date`) VALUES
(1, 1, 1, '課程大綱', NULL, '這是在不改變您原本大架構下，透過 Bootstrap 格線重新洗牌後的精確呈現。右側內容區會隨著使用者的滾動，優雅地與左側浮動目錄保持平行對齊。', '2026-07-14', '2026-07-14'),
(2, 1, 2, '課程內容', NULL, '這是在不改變您原本大架構下，透過 Bootstrap 格線重新洗牌後的精確呈現。右側內容區會隨著使用者的滾動，優雅地與左側浮動目錄保持平行對齊。\\n\\n當進入手機版時，左側的目錄區塊會全自動退化成一個小巧清爽的漢堡按鈕列。點擊該按鈕後，目錄選單會以流暢的下拉折疊動效現身，絕不干擾主要的閱讀視線。', '2026-07-14', '2026-07-14'),
(3, 1, 3, '課程作品', NULL, '本設計完美相容於您既有的「暮光森林與湖水綠」全域環境變數系統，卡片底座與高光文字比例皆符合最高規格的前端視覺美學。', '2026-07-14', '2026-07-14');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `about_timeline`
--
ALTER TABLE `about_timeline`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `員編` (`aid`);

--
-- 資料表索引 `class_resource_library`
--
ALTER TABLE `class_resource_library`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `digital_data`
--
ALTER TABLE `digital_data`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `image_resource_library`
--
ALTER TABLE `image_resource_library`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `index_main`
--
ALTER TABLE `index_main`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `page_section_config`
--
ALTER TABLE `page_section_config`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `table_descript`
--
ALTER TABLE `table_descript`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tag_resource_library`
--
ALTER TABLE `tag_resource_library`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tag_resource_library_uesed`
--
ALTER TABLE `tag_resource_library_uesed`
  ADD PRIMARY KEY (`used_table`,`used_table_id`,`used_tag_id`);

--
-- 資料表索引 `target_resource_library`
--
ALTER TABLE `target_resource_library`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `works_gallery`
--
ALTER TABLE `works_gallery`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `work_description_node`
--
ALTER TABLE `work_description_node`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `about_timeline`
--
ALTER TABLE `about_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `class_resource_library`
--
ALTER TABLE `class_resource_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `digital_data`
--
ALTER TABLE `digital_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `image_resource_library`
--
ALTER TABLE `image_resource_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `index_main`
--
ALTER TABLE `index_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `page_section_config`
--
ALTER TABLE `page_section_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `table_descript`
--
ALTER TABLE `table_descript`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tag_resource_library`
--
ALTER TABLE `tag_resource_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `target_resource_library`
--
ALTER TABLE `target_resource_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `works_gallery`
--
ALTER TABLE `works_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `work_description_node`
--
ALTER TABLE `work_description_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
