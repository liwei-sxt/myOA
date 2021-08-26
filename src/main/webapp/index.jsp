<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body background="${pageContext.request.contextPath}/images/bg.gif" leftmargin="0" topmargin="0">

<div style="width: 1000px; margin: 0px auto;">
    <div style="height: 161px;">
        <img src="${pageContext.request.contextPath}/images/sy_1.jpg" width="1000px" height="161px">
    </div>
    <form name="form1"
          action="${pageContext.request.contextPath}/user/login" method="post">
        <div style="height: 227px;">
            <!-- 表单左边的图片 -->
            <div id="form_left"
                 style="height: 227px; float: left; width: 326px;">
                <img src="${pageContext.request.contextPath}/images/sy_2.jpg" width="326" height="227">
            </div>
            <!-- 表单区域 -->
            <div id="form_area"
                 style="height: 227px; float: left; width: 389px;">
                <div style="height: 181px;">
                    <div style="width: 389px;">
                        <div style="width: 177px; float: left; height: 181px;">
                            <img src="${pageContext.request.contextPath}/images/sy_3_1_1.jpg" width="177" height="181">
                        </div>
                        <div style="width: 127px; float: left; height: 181px;">
                            <div style="width: 127px; height: 59px;">
                                <img src="${pageContext.request.contextPath}/images/sy_3_1_2.jpg" width="127" height="59">
                            </div>
                            <div
                                    style="background-image: url(${pageContext.request.contextPath}/images/sy_3_1_3.jpg); height: 26px;">
                                <INPUT name="username" type="text" class=inuptCN id="Text1"
                                       size="12" maxlength="20" value="zhangsan">
                            </div>
                            <div style="width: 127px; height: 30px;">
                                <img src="${pageContext.request.contextPath}/images/sy_3_1_4.jpg" width="127" height="30">
                            </div>
                            <div
                                    style="background-image: url(${pageContext.request.contextPath}/images/sy_3_1_5.jpg);; height: 26px;">
                                <INPUT name="password" type="password" class=inuptCN
                                       id="domain" size="12" maxlength="20" value="123">
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/images/sy_3_1_6.jpg" width="127" height="40">
                            </div>
                        </div>
                        <div style="width: 85px; float: left; height: 181px;">
                            <img src="${pageContext.request.contextPath}/images/sy_3_1_7.jpg" width="85" height="181">
                        </div>
                    </div>
                </div>
                <div style="clear: both;"></div>
                <div style="height: 45px;">
                    <div style="width: 144px; height: 45px; float: left;">
                        <img src="${pageContext.request.contextPath}/images/sy_3_2.jpg" width="144" height="46">
                    </div>
                    <div style="width: 98px; height: 45px; float: left;">
                        <a target="_Self"><input type="image"
                                                 src="${pageContext.request.contextPath}/images/sy_3_3B.jpg" name="Image8" width="98" height="46"></a>
                    </div>
                    <div style="width: 147px; height: 45px; float: left;">
                        <img src="${pageContext.request.contextPath}/images/sy_3_4.jpg" width="147" height="46">
                    </div>
                </div>
            </div>
            <!-- 表单右边的图片 -->
            <div id="form-right"
                 style="height: 227px; float: left; width: 285px;">
                <img src="${pageContext.request.contextPath}/images/sy_4.jpg" width="285" height="227">
            </div>
            <div style="clear: both;"></div>
        </div>
    </form>
    <div style="height: 65px;">
        <img src="${pageContext.request.contextPath}/images/sy_5.jpg" width="1000" height="65">
    </div>
    <div style="width: 100%; height: 50px;">
        <div style="float: right;">-sibingmao版权所有</div>
    </div>
</div>

</body>
</html>
