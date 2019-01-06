<%@page import="entity.CommentReport"%>
<%@page import="entity.ApplyList"%>
<%@page import="entity.User"%>
<%@page import="entity.News"%>
<%@page import="entity.NewsType"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	NewsManage nm = new NewsManage();
	int userId =(Integer)session.getAttribute("UserId");
	int userType = (Integer)session.getAttribute("UserType");
	String ReportPage = request.getParameter("page");
	int page_num = 0;//总页数
	int allPage = 0;//总行数
	String type = "0";
	if(request.getParameter("type")!=null){
		type = request.getParameter("type");
	}
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
		<a href="BSManage/NewsManage.jsp?page=1">新闻管理</a>
		<a href="BSManage/UserManage.jsp?page=1">用户管理</a>
		<a>留言管理</a>
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
		<div style="float: left;border: 1px solid; width:70%"><!-- 举报列表开始 -->
			<table style="border: 1px solid;width: 100%">
			<tr>
				<td>新闻标题</td>
				<td>评论用户</td>
				<td>评论时间</td>
				<td>操作</td>
				<td colspan="2">操作</td>
			</tr>
			<%
				ArrayList list = null;//举报列表
				if(userType==3){
					list = nm.showReport(ReportPage);//根据页数显示所有举报内容
				}
				else{
					list = nm.showReport(ReportPage, userId);
				}
				allPage = nm.getReportPage();
				page_num = allPage/10;
				if(allPage%10!=0){
					page_num+=1;
				}
		       	int p1 = Integer.parseInt(request.getParameter("page")); 
		        p1=p1-1;
		        int p2 = Integer.parseInt(request.getParameter("page")); 
		        p2=p2+1;
				for (int i = 0; i < list.size(); i++) {
				CommentReport cr = (CommentReport)list.get(i);
			%>
				<tr>
					<td><a href="<%=cr.getNewsId()%>"><%=cr.getNewsTitle() %></a></td>
					<td><%=cr.getUserName() %></td>
					<td><%=cr.getCommentTime() %></td>
					<td><form action="updateCommentServlet" method="Post">
						<input type="hidden" value="<%=cr.getCommentId()%>" name="CommentId">
						<input type="hidden" value="1" name="operate">
						<input type="submit" value="删除">
					</form></td>
					<td><form action="updateCommentServlet" method="Post">
						<input type="hidden" value="<%=cr.getCommentId()%>" name="CommentId">
						<input type="hidden" value="0" name="operate">
						<input type="submit" value="取消举报">
					</form></td>
				</tr>
			<%} %>
		        <tr>
		        	<td colspan="4">
		        	<%if(p1>=1){ %>
		        		<a id="up" href="BSManage/CommentManage.jsp?page=<%=p1%>">上一页</a>
		        	<%} %>
		        		<%for(int i = 1 ; i <= page_num ; i++){%>
		        			<%if(Integer.parseInt(request.getParameter("page"))!=i){%><!-- 不是当前页页码则是超链接跳转 -->
		        				<a href="BSManage/CommentManage.jsp?page=<%=i%>"><%=i %></a>
		        			<%}
		        			else{%>
		        				<a><%=i %></a>
		        			<%}%>
		        		<%}%>
		        		<%if(p2<=page_num){ %>
		        	 	<a id="down" href="BSManage/CommentManage.jsp?page=<%=p2 %>">下一页</a>
		        	 	<%} %>
		        	</td>
		        </tr>
			</table>
		</div><!-- 用户列表结束 -->
	</div><!-- 主体外部DIV结束 -->
</body>
</html>