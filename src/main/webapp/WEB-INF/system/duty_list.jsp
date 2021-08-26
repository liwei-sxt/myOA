<%--
  User: Teacher  Date: 2021/8/25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>职务列表</title>
    <link href="${pageContext.request.contextPath}/style/styles.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/ztree/css/zTreeStyle/zTreeStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ztree/js/jquery.ztree.all.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/my.css">
    <style type="text/css">
        #inputWin {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: rgba(170, 170, 170, 0.5);
        }

        #inputWin > div {
            margin: 200px auto;
            width: 500px;
            background-color: #fff;
            padding: 10px;
        }
    </style>
    <script type="text/javascript">
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
                    $.fn.zTree.init($("#ulDutyList"), settings, resp.data);
                }
            }, 'json');
        });

        var currentNode = null;

        //显示机构内的职务列表
        function showList(event, treeId, treeNode) {
            currentNode = treeNode;
            var branchName = treeNode.branchName;
            if (treeNode.parentInfo) {
                branchName = treeNode.parentInfo.branchName + " : " + branchName;
                if (treeNode.parentInfo.parentInfo) {
                    branchName = treeNode.parentInfo.parentInfo.branchName + " : " + branchName;
                }
            }
            $("#spanCurrentBranchName").text(branchName);
            $("#tdCurrentBranchName").text(branchName);
            //发送请求，获取指定机构的职务列表
            refereshPage();
        }

        //显示录入新职务信息的窗口
        function showDutyAddWindow() {
            if (currentNode) {
                $("#inputWin").css("display", "block");
            } else {
                alert("请从左侧的机构树中点选对应的机构!");
            }
        }

        function closeDutyAddWindow() {
            $("#inputWin").css("display", "none");
            $("input[name=dutyName]").val("");
            $("input[name=dutyDesc]").val("");
            $("textarea[name=dutyRemarks]").val("");
        }

        //追加职务
        function addDuty() {
            var dutyName = $("input[name=dutyName]").val();
            var dutyDesc = $("input[name=dutyDesc]").val();
            var dutyRemarks = $("textarea[name=dutyRemarks]").val();
            var data = {};
            data.dutyName = dutyName;
            data.branchNo = currentNode.branchNo;
            data.dutyDesc = dutyDesc;
            data.dutyRemarks = dutyRemarks;
            if (dutyName && dutyName.length > 1) {
                $("#msgAdd").text("");
                $.post('${pageContext.request.contextPath}/duty/ajax/add', data, function (resp) {
                    closeDutyAddWindow();
                    refereshPage();
                }, "json");
            } else {
                $("#msgAdd").text("请输入职位的名称!");
            }
        }

        //刷新页面，再次发送请求，展示职务列表
        function refereshPage() {
            $.get('${pageContext.request.contextPath}/duty/ajax/list', {branchNo: currentNode.branchNo}, function (resp) {
                if (resp.code == 0) {
                    loadDutyList2Page(resp.data);
                } else {
                    alert(resp.msg);
                }
            }, 'json');
        }

        //将职务列表数据载入到页面的表格中
        function loadDutyList2Page(dutyList) {
            //
            var tbody = $("#tbody1");
            tbody.empty();
            if (dutyList && dutyList.length > 0) {
                var duty;
                var tr, td, img;
                var branchName;
                for (var i = 0; i < dutyList.length; i++) {
                    duty = dutyList[i];
                    tr = $("<tr>");
                    if (i % 2 == 0) {
                        tr.addClass("tr_s");
                    } else {
                        tr.addClass("tr_d")
                    }
                    td = $("<td>");
                    //所属机构
                    branchName = duty.branchInfo.branchName;
                    if (duty.branchInfo.parentInfo) {
                        branchName = (duty.branchInfo.parentInfo.branchName + " : ") + branchName;
                        if (duty.branchInfo.parentInfo.parentInfo) {
                            branchName = (duty.branchInfo.parentInfo.parentInfo.branchName + " : ") + branchName;
                        }
                    }
                    td.text(branchName);
                    tr.append(td);
                    //职务名称
                    td = $("<td>");
                    td.text(duty.dutyName);
                    tr.append(td);
                    //职务描述
                    td = $("<td>");
                    td.text(duty.dutyDesc);
                    tr.append(td);
                    //备注
                    td = $("<td>");
                    td.text(duty.dutyRemarks);
                    tr.append(td);
                    //操作
                    td = $("<td>");
                    img = $("<img>");
                    img.attr("src", "${pageContext.request.contextPath}/images/btn_edit.gif");
                    img.css("cursor", "hand");
                    img.attr("alt", "修改");
                    td.append(img);
                    td.append("&nbsp;");
                    img = $("<img>");
                    img.attr("src", "${pageContext.request.contextPath}/images/btn_del.gif");
                    img.css("cursor", "hand");
                    img.attr("alt", "删除");
                    td.append(img);
                    tr.append(td);
                    tbody.append(tr);
                }
            }
            console.info(dutyList);
        }
    </script>
</head>
<body class="body0">
<div class="float_left">
    <div id="divTree">
        <ul id="ulDutyList" class="ztree">树控件</ul>
    </div>
    <div id="divDutyList">
        <table class="table_path">
            <tr>
                <td>您当前的位置：<a href="#"><span class="txtpath">系统管理</span></a>
                    &gt; <a href="#"><span class="txtpath">职务管理</span></a> &gt; 职务列表
                </td>
                <td align="right">
                    <script type="text/javascript" src="${pageContext.request.contextPath}/js/displayToday.js"></script>
                </td>
            </tr>

        </table>

        <table cellSpacing=1 cellPadding=2 class="table1" id="table4">
            <thead>
            <tr>
                <th scope="col">
                    <div align="center">所属机构</div>
                </th>
                <th scope="col">
                    <div align="center">职务名称</div>
                </th>
                <th scope="col">
                    <div align="center">职务描述</div>
                </th>
                <th scope="col">
                    <div align="center">备注</div>
                </th>
                <th scope="col">
                    <div align="center">操作</div>
                </th>
            </tr>
            </thead>
            <tbody id="tbody1">

            </tbody>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0"
               class="table0">
            <tr>
                <td width="35%"><input name="button" type="button" class="btn_mouseout" value="新增"
                                       onclick="showDutyAddWindow();"></td>
                <td width="62%">
                    <p align="right">
                        <font color="#008080">共</font><font color="#800000"> 1</font><font
                            color="#008080"> 页 首页 上一页 下一页 尾页&nbsp; 跳转 <input
                            name="text" type="text" size="4"> 页
                    </font>
                </td>
                <td width="3%">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>

<div id="inputWin" style="display: none;">
    <div>
        <form method="post" action="">
            <table class="table_path">
                <tr>
                    <td>添加职务：<span id="spanCurrentBranchName"></span></td>
                </tr>
            </table>
            <table cellSpacing=1 cellPadding=2 class="table2">
                <tr>
                    <th scope="row">所属机构</th>
                    <td class="tr_s" id="tdCurrentBranchName"></td>
                </tr>
                <tr>
                    <th scope="row">职务名称</th>
                    <td class="tr_s"><input type="text" name="dutyName" value=""></td>
                </tr>
                <tr>
                    <th scope="row">职务描述</th>
                    <td class="tr_d" onmouseover="this.className='tr_o'"
                        onmouseout="this.className='tr_d'"><input type="text"
                                                                  name="dutyDesc" value=""></td>
                </tr>
                <tr>
                    <th scope="row">备注</th>
                    <td class="tr_d" onmouseover="this.className='tr_o'"
                        onmouseout="this.className='tr_d'"><textarea name="dutyRemarks"></textarea>
                    </td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="0"
                   class="table0">
                <tr>
                    <td>
                        <div align="center">
                            <input name="button5" type="button" class="btn_mouseout"
                                   onClick="addDuty();" value="保存"> <input name="button32"
                                                                           type="button" class="btn_mouseout"
                                                                           onclick='closeDutyAddWindow();'
                                                                           value="返回">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="msgAdd">&nbsp;</td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>