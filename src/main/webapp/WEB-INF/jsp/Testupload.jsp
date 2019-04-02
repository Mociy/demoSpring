<%--
  Created by IntelliJ IDEA.
  User: liao
  Date: 2019/3/18
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>upload</title>
</head>
<body>
<form method="post" action="/upload" enctype="multipart/form-data">
    <input type="file" name="file" value="请选择">
    <input type="text" name="token">
    <input type="submit" value="提交">

</form>
</body>
</html>
