<%@page import="entity.User"%>
<%@page import="entity.News"%>
<%@page import="entity.NewsType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>米窝新闻</title>
<link rel="icon" type="image/png" href="assets1/i/tubiao.png">
<link rel="stylesheet" href="assets1/css/amazeui.min.css">
<link rel="stylesheet" href="assets1/css/app.css">
<link rel="stylesheet" href="assets1/css/style.css">

<script src="assets3/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets3/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script> 
<style>
li {
	list-style: none;
}
</style>
</head>
<body>
	<!--头部开始 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航栏  -->
				<!-- Session信息和用户信息开始 -->
				<% request.setCharacterEncoding("utf-8");
					int Page=1;
					if(request.getParameter("page")!=null){
						Page = Integer.parseInt(request.getParameter("page"));
						}
					if (request.getParameter("logout") != null) {//如果进入页面logout有值传入
							session.removeAttribute("UserAccount");//清空session	
							session.removeAttribute("UserType");
							session.removeAttribute("UserId");
					}
					String UserType = null;
					String UserAccount = null;
					String UserId = null;
					if (session.getAttribute("UserId") != null) {
						UserId = session.getAttribute("UserId").toString();
						UserType = session.getAttribute("UserType").toString();
						UserAccount = (String) session.getAttribute("UserAccount");
					}
					NewsManage nm=new NewsManage();
					ArrayList list=null;
					User user=null;
					if(UserId!=null){		
						list=nm.showUserByUserId(UserId);//根据session中用户的ID查询用户信息
						user=(User)list.get(0);
					}
				%>
				<!-- Session信息和用户信息结束 -->
				
				
				<header>
					<div class="top center">
						<div class="left fl">
							<ul>
								<li><a href="index.jsp" style="margin-left: -30px;">首页</a></li>
								<li>|</li>
								<%if(UserId==null){
								%>
								<!--未登录反馈开始  -->
								<li><a data-am-modal="{target: '#my-alert'}">问题反馈</a></li>
								<!-- <button type="button" class="am-btn am-btn-primary" data-am-modal="{target: '#my-alert'}">Alert</button> -->
								<!--弹窗开始  -->
								<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
									<div class="am-modal-dialog">
										<div class="am-modal-hd">反馈失败</div>
										<div class="am-modal-bd">未登录用户无法进行反馈！</div>
										<div class="am-modal-footer">
											<span class="am-modal-btn">确定</span>
										</div>
									</div>
								</div>
								<!--弹窗结束  -->
								<!--未登录反馈结束  -->
								<%
								} else{
								%>
								<!--用户登录反馈开始  -->
								<li><a id="doc-prompt-toggle">问题反馈</a></li>
									<!--弹窗开始  -->
									<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
										<form action="AdviseServlet" method="post" id="adviceform">
										<div class="am-modal-dialog">
											<div class="am-modal-hd">请输入您的建议</div>

											<div class="am-modal-bd">
												<input type="text" placeholder="请输入您的建议" name="txt_advice" form="adviceform" class="am-modal-prompt-input"> 
												<input type="hidden" name="userId" value="<%=UserId%>" form="adviceform">
											<div class="am-modal-footer">
												<input name="operate" type="submit" value="确认" style="width: 100%; background-color: #F8F8F8; border: 0px; color: #0E90D2; line-height: 50px; font-size: 16px;"> <span class="am-modal-btn" data-am-modal-cancel>取消</span>
											</div>
										</div>
										</form>
									</div> <script type="text/javascript">
										$(function() {
											$('#doc-prompt-toggle')
													.on(
															'click',
															function() {
																$('#my-prompt')
																		.modal(
																				{
																					relatedTarget : this,
																					onConfirm : function(
																							e) {
																						alert('你输入的是：'
																								+ e.data
																								|| '')
																					},
																				});
															});
										});
									</script> 
									<!-- 弹窗结束 -->
								<!--登录用户反馈结束  -->
								<% 	
								}%>
								
								<div class="clear"></div>
							</ul>
						</div>
						<div class="right fr">

							<div class="fr">
								<%								
									if(UserId!=null){		
										//如果是管理员点击个人中心
										if (UserType.equals("3")) {
											response.sendRedirect("BSManage/NewsManage.jsp?page=1");
										}
								%>
								<ul>
									<li><a href="./UManage/UserMessageManage.jsp"><img class="am-circle" src="<%=user.getUserHead()%>" width="25px" height="25px" style="margin-top: -2px; margin-right: 10px;"><%=UserAccount%></a></li>
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
	
	<div class="banner_x center" >
		<div class="center" style="width:90%;">
		<!-- 板块导航栏显示开始 -->
		<div class="nav left">
			<ul>
				<li><img src="./assets1/i/tubiao.png" style="width: 45px; height: 45px; margin-left: -70px; margin-right: 10px;" /></li>
				<li><a href="index.jsp">热点</a></li>
				<%

					ArrayList list2 =nm.showNewsType();
					int NewsTypeId = 1;
					if (request.getParameter("NewsTypeId") != null) {
						NewsTypeId = Integer.parseInt(request.getParameter("NewsTypeId"));
					}

					for (int i = 0; i < list2.size(); i++) {
						NewsType newstype = (NewsType) list2.get(i);
				%>
				<li><a href="NewsTypeBoard.jsp?NewsTypeId=<%=newstype.getNewsTypeId() %>"><%=newstype.getNewsTypeName() %></a></li>
				<%
					}
				%>
			</ul>
			</div>
		</div>
		
		<!-- 板块导航栏显示结束 -->
<!-- 		position: fixed;
bottom: 0; -->
		<!--搜索框开始-->
		
			<div class="am-col " >
			<form action="Search.jsp" method="post">
			<div class="am-input-group" style="margin-left:860px;width:280px;height:70px;">
					<span class="am-input-group-btn">
					<input type="text" name="Search" class="am-form-field" placeholder="请输入搜索内容" >
					 <input class="am-btn am-btn-primary" name="" type="submit" value="搜索" />
					</span>
					</div>
				</form>
				</div>
				
			
			<div class="clear"></div>
		</div>
		
		<!--搜索框结束-->
	</div>
	



	<!-- Top3新闻展示开始 -->
	<div class="am-g am-g-fixed blog-fixed center" align="center" style="width:90%;">
		<div data-am-widget="slider" class="am-slider am-slider-b1" data-am-slider='{&quot;controlNav&quot;:false}'>
			<ul class="am-slides ">
				<%
				
						ArrayList list3 = nm.showHotNews();/*查询热门新闻内容  */
						for (int i = 0; i < 3; i++) {
						News news = (News)list3.get(i);
					%>
				<li><img src=<%=news.getNewsCover()%> width="1188px" height="514px">
					<div class=" am-slider-desc ">
						<div class="blog-slider-con">
							<h1>
								<a href="ShowNews?newsId=<%=news.getNewsId()%>"><%=news.getNewsTitle()%></a>
							</h1>
							<span><%=news.getUserName() %></span>
						</div>
					</div></li>
				<%} %>
			</ul>
		</div>
	</div>
	<!-- Top3新闻展示结束 -->
	<br>
	
	<!--中间部分开始  -->
	<div class="am-g am-g-fixed blog-fixed center">
		<!-- 剩余热门新闻展示开始 -->
		<div class="am-u-md-8 am-u-sm-12">
			<%
						for (int i = 3; i < list3.size(); i++) {
						News news = (News)list3.get(i);
					%>
			<article class="am-g blog-entry-article">
				<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
					<img src=<%=news.getNewsCover()%> alt="" class="am-u-sm-12" width="369px" height="207px">
				</div>
				<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text" style="height:207px ">
					<span><a class="blog-color">article &nbsp;</a></span> <span> @<%=news.getUserName()%> &nbsp;</span> <br/>

					<h1>
						<a href="ShowNews?newsId=<%=news.getNewsId()%>"><%=news.getNewsTitle()%></a>
					</h1>
					
					<div style="position:absolute;top:90%;left:2.8%;">
					<span><a class="blog-color">Content &nbsp;</a></span><span><%=news.getNewsContentNum() %></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span><a class="blog-color">Last modification &nbsp;</a></span><span><%=news.getUpdateTime()%></span>
				</div>
				</div>
			</article>
			<%} %>

		</div>
		<!-- 剩余热门新闻展示结束 -->
		
		<!--右侧新闻+链接开始  -->
		<div class="am-u-md-4 am-u-sm-12 blog-sidebar">
			<!-- 最新资讯开始 -->
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>最新资讯</span>
				</h2>
				<hr>
				<%
					News mostNewNews=nm.showMostNewNews();
				%>
				<img src=<%=mostNewNews.getNewsCover() %> alt="about me" class="blog-entry-img" style="width: 312px;height: 236px;">
				<p>@ <%=mostNewNews.getUserName() %></p>
				<p><a href="ShowNews?newsId=<%=mostNewNews.getNewsId()%>"><%=mostNewNews.getNewsTitle()%></a></p>
				
			</div>
			<!-- 最新资讯结束 -->

			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-title">
					<span>24小时新闻</span>
				</h2>
				<ul class="am-list" >
					<%
					ArrayList todayNewsList=nm.showTodayNews();
					for(int i = 0; i < todayNewsList.size(); i++){
					News todayNews=(News)todayNewsList.get(i);
					%>
					<li>
					<a href="ShowNews?newsId=<%=todayNews.getNewsId()%>">
					<div style="left">
					<img src=<%=todayNews.getNewsCover() %> alt="about me" style="height: 236px; width:312px;">
					</div>
					<br>
					<div style="right">
					<%=todayNews.getNewsTitle()%>
					</div>
					</a>
					</li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
		<!--右侧新闻+链接结束  -->
	</div>
	<!--中间部分结束  -->

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
	<!--底部结束  -->

	<script src="assets1/js/jquery.min.js"></script>
	<script src="assets1/js/amazeui.min.js"></script>

</body>
</html>