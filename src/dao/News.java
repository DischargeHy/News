package dao;

import java.sql.Date;

public class News {
	Integer newsId;
	String newsTitle;
	String newsContent;
	Date createTime;
	Date updateTime;
	Integer newsStatus;
	Integer browse;
	Integer newsTypeId;
	Integer userId;
	
	
	
	
	public News(String newsTitle, String newsContent, Integer newsTypeId, Integer userId, String newsCover) {
		super();
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.newsTypeId = newsTypeId;
		this.userId = userId;
		this.newsCover = newsCover;
	}
	public News(Integer newsId, String newsTitle, String newsContent, Date createTime, Date updateTime,
			Integer newsStatus, Integer browse, Integer newsTypeId, Integer userId, String newsCover) {
		super();
		this.newsId = newsId;
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.newsStatus = newsStatus;
		this.browse = browse;
		this.newsTypeId = newsTypeId;
		this.userId = userId;
		this.newsCover = newsCover;
	}
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getNewsStatus() {
		return newsStatus;
	}
	public void setNewsStatus(Integer newsStatus) {
		this.newsStatus = newsStatus;
	}
	public Integer getBrowse() {
		return browse;
	}
	public void setBrowse(Integer browse) {
		this.browse = browse;
	}
	public Integer getNewsTypeId() {
		return newsTypeId;
	}
	public void setNewsTypeId(Integer newsTypeId) {
		this.newsTypeId = newsTypeId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getNewsCover() {
		return newsCover;
	}
	public void setNewsCover(String newsCover) {
		this.newsCover = newsCover;
	}
	String newsCover;
	
}
