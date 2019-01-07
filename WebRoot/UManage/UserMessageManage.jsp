<%@page import="entity.ApplyList"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="../UJS/Apply.js"></script><!-- 申请小编显示判断JS -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>信息</title>

<link href="../assets3/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="../assets3/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="../assets3/css/personal.css" rel="stylesheet" type="text/css">
<link href="../assets3/css/stepstyle.css" rel="stylesheet" type="text/css">

<script src="../assets3/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="../assets3/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

<link rel="icon" type="image/png" href="assets1/i/tubiao.png">
<link rel="stylesheet" href="../assets3/assets/css/amazeui.min.css">
<link rel="stylesheet" href="../assets3/assets/css/app.css">
<link rel="stylesheet" href="../assets3/assets/css/style.css">
<style>
li {
	list-style: none;
}
</style>

</head>

<body id="blog" style="background-color: #F1F2F3;">
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo"><!--顶部导航条 -->
				<header>
					<div class="top center">
						<div class="left fl">
							<ul>
								<li><a href="" target="_blank" style="margin-left: -30px;">米窝首页</a>
								</li>
								<li>|</li>
								<li><a href="">米聊</a></li>
								<li>|</li>
								<li><a href="">多看阅读</a></li>
								<li>|</li>
								<li><a href="">云服务</a></li>
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
									if (session.getAttribute("UserId") != null) {
										UserId = session.getAttribute("UserId").toString();
										UserType = session.getAttribute("UserType").toString();
										UserAccount = (String) session.getAttribute("UserAccount");
										//如果是管理员点击个人中心
										if (UserType.equals("3")) {
											response.sendRedirect("../BSManage/NewsManage.jsp?page=1");
										}
								%>
								<ul>
									<li><a href="../UManage/UserMessageManage.jsp"><%=UserAccount%></a></li>
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


				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logoBig"></div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>

					</div>
				</div>

				<div class="clear"></div>
			</div>
			
		</article>
	</header>


	<%
			NewsManage nm=new NewsManage();
			ArrayList list=nm.showUserByUserId(UserId);
			User user=(User)list.get(0);
	 %>
	<div class="center">
	
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding" align="center">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />

				

					<!--个人信息 -->
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
									<input type="text" id="UserAccount" placeholder="UserName" name="txt_uName" value="<%=user.getUserName()%>">

								</div>
							</div>

							<div class="am-form-group"><!-- 性别开始 -->
								<label class="am-form-label">性别</label>
								<div class="am-form-content sex">
									<%
										if (user.getUserSex() == 1) {
									%>
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="0">保密</label> 
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="1" checked="checked"> 女</label> 
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="2"> 男</label>
									<%
										} else if (user.getUserSex() == 2) {
									%>
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="0">保密</label> 
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="1"> 女</label> 
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="2" checked="checked"> 男</label>
									<%
										} else {
									%>
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="0" checked="checked">保密</label> 
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="1"> 女</label> 
									<label class="am-radio-inline"> <input type="radio" name="rdo_gender" value="2"> 男</label>
									<%
						}
						%>
								</div>
							</div><!-- 性别结束 -->


							<div class="am-form-group" style="width: 700px;"><!-- 生日开始 -->
								<label for="user-birth" class="am-form-label">出生日期</label>
								<div class="am-form-content birth">
									<%
										if(user.getUserBirthday()==null){
						 			%>
									<div class="birth-select"><!-- 数据库无生日开始 -->
										<select  name="year" data-am-selected="{btnWidth: '60px', btnSize: 'sm'}" >
											<%for(int i=1900;i<2020;i++){%>
												<option><%=i %></option>
											<%}%>
										</select> <em>年</em>
										
										<select name="month" data-am-selected="{btnWidth: '50px', btnSize: 'sm'}">
											<%
											for(int i=1;i<13;i++){
											 %>
												<option><%=i %></option>
											<%
												}
								 			%>
										</select> <em>月</em>
										
										<select  name="day" data-am-selected="{btnWidth: '50px', btnSize: 'sm'}">
											<%
											for(int i=1;i<32;i++){
											 %>
												<option><%=i %></option>
											<%
												}
								 			%>
										</select> <em>日</em>
									</div><!-- 数据库无生日结束 -->
									<%}else{
										String Birthday=user.getUserBirthday();
										int Year=Integer.parseInt(Birthday.substring(0, 4));
										int Month=Integer.parseInt(Birthday.substring(5, 7));
										int Day=Integer.parseInt(Birthday.substring(8, 10));
								
									%>
									<div class="birth-select"><!-- 数据库有生日开始 -->
										<select name="year"
											data-am-selected="{btnWidth: '60px', btnSize: 'sm'}">
											<%
												for (int i = 1900; i < 2020; i++) {
														if (i == Year) {
											%>
											<option selected="selected"><%=i%></option>
											<%
												} else {
											%>
											<option><%=i%></option>
											<%
												}
													}
											%>
										</select> <em>年</em> <select name="month"
											data-am-selected="{btnWidth: '50px', btnSize: 'sm'}">
											<%
												for (int i = 1; i < 13; i++) {
														if (i == Month) {
											%>
											<option selected="selected"><%=i%></option>
											<%
												} else {
											%>
											<option><%=i%></option>
											<%
												}
													}
											%>
										</select> <em>月</em> <select name="day"
											data-am-selected="{btnWidth: '50px', btnSize: 'sm'}">
											<%
												for (int i = 1; i < 32; i++) {
														if (i == Day) {
											%>
											<option selected="selected"><%=i%></option>
											<%
												} else {
											%>
											<option><%=i%></option>
											<%
												}
													}
											%>
										</select> <em>日</em>
									</div><!-- 数据库有生日结束 -->
									<%} %>
								</div>
							</div><!-- 生日结束 -->
							
							<div class="am-form-group">
								<label for="user-email" class="am-form-label">电子邮件</label>
								<div class="am-form-content">
									<input id="user-email" placeholder="Email" type="email"  name="txt_uemail" value="<%=user.getUserEMail()%>">

								</div>
							</div>
							
							<div class="am-form-group address"><!--用户类型开始  -->
								<label for="user-address" class="am-form-label">用户类型</label>
								<div class="am-form-content">
									<%
										if (UserType.equals("1")) {
									%>
									
									<%
										ApplyList al = nm.showApplyListByUserId(user.getUserId());
											if (al == null) {
									%>
									<input type="text" name="usertypeName" value="普通用户" readonly="readonly" style="width: 80px;float: left;">
									<input id="submit" type="button" value="申请成为小编" class="am-btn am-btn-danger am-btn-xs" onclick="show_apply()" style="margin-left: 10px;margin-top: 3px;" />
									
									<%
										} else {
												if (al.getState().equals("申请中")) {
									%>
									<input type="text" name="usertypeName" value="小编申请审核中..." readonly="readonly" style="width: 145px;float: left;">
									<%
										} else if (al.getState().equals("申请失败")) {
									%>
									<input type="text" name="usertypeName" value="小编申请失败" readonly="readonly" style="width: 115px;float: left;">
									<input id="submit" type="button" value="重新申请" class="am-btn am-btn-danger am-btn-xs" onclick="show_apply()" style="margin-left: 10px;margin-top: 4px;" />
									<%
										} else {
												}
											}
										}
									%>
									<%
										if (UserType.equals("2")) {
									%>
									<input type="text" name="usertypeName" value="小编"
										readonly="readonly">
									<%} %>
								</div>
							</div><!--用户类型结束  -->
							
							<div class="am-form-group"><!-- 头像显示开始 -->
								<label for="user-name2" class="am-form-label">头像</label>
								<div class="am-form-content">
									<!--头像 -->
									<img id='img' src="../img/<%=user.getUserHead() %>" width="60px" height="60px"/>
									<script>
										var img = document.getElementById('img')
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
							</div><!-- 头像显示结束 -->
							
							<div class="am-form-group"><!-- 修改头像开始 -->
								<label for="user-name2" class="am-form-label">修改头像</label>
								<div class="am-form-content">
									<!--修改头像 -->
									<input id="file" type="file" name="file" style="margin-top: 10px;">
									<script>
										var img = document.getElementById('img')
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
							</div><!-- 修改头像结束 -->
							
							<div class="info-btn">
								<input class="am-btn am-btn-danger" type="submit" name="Submit" value="保存修改">
								<input type="hidden" name="userId" value="<%=user.getUserId()%>">
							</div>
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
					</div>

				</div>

			</div>
			<!--底部-->
			<div class="footer">
				<div align="center"></div>


			</div>
		</div>
		<aside class="menu">
			<ul>
				<li class="person"><a href="index.html">个人中心</a></li>
				<li class="person">个人资料
					<hr>
					<ul>
						<li><a href="safety.html">密码修改</a></li>
						<li><a>个人信息管理（普通用户/小编）</a></li>
						<li><a href="UserPassManage.jsp">密码管理（普通用户/小编）</a></li>
						<li><a href="#">查看回复（普通用户/小编）</a></li>
						
						<%
						//当小编打开个人中心时才显示评论管理选项
						if(UserType.equals("2")){
						%>
						<li><a href="${pageContext.request.contextPath}/EditNews">发布新闻（小编）</a></li>
						<li><a href="#">我发布的新闻（小编）</a></li>
						<li><a href="UManage/UserCommentManage.jsp">评论管理（小编用）</a></li>
						<%} %>
					</ul>
				</li>
			</ul>
		</aside>

	<footer class="blog-footer">
		<div class="am-g am-g-fixed blog-fixed blog-footer-padding center">
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h3>工作室简介</h3>
				<p class="am-text-sm">
					这是一个有趣而富有灵魂的网站。<br> / 想要了解的都能在这里 <br> / 不论你对什么感兴趣 <br>
					/ 你都会从中找到乐趣。<br> / emmmmm，不知道说啥了。外面的世界真精彩<br>
					<br> 新鲜资讯，热门话题，没有最精彩，只有更精彩！
				</p>
			</div>
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h3>社交账号</h3>
				<p>
					<a href=""><span
						class="am-icon-qq am-icon-fw am-primary blog-icon blog-icon"></span></a>
					<a href=""><span
						class="am-icon-github am-icon-fw blog-icon blog-icon"></span></a> <a
						href=""><span
						class="am-icon-weibo am-icon-fw blog-icon blog-icon"></span></a> <a
						href=""><span
						class="am-icon-reddit am-icon-fw blog-icon blog-icon"></span></a> <a
						href=""><span
						class="am-icon-weixin am-icon-fw blog-icon blog-icon"></span></a>
				</p>
				<h3>Credits</h3>
				<p>我们追求卓越，然时间、经验、能力有限。本工作室有很多不足的地方，希望大家包容、不吝赐教，给我们提意见、建议。感谢你们！</p>
			</div>
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h1>我们站在巨人的肩膀上</h1>
				<h3>Heroes</h3>
				<p>
				<ul>
					<li>jQuery</li>
					<li>Zepto.js</li>
					<li>Seajs</li>
					<li>LESS</li>
					<li>...</li>
				</ul>
				</p>
			</div>
		</div>
		<div class="blog-text-center">Copyright© 2019 米窝工作室 版权所有 All
			rights reserved</div>
	</footer>

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