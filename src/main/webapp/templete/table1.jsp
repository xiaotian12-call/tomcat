<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/lr.css">

    <script src="../js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
body {
	background-color: 
}
.a{
text-align:center;
align:center;
}
.c{
margin-top: 200px;
		margin-left: 300px;
		height
		}
h1{
	color: white;
}
</style>
<script type="text/javascript">

function check()
{
	 if(document.getElementById("che").checked==false)     //判断单选框此时状态为未选 
     { 		document.getElementById("che").checked==false;
          document.getElementById("fenlei").disabled=true;// 文本框可编辑 
     } 
 else        //判断单选框此时状态为已选 
    { 	document.getElementById("che").checked==true;
         document.getElementById("fenlei").disabled=false;// 文本框可编辑       
} 
	 if(document.getElementById("duoxuan").checked==false)     //判断单选框此时状态为未选 
     { 		document.getElementById("duoxuan").checked==false;
          document.getElementById("jishuxvqiu").disabled=true;// 文本框可编辑 
     } 
 else        //判断单选框此时状态为已选 
    { 	document.getElementById("duoxuan").checked==true;
         document.getElementById("jishuxvqiu").disabled=false;// 文本框可编辑       
} 
	}

</script>
<body>
<form action="../xvqiushenbao" method="post" class="table table-hover">
		<table class="table table-hover" border="1px" cellpadding="0px" cellspacing="0px" align="center"  style="overflow-y:auto;"> 

<h1 class="a">河北省重大技术需求征集表</h1>
<tr><td><input type="submit"></td><td></td></tr>
	<table class="table table-hover" border="1px" cellpadding="0px" cellspacing="0px" align="center"  style="overflow-y:auto;"> 
<tr><td colspan="1">机构名称</td><td><input type="text" style="width: 100% ;height: 100%" id="jigoumingcheng" name="jigoumingcheng" ></td></tr>
<tr><td colspan="1">通讯地址</td><td><input type="text" style="width: 100% ;height: 100%" id="address" name="address" ></td></tr>
<tr><td>单位网址<input type="text" style="width: 100% ;height: 100%" id="wangzhi" name="wangzhi" ></td><td>电子信箱<input type="text" style="width: 100% ;height: 100%" id="mail" name="mail" ></td></tr>
<tr><td>法人代表<input type="text" style="width: 100% ;height: 100%" id="faren" name="faren" ></td><td>邮政编码<input type="text" style="width: 100% ;height: 100%" id="bianma" name="bianma" ></td></tr>
<tr><td rowspan="1">联系人<input type="text" style="width: 100% ;height: 100%" id="lianxiren" name="lianxiren"  ></td><td>电话<input type="number" style="width: 100% ;height: 100%" id="phone" name="phone"  ></td></tr>
<tr><td></td><td>传真:<input type="number"style="width: 100% ;height: 100%" id="chuanzhen" name="chuanzhen" ></td> </tr>
			<tr><td>机构简介</td><td><textarea id="wenben" name="wenben" style="width:100%;height:100px" maxlength="200"></textarea></td></tr>
			
			<div class="a">
				<tr><td></td><td><button type="submit" class="b">添&nbsp;&nbsp;&nbsp;加</button></td><td></td></tr>
			</div>
<tr><td><font>技术需求名称</font></td><td><input type="text" style="width: 100% ;height: 100%" id="Name" name="Name" ></td></tr>
<tr><td>重大科技需求概述</td><td><textarea id="wenben" name="wenben" style="width:100%;height:100px" maxlength="500"></textarea></td></tr>
<tr onclick="check()"><td><font>研究类型</font></td><td><input type="radio" id="che" name="duoxuan" value="基础研究" >基础研究&nbsp;&nbsp;&nbsp;<input type="radio" id="duoxuan" name="duoxuan" value="应用研究">应用研究<input type="radio" id="duoxuan" name="duoxuan" value="试验发展">试验发展<br>
<input type="radio" id="duoxuan" name="duoxuan" value="研究发展与成果应用">研究发展与成果研究<input type="radio" id="duoxuan" name="duoxuan" value="技术推广与科技服务">技术推广与科技服务
</td></tr>
<tr><td>学科分类</td><td><input type="text" style="width: 100% ;height: 100%" id="fenlei" name="fenlei" placeholder="（参加学科分类，限基础研究填写）" ></td></tr>
<tr><td>需求技术所属领域(非基础研究填写)</td><td>
<input type="checkbox" id="cha" name="fenlei" value="电子信息技术">电子信息技术<input type="checkbox" id="cha" name="fenlei" value="光机电一体化">光机电一体化
<input type="checkbox" id="cha" name="fenlei" value="软件">软件<input type="checkbox" id="cha" name="fenlei" value="生物制药技术">生物制药技术
<input type="checkbox" id="cha" name="fenlei" value="新材料及应用技术">新材料及应用技术<input type="checkbox" id="cha" name="fenlei" value="先机制造技术">先进制造技术<br>
<input type="checkbox" id="cha" name="fenlei" value="现代化农业">现代化农业<input type="checkbox" id="cha" name="fenlei" value="新能源及高效节能技术">新能源及高效节能技术
<input type="checkbox" id="cha" name="fenlei" value="资源与环境保护新技术">资源与环境保护新技术<input type="checkbox" id="cha" name="fenlei" value="其他技术（注明）">其他技术（注明）

</td></tr>
<tr><td>需求技术<br>应用行业</td><td><input type="text" style="width: 100% ;height: 100%" id="jishuxvqiu" name="jishuxvqiu" placeholder="（参见国民经济行业分类，非基础研究填写）" ></td></tr>

<tr><td><font>技术需求<br>合作模式</font></td><td><input type="radio" id="danxuan" name="danxuan" value="独立开发">独立开发<input type="radio" id="danxuan" name="danxuan" value="技术转让">技术转让<br>
<input type="radio" id="danxuan" name="danxuan" value="技术入股">技术入股<input type="radio" id="danxuan" name="danxuan" value="合作开发">合作开发
</td></tr>
<tr><td><font>计划总投资</font></td><td>
 <input type=text  style="width:100%"  t_value="" o_value=""  id="touzi" name="touzi" value="" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,'')" placeholder="只能输入数字和小数，其他 字母输入无效">
</td></tr>
<tr><td><font>计划总投资</font></td><td>
 <input type=text  style="width:100%"  t_value="" o_value=""  id="touzi" name="touzi" value="" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,'')" placeholder="只能输入数字和小数，其他 字母输入无效">
</td></tr>
<tr><td><font>计划总投资</font></td><td>
 <input type=text  style="width:100%"  t_value="" o_value=""  id="touzi" name="touzi" value="" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,'')" placeholder="只能输入数字和小数，其他 字母输入无效">
</td></tr>
</table>

</form>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
<h1>1111111111111</h1>
</body>
</html>