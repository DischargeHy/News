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
	<div id="head" class="table-info">
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
    %>   		
    		<label>&nbsp;您好：</label><a href=""><%=UserAccount %></a>
    		<a class="text-primary" href="index.jsp?logout=1">登出</a>
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
    </div>
	<div style="margin-top: 30px; width: 100%">
		<%
			NewsManage nm=new NewsManage();
			ArrayList list=nm.showUserByUserId(UserId);
			User user=(User)list.get(0);
		 %>
		<!-- 主体外部DIV开始 -->
		<div style="float: left; border: 1px solid;">
			<p><a>个人信息管理</a></p>
			<p><a href="UManage/NewsTypeManage.jsp">评论管理</a></p>
			<p><a href="#">回复查看</a></p>
		</div>
		<div style="float: left; border: 1px solid; width: 70%">
			<!-- 个人信息列表开始 -->
			<form method="post" action="../UserMessageUpdateServlet">
				<table width="277" height="181" border="1" cellspacing="0">
					<tr>
						<td colspan="2"><div align="center">
								<span class="STYLE1">个人信息修改</span>
							</div></td>
					</tr>
					<tr>
						<td width="70">用户账号</td>
						<td width="191"><label> 
						<input type="text" name="txt_uAccount" value="<%=user.getUserAccount()%>"  readonly="readonly">

						</label></td>
					</tr>
					<tr>
						<td>用户昵称:</td>
						<td><label> <input type="text" name="txt_uName" value="<%=user.getUserName()%>">
						</label></td>
					</tr>
					<tr>
						<td>出生日期:</td>
						<td><label> <%-- <input type="text" name="booktype" value="<%=book.getBType() %>"> --%>
								<select name="year">
								<%
									for(int i=1900;i<2020;i++){
								 %>
									<option><%=i %></option>
								<%
									}
								 %>
							</select>
							<select name="month">
								<%
									for(int i=1;i<13;i++){
								 %>
									<option><%=i %></option>
								<%
									}
								 %>
							</select>
							<select name="day">
								<%
									for(int i=1;i<31;i++){
								 %>
									<option><%=i %></option>
								<%
									}
								 %>
							</select>
						</label></td>
					</tr>
					<tr>
						<td>用户邮箱:</td>
						<td><label> <input type="text" name="txt_uemail"
								value="<%=user.getUserEMail()%>">
						</label></td>
					</tr>
					<tr>
						<td>用户类型:</td>
						<td>
						<label> 
						<% if(UserType.equals("1")){%>
							<input type="text" name="usertypeName" value="普通用户" readonly="readonly">
							<a href="#">申请成为小编</a>
						<%} %>
						<% if(UserType.equals("2")){%>
							<input type="text" name="usertypeName" value="小编" readonly="readonly">
						<%} %>
						</label>
						</td>
					</tr>
					
					<tr>
						<td>性别:</td>
						<td><label> 
						<% if(user.getUserSex()==1){%>
							<input name="rdo_gender" type="radio" value="0" />保密
							<input name="rdo_gender" type="radio" value="1" checked="checked" />女
  		    				<input name="rdo_gender" type="radio" value="2" />男
						<%} else if(user.getUserSex()==2){
						%>
							<input name="rdo_gender" type="radio" value="0" />保密
							<input name="rdo_gender" type="radio" value="1" />女
  		    				<input name="rdo_gender" type="radio" value="2" checked="checked"/>男
						<%
						}
						else{
						%>
							<input name="rdo_gender" type="radio" value="0" checked="checked"/>保密
							<input name="rdo_gender" type="radio" value="1" />女
  		    				<input name="rdo_gender" type="radio" value="2" />男
						<%
						}
						%>
						
  		    			</label></td>
					</tr>
					<tr>
						<td>用户头像:</td>
						<td><label> <input type="file" name="userHead" />
						</label></td>
					</tr>
					<tr>
						<td>原密码:</td>
						<td><label> <input type="text" name="txt_uRealPass" value="" placeholder="若不修改密码请勿输入内容">
						</label></td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><label> <input type="text" name="txt_uPass" value="" placeholder="若不修改密码请勿输入内容">
						</label></td>
					</tr>
					<tr>
						<td>在次输入新密码:</td>
						<td><label> <input type="text" name="txt_ReuPass" value="" placeholder="若不修改密码请勿输入内容">
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