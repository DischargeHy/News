package entity;

public class Suggest {
	private int SuggestId;
	private String UserName;
	private String SuggestTime;
	private String UserEmail;
	private String Text;
	public int getSuggestId() {
		return SuggestId;
	}
	public String getUserName() {
		return UserName;
	}
	public String getSuggestTime() {
		return SuggestTime;
	}
	public String getUserEmail() {
		return UserEmail;
	}
	public String getText() {
		return Text;
	}
	public Suggest(int suggestId, String userName, String suggestTime, String userEmail, String text) {
		super();
		SuggestId = suggestId;
		UserName = userName;
		SuggestTime = suggestTime;
		UserEmail = userEmail;
		Text = text;
	}
}
