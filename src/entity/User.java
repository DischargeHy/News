package entity;

public class User {
	private int UserId;
	private String UserAccount;
	private String UserPass;
	private String UserName;
	private String UserEMail;
	private int UserType;
	private String UserHead;
	private int UserAge;
	
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public String getUserAccount() {
		return UserAccount;
	}
	public void setUserAccount(String userAccount) {
		UserAccount = userAccount;
	}
	public String getUserPass() {
		return UserPass;
	}
	public void setUserPass(String userPass) {
		UserPass = userPass;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserEMail() {
		return UserEMail;
	}
	public void setUserEMail(String userEMail) {
		UserEMail = userEMail;
	}
	public int getUserType() {
		return UserType;
	}
	public void setUserType(int userType) {
		UserType = userType;
	}
	public String getUserHead() {
		return UserHead;
	}
	public void setUserHead(String userHead) {
		UserHead = userHead;
	}
	public int getUserAge() {
		return UserAge;
	}
	public void setUserAge(int userAge) {
		UserAge = userAge;
	}
	
	public User(int userId, String userAccount, String userPass, String userName, String userEMail, int userType,
			String userHead, int userAge) {
		super();
		UserId = userId;
		UserAccount = userAccount;
		UserPass = userPass;
		UserName = userName;
		UserEMail = userEMail;
		UserType = userType;
		UserHead = userHead;
		UserAge = userAge;
	}

	
}
