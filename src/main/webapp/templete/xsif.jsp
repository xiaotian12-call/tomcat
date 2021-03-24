<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--框架必需start-->
<script type="text/javascript" src="../js/jquery-1.4.js"></script>
<script type="text/javascript" src="../js/framework.js"></script>
<link href="../css/import_basic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" id="skin" />
<!--框架必需end-->
<script type="text/javascript" src="../js/nav/ddaccordion.js"></script>
<script type="text/javascript" src="../js/text/text-overflow.js"></script>
<<style type="text/css">
table {
	border:2px solid;
	border-radius:25px;
	-moz-border-radius:25px; /* Old Firefox */

	background-color: white; 
	box-shadow: 10px 10px 5px #888888;
	border: red solid thin;
	width: 800px;
	
	position: relative;
	top: 20px;
	left: 300px;
}
body {
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed;
	background-image: url(../image/bg2.jpg);
}

</style>
</head>
<body>
<!-- <form action="${pageContext.request.contextPath }/xvqiu?method=createXvQiu" method="post"> -->
<form action="xvqiu?method=xssh" method="post">
	<table >
		<tr>
			<td colspan="2" ><h1 align="center">河北省重大技术需求征集表</h1></td>
		</tr>
		<tr>
			<td colspan="2"><h3 align="center">技术需求名称 &nbsp;&nbsp;
				<input type="text" name="title" id="title" style="width: 510px" value="${param.title }" readonly="readonly"></h3></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<textarea style="height: 100px;width: 600px" name="context" id="content"  readonly="readonly"
					maxlength="500" onchange="this.value=this.value.substring(0,500)" onkeydown="this.value=this.value.substring(0,500)" onkeyup="this.value=this.value.substring(0,500)" 
			>		
			${param.context }
			
			</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h3 >研究类型:
				<input type="text" name="type" value="${param.type }" style="width: 510px" readonly="readonly"> 
			</h3></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h3>
				技术需求，合作模式：
				<input type="text" name="type" value="${param.model }" style="width: 510px" readonly="readonly"> 
			</h3></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h3>
				审核结果：
				<input type="radio" name="shjg" value="通过">通过
				<input type="radio" name="shjg" value="不通过 ">不通过
			</h3></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<textarea style="height: 100px;width: 600px" name="shyj" id="content"  
					maxlength="500" onchange="this.value=this.value.substring(0,500)" onkeydown="this.value=this.value.substring(0,500)" onkeyup="this.value=this.value.substring(0,500)" 
			>		
			
			</textarea></td>
		</tr>
		<tr>
			<td ><h3 align="center">计划总投资 &nbsp;&nbsp;<input type="number" readonly="readonly" min="0.00" max="500.00" step="0.01" name="money" style="width: 200px" value="${param.money }">万元</h3></td>
			<td  align="center" style="width: 280px"><input type="submit" value="提交" id="btu"
				><br /></td>
		</tr>
	</table>
	</form>
</body>
</html>