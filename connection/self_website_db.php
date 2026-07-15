<?php
// db.php - 資料庫連線設定
$host = '127.0.0.1';
$db   = 'self_website';
$user = 'root';
$pass = ''; 
$charset = 'utf8';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // 啟用異常模式
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // 預設以關聯陣列回傳資料
    PDO::ATTR_EMULATE_PREPARES   => false,                  // 禁用模擬預備陳述式，提升安全性
];

try {
     $pdo = new PDO($dsn, $user, $pass, $options);
     // 連線成功，後續可在其他頁面 require 此檔案進行查詢
     echo "連線成功！";
} catch (\PDOException $e) {
     throw new \PDOException($e->getMessage(), (int)$e->getCode());
}