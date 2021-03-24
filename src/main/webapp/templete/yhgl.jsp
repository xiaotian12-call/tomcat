<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/10/19
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<style type="text/css">
    .ab {
        position: relative;
        top: 20px;
        left: 35px;
        right: 30px;
    }
</style>
<script type="text/javascript">
    function stop(id){
        $.ajax({
            "async":true,
            "url":"admin?method=stop",
            "data":{"id":id},
            "type":"POST",
            "dataType":"json",
            "success":function(data){
                var f = data.f;
                if(f){
                    alert("操作成功");
                    window.location="admin?method=chaAllUser";
                }else{
                    alert("操作失败");
                }
            }
        });
    }
    function start(id){
        $.ajax({
            "async":true,
            "url":"admin?method=start",
            "data":{"id":id},
            "type":"POST",
            "dataType":"json",
            "success":function(data){
                var f = data.f;
                if(f){
                    alert("操作成功");
                    window.location="admin?method=chaAllUser";
                }else{
                    alert("操作失败");
                }
            }
        });
    }
    function deleteuser(id){
        var msg = "确定删除？";
        if(confirm(msg)==true){
            $.ajax({
                "async":true,
                "url":"admin?method=delete",
                "data":{"id":id},
                "type":"POST",
                "dataType":"json",
                "success":function(data){
                    var f = data.f;
                    if(f){
                        alert("删除成功");
                        window.location="admin?method=chaAllUser";
                    }else{
                        alert("删除失败");
                    }
                }
            });
        }else{
            alert("操作取消！");
        }
    }
    function juese(name ,id){
        var select = "select[name=" + name + "]";
        var power = $(select).val();

        $.ajax({
            "async":true,
            "url":"admin?method=changePower",
            "data":{"id":id,"power":power},
            "type":"POST",
            "dataType":"json",
            "success":function(data){
                var f = data.f;
                if(f){
                    alert("操作成功");
                    window.location="admin?method=chaAllUser";
                }else{
                    alert("操作失败");
                }
            }
        });



    }

</script>
<body style="background-color: #E8F6FF;">
<div class="row" style="background-color: #E8F6FF; height: 60px">
    <font size="5" color="white"><a class="ab" href="../zhu/zhuce.jsp">新开用户</a></font>
</div>


<table class="table table-bordered">
    <thead>
    <tr>
        <th>用户编号</th>
        <th>用户名</th>
        <th>用户姓名</th>
        <th>所在单位</th>
        <th>性别</th>
        <th>用户状态</th>
        <th>用户角色</th>
        <th colspan="5" ><p align="center">操作</p></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${list}" varStatus="i">
        <tr>
            <td>${item.id}</td>
            <td>${item.username}</td>
            <td>${item.name}</td>
            <td>${item.company }</td>
            <td>${item.sex}</td>
            <td>
                <c:if test="${item.statu == '0'}">
                    被停用
                </c:if>
                <c:if test="${item.statu == '1'}">
                    正常
                </c:if>
            </td>
            <td width="200px">
                <select class="checkbox" style="width: 150px;height: 20px;display: inline" name="juese${i.index+1 }" onchange="juese('juese${i.index+1 }','${item.id}')" id="juese${i.index+1 }">

                    <option value ="99">--请选择--</option>
                    <option value ="2" ${item.power == '2'?"selected":""} >形式审核员</option>
                    <option value ="2" ${item.power == '3'?"selected":""} >部门审核员</option>
                    <option value ="0" ${item.power == '0'?"selected":""}>注册用户</option>
                    <option value ="1" ${item.power == '1'?"selected":""}>管理员</option>
                </select>
            </td>
            <td><a href="admin?method=query&id=${item.id}">查看用户</a></td>
            <td><a onclick="stop(${item.id})">暂停用户</a></td>
            <td><a onclick="start(${item.id})">恢复用户</a></td>
            <td><a href="admin?method=beforeChange&id=${item.id}">用户信息修改</a></td>
            <td><a onclick="deleteuser(${item.id})">删除用户</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>