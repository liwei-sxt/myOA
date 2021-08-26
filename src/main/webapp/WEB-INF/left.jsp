<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>left</title>
    <link href="style/styles.css" rel="stylesheet" type="text/css">
    <base target="mainframe">
    <script type="text/javascript">
        <!--
        var old_menu0 = '';

        function menuclick0(submenu0) {
            if (old_menu0 != submenu0) {
                if (old_menu0 != '') {
                    old_menu0.style.display = 'none';
                }
                submenu0.style.display = 'block';
                old_menu0 = submenu0;

            } else {
                submenu0.style.display = 'none';
                old_menu0 = '';
            }
        }

        var old_menu1 = '';

        function menuclick1(submenu1) {
            if (old_menu1 != submenu1) {
                if (old_menu1 != '') {
                    old_menu1.style.display = 'none';
                }
                submenu1.style.display = 'block';
                old_menu1 = submenu1;

            } else {
                submenu1.style.display = 'none';
                old_menu1 = '';
            }
        }

        function MM_preloadImages() {
            // v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p)
                    d.MM_p = new Array();
                var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) {
            // v3.0
            var p, i, x;
            if (!d)
                d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all)
                x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++)
                x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++)
                x = MM_findObj(n, d.layers[i].document);
            return x;
        }

        function MM_nbGroup(event, grpName) {
            // v3.0
            var i, img, nbArr, args = MM_nbGroup.arguments;
            if (event == "init" && args.length > 2) {
                if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
                    img.MM_init = true;
                    img.MM_up = args[3];
                    img.MM_dn = img.src;
                    if ((nbArr = document[grpName]) == null)
                        nbArr = document[grpName] = new Array();
                    nbArr[nbArr.length] = img;
                    for (i = 4; i < args.length - 1; i += 2)
                        if ((img = MM_findObj(args[i])) != null) {
                            if (!img.MM_up)
                                img.MM_up = img.src;
                            img.src = img.MM_dn = args[i + 1];
                            nbArr[nbArr.length] = img;
                        }
                }
            } else if (event == "over") {
                document.MM_nbOver = nbArr = new Array();
                for (i = 1; i < args.length - 1; i += 3)
                    if ((img = MM_findObj(args[i])) != null) {
                        if (!img.MM_up)
                            img.MM_up = img.src;
                        img.src = (img.MM_dn && args[i + 2]) ? args[i + 2]
                            : args[i + 1];
                        nbArr[nbArr.length] = img;
                    }
            } else if (event == "out") {
                for (i = 0; i < document.MM_nbOver.length; i++) {
                    img = document.MM_nbOver[i];
                    img.src = (img.MM_dn) ? img.MM_dn : img.MM_up;
                }
            } else if (event == "down") {
                if ((nbArr = document[grpName]) != null)
                    for (i = 0; i < nbArr.length; i++) {
                        img = nbArr[i];
                        img.src = img.MM_up;
                        img.MM_dn = 0;
                    }
                document[grpName] = nbArr = new Array();
                for (i = 2; i < args.length - 1; i += 2)
                    if ((img = MM_findObj(args[i])) != null) {
                        if (!img.MM_up)
                            img.MM_up = img.src;
                        img.src = img.MM_dn = args[i + 1];
                        nbArr[nbArr.length] = img;
                    }
            }
        }

        //-->
    </script>
</head>
<body topmargin="0" leftmargin="0"
      style="background: url('images/leftbg.jpg'); background-position: bottom; overflow-x: hidden; overflow-y: hidden;">
<table border="0" width="180" id="table6" cellspacing="0"
       cellpadding="0" height="100%">
    <tr>
        <td valign="top">
            <table border="0" width="180" id="table2" cellspacing="2"
                   cellpadding="0">
                <tr>
                    <td>
                        <div align="center">
                            <table border="0" width="160" id="table3" cellspacing="0"
                                   cellpadding="0">
                                <tr valign="middle">
                                    <td height="27" valign="top" style="cursor: hand;"
                                        onclick="menuclick0(submenu0100);">
                                        <div align="center">
                                            <table width="100%" height="24" border="1" align="center"
                                                   cellpadding="1" cellspacing="1" bordercolor="#99CCFF">
                                                <tr>
                                                    <td valign="bottom">
                                                        <div align="center">
                                                            <font color="#666666" size="2" face="宋体">法规处:巴乔</font>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="23" background="images/box_top.gif"
                                        style="cursor: hand;" onclick="menuclick0(submenu0100);">
                                        <font color="#ffffff"> <img src="images/sub1_001.gif"
                                                                    border="0" width="16" height="16" align="middle">
                                        </font><font color="#000080"><b>公文管理</b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="display: none;" border="0" width="150"
                                               cellspacing="0" cellpadding="0" id="submenu0100">
                                            <tr>
                                                <td background="images/box_mid.gif">&nbsp;<a
                                                        style="text-decoration: none;"
                                                        onclick="menuclick1(submenu0101);" target="_self"
                                                        href="#"><img border="0" src="images/sub.gif"
                                                                      width="16" height="16"> 发文管理</a><br> <span
                                                        id="submenu0101" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="documentmanager/senddoc/draft_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																	发文拟稿</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="documentmanager/senddoc/waitdeal_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																	待办发文</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="documentmanager/senddoc/senddoc_search.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																	发文查询</a><br>
															</span> &nbsp;<a style="text-decoration: none;"
                                                                             onclick="menuclick1(submenu0102);"
                                                                             target="_self"
                                                                             href="#"><img border="0"
                                                                                           src="images/sub.gif"
                                                                                           width="16" height="16"> 收文管理</a><br>
                                                    <span
                                                            id="submenu0102" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            style="text-decoration: none;"
                                                            href="documentmanager/inceptdoc/draft_list.htm"><img
                                                            border="0" src="images/page.gif" width="16" height="16">
																	收文登记</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            style="text-decoration: none;"
                                                            href="documentmanager/inceptdoc/waitdeal_list.htm"><img
                                                            border="0" src="images/page.gif" width="16" height="16">
																	待办收文</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            style="text-decoration: none;"
                                                            href="documentmanager/inceptdoc/inceptdoc_search.htm"><img
                                                            border="0" src="images/page.gif" width="16" height="16">
																	收文查询</a><br>
															</span>&nbsp;<a style="text-decoration: none;"
                                                                            onclick="menuclick1(submenu0105);"
                                                                            target="_self"
                                                                            href="#"><img border="0"
                                                                                          src="images/sub.gif"
                                                                                          width="16" height="16">
                                                        缓急管理</a><br> <span
                                                            id="submenu0105" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            style="text-decoration: none;"
                                                            href="documentmanager/emergency/emergency_list.htm"><img
                                                            border="0" src="images/page.gif" width="16" height="16">
																	缓急维护</a><br>
															</span>&nbsp;<a style="text-decoration: none;"
                                                                            onclick="menuclick1(submenu0106);"
                                                                            target="_self"
                                                                            href="#"><img border="0"
                                                                                          src="images/sub.gif"
                                                                                          width="16" height="16">
                                                        密级管理</a><br> <span
                                                            id="submenu0106" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            style="text-decoration: none;"
                                                            href="documentmanager/secret/secret_list.htm"><img
                                                            border="0" src="images/page.gif" width="16" height="16">
																	密级维护</a> <br>
															</span>
                                                </td>
                                            </tr>
                                            <tr>
                                            </tr>
                                            <tr>
                                                <td><img border="0" src="images/box_footer.gif"
                                                         width="160" height="8"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="4"></td>
                                </tr>
                                <tr>
                                    <td height="23" background="images/box_top.gif"
                                        style="cursor: hand;" onclick="menuclick0(submenu0300);">
                                        <font color="#ffffff"> <img src="images/sub1_003.gif"
                                                                    border="0" width="16" height="16" align="middle">
                                        </font><font color="#000080"><b>会议管理</b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="display: none;" border="0" width="100%"
                                               cellspacing="0" cellpadding="0" id="submenu0300">
                                            <tr>
                                                <td background="images/box_mid.gif">&nbsp;<a
                                                        style="text-decoration: none;"
                                                        onclick="menuclick1(submenu0301);" target="_self" href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    会议议题</a><br> <span id="submenu0301"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/discussion/discussion_manage.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																起草议题</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/discussion/discussion_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																处理议题</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0302);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    会议计划</a><br> <span id="submenu0302"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/meetingplan/meetingPlan_manage.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																新建会议计划</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/meetingplan/meetingPlan_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																处理会议计划</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0303);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    会议通知</a><br> <span id="submenu0303"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/meetinginform/meetingInform_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																录入通知</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/meetinginform/meetingInform_manage.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																管理通知</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/meetinginform/meetingInform_receive.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																接收通知</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0304);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    会议纪要</a><br> <span id="submenu0304"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/summary/summary_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																录入纪要</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/summary/summary_waitlist.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																待办纪要</a><br> &nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/summary/summary_manage.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																纪要查询</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0305);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    会议室</a><br> <span id="submenu0305"
                                                                      style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/meetingroom/meetingRoom_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																会议室管理</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0306);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    会议管理</a><br> <span id="submenu0306"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="meetingmanage/meetingplan/meeting_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																会议查询</a><br>
													</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><img border="0" src="images/box_footer.gif"
                                                         width="160" height="8"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="4"></td>
                                </tr>
                                <tr>
                                    <td height="23" background="images/box_top.gif"
                                        style="cursor: hand;" onclick="menuclick0(submenu0900);">
                                        <font color="#ffffff"> <img src="images/sub1_009.gif"
                                                                    border="0" width="16" height="16" align="middle">
                                        </font><font color="#000080"><b>系统维护</b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="display: none;" border="0" width="100%"
                                               cellspacing="0" cellpadding="0" id="submenu0900">
                                            <tr>
                                                <td background="images/box_mid.gif">&nbsp;<a
                                                        style="text-decoration: none;"
                                                        onclick="menuclick1(submenu0901);" target="_self" href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    机构管理</a><br> <span id="submenu0901"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="${pageContext.request.contextPath}/dept/list"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																机构维护</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0902);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    职务管理</a><br> <span id="submenu0902"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="${pageContext.request.contextPath}/duty/list"><img border="0"
                                                                                                src="images/page.gif"
                                                                                                width="16" height="16"> 职务维护</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0905);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    职称管理</a><br> <span id="submenu0905"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="systemmanager/techtitle_list.htm"><img
                                                        border="0" src="images/page.gif" width="16" height="16">
																职称维护</a><br>
													</span>&nbsp;<a style="text-decoration: none;"
                                                                    onclick="menuclick1(submenu0903);" target="_self"
                                                                    href="#"><img
                                                        border="0" src="images/sub.gif" width="16" height="16">
                                                    人员管理</a><br> <span id="submenu0903"
                                                                       style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        style="text-decoration: none;"
                                                        href="systemmanager/user3_list.htm"><img border="0"
                                                                                                 src="images/page.gif"
                                                                                                 width="16" height="16"> 人员维护</a><br>
													</span>&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><img border="0" src="images/box_footer.gif"
                                                         width="160" height="8"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
