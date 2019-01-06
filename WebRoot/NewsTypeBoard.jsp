<%@page import="db.NewsManage"%>
<%@page import="entity.NewsType"%>
<%@page import="entity.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 米窝新闻</title>
<link rel="icon" type="image/png" href="assets1/i/tubiao.png">
		<link rel="stylesheet" href="assets1/css/amazeui.min.css">
		<link rel="stylesheet" href="assets1/css/app.css">
		<link rel="stylesheet" href="assets1/css/style.css">
		<style>
			li{
				list-style: none;
			}
			
		</style>
</head>
<body>
<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li>
							<a href="index.jsp"  style="margin-left: -75px;">首页</a>
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
						int Page = 1;
						if (request.getParameter("page") != null) {
							Page = Integer.parseInt(request.getParameter("page"));
						}

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
		<!--end header -->
		<br/>
		<!-- start banner_x -->
		<div class="banner_x center">

			<div class="nav left">
			<ul>
				<li><img src="./assets1/i/tubiao.png"
					style="width: 45px; height: 45px; margin-left: -70px; margin-right: 10px;" /></li>
				<li><a href="index.jsp">热点</a></li>
				<%
					NewsManage nm = new NewsManage();

					ArrayList list = nm.showNewsType();
					int NewsTypeId = 1;
					if (request.getParameter("NewsTypeId") != null) {
						NewsTypeId = Integer.parseInt(request.getParameter("NewsTypeId"));
					}

					int pageCount = nm.ShowPageCountBynewstypeid(NewsTypeId);//总分页数
					if (Page < 1)
						Page = 1;//如果页码小于1，则页码置为第1页
					if (Page >= pageCount)
						Page = pageCount;//如果当前页码大于总分的页数，就将当前页码置为最后一页

					for (int i = 0; i < list.size(); i++) {
						NewsType newstype = (NewsType) list.get(i);
				%>
				<li>
					<a href="NewsTypeBoard.jsp?NewsTypeId=<%=newstype.getNewsTypeId()%>"><%=newstype.getNewsTypeName()%></a>
				</li>
				<%
					}
				%>

			</ul>
		</div>
			<div class="search fr " >
				<form action="Search.jsp" method="post">
					<div class="text fl"> <input type="text" class="shuru" placeholder="请输入搜索内容">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索" />
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
		<!-- end banner_x -->

		<!-- banner start -->
	
		<!-- banner end -->

		<!-- content srart -->
		<div class="am-g am-g-fixed blog-fixed center">
			<div class="am-u-md-8 am-u-sm-12">

			<article class="am-g blog-entry-article">
				<%
					ArrayList list2 = nm.showNewsListByNewsTypeId(NewsTypeId, Page);/*通过新闻类型Id查询新闻内容  */
					for (int i = 0; i < list2.size(); i++) {
						News news = (News) list2.get(i);
				%>
				<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
					<img src=<%=news.getNewsCover() %> alt="" class="am-u-sm-12">
				</div>
				<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
					<span><a href="" class="blog-color">article &nbsp;</a></span> <span>
						@<%=news.getUserName() %> &nbsp;</span> <span><%=news.getUpdateTime() %></span>
					<h1>
						<a href=""></a>
					</h1>
					<p><%= %></p>
					<p>
						<a href="" class="blog-continue">continue reading</a>
					</p>
				</div>
			</article>
			<%
				}
			%>

			<article class="am-g blog-entry-article">
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
						<img src="assets1/i/f6.jpg" alt="" class="am-u-sm-12">
					</div>
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
						<span><a href="" class="blog-color">article&nbsp;</a></span>
						<span>@amazeUI &nbsp;</span>
						<span>2015/10/9</span>
						<h1><a href="">世间所有的相遇，都是久别重逢。</a></h1>
						<p>你可以选择在原处不停地跟周遭不解的人解释你为何这么做，让他们理解你，你可以选择什么都不讲，自顾自往前走。
						</p>
						<p>
							<a href="" class="blog-continue">continue</a>
						</p>
					</div>
				</article>
				<article class="am-g blog-entry-article">

					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
						<span><a href="" class="blog-color">article&nbsp;</a></span>
						<span> @amazeUI &nbsp;</span>
						<span>2015/10/9</span>
						<h1><a href="">My dear </a></h1>
						<p>看绿色的邮筒孤独地站在街的对面。
						</p>
						<p>
							<a href="" class="blog-continue">continue reading</a>
						</p>
					</div>
				</article>
				<article class="am-g blog-entry-article">
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
						<img src="assets1/i/f12.jpg" alt="" class="am-u-sm-12">
					</div>
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
						<span><a href="" class="blog-color">article&nbsp;</a></span>
						<span>@amazeUI</span>
						<span>2015/10/9</span>
						<h1><a href="">陌上花开，可缓缓归矣。</a></h1>
						<p>那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。我们就在骑楼下躲雨，看绿色的邮筒孤独地站在街的对面。
						</p>
						<p>
							<a href="" class="blog-continue">continue</a>
						</p>
					</div>
				</article>

				<article class="am-g blog-entry-article">
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
						<img src="assets1/i/f22.jpg" alt="" class="am-u-sm-12">
					</div>
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
						<span><a href="" class="blog-color">article&nbsp;</a></span>
						<span>@amazeUI</span>
						<span>2015/10/9</span>
						<h1><a href="">爱自己是终生浪漫的开始</a></h1>
						<p>the whole of life becomes an act of letting go, but what always hurts the most is not taking a moment to say goodbye
						</p>
						<p>
							<a href="" class="blog-continue">continue</a>
						</p>
					</div>
				</article>

				<article class="am-g blog-entry-article">
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
						<img src="assets1/i/f18.jpg" alt="" class="am-u-sm-12">
					</div>
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
						<span><a href="" class="blog-color">article&nbsp;</a></span>
						<span> @amazeUI &nbsp;</span>
						<span>2015/10/9</span>
						<h1><a href="">My dear amazeUI, Hello </a></h1>
						<p>那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。我们就在骑楼下躲雨，看绿色的邮筒孤独地站在街的对面。
						</p>
						<p>
							<a href="" class="blog-continue">continue reading</a>
						</p>
					</div>
				</article>
				<article class="am-g blog-entry-article">

					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
						<span><a href="" class="blog-color">article&nbsp;</a></span>
						<span> @amazeUI &nbsp;</span>
						<span>2015/10/9</span>
						<h1><a href="">My dear </a></h1>
						<p>看绿色的邮筒孤独地站在街的对面。
						</p>
						<p>
							<a href="" class="blog-continue">continue reading</a>
						</p>
					</div>
				</article>
				<article class="am-g blog-entry-article">
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
						<img src="assets1/i/f20.jpg" alt="" class="am-u-sm-12">
					</div>
					<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
						<span><a href="" class="blog-color">article&nbsp;</a></span>
						<span> @amazeUI &nbsp;</span>
						<span>2015/10/9</span>
						<h1><a href="">My way or the highway</a></h1>
						<p>A big wind rises， clouds are driven away. Home am Inow the world is under my sway. Where are brave men to guard the four frontiers today！
						</p>
						<p>
							<a href="" class="blog-continue">continue reading</a>
						</p>
					</div>
				</article>

				<ul class="am-pagination">
					<li class="am-pagination-prev">
						<a href="">&laquo; Prev</a>
					</li>
					<li class="am-pagination-next">
						<a href="">Next &raquo;</a>
					</li>
				</ul>
			</div>

			<div class="am-u-md-4 am-u-sm-12 blog-sidebar">
				<div class="blog-sidebar-widget blog-bor">
					<h2 class="blog-text-center blog-title"><span>最新资讯</span></h2>
					<img src="assets1/i/f14.jpg" alt="about me" class="blog-entry-img">
					<p>妹纸</p>
					<p>我不想成为一个庸俗的人。十年百年后，当我们死去，质疑我们的人同样死去，后人看到的是裹足不前、原地打转的你，还是一直奔跑、走到远方的我？</p>
				</div>

				<div class="blog-sidebar-widget blog-bor">
					<h2 class="blog-title"><span>24小时新闻</span></h2>
					<ul class="am-list">
						<li>
							<a href="#"><img src="assets1/i/f14.jpg" alt="about me" style="height: 75px;width: 75px;">每个人都有一道伤口， 或深或浅，盖</a>
						</li>
						<li>
							<a href="#"><img src="assets1/i/f14.jpg" alt="about me" style="height: 75px;width: 75px;">每个人都有一道伤口， 或深或浅，盖</a>
						</li>
						<li>
							<a href="#"><img src="assets1/i/f14.jpg" alt="about me" style="height: 75px;width: 75px;">每个人都有一道伤口， 或深或浅，盖</a>
						</li>
						<li>
							<a href="#"><img src="assets1/i/f14.jpg" alt="about me" style="height: 75px;width: 75px;">每个人都有一道伤口， 或深或浅，盖</a>
						</li>
					</ul>
				</div>

				<div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
					<h2 class="blog-title"><span>友情链接</span></h2>
					<div class="am-u-sm-12 blog-clear-padding">
						<a href="" class="blog-tag">海外网</a>
						<a href="" class="blog-tag">中国网</a>
						<a href="" class="blog-tag">光明网</a>
						<a href="" class="blog-tag">北青网</a>
						<a href="" class="blog-tag">闽南网</a>
						<a href="" class="blog-tag">乐居网</a>
						<a href="" class="blog-tag">海外网</a>
						<a href="" class="blog-tag">中国网</a>
						<a href="" class="blog-tag">光明网</a>
						<a href="" class="blog-tag">北青网</a>
						<a href="" class="blog-tag">闽南网</a>
						<a href="" class="blog-tag">乐居网</a>
						<a href="" class="blog-tag">海外网</a>
						<a href="" class="blog-tag">中国网</a>
						<a href="" class="blog-tag">光明网</a>
						<a href="" class="blog-tag">北青网</a>
						<a href="" class="blog-tag">闽南网</a>
						<a href="" class="blog-tag">乐居网</a>
						<a href="" class="blog-tag">法制晚报</a>
						<a href="" class="blog-tag">汽车之家</a>
					</div>
				</div>
				<div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
					<h2 class="blog-title"><span>更多</span></h2>
					<div class="am-u-sm-12 blog-clear-padding">
						<a href="" class="blog-tag"> 关于米窝</a>
						<a href="" class="blog-tag"> 加入米窝</a>
						<a href="" class="blog-tag"> 媒体报道</a>
						<a href="" class="blog-tag"> 媒体合作</a>
						<a href="" class="blog-tag"> 产品合作</a>
						<a href="" class="blog-tag"> 合作说明</a>
						<a href="" class="blog-tag"> 产品说明</a>
						<a href="" class="blog-tag"> 广告投放</a>
						<a href="" class="blog-tag"> 联系我们</a>
						<a href="" class="blog-tag"> 用户协议</a>
						<a href="" class="blog-tag"> 隐私政策</a>
						<a href="" class="blog-tag"> 侵权投诉</a>
						<a href="" class="blog-tag"> 廉洁举报</a>
						<a href="" class="blog-tag"> 企业认证</a>
					</div>
				</div>
				
			</div>
		</div>
		<!-- content end -->

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
		<script src="assets1/js/jquery.min.js"></script>
		<!--<![endif]-->
		<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
		<script src="assets1/js/amazeui.min.js"></script>
	</body>

</html>