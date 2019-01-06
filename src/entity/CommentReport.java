package entity;

public class CommentReport {
	private int CommentId;
	private int ReplyId;
	private int NewsId;
	private String NewsTitle;
	private String UserName;
	private String state;
	private String CommentTime;
	private String UserAccount;
	public CommentReport(int commentId, int replyId, int newsId, String newsTitle, String userName, String state,
			String commentTime, String userAccount) {
		super();
		CommentId = commentId;
		ReplyId = replyId;
		NewsId = newsId;
		NewsTitle = newsTitle;
		UserName = userName;
		this.state = state;
		CommentTime = commentTime;
		UserAccount = userAccount;
	}
	public int getCommentId() {
		return CommentId;
	}
	public int getReplyId() {
		return ReplyId;
	}
	public int getNewsId() {
		return NewsId;
	}
	public String getNewsTitle() {
		return NewsTitle;
	}
	public String getUserName() {
		return UserName;
	}
	public String getState() {
		return state;
	}
	public String getCommentTime() {
		return CommentTime;
	}
	public String getUserAccount() {
		return UserAccount;
	}	
	
}
