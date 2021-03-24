<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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


</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="tabbable" id="tabs-451449">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-169507" data-toggle="tab">权限管理</a>
                    </li>
                    <li>
                        <a href="#panel-638310" data-toggle="tab">新建权限</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-169507">
                        <form action="admin?method=changeJs" method="post">
                            <div class="row-fluid">
                                <div class="span12">
                                    <h3 align="center">请选择角色
                                        <select class="checkbox" style="width: 200px;height: 30px;display: inline"
                                                name="js">
                                            <option value="99">--请选择--</option>
                                            <option value="2">网络审核员</option>
                                            <option value="0">注册用户</option>
                                            <option value="1">管理员</option>
                                        </select>
                                    </h3>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>权限名称</th>
                                            <th>权限说明</th>
                                            <th>是否赋予</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>需求征集</td>
                                            <td>可以填写需求报表</td>
                                            <td><input type="checkbox" name="qx" value="xqzj_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>需求管理</td>
                                            <td>可以查看自己填报的需求报表的相关信息</td>
                                            <td><input type="checkbox" name="qx" value="xqgl_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>用户信息</td>
                                            <td>可以查看用户信息</td>
                                            <td><input type="checkbox" name="qx" value="yhxx_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>修改密码</td>
                                            <td>可以修改自己的密码</td>
                                            <td><input type="checkbox" name="qx" value="yhxg_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>网络审核</td>
                                            <td>可以对提交的需求报表进行审核</td>
                                            <td><input type="checkbox" name="qx" value="xssh_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>用户密码重置</td>
                                            <td>可以重置用户的密码</td>
                                            <td><input type="checkbox" name="xqjz"></td>
                                        </tr>
                                        <tr>
                                            <td>统计查询权限</td>
                                            <td>可以查询并统计报表信息</td>
                                            <td><input type="checkbox" name="qx" value="tjcx_qx"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <button class="btn" type="submit" style="width: 80px;margin-left: 40%">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="panel-638310">
                        <form action="admin?method=addJs" method="post">
                            <div class="row-fluid">
                                <div class="span12">
                                    <h3 style="margin-left: 50px">
                                        新角色名称：
                                        <input type="text" name="jsmc" class="form-control"
                                               style="display: inline;width: 200px">
                                    </h3>
                                </div>
                            </div>

                            <div class="row-fluid">
                                <div class="span12">

                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>权限名称</th>
                                            <th>权限说明</th>
                                            <th>是否赋予</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>需求征集</td>
                                            <td>可以填写需求报表</td>
                                            <td><input type="checkbox" name="qx" value="xqzj_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>需求管理</td>
                                            <td>可以查看自己填报的需求报表的相关信息</td>
                                            <td><input type="checkbox" name="qx" value="xqgl_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>用户信息</td>
                                            <td>可以查看用户信息</td>
                                            <td><input type="checkbox" name="qx" value="yhxx_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>修改密码</td>
                                            <td>可以修改自己的密码</td>
                                            <td><input type="checkbox" name="qx" value="yhxg_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>网络审核</td>
                                            <td>可以对提交的需求报表进行审核</td>
                                            <td><input type="checkbox" name="qx" value="xssh_qx"></td>
                                        </tr>
                                        <tr>
                                            <td>用户密码重置</td>
                                            <td>可以重置用户的密码</td>
                                            <td><input type="checkbox" name="xqjz"></td>
                                        </tr>
                                        <tr>
                                            <td>统计查询权限</td>
                                            <td>可以查询并统计报表信息</td>
                                            <td><input type="checkbox" name="qx" value="tjcx_qx"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <button class="btn" type="submit" style="width: 80px;margin-left: 40%">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>