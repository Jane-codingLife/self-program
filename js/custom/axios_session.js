// 設定 Axios 全域預設值
axios.defaults.withCredentials = true; // 預設所有請求都攜帶 Session Cookie

// 註冊「回應（Response）攔截器」
axios.interceptors.response.use(
    function (response) {
        // 如果 API 回傳正常（HTTP 2xx），直接放行
        return response;
    },
    function (error) {
        // 如果後端拋出特定的錯誤狀態碼，例如 401 Unauthorized
        if (error.response && error.response.status === 401) {
            alert('您的登入憑證已失效，請重新登入！');
            window.location.href = 'login.php';
        }
        return Promise.reject(error);
    }
);