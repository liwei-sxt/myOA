<%--
  User: Teacher  Date: 2021/8/23
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>机构列表</title>
    <link href="${pageContext.request.contextPath}/style/styles.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/gov_style_10.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ztree/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ztree/js/jquery.ztree.all.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/my.css">
    <script type="text/javascript">

        function showList(event, treeId, treeNode) {
            if (treeNode.branchLevel < 3) {
                $("input[name='currentBranchNo']").val(treeNode.branchNo);
                var branchName = (treeNode.parentInfo ? (treeNode.parentInfo.branchName + " : ") : "") + treeNode.branchName;
                $("#currentBranchName").text(branchName);
            }
        }

        $(function () {
            //用来保存设置参数的对象
            var settings = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "branchNo",
                        pIdKey: 'parentNo'
                    },
                    key: {
                        name: 'branchName'
                    }
                },
                callback: {
                    onClick: showList
                }
            };
            //节点数据
            $.get('${pageContext.request.contextPath}/dept/ajax/list', null, function (resp) {
                if (resp.code == 0) {
                    //初始化树控件
                    $.fn.zTree.init($("#ulDeptList"), settings, resp.data);
                }
            }, 'json');
        });

        function designateReceiver() {
            var branchNo = $("input[name='currentBranchNo']").val();
            console.info(branchNo);
            if (!branchNo) {
                alert("请从左边的结构树中点选要操作的机构!");
                return;
            }
            window.location = '${pageContext.request.contextPath}/dept/receiver?branchNo=' + branchNo;
        }
    </script>
</head>
<body class="body0">
<div class="float_left">
    <div id="divTree">
        <ul id="ulDeptList" class="ztree"></ul>
    </div>
    <div id="divDeptList">
        <table class="table_path">
            <tr>
                <td>您当前的位置：<a href="#"><span class="txtpath">系统管理</span></a>
                    &gt; <a href="#"><span class="txtpath">机构管理</span></a> &gt; 机构列表
                </td>
                <td align="right">
                    <script type="text/javascript" src="${pageContext.request.contextPath}/js/displayToday.js"></script>
                </td>
            </tr>
        </table>

        <table cellSpacing=1 cellPadding=2 class="table1" id="table4">
            <tr>
                <th scope="col">
                    <div align="center">机构编号</div>
                </th>
                <th scope="col">
                    <div align="center">机构名称</div>
                </th>
                <th scope="col">
                    <div align="center">层号</div>
                </th>
                <th scope="col">
                    <div align="center">上级机构</div>
                </th>
                <th scope="col">
                    <div align="center">描述</div>
                </th>
                <th scope="col">
                    <div align="center">操作</div>
                </th>
            </tr>
            <c:if test="${not empty pageInfo.list}">
                <c:forEach items="${pageInfo.list}" var="branch" varStatus="sts">
                    <tr
                            <c:if test="${sts.count%2==1}">class="tr_s"</c:if>
                            <c:if test="${sts.count%2==0}">class="tr_d"</c:if>>
                        <td>
                            <div align="center"><fmt:formatNumber value="${branch.branchNo}"
                                                                  pattern="000"></fmt:formatNumber></div>
                        </td>
                        <td>
                            <div align="left"><c:if
                                    test="${not empty branch.parentInfo}">${branch.parentInfo.branchName}:</c:if> ${branch.branchName}</div>
                        </td>
                        <td>
                            <div align="left">${branch.branchLevel}</div>
                        </td>
                        <td>
                            <div align="center">${branch.parentInfo.branchName}</div>
                        </td>
                        <td>
                            <div align="center">${branch.branchDesc}</div>
                        </td>
                        <td>
                            <div align="center">
                                <img src="${pageContext.request.contextPath}/images/btn_edit.gif"
                                     style="cursor: hand;" alt='修改'
                                     onclick="toModify(1);">
                                <img src="${pageContext.request.contextPath}/images/btn_del.gif"
                                     style="cursor: hand;" alt='删除'
                                     onclick='javascript:if(confirm("如果该机构下拥有子机构,将会一起删除,是否确定？")) {return true;}'>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

        <table width="100%" border="0" cellpadding="0" cellspacing="0"
               class="table0">
            <tr>
                <td width="35%"><input name="button" type="button"
                                       onclick="window.location='${pageContext.request.contextPath}/dept/add'"
                                       class="btn_mouseout" value="新增子机构"></td>
                <td width="62%">
                    <form method="get" action="${pageContext.request.contextPath}/dept/list">
                        <p align="right">
                            <font color="#008080">第</font><font color="#800000"> ${pageInfo.pageNum}</font><font
                                color="#008080"> 页 /
                            <font color="#008080">共</font><font color="#800000"> ${pageInfo.pageCount}</font><font
                                    color="#008080"> 页 <a
                                    href="${pageContext.request.contextPath}/dept/list?pageNum=1">首页</a>
                                <a href="${pageContext.request.contextPath}/dept/list?pageNum=${pageInfo.pageNum}&dir=pre">上一页</a>
                                <a href="${pageContext.request.contextPath}/dept/list?pageNum=${pageInfo.pageNum}&dir=next">下一页</a>
                                <a href="${pageContext.request.contextPath}/dept/list?pageNum=${pageInfo.pageCount}">尾页</a>
                                &nbsp; 跳转 <input name="pageNum" type="text" size="2" id="pageNumInput"> 页
                            </font>
                        </p>
                    </form>
                </td>
                <td width="3%">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <span id="currentBranchName"></span>
                    <input type="hidden" name="currentBranchNo" value=""> &nbsp;
                    <input name="button" type="button" class="btn_mouseout"
                           onclick="designateReceiver();"
                           value="指定本机构公文接收人"></td>
            </tr>
        </table>
        <c:choose>
            <c:when test="${param.msgCode=='addSuccess'}">添加成功!</c:when>
        </c:choose>
    </div>
</div>
</body>
</html>