<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="../js/jquery.ztree.all.min.js"></script>


	<style type="text/css">

		table {
			margin: auto;
			width: 80%;
			text-align: center;
			background-color: #E8F6FF;

		}
		input[type="text"]{
			height:30px;
			width: 100%;
		}
		input[type="checkbox"]{
			zoom:1.5;
		}
		input[type="radio"]{
			zoom:1.2;
		}
		h5{
			color: #E8F6FF;
		}
		td{
			font-size:10pt;
			width: 24%;
		}

	</style>
</head>
<script type="text/javascript">

	function textCounter(field, countfield, maxlimit) {
		// 函数，3个参数，表单名字，表单域元素名，限制字符； 
		if (field.value.length > maxlimit)
				//如果元素区字符数大于最大字符数，按照最大字符数截断； 
			field.value = field.value.substring(0, maxlimit);
		else
				//在记数区文本框内显示剩余的字符数； 
			countfield.value = maxlimit - field.value.length;
	}

	$(function () {
		$("#gjz1").change(function(){
			let gjz1 = $("#gjz1").val();
			if(gjz1!=null&&gjz1!=''){
				$("#gjz2").removeAttr('disabled');
			}
		});

		$("#gjz2").change(function(){
			let gjz1 = $("#gjz2").val();
			if(gjz1!=null&&gjz1!=''){
				$("#gjz3").removeAttr('disabled');
			}
		});

		$("#gjz3").change(function(){
			let gjz1 = $("#gjz3").val();
			if(gjz1!=null&&gjz1!=''){
				$("#gjz4").removeAttr('disabled');
			}
		});

		$("#gjz4").change(function(){
			let gjz1 = $("#gjz4").val();
			if(gjz1!=null&&gjz1!=''){
				$("#gjz5").removeAttr('disabled');
			}
		});

		$("#jieshu").blur(function () {
			let ks = $("#ks").val();
			let jieshu = $("#jieshu").val();
			if(ks>jieshu){
				alert("结束年份要大于开始年份");
			}

		});

		$("#xkflx").hide();
		$("#xqjssslyx").hide();
		$("#xqjsyyhyx").hide();



		//zTree初始化
		var setting = {
			data: {
				simpleData: {
					enable: true,
				}
			},
			callback: {
				onClick:function zTreeOnClick(event, treeId, treeNode){
					$("#xkfl").attr("value",treeNode.name);
					hideMenu();
				}
			},
			view:{
				fontCss:{font:{'background-color':'black', 'color':'white'}}
			}

		};
		$.ajax({
			//请求方式
			type : "POST",
			//请求的媒体类型
			dataType: "json",
			//请求地址
			url : "xkfl",
			//请求成功
			success : function(result) {
				var zNodes = [];
				for (var i = 0; i < result.length; i++) {
					var tempNode = {};
					tempNode["id"] = parseInt(result[i]['id']);
					tempNode["pId"] = parseInt(result[i]['pid']);
					tempNode["name"] = result[i]['name'];
					zNodes.push(tempNode);
				}
				var s = JSON.stringify(zNodes);
				var epc=eval("("+s+")");
				$.fn.zTree.init($("#dept_tree"), setting,epc);
			},
			//请求失败，包含具体的错误信息
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}


			/*$("#szdy").blur(function () {
                //获取username文本输入框的值
                var szdy = $(this).val();
                if(szdy=="1"){
                    $(this).val("石家庄市");
                }
            });*/

		});

		//zTree初始化
		var setting2 = {
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "pid",
					rootPId: "0"
				}
			},
			callback: {
				onClick:function zTreeOnClick(event, treeId, treeNode){
					$("#xqjsyyhy").attr("value",treeNode.name);
					hideMenu();
				}
			},
			view:{
				fontCss:{font:{'background-color':'black', 'color':'white'}}
			}

		};

		$.ajax({
			//请求方式
			type : "POST",
			//请求的媒体类型
			dataType: "json",
			//请求地址
			url : "xqjsyyhy",
			//请求成功
			success : function(result) {
				var s = JSON.stringify(result);
				var epc=eval("("+s+")");
				$.fn.zTree.init($("#dept_tree1"), setting2,epc);
			},
			//请求失败，包含具体的错误信息
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}
		});



	});

	function check()
	{
		if(document.getElementById("jcyj").checked==true)     //判断单选框此时状态为选了
		{
			$("#xkflx").show();
			$("#xqjssslyx").hide();
			$("#xqjsyyhyx").hide();
		}
		if(document.getElementById("yyyj").checked==true||
				document.getElementById("syfz").checked==true||
				document.getElementById("yjysyfzcgyy").checked==true||
				document.getElementById("jstgykjfw").checked==true){
			$("#xkflx").hide();
			$("#xqjssslyx").show();
			$("#xqjsyyhyx").show();
		}

	}
	function sum(obj)
	{
		var a = document.getElementById("zjxqze");
		var b = document.getElementById("zyzj");

		if(a.value<null&&b.value){
			alert("技术需求总额不能小于自有资金！")
		}


	}
	function subm() {
		var msg = "需求信息审核后不能修改！ 确定提交吗？";
		if(confirm(msg)==true){
			return true;
		}else {
			return false;
		}
	}
</script>
<body style="background-color: #E8F6FF;">

<!-- <form action="${pageContext.request.contextPath }/xvqiu?method=createXvQiu" method="post"> -->
<form action="xvqiu?method=createXvQiu2" method="post" onsubmit="return subm()">
	<div style="align-content: center;margin-top: 20px;width: 90%;margin-left: 4%">
		<table class="table" border="1">
			<tr>
				<td colspan="4" ><h1 align="center">河北省重大技术需求征集表</h1></td>
			</tr>
			<tr>
				<td><h3 align="center">机构全称 &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="jgmc" id="jgmc" value="${user.company }"></td>
				<td><h3 align="center">通讯地址 &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="txdz" id="txdz" value="${user.txdz }"></td>
			</tr>
			<tr>
				<td><h3 align="center">归口管理部门 &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="gkglbm" id="gkglbm" ></td>
				<td><h3 align="center">所在地域 &nbsp;&nbsp;</h3></td>
				<td><select style="width: 100%;height: 30px" id="szdy" name="szdy">

					<option value ="">   </option>
					<option value ="130100">石家庄市</option>
					<option value ="130200">唐山市</option>
					<option value ="130300">秦皇岛市</option>
					<option value ="130400">邯郸市</option>
					<option value ="130500">邢台市</option>
					<option value ="130600">保定市</option>
					<option value ="130700">张家口市</option>
					<option value ="130800">承德市</option>
					<option value ="130900">沧州市</option>
					<option value ="131000">廊坊市</option>
					<option value ="131100">衡水市</option>
					<option value ="130682">定州市</option>
					<option value ="130681">辛集市</option>
					<option value ="120000">其他（河北工大）</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><h3 align="center">网  址  &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="dwwz" id="dwwz" ></td>
				<td><h3 align="center">电子信箱 &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="dzyx" id="dzyx" value="${user.email }"></td>
			</tr>

			<tr>
				<td><h3 align="center">法人代表 &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="frdb" id="frdb" ></td>
				<td><h3 align="center">邮政编码&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="yzbm" id="yzbm" value="${user.yzbm }"></td>
			</tr>

			<tr>
				<td><h3 align="center">联 系 人 &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="lxr" id="lxr" value="${user.name }"></td>
				<td><h3 align="center">固定电话:&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="gddh" id="gddh" value="${user.gddh }"></td>
			</tr>
			<tr>
				<td><h3 align="center">手  机&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="yddh" id="yddh" value="${user.phone }"></td>
				<td><h3 align="center">机构属性 &nbsp;&nbsp;</h3></td>
				<td>
					<input type="radio" name="jgsx"  value="企业">企业&nbsp;&nbsp;
					<input type="radio" name="jgsx"  value="高等院校">高等院校&nbsp;&nbsp;
					<input type="radio" name="jgsx"  value="研究机构">研究机构&nbsp;&nbsp;
					<input type="radio" name="jgsx"  value="其他">其他
				</td>
			</tr>

			<tr>
				<td><h3 align="center">机构简介: &nbsp;&nbsp;</h3></td>
				<td colspan="3" align="center">
			<textarea style="height: 100px;width: 100%" name="jgjj" id="content"
					  onKeyDown="textCounter(jgjj,xz2,500);" onKeyUp="textCounter(jgjj,xz2,500);"
			></textarea>
					<p style="margin-right: 85%">您还可以输入:<input name="xz2" type="text" value="500" size="5" readonly="readonly" style="width: 30px;">个字</p>
				</td>

			</tr>

			<tr>
				<td><h3 align="center">技术需求名称 &nbsp;&nbsp;</h3></td>
				<td><input type="text" name="jsxqmc"  ></td>
				<td><h3 align="center">传    真&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="cz"  ></td>
			</tr>

			<tr>
				<td><h3 align="center">起始需求年份&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="qsxqnf"  id="ks"></td>
				<td><h3 align="center">截至需求年份&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="jzxqnf"  id="jieshu"></td>
			</tr>

			<tr >
				<td><h3 align="center">1、主要问题 &nbsp;&nbsp;</h3></td>
				<td colspan="3" align="center">
			<textarea style="height: 200px;width: 100%" name="zywt"
					  onKeyDown="textCounter(zywt,xz1,500);" onKeyUp="textCounter(zywt,xz1,500);"
			></textarea>
					<p style="margin-right: 85%">您还可以输入:<input name="xz1" type="text" value="500" size="5" readonly="readonly" style="width: 30px;">个字</p>
				</td>
			</tr>

			<tr>
				<td><h3 align="center">2、技术关键 &nbsp;&nbsp;</h3></td>
				<td colspan="3" align="center">
			<textarea style="height: 200px;width: 100%" name="jsgj"
					  onKeyDown="textCounter(jsgj,remLen,500);" onKeyUp="textCounter(jsgj,remLen,500);"
			></textarea>
				<p style="margin-right: 85%">您还可以输入:<input name="remLen" type="text" value="500" size="5" readonly="readonly" style="width: 30px;">个字</p>
				</td>
			</tr>

			<tr>
				<td><h3 align="center"> 3、预期目标&nbsp;&nbsp;</h3></td>
				<td colspan="3" align="center">
			<textarea style="height: 200px;width: 100%" name="yqmb"
					  onKeyDown="textCounter(yqmb,xz3,500);" onKeyUp="textCounter(yqmb,xz3,500);"
			></textarea>
					<p style="margin-right: 85%">您还可以输入:<input name="xz3" type="text" value="500" size="5" readonly="readonly" style="width: 30px;">个字</p>
				</td>
			</tr>

			<tr>
				<td><h3 align="center">关 键 字&nbsp;&nbsp;</h3></td>
				<td colspan="3">
					<input type="text" name="gjz"  style="width: 19%" id="gjz1">
					<input type="text" name="gjz" disabled="disabled" id="gjz2" style="width: 19%">
					<input type="text" name="gjz" disabled="disabled" id="gjz3" style="width: 19%">
					<input type="text" name="gjz" disabled="disabled" id="gjz4" style="width: 19%">
					<input type="text" name="gjz" disabled="disabled" id="gjz5" style="width: 19%">
				</td>
			</tr>

			<tr onclick="check()">
				<td align="center"><h3 >科技活动类型 &nbsp;&nbsp;</h3></td>
				<td colspan="3">
					<input type="radio" name="yjlx" value="基础研究" id="jcyj" >基础研究  &nbsp;&nbsp;
					<input type="radio" name="yjlx" value="试验发展" id="syfz" >试验发展 &nbsp;&nbsp;
					<input type="radio" name="yjlx" value="应用研究" id="yyyj" >应用研究 &nbsp;&nbsp;
					<input type="radio" name="yjlx" value="研究发展与成果应用" id="yjysyfzcgyy" >研究与试验发展成果应用 &nbsp;&nbsp;
					<input type="radio" name="yjlx" value="技术推广与科技服务" id="jstgykjfw" >技术推广与科技服务 &nbsp;&nbsp;
					<input type="radio" name="yjlx" value="生产性活动" id="scxhd" >生产性活动
				</td>
			</tr>

			<tr id="xkflx">
				<td align="center"><h3 >学科分类 &nbsp;&nbsp;</h3></td>

				<td colspan="3">

					<div style=" border-collapse: separate;display: table;"  id="dept_div_xkfl">
						<input type="text"  id="xkfl"  placeholder="请选择学科分类" name="xkfl"  readonly="readonly"
							   style=" border-bottom-right-radius: 0px;border-top-right-radius: 0px;"
							   class="form-control" data-bv-field="contacts_id" />
						<i style="display: none;" class="form-control-feedback" data-bv-icon-for="contacts_id"></i>
						<div onclick="showMenu('dept_div_xkfl',1); return false;" style="cursor:pointer;" class="input-group-addon">
							<!--  <span class="glyphicon-user glyphicon"></span> -->选择
						</div>
					</div>
				</td>
			</tr>

			<tr id="xqjssslyx">
				<td align="center"><h3 >需求技术所属领域 &nbsp;&nbsp;</h3></td>
				<td colspan="3">
					<input type="checkbox"  name="xqjsssly" value="电子信息技术">电子信息技术 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="光机电一体化">光机电一体化 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="生物技术与制药">生物技术与制药 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="软件">软件 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="生物制药技术">生物制药技术 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="新材料及应用技术">新材料及应用技术 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="先机制造技术">先进制造技术<br>
					<input type="checkbox"  name="xqjsssly" value="现代化农业">现代化农业 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="新能源及高效节能技术">新能源及高效节能技术 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="资源与环境保护新技术">资源与环境保护新技术 &nbsp;&nbsp;
					<input type="checkbox"  name="xqjsssly" value="0">其他技术（注明） &nbsp;&nbsp;
				</td>
			</tr>



			<tr id="xqjsyyhyx">
				<td align="center"><h3 >需求技术应用行业 &nbsp;&nbsp;</h3></td>
				<td colspan="3">
					<div style=" border-collapse: separate;display: table;"  id="dept_div_xqjs">
						<input type="text"  id="xqjsyyhy"  placeholder="请选择学科分类" name="xqjsyyhy"  readonly="readonly"
							   style=" border-bottom-right-radius: 0px;border-top-right-radius: 0px;"
							   class="form-control" data-bv-field="contacts_id" />
						<i style="display: none;" class="form-control-feedback" data-bv-icon-for="contacts_id"></i>
						<div onclick="showMenu('dept_div_xqjs',2); return false;" style="cursor:pointer;" class="input-group-addon">
							<!--  <span class="glyphicon-user glyphicon"></span> -->选择
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<td align="center"><h3 >技术需求解决方式 &nbsp;&nbsp;</h3></td>
				<td colspan="3">
					<input type="checkbox" id="dl" name="jsxqhzms" value="独立开发">独立开发&nbsp;&nbsp;
					<input type="checkbox" id="jszr" name="jsxqhzms" value="技术转让">技术转让&nbsp;&nbsp;
					<input type="checkbox" id="jsrg" name="jsxqhzms" value="技术入股">技术入股&nbsp;&nbsp;
					<input type="checkbox" id="hzkf" name="jsxqhzms" value="合作开发">合作开发&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center"><h3 >资金需求总额&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="zjxqze"  ></td>
				<td><h3 >拟投入自有资金总额&nbsp;&nbsp;</h3></td>
				<td><input type="text" name="zyzj"></td>
			</tr>

			<tr>
				<td colspan="2"> <input type="submit" value="提交" class="form-control" style="width: 150px;margin-left: 25%"></td>
				<td colspan="2"> <input type="reset" value="重置" class="form-control" style="width: 150px;margin-left: 25%"></td>
			</tr>



		</table>
	</div>
</form>

<!-- 一般讲该段代码放在form标签的外层,这样就会显示在最上方-->
<div id="menuContent" class="menuContent"
	 style="background: #fff; display: none; position: absolute; border: 1px solid #ddd; border-radius: 5px;">
	<ul id="dept_tree" class="ztree" hidden
		style="margin-top: 0; width: 296px;">
	</ul>

	<ul id="dept_tree1" class="ztree" hidden
		style="margin-top: 0; width: 296px;">
	</ul>
</div>

<script>

	//隐藏zTree外围div容器
	function hideMenu() {
		$("#dept_tree").attr("hidden","");
		$("#dept_tree1").attr("hidden","");
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}


	//点击“选择”后显示zTree树
	function showMenu(id,index) {
		CurInput = 1; //标记第一个文本框
		var cityObj = $("#"+id);
		var cityOffset = $("#"+id).offset();
		var w=$("#"+id).css('width');
		var sw=w.substr(0,w.length-2)-12+'px';
		$("#dept_tree").width(sw);
		$("#dept_tree1").width(sw);

		if(index == 1){
			$("#dept_tree").removeAttr("hidden");
		}else  if(index == 2){
			$("#dept_tree1").removeAttr("hidden");
		}

		//定位zTree外围div容器位置
		//alert(cityOffset.left+":"+cityOffset.top);
		$("#menuContent").css({
			// left: cityOffset.left-mod_left + "px",
			// top: cityOffset.top-mod_top-24 + "px"
			left:cityOffset.left + "px",
			top: cityOffset.top+30 + "px"
		}).slideDown("fast");
		//绑定页面的鼠标按下事件
		$("body").bind("mousedown", onBodyDown);
	}

	//判断当前事件来源
	function onBodyDown(event) {
		if (! (event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
			hideMenu();
		}
	}
</script>

<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>
<h5>111111111111</h5>

</body>
</html>