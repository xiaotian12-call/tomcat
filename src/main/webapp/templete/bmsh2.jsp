<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        table {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }


    </style>
    <script type="text/javascript">
        function deletexiqiu(id){
            var msg = "确定删除？";
            if(confirm(msg)==true){
                $.ajax({
                    url:"xvqiu",
                    async:true,
                    type:"POST",
                    data:{"id":id,"method":"deletexvqiu"},
                    success:function(data){
                        var f = data.f;
                        //alert(f);
                        if(f){
                            alert("删除成功");
                            window.location="xvqiu?method=searchAll";
                        }
                    },
                    error:function(){
                        alert("删除失败");
                    },
                    dataType:"json"
                });
            }
        }
    </script>
</head>
<body style="background-color: #E8F6FF;">

<input type="hidden" value="qvba">
<div class="row" style="height: auto">
    <form action="xvqiu?method=xqgl" method="post" style="margin-left: 20px;">
        机构全称：
        <input  type="text"
                name="jgmc" id="jgmc" placeholder="机构全称"class="form-control" style="width: 150px;display: inline;">
        所在地域：
        <input  type="text"
                name="szdy" id="szdy" placeholder="所在地域" class="form-control" style="width: 150px;display: inline;">
        技术需求名称：
        <input  type="text"
                name="jsxqmc" id="jsxqmc" placeholder="技术需求名称" class="form-control" style="width: 150px;display: inline;">

        归口管理单位：
        <input  type="text"
                name="gkglbm" id="gkglbm" placeholder="归口管理单位" class="form-control" style="width: 150px;display: inline;">
        <br>
        <br>
        机构属性：
        <input  type="text" style="width: 150px;display: inline;"
                name="jgsx" id="jgsx" placeholder="机构属性" class="form-control">
        科技活动类型：
        <input  type="text" style="width: 150px;display: inline;"
                name="yjlx" id="yjlx" placeholder="科技活动类型" class="form-control">
        <input
                type="submit" value="查询" onclick="query()" class="form-control" style="display: inline;width: 100px;">

    </form>
</div>
<table class="table table-bordered table-hover">
    <!-- class="table table-bordered" -->
    <thead>
    <tr>
        <th>需求编号</th>
        <th>技术需求名称</th>
        <th>机构属性</th>
        <th>所在地域</th>
        <th>机构全称</th>
        <th>科技活动类型</th>

        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${xvQiuList}" varStatus="i">
        <tr>
            <td>${i.index+1 }</td>
            <td><a href="xvqiu?method=queryById2&wjid=${item.wjid}">${item.jsxqmc}</a></td>
            <td>${item.jgsx}</td>
            <td>${item.szdy}</td>
            <td>${item.jgmc}</td>
            <td>${item.yjlx}</td>

            <td><a href="xvqiu?method=queryById&wjid=${item.wjid}">审核</a></td>


        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>