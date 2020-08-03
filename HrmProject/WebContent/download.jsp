<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <jsp:include page="header.jsp"/>
</head>
<body>
<div class="easyui-panel" title="文件下载"
     style="width: 700px;height: 500px;">
    <div style="padding: 40px 60px 20px 60px">
        <c:forEach items="${list}" var="li">
            <form action="download" method="post">
                <input type="hidden" name="filename" value="${li}">
                    ${li}
                <input type="submit" value="下载">
            </form>
        </c:forEach>
    </div>
</div>
</body>
</html>