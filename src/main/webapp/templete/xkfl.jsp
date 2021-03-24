<%--
Created by IntelliJ IDEA.
User: 79413
Date: 2020/10/6
Time: 19:13
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>需求征集</title>
<link rel="stylesheet" href="../css/zTreeStyle/zTreeStyle.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script src="../js/jquery.ztree.all.min.js"></script>
    <script>

        $(function () {
           

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

         

            var treeNodes = [
                {"id":1, "pId":0, "name":"test1"},
                {"id":11, "pId":1, "name":"test11"},
                {"id":12, "pId":1, "name":"test12"},
                {"id":111, "pId":11, "name":"test111"}
            ];

            $.fn.zTree.init($("#dept_tree"), setting, treeNodes);

        });

        

    </script>
</head>
<body>

    <form class="form-horizontal" style="margin-top: 25px;" onsubmit="return checkForm()"
      action="${pageContext.request.contextPath}/dcwjxxSubmitServlet" method="post">

        


            <%--    学科分类--%>
            <div class="form-group">
                <label class="col-sm-2 control-label">学科分类</label>
                <div class="col-sm-4">
<%--                    <input type="text" class="form-control" id="xkfl" name="XKFL" required readonly>--%>

                        <div class="col-sm-12" style="text-align:left;">
                            <div style=" border-collapse: separate;display: table;"  id="dept_div">
                                <input type="text"  id="xkfl"  placeholder="请选择学科分类" name="XKFL"  readonly="readonly"
                                       style=" border-bottom-right-radius: 0px;border-top-right-radius: 0px;"
                                       class="form-control" data-bv-field="contacts_id" />
                                <i style="display: none;" class="form-control-feedback" data-bv-icon-for="contacts_id"></i>
                                <div onclick="showMenu('dept_div'); return false;" style="cursor:pointer;" class="input-group-addon">
                                    <!--  <span class="glyphicon-user glyphicon"></span> -->选择
                                </div>
                            </div>
                        </div>
                </div>
            </div>

           

    </form>


    <!-- 一般讲该段代码放在form标签的外层,这样就会显示在最上方-->
    <div id="menuContent" class="menuContent"
         style="background: #fff; display: none; position: absolute; border: 1px solid #ddd; border-radius: 5px;">
        <ul id="dept_tree" class="ztree"
            style="margin-top: 0; width: 296px;">
        </ul>
    </div>

<script>
    //隐藏zTree外围div容器
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }

    //点击“选择”后显示zTree树
    function showMenu(id) {
        CurInput = 1; //标记第一个文本框
        var cityObj = $("#"+id);
        var cityOffset = $("#"+id).offset();
        var w=$("#"+id).css('width');
        var sw=w.substr(0,w.length-2)-12+'px';
        $("#dept_tree").width(sw);

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


</body>
</html>
