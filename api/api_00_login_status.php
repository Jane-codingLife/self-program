<?php
session_start();
// 【安全守門】若沒登入，直接不處理請求，並丟回 401 狀態碼
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    http_response_code(401); // 401 Unauthorized
    echo json_encode(['success' => false, 'message' => '未經授權。']);
    exit;
}

// 驗證通過，執行資料庫儲存邏輯...