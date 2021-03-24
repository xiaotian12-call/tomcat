<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.ztree.core.min.js"></script>
<style type="text/css">
#tree {
	width: 25%;
	float: left;
}

#xinxi {
	width: 75%;
	float: left;
	height: 200px;
}
</style>
</head>

<body>
	<script type="text/javascript">
		var zTreeObj;
		// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
		var setting = {
			async : {
				enable : true,
				type : "post",
				url : "tree",
				autoParam : ["id"]
			}
		}
		// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）src="tree?method=xinxi&id=6" 

		$(document).ready(function() {
			zTreeObj = $.fn.zTree.init($("#treeDemo"), setting);
		});
	</script>

<div id="tree">
	<ul id="treeDemo" class="ztree"></ul>
</div>
<div id="xinxi">
	<iframe name="rigth" width="100%" height="200px"></iframe>
</div>
</body>
</html>