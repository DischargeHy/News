<%@page import="entity.NewsType"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<body>
	<div style="width: 100%;border: 1px solid;">
		<a href="#">新闻管理模块</a>
		<a href="#">用户管理模块</a>
		<a href="#">留言管理模块</a>
	</div>
	<div style="margin-top: 30px; width: 100%"><!-- 主体外部DIV开始 -->
		<div style="float: left;border: 1px solid;">
			<p><a href="#">新闻查询管理</a></p>
			<p><a>分类管理</a></p>
			<p><a href="#">新闻发布</a></p>
		</div>
		<div style="float: left;border: 1px solid;"><!-- 新闻列表开始 -->
			<table>
			<%
				NewsManage nm = new NewsManage();
				ArrayList list = nm.showNewsType();
				for (int i = 0; i < list.size(); i++) {
				NewsType newstype = (NewsType)list.get(i);
			%>
				
			<%} %>
			</table>
		</div><!-- 新闻列表结束 -->
	</div><!-- 主体外部DIV结束 -->
</body>
</html>