<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/5
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>可视化</title>
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
</head>
<body>
<div class="row-fluid">
    <div class="span12">
        <form method="post" action="cx?method=ktcs">
            <p style="margin-top: 10px;margin-left: 20px">
                统计字段：
                <select name="tjzd" id="sxzt" class="form-control"
                        style="width: 150px;display: inline">
                    <option value="99">选择</option>
                    <option value="numcs">访问次数</option>
                    <option value="numip">地市</option>
                    <option value="numll">流量</option>
                </select>
                <select id="tblx" name="tblx" class="form-control"
                        style="width: 150px;display: inline">
                    <option value='line'>折线图</option>
                    <option value='bar'>柱形图</option>
                    <option value='pie'>饼状图</option>
                </select>
                前
                <input type="text" name="n" style="width: 150px;display: inline" class="form-control">
                个
                <input type="submit" value="查询" class="form-control"
                       style="width: 150px;display: inline;margin-left: 20px">
            </p>
        </form>
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
</body>
<script>
    $(function () {
        var mydataX = new Array(0);
        var mydataP = new Array(0);
        var mydataY = new Array(0);
        var btype = '${tblx}';
        alert(btype)
        var tjzd = '${tjzd}';
        var data = '${data}';
        var json = eval('(' + data + ')');
        //alert(data);
        if(tjzd!=''){

            if(tjzd=='numcs'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].id);
                    //alert(json[i].numcs)
                    mydataY.push(json[i].numcs);
                    var t = {'name':json[i].id,'value':json[i].numcs}
                    mydataP.push(t);
                }
                //alert(json[0].jgsx);
                //初始化ehcharts实例

            }
            else if(tjzd=='numip'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].id);
                    mydataY.push(json[i].numip);
                    var t = {'name':json[i].id,'value':json[i].numip}
                    mydataP.push(t);
                }
            }
            else if(tjzd=='numll'){
                for(var i=0;i<json.length;i++){
                    mydataX.push(json[i].id);
                    mydataY.push(json[i].numll);
                    var t = {'name':json[i].id,'value':json[i].numll}
                    mydataP.push(t);
                }
            }

            var myChart=echarts.init(document.getElementById("box"));
            //指定图表的配置项和数据
            var option={
                //标题
                title:{
                    text:'课堂测试图表'
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
                    text: '课堂测试图表',
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
</html>
