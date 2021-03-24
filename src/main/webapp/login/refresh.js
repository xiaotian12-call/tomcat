$(document).ready(function(){
	$("#shuaxin").click(function (){
		$("#shuaxin").attr("src","login/randCode.jsp?"+Math.random());
	});
});