<%@page import="entity.ApplyList"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />
					<!-- 标题结束 -->

					<!--申请小编div开始  -->
					<div class="info-main" style="margin-right: 100px;">
					<form class="am-form am-form-horizontal" action="../AuthorApplyServlet" method="post" id="applyform">
					<!--用户类型开始  -->
					<div class="am-form-group">
						<label for="user-name2" class="am-form-label">用户类型</label>

						<div class="am-form-label" style="font-size:15px;width:250px;height:30px;text-align:left;margin-left:1em;margin-top:-3px;font-weight:520 ">

						

							<%
								if (user.getUserType()==1) {
							%>

							<%
								ApplyList al = nm.showApplyListByUserId(user.getUserId());
									if (al == null) {
							%>
							<font  size="3">普通用户</font>
							
							<button type="button" class="am-btn am-btn-danger am-btn-xs" id="doc-prompt-toggleA" style="margin-left: 10px; ">申请成为小编</button>
							<!-- 弹窗开始 -->
							<div class="am-modal am-modal-prompt" tabindex="-1" id="my-promptA">
								<div class="am-modal-dialog">
									<div class="am-modal-hd">请输入申请理由</div>

										<div class="am-modal-bd">
											<input type="text" placeholder="请输入申请理由" name="txt_apply" form="applyform" class="am-modal-prompt-input"> <input type="hidden" name="userId" value="<%=user.getUserId()%>" form="applyform">
										</div>
										<div class="am-modal-footer">
											<input name="operate" type="submit" value="确认" style="width: 110%; background-color: #F8F8F8; border: 0px; color: #0E90D2; line-height: 50px;font-size: 16px;">
											<span class="am-modal-btn" data-am-modal-cancel>取消</span>
										</div>
								</div>
							</div>
							<script type="text/javascript">
								$(function() {
									$('#doc-prompt-toggleA')
											.on(
													'click',
													function() {
														$('#my-promptA')
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
							<%
								} else {
										if (al.getState().equals("申请中")) {
							%>
							<font color="#FF0000" size="3">小编申请审核中</font>

							<%
								} else if (al.getState().equals("申请失败")) {
							%>

							<!-- <input type="text" name="usertypeName" value="小编申请失败" readonly="readonly" style="width: 115px; float: left;"> -->
							<!-- <button type="button" class="am-btn am-btn-danger am-btn-xs" id="doc-prompt-toggle" style="margin-left: 10px; margin-top: 4px;">重新申请</button> -->

							<!-- <input type="text" name="usertypeName" value="小编申请失败" readonly="readonly" style="width: 115px; float: left;"> -->
							<font color="#FF0000" size="3">小编申申请失败</font>
							<button type="button" class="am-btn am-btn-danger am-btn-xs" id="doc-prompt-toggleA" >重新申请</button>

							<!-- 弹窗开始 -->
							<div class="am-modal am-modal-prompt" tabindex="-1" id="my-promptA">
								<div class="am-modal-dialog">
									<div class="am-modal-hd">请输入申请理由</div>

										<div class="am-modal-bd">
											<input type="text" placeholder="请输入申请理由" name="txt_apply" form="applyform" class="am-modal-prompt-input"> <input type="hidden" name="userId" value="<%=user.getUserId()%>" form="applyform">
										</div>
										<div class="am-modal-footer">
											<input name="operate" type="submit" value="确认" style="width: 110%; background-color: #F8F8F8; border: 0px; color: #0E90D2; line-height: 50px;font-size: 16px;">
											<span class="am-modal-btn" data-am-modal-cancel>取消</span>
										</div>
								</div>
							</div>
							<script type="text/javascript">
								$(function() {
									$('#doc-prompt-toggleA')
											.on(
													'click',
													function() {
														$('#my-promptA')
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
							<%
								} else {
							%>
								<!-- <input type="text" name="usertypeName" value="小编申请成功，请重新登录生效..." readonly="readonly" style="width: 270px; float: left;"> -->
								<a href="../Login.jsp">	
								<div style="margin-top:20"><font color="#FF0000" size="3" >小编申请成功，请重新登录生效...</font></div> </a>
							<%
										}
									}
								}
							%>
							<%
								if (user.getUserType()==2) {
							%>
							<!-- <input type="text" name="usertypeName" value="小编" readonly="readonly"><br/> -->
							<font color="#00F" size="3" letter-spacing="1px";>小编</font><br/>
							<%
								}
							%>
						</div>
					</div>
					<!--用户类型结束  -->
					</form>
					</div>
				</div>
					<!--申请小编div结束  -->

					<!--个人信息开始 -->
					<div class="info-main" style="margin-right: 100px;">
						<form class="am-form am-form-horizontal" method="post" action="../UserMessageUpdateServlet">
							
							<!--账号开始  -->
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">账号</label>
								<div class="am-form-label" style="letter-spacing: 1px;font-size:14px;text-align:left;margin-left:1em;">
									<%=user.getUserAccount()%>
									<input type="hidden"  placeholder="UserAccount" readonly="readonly" name="txt_uAccount" value="<%=user.getUserAccount()%>" />

								</div>
							</div>
							<!--账号结束  -->
							
							<!--昵称开始  -->
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">昵称</label>
								<div class="am-form-content">
									<input type="text" id="UserAccount" placeholder="UserName" name="txt_uName" minlength="1" maxlength="16" value="<%=user.getUserName()%>">

								</div>
							</div>
							<!--昵称结束  -->

							<!-- 性别开始 -->
							<div class="am-form-group">
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
							
							<!--电子邮件开始  -->
							<div class="am-form-group" >
								<label for="user-email" class="am-form-label">电子邮件</label>
								<div class="am-form-content">
									<input id="user-email" placeholder="Email" type="email" name="txt_uemail" value="<%=user.getUserEMail()%>">

								</div>
							</div>
							<!--电子邮件结束  -->
									
 							<!-- 头像显示开始 -->
							<div class="am-form-group" >
								<label for="user-name2" class="am-form-label" >头像</label>
								<div class="am-form-content">
									<!--头像 -->
									<img id='img' class="am-circle" src=" <%=user.getUserHead()%>" width="60px" height="60px" />
								</div>
							</div>
							<!-- 头像显示结束 -->
							<script src="${pageContext.request.contextPath}/js/newsEdit.js"></script>
							<!-- 修改头像开始 -->
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">修改头像</label>
								<div class="am-form-content">
									<!--修改头像 -->
									<input id="file" type="file" name="file" accept="image/png,image/gif,image/jpeg" style="margin-top: 10px;">
									<script>
										var img = document.getElementById('img')
										file.addEventListener('change',function() {
											var newsCover=document.getElementById("file").files[0];
											if(!newsCover){
												touxiang();
											}
											
										})
									</script>
								</div>
							</div>
							<input type="hidden" name="userHead" id="userHead" value="">
							<!-- 修改头像结束 -->
							<script type="text/javascript">
							//上传头像
							function touxiang(){
								var xmlhttp = createXmlHttp();
								var newsCover=document.getElementById("file").files[0];
								// 实例化一个表单数据对象 
								var formData = new FormData(); 
								formData.append("newsCover", newsCover); 
								formData.append("t", Math.random()); 
								if(!xmlhttp) {
								    alert("您的浏览器不支持AJAX！");
								    return 0;
								}
								var url = '/News/ck5/Upload';

								xmlhttp.onreadystatechange = function() {
								    if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {

								    	//result 为发布成功后跳转的页面
								        var result=xmlhttp.responseText;
								        
								        if(result == null || result == " "){
								        	
								        }else{
								        	var result_json;
									        result_json=eval("(" + result + ")");
//									        alert(result_json.url);
									        document.getElementById("img").src = result_json.url;
									        document.getElementById("userHead").value=result_json.url;
								        }
								    }else{
								    	//发布失败
								    	
								    }
								}
								xmlhttp.open("POST", url, true);
								
//								xmlhttp.setRequestHeader("Content-Type", "multipart/form-data");
//								xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
								xmlhttp.send(formData);
							}
							
							</script>
							
							
							<div class="info-btn">
								<input class="am-btn am-btn-danger" type="submit" name="Submit" value="保存修改"> <input type="hidden" name="userId" value="<%=user.getUserId()%>">
							</div>
						</form>
					
							
					</div>
					<!--个人信息结束  -->
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