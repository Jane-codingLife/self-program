<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=utf-8");

session_start();

$response = [
    'admin_logged_in' => false,
    'message' => '未經授權。'
];

// 檢查 Session
if (isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in'] === true) {
    $response['admin_logged_in'] = true;
    $response['message'] = '已授權。';
}

// 狀態檢查端點一律以 200 OK 回傳，並由 JSON 的 admin_logged_in 欄位決定真偽
http_response_code(200);
echo json_encode($response);
exit;