<%@page import="entity.NewsExamineList"%>
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
			<p><a href="BSManage/NewsManage.jsp?page=1">新闻查询管理</a></p>
			<p><a href="BSManage/NewsTypeManage.jsp">分类管理</a></p>
			<p><a>新闻审核</a></p>
		</div>
		<div style="float: left;border: 1px solid; width:70%"><!-- 审核列表开始 -->
			<table style="border: 1px solid;width: 100%">
			<tr>
				<td>新闻板块</td>
				<td>标题</td>
				<td>作者</td>
				<td>邮箱</td>
				<td>发表时间</td>
				<td>更新时间</td>
				<td colspan="2">操作</td>
			</tr>
			<%
				NewsManage nm = new NewsManage();
				int userId =(Integer)session.getAttribute("UserId");
				int userType = (Integer)session.getAttribute("UserType");
				String ExaminePage = request.getParameter("page");
				ArrayList list = null;
				int page_num = 0;//总页数
				int allPage = 0;//总行数
				String search = request.getParameter("search");
				list = nm.showNewsExamine(ExaminePage);
				allPage = nm.getNewsExaminePage();
				page_num = allPage/6;
				if(allPage%6!=0){
					page_num+=1;
				}
		       	int p1 = Integer.parseInt(request.getParameter("page")); 
		        p1=p1-1;
		        int p2 = Integer.parseInt(request.getParameter("page")); 
		        p2=p2+1;
				for (int i = 0; i < list.size(); i++) {
					NewsExamineList nel = (NewsExamineList)list.get(i);
			%>
				<tr>
					<td><%=nel.getNewsTypeName() %></td>
					<td><a href="<%=nel.getNewsId()%>"><%=nel.getNewsTitle() %></a></td>
					<td><%=nel.getUserName() %></td>
					<td><%=nel.getUserEMail() %></td>
					<td><%=nel.getCreateTime() %></td>
					<td><%=nel.getUpdateTime() %></td>
					<td><form action="updateNewsExamine" method="post">
						<input type="hidden" value="<%=nel.getNewsId()%>" name="NewsId">
						<input type="hidden" value="1" name="state">
						<input type="submit" value="通过">
					</form></td>
					<td><form action="updateNewsExamine" method="post">
						<input type="hidden" value="<%=nel.getNewsId()%>" name="NewsId">
						<input type="hidden" value="2" name="state">
						<input type="submit" value="不通过">
					</form></td>
				</tr>
			<%} %>
		        <tr>
		        	<td colspan="4">
		        	<%if(p1>=1){ %>
		        		<a id="up" href="BSManage/NewsExamine.jsp?page=<%=p1%>">上一页</a>
		        	<%} %>
		        		<%for(int i = 1 ; i <= page_num ; i++){%>
		        			<%if(Integer.parseInt(request.getParameter("page"))!=i){%><!-- 不是当前页页码则是超链接跳转 -->
		        				<a href="BSManage/NewsExamine.jsp?page=<%=i%>"><%=i %></a>
		        			<%}
		        			else{%>
		        				<a><%=i %></a>
		        			<%}%>
		        		<%}%>
		        		<%if(p2<=page_num){ %>
		        	 	<a id="down" href="BSManage/NewsExamine.jsp?page=<%=p2 %>">下一页</a>
		        	 	<%} %>
		        	</td>
		        </tr>
			</table>
		</div><!-- 审核列表结束 -->
	</div><!-- 主体外部DIV结束 -->
</body>
</html>