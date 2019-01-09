package entity;

public class Suggest {
	private int SuggestId;
	private String UserName;
	private String SuggestTime;
	private String UserEmail;
	private String Text;
	private int UserId;

	public Suggest(int suggestId, String userName, String suggestTime, String userEmail, String text) {
		super();
		SuggestId = suggestId;
		UserName = userName;
		SuggestTime = suggestTime;
		UserEmail = userEmail;
		Text = text;
	}
	
	//插入建议表用构造方法
	public Suggest(String text, int userId) {
		super();
		Text = text;
		UserId = userId;
	}

	public String getSuggestTime() {
		return SuggestTime;
	}

	public String getText() {
		return Text;
	}

	public int getUserId() {
		return UserId;
	}

	public int getSuggestId() {
		return SuggestId;
	}

	public String getUserName() {
		return UserName;
	}

	public String getUserEmail() {
		return UserEmail;
	}
	
	
	
	
}
