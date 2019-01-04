package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import entity.News;
import entity.NewsType;
import entity.User;

public class NewsManage {
	DBCon conn = null;

	public NewsManage() {
		conn = new DBCon();
	}
	
	int indexPageSize=6;//主页面每页要放的个数
	
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
				int userSex = rs.getInt("UserSex");
				User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userAge, userSex);
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
	public ArrayList showUser(String page) {
		ArrayList list = new ArrayList();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		limit+= (page_int-1)*6;
		Connection con = conn.getCon();
		String sqlString = "select * from User  ORDER BY UserType limit " + limit +",6";
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
				int userSex = rs.getInt("UserSex");
				User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userAge, userSex);
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
	//插入新用户信息---USER表
	public int insertUser(User user) {
		int i = 0;
		Connection con = conn.getCon();
		String sqlString = "insert into User(UserAccount,UserPass,UserName,UserEMail,UserType,UserHead,UserAge,UserSex) values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			pre.setString(1, user.getUserAccount());
			pre.setString(2, user.getUserPass());
			pre.setString(3, user.getUserName());
			pre.setString(4, user.getUserEMail());
			pre.setInt(5, user.getUserType());
			pre.setString(6, user.getUserHead());
			pre.setInt(7, user.getUserAge());
			pre.setInt(8, user.getUserSex());
			//pre.setTimestamp(5, new Timestamp(new java.util.Date().getTime()));
//			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//			pre.setString(5, df.format(new java.sql.Date(System.currentTimeMillis())));
			i = pre.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeAll(con);
		}
		return i;
	}		
	
	//通过NewsTypeId查询新闻列表（带分页）
	public ArrayList showNewsListByNewsTypeId(int NewsTypeId,int Page) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		String sqlString = "select * from News,`User` where News.UserId=`User`.UserId and NewsTypeId=? and NewsStatus=1";
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			pre.setInt(1, NewsTypeId);
			ResultSet rs = pre.executeQuery();

			rs.absolute((Page-1)*indexPageSize+1);//指针指向对应页的第一个数据
			int count = 0;
			do{
				if(count>=indexPageSize){
					break;//当计数大于定义的每页个数时跳出循环
				}
				String createTime = rs.getString("CreateTime");
				
				int newsId = rs.getInt("NewsId");
				String newsTitle = rs.getString("NewsTitle");
				String userName = rs.getString("UserName");
				int browse=rs.getInt("browse");
				String updateTime = rs.getString("updateTime");
				String newsCover=rs.getString("newsCover");
				int newsContentNum=showContentNum(newsId);//调用方法查询回复数
				News news = new News(newsId, newsTitle, userName, browse, updateTime, newsCover, newsContentNum);
				list.add(news);
				count++;
			}while (rs.next());
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeAll(con);
		}
		return list;
	}
	
	//根据NewsId查询回复数---Comment表
		public int showContentNum(int newsId) {
			int count = 0;
			Connection con = conn.getCon();
			String sqlString = "select * from `Comment` where newsId=?";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				pre.setInt(1, newsId);
				ResultSet rs = pre.executeQuery();
				rs.last();
				count = rs.getRow();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return count;
		}
		
		//根据newstypeid决定主页面(List.jsp)要分多少页
		public int ShowPageCountBynewstypeid(int newstypeid){
			int pageCount=0;
			Connection con = conn.getCon();
			String sqlString = "select COUNT(*) as allLine from News where newstypeid=?";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				pre.setInt(1, newstypeid);
				ResultSet rs = pre.executeQuery();
				
				while (rs.next()) {
					int allLine = rs.getInt("allLine");//获得查询的总行数
					//确定要分的页数(总页码)
					pageCount = (allLine%indexPageSize==0)?(allLine/indexPageSize):(allLine/indexPageSize+1);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return pageCount;
		}
}