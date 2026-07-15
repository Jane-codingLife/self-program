<?php
// make_hash.php

// 1. 定義您想設定的明文密碼
$password_plain = 'admin123'; 

// 2. 使用安全演算法產生雜湊值 (目前預設為 BCRYPT 演算法)
$password_hash = password_hash($password_plain, PASSWORD_DEFAULT);

// 3. 輸出至網頁畫面上
echo "<h3>您的明文密碼為: " . htmlspecialchars($password_plain) . "</h3>";
echo "<h3>產生的安全雜湊值 (請複製下方整串字串):</h3>";
echo "<code style='display:block; padding:10px; background:#f4f4f4; border:1px solid #ddd; word-break:break-all;'>" . $password_hash . "</code>";
