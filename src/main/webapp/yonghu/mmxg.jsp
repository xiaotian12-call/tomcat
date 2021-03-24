<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.4.js"></script>
<script type="text/javascript" src="../js/framework.js"></script>
<link href="../css/import_basic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" id="skin" />
<script type="text/javascript" src="../js/nav/ddaccordion.js"></script>
<script type="text/javascript" src="../js/text/text-overflow.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
table {
	border:2px solid;
	border-radius:25px;
	-moz-border-radius:25px; /* Old Firefox */

	background-color: white; 
	box-shadow: 10px 10px 5px #888888;
	border: red solid thin;
	width: 450px;
	
	position: relative;
	top: 50px;
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
	<form action="${pageContext.request.contextPath }/user?method=changePassword" method="post" onsubmit="return checkFrom()">
	<table>
		<tr>
			<td><input type="hidden" ><br></td>
			<td><input type="hidden" ></td>
			<td><input type="hidden" ></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><font size="3">修改密码</font>&nbsp;&nbsp; CHANGE  &nbsp;PASSWORD</td>
		</tr>
		<tr>
			<td><h3 align="center">旧&nbsp;密&nbsp;码</h3></td>
			<td><input type="text" name="oldPassword" placeholder="请输入旧密码"  id="oldPassword"></td>
				<td><h3 style="color: red;">*&nbsp;&nbsp;&nbsp;请输入旧密码</h3></td>
		</tr>
		<tr>
			<td><h3 align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码</h3></td>
			<td><input type="password" name="password" placeholder="请输入6-20位字母或数字"  id="password"> </td>
				<td><h3 style="color: red;">*&nbsp;&nbsp;&nbsp;请输入6-20位字母或数字</h3>
			</td>
		</tr>
		<tr>
			<td><h3 align="center">确认密码</h3></td>
			<td><input type="password" name="repassword" placeholder="两次输入的密码必须一致"  id="repassword"> </td>
			<td><h3 style="color: red;">*&nbsp;&nbsp;&nbsp;两次输入的密码必须一致</h3>
			</td>
		</tr>
		<tr>
			<td align="right"><a target="_top"><input type="submit" value="修改"  ></a></td>
			<td align="center"><input type="reset" value="重置"> </td>
			<td></td>
		</tr>
		<tr>
			<td><input type="hidden" ><br></td>
			<td><input type="hidden" ></td>
			<td><input type="hidden" ></td>
		</tr>
	</table>
	</form>
</body>
</html>