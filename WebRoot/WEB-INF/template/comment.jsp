<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="comments" style="width: 400px; height: 200px; background: green;">


</div>
<script type="text/javascript" src="js/comment.js"></script>
<div id="comment" style="width: 200px; height: 100px; background: blue;">
	<form action="" method="post" >
		<input type="hidden" id="newId" name="newId" value="${news.getNewsId()}"/>
		<input type="hidden" id="replyId" name="replyId" value=""/>
		<textarea rows="5" cols="20" id="commentContent" name="commentContent"></textarea>
		<button onclick="pinglun()">提交评论</button>
	</form>
</div>
