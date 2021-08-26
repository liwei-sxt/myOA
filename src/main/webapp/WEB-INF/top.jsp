<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>top</title>
    <link href="style/styles.css" rel="stylesheet">
    <base target="mainframe">
</head>
<body leftmargin="0" topmargin="0">
<table border="0" width="100%" id="table1" cellspacing="0" height="71" background="images/top_bg.jpg">
    <tr>
        <td>
            <img src="images/top_a.jpg"/>
        </td>
        <td><a href="${pageContext.request.contextPath}/editpw">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                href="${pageContext.request.contextPath}/user/logout" target="_top">退出系统</a></td>
    </tr>
</table>
</body>
</html>
