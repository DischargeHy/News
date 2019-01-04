package entity;

public class News {
	private int NewsId;
	private String NewsTitle;
	private String UserName;
	private String CreateTime;
	private String NewsTypeName;
	public News(int newsId, String newsTitle, String userName, String createTime, String newsTypeName) {
		super();
		NewsId = newsId;
		NewsTitle = newsTitle;
		UserName = userName;
		CreateTime = createTime;
		NewsTypeName = newsTypeName;
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
	public String getCreateTime() {
		return CreateTime;
	}
	public String getNewsTypeName() {
		return NewsTypeName;
	}
	
}
