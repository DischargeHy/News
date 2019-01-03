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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<div id="head">
		<a href="Login.jsp">登陆</a> 
		<label>&nbsp;|&nbsp;</label>
		<a href="Register.jsp">注册</a>
  	</div>
  	<div id="NewsType">
  		<ul>
  			<%
  				NewsManage nm = new NewsManage();
				ArrayList list = nm.showNewsType();
				int NewsTypeId=1;
				for (int i = 0; i < list.size(); i++) {
					NewsType newstype = (NewsType)list.get(i);
					
  			 %>
			<li>
				<a href="index.jsp?NewsTypeId=<%=newstype.getNewsTypeId() %>"><%=newstype.getNewsTypeName() %></a>
			</li>
			<%
  				}
  			 %>
		</ul>
  	</div>
  	
    		
  </body>
</html>
