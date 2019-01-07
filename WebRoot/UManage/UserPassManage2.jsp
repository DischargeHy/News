<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>修改</title>

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
			li{
				list-style: none;
			}
			
		</style>

	</head>

	<body  id="blog" style="background-color:#F1F2F3;">
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

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                            <p class="stage-name">重置密码</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
					<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
					  </div>
					</div>
					<form class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" id="user-old-password" placeholder="请输入原登录密码">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" placeholder="由数字、字母组合">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码">
							</div>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger">保存修改</div>
						</div>

					</form>

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