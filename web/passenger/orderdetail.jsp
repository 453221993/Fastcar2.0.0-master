<%--
  Created by IntelliJ IDEA.
  User: 16320
  Date: 2018/11/4
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="/jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
    <title>订单详情页</title>
</head>
<body>
<nav class="navbar navbar-inverse">
    <p class="navbar-text">订单信息</p>
</nav>
<div class="container">
    <h2 class="sub-header">${passenger}当前订单详情页</h2><br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>订单id</th>
                <th>乘客</th>
                <th>接单司机</th>
                <th>起始点</th>
                <th>终点</th>
                <th>乘客联系方式</th>
                <th>司机联系方式</th>
                <th>叫车类型</th>
                <c:if test="${not empty order.platenumber}">
                    <th>车牌</th>
                </c:if>
                <th>订单创建日期</th>
                <th>司机接单时间</th>
                <th>订单结束日期</th>
                <th>订单状态</th>

                <c:if test="${order.orderprize!=0}">
                    <th>订单总金额</th>
                </c:if>
                <th>评价信息</th>
                <th>评价详情</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${order.orderid}</td>
                <td>${order.username}</td>
                <td>${order.drivername}</td>
                <td>${order.origin}</td>
                <td>${order.destination}</td>
                <td>${order.passengernumber}</td>
                <td>${order.drviernumber}</td>
                <td>${order.taximode}</td>
                <c:if test="${not empty order.platenumber}">
                    <th>${order.platenumber}</th>
                </c:if>
                <td>${order.createtime}</td>
                <c:if test="${not empty order.singletime}">
                    <td>${order.singletime}</td>
                </c:if>
                <c:if test="${empty order.singletime}">
                    <td>未接单</td>
                </c:if>
                <td>${order.endtime}</td>
                <td>${order.statesmean}</td>
                <c:if test="${order.orderprize!=0}">
                <td>${order.orderprize}</td>
                </c:if>
                <c:if test="${not empty order.evaluate}">
                    <td>${order.evaluate}</td>
                </c:if>
                <c:if test="${empty order.evaluate}">
                    <td>未评价</td>
                </c:if>
                <c:if test="${not empty order.evaluateinfo}">
                    <td>${order.evaluateinfo}</td>
                </c:if>
                <c:if test="${empty order.evaluateinfo}">
                    <td>未评价</td>
                </c:if>
                <td>
                    <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='passenger/index.jsp'">返回首页</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
