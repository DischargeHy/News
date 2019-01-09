package dao;

import java.sql.Date;

public class Comment {
	Integer commentId;
	String commentContent;
	Date commentTime;
	Integer userId;
	Integer newsId;
	Integer replyId;
	String state;
	
	public Comment(String commentContent, Integer userId, Integer newsId, Integer replyId) {
		super();
		this.commentContent = commentContent;
		this.userId = userId;
		this.newsId = newsId;
		this.replyId = replyId;
	}
	public Comment(Integer commentId, String commentContent, Date commentTime, Integer userId, Integer newsId,
			Integer replyId, String state) {
		super();
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
		this.userId = userId;
		this.newsId = newsId;
		this.replyId = replyId;
		this.state = state;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
