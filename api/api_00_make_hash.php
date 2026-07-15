<?php
// 1. 允許跨域 (CORS) 相關標頭設定
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT, OPTIONS, HEAD");
header("Access-Control-Allow-Headers: Accept, X-BT-AUTH, Content-Type, X-Requested-With, JSNLog-RequestId, Access-Control-Allow-Origin");
header("Content-Type: application/json; charset=utf-8");

// 主動處理瀏覽器的 OPTIONS 預檢請求 (Preflight Request)
// if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
//     // 預檢請求只需要標頭，不需要執行後續的雜湊運算，直接給予 200 OK 並結束
//     http_response_code(200);
//     exit;
// }

// 2. 限制非 OPTIONS 請求必須使用 POST 
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); // 回傳 405 狀態碼
    echo json_encode([
        'success' => false,
        'message' => '錯誤：此 API 僅接受 POST 請求。'
    ]);
    exit;
}

// 3. 建立回傳格式
$response = [
    'success' => false,
    'message' => '',
    'hash' => ''
];

// 4. 接收 JSON 參數
$inputData = json_decode(file_get_contents('php://input'), true);

// 5. 轉換作業
if (isset($inputData['pwd'])) {
    $password_plain = trim($inputData['pwd']);
    
    // 使用安全演算法產生雜湊值
    $response['hash'] = password_hash($password_plain, PASSWORD_DEFAULT);
    $response['success'] = true;
    $response['message'] = '製作成功。';
} else {
    http_response_code(400); // 參數缺失，回傳 400 Bad Request
    $response['message'] = '製作失敗。請確認是否傳入正確參數值。';
}

// 6. 顯示 JSON 結束。
echo json_encode($response);
exit;