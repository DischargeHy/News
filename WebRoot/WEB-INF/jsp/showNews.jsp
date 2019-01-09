<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${news.getNewsTitle()}</title>
<script src="${pageContext.request.contextPath}/ck5/document/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div id="head" class="table-info">
	<%
		request.setCharacterEncoding("utf-8");
		int Page=1;
		if(request.getParameter("page")!=null){
			Page = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("logout")!=null){//如果进入页面logout有值传入
			session.removeAttribute("UserAccount");//清空session	
			session.removeAttribute("UserType");
			session.removeAttribute("UserId");
		}
    	if (session.getAttribute("UserAccount") != null) {	
    		String UserAccount=(String)session.getAttribute("UserAccount"); 
    		String UserType=session.getAttribute("UserType").toString();
    		String UserId=session.getAttribute("UserId").toString();
    %>   		
    		<label>&nbsp;您好：</label><a href="UManage/UserMessageManage.jsp"><%=UserAccount %></a>
    		<a class="text-primary" href="index.jsp?logout=1">登出</a>
    		<label>&nbsp;&nbsp;|</label>
    		<label>您的用户类型是：</label><%=UserType %>
    		<label>您的用户Id是：</label><%=UserId %>
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

<div>
	<jsp:include page="/WEB-INF/template/newsContent.jsp"></jsp:include>
</div>
<div style="margin: 0 auto; width: 200px;">
	<jsp:include page="/WEB-INF/template/comment.jsp"></jsp:include>
</div>
</body>
</html>