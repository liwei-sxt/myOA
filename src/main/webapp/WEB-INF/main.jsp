<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
    <title>办公业务资源系统(标准版)</title>
</head>
<frameset rows="71,*" frameborder="no" framespacing="0" border="0"
                         frameborder="no">
    <frame name="header" noresize scrolling="no" src="${pageContext.request.contextPath}/top"
           marginwidth="0" marginheight="0">
    <frameset border="0" framespacing="0" frameborder="no" cols="180,*">
        <frame src="${pageContext.request.contextPath}/left" name="leftframe" scrolling="auto"
               noresize="noresize">
        <frame src="${pageContext.request.contextPath}/mainfrm" name="mainframe" scrolling="yes"
               noresize="noresize">
    </frameset>
</frameset>
</html>
