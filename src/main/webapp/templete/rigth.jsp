<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<c:if test="${tree.isParent }">
		<h1>枝节节点：软件</h1>
		<table class="table table-bordered" id="tbl">
			<thead>
				<tr>
					<th class="w1">子节点</th>
					<th class="w1">名</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${t_list}" var="item">
					<tr>
						<td class="w1">${item.id}</td>
						<td class="w1">${item.name}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${!tree.isParent }">
		<h1>叶子节点：嵌入式软件</h1>
		<table class="table table-bordered" id="tbl">
			<thead>
				<tr>
					<th class="w1">节点</th>
					<th class="w1">名</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td class="w1">${tree.id}</td>
					<td class="w1">${tree.name}</td>
				</tr>

			</tbody>
		</table>
	</c:if>

</body>
</html>