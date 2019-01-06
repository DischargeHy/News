package entity;

public class NewsExamineList {
	private int NewsId;
	private String UserName;
	private String UserEMail;
	private String NewsTitle;
	private String CreateTime;
	private String NewsTypeName;
	private String UpdateTime;
	public NewsExamineList(int newsId, String userName, String userEMail, String newsTitle, String createTime,
			String newsTypeName, String updateTime) {
		super();
		NewsId = newsId;
		UserName = userName;
		UserEMail = userEMail;
		NewsTitle = newsTitle;
		CreateTime = createTime;
		NewsTypeName = newsTypeName;
		UpdateTime = updateTime;
	}
	public int getNewsId() {
		return NewsId;
	}
	public String getUserName() {
		return UserName;
	}
	public String getUserEMail() {
		return UserEMail;
	}
	public String getNewsTitle() {
		return NewsTitle;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public String getNewsTypeName() {
		return NewsTypeName;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
}
