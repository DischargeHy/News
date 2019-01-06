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
		<a>新闻管理</a>
		<%if(session.getAttribute("UserType").toString().equals("3")){ %>
		<a href="BSManage/UserManage.jsp?page=1">用户管理</a>
		<%} %>
		<a href="BSManage/commentManage.jsp?page=1">留言管理</a>
	<%if (session.getAttribute("UserAccount") != null) {	
    		String UserAccount=(String)session.getAttribute("UserAccount"); 
    		String UserType=session.getAttribute("UserType").toString();
    		String UserId=session.getAttribute("UserId").toString();
    %>   		
    		<label>&nbsp;您好：</label><a href="UManage/UserMessageManage.jsp"><%=UserAccount %></a>
    		<a class="text-primary" href="index.jsp?logout=1">登出</a>
    <%
    	}else{
    %>
		<a href="Login.jsp">登陆</a> 
    <%		
    	}
    %>
	</div>
	<div style="margin-top: 30px; width: 100%"><!-- 主体外部DIV开始 -->
		<div style="float: left;border: 1px solid;">
			<p><a>新闻查询管理</a></p>
			<p><a href="BSManage/NewsTypeManage.jsp?page=1">分类管理</a></p>
			<%if(session.getAttribute("UserType").equals(3)){ %><!-- 管理员才能进入审核界面 -->
			<p><a href="BSManage/NewsExamine.jsp?page=1">新闻审核</a></p>
			<%} %>
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
			<div><form method="post" action="BSManage/NewsManage.jsp"><!-- 搜索框 -->
					<input type="hidden" value="1" name="page">
					<input type="text" name="search" value="<%=request.getParameter("search")%>">
					<input type="submit" value="搜索">
			</form></div>
			<%
				NewsManage nm = new NewsManage();
				int userId =(Integer)session.getAttribute("UserId");
				int userType = (Integer)session.getAttribute("UserType");
				String NewsPage = request.getParameter("page");
				ArrayList list = null;
				int page_num = 0;//总页数
				int allPage = 0;//总行数
				String search = request.getParameter("search");
				if(userType==2){
					if(search==null||search.equals("null")){
						list = nm.showNewsList(userId, NewsPage);/*通过用户ID查询文章（小编）  */
						allPage = nm.getNewsPage(userId);
					}
					else{
						String NewsTitle = request.getParameter("search");//通过搜索给出数据
						list = nm.showNewsList(userId, NewsTitle, NewsPage);
						allPage = nm.getNewsPage(userId, NewsTitle);
					}
				}
				else if(userType==3){
					if(search==null||search.equals("null")){
						list = nm.showNewsList(NewsPage);
						allPage = nm.getNewsPage();
					}
					else{
						String NewsTitle = request.getParameter("search");//通过搜索给出数据（管理员）
						list = nm.showNewsList(NewsTitle, NewsPage);
						allPage = nm.getNewsPage(NewsTitle);
					}
				}
				page_num = allPage/6;
				if(allPage%6!=0){
					page_num+=1;
				}
		       	int p1 = Integer.parseInt(request.getParameter("page")); 
		        p1=p1-1;
		        int p2 = Integer.parseInt(request.getParameter("page")); 
		        p2=p2+1;
				for (int i = 0; i < list.size(); i++) {
				News news = (News)list.get(i);// 有以下NewsId,NewsTitle,CreateTime,NewsTypeName,UserName
			%>
				
				<tr>
					<td><a href="#<%=news.getNewsId()%>"><%=news.getNewsTitle()%></a></td>
					<td><%=news.getNewsTypeName()%></td>
					<td><%=news.getUserName()%></td>
					<td><%=news.getCreateTime()%></td>
					<td>
						<%if(userType!=3){ %>
						<form action="BSManage/NewsEdit.jsp" method="post">
							<input type="hidden" value="<%=news.getNewsId()%>" name="NewsId">
							<input type="submit" value="编辑">
						</form>
						<%} 
						else{
						%>
						<form action="updateNewsExamine" method="post">
							<input type="hidden" name="News" value="News">
							<input type="hidden" name="state" value="2">
							<input type="hidden" name="search" value="<%=search%>">
							<input type="hidden" name="page" value="<%=NewsPage%>">
							<input type="hidden" value="<%=news.getNewsId()%>" name="NewsId">
							<input type="submit" value="重审">
						</form>
						<%}%>
						<form action="updateNewsServlet" method="post">
							<input type="hidden" value="<%=news.getNewsId()%>" name="NewsId">
							<input type="hidden" value="delete" name="edit">
							<input type="submit" value="删除">
						</form>
					</td>
				</tr>
			<%} %>
		        <tr>
		        	<td colspan="4">
		        	<%if(p1>=1){ %>
		        		<a id="up" href="BSManage/NewsManage.jsp?page=<%=p1%>&search=<%=search%>">上一页</a>
		        	<%} %>
		        		<%for(int i = 1 ; i <= page_num ; i++){%>
		        			<%if(Integer.parseInt(request.getParameter("page"))!=i){%><!-- 不是当前页页码则是超链接跳转 -->
		        				<a href="BSManage/NewsManage.jsp?page=<%=i%>&search=<%=search%>"><%=i %></a>
		        			<%}
		        			else{%>
		        				<a><%=i %></a>
		        			<%}%>
		        		<%}%>
		        		<%if(p2<=page_num){ %>
		        	 	<a id="down" href="BSManage/NewsManage.jsp?page=<%=p2 %>&search=<%=search%>">下一页</a>
		        	 	<%} %>
		        	</td>
		        </tr>
			</table>
		</div><!-- 新闻列表结束 -->
	</div><!-- 主体外部DIV结束 -->
</body>
</html>