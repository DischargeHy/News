package entity;

public class News {
	private int NewsId;
	private String NewsName;
	private String UserName;
	private String CreateTime;
	private String NewsTypeName;
	public News(int newsId, String newsName, String userName, String createTime, String newsTypeName) {
		super();
		NewsId = newsId;
		NewsName = newsName;
		UserName = userName;
		CreateTime = createTime;
		NewsTypeName = newsTypeName;
	}
	public int getNewsId() {
		return NewsId;
	}
	public String getNewsName() {
		return NewsName;
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
