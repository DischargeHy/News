package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.News;
import entity.NewsType;

public class NewsManage {
	DBCon conn = null;

	public NewsManage() {
		conn = new DBCon();
	}
	
	
	//��ѯ���������Ϣ---NewsType��
	public ArrayList showNewsType() {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		String sqlString = "select * from NewsType";
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				int newsTypeId = rs.getInt("NewsTypeId");
				String newsTypeName = rs.getString("NewsTypeName");
				NewsType newstype = new NewsType();
				newstype.setNewsTypeId(newsTypeId);
				newstype.setNewsTypeName(newsTypeName);
				list.add(newstype);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeAll(con);
		}
		return list;
	}
	//通过标题查询新闻列表
	public ArrayList showNewsList(String NewsTitle1,String page) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		limit+= (page_int-1)*6;
		String sqlString = "select NewsId,NewsTitle,CreateTime,NewsTypeName,UserName \n" + 
				"from News,NewsType,`User` \n" + 
				"WHERE News.NewsTypeId=NewsType.NewsTypeId \n" + 
				"and News.UserId=`User`.UserId and NewsTitle like '%" + NewsTitle1 + "%' ORDER BY CreateTime limit" + limit +",6";
		try {
 			PreparedStatement pre = con.prepareStatement(sqlString);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				int newsId = rs.getInt("NewsId");
				String newsTitle = rs.getString("NewsTitle");
				String createTime = rs.getString("CreateTime");
				String newsTypeName = rs.getString("NewsTypeName");
				String userName = rs.getString("UserName");
				News news = new News(newsId, newsTitle, userName, createTime, newsTypeName);
				list.add(news);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeAll(con);
		}
		return list;
	}
	//通过UseerId查找
	public ArrayList showNewsList(int UserId1,String page) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		limit+= (page_int-1)*6;
		String sqlString = "select NewsId,NewsTitle,CreateTime,NewsTypeName,UserName \n" + 
				"from News,NewsType,`User` \n" + 
				"WHERE News.NewsTypeId=NewsType.NewsTypeId \n" + 
				"and News.UserId=`User`.UserId and UserId = " + UserId1 + " ORDER BY CreateTime limit" + limit +",6";
		try {
 			PreparedStatement pre = con.prepareStatement(sqlString);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				int newsId = rs.getInt("NewsId");
				String newsTitle = rs.getString("NewsTitle");
				String createTime = rs.getString("CreateTime");
				String newsTypeName = rs.getString("NewsTypeName");
				String userName = rs.getString("UserName");
				News news = new News(newsId, newsTitle, userName, createTime, newsTypeName);
				list.add(news);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeAll(con);
		}
		return list;
	}
	//显示所有新闻
	public ArrayList showNewsList(String page) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		limit+= (page_int-1)*6;
		String sqlString = "select NewsId,NewsTitle,CreateTime,NewsTypeName,UserName \n" + 
				"from News,NewsType,`User` \n" + 
				"WHERE News.NewsTypeId=NewsType.NewsTypeId \n" + 
				"and News.UserId=`User`.UserId ORDER BY CreateTime limit" + limit +",6";
		try {
 			PreparedStatement pre = con.prepareStatement(sqlString);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				int newsId = rs.getInt("NewsId");
				String newsTitle = rs.getString("NewsTitle");
				String createTime = rs.getString("CreateTime");
				String newsTypeName = rs.getString("NewsTypeName");
				String userName = rs.getString("UserName");
				News news = new News(newsId, newsTitle, userName, createTime, newsTypeName);
				list.add(news);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeAll(con);
		}
		return list;
	}
}