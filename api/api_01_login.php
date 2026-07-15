<?php
// header("Access-Control-Allow-Origin: http://localhost, *");
// 動態獲取前端請求來源，確保相容 Cookie 的跨域傳輸
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: " . $_SERVER['HTTP_ORIGIN']);
}
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,POST,DELETE,PUT,OPTIONS,HEAD");
header("Access-Control-Allow-Headers: Accept,X-BT-AUTH,Content-Type,X-Requested-With,JSNLog-RequestId,Access-Control-Allow-Origin");
header("Content-Type: application/json; charset=utf-8");

session_start();
// 引入資料庫連線檔案
// require_once => require/強制若連接失敗直接停止程式，once/若曾經連結過則不再連結
require_once '../connection/self_website_db.php';

$response = [
    'success' => false,
    'message' => ''
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // 接收前端 Fetch 送過來的 JSON 資料
    $inputData = json_decode(file_get_contents('php://input'), true);
    
    $aid = isset($inputData['aid']) ? trim($inputData['aid']) : '';
    $passwd = isset($inputData['passwd']) ? trim($inputData['passwd']) : '';

    if (!empty($aid) && !empty($passwd)) {
        try {
            // 使用預備陳述式防範 SQL 注入
            $stmt = $pdo->prepare("SELECT `id`, `aid`, `user_name`, `passwd_hash`, `on_date`, `user_desc`, `create_date`, `update_date` FROM `admin_users` WHERE is_used = 1 AND aid = :aid LIMIT 1");
            $stmt->execute([':aid' => $aid]);
            $user = $stmt->fetch();

            if ($user && password_verify($passwd, $user['passwd_hash'])) {
                // 登入成功，寫入 Session
                session_regenerate_id(true);
                $_SESSION['admin_logged_in'] = true;
                $_SESSION['admin_id'] = $user['id'];
                $_SESSION['admin_aid'] = $user['aid'];
                $_SESSION['admin_username'] = $user['user_name'];

                $response['success'] = true;
                $response['message'] = '登入成功！正在導向管理中心...點選確認進入。';
            } else {
                $response['message'] = '管理員員編或密碼錯誤。';
            }
        } catch (PDOException $e) {
            $response['message'] = '伺服器資料庫發生異常。';
        }
    } else {
        $response['message'] = '欄位不可為空。';
    }
} else {
    $response['message'] = '不支援此請求方法。';
}

// 輸出 JSON 結果並結束執行
echo json_encode($response);
exit;