<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2019/12/13
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>这是主页面</h1>
${user.userPhone}
<a href="${pageContext.request.contextPath}/addUlAlipay">充值</a>
</body>
</html>
