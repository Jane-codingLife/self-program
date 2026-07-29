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
        Swal.fire({
            title: "系統發生錯誤！請將下列資訊貼給系統管理員。",
            text: error,
            icon: "error",
            allowOutsideClick: false,
            confirmButtonText: "確認",
        });
    },
}