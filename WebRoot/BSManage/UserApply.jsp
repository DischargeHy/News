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
	String ApplyPage = request.getParameter("page");
	String search = request.getParameter("search");
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
		<a href="BSManage/NewsManage.jsp?page=1">新闻管理模块</a>
		<a href="BSManage/UserManage.jsp?page=1">用户管理模块</a>
		<a href="#">留言管理模块</a>
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
			<p><a href="BSManage/UserManage.jsp?page=1">用户权限管理</a></p>
			<p><a>用户职位申请</a></p>
		</div>
		<div style="float: left;border: 1px solid; width:70%"><!-- 新闻列表开始 -->
			<table style="border: 1px solid;width: 100%">
			<tr>
				<td>用户头像</td>
				<td>用户昵称</td>
				<td>用户邮箱</td>
				<td>申请时间</td>
				<td colspan="2">操作</td>
			</tr>
			<%
				ArrayList list = null;//用户列表
				if(userType!=3){
					response.sendRedirect("BSManage/NewsManage.jsp?page=1");
				}
				list = nm.showApply(ApplyPage);//根据页数显示内容
				allPage = nm.getApplyPage();
				page_num = allPage/10;
				if(allPage%10!=0){
					page_num+=1;
				}
		       	int p1 = Integer.parseInt(request.getParameter("page")); 
		        p1=p1-1;
		        int p2 = Integer.parseInt(request.getParameter("page")); 
		        p2=p2+1;
				for (int i = 0; i < list.size(); i++) {
				ApplyList al = (ApplyList)list.get(i);
			%>
				<tr>
					<td><img src="<%=al.getUserHead()%>"></td>
					<td><%=al.getUserName()%></td>
					<td><%=al.getUserEMail()%></td>
					<td><%=al.getTime()%></td>
					<td>
						<form action="updateApplyServlet" method="post">
							<input type="hidden" value="<%=al.getApplyId() %>" name="ApplyId">
							<input type="hidden" value="<%=al.getUserId() %>" name="UserId">
							<input type="hidden" value="1" name="change">
							<input type="submit" value="允许">
						</form>
					</td>
					<td>
						<form action="updateApplyServlet" method="post">
							<input type="hidden" value="<%=al.getApplyId() %>" name="ApplyId">
							<input type="hidden" value="<%=al.getUserId() %>" name="UserId">
							<input type="hidden" value="0" name="change">
							<input type="submit" value="拒绝">
						</form>
					</td>
				</tr>
			<%} %>
		        <tr>
		        	<td colspan="4">
		        	<%if(p1>=1){ %>
		        		<a id="up" href="BSManage/UserApply.jsp?page=<%=p1%>">上一页</a>
		        	<%} %>
		        		<%for(int i = 1 ; i <= page_num ; i++){%>
		        			<%if(Integer.parseInt(request.getParameter("page"))!=i){%><!-- 不是当前页页码则是超链接跳转 -->
		        				<a href="BSManage/UserApply.jsp?page=<%=i%>"><%=i %></a>
		        			<%}
		        			else{%>
		        				<a><%=i %></a>
		        			<%}%>
		        		<%}%>
		        		<%if(p2<=page_num){ %>
		        	 	<a id="down" href="BSManage/UserApply.jsp?page=<%=p2 %>">下一页</a>
		        	 	<%} %>
		        	</td>
		        </tr>
			</table>
		</div><!-- 用户列表结束 -->
	</div><!-- 主体外部DIV结束 -->
</body>
</html>