<%@page import="entity.User"%>
<%@page import="entity.News"%>
<%@page import="db.NewsManage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>搜索</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link href="assets3/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="assets3/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="assets3/css/personal.css" rel="stylesheet" type="text/css">
<link href="assets3/css/stepstyle.css" rel="stylesheet" type="text/css">
<script src="assets3/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="assets3/AmazeUI-2.4.2/assets/js/amazeui.js"
	type="text/javascript"></script>

<link rel="icon" type="image/png" href="assets1/i/tubiao.png">
<link rel="stylesheet" href="assets3/assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets3/assets/css/app.css">
<link rel="stylesheet" href="assets3/assets/css/style.css">
<style>
body {
	width: 100%;
	background-color: #F1F2F3;
}

.top {
	width: 100%;
	height: 30px;
	text-align: center;
}

li {
	list-style: none;
	float: left;
	margin-left: 20px;
}

.topl a {
	color: #FFF;
	line-height: 30px;
	text-align: center;
}

.topr {
	float: right;
	margin-right: 50px;
}

.topr a {
	color: #FFF;
	line-height: 30px;
	text-align: center;
}

a {
	text-decoration: none;
}

.topx {
	margin-left: 70px;
	margin-top: 30px;
	font-size: 18px;
}

.topx a:hover {
	color: #F00;
}

.content {
	width: 530px;
	height: 600px;
	margin-left: 170px;
	margin-top: 60px;
	margin-bottom: 30px;
	background: #FFF;
	position: relative;
	right: 100px;
}

.content1 {
	width: 600px;
	height: 110px;
	text-align: left;
	
}

.contentleft {
	width: 20%;
	float: left;
}

.contentright {
	margin-left: 90px;
	margin-top: 40px;
	width: 65%;
	float: right;
}

.contentright a {
	color: #777777;
	font-size: 16px;
}

.contentleft img {
	margin-top: 10px;
	margin-left: 20px;
}

.contentleft1 {
	width: 20%;
	float: left;
}

.contentright1 {
	margin-right: 30px;
	margin-top: 20px;
	width: 65%;
	float: right;
}

.contentright1 a {
	color: #777777;
	font-size: 16px;
}

.contentleft1 img {
	margin-left: 20px;
}

.contentright  p, a {
	font-size: 20px;
	color: #000;
}

.contentright1 p, a {
	font-size: 20px;
	color: #000;
}
.beijing{
background-color:#FFFFFF;
width:800px;
height:900px;
margin:0 auto;
}
.center{
margin:0 auto;
text-align:center;
width:100%
}
</style>
</head>


<body >
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
											response.sendRedirect("../BSManage/NewsManage.jsp?page=1");
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
					<div  class="center" style="margin:0px auto">
				<!--搜索框开始  -->


		<center>
			<div class="am-col" style="margin-top: 30px; margin-bottom: 30px;">
				<div class="am-input-group">
					<form action="Search.jsp" method="post">
						<input type="text" name="Search" placeholder=" 搜一下"
							class="am-form-field" style="height: 45px; width: 650px;">
						<span class="am-input-group-btn"> <input
							class="am-btn am-btn-primary" name="" type="submit" value="搜一下"
							style="height: 45px; width: 80px" />
						</span>

					</form>
				</div>
			</div>
		</center>
		<!--搜索框结束  -->
					
					<div class="main-wrap" 	style="-webkit-box-shadow: #666 0px 0px 10px; margin: 0px auto;margin-top:10px;margin-bottom:20px;
				 	moz-box-shadow: #666 0px 0px 10px; box-shadow: #666 0px 0px 10px;width:790px;height:970px;"  >
					<div class="content">
						<!--新闻列表开始  -->
						<%
							String Search = "";
							if (request.getParameter("Search") != null) {
								Search = request.getParameter("Search");
							}
							int pageCount = nm.ShowPageCountBynewsTitle(Search);//总分页数
							if (Page < 1)
								Page = 1;//如果页码小于1，则页码置为第1页
							if (Page >= pageCount)
								Page = pageCount;//如果当前页码大于总分的页数，就将当前页码置为最后一页
							ArrayList list2 = nm.showNewsListByNewsTitle(Search, Page);/*通过新闻名来模糊查询新闻内容  */
							for (int i = 0; i < list2.size(); i++) {
								News news = (News) list2.get(i);
						%>
						<div class="content1">
							<div class="contentleft">
								<img src=<%=news.getNewsCover()%> width="180px" height="105px" />
							</div>
							<div class="contentright" style="margin-top:10px">
								<a href="#"><p>
										<strong><font size="4px"><%=news.getNewsTitle()%></font>
									</p></a></strong> <a href="#"><%=news.getUserName()%>·&nbsp;<%=news.getNewsContentNum()%>条评论·&nbsp;<%=news.getUpdateTime()%></a>
							</div>
						</div>
						<hr width="600" />
						<%
							}
						%>
						
					</div>
					
					<!--新闻列表结束  -->
					</div>
				
		 <!--序列123  -->
		
			 <div style=" display: inline-block;" >

				<ul class="am-pagination  am-pagination-centered ">
					<li class="am-disabled"><a href="Search.jsp?Search=<%=Search%>&page=1"> 首页</a></li>
					<li><a href="Search.jsp?Search=<%=Search %>&page=<%=Page-1%>" >上一页</a></li>
					
					<%
					int num=0;
					int page_front = 1;//展示的第一个页面
					
					if(pageCount<6){
                       	page_front=1;
                    }
                    else if(Page>4&&pageCount-Page>=4){
                    	page_front = Page-3;
                    }
                    else if(pageCount-Page<3){
                    	
                    	page_front = pageCount-5;
                    }
						for (int i = page_front; i <= pageCount; i++) {
							num++;
							if(num==7){break;}//如果页码超过7就不显示
							if (i == Page) {
					%>

					<li ><a style="color: red;"><%=i%></a></li>
					<%
						} else {
					%>
					<li ><a href="Search.jsp?Search=<%=Search%>&page=<%=i%>"><%=i%></a></li>
					<%
						}
						}
					%>
					<li><a href="Search.jsp?Search=<%=Search %>&page=<%=Page+1%>" >下一页</a></li>
					<li ><a href="Search.jsp?Search=<%=Search%>&page=<%=pageCount%>">尾页 </a></li>
				</ul>

			</div> 
	
		
		<!--序列123結束  -->
	</div>	
	<!-- 頁面結束 -->
	      
	<!--底部-->

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

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
	<script src="assets/js/amazeui.min.js"></script>

</body>

</html>