<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>搜索</title>
     <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> 

		<link href="assets3/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="assets3/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="assets3/css/personal.css" rel="stylesheet" type="text/css">
		<link href="assets3/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script src="assets3/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="assets3/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
        
       	<link rel="icon" type="image/png" href="assets1/i/tubiao.png">
		<link rel="stylesheet" href="assets3/assets/css/amazeui.min.css">
		<link rel="stylesheet" href="assets3/assets/css/app.css">
		<link rel="stylesheet" href="assets3/assets/css/style.css">
		<style>
	body{
		width:100%;
		background-color:#F1F2F3;
		
		
		}
	.top{
		width:100%;
		height:30px;
		
		text-align:center;
		}
		li{
			
		list-style:none;
		float:left;
		margin-left:20px;
		}
		.topl a{
			color:#FFF;
			line-height:30px;
			text-align:center;
		}
		.topr{
			float:right;
			margin-right:50px;
			}
		.topr a{
			color:#FFF;
			line-height:30px;
			text-align:center;
		}
		a{
			text-decoration:none;
			}
	    .topx{
			margin-left:70px;
			margin-top:30px;
			font-size:18px;
			 
			}
		.topx a:hover{
			color:#F00;}
		.content{
			width:730px;
			height:600px;
			margin-left:200px;
			margin-top:80px;
			background:#FFF;
			position:relative;  
		  right:100px; 
		}
		.content1{
			width:700px;
			height:110px;
			}
		.contentleft{
			width:20%;
			float:left;
			}
		.contentright{
			margin-right:30px;
			margin-top:30px;
			width:65%;
			float:right;
			}
		.contentright a{
			color:#777777;
			font-size:16px;
			}
		.contentleft img{
			margin-top:10px;
			margin-left:20px;}
		.contentleft1{
			width:20%;
			float:left;
		}
		.contentright1{
			margin-right:30px;
			margin-top:20px;
			width:65%;
			float:right;
			}
		.contentright1 a{
			color:#777777;
			font-size:16px;
			}
		.contentleft1 img{
			margin-left:20px;}
		.contentright  p,a{
			font-size: 20px;
			color: #000;
		}
		.contentright1 p,a{
			font-size: 20px;
			color: #000;
			}
		
</style>
</head>


<body  id="blog">
	<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					
					<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li>
							<a href="index.jsp" target="_blank" style="margin-left: -30px;">首页</a>
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
						<%
						request.setCharacterEncoding("utf-8");

						if (request.getParameter("logout") != null) {//如果进入页面logout有值传入
							session.removeAttribute("UserAccount");//清空session	
							session.removeAttribute("UserType");
							session.removeAttribute("UserId");
						}
						if (session.getAttribute("UserAccount") != null) {
							String UserAccount = (String) session.getAttribute("UserAccount");
							String UserType = session.getAttribute("UserType").toString();
							String UserId = session.getAttribute("UserId").toString();
					%>
					<ul>
						<li><a href="UManage/UserMessageManage.jsp"><%=UserAccount%></a></li>
						<li>|</li>
						<li><a href="index.jsp?logout=1">登出</a></li>
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
			<div class="col-main" style="width:980px">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
					<div >
                    
                 <form>
				<input id="" name="" type="text" placeholder="搜索" autocomplete="off"  style="width:500px ;height:38px;margin-left:150px; 								                margin-top:20px">
				  <input id="" class="submit am-btn" value="搜索" index="1" type="submit" style="background-color:#999999;margin-top:20px">
					</form>
                </div>	
	
    <div>
    	<ul class="topx">
        	<li><a href="">综合</a></li>
            <li><a href="">视频</a></li>  
            <li><a href="">图集</a></li>
            <li><a href="">用户</a></li>     
        </ul>
    </div>
<div class="content">
    	<div class="content1">
    	<div class="contentleft">
        	<img src="assets/i/f14.jpg" width="180px" height="105px"/>
        </div>
        <div class="contentright">
        	<a href="#"><p><strong>贝店刷新社交电商订单量纪录 2018年单季度破1亿</p></a></strong>	
            <a href="#">i黑马·&nbsp;15条评论·&nbsp;9小时前</a>  
        </div>
    </div>
     <hr/>
<div class="content1">
    	<div class="contentleft1">
        	<img src="assets/i/f14.jpg" width="180px" height="105px"/>
        </div>
        <div class="contentright1">
        <a href="#">
          <p><strong>南宁：家政市场再现"用工荒"，订单已经排到元宵节后</strong></p></a>
          <a href="#">广西新闻频道·&nbsp;1条评论·&nbsp;4小时前</a>  
        </div>
    </div>
     <hr/>
     <div class="content1">
    	<div class="contentleft1">
        	<img src="assets/i/f14.jpg" width="180px" height="105px"/>
        </div>
        <div class="contentright1">
        <a href="#"><p><strong>南宁：家政市场再现"用工荒"，订单已经排到元宵节后</strong></p></a>
            <a href="#">广西新闻频道·&nbsp;1条评论·&nbsp;4小时前</a>  
        </div>
    </div>
     <hr/>
     <div class="content1">
    	<div class="contentleft1">
        	<img src="assets/i/f14.jpg" width="180px" height="105px"/>
        </div>
        <div class="contentright1">
        <a href="#"><p><strong>南宁：家政市场再现"用工荒"，订单已经排到元宵节后</strong></p></a>
            <a href="#">广西新闻频道·&nbsp;1条评论·&nbsp;4小时前</a>  
        </div>
    </div>
     <hr/>
      <div class="content1">
    	<div class="contentleft1">
        	<img src="assets/i/f14.jpg" width="180px" height="105px"/>
        </div>
        <div class="contentright1">
        <a href="#"><p><strong>南宁：家政市场再现"用工荒"，订单已经排到元宵节后</strong></p></a>
            <a href="#">广西新闻频道·&nbsp;1条评论·&nbsp;4小时前</a>  
        </div>
    </div>
     <hr/>
 </div>
 </div>
			</div>
                    <ul style="margin-left :480px">
					<li class="am-pagination-prev">
						<a href="">&laquo; Prev</a>	</li>
					<li class="am-pagination-next">
					<a href="">Next &raquo;</a>		</li>
					</ul>
		  			</div>

				</div>
                
				<!--底部-->
				 <div class="footer">
							<div align="center"></div>
							
						
					</div>
			</div>

			
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