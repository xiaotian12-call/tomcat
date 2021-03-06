<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="../js/echarts.js"></script>
    <style>
        p {
            font-size: 16px;
            margin-top: 10px;
        }
        h5{
            color: #E8F6FF;;
        }

    </style>


</head>

<body style="background-color: #E8F6FF;">
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="tabbable" id="tabs-451449">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-169507" data-toggle="tab">分类检索</a>
                    </li>
                    <li>
                        <a id="here" href="#panel-638308" data-toggle="tab">综合检索</a>
                    </li>
                    <li>
                        <a id="here2"href="#panel-638309" data-toggle="tab">统计图表</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-169507">
                        <div class="row-fluid">
                            <div class="span12">
                                <form method="post" action="cx?method=flcx">
                                    <p>
                                        需求状态：
                                        <select name="xqzttj" id="sxzt" class="form-control"
                                                style="width: 150px;display: inline">
                                            <option value="99">选择</option>
                                            <option value="1">通过形式审核</option>
                                            <option value="3">通过部门审核</option>
                                        </select>
                                        标引条件：
                                        <select name="bytj" id="bytj" class="form-control"
                                                style="width: 200px;display: inline">
                                            <option value="jgmc">机构全称</option>
                                            <option value="gkglbm">归口管理单位</option>
                                            <option value="szdy">所在地域</option>
                                            <option value="frdb">法人代表</option>
                                            <option value="lxr">联系人</option>
                                            <option value="jgsx">机构属性</option>
                                            <option value="jsxqmc">技术需求名称</option>
                                            <option value="gjz">关键字</option>
                                            <option value="zjxqze">拟投入资金总额</option>
                                            <option value="jsxqhzms">技术需求解决方式</option>
                                            <option value="yjlx">科技活动类型</option>
                                            <option value="xkfl">学科分类</option>
                                            <option value="xqjsssly">需求技术所属领域</option>
                                            <option value="xqjsyyhy">需求技术应用行业</option>
                                            <option value="bmsh">管理处室</option>
                                        </select>
                                        <input type="text" name="bytjz" class="form-control"
                                               style="width: 150px;display: inline">
                                        <select name="sfmh" id="sfmh" class="form-control"
                                                style="width: 150px;display: inline">
                                            <option value="1">模糊查询</option>
                                            <option value="0">精准查询</option>
                                        </select>
                                    </p>
                                    <p>
                                        日期条件：
                                        从
                                        <input type="date" name="qxsj" class="form-control"
                                               style="width: 150px;display: inline">
                                        到
                                        <input type="date" name="jzsj" class="form-control"
                                               style="width: 150px;display: inline">
                                        <input type="submit" value="查询" class="form-control"
                                               style="width: 100px;display: inline">
                                    </p>
                                </form>
                            </div>

                        </div>
                        <div class="row-fluid">
                            <div class="span12">
                                <table class="table table-hover table-bordered">
                                    <!-- class="table table-bordered" -->
                                    <thead>
                                    <tr>
                                        <th>需求编号</th>
                                        <th>技术需求名称</th>
                                        <th>机构属性</th>
                                        <th>所在地域</th>
                                        <th>机构全称</th>
                                        <th>法人代表</th>
                                        <th>归口管理单位</th>
                                        <th>拟投入资金总额</th>
                                        <th>科技活动类型</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${xvQiuList}">
                                        <tr>
                                            <td>${item.wjid}</td>
                                            <td><a href="xvqiu?method=queryById&wjid=${item.wjid}">${item.jsxqmc}</a>
                                            </td>
                                            <td>${item.jgsx}</td>
                                            <td>${item.szdy}</td>
                                            <td>${item.jgmc}</td>
                                            <td>${item.frdb}</td>
                                            <td>${item.gkglbm}</td>
                                            <td>${item.zjxqze}</td>
                                            <td>${item.yjlx}</td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="panel-638308">

                        <div class="row-fluid">
                            <div class="span12">
                                <table class="table table-bordered">
                                    <tr>
                                        <td width="15%">控制条件</td>
                                        <td width="84%">
                                            <table name="tbl" id="tbl" class="table table-bordered">
                                                <tr>
                                                    <td>
                                                        <button onclick="insert_row()"
                                                                style="width: 130px;display: inline"
                                                                class="form-control">添加查询条件
                                                        </button>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <button onclick="deleteRow(this)"
                                                                style="width: 130px;display: inline"
                                                                class="form-control">删除查询条件
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select id="h1" name="h" class="form-control"
                                                                style="width: 100px;display: inline">
                                                            <option value="1">并且</option>
                                                            <option value="2">或者</option>
                                                            <option value="3">不含</option>
                                                        </select>
                                                        <select id="type1" name="type1" class="form-control"
                                                                style="width: 150px;display: inline">
                                                            <option value='jgmc'>机构全称</option>
                                                            <option value='gkglbm'>归口管理单位</option>
                                                            <option value='szdy'>所在地域</option>
                                                            <option value='frdb'>法人代表</option>
                                                            <option value='lxr'>联系人</option>
                                                            <option value='jgsx'>机构属性</option>
                                                            <option value='jsxqmc'>技术需求名称</option>
                                                            <option value='gjz'>关键字</option>
                                                            <option value='zjxqze'>拟投入资金总额</option>
                                                            <option value='jsxqhzms'>技术需求解决方式</option>
                                                            <option value='yjlx'>科技活动类型</option>
                                                            <option value='xkfl'>学科分类</option>
                                                            <option value='xqjsssly'>需求技术所属领域</option>
                                                            <option value='xqjsyyhy'>需求技术应用行业</option>
                                                        </select>
                                                        <input type="text" id="SearchBox1" name="SearchBox1"
                                                               class="form-control"
                                                               style="width: 150px;display: inline">
                                                        <select id="t1" name="t1" class="form-control"
                                                                style="width: 100px;display: inline">
                                                            <option value='1'>模糊</option>
                                                            <option value='0'>精确</option>
                                                        </select>
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                    <form action="cx?method=zhjs" method="post" onsubmit="return Submit()">

                                        <tr>
                                            <td width="15%">时间条件</td>
                                            <td width="84%">
                                                <p>
                                                    日期条件：
                                                    从
                                                    <input type="date" name="qxsj" class="form-control"
                                                           style="width: 150px;display: inline">
                                                    到
                                                    <input type="date" name="jzsj" class="form-control"
                                                           style="width: 150px;display: inline">

                                                    需求状态：
                                                    <select name="xqzttj" id="sxzt2" class="form-control"
                                                            style="width: 150px;display: inline">
                                                        <option value="0">选择</option>
                                                        <option value="1">通过形式审核</option>
                                                        <option value="3">通过部门审核</option>
                                                    </select>

                                                </p>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <input type="text" name="sql" id="sql" hidden="hidden"
                                                       style="width: 80%">
                                                <input type="submit" value="查询" class="form-control"
                                                       style="width: 150px;display: inline;margin-left: 85%">
                                            </td>
                                        </tr>
                                </table>
                                </form>
                            </div>
                        </div>

                        <div class="row-fluid">
                            <div class="span12">

                                <table class="table table-hover table-bordered">
                                    <!-- class="table table-bordered" -->
                                    <thead>
                                    <tr>
                                        <th>需求编号</th>
                                        <th>技术需求名称</th>
                                        <th>机构属性</th>
                                        <th>所在地域</th>
                                        <th>机构全称</th>
                                        <th>法人代表</th>
                                        <th>归口管理单位</th>
                                        <th>拟投入资金总额</th>
                                        <th>科技活动类型</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${xvQiuList}">
                                        <tr>
                                            <td>${item.wjid}</td>
                                            <td><a href="xvqiu?method=queryById&wjid=${item.wjid}">${item.jsxqmc}</a>
                                            </td>
                                            <td>${item.jgsx}</td>
                                            <td>${item.szdy}</td>
                                            <td>${item.jgmc}</td>
                                            <td>${item.frdb}</td>
                                            <td>${item.gkglbm}</td>
                                            <td>${item.zjxqze}</td>
                                            <td>${item.yjlx}</td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="panel-638309">

                        <div class="row-fluid">
                            <div class="span12">
                                <div class="span12">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td width="300px">控制条件</td>
                                            <td width="84%">
                                                <table name="tbl" id="tbl2" class="table table-bordered">
                                                    <tr>
                                                        <td>
                                                            <button onclick="insert_row2()"
                                                                    style="width: 130px;display: inline"
                                                                    class="form-control">添加查询条件
                                                            </button>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button onclick="deleteRow2(this)"
                                                                    style="width: 130px;display: inline"
                                                                    class="form-control">删除查询条件
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select id="h21" name="h21" class="form-control"
                                                                    style="width: 100px;display: inline">
                                                                <option value="1">并且</option>
                                                                <option value="2">或者</option>
                                                                <option value="3">不含</option>
                                                            </select>
                                                            <select id="type21" name="type21" class="form-control"
                                                                    style="width: 150px;display: inline">
                                                                <option value='jgmc'>机构全称</option>
                                                                <option value='gkglbm'>归口管理单位</option>
                                                                <option value='szdy'>所在地域</option>
                                                                <option value='frdb'>法人代表</option>
                                                                <option value='lxr'>联系人</option>
                                                                <option value='jgsx'>机构属性</option>
                                                                <option value='jsxqmc'>技术需求名称</option>
                                                                <option value='gjz'>关键字</option>
                                                                <option value='zjxqze'>拟投入资金总额</option>
                                                                <option value='jsxqhzms'>技术需求解决方式</option>
                                                                <option value='yjlx'>科技活动类型</option>
                                                                <option value='xkfl'>学科分类</option>
                                                                <option value='xqjsssly'>需求技术所属领域</option>
                                                                <option value='xqjsyyhy'>需求技术应用行业</option>
                                                            </select>
                                                            <input type="text" id="SearchBox21" name="SearchBox21"
                                                                   class="form-control"
                                                                   style="width: 150px;display: inline">
                                                            <select id="t21" name="t21" class="form-control"
                                                                    style="width: 100px;display: inline">
                                                                <option value='1'>模糊</option>
                                                                <option value='0'>精确</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>
                                        <form action="cx?method=tjtb" method="post" onsubmit="return Submit2()">

                                            <tr>
                                                <td width="15%">时间条件</td>
                                                <td width="84%">
                                                    <p>
                                                        日期条件：
                                                        从
                                                        <input type="date" name="qxsj" class="form-control"
                                                               style="width: 150px;display: inline">
                                                        到
                                                        <input type="date" name="jzsj" class="form-control"
                                                               style="width: 150px;display: inline">
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">选择统计字段：</td>
                                                <td width="84%">
                                                    <select id="tjzd" name="tjzd" class="form-control"
                                                            style="width: 150px;display: inline">
                                                        <option value='jgsx'>机构属性</option>
                                                        <option value='yjlx'>科技活动类型</option>
                                                        <option value='gkglbm'>归口管理部门</option>
                                                        <option value='szdy'>所在地域</option>
                                                        <option value='xkfl'>学科分类</option>
                                                        <option value='xqjiyyhy'>需求技术应用行业</option>
                                                        <option value='bmsh'>管理处室</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td width="15%">选择图表类型：</td>
                                                <td width="84%">
                                                    <select id="tblx" name="tblx" class="form-control"
                                                            style="width: 150px;display: inline">
                                                        <option value='line'>折线图</option>
                                                        <option value='bar'>柱形图</option>
                                                        <option value='pie'>饼状图</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2">
                                                    <input type="text" name="sql2" id="sql2" hidden="hidden"
                                                           style="width: 80%">
                                                    <input type="submit" value="查询" class="form-control"
                                                           style="width: 150px;display: inline;margin-left: 85%">
                                                </td>
                                            </tr>
                                    </table>
                                    </form>

                                </div>

                            </div>
                        </div>

                        <div class="row-fluid">
                            <!--为echarts准备一个容器，画图就画在里面-->
                            <div id="box" style="width: 1200px;height: 400px;margin-left: 4%"></div>
                            <table class="table table-hover table-bordered" id="ldb">
                                <thead id="thand">

                                </thead>
                                <tbody id="trs" >

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>

<script>
    $(function () {
        var mydataX = new Array(0);
        var mydataP = new Array(0);
        var mydataY = new Array(0);
        var btype = '${tblx}';
        //document.getElementById("here").click();
        var location_id = '${kid}';
        if (location_id != '') {
            document.getElementById(location_id).click();
        }
        var tjzd = '${tjzd}';
        var data = '${data}';
        var json = eval('(' + data + ')');
        //alert(data);
        if(tjzd!=''){
            if(tjzd=='jgsx'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].jgsx);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].jgsx,'value':json[i].num}
                    mydataP.push(t);
                }
                //alert(json[0].jgsx);
                //初始化ehcharts实例

            }
            else if(tjzd=='jsxqhzms'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].jsxqhzms);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].jsxqhzms,'value':json[i].num}
                    mydataP.push(t);
                }
            }
            else if(tjzd=='yjlx'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].yjlx);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].yjlx,'value':json[i].num}
                    mydataP.push(t);
                }
            }
            else if(tjzd=='gkglbm'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].gkglbm);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].gkglbm,'value':json[i].num}
                    mydataP.push(t);
                }
            }
            else if(tjzd=='szdy'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].szdy);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].szdy,'value':json[i].num}
                    mydataP.push(t);
                }
            }
            else if(tjzd=='xkfl'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].xkfl);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].xkfl,'value':json[i].num}
                    mydataP.push(t);
                }
            }
            else if(tjzd=='xqjsyyhy'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].xqjsyyhy);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].xqjsyyhy,'value':json[i].num}
                    mydataP.push(t);
                }
            }
            else if(tjzd=='bmsh'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].bmsh);
                    mydataY.push(json[i].num);
                    var t = {'name':json[i].bmsh,'value':json[i].num}
                    mydataP.push(t);
                }
            }
            var myChart=echarts.init(document.getElementById("box"));
            //指定图表的配置项和数据
            var option={
                //标题
                title:{
                    text:'重大需求统计图表'
                },
                //工具箱
                //保存图片
                toolbox:{
                    show:true,
                    feature:{
                        saveAsImage:{
                            show:true
                        }
                    }
                },
                //图例-每一条数据的名字叫销量
                legend:{
                    data:['数量']
                },
                //x轴
                xAxis:{
                    data:mydataX
                },
                //y轴没有显式设置，根据值自动生成y轴
                yAxis:{},
                //数据-data是最终要显示的数据
                series:[{
                    name:'数量',
                    type:btype,
                    data:mydataY
                }]
            };

            var option2 = {

                title: {
                    text: '重大需求统计图表',
                    left: 'left',
                    top: 20,

                },

                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                series: [
                    {
                        name: tjzd,
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '50%'],
                        data: mydataP.sort(function (a, b) { return a.value - b.value; }),
                        roseType: 'radius',
                        emphasis: {
                            itemStyle: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }

                    }
                ]
            };

            if(btype=='pie'){
                myChart.setOption(option2);
            }else {
                //使用刚刚指定的配置项和数据项显示图表
                myChart.setOption(option);
            }
            var $trTemp = $("<tr></tr>");
            for( var i = 0; i < mydataX.length; i++ ) {
                $trTemp.append("<td>"+ mydataX[i]+"</td>");
            }
            $trTemp.appendTo("#thand");
            var $trTemp2 = $("<tr></tr>");
            for( var i = 0; i < mydataY.length; i++ ) {
                $trTemp2.append("<td>"+ mydataY[i]+"</td>");
            }
            $trTemp2.appendTo("#trs");
            myChart.on('click', function (params) {
                let trlist = $("#thand").children('tr');
                let tdsnum = $("#trs").children('tr');
                var name = params.name;
                var tdArr = trlist.eq(0).find("td");
                var tdArr2 = tdsnum.eq(0).find("td");
                for(var i=0;i<tdArr.length;i++){
                    let thtext = tdArr.eq(i).text();
                    if(thtext==name){
                        tdArr.eq(i).css("background-color","red");
                        tdArr2.eq(i).css("background-color","red");
                    }else {
                        tdArr.eq(i).css("background-color","#E8F6FF");
                        tdArr2.eq(i).css("background-color","#E8F6FF");
                    }

                }

            });
        }




    });
</script>

<script type="text/javascript">

    var i = 1;
    var first = 1;

    function insert_row() {
        if (i - first >= 5) {
            alert("不能再加了");
            return;
        }
        i++;
        R = tbl.insertRow() //insertRow() 方法用于在表格中的指定位置插入一个新行。
        C1 = R.insertCell()  //insertCell() 方法用于在 HTML 表的一行的指定位置插入一个空的 <td> 元素。
        //C2 = R.insertCell()

        C1.innerHTML = "<select id='h" + i + "' name='h" + i + "' class='form-control' style='width: 100px;display: inline'>" +
            "<option value='1' >并且</option>" +
            "<option value='2' >或者</option>" +
            "<option value='3'>不含</option>" +
            "</select>" + "<select id='type" + i + "' name='type" + i + "' class='form-control' style='width: 150px;display: inline;margin-left: 5px'>" +
            "<option value='jgmc'>机构全称</option>" +
            "<option value='gkglbm'>归口管理单位</option>" +
            "<option value='szdy'>所在地域</option>" +
            "<option value='frdb'>法人代表</option>" +
            "<option value='lxr'>联系人</option>" +
            "<option value='jgsx'>机构属性</option>" +
            "<option value='gjz'>关键字</option>" +
            "<option value='zjxqze'>拟投入资金总额</option>" +
            "<option value='jsxqhzms'>技术需求解决方式</option>" +
            "<option value='yjlx'>科技活动类型</option>" +
            "<option value='xkfl'>学科分类</option>" +
            "<option value='xqjsssly'>需求技术所属领域</option>" +
            "<option value='xqjsyyhy'>需求技术应用行业</option>" +
            "</select>" + "&nbsp;<input id='SearchBox" + i + "' name='SearchBox" + i + "' class='form-control' style='width: 150px;display: inline'/>" +
            "<select id='t" + i + "' name='t" + i + "' class='form-control' style='width: 100px;display: inline;margin-left: 5px'>" +
            "<option value='1' >模糊</option>" +
            "<option value='0' >精确</option>" +
            "</select>"
        if (i % 14 == 2) {
            $("#type" + i + " option[value='gkglbm']").prop("selected", true);
        } else if (i % 14 == 3) {
            $("#type" + i + " option[value='szdy']").prop("selected", true);
        } else if (i % 14 == 4) {
            $("#type" + i + " option[value='frdb']").prop("selected", true);
        } else if (i % 14 == 5) {
            $("#type" + i + " option[value='lxr']").prop("selected", true);
        } else if (i % 14 == 6) {
            $("#type" + i + " option[value='jgsx']").prop("selected", true);
        } else if (i % 14 == 7) {
            $("#type" + i + " option[value='jsxqmc']").prop("selected", true);
        } else if (i % 14 == 8) {
            $("#type" + i + " option[value='gjz']").prop("selected", true);
        } else if (i % 14 == 9) {
            $("#type" + i + " option[value='zjxqze']").prop("selected", true);
        } else if (i % 14 == 0) {
            $("#type" + i + " option[value='jsxqhzms']").prop("selected", true);
        }
        /*else if (i % 14 == 3) {
            $("#type" + i + " option[value='yjlx']").prop("selected", true);
        } else if (i % 14 == 4) {
            $("#type" + i + " option[value='xkfl']").prop("selected", true);
        } else if (i % 14 == 5) {
            $("#type" + i + " option[value='xqjsssly']").prop("selected", true);
        } else if (i % 14 == 0) {
            $("#type" + i + " option[value='xqjsyyhy']").prop("selected", true);
        }*/

    }

    function deleteRow(obj) {
        alert("确定删除一行吗？");
        if (i - first < 1) {
            alert("不能再删除了");
            return;
        }
        tbl.deleteRow(obj.parentElement.parentElement.rowIndex+1);
        first++;
    }

    var i2 = 1;
    var first2 = 1;

    function insert_row2() {
        if (i2 - first2 >= 5) {
            alert("不能再加了");
            return;
        }
        i2++;
        R2 = tbl2.insertRow() //insertRow() 方法用于在表格中的指定位置插入一个新行。
        C12 = R2.insertCell()  //insertCell() 方法用于在 HTML 表的一行的指定位置插入一个空的 <td> 元素。
        //C2 = R.insertCell()

        C12.innerHTML = "<select id='h2" + i2 + "' name='h" + i2 + "' class='form-control' style='width: 100px;display: inline'>" +
            "<option value='1' >并且</option>" +
            "<option value='2' >或者</option>" +
            "<option value='3'>不含</option>" +
            "</select>" + "<select id='type2" + i2 + "' name='type" + i2 + "' class='form-control' style='width: 150px;display: inline;margin-left: 5px'>" +
            "<option value='jgmc'>机构全称</option>" +
            "<option value='gkglbm'>归口管理单位</option>" +
            "<option value='szdy'>所在地域</option>" +
            "<option value='frdb'>法人代表</option>" +
            "<option value='lxr'>联系人</option>" +
            "<option value='jgsx'>机构属性</option>" +
            "<option value='gjz'>关键字</option>" +
            "<option value='zjxqze'>拟投入资金总额</option>" +
            "<option value='jsxqhzms'>技术需求解决方式</option>" +
            "<option value='yjlx'>科技活动类型</option>" +
            "<option value='xkfl'>学科分类</option>" +
            "<option value='xqjsssly'>需求技术所属领域</option>" +
            "<option value='xqjsyyhy'>需求技术应用行业</option>" +
            "</select>" + "&nbsp;<input id='SearchBox2" + i2 + "' name='SearchBox" + i2 + "' class='form-control' style='width: 150px;display: inline'/>" +
            "<select id='t2" + i2 + "' name='t2" + i2 + "' class='form-control' style='width: 100px;display: inline;margin-left: 5px'>" +
            "<option value='1' >模糊</option>" +
            "<option value='0' >精确</option>" +
            "</select>"
        if (i2 % 14 == 2) {
            $("#type" + i2 + " option[value='gkglbm']").prop("selected", true);
        } else if (i2 % 14 == 3) {
            $("#type" + i2 + " option[value='szdy']").prop("selected", true);
        } else if (i2 % 14 == 4) {
            $("#type" + i2 + " option[value='frdb']").prop("selected", true);
        } else if (i2 % 14 == 5) {
            $("#type" + i2 + " option[value='lxr']").prop("selected", true);
        } else if (i2 % 14 == 6) {
            $("#type" + i2 + " option[value='jgsx']").prop("selected", true);
        } else if (i2 % 14 == 7) {
            $("#type" + i2 + " option[value='jsxqmc']").prop("selected", true);
        } else if (i2 % 14 == 8) {
            $("#type" + i2 + " option[value='gjz']").prop("selected", true);
        } else if (i2 % 14 == 9) {
            $("#type" + i2 + " option[value='zjxqze']").prop("selected", true);
        } else if (i2 % 14 == 0) {
            $("#type" + i2 + " option[value='jsxqhzms']").prop("selected", true);
        }
        /*else if (i % 14 == 3) {
            $("#type" + i + " option[value='yjlx']").prop("selected", true);
        } else if (i % 14 == 4) {
            $("#type" + i + " option[value='xkfl']").prop("selected", true);
        } else if (i % 14 == 5) {
            $("#type" + i + " option[value='xqjsssly']").prop("selected", true);
        } else if (i % 14 == 0) {
            $("#type" + i + " option[value='xqjsyyhy']").prop("selected", true);
        }*/

    }

    function deleteRow2(obj) {
        alert("确定删除一行吗？");
        if (i2 - first2 < 1) {
            alert("不能再删除了");
            return;
        }
        tbl.deleteRow(obj.parentElement.parentElement.rowIndex+1);
        first++;
    }

    function Submit2() {
        var url2 = "chaxun?sql = ";
        var sql2 = "select * from t_dcwjxx where 1=1 "

        for (var j = first2; j <= i2; j++) {
            var y = $("#type2" + j + " option:selected").val();
            //alert(y)
            var box = "SearchBox2" + j;
            var t = $("#t2" + j + " option:selected").val();
            var h = $("#h2" + j + " option:selected").text();
            //alert(h);
            var input = document.getElementById(box).value;
            //alert(input)
            if (j <= i2) {
                if (h == "并且") {
                    sql2 += " and ";
                }
                if (h == "或者") {
                    sql2 += " or ";
                }
            }
            if (h == "不含") {
                sql2 += " and " + y + " != '" + input + "' ";

            } else {
                if (t == "1") {
                    sql2 += y + " like '%" + input + "%'";
                } else {
                    sql2 += y + "= '" + input + "' ";
                }

            }

        }
        //alert(sql2);
        $("#sql2").attr("value", sql2);
        //alert( $("#sql2").val());
        //url+=sql;
        //window.location.href = url;<button id="Button" type="button"  onclick="Submit()">查询</button>
        //return true;
    }

    function Submit() {
        var url = "chaxun?sql = ";
        var sql = "select * from t_dcwjxx where 1=1 "

        for (var j = first; j <= i; j++) {
            var y = $("#type" + j + " option:selected").val();

            var box = "SearchBox" + j;
            var t = $("#t" + j + " option:selected").val();
            var h = $("#h" + j + " option:selected").text();
            //alert(t);
            var input = document.getElementById(box).value;
            if (j <= i) {
                if (h == "并且") {
                    sql += " and ";
                }
                if (h == "或者") {
                    sql += " or ";
                }
            }
            if (h == "不含") {
                sql += " and " + y + " != '" + input + "' ";

            } else {
                if (t == "1") {
                    sql += y + " like '%" + input + "%'";
                } else {
                    sql += y + "= '" + input + "' ";
                }

            }

        }
        //alert(sql);
        $("#sql").attr("value", sql);
        //alert(sql);
        //url+=sql;
        //window.location.href = url;<button id="Button" type="button"  onclick="Submit()">查询</button>
        //return true;
    }

</script>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
<h5>1</h5>
</html>