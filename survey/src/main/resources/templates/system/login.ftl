<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/styles.css">
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>Welcome</h1>

            <form class="form" id="loginForm" action="${request.contextPath}/user/login" method="post">
                <input type="text" name="account">
                <input type="password" name="password">
                <button type="submit" id="login-button">登录</button>
            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>

<script src="${request.contextPath}/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
    /*$('#login-button').click(function (event) {
        event.preventDefault();
        $('#loginForm').fadeOut(500);
        $('.wrapper').addClass('form-success');
    });*/
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
    <h1>答题管理系统</h1>
</div>
</body>
</html>