package entity;

public class ApplyList {
	private int applyId;
	private int UserId;
	private String Reasons;
	private String Time;
	private String UserName;
	private String UserHead;
	private String UserEMail;
	private String State;
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
	
	public String getState() {
		return State;
	}
	
	public String getUserHead() {
		return UserHead;
	}
	public String getUserEMail() {
		return UserEMail;
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
	//插入申请表所使用的构造方法
	public ApplyList(int userId, String reasons, String state) {
		super();
		UserId = userId;
		Reasons = reasons;
		State = state;
	}
	//查询申请表主要内容
	public ApplyList(int applyId, int userId, String reasons, String time, String state) {
		super();
		this.applyId = applyId;
		UserId = userId;
		Reasons = reasons;
		Time = time;
		State = state;
	}
	
	
	
}
