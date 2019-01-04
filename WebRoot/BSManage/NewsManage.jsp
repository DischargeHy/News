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
			<p><a>新闻查询管理</a></p>
			<p><a href="BSManage/NewsTypeManage.jsp">分类管理</a></p>
			<p><a href="#">新闻发布</a></p>
		</div>
		<div style="float: left;border: 1px solid; width:70%"><!-- 新闻列表开始 -->
			<table style="border: 1px solid;width: 100%">
			<tr>
				<td>标题</td>
				<td>类型</td>
				<td>作者</td>
				<td>发表时间</td>
				<td>操作</td>
			</tr>
			<%
				NewsManage nm = new NewsManage();
				int userId =(Integer)session.getAttribute("UserId");
				int userType = (Integer)session.getAttribute("UserType");
				String NewsPage = request.getParameter("page");
				ArrayList list = null;
				int page_num = 0;
				int allPage = 0;
				if(userType==2){
					list = nm.showNewsList(userId, NewsPage);/*通过用户ID查询文章（小编）  */
					allPage = nm.getNewsPage(userId);
					
				}
				else if(userType==3){
					list = nm.showNewsList(NewsPage);
					allPage = nm.getNewsPage();
				}
				page_num = allPage/6;
				if(allPage%6!=0){
					page_num+=1;
				}
				for (int i = 0; i < list.size(); i++) {
				News news = (News)list.get(i);
			%>
				<tr>
					<td><%=news.getNewsTitle()%></td>
					<td><%=news.getNewsTypeName()%></td>
					<td><%=news.getUserName()%></td>
					<td><%=news.getCreateTime()%></td>
					<td>
						<form action="BSManage/NewsEdit.jsp" method="post">
							<input type="hidden" name="<%=news.getNewsId()%>">
							<input type="submit" value="编辑">
						</form>
						<form action="updateNewsServlet" method="post">
							<input type="hidden" value="<%=news.getNewsId()%>" name="NewsId">
							<input type="hidden" value="delete" name="edit">
							<input type="submit" value="删除">
						</form>
					</td>
				</tr>
			<%} %>
			<%
				
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
		        			<%if(Integer.parseInt(request.getParameter("page"))!=i){%>
		        				<a href="BSManage/NewsManage.jsp?page=<%=i%>"><%=i %></a>
		        			<%}
		        			else{%>
		        				<a><%=i %></a>
		        			<%}%>
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