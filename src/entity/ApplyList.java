package entity;

public class ApplyList {
	private int applyId;
	private int UserId;
	private String Reasons;
	private String Time;
	private String UserName;
	private String UserHead;
	private String UserEMail;
	public int getApplyId() {
		return applyId;
	}
	public String getReasons() {
		return Reasons;
	}
	public String getTime() {
		return Time;
	}
	public int getUserId() {
		return UserId;
	}
	public String getUserName() {
		return UserName;
	}
	public ApplyList(int applyId, int userId, String reasons, String time, String userName, String userHead,
			String userEMail) {
		super();
		this.applyId = applyId;
		UserId = userId;
		Reasons = reasons;
		Time = time;
		UserName = userName;
		UserHead = userHead;
		UserEMail = userEMail;
	}
	public String getUserHead() {
		return UserHead;
	}
	public String getUserEMail() {
		return UserEMail;
	}
	
}
