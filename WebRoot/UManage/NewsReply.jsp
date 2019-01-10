<%@page import="dto.Comment"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>修改</title>

<link href="../assets3/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="../assets3/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="../assets3/css/personal.css" rel="stylesheet" type="text/css">
<link href="../assets3/css/stepstyle.css" rel="stylesheet" type="text/css">



<link rel="icon" type="image/png" href="assets1/i/tubiao.png">
<link rel="stylesheet" href="../assets3/assets/css/amazeui.min.css">
<link rel="stylesheet" href="../assets3/assets/css/app.css">
<link rel="stylesheet" href="../assets3/assets/css/style.css">
<script src="../assets3/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="../assets3/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
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
								<li><a href="../index.jsp" style="margin-left: -30px;">首页</a></li>
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
										<form action="../AdviseServlet" method="post" id="adviceform">
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
									<li><a href="../UManage/UserMessageManage.jsp"><img class="am-circle" src="<%=user.getUserHead()%>" width="25px" height="25px" style="margin-top: -2px; margin-right: 10px;"><%=UserAccount%></a></li>
									<li>|</li>
									<li><a href="../index.jsp?logout=1">登出</a></li>
								</ul>
								<%
									} else {
								%>
								<ul>
									<li><a href="../Login.jsp">登录</a></li>
									<li>|</li>
									<li><a href="../Register.jsp">注册</a></li>
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

	
	<!--中部开始  -->
	<div class="center">
		<div class="col-main">			
			<!-- 菜单栏开始 -->
			<div style="float: left;">
				<ul class="am-list am-list-border" style="width: 110px;">
					<li><a href="../UManage/UserMessageManage.jsp" style="font-size: 15px;"><i class="am-icon-home am-icon-fw"></i> 个人中心</a></li>
					<li><a href="../UManage/UserMessageManage.jsp" style="font-size: 13px;"><i class="am-icon-user am-icon-fw"></i> 个人资料</a></li>
					<li><a href="../UManage/UserPassManage.jsp" style="font-size: 13px;"> <i class="am-icon-book am-icon-fw"></i> 密码管理</a></li>
					<li><a href="../UManage/NewsReply.jsp" style="font-size: 13px;"><i class="am-icon-comments-o am-icon-fw"></i> 查看回复</a></li>
					<%
						//当小编打开个人中心时才显示评论管理选项
						if (user.getUserType()==2) {
					%>
					<li><a href="${pageContext.request.contextPath}/EditNews" style="font-size: 13px;"><i class="am-icon-pencil am-icon-fw"></i> 发布新闻</a></li>
					<li><a href="../BSManage/NewsManage2.jsp?page=1" style="font-size: 13px;"><i class="am-icon-list am-icon-fw"></i> 我的新闻</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<!-- 菜单栏结束 -->
			<div class="main-wrap" style="margin-left: -30px;">
				<div class="user-info">
					<!--标题开始-->
					<div class="am-cf am-padding" align="center">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">查看回复</strong> / <small>Check&nbsp;Reply</small>
						</div>
					</div>
					<hr />
					<!-- 标题结束 -->
				</div>

					<!--回复内容开始 -->
					<div class="info-main" style="margin-right: 100px;">
						<%
						Comment cm=null;
						ArrayList replylist=nm.showReplyByUserId(user.getUserId(),Page);
						for(int i=0;i<replylist.size();i++){
							cm=(Comment)replylist.get(i);
						%>
						<div>
							回复人:<%=cm.getUserName() %>&nbsp;回复了你说:<%=cm.getCommentContent() %><br/>
							回复你的主题是:<a href="../ShowNews?newsId=<%=cm.getNewsId()%>"><%-- <%=nm.showNewsTitleByNewsId(cm.getNewsId()) %> --%><%=cm.getNewsId()%></a>
						</div>
						<%
						}
						%>
					</div>
					<!--回复内容结束  -->
					
					<!--页码开始  -->
					<% 
					int pageCount = nm.ShowPageCountByUserId(user.getUserId());//总分页数
					if (Page < 1)
						Page = 1;//如果页码小于1，则页码置为第1页
					if (Page >= pageCount)
						Page = pageCount;//如果当前页码大于总分的页数，就将当前页码置为最后一页
					%>
					
			<ul class="am-pagination  am-pagination-centered">
				<li class="am-disabled"><a href="NewsReply.jsp?page=1">首页</a></li>
				<li><a href = "NewsReply.jsp?page=<%=Page-1%>" >上一页</a></li>
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
								if(i==Page){		
							%>
				<li ><a style="color: red;"><%=i%> </a></li>				<%	
								}
								else{
							%>
				<li ><a href="NewsReply.jsp?page=<%=i%>"><%=i%> </a></li>
				<%
								}	
							} 
							%>
				<li><a href = "NewsReply.jsp?page=<%=Page+1%>" >下一页</a></li>
				<li><a href="NewsReply.jsp?page=<%=pageCount%>">尾页 </a></li>

			</ul>
			<!--页码结束  -->
					
			</div>
		</div>
	</div>
	<!--中部结束  -->
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

</body>
<script src="../assets3/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="../assets3/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
</html>