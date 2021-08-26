<%--
  User: Teacher  Date: 2021/8/24
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公文接收人</title>
    <link href="${pageContext.request.contextPath}/style/styles.css" rel="stylesheet" type="text/css">
</head>
<body class="body0">
<div align="center">
    <table class="table_path">
        <tr>
            <td>您当前的位置：<a href="#"><span class="txtpath">系统管理</span></a>
                &gt; <a href="#"><span class="txtpath">机构管理</span></a> &gt; 指定公文接收人
            </td>
            <td align="right"><script type="text/javascript">
                today = new Date();
                function initArray() {
                    this.length = initArray.arguments.length
                    for (var i = 0; i < this.length; i++)
                        this[i + 1] = initArray.arguments[i]
                }
                var d = new initArray(" 星期日", " 星期一", " 星期二", " 星期三",
                    " 星期四", " 星期五", " 星期六");
                document.write("", today.getYear(), "年",
                    today.getMonth() + 1, "月", today.getDate(), "日 ",
                    d[today.getDay() + 1], "");
            </script></td>
        </tr>

    </table>
    <form name="dutyForm" method="POST" action="techtitle_add.htm">
        <table cellSpacing=1 cellPadding=2 class="table1" id="table4">
            <tr>
                <th scope="col"><div align="center">公文类型</div></th>
                <th scope="col"><div align="center">接收人</div></th>
            </tr>

            <tr class="tr_s">
                <td nowrap><div align="left">公文</div></td>
                <td nowrap><div align="center">
                    小王&nbsp;&nbsp;<input type="button" value="选择接收人(本部门及其从属部门)"
                                         onclick="javascript:window.showModalDialog('../common/tree/persontree_sys.htm','','dialogwidth:416px;dialogheight:520px;scroll:1;resizable:0;status:0;');">
                </div></td>
            </tr>

            <tr class="tr_d" onmouseover="this.className='tr_o'"
                onmouseout="this.className='tr_d'">
                <td nowrap><div align="left">通知</div></td>
                <td nowrap><div align="center">
                    小李&nbsp;&nbsp;<input type="button" value="选择接收人(本部门及其从属部门)"
                                         onclick="javascript:window.showModalDialog('../common/tree/persontree_sys.htm','','dialogwidth:416px;dialogheight:520px;scroll:1;resizable:0;status:0;');">
                </div></td>
            </tr>

        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0"
               class="table0">
            <tr>

                <td width="35%"><input name="button" type="button"
                                       class=btn_mouseout
                                       onclick="javascript:top.targeturl='../systemmanager/department_list.htm';window.location='../common/success.htm';"
                                       value="保存"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>


        </table>
        <input type="hidden" name="parentID" value="003000000000">
    </form>
</div>
</body>
</html>
