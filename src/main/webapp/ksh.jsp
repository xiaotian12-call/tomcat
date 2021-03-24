<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/5
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>可视化</title>
    <!-- Bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="../js/echarts.js"></script>
</head>
<body>
<div class="row-fluid">
    <div class="span12">
        <form method="post" action="cx?method=ktcs">
            <p style="margin-top: 10px;margin-left: 20px">
                统计字段：
                <select name="tjzd" id="sxzt" class="form-control"
                        style="width: 150px;display: inline">
                    <option value="99">选择</option>
                    <option value="numcs">访问次数</option>
                    <option value="numip">地市</option>
                    <option value="numll">流量</option>
                </select>
                前
                <input type="text" name="n" style="width: 150px;display: inline" class="form-control">
                个
            </p>
        </form>
    </div>
</body>
</html>
