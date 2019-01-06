<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>信息</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/stepstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
        
        	<link rel="icon" type="image/png" href="assets/i/tubiao.png">
			<link rel="stylesheet" href="assets/css/amazeui.min.css">
			<link rel="stylesheet" href="assets/css/app.css">
			<link rel="stylesheet" href="assets/css/style.css">
		<style>
			li{
				list-style: none;
			}
			
		</style>

	</head>

	<body  id="blog"   style="background-color:#F1F2F3;">
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					
					<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li>
							<a href="" target="_blank" style="margin-left: -30px;">米窝首页</a>
						</li>
						<li>|</li>
						<li>
							<a href="">米聊</a>
						</li>
						<li>|</li>
						<li>
							<a href="">多看阅读</a>
						</li>
						<li>|</li>
						<li>
							<a href="">云服务</a>
						</li>
						<li>|</li>
						<li>
							<a href="">问题反馈</a>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="right fr">

					<div class="fr">
						<ul>
							<li>
								<a href="./login.html" target="_blank">登录</a>
							</li>
							<li>|</li>
							<li>
								<a href="./register.html" target="_blank">注册</a>
							</li>
							<li>|</li>
							<li>
								<a href="">消息通知</a>
							</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
					

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
							
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>

		    
			
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding" align="center"  >
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div  align="center">

							 <img id='img' src="image/" style="margin-top:20px;width: 60px;" />
     					 <input id="file" type="file" name="file">
						<script>
						var img = document.getElementById('img')
					file.addEventListener('change',function(){
			 		   var obj = file.files[0]
				    var reader = new FileReader();
			 	   reader.readAsDataURL(obj);
						    reader.onloadend = function() {
				 	       img.setAttribute('src',reader.result);
					    }
							})
		</script>


						
						</div>

						<!--个人信息 -->
						<div class="info-main"  style="	margin-right:100px;" >
							<form class="am-form am-form-horizontal">
										<div class="am-form-group">
									<label for="user-name2" class="am-form-label">账号</label>
									<div class="am-form-content">
										<input type="text" id="UserID" placeholder="nickname" readonly="readonly">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="UserAccount" placeholder="nickname">

									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										
										<label class="am-radio-inline">
											<input type="radio" name="UserSex" value="1" data-am-ucheck> 女
										</label>
                                        <label class="am-radio-inline">
											<input type="radio" name="UserSex" value="2" data-am-ucheck  > 男
										</label>
                                        <label class="am-radio-inline">
											<input type="radio" name="UserSex" value="0" data-am-ucheck> 保密
										</label>
										
									</div>
								</div>
								<div class="am-form-group" style="width:700px;">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<div class="birth-select">
											<select data-am-selected>
												<option value="a">2015</option>
												<option value="b">1987</option>
											</select>
											<em>年</em>
										</div>
										<div class="birth-select2">
											<select data-am-selected>
												<option value="a">12</option>
												<option value="b">8</option>
											</select>
											<em>月</em></div>
										<div class="birth-select2">
											<select data-am-selected>
												<option value="a">21</option>
												<option value="b">23</option>
											</select>
											<em>日</em></div>
									</div>
							
								</div>

							
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" placeholder="telephonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" placeholder="Email" type="email">

									</div>
								</div>
								<div class="am-form-group address">
									<label for="user-address" class="am-form-label">用户类型：</label>  
									<div class="am-form-content">
										<input id="user-type" placeholder="user-type" type="type" value="普通用户">				
											<input type="submit" name="button" id="button" value="申请成为小编" />
									</div>   

								</div>
                                
								
								<div class="info-btn">
									<div class="am-btn am-btn-danger">保存修改</div>
								</div>

							</form>
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
					<li class="person">
						<a href="index.html">个人中心</a>
					</li>
					<li class="person">
						个人资料<hr>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">密码修改</a></li>
							
						</ul>
					</li>
					<li class="person">
						评论管理<hr>
						<ul>
							<li><a href="">我的评论</a></li>
							
						</ul>
					</li>
					

					

				</ul>

			</aside>
		</div>
				<footer class="blog-footer">
			<div class="am-g am-g-fixed blog-fixed blog-footer-padding center">
				<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
					<h3>工作室简介</h3>
					<p class="am-text-sm">这是一个有趣而富有灵魂的网站。<br> / 想要了解的都能在这里 <br> / 不论你对什么感兴趣 <br> / 你都会从中找到乐趣。<br> / emmmmm，不知道说啥了。外面的世界真精彩<br><br> 新鲜资讯，热门话题，没有最精彩，只有更精彩！
					</p>
				</div>
				<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
					<h3>社交账号</h3>
					<p>
						<a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon blog-icon"></span></a>
						<a href=""><span class="am-icon-github am-icon-fw blog-icon blog-icon"></span></a>
						<a href=""><span class="am-icon-weibo am-icon-fw blog-icon blog-icon"></span></a>
						<a href=""><span class="am-icon-reddit am-icon-fw blog-icon blog-icon"></span></a>
						<a href=""><span class="am-icon-weixin am-icon-fw blog-icon blog-icon"></span></a>
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
			<div class="blog-text-center">Copyright© 2019 米窝工作室 版权所有 All rights reserved</div>
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