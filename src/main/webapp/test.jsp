<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<% String path = request.getContextPath();
%>

<html> 
   <head> 
       <title>JS限制Textarea文本域字符个数</title> 
       <meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 

       </head> 
   <body> 
 <table class="table table-bordered table-hover">
    <!-- class="table table-bordered" -->
    <thead>
    <tr>
        <th>需求编号</th>
        <th>技术需求名称</th>
        <th>机构属性</th>
        <th>所在地域</th>
        <th>机构全称</th>
        <th>科技活动类型</th>
        <th>需求状态</th>

        <th colspan="3">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${pageBean.list}" varStatus="i">
        <tr>
            <td>${i.index+1 }</td>
            <td><a href="xvqiu?method=queryById0&wjid=${item.wjid}">${item.jsxqmc}</a></td>
            <td>${item.jgsx}</td>
            <td>${item.szdy}</td>
            <td>${item.jgmc}</td>
            <td>${item.yjlx}</td>
            <td>
                <c:if  test="${item.sfsh == 0}">
                    未审核
                </c:if>
                <c:if  test="${item.sfsh == 1}">
                    已审核
                </c:if>
            </td>
            <td><a href="xvqiu?method=queryById0&wjid=${item.wjid}">查看</a></td>
            <td><a href="xvqiu?method=changexq&wjid=${item.wjid}">修改</a></td>
            <td><a onclick="deletexiqiu(${item.wjid})">删除</a></td>

        </tr>
    </c:forEach>
    </tbody>
</table>
   </body> 
   </html> 
