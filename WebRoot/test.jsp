<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/comment.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

<div id="comment_area" class="comment_area">

	<div class="d">
		
		<div class="d_author">
			<div class="d_author_head"><img class="d_author_head_img" src=""></div>
			<div class="d_author_name"></div>
		</div>
		<div class="d_post_comtent_main">
			<div class="p_content"></div>
			<div class="reply_content">
				<ul class="reply_ul" id="reply_ul">
					<!-- 评论下的回复 -->
					<li class="reply_li">
						<div class="reply_li_div">
							<div class="reply_li_div_head">
							</div>
							<div class="reply_li_div_content">
							</div>
						</div>
					</li>
					
					<li>
						<div></div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div></div>
</div>	
	
	
<button onclick="showComments('86',`60`)">shwoComments('86')</button>
</body>
</html>