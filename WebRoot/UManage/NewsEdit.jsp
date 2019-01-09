<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>修改</title>

<link href="./assets3/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="./assets3/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="./assets3/css/personal.css" rel="stylesheet" type="text/css">
<link href="./assets3/css/stepstyle.css" rel="stylesheet" type="text/css">



<link rel="icon" type="image/png" href="assets1/i/tubiao.png">
<link rel="stylesheet" href="./assets3/assets/css/amazeui.min.css">
<link rel="stylesheet" href="./assets3/assets/css/app.css">
<link rel="stylesheet" href="./assets3/assets/css/style.css">
<style>
li {
	list-style: none;
}
</style>
</head>
<body id="blog" style="background-color: #F1F2F3;">
	<!--头部开始 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航栏  -->
				<header>
					<div class="top center">
						<div class="left fl">
							<ul>
								<li><a href="./index.jsp" style="margin-left: -30px;">首页</a></li>
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
									ArrayList list=null;
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
									<li><a href="./UManage/UserMessageManage.jsp"><img class="am-circle" src="./img/java.png" width="25px" height="25px" style="margin-top: -2px;margin-right: 10px;"><%=UserAccount%></a></li>
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

	<div class="center">
		<div class="col-main">
			<!-- 菜单栏开始 -->
			<div style="float: left;">
				<ul class="am-list am-list-border" style="width: 110px;">
					<li><a href="./UManage/UserMessageManage.jsp" style="font-size: 15px;"><i class="am-icon-home am-icon-fw"></i> 个人中心</a></li>
					<li><a href="./UManage/UserMessageManage.jsp" style="font-size: 13px;"><i class="am-icon-user am-icon-fw"></i> 个人资料</a></li>
					<li><a href="./UManage/UserPassManage.jsp" style="font-size: 13px;"> <i class="am-icon-book am-icon-fw"></i> 密码管理</a></li>
					<li><a href="#" style="font-size: 13px;"><i class="am-icon-comments-o am-icon-fw"></i> 查看回复</a></li>
					<%
						//当小编打开个人中心时才显示评论管理选项
						if (UserType.equals("2")) {
					%>
					<li><a href="${pageContext.request.contextPath}/EditNews" style="font-size: 13px;"><i class="am-icon-pencil am-icon-fw"></i> 发布新闻</a></li>
					<li><a href="#" style="font-size: 13px;"><i class="am-icon-list am-icon-fw"></i> 我的新闻</a></li>
					<li><a href="../UManage/UserCommentManage.jsp" style="font-size: 13px;"><i class="am-icon-dashcube am-icon-fw"></i> 评论管理</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<!-- 菜单栏结束 -->
			<div class="main-wrap" style="margin-left: -30px;">

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">发布新闻</strong> / <small>NewsEdit</small>
					</div>
				</div>
				<hr />
				<!--发布新闻主要内容开始  -->
				<div>
<<<<<<< HEAD
					<jsp:include page="/WEB-INF/template/ck5.jsp"></jsp:include>
=======
>>>>>>> branch 'master' of https://github.com/DischargeHy/News
				</div>
				<!-- 发布新闻主要内容结束 -->
				<br />
			</div>
			<!--底部-->
			<div class="footer">
				<div align="center"></div>


			</div>
		</div>
	</div>
	<!-- 底部开始 -->
	<footer class="blog-footer" style="margin-top: 10px;">
		<div class="am-g am-g-fixed blog-fixed blog-footer-padding center">
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h3>工作室简介</h3>
				<p class="am-text-sm">
					这是一个有趣而富有灵魂的网站。<br> 想要了解的都能在这里。 <br> 不论你对什么感兴趣。 <br> 你都会从中找到乐趣。
				</p>
			</div>
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h3>Credits</h3>
				<p>我们追求卓越，然时间、经验、能力有限。本工作室有很多不足的地方，希望大家包容、不吝赐教，给我们提意见、建议。感谢你们！</p>
			</div>
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h3>Heroes</h3>
				<p>
				<ul>
					<li>jQuery</li>
					<li>Zepto.js</li>
				</ul>
				</p>
			</div>
		</div>
		<div class="blog-text-center">Copyright© 2019 米窝工作室 版权所有 All rights reserved</div>
	</footer>
	<!-- 底部结束 -->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<script src="assets/js/amazeui.min.js"></script>
</body>
<script src="./assets3/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="./assets3/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
</html>