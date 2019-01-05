package entity;

public class User {
	private int UserId;
	private String UserAccount;
	private String UserPass;
	private String UserName;
	private String UserEMail;
	private int UserType;
	private String UserHead;
	private int UserSex;
	private String UserBirthday;
	
	public String getUserBirthday() {
		return UserBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		UserBirthday = userBirthday;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public String getUserAccount() {
		return UserAccount;
	}
	public int getUserSex() {
		return UserSex;
	}
	public void setUserSex(int userSex) {
		UserSex = userSex;
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

	
	public User() {}
	
	//全参数构造方法
	public User(int userId, String userAccount, String userPass, String userName, String userEMail, int userType,
			String userHead, int userSex, String userBirthday) {
		super();
		UserId = userId;
		UserAccount = userAccount;
		UserPass = userPass;
		UserName = userName;
		UserEMail = userEMail;
		UserType = userType;
		UserHead = userHead;
		UserSex = userSex;
		UserBirthday = userBirthday;
	}

	
	//无Id构造方法
		public User(String userAccount, String userPass, String userName, String userEMail, int userType,
				String userHead, int userSex, String userBirthday) {
			super();
			UserAccount = userAccount;
			UserPass = userPass;
			UserName = userName;
			UserEMail = userEMail;
			UserType = userType;
			UserHead = userHead;
			UserSex = userSex;
			UserBirthday = userBirthday;
		}

}
