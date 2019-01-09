package dto;

import java.sql.Date;

public class Comment {
	Integer commentId;
	String commentContent;
	Date commentTime;
	Integer userId;
	Integer newsId;
	Integer replyId;
	String state;
	Integer replyCount;
	String userName;   //发言人
	String userHead;
	
	Integer replyUserId;    
	String replyUserName;   //回复发言的那个人的名字
	String replyUserHead;
	public Comment() {
		
	}
	public Comment(Integer commentId, String commentContent, Date commentTime, Integer userId, Integer newsId,
			Integer replyId, String state, Integer replyCount, String userName, String userHead, Integer replyUserId,
			String replyUserName, String replyUserHead) {
		super();
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
		this.userId = userId;
		this.newsId = newsId;
		this.replyId = replyId;
		this.state = state;
		this.replyCount = replyCount;
		this.userName = userName;
		this.userHead = userHead;
		this.replyUserId = replyUserId;
		this.replyUserName = replyUserName;
		this.replyUserHead = replyUserHead;
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
	public Integer getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserHead() {
		return userHead;
	}
	public void setUserHead(String userHead) {
		this.userHead = userHead;
	}
	public Integer getReplyUserId() {
		return replyUserId;
	}
	public void setReplyUserId(Integer replyUserId) {
		this.replyUserId = replyUserId;
	}
	public String getReplyUserName() {
		return replyUserName;
	}
	public void setReplyUserName(String replyUserName) {
		this.replyUserName = replyUserName;
	}
	public String getReplyUserHead() {
		return replyUserHead;
	}
	public void setReplyUserHead(String replyUserHead) {
		this.replyUserHead = replyUserHead;
	}
}
