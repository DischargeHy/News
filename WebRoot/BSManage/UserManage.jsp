<%@page import="entity.User"%>
<%@page import="entity.News"%>
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
		<a href="BSManage/NewsManage.jsp?page=1">新闻管理模块</a>
		<a href="BSManage/UserManage.jsp?page=1">用户管理模块</a>
		<a href="#">留言管理模块</a>
	</div>
	<div style="margin-top: 30px; width: 100%"><!-- 主体外部DIV开始 -->
		<div style="float: left;border: 1px solid;">
			<p><a>用户权限管理</a></p>
			<p><a href="#"></a></p>
		</div>
		<div style="float: left;border: 1px solid; width:70%"><!-- 新闻列表开始 -->
			<table style="border: 1px solid;width: 100%">
			<tr>
				<td>用户头像</td>
				<td>用户账号</td>
				<td>用户名</td>
				<td>用户邮箱</td>
				<td>权限管理</td>
			</tr>
			<%
				NewsManage nm = new NewsManage();
				int userId =(Integer)session.getAttribute("UserId");
				int userType = (Integer)session.getAttribute("UserType");
				String NewsPage = request.getParameter("page");
				if(userType!=3){
					response.sendRedirect("BSManage/NewsManage.jsp?page=1");
				}
				ArrayList list = nm.showUser();/*显示所有用户  */
				for (int i = 0; i < list.size(); i++) {
				User user = (User)list.get(i);
				if(user.getUserAccount().equals("admin")){
					continue;
				}
			%>
			 	<tr>
			 		<td><img src="<%=user.getUserHead()%>"></td>
			 		<td><%=user.getUserAccount() %></td>
			 		<td><%=user.getUserName() %></td>
			 		<td><%=user.getUserEMail() %></td>
			 		<td>
			 			<form>
			 				<input type="hidden" value="<%=user.getUserId()%>">
			 				<select name="UserType">
			 					<option value="1" <%if(user.getUserType()==1){ %>selected="selected"<%} %>>普通用户</option>
			 					<option value="2" <%if(user.getUserType()==2){ %>selected="selected"<%} %>>编辑人员</option>
			 					<option value="3" <%if(user.getUserType()==3){ %>selected="selected"<%} %>>管理员</option>
			 				</select>
			 				<input type="submit" value="确认">
			 			</form>
			 		</td>
			 	</tr>
			<%} %>
			<%
				int page_num = nm.getNewsPage(userId)/6;
				if(nm.getNewsPage(userId)%6!=0){
					page_num+=1;
				}
		       	int p1 = Integer.parseInt(request.getParameter("page")); 
		        p1=p1-1;
		        int p2 = Integer.parseInt(request.getParameter("page")); 
		        p2=p2+1;
		    %>
		        <tr>
		        	<td colspan="4">
		        	<%if(p1>=1){ %>
		        		<a id="up" href="BSManage/NewsManage.jsp?page=<%=p1%>">上一页</a>
		        	<%} %>
		        		<%for(int i = 1 ; i <= page_num ; i++){%>
		        		if(i!=Integer.parseInt(request.getParameter("page")){
		        			<a href="BSManage/NewsManage.jsp?page=<%=i%>"><%=i %></a>
		        		}
		        		else{
		        			<a><%=i %></a>
		        		}
		        		<%}%>
		        		<%if(p2<=page_num){ %>
		        	 	<a id="down" href="BSManage/NewsManage.jsp?page=<%=p2 %>">下一页</a>
		        	 	<%} %>
		        	</td>
		        </tr>
			</table>
		</div><!-- 新闻列表结束 -->
	</div><!-- 主体外部DIV结束 -->
</body>
</html>