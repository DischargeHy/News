<%@page import="entity.ApplyList"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <script type="text/javascript" src="../UJS/Apply.js"></script>
申请小编显示判断JS -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>信息</title>

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
									<li><a href="../UManage/UserMessageManage.jsp"><img class="am-circle" src="../img/java.png" width="25px" height="25px" style="margin-top: -2px;margin-right: 10px;"><%=UserAccount%></a></li>
									<li>|</li>
									<li><a href="../index.jsp?logout=1">登出</a></li>
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

	
	<!--中部开始  -->
	<div class="center">
		<div class="col-main">			
			<!-- 菜单栏开始 -->
			<div style="float: left;">
				<ul class="am-list am-list-border" style="width: 110px;">
					<li><a href="../UManage/UserMessageManage.jsp" style="font-size: 15px;"><i class="am-icon-home am-icon-fw"></i> 个人中心</a></li>
					<li><a href="../UManage/UserMessageManage.jsp" style="font-size: 13px;"><i class="am-icon-user am-icon-fw"></i> 个人资料</a></li>
					<li><a href="../UManage/UserPassManage.jsp" style="font-size: 13px;"> <i class="am-icon-book am-icon-fw"></i> 密码管理</a></li>
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
				<div class="user-info">
					<!--标题开始-->
					<div class="am-cf am-padding" align="center">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />
					<!-- 标题结束 -->	
					
										<!--用户类型开始  -->
							<div class="am-form-group address"  style="background:#0F0;">
								<label for="user-address" class="am-form-label">用户类型</label>
								<div class="am-form-content">
									<%
										if (UserType.equals("1")) {
									%>

									<%
										ApplyList al = nm.showApplyListByUserId(user.getUserId());
											if (al == null) {
									%>
									<input type="text" name="usertypeName" value="普通用户" readonly="readonly" style="width: 80px; float: left;"> 
									<button type="button" class="am-btn am-btn-danger am-btn-xs" id="doc-prompt-toggle" style="margin-left: 10px; margin-top: 3px;">申请成为小编</button>
								 	<!--弹窗开始  -->
									<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt" style="background:#000;display: none">
										<div class="am-modal-dialog">
											<div class="am-modal-hd">请输入申请理由</div>
											<form action="../AuthorApplyServlet" method="post" id="applyform">
											<div class="am-modal-bd">
													<input type="text" placeholder="请输入申请理由" name="txt_apply" form="applyform" class="am-modal-prompt-input"> 
													<input type="hidden" name="userId" value="<%=user.getUserId()%>" form="applyform">
													<centetr> 
													<input id="yes" type="submit" value="确认" style="width: 75px; text-indent: 0px; margin-top: 0px;" form="applyform" > 
													</centetr>
											</div>
											<div class="am-modal-footer">
												<span class="am-modal-btn" data-am-modal-confirm>提交</span>
												<span class="am-modal-btn" data-am-modal-cancel>取消</span> 	
											</div>
											</form>
										</div>
									</div>
									<script type="text/javascript">
									$(function() { $('#doc-prompt-toggle').on('click', function() { $('#my-prompt').modal({ relatedTarget: this, onConfirm: function(e) { alert('你输入的是：' + e.data || '') } }); }); });
									</script>
									<!-- 弹窗结束 --> 
									<%
										} else {
												if (al.getState().equals("申请中")) {
									%>
									<input type="text" name="usertypeName" value="小编申请审核中..." readonly="readonly" style="width: 145px; float: left;">
									<%
										} else if (al.getState().equals("申请失败")) {
									%>
									<input type="text" name="usertypeName" value="小编申请失败" readonly="readonly" style="width: 115px; float: left;">
									<button type="button" class="am-btn am-btn-danger am-btn-xs" id="doc-prompt-toggle" style="margin-left: 10px; margin-top: 4px;">重新申请</button>
									<!--弹窗开始  -->
									<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
										<div class="am-modal-dialog">
											<div class="am-modal-hd">请输入申请理由</div>
											<form action="../AuthorApplyServlet" method="post" id="applyform">
											<div class="am-modal-bd">
													<input type="text" placeholder="请输入申请理由" name="txt_apply" form="applyform" class="am-modal-prompt-input"> 
													<input type="hidden" name="userId" value="<%=user.getUserId()%>" form="applyform">
													<centetr> 
													<input id="yes" type="submit" value="确认" style="width: 75px; text-indent: 0px; margin-top: 0px;" form="applyform"> 
													<!-- <input id="no" type="button" value="取消" style="width: 75px; text-indent: 0px; margin-top: 0px;" data-am-modal-cancel>  -->
													</centetr>
											</div>
											</form>
										</div>
									</div>
									<script type="text/javascript">
									$(function() { $('#doc-prompt-toggle').on('click', function() { $('#my-prompt').modal({ relatedTarget: this, onConfirm: function(e) { alert('你输入的是：' + e.data || '') }, onCancel: function(e) { alert('取消!'); } }); }); });
									</script>
									<!-- 弹窗结束 -->
									<%
										} else {
												}
											}
										}
									%>
									<%
										if (UserType.equals("2")) {
									%>
									<input type="text" name="usertypeName" value="小编" readonly="readonly">
									<%
										}
									%>
								</div>
							</div>
							<!--用户类型结束  -->			

					<!--个人信息开始 -->
					<div class="info-main" style="margin-right: 100px;">
						<form class="am-form am-form-horizontal" method="post" action="../UserMessageUpdateServlet">
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">账号</label>
								<div class="am-form-content">
									<input type="text" id="UserID" placeholder="UserAccount" readonly="readonly" name="txt_uAccount" value="<%=user.getUserAccount()%>" />

								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">昵称</label>
								<div class="am-form-content">
									<input type="text" id="UserAccount" placeholder="UserName" name="txt_uName" minlength="1" maxlength="16" value="<%=user.getUserName()%>">

								</div>
							</div>

							<div class="am-form-group">
								<!-- 性别开始 -->
								<label class="am-form-label">性别</label>
								<div class="am-form-content sex">
									<%
										if (user.getUserSex() == 1) {
									%>
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="0">保密
									</label> <label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="1" checked="checked"> 女
									</label> <label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="2"> 男
									</label>
									<%
										} else if (user.getUserSex() == 2) {
									%>
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="0">保密
									</label> <label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="1"> 女
									</label> <label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="2" checked="checked"> 男
									</label>
									<%
										} else {
									%>
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="0" checked="checked">保密
									</label> <label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="1"> 女
									</label> <label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="2"> 男
									</label>
									<%
										}
									%>
								</div>
							</div>
							<!-- 性别结束 -->

						 	<!-- 生日开始 -->
							<div class="am-form-group" style="width: 700px;">
								<label for="user-birth" class="am-form-label">出生日期</label>
								<div class="am-form-content birth">
									<%
										if (user.getUserBirthday() == null) {
									%>
									<div class="birth-select">
										<!-- 数据库无生日开始 -->
										<select name="year" data-am-selected="{btnWidth: '60px', btnSize: 'sm',maxHeight: 300}">
											<%
												for (int i = 1960; i < 2020; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select> <em>年</em> 
										<select name="month" data-am-selected="{btnWidth: '50px', btnSize: 'sm',maxHeight: 300}">
											<%
												for (int i = 1; i < 13; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select> <em>月</em> 
										<select name="day" data-am-selected="{btnWidth: '50px', btnSize: 'sm',maxHeight: 300}">
											<%
												for (int i = 1; i < 32; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select> <em>日</em>
									</div>
									<!-- 数据库无生日结束 -->
									<%
										} else { 
									%> 
									<%
											String Birthday = user.getUserBirthday();
											int Year = Integer.parseInt(Birthday.substring(0, 4));
											int Month = Integer.parseInt(Birthday.substring(5, 7));
											int Day = Integer.parseInt(Birthday.substring(8, 10));
									%>
									<div class="birth-select">
										<!-- 数据库有生日开始 -->
										<select name="year" data-am-selected="{btnWidth: '60px', btnSize: 'sm',maxHeight: 300}">
											<%
												for (int i = 1950; i < 2020; i++) {
														if (i == Year) {
											%>
											<option selected="selected" value="<%=i%>"><%=i%></option>
											<%
												} else {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
													}
											%>
										</select> <em>年</em> 
										<select name="month" data-am-selected="{btnWidth: '50px', btnSize: 'sm',maxHeight: 300}">
											<%
												for (int i = 1; i < 13; i++) {
														if (i == Month) {
											%>
											<option selected="selected" value="<%=i%>"><%=i%></option>
											<%
												} else {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
													}
											%>
										</select> <em>月</em> 
										<select name="day" data-am-selected="{btnWidth: '50px', btnSize: 'sm',maxHeight: 300}">
											<%
												for (int i = 1; i < 32; i++) {
														if (i == Day) {
											%>
											<option selected="selected" value="<%=i%>"><%=i%></option>
											<%
												} else {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
													}
											%>
										</select> <em>日</em>
									</div>
									<!-- 数据库有生日结束 -->
									<%
										}
									%>
								</div>
							</div>
							<!-- 生日结束 --> 
							

							<div class="am-form-group" style="background:#0F0;">
								<label for="user-email" class="am-form-label">电子邮件</label>
								<div class="am-form-content">
									<input id="user-email" placeholder="Email" type="email" name="txt_uemail" value="<%=user.getUserEMail()%>">

								</div>
							</div>
							
 								
 							<!-- 头像显示开始 -->
							<div class="am-form-group" style="background:#0F0;">
								<label for="user-name2" class="am-form-label" >头像</label>
								<div class="am-form-content">
									<!--头像 -->
									<img id='img' class="am-circle" src=" <%=user.getUserHead()%>" width="60px" height="60px" />
									<script>
										var img = document.getElementById('img');
										file.addEventListener('change',function() {
															var obj = file.files[0]
															var reader = new FileReader();
															reader.readAsDataURL(obj);
															reader.onloadend = function() {
																img.setAttribute('src',reader.result);
															}
														})
									</script>
								</div>
							</div>
							<!-- 头像显示结束 -->

							<div class="am-form-group" style="background:#0F0;">
								<!-- 修改头像开始 -->
								<label for="user-name2" class="am-form-label">修改头像</label>
								<div class="am-form-content">
									<!--修改头像 -->
									<input id="file" type="file" name="file" style="margin-top: 10px;">
									<script>
										var img = document.getElementById('img')
										file.addEventListener(
														'change',
														function() {
															var obj = file.files[0]
															var reader = new FileReader();
															reader.readAsDataURL(obj);
															reader.onloadend = function() {
																img.setAttribute('src',reader.result);
															}
														})
									</script>
								</div>
							</div>
							<!-- 修改头像结束 -->
							
							
							
							<div class="info-btn">
								<input class="am-btn am-btn-danger" type="submit" name="Submit" value="保存修改"> <input type="hidden" name="userId" value="<%=user.getUserId()%>">
							</div>
						</form>
						
					<%-- 	<!-- 点击申请成为小编才出现 -->
						<div id="apply" style="display: none">
							<form action="../AuthorApplyServlet" method="post" id="applyform">
								<input type="text" placeholder="请输入申请理由" name="txt_apply" form="applyform"> <input type="hidden" name="userId" value="<%=user.getUserId()%>" form="applyform">
								<centetr> <input id="yes" type="submit" value="确认" style="width: 75px; text-indent: 0px; margin-top: 0px;" form="applyform"> <input id="no" type="button" value="取消" style="width: 75px; text-indent: 0px; margin-top: 0px;" onclick="hidden_apply()"> </centetr>
							</form>
						</div>
						<!-- 申请成为小编结束 --> --%>
					</div>
					<!--个人信息结束  -->
				</div>
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

</html>