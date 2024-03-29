<%--
  Created by IntelliJ IDEA.
  User: 16320
  Date: 2018/11/22
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>订单信息</title>
    <base href="<%=basePath%>">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="/jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        function changedriverexamineStates(orderid) {
            if (confirm("确认审核通过当前司机吗？")) {
                $.ajax({
                    url: "adminServlet?action=changedriverexamineStates",
                    type: "post",
                    async: "true",
                    data: {"action": "changedriverexamineStates", "driverid": driverid},
                    dataType: "json",
                    success: function (data) {
                        if (data.res == 1) {
                            alert(data.info);
                            window.location.replace("adminServlet?action=findAllDriver");
                        }
                        else {
                            alert(data.info);
                        }
                    }
                });
            };
        }

        function nochangedriverexamineStates(driverid) {
            if (confirm("确认不通过当前司机的提交申请吗？")) {
                $.ajax({
                    url: "adminServlet?action=nochangedriverexamineStates",
                    type: "post",
                    async: "true",
                    data: {"action": "nochangedriverexamineStates", "driverid": driverid},
                    dataType: "json",
                    success: function (data) {
                        if (data.res == 1) {
                            alert(data.info);
                            window.location.replace("adminServlet?action=findAllDriver");
                        }
                        else {
                            alert(data.info);
                        }
                    }
                });
            };
        }
    </script>
</head>
<body>
<nav class="navbar navbar-inverse">
    <p class="navbar-text">平台注册司机信息</p>
</nav>
<div class="container">
    <h2 class="sub-header">司机信息分页列表</h2><br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>司机编号</th>
                <th>司机用户名</th>
                <th>联系方式</th>
                <th>性别</th>
                <th>最近一次登录时间</th>
                <th>司机状态</th>
                <%--<th>操作</th>--%>
            </tr>
            </thead>

            <c:forEach items="${pb.beanList}" var="cstm">
                <tbody>
                <tr>
                    <td>${cstm.driverid}</td>
                    <td>${cstm.name}</td>
                    <td>${cstm.number}</td>
                    <td>${cstm.sex}</td>
                    <td>${cstm.logintime}</td>
                    <c:if test="${cstm.examineStates==0}">
                        <td>未递交审核申请</td>
                    </c:if>
                    <c:if test="${cstm.examineStates==1}">
                        <td>已审核</td>
                    </c:if>
                    <c:if test="${cstm.examineStates==2}">
                        <td>审核不通过</td>
                    </c:if>
                    <c:if test="${cstm.examineStates==3}">
                        <td>已递交审核申请</td>
                    </c:if>
                    <%--<td>--%>
                        <%--<c:if test="${cstm.examineStates==0}">--%>
                            <%--<button class="btn btn-primary btn-sm edit_btn" onclick="changedriverexamineStates(${cstm.driverid})"><span class="glyphicon glyphicon-pencil">通过审核</span></button>--%>
                            <%--<button class="btn btn-danger btn-sm delete_btn" onclick="nochangedriverexamineStates(${cstm.driverid})"><span class="glyphicon glyphicon-pencil">不通过审核</span></button>--%>
                        <%--</c:if>--%>
                    <%--</td>--%>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <br/>
        <center>
            <ul class="pagination">
                <li><a>第${pb.pc}页/共${pb.tp}页</a></li>
                <li><a href="${pb.url}&pc=1">首页</a></li>
                <c:if test="${pb.pc>1}">
                    <li><a href="${pb.url}&pc=${pb.pc-1}">上一页</a></li>
                </c:if>

                <c:choose>
                    <c:when test="${pb.tp<=10}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="${pb.tp}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="begin" value="${pb.pc-5}"/>
                        <c:set var="end" value="${pb.pc+4}"/>
                        <%--头溢出--%>
                        <c:if test="${begin<1}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="10"/>
                        </c:if>
                        <%--尾溢出--%>
                        <c:if test="${end>pb.tp}">
                            <c:set var="end" value="${pb.tp}"/>
                            <c:set var="begin" value="${pb.tp-9}"/>
                        </c:if>
                    </c:otherwise>
                </c:choose>

                <%--循环遍历页码列表--%>
                <c:forEach var="i" begin="${begin}" end="${end}">
                    <c:choose>
                        <c:when test="${i eq pb.pc}">
                            <li><a href="${pb.url}&pc=${i}">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${pb.url}&pc=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
                <c:if test="${pb.pc<pb.tp}">
                    <li><a href="${pb.url}&pc=${pb.pc+1}">下一页</a></li>
                </c:if>
                <li><a href="${pb.url}&pc=${pb.tp}">尾页</a></li>
                <li><a href="admin/index.jsp">返回</a></li>
            </ul>
        </center>
    </div>
</div>
</body>
</html>

