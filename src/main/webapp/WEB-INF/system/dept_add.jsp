<%--
  User: Teacher  Date: 2021/8/24
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fomr" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>新增子机构</title>
    <link href="${pageContext.request.contextPath}/style/styles.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
        var branchs = null;
        $(function () {
            $.get('${pageContext.request.contextPath}/dept/ajax/list', null, function (resp) {
                if (resp.code == 0) {
                    branchs = resp.data.filter(function (branch) {
                        if (branch.branchLevel < 3) {
                            return true;
                        } else {
                            return false;
                        }
                    });
                    load2SelectOptions();
                }
            }, 'json');
            //改变了下拉列表中的上级部门后，要修改当前部门的层级
            $("#parentNo").change(function () {
                var parentNo = $("#parentNo").val();
                var level = 1;
                if (parentNo > 0) {
                    $.each(branchs, function (idx, branch) {
                        if (branch.branchNo == parentNo) {
                            level = branch.branchLevel + 1;
                        }
                    });
                }
                $("#branchLevel").html(level);
            });
        });

        function load2SelectOptions() {
            var parentNoSel = $("#parentNo");
            parentNoSel.empty();
            var option = "<option value='0'>无</option>";
            parentNoSel.append(option);
            if (branchs && branchs.length > 0) {
                $.each(branchs, function (idx, branch) {
                    option = $("<option>");
                    option.val(branch.branchNo);
                    var txt = (branch.parentInfo ? (branch.parentInfo.branchName + " : ") : "") + branch.branchName;
                    option.text(txt);
                    parentNoSel.append(option);
                });
            }
        }

        function addDept() {
            var branchName = $("input[name=branchName]").val();
            if (!branchName) {
                alert("机构名称不能为空!");
                $("input[name=branchName]").focus();
            } else {
                document.forms[0].submit();
            }
        }

        function backToList() {
            window.location.href = '${pageContext.request.contextPath}/dept/list';
        }
    </script>
</head>
<body class="body0">

<div align="center">
    <table class="table_path">
        <tr>
            <td>您当前的位置：<a href="#"><span class="txtpath">系统管理</span></a>
                &gt; <a href="#"><span class="txtpath">机构管理</span></a> &gt; 机构维护
            </td>
            <td align="right">
                <script type="text/javascript" src="${pageContext.request.contextPath}/js/displayToday.js">
                </script>
            </td>
        </tr>
    </table>

    <form:form method="post" action="${pageContext.request.contextPath}/dept/add" modelAttribute="branchInfo">
        <table cellSpacing=1 cellPadding=2 class="table2">
            <tr>
                <th scope="row">机构编号</th>
                <td class="tr_s"><fmt:formatNumber value="${newBranchNo}" pattern="000"></fmt:formatNumber></td>
            </tr>
            <tr>
                <th scope="row">层次号</th>
                <td class="tr_s" id="branchLevel">1</td>
            </tr>
            <tr>
                <th scope="row">上级机构</th>
                <td class="tr_s"><select name="parentNo" id="parentNo">
                    <option value="0">无</option>
                </select></td>
            </tr>
            <tr>
                <th scope="row">机构名称</th>
                <td class="tr_s"><input type="text" name="branchName" value=""></td>
            </tr>
            <tr>
                <th scope="row">描述</th>
                <td class="tr_s"><textarea name="branchDesc" cols="50" rows="5"></textarea></td>
            </tr>

        </table>
        <form:errors path="*"></form:errors>
    </form:form>
    ${msg}
    <table width="100%" border="0" cellpadding="0" cellspacing="0"
           class="table0">
        <tr>
            <td>
                <div align="center">
                    <input name="button5" type="button" class="btn_mouseout"
                           onclick="addDept();" value="保存">
                    <input name="button32" type="button" class="btn_mouseout"
                           onclick='backToList();' value="返回">
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

</body>
</html>
