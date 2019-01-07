<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="head" class="table-info"><!--头部div开始  -->
	<%
		request.setCharacterEncoding("utf-8");
		
		if(request.getParameter("logout")!=null){//如果进入页面logout有值传入
			session.removeAttribute("UserAccount");//清空session	
			session.removeAttribute("UserType");
			session.removeAttribute("UserId");
		}
		String UserType="1";
		String UserAccount=null;
		String UserId=null;
    	if (session.getAttribute("UserId") != null) {	
    		UserId=session.getAttribute("UserId").toString();
    		UserType=session.getAttribute("UserType").toString();
    		UserAccount=(String)session.getAttribute("UserAccount");
    		//如果是管理员点击个人中心
    		if(UserType.equals("3")){
    			response.sendRedirect("../BSManage/NewsManage.jsp?page=1");
    		}
    %>   		
    		<label>&nbsp;您好：</label><a href=""><%=UserAccount %></a>
    		<a class="text-primary" href="../index.jsp?logout=1">登出</a>
    		<label>&nbsp;&nbsp;|</label>
    		<label>您的用户类型是：</label><%=UserType %>
    		<label>您的用户id是：</label><%=UserId %>
    <%
    	}else{
    %>
		<a href="Login.jsp">登陆</a> 
		<label>&nbsp;|&nbsp;</label>
		<a href="Register.jsp">注册</a>
    <%		
    	}
    %>
    </div><!--头部div结束  -->
	<div style="margin-top: 30px; width: 100%">
		<%
			NewsManage nm=new NewsManage();
			ArrayList list=nm.showUserByUserId(UserId);
			User user=(User)list.get(0);
		 %>
		<!-- 主体外部DIV开始 -->
		<div style="float: left; border: 1px solid;">
			<p><a href="UserMessageManage.jsp">个人信息管理（普通用户/小编）</a></p>
			<p><a>密码管理（普通用户/小编）</a></p>
			<p><a href="#">查看回复（普通用户/小编）</a></p>
			
			<%
				//当小编打开个人中心时才显示评论管理选项
				if(UserType.equals("2")){
			%>
			<p><a href="${pageContext.request.contextPath}/EditNews">发布新闻（小编）</a></p>
			<p><a href="#">我发布的新闻（小编）</a></p>
			<p><a href="UManage/UserCommentManage.jsp">评论管理（小编用）</a></p>
			<%} %>
		</div>
		<div style="float: left; border: 1px solid; width: 70%">
			<!-- 个人信息列表开始 -->
			<form method="post" action="../UserPassUpdateServlet">
				<table width="277" height="181" border="1" cellspacing="0">
					<tr>
						<td colspan="2"><div align="center">
								<span class="STYLE1">密码修改</span>
							</div></td>
					</tr>
					<tr>
						<td width="70">原密码:</td>
						<td width="191"><label> <input type="text" name="txt_uRealPass" value="" placeholder="请输入原密码">
						</label></td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><label> <input type="text" name="txt_uPass" value="" placeholder="请输入新密码">
						</label></td>
					</tr>
					<tr>
						<td>在次输入新密码:</td>
						<td><label> <input type="text" name="txt_ReuPass" value="" placeholder="请再次输入新密码">
						</label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><label> <input type="submit" name="Submit" value="修改"> 
								<input type="hidden" name="userId" value="<%=user.getUserId()%>">
						</label>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 个人信息列表结束 -->
	</div>
	<!-- 主体外部DIV结束 -->
</body>
</html>