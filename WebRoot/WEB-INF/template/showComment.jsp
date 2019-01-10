<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
<div class="pinglun">
	<div id="who"></div>
	<form action="" method="post" id="commentForm" name="commentForm"
		enctype="application/x-www-form-urlencoded">
		<input type="hidden" id="newsId" name="newsId" value="${newsId}" /> <input
			type="hidden" id="replyId" name="replyId" value="" />
		<textarea rows="5" cols="20" id="commentContent" name="commentContent"></textarea>
	</form>
	<button onclick="submit_pinglun()">提交评论</button>
	<button onclick="resetForm()">更改为回复新闻</button>
</div>
<div id="comment_area"></div>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/comment.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	showComments(${newsId});
</script>
