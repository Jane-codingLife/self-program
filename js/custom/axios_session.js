// 設定 Axios 全域預設值
axios.defaults.withCredentials = true; // 預設所有請求都攜帶 Session Cookie

const SharedVueMethods = {
    // 替代 Session 檢查
    checkLoginStatus() {
        const vm = this;
        axios.get('http://localhost/self-program/api/api_01_login_status.php')
            .then(function (response) {
                if (response.data.admin_logged_in) {
                    // 如果已經登入且當前在登入頁，才需要跳轉
                    if (window.location.pathname.includes('login.html')) {
                        setTimeout(() => {
                            window.location.href = './ma01-welcome.html';
                        }, 500);
                    }
                } else {
                    // 如果沒登入且在後台管理頁面，強制彈回登入頁
                    if (!window.location.pathname.includes('login.html')) {
                        window.location.href = './login.html';
                    }
                    console.log(response.data.message);
                }
            })
            .catch(function (error) {
                SharedVueMethods.showErrorAlert(error);
            });
    },

    // 系統發生錯誤的通用提示框
    showErrorAlert(error) {
        let errorMsg = "發生未知錯誤，請聯繫系統管理員。";

        // 1. 如果是 Axios 抓到的 HTTP 錯誤 (例如 500, 404, 403)
        if (error.response) {
            // 如果後端 PHP 有回傳我們自訂的 JSON message，就優先顯示它！
            if (error.response.data && error.response.data.message) {
                errorMsg = error.response.data.message;
            } else {
                errorMsg = `伺服器回應異常 (HTTP ${error.response.status})`;
            }
        } 
        // 2. 如果是網路斷線或請求未成功發出
        else if (error.request) {
            errorMsg = "無法連線至伺服器，請檢查網路狀態或 API 網址！";
        } 
        // 3. 如果傳進來的是純字串 (例如手動傳進來的 Error 字串)
        else if (typeof error === 'string') {
            errorMsg = error;
        } 
        // 4. 其他一般 JavaScript Error 物件
        else if (error.message) {
            errorMsg = error.message;
        }

        // ✦ 使用 SweetAlert2 呈現高品質彈窗
        Swal.fire({
            title: "系統發生錯誤！",
            html: `<div style="text-align: left; background: #f8f9fa; padding: 10px; border-radius: 6px; font-size: 0.9em; color: #d9534f; word-break: break-all;">
                    ${errorMsg}
                   </div>
                   <p style="font-size: 0.85em; color: #6c757d; margin-top: 10px;">請將上述資訊截圖回報給系統管理員。</p>`,
            icon: "error",
            allowOutsideClick: false,
            confirmButtonText: "確認",
            confirmButtonColor: "#1E4D4A" // 套用您的主色（深湖水綠）
        });
    },
}