<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="icon" type="image/png" href="assets1/i/tubiao.png">
<link rel="stylesheet" href="assets1/css/amazeui.min.css">
<link rel="stylesheet" href="assets1/css/app.css">
<link rel="stylesheet" href="assets1/css/style.css"> -->


</head>

<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/comment.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>



<!-- <div id="comment_area" class="comment_area">

	<div class="d">
		
		<div class="d_author">
			<div class="d_author_head"><img class="d_author_head_img" src=""></div>
			<div class="d_author_name"></div>
		</div>
		<div class="d_post_comtent_main" >
			<div class="p_content">
				<div class="p_text"></div>
				<div class="p_bottom">
					<button class="am-btn am-btn-primary" data-am-collapse="{target: '#reply_ul'}">回复</button>
				</div>
			</div>
			<div class="reply_content">
				<ul class="reply_ul am-nav am-collapse" id="reply_ul">
					评论下的回复
					<li class="reply_li">sdf
						<div class="reply_li_div_head"><img class="reply_img" src=""></div>
						<div class="reply_li_div_content">
							<div class="reply_text"></div>
							<div class="reply_bottom"></div>
						</div>
					</li>
					
					<li>asdf
						<div></div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div></div>
</div>	 -->
	
	
<button class="am-btn am-btn-primary" data-am-collapse="{target: '#collapse-nav'}">Menu <i class="am-icon-bars"></i></button>
<nav>
  <ul id="collapse-nav" class="am-nav am-collapse">
    <li><a href="">开始使用</a></li>
    <li><a href="">CSS 介绍</a></li>
    <li class="am-active"><a href="">JS 介绍</a></li>
    <li><a href="">功能定制</a></li>
  </ul>
</nav>


<button onclick="showComments('190')">shwoComments('86')</button>
<button onclick="show_reply('86','60')">show_reply('86','60')</button>

<div id="comment_area"></div>
<script type="text/javascript">
	showComments(86);
</script>
</body>
</html>