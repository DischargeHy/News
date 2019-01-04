package entity;

public class News {
	private int NewsId;//新闻编号
	private String NewsTitle;//新闻标题
	private String UserName;//作者名
	private String CreateTime;//创建时间
	private String NewsTypeName;//新闻类型名
	
	private int UserId;//用户Id
	private int Browse;//浏览量
	private String UpdateTime;//更新时间
	private int NewsStatus;//新闻状态
	private String NewsCover;//新闻封面
	private int NewsContentNum;//新闻评论数
	
	
	public News(int newsId, String newsTitle, String userName, String createTime, String newsTypeName) {
		super();
		NewsId = newsId;
		NewsTitle = newsTitle;
		UserName = userName;
		CreateTime = createTime;
		NewsTypeName = newsTypeName;
	}
	
	
	
	public News(int newsId, String newsTitle, String userName, int browse, String updateTime, String newsCover,
			int newsContentNum) {
		super();
		NewsId = newsId;
		NewsTitle = newsTitle;
		UserName = userName;
		Browse = browse;
		UpdateTime = updateTime;
		NewsCover = newsCover;
		NewsContentNum = newsContentNum;
	}



	public int getNewsContentNum() {
		return NewsContentNum;
	}

	public String getNewsCover() {
		return NewsCover;
	}

	public int getUserId() {
		return UserId;
	}
	public int getBrowse() {
		return Browse;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public int getNewsStatus() {
		return NewsStatus;
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
