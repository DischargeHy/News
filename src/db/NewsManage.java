package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.News;
import entity.NewsType;
import entity.User;

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
		String sqlString = "select NewsId,NewsTitle,CreateTime,NewsTypeName,UserName from News,NewsType,`User` WHERE News.NewsTypeId=NewsType.NewsTypeId and News.UserId=`User`.UserId and NewsTitle like '%" + NewsTitle1 + "%' ORDER BY CreateTime limit " + limit +",6";
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
		String sqlString = "select NewsId,NewsTitle,CreateTime,NewsTypeName,UserName from News,NewsType,`User` WHERE News.NewsTypeId=NewsType.NewsTypeId and News.UserId=`User`.UserId and `User`.UserId = " + UserId1 + " ORDER BY CreateTime limit " + limit +",6";
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
		String sqlString = "select NewsId,NewsTitle,CreateTime,NewsTypeName,UserName from News,NewsType,`User` WHERE News.NewsTypeId=NewsType.NewsTypeId and News.UserId=`User`.UserId ORDER BY CreateTime limit " + limit +",6";
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
	//总页数查询
		public int getNewsPage() {
			Connection con = conn.getCon();
			int i = 0;
			String sqlString = "select * from News,NewsType,`User` WHERE News.NewsTypeId=NewsType.NewsTypeId and News.UserId=`User`.UserId ORDER BY CreateTime";
			try {
	 			PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				rs.last();
				i = rs.getRow();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return i;
		}
		//根据用户Id的总页数查询
		public int getNewsPage(int UserId1) {
			Connection con = conn.getCon();
			int i = 0;
			String sqlString = "select * from News,NewsType,`User` WHERE News.NewsTypeId=NewsType.NewsTypeId and News.UserId=`User`.UserId and `User`.UserId = " + UserId1 + " ORDER BY CreateTime";
			try {
	 			PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				rs.last();
				i = rs.getRow();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return i;
		}
		//根据Title的总页数查询
		public int getNewsPage(String NewsTitle1) {
			Connection con = conn.getCon();
			int i = 0;
			String sqlString = "select NewsId,NewsTitle,CreateTime,NewsTypeName,UserName from News,NewsType,`User` WHERE News.NewsTypeId=NewsType.NewsTypeId and News.UserId=`User`.UserId and NewsTitle like '%" + NewsTitle1 + "%' ORDER BY CreateTime";
			try {
	 			PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				rs.last();
				i = rs.getRow();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return i;
		}	

	//查询用户---User表
	public ArrayList showUser() {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		String sqlString = "select * from User";
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				int userId = rs.getInt("UserId");
				String userAccount = rs.getString("UserAccount");
				String userPass = rs.getString("UserPass");
				String userName = rs.getString("UserName");
				String userEMail = rs.getString("UserEMail");
				int userType = rs.getInt("UserType");
				String userHead = rs.getString("UserHead");
				int userAge = rs.getInt("UserAge");
				User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userAge);
				list.add(user);
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