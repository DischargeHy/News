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
</body>
</html>