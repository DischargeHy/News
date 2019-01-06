<%@page import="entity.ApplyList"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../UJS/Apply.js"></script><!-- 申请小编显示判断JS -->
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
			<p><a>个人信息管理（普通用户/小编）</a></p>
			<p><a href="UserPassManage.jsp">密码管理（普通用户/小编）</a></p>
			<p><a href="#">查看回复（普通用户/小编）</a></p>
			<p><a href="#">发帖（小编）</a></p>
			
			<%
				//当小编打开个人中心时才显示评论管理选项
				if(UserType.equals("2")){
			%>
			<p><a href="UManage/UserCommentManage.jsp">评论管理（小编用）</a></p>
			<%} %>
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
						<td>
						<%
							if(user.getUserBirthday()==null){
						 %>
						<label> 
							<select name="year">
								<%for(int i=1900;i<2020;i++){%>
									<option><%=i %></option>
								<%}%>
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
									for(int i=1;i<32;i++){
								 %>
									<option><%=i %></option>
								<%
									}
								 %>
							</select>
						</label>
						<%}else{
								String Birthday=user.getUserBirthday();
								int Year=Integer.parseInt(Birthday.substring(0, 4));
								int Month=Integer.parseInt(Birthday.substring(5, 7));
								int Day=Integer.parseInt(Birthday.substring(8, 10));
								
						%>
						<label> 
							<select name="year">
								<%for(int i=1900;i<2020;i++){
									if(i==Year){
								%>
									<option selected="selected"><%=i %></option>
								<%
								}else
								{
								%>
									<option><%=i %></option>
								<% 
								}
								}
								%>
							</select>
							<select name="month">
								<%for(int i=1;i<13;i++){
									if(i==Month){
								%>
									<option selected = "selected"><%=i %></option>
								<%
								}else
								{
								%>
									<option><%=i %></option>
								<% 
								}
								}
								%>
							</select>
							<select name="day">
								<%for(int i=1;i<32;i++){
									if(i==Day){
								%>
									<option selected="selected"><%=i %></option>
								<%
								}else
								{
								%>
									<option><%=i %></option>
								<% 
								}
								}
								%>
							</select>
						</label>	
						<%} %>
						</td>
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
						<%
							ApplyList al=nm.showApplyListByUserId(user.getUserId());
							if(al==null){
						%>
							<input id="submit" type="button" value="申请成为小编" class="submit_button" onclick="show_apply()"/></td>	
						<%	
							}else{
								if(al.getState().equals("申请中")){
						%>
							<label>小编申请审核中...</label>
						<%
								}else if(al.getState().equals("申请失败")){
						%>
							<label>小编申请失败...</label>
							<input id="submit" type="button" value="重新申请" class="submit_button" onclick="show_apply()"/></td>
						<%		
								}else{	}
							}
						} %>
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
						<td>&nbsp;</td>
						<td><label> <input type="submit" name="Submit" value="修改"> 
								<input type="hidden" name="userId" value="<%=user.getUserId()%>">
						</label>
						</td>
					</tr>
				</table>
			</form>
			<div id="apply" style="display: none"><!-- 点击申请成为小编才出现 -->
								<form action="../AuthorApplyServlet" method="post" id="applyform">
									<input type="text" placeholder="请输入申请理由"  name="txt_apply" form="applyform">
									<input type="hidden" name="userId" value="<%=user.getUserId()%>" form="applyform">
									<centetr>
										
										<input id="yes" type="submit" value="确认" style="width: 75px;text-indent:0px;margin-top: 0px;" form="applyform" >
    	    							<input id="no" type="button" value="取消" style="width: 75px;text-indent:0px;margin-top: 0px;"onclick="hidden_apply()">
    	    						</centetr>
								</form>
							</div><!-- 申请成为小编结束 -->
		</div>
		<!-- 个人信息列表结束 -->
	</div>
	<!-- 主体外部DIV结束 -->
</body>
</html>