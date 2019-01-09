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
	<!--头部开始 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航栏  -->
				<header>
					<div class="top center">
						<div class="left fl">
							<ul>
								<li><a href="../index.jsp" style="margin-left: -30px;">首页</a></li>
								<li>|</li>
								<li><a href="">问题反馈</a></li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="right fr">

							<div class="fr">
								<%
									request.setCharacterEncoding("utf-8");

									if (request.getParameter("logout") != null) {//如果进入页面logout有值传入
										session.removeAttribute("UserAccount");//清空session	
										session.removeAttribute("UserType");
										session.removeAttribute("UserId");
									}
									String UserType = null;
									String UserAccount = null;
									String UserId = null;
									
									NewsManage nm=new NewsManage();
									ArrayList list=null;//用于存放用户信息
									User user=null;
							
									
									if (session.getAttribute("UserId") != null) {
										UserId = session.getAttribute("UserId").toString();
										UserType = session.getAttribute("UserType").toString();
										UserAccount = (String) session.getAttribute("UserAccount");
										
										list=nm.showUserByUserId(UserId);
										user=(User)list.get(0);
										
										//如果是管理员点击个人中心
										if (UserType.equals("3")) {
											response.sendRedirect("../BSManage/NewsManage.jsp?page=1");
										}
								%>
								<ul>
									<li><a href="./UManage/UserMessageManage.jsp"><img class="am-circle" src="<%=user.getUserHead()%>" width="25px" height="25px" style="margin-top: -2px;margin-right: 10px;"><%=UserAccount%></a></li>
									<li>|</li>
									<li><a href="./index.jsp?logout=1">登出</a></li>
								</ul>
								<%
									} else {
								%>
								<ul>
									<li><a href="./Login.jsp">登录</a></li>
									<li>|</li>
									<li><a href="./Register.jsp">注册</a></li>
								</ul>
								<%
						}
					%>
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</header>
				<!--顶部导航栏结束  -->
			</div>
		</article>
	</header>
	<!--头部结束 -->
	<br />
    
    <div><!--新闻主要内容开始  -->
    <table width="100%" border="1" cellspacing="0">
	
	</table>
	</div><!--新闻主要内容结束  -->
	<br/>
	<div><!--回复主要内容开始 -->
	<form action="ReplyPostServlet" method="post" name="ReplyPost">
		<table width="100%" border="1" cellspacing="0">
			
		</table>
		
	</form>
	</div><!--回复主要内容结束  -->
    
</body>
</html>