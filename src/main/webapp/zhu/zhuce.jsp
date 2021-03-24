<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html >
<head></head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/import_basic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" id="skin" />
<!--框架-->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery-1.4.js"></script>
<script type="text/javascript" src="../js/framework.js"></script>

<style type="text/css">
table {
	border:2px solid;
	border-radius:25px;
	-moz-border-radius:25px; /* Old Firefox */

	background-color: #E5ECFF; 
	box-shadow: 10px 10px 5px #888888;
	border: red solid thin;
	width: 400px;
	position: relative;
	top: 50px;
	left: 300px;
}
input[type="text"]{
	height:30px;
	width: 200px;
}

input[type="password"]{
	height:30px;
	width: 200px;
}

	h1 {
			color: #E5ECFF;
		}
</style>
<script type="text/javascript">


	function checkFrom() {
	
		password=$("#password").val();
		
		gzdw=$("#company").val();
		zyfx=$("#zyfx").val();
		szhy=$("#szhy").val();
		username=$("#username").val();
		repassword=$("#repassword").val();
		phone=$("#phone").val();
		zzjgdm=$("#zzjgdm").val();
		if(username.length<7||username.length>20){
			alert("用户名应大于6位小于20位!");
        	return false;
        }
		if(username==""||username==null){
			alert("用户名不能为空！");
			return false;
		}
		if(password==""||password==null){
			alert("密码不能为空！");
			return false;
		}
		if(password.length<6){
			alert("密码长度大于或等于6位！")
			return false;
		}
		if(password != repassword){
			alert("两次密码输入不一致！")
			return false;
		}
		if(phone.length != 11){
			alert("手机号码数字位数错误！")
			return false;
		}
		
		if(gzdw==""||gzdw==null){
			alert("工作单位不能为空！");
			return false;
		}
		if(zzjgdm==""||zzjgdm==null){
			alert("组织机构代码不能为空！");
			return false;
		}
		if(zyfx==""||zyfx==null){
			alert("专业方向不能为空！");
			return false;
		}
		if(szhy==""||szhy==null){
			alert("所在行业不能为空！");
			return false;
		}

		return true;
		
	}
	
	
	$(function () {
     
		   // 页面初始化生成验证码
        window.onload = createCode();
        // 验证码切换
        $('#cord').click(function () {
            createCode();
        });
	$.getJSON("../js/city-data.json", function(data) {
			
			$.each(data["province"], function(i, item) {
				$("#province").append(
						"<option value='"+item+"' >" + item + "</option>");
			});
		});

	//给username绑定blur事件
    $("#username").blur(function () {
        //获取username文本输入框的值
        var username = $(this).val();
       
        if(username.length<6||username.length>20){
        	return;
        }
        //发送ajax请求
        //期望服务器响应回的数据格式：{"userExsit":true,"msg":"此用户名太受欢迎,请更换一个"}
        //                         {"userExsit":false,"msg":"用户名可用"}
        $.get("user?method=checkUsername",{username:username},function (data) {
            //判断userExsit键的值是否是true
			//alert(data)
            // alert(data);
            var span = $("#s_username");
            if(data=="0"){
                //用户名存在
                //span.css("color","red");
                span.html('用户名存在');
            }else{
                //用户名不存在
                span.css("color","green");
                span.html("通过");
            }
        });

    }); 

	
    $("#sfzh").blur(function () {
        var isSfz = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
        sfzh=$("#sfzh").val();
    	if(sfzh.length != 18){
    		alert("身份证号数字位数错误！")
    		return false;
    	}
    	if (isSfz.test(sfzh) == false){
    		alert("身份证号年月日所在的位置错误！")
    		return false;
    	}
    });
	
	});
	
	function selectProvince(index) {
        $("#city").empty();
        $.getJSON ("../js/city-data.json", function (data)
        {
            $.each (data["city"][index], function (i, item)
            {
                $("#city").append("<option value='"+item+"'>" + item + "</option>");
            });
        });
    }

	// 生成验证码
	function createCode() {
		var code = "";
		// 验证码长度
		var codeLength = 4;
		// 验证码dom元素
		var checkCode = $("#cord");
		// 验证码随机数
		var random = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
				'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ];
		for (var i = 0; i < codeLength; i++) {
			// 随机数索引
			var index = Math.floor(Math.random() * 36);
			code += random[index];
		}
		// 将生成的随机验证码赋值
		checkCode.val(code);
	}
</script>
<body  style="background-color: #E5ECFF;">
<!-- 1、用户注册：首次用户使用需要进行注册，然后登录本系统。（1.5分）
（1）用户注册需要填报用户姓名、密码、重复密码、手机号码、所属单位五项内容（0.5分）；
（2）验证密码和重复密码保持一致（0.5分）；
（3）验证手机号码为11位数字。（0.5分） -->
<form action="user?method=zhuce" method="post" onsubmit="return checkFrom()">
	<table style="width: 700px">
		<tr>
			<td><input type="hidden" ><br></td>
			<td><input type="hidden" ></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><font size="2" style="color: #99CCFF">填写说明:红色*为必须填写的注册信息，建议你填写更多详细信息，以便较得更多资源信息服务</font></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><font size="3">用户注册</font>&nbsp;&nbsp; USER  &nbsp;REGISTER</td>
		</tr>
		<tr>
			<td><h3 align="center"><font color="red">*</font>用户名</h3></td>
			<td><input type="text" name="username"  id="username"> </td>
			<td><h3 style="color: red;" id="s_username">*&nbsp;&nbsp;&nbsp;用户名应大于6位小于20位</h3></td>
		</tr>
		<tr>
			<td><h3 align="center"><font color="red">*</font>密&nbsp;&nbsp;码</h3></td>
			<td><input type="password" name="password"   id="password"> </td>
			<td><h3 style="color: red;">*&nbsp;&nbsp;&nbsp;密码不能是空</h3></td>
		</tr>
		<tr>
			<td><h3 align="center"><font color="red">*</font>确认密码</h3></td>
			<td><input type="password" name="repassword"   id="repassword"> </td>
		</tr>
		<tr>
			<td><h3 align="center">姓&nbsp;&nbsp;名</h3></td>
			<td><input type="text" name="name"   id="name"> </td>
			<td><h3 >*&nbsp;&nbsp;&nbsp;请填写真实姓名，方便与您联系</h3></td>
			
		</tr>
		
		<tr>
			<td><h3 align="center">身份证号</h3></td>
			<td><input type="text" name="sfzh" id="sfzh"> </td>
			
		</tr>
		
		<tr>
			<td><h3 align="center">姓&nbsp;&nbsp;别</h3></td>
			<td>
				<input type="radio" name="sex" id="sex" value="男">男 
				<input type="radio" name="sex" id="sex" value="女">女
			</td>
			
		</tr>
		<tr>
			<td><h3 align="center">国家/省市</h3></td>
			<td>
				<select class="form-control" id="province" onchange="selectProvince(this.selectedIndex)" name="sheng"></select>
			</td>
			<td>
				<select class="form-control" id="city" name="shi"></select>
			</td>
		</tr>
		
		
		<tr>
			<td><h3 align="center"><font color="red">*</font>工作单位</h3></td>
			<td><input type="text" name="company"   id="company"> </td>
		</tr>
		
		<tr>
			<td><h3 align="center"><font color="red">*</font>组织机构代码</h3></td>
			<td><input type="text" name="zzjgdm"   id="zzjgdm"> </td>
		</tr>
		
		<tr>
			<td><h3 align="center"><font color="red">*</font>专业方向</h3></td>
			<td><input type="text" name="zyfx"   id="zyfx"> </td>
		</tr>
		<tr>
			<td><h3 align="center"><font color="red">*</font>所在行业</h3></td>
			<td><input type="text" name="szhy"   id="szhy"> </td>
		</tr>
		<tr>
			<td><h3 align="center">教育程度</h3></td>
			<td><input type="text" name="jycd"   id="jycd"> </td>
		</tr>
		<tr>
			<td><h3 align="center">职称</h3></td>
			<td><input type="text" name="zc"   id="zc"> </td>
		</tr>
		<tr>
			<td><h3 align="center">通讯地址</h3></td>
			<td><input type="text" name="txdz"   id="txdz"> </td>
			<td><h3 >*&nbsp;&nbsp;&nbsp;请填写详细，方便与您联系</h3></td>
		</tr>
		<tr>
			<td><h3 align="center">邮政编码</h3></td>
			<td><input type="text" name="yzbm"   id="yzbn"> </td>
		</tr>
		<tr>
			<td><h3 align="center">手机</h3></td>
			<td><input type="text" name="phone"   id="phone"> </td>
		</tr>
		<tr>
			<td><h3 align="center">固定电话</h3></td>
			<td><input type="text" name="gddh"   id="gddh"> </td>
		</tr>
		<tr>
			<td><h3 align="center">邮箱</h3></td>
			<td><input type="text" name="email"   id="email"> </td>
		</tr>
		<tr>
			<td><h3 align="center">QQ</h3></td>
			<td><input type="text" name="qq"   id="qq"> </td>
		</tr>
		<tr>
			<td><h3 align="center">MSN</h3></td>
			<td><input type="text" name="msn"   id="msn"> </td>
		</tr>
		<tr>
			<td><h3 align="center">验证码</h3></td>
			<td><input type="text" name="yzm" id="yzm"> </td>
			<td><input type="button" name="cord" id="cord" style="background: gray;color: white;"> </td>
		</tr>
		<tr>
			<td align="center"><a target="_top"><input type="submit" value="注册"  ></a></td>
			<td><input type="reset" value="重置"> </td>
		</tr>
		<tr>
			<td><input type="hidden" ><br></td>
			<td><input type="hidden" ></td>
		</tr>
	</table>
</form>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
	<h1>111111111111</h1>
</body>
</html>