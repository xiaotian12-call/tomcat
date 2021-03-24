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
            width: 24%;
            font-size:10pt;
        }

    </style>
    <script>
        $(function () {
            $("#btyx").hide();
            var f='${f}';
            if (f=='1'){
                alert("修改成功！");
                window.location.href="xvqiu?method=searchAll";
            }else if(f=='0'){
                alert("修改失败！")
            }
        });
        function qvxiao() {
            window.location.href="xvqiu?method=searchAll";
        }
    </script>
</head>

<body style="background-color: #E8F6FF;">

<!-- <form action="${pageContext.request.contextPath }/xvqiu?method=createXvQiu" method="post"> -->
<form action="xvqiu?method=changexq2" method="post">
    <input type="text" value="${xvqiu.wjid}" name="wjid" hidden="hidden">
    <input type="text" value="1" name="sfsh" id="sfsh" hidden="hidden">
    <div style="align-content: center;margin-top: 20px;width: 90%;margin-left: 4%">
        <table class="table" border="1">
            <tr>
                <td colspan="4" ><h1 align="center">河北省重大技术需求征集表</h1></td>
            </tr>
            <tr>
                <td><h3 align="center">机构全称 &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="jgmc" id="jgmc" value="${xvqiu.jgmc }" class="form-control"></td>
                <td><h3 align="center">通讯地址 &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="txdz" id="txdz" value="${xvqiu.txdz }" class="form-control"></td>
            </tr>
            <tr>
                <td><h3 align="center">归口管理部门 &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="gkglbm" id="gkglbm" value="${xvqiu.gkglbm }" class="form-control"></td>
                <td><h3 align="center">所在地域 &nbsp;&nbsp;</h3></td>
                <td>
                    <input type="text" name="szdy" value="${xvqiu.szdy }" class="form-control">
                </td>
            </tr>
            <tr>
                <td><h3 align="center">网  址  &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="dwwz" id="dwwz" value="${xvqiu.dwwz }" class="form-control"></td>
                <td><h3 align="center">电子信箱 &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="dzyx" id="dzyx" value="${xvqiu.dzyx }" class="form-control"></td>
            </tr>

            <tr>
                <td><h3 align="center">法人代表 &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="frdb" id="frdb" value="${xvqiu.frdb }" class="form-control"></td>
                <td><h3 align="center">邮政编码&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="yzbm" id="yzbm" value="${xvqiu.yzbm }" class="form-control"></td>
            </tr>

            <tr>
                <td><h3 align="center">联 系 人 &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="lxr" id="lxr" value="${xvqiu.lxr }" class="form-control"></td>
                <td><h3 align="center">固定电话:&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="gddh" id="gddh" value="${xvqiu.gddh }" class="form-control"></td>
            </tr>
            <tr>
                <td><h3 align="center">手  机&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="yddh" id="yddh" value="${xvqiu.yddh }" class="form-control"></td>
                <td><h3 align="center">机构属性 &nbsp;&nbsp;</h3></td>
                <td>
                    <input type="text" name="jgsx" id="jgsx" value="${xvqiu.jgsx }" class="form-control">

                </td>
            </tr>

            <tr>
                <td><h3 align="center">机构简介: &nbsp;&nbsp;</h3></td>
                <td colspan="3" align="center">
			<textarea style="height: 100px;width: 100%" name="jgjj" id="content"
                      maxlength="500" onchange="this.value=this.value.substring(0,500)" onkeydown="this.value=this.value.substring(0,500)" onkeyup="this.value=this.value.substring(0,500)"
            >${xvqiu.jgjj }
            </textarea>
                </td>

            </tr>

            <tr>
                <td><h3 align="center">技术需求名称 &nbsp;&nbsp;</h3></td>
                <td><input type="text" name="jsxqmc" id="jsxqmc" value="${xvqiu.jsxqmc }" class="form-control"></td>
                <td><h3 align="center">传    真&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="cz" id="cz" value="${xvqiu.cz }" class="form-control"></td>
            </tr>

            <tr>
                <td><h3 align="center">起始需求年份&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="qsxqnf" id="qsxqnf" value="${xvqiu.qsxqnf }" class="form-control"></td>
                <td><h3 align="center">截至需求年份&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="jzxqnf" id="jzxqnf" value="${xvqiu.jzxqnf }" class="form-control"></td>
            </tr>

            <tr >
                <td><h3 align="center">1、主要问题 &nbsp;&nbsp;</h3></td>
                <td colspan="3" align="center">
			<textarea style="height: 200px;width: 100%" name="zywt" id="zywt" class="form-control"
                      maxlength="500" onchange="this.value=this.value.substring(0,500)" onkeydown="this.value=this.value.substring(0,500)" onkeyup="this.value=this.value.substring(0,500)"
            >
                ${xvqiu.zywt }
            </textarea></td>
            </tr>

            <tr>
                <td><h3 align="center">2、技术关键 &nbsp;&nbsp;</h3></td>
                <td colspan="3" align="center">
			<textarea style="height: 200px;width: 100%" name="jsgj" id="jsgj" class="form-control"
                      maxlength="500" onchange="this.value=this.value.substring(0,500)" onkeydown="this.value=this.value.substring(0,500)" onkeyup="this.value=this.value.substring(0,500)"
            >
                ${xvqiu.jsgj }
            </textarea></td>
            </tr>

            <tr>
                <td><h3 align="center"> 3、预期目标&nbsp;&nbsp;</h3></td>
                <td colspan="3" align="center">
			<textarea style="height: 200px;width: 100%" name="tqmb" id="yqmb" class="form-control"
                      maxlength="500" onchange="this.value=this.value.substring(0,500)" onkeydown="this.value=this.value.substring(0,500)" onkeyup="this.value=this.value.substring(0,500)"
            >
                ${xvqiu.tqmb }
            </textarea></td>
            </tr>

            <tr>
                <td><h3 align="center">关 键 字&nbsp;&nbsp;</h3></td>
                <td>
                    <input type="text" name="gjz" id="gjz" value="${xvqiu.gjz }" class="form-control">
                </td>
                <td align="center"><h3 >科技活动类型 &nbsp;&nbsp;</h3></td>
                <td >
                    <input type="text" name="yjlx" id="jcyj" value="${xvqiu.yjlx }" class="form-control">

                </td>
            </tr>


            <tr id="xkflx">
                <td align="center"><h3 >学科分类 &nbsp;&nbsp;</h3></td>

                <td >
                    <input type="text" name="xkfl" value="${xvqiu.xkfl }" class="form-control">
                </td>
                <td align="center"><h3 >需求技术所属领域 &nbsp;&nbsp;</h3></td>
                <td >
                    <input type="text" id="xqjsssly" name="xqjsssly" value="${xvqiu.xqjsssly }" class="form-control">

                </td>
            </tr>


            <tr id="xqjsyyhyx">
                <td align="center"><h3 >需求技术应用行业 &nbsp;&nbsp;</h3></td>
                <td>
                    <input type="text" name="xqjsyyhy" value="${xvqiu.xqjsyyhy }" class="form-control">
                </td>
                <td align="center"><h3 >技术需求解决方式 &nbsp;&nbsp;</h3></td>
                <td >
                    <input type="text" id="dl" name="jsxqhzms" value="${xvqiu.jsxqhzms }" class="form-control">

                </td>
            </tr>


            <tr>
                <td align="center"><h3 >资金需求总额&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="zjxqze" id="zjxqze" value="${xvqiu.zjxqze }" class="form-control"></td>
                <td><h3 >拟投入自有资金总额&nbsp;&nbsp;</h3></td>
                <td><input type="text" name="zyzj" id="zyzj" value="${xvqiu.zyzj }" class="form-control"></td>
            </tr>

            <tr id="btyx">
                <td><h3 align="center"> 意见和建议 &nbsp;&nbsp;</h3></td>
                <td colspan="3" align="center">
			<textarea style="height: 200px;width: 100%" name="yj" id="yj" class="form-control"
                      maxlength="500" onchange="this.value=this.value.substring(0,500)" onkeydown="this.value=this.value.substring(0,500)" onkeyup="this.value=this.value.substring(0,500)"
            >请说明不同意的原因！
            </textarea></td>
            </tr>

            <tr>
                <td colspan="2" id="sub"> <input type="submit" value="修改" class="btn btn-default" ></td>

                <td colspan="2" id="tj"> <input type="button" value="取消" class="btn btn-default" onclick="qvxiao()"></td>
            </tr>



        </table>
    </div>
</form>


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