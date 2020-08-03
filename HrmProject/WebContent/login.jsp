<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>人事管理系统</title>
    <link rel="stylesheet" href="logincss/css/supersized.css">
    <link rel="stylesheet" href="logincss/css/login.css">
    <script type="text/javascript" src="logincss/js/jquery-1.8.2.min.js"></script>
    <script src="logincss/js/supersized.3.2.7.min.js"></script>
    <script src="logincss/js/supersized-init.js"></script>
</head>
<body>
<div id="div_login">
    <p>人事管理系统</p>
    <div id="div_form">
        <img src="logincss/img/logo2.jpg">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <table>
                <tr>
                    <td class="td1"> <img src="logincss/img/memeber.gif" alt="" style="width: 16px;text-align: right"> </td>
                    <td><input type="text" name="number"></td>
                </tr>
                <tr>
                    <td class="td1"><img src="logincss/img/lock.gif" style="width: 16px;text-align: right"></td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr style="background-color: inherit">
                    <td colspan="2">
                        <div>
                            <input id="input_submit" type="submit" value="登录">
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
        var loginInfo = "${loginInfo}";
        if(null != loginInfo  && loginInfo != "")
            alert(loginInfo)
    });
</script>
</html>