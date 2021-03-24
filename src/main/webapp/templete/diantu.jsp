<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/29
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>ECharts 关系图</title>
    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/echarts.js"></script>
</head>

<body>
<div id="main" style="width:100%;height:800px"></div>

<script type="text/javascript">
    $(function () {
        var mydataP = new Array(0);
        var lines = new Array(0);
        var hkgss = new Array(0);
        var myChart = echarts.init(document.getElementById('main'));
        var categories = [];
        categories[0] = { name: '航空公司' };
        categories[1] = { name: '代理人' };
        var data = '${json}';
        var data1 = '${line}';

        var c=0;
        var json = eval('(' + data + ')');
        var line = eval('(' + data1 + ')');
        //var t1 = {'name':json[0].dlr,'symbolSize':parseInt(json[0].pagerank)/100000,'des':json[0].dlr,'category':0}

        hkgss.push(line[0].hkgs);
        for(var j=1;j<line.length;j++){
            if(hkgss.indexOf(line[j].hkgs)==-1){
                hkgss.push(line[j].hkgs)
            }
        }
        //alert(hkgss.length)
        //alert(line.length)
        for(var i=0;i<hkgss.length;i++){
            var t1 = {'name':hkgss[i],'symbolSize':i+20,'des':hkgss[i],'category':0}
            mydataP.push(t1);
        }
        for(var i=0;i<json.length;i++){

            var size= parseInt(json[i].pagerank) ;
            //alert(size)

            var t = {'name':json[i].dlr,'symbolSize':size/100000,'des':json[i].dlr,'category':1}
            //var t1 = {'name':line[i].hkgs,'symbolSize':i+10,'des':line[i].hkgs,'category':0}
            mydataP.push(t);
            //mydataP.push(t1)
        }

        for(var j=0;j<line.length;j++){
            var t = {'source':line[j].dlr,'target':line[j].hkgs,'name':j+"line",'des':j+"line"}
            //alert(t.source)
            lines.push(t)
        }

        option = {
            // 图的标题
            title: {
                text: 'ECharts 关系图'
            },
            // 提示框的配置
            tooltip: {
                formatter: function (x) {
                    return x.data.des;
                }
            },
            // 工具箱
            toolbox: {
                // 显示工具箱
                show: true,
                feature: {
                    mark: {
                        show: true
                    },
                    // 还原
                    restore: {
                        show: true
                    },
                    // 保存为图片
                    saveAsImage: {
                        show: true
                    }
                }
            },
            legend: [{
                // selectedMode: 'single',
                data: categories.map(function (a) {
                    return a.name;
                })
            }],
            series: [{
                type: 'graph', // 类型:关系图
                layout: 'force', //图的布局，类型为力导图
                symbolSize: 40, // 调整节点的大小
                roam: true, // 是否开启鼠标缩放和平移漫游。默认不开启。如果只想要开启缩放或者平移,可以设置成 'scale' 或者 'move'。设置成 true 为都开启
                edgeSymbol: ['circle', 'arrow'],
                edgeSymbolSize: [2, 10],
                markpoint:{symbol:'emptycircle'},
                edgeLabel: {
                    normal: {
                        textStyle: {
                            fontSize: 20
                        }
                    }
                },
                force: {
                    repulsion: 2500,
                    edgeLength: [10, 50]
                },
                draggable: true,
                lineStyle: {
                    normal: {
                        width: 2,
                        color: '#4b565b',
                    }
                },
                edgeLabel: {
                    normal: {
                        show: true,
                        formatter: function (x) {
                            return x.data.name;
                        }
                    }
                },
                label: {
                    normal: {
                        show: true,
                        textStyle: {}
                    }
                },

                // 数据
                data: mydataP,
                links: lines,

                categories: categories,
            }]
        };
        myChart.setOption(option);
    });

</script>
</body>
</html>
