<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/29
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>（1）</title>
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
    <form action="jxcs?method=tj" method="post" style="margin-left: 20px;">
        统计字段：
        <select id="tjzd" name="tjzd" class="form-control"
                style="width: 150px;display: inline">
            <option value='xse'>销售额</option>
            <option value='xsl'>销售量</option>
            <option value='pagerank'>活跃度</option>
            <option value='yll'>盈利率</option>
        </select>
        图表类型：
        <select id="tblx" name="tblx" class="form-control"
                style="width: 150px;display: inline">
            <option value='line'>折线图</option>
            <option value='bar'>柱形图</option>
            <option value='pie'>饼状图</option>
        </select>

        条数：
        <input  type="text" style="width: 150px;display: inline;"
                name="num" id="num" placeholder="条数" class="form-control">
        <input type="submit" value="查询" class="form-control" style="display: inline;width: 100px;">

    </form>


</div>
<div class="row-fluid">
    <!--为echarts准备一个容器，画图就画在里面-->
    <div id="box" style="width: 1200px;height: 400px;margin-left: 4%"></div>
    <table class="table table-hover table-bordered">
        <!-- class="table table-bordered" -->
        <thead>
        <tr>
            <th>代理人</th>
            <th>销售量</th>
            <th>销售额</th>
            <th>货运公司</th>
            <th>活跃度</th>
            <th>盈利率</th>


        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${data}">
            <tr>
                <td>${item.dlr}</td>

                <td>${item.xsl}</td>
                <td>${item.xse}</td>
                <td>${item.hkgs}</td>
                <td>${item.pagerank}</td>
                <td>${item.yll}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script>
    $(function () {
        var mydataX = new Array(0);
        var mydataP = new Array(0);
        var mydataY = new Array(0);
        var data = '${json}';
        var btype = '${tblx}';
        var tjzd = '${tjzd}';
        var json = eval('(' + data + ')');
        if(tjzd=='xse'){
            for(var i=0;i<json.length;i++){
                mydataX.push(json[i].dlr);
                mydataY.push(json[i].xse);
                var t = {'name':json[i].dlr,'value':json[i].xse}
                mydataP.push(t);
            }
        }
        if(tjzd=='xsl'){
            for(var i=0;i<json.length;i++){
                mydataX.push(json[i].dlr);
                mydataY.push(json[i].xsl);
                var t = {'name':json[i].dlr,'value':json[i].xsl}
                mydataP.push(t);
            }
        }

        if(tjzd=='pagerank'){
            for(var i=0;i<json.length;i++){
                mydataX.push(json[i].dlr);
                mydataY.push(json[i].pagerank);
                var t = {'name':json[i].dlr,'value':json[i].pagerank}
                mydataP.push(t);
            }
        }

        if(tjzd=='yll'){
            for(var i=0;i<json.length;i++){
                mydataX.push(json[i].dlr);
                mydataY.push(json[i].yll);
                var t = {'name':json[i].dlr,'value':json[i].yll}
                mydataP.push(t);
            }
        }


        var myChart = echarts.init(document.getElementById("box"));
        //指定图表的配置项和数据
        var option = {
            //标题
            title: {
                text: '代理人的销售额'
            },
            //工具箱
            //保存图片
            toolbox: {
                show: true,
                feature: {
                    saveAsImage: {
                        show: true
                    }
                }
            },
            //图例-每一条数据的名字叫销量
            legend: {
                data: ['金额']
            },
            //x轴
            xAxis: {
                data: mydataX
            },
            //y轴没有显式设置，根据值自动生成y轴
            yAxis: {},
            //数据-data是最终要显示的数据
            series: [{
                name: '数量',
                type: btype,
                data: mydataY
            }]
        };
        var option2 = {

            title: {
                text: '代理人的销售额',
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

    })
    ;
</script>
</html>
