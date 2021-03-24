<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
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
th
{
	width: 9.6%;
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
			data:{"wjid":id,"method":"deletexvqiu"},
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
<div class="row" style="background-color: #E8F6FF; height: auto;margin-left: 20px;">
	<h1 align="center">河北省重大技术需求征集表</h1>
	<font size="5" color="white"><a class="ab" href="./table.jsp">添加技术需求</a></font>
</div>
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
				<th>需求状态</th>

				<th colspan="3">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${pageBean.list}" varStatus="i">
				<tr>
					<td>${i.index+1 }</td>
					<td><a href="xvqiu?method=queryById0&wjid=${item.wjid}">${item.jsxqmc}</a></td>
					<td>${item.jgsx}</td>
					<td>${item.szdy}</td>
					<td>${item.jgmc}</td>
					<td>${item.yjlx}</td>
					<td>
						<c:if  test="${item.sfsh == 0}">
							未审核
						</c:if>
						<c:if  test="${item.sfsh == 1}">
							已审核
						</c:if>
					</td>
					<td><a href="xvqiu?method=queryById0&wjid=${item.wjid}">查看</a></td>
					<td><a href="xvqiu?method=changexq&wjid=${item.wjid}">修改</a></td>
					<td><a onclick="deletexiqiu(${item.wjid})">删除</a></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
<!--分页 -->
<div style="width: 580px; margin: 0 auto; margin-top: 50px;">
	<ul class="pagination" style="text-align: center; margin-top: 10px;">

		<!-- 上一页 -->
		<c:if test="${pageBean.currentPage==1 }">
			<li class="disabled">
				<a href="javascript:void(0);" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		<c:if test="${pageBean.currentPage!=1 }">
			<li>
				<a href="xvqiu?method=page&currentPage=${pageBean.currentPage-1 }" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>


		<!-- 显示每一页 -->
		<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
			<!-- 判断是否是当前页 -->
			<c:if test="${page==pageBean.currentPage }">
				<li class="active"><a href="javascript:void(0);">${page }</a></li>
			</c:if>
			<c:if test="${page!=pageBean.currentPage }">
				<li><a href="xvqiu?method=page&currentPage=${page }">${page }</a></li>
			</c:if>
		</c:forEach>


		<!-- 下一页 -->
		<c:if test="${pageBean.currentPage==pageBean.totalPage }">
			<li class="disabled">
				<a href="javascript:void(0);" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
		<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
			<li>
				<a href="xvqiu?method=page&currentPage=${pageBean.currentPage+1 }" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>

	</ul>
</div>
<!-- 分页结束 -->
</body>
</html>