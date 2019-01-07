package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import entity.ApplyList;
import entity.CommentReport;
import entity.News;
import entity.NewsExamineList;
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
	//通过UseerId查找
	public ArrayList showNewsList(int UserId1,String page,String NewsStatus) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		String NewsListTable = "NewsListStatu" + NewsStatus + "View";
		System.out.println(NewsListTable);
		limit+= (page_int-1)*6;
		String sqlString = "select * from " + NewsListTable + " WHERE UserId = " + UserId1 + " limit " + limit +",6";
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
	//通过UserId和Title查找
	public ArrayList showNewsList(int UserId1,String NewsTitle,String page,String NewsStatus) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		String NewsListTable = "NewsListStatu" + NewsStatus + "View";
		limit+= (page_int-1)*6;
		String sqlString = "select * from " + NewsListTable + " WHERE UserId =" + UserId1 + " and NewsTitle like '%" + NewsTitle + "%' limit " + limit + ",6";
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
	//根据用户Id的总页数查询新闻
	public int getNewsPage(int UserId1,String NewsStatus) {
		Connection con = conn.getCon();
		int i = 0;
		String NewsListTable = "NewsListStatu" + NewsStatus + "View";
		String sqlString = "select * from " + NewsListTable + " WHERE UserId = " + UserId1;
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
	//根据Title查询新闻总页数(管理员)
	public int getNewsPage(String NewsTitle1,String NewsType) {
		Connection con = conn.getCon();
		int i = 0;
		String sqlString = null;
		if(NewsType.equals("0")) {
			sqlString = "select * from NewsListStatuView WHERE NewsTitle like '%" + NewsTitle1 + "%'";
		}
		else {
			sqlString = "select * from NewsListStatuView WHERE NewsTypeId=" + NewsType + " and NewsTitle like '%" + NewsTitle1 + "%'";
		}
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
	//小编的新闻搜索
	public int getNewsPage(int UserId1,String NewsTitle,String NewsStatus) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		String NewsListTable = "NewsListStatu" + NewsStatus + "View";
		int i = 0;
		String sqlString = "select * from " + NewsListTable + " WHERE UserId =" + UserId1 + " and NewsTitle like '%" + NewsTitle + "%'";
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
	//通过标题查询新闻列表
	public ArrayList showNewsList(String NewsTitle1,String page,String NewsType) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		limit+= (page_int-1)*6;
		String sqlString = null;
		if(NewsType.equals("0")) {
			sqlString = "select * from NewsListStatuView WHERE NewsTitle like '%" + NewsTitle1 + "%' limit " + limit +",6";
		}
		else {
			sqlString = "select * from NewsListStatuView WHERE NewsTypeId=" + NewsType + " and NewsTitle like '%" + NewsTitle1 + "%' limit " + limit +",6";
		}
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
	//按分页显示所有新闻(管理员)
	public ArrayList showNewsListByType(String page,String NewsType) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		int limit = 0;
		int page_int = Integer.parseInt(page);
		limit+= (page_int-1)*6;
		String sqlString = null;
		if(NewsType.equals("0")) {
			sqlString = "select * from NewsListStatuView limit " + limit +",6";
		}
		else {
			sqlString = "select * from NewsListStatuView where NewsTypeId='" + NewsType + "' limit " + limit +",6";
		}
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
	//总新闻页数查询(管理员)
		public int getNewsPageAll(String NewsType) {
			Connection con = conn.getCon();
			int i = 0;
			String sqlString = null;
			if(NewsType.equals("0")) {
				sqlString = "select * from NewsListStatuView";
			}
			else {
				sqlString = "select * from NewsListStatuView where NewsTypeId='" + NewsType + "'";
			}
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
		//通过页数筛选用户
		public ArrayList showUser(String type,String page) {
			ArrayList list = new ArrayList();
			int limit = 0;
			int page_int = Integer.parseInt(page);
			limit+= (page_int-1)*10;
			Connection con = conn.getCon();
			int searchType = Integer.parseInt(type);
			String view = null;
			switch (searchType) {
			case 0:
				view = "UserPage";
				break;
			case 1:
				view = "UserType1";
				break;
			case 2:
				view = "UserType2";
				break;
			case 3:
				view = "UserType3";
				break;
			case 4:
				view = "UserType4";
				break;
			default:
				break;
			}
			String sqlString = "select * from `" + view + "` where UserAccount!='admin' limit " + limit +",10";
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
					String userBirthday = rs.getString("UserBirthday");
					int userSex = rs.getInt("UserSex");
					User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userSex, userBirthday);
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
		//按页显示申请
		public ArrayList showApply(String page) {
			ArrayList list = new ArrayList();
			int limit = 0;
			int page_int = Integer.parseInt(page);
			limit+= (page_int-1)*10;
			Connection con = conn.getCon();
			String sqlString = "select * from `ApplyView` limit " + limit +",10";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					int applyId = rs.getInt("applyId");
					int userId = rs.getInt("userId");
					String reasons = rs.getString("reasons");
					String time = rs.getString("time");
					String userHead = rs.getString("userHead");
					String userName = rs.getString("userName");
					String userEMail = rs.getString("UserEMail");
					ApplyList al = new ApplyList(applyId, userId, reasons, time, userName, userHead, userEMail);
					list.add(al);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return list;
		}
		//按页显示审核
		public ArrayList showNewsExamine(String page) {
			ArrayList list = new ArrayList();
			int limit = 0;
			int page_int = Integer.parseInt(page);
			limit+= (page_int-1)*10;
			Connection con = conn.getCon();
			String sqlString = "select * from `NewsExamineView` limit " + limit +",10";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					int newsId = rs.getInt("newsId");
					String userName = rs.getString("userName");
					String userEMail = rs.getString("userEMail");
					String newsTitle = rs.getString("newsTitle");
					String createTime = rs.getString("createTime");
					String newsTypeName = rs.getString("newsTypeName");
					String updateTime = rs.getString("updateTime");
					NewsExamineList nel = new NewsExamineList(newsId, userName, userEMail, newsTitle, createTime, newsTypeName, updateTime);
					list.add(nel);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return list;
		}
		//返回审核页数
		public int getNewsExaminePage() {
			Connection con = conn.getCon();
			int i = 0;
			String sqlString = "select * from `NewsExamineView`";
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
		//按页显示所有举报信息
		public ArrayList showReport(String page) {
			ArrayList list = new ArrayList();
			int limit = 0;
			int page_int = Integer.parseInt(page);
			limit+= (page_int-1)*10;
			Connection con = conn.getCon();
			String sqlString = "select * from `CommentReportView` limit " + limit +",10";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					int commentId = rs.getInt("commentId");
					int replyId = rs.getInt("replyId");
					int userId = rs.getInt("userId");
					int newsId = rs.getInt("newsId");
					String newsTitle = rs.getString("newsTitle");
					String userName = rs.getString("userName");
					String state = rs.getString("state");
					String commentTime = rs.getString("commentTime");
					String commentContent = rs.getString("commentContent");
					String userAccount = rs.getString("userAccount");
					CommentReport cr = new CommentReport(commentId, userId, replyId, newsId, newsTitle, userName, state, commentContent, commentTime, userAccount);
					list.add(cr);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return list;
		}
		//按页显示举报信息，根据小编ID
		public ArrayList showReport(String page,int UserId) {
			ArrayList list = new ArrayList();
			int limit = 0;
			int page_int = Integer.parseInt(page);
			limit+= (page_int-1)*10;
			Connection con = conn.getCon();
			String sqlString = "select * from `CommentReportView` where UserId=" + UserId + " limit " + limit +",10";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					int commentId = rs.getInt("commentId");
					int replyId = rs.getInt("replyId");
					int userId = rs.getInt("userId");
					int newsId = rs.getInt("newsId");
					String newsTitle = rs.getString("newsTitle");
					String userName = rs.getString("userName");
					String state = rs.getString("state");
					String commentTime = rs.getString("commentTime");
					String userAccount = rs.getString("userAccount");
					String commentContent = rs.getString("commentContent");
					CommentReport cr = new CommentReport(commentId, userId, replyId, newsId, newsTitle, userName, state, commentContent, commentTime, userAccount);
					list.add(cr);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return list;
		}
		//返回举报页数
		public int getReportPage() {
			Connection con = conn.getCon();
			int i = 0;
			String sqlString = "select * from `CommentReportView`";
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
		//总申请页数查询
		public int getApplyPage() {
			Connection con = conn.getCon();
			int i = 0;
			String sqlString = "select * from ApplyView";
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
		//总用户页数查询
		public int getUserPage(String type) {
			Connection con = conn.getCon();
			int i = 0;
			int searchType = Integer.parseInt(type);
			String view = null;
			switch (searchType) {
			case 0:
				view = "UserPage";
				break;
			case 1:
				view = "UserType1";
				break;
			case 2:
				view = "UserType2";
				break;
			case 3:
				view = "UserType3";
				break;
			default:
				break;
			}
			String sqlString = "select * from `"+view+"`";
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
			return i-1;
		}
		//总用户页数查询根据搜索条件
		public int getUserPage(String type,String search) {
			Connection con = conn.getCon();
			int i = 0;
			int searchType = Integer.parseInt(type);
			String view = null;
			switch (searchType) {
			case 0:
				view = "UserPage";
				break;
			case 1:
				view = "UserType1";
				break;
			case 2:
				view = "UserType2";
				break;
			case 3:
				view = "UserType3";
				break;
			default:
				break;
			}
			String sqlString = "select * from `"+view+"` where UserAccount like '%" + search  + "%'" ;
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
			return i-1;
		}
		//分页显示用户查询结果
		public ArrayList showUser(String type,String page,String search) {
			ArrayList list = new ArrayList();
			int limit = 0;
			int page_int = Integer.parseInt(page);
			limit+= (page_int-1)*10;
			Connection con = conn.getCon();
			int searchType = Integer.parseInt(type);
			String view = null;
			switch (searchType) {
			case 0:
				view = "UserPage";
				break;
			case 1:
				view = "UserType1";
				break;
			case 2:
				view = "UserType2";
				break;
			case 3:
				view = "UserType3";
				break;
			default:
				break;
			}
			String sqlString = "select * from `" + view + "` where UserAccount!='admin' and UserAccount like '%" + search + "%' limit " + limit +",10";
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
					String userBirthday = rs.getString("UserBirthday");
					int userSex = rs.getInt("UserSex");
					User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userSex, userBirthday);
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
				String userBirthday = rs.getString("UserBirthday");
				int userSex = rs.getInt("UserSex");
				User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userSex, userBirthday);
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
	
	//查询用户(根据UserId)---User表
		public ArrayList showUserByUserId(String Userid) {
			ArrayList list = new ArrayList();
			Connection con = conn.getCon();
			String sqlString = "select * from User where UserId=?";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				pre.setString(1, Userid);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					int userId = rs.getInt("UserId");
					String userAccount = rs.getString("UserAccount");
					String userPass = rs.getString("UserPass");
					String userName = rs.getString("UserName");
					String userEMail = rs.getString("UserEMail");
					int userType = rs.getInt("UserType");
					String userHead = rs.getString("UserHead");
					String userBirthday = rs.getString("UserBirthday");
					int userSex = rs.getInt("UserSex");
					User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userSex, userBirthday);
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
				String userBirthday = rs.getString("UserBirthday");
				int userSex = rs.getInt("UserSex");
				User user=new User(userId, userAccount, userPass, userName, userEMail, userType, userHead, userSex, userBirthday);
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
		String sqlString = "insert into User(UserAccount,UserPass,UserName,UserEMail,UserType,UserHead,UserBirthday,UserSex) values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			pre.setString(1, user.getUserAccount());
			pre.setString(2, user.getUserPass());
			pre.setString(3, user.getUserName());
			pre.setString(4, user.getUserEMail());
			pre.setInt(5, user.getUserType());
			pre.setString(6, user.getUserHead());
			pre.setString(7, user.getUserBirthday());
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
				String newsContent=rs.getString("newsContent");
				int userId = rs.getInt("UserId");
				int newsStatus = rs.getInt("NewsStatus");
				int newsContentNum=showContentNum(newsId);//调用方法查询回复数
				News news = new News(newsId, newsTitle, userName, createTime,userId, browse, updateTime, newsStatus, newsCover, newsContentNum, newsContent);
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
			String sqlString = "select COUNT(*) as allLine from News where newstypeid=? and NewsStatus=1";
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
		
		// 根据user对象修改User表（不包括密码）
		public int updateUserNoPass(User user) {
			int count = 0;
			Connection con = conn.getCon();
			String sqlString = "update User set UserName=?,UserType=?,UserHead=?,UserBirthday=?,UserSex=? where Userid=?";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				pre.setString(1, user.getUserName());
				pre.setInt(2, user.getUserType());
				pre.setString(3, user.getUserHead());
				pre.setString(4, user.getUserBirthday());
				pre.setInt(5, user.getUserSex());
				pre.setInt(6, user.getUserId());
				count = pre.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return count;
		}
		
		// 根据user对象修改User表（包括密码）
				public int updateUserIncludePass(User user) {
					int count = 0;
					Connection con = conn.getCon();
					String sqlString = "update User set UserPass=? where Userid=?";
					try {
						PreparedStatement pre = con.prepareStatement(sqlString);
						pre.setString(1, user.getUserPass());
						pre.setInt(2, user.getUserId());
						count = pre.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						conn.closeAll(con);
					}
					return count;
				}
		
	// 查询用户(根据UserId和密码)---User表
	public int showUserByUserIdAndPass(int Userid,String UserPass) {
		int count=0;
		Connection con = conn.getCon();
		String sqlString = "select * from User where UserId=? and UserPass=?";
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			pre.setInt(1, Userid);
			pre.setString(2, UserPass);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				count++;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeAll(con);
		}
		return count;
	}
	
	//根据newsTitle决定搜索页面(Serach.jsp)要分多少页
			public int ShowPageCountBynewsTitle(String search){
				if(search==null) {
					search="*";
				}
				int pageCount=0;
				Connection con = conn.getCon();
				String sqlString = "select COUNT(*) as allLine from News where newstitle like '%" + search  + "%' and NewsStatus=1";
				try {
					PreparedStatement pre = con.prepareStatement(sqlString);
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
	
	//通过NewsTitle查询新闻列表（带分页）
		public ArrayList showNewsListByNewsTitle(String search,int Page) {
			ArrayList list = new ArrayList();
			Connection con = conn.getCon();
			if(search==null) {
				search="*";
			}
			String sqlString = "select * from News,`User` where News.UserId=`User`.UserId and NewsTitle like '%" + search  + "%' and NewsStatus=1";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
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
		
		//插申请小编信息---ApplyList表
		public int insertApply(ApplyList al) {
			int i = 0;
			Connection con = conn.getCon();
			String sqlString = "insert into Apply(UserId,Reasons,Time,state) values(?,?,?,?)";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				pre.setInt(1, al.getUserId());
				pre.setString(2, al.getReasons());
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				pre.setString(3, df.format(new java.sql.Date(System.currentTimeMillis())));
				pre.setString(4, al.getState());
				i = pre.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return i;
		}
		
		//通过UserId查询小编申请表---ApplyList表
		public ApplyList showApplyListByUserId(int userid) {
			ApplyList al=null;
			Connection con = conn.getCon();
			String sqlString = "select * from Apply WHERE UserId=?";
			try {
	 			PreparedStatement pre = con.prepareStatement(sqlString);
	 			pre.setInt(1,userid);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					int applyId = rs.getInt("applyId");
					int userId = rs.getInt("UserId");
					String reasons = rs.getString("reasons");
					String time = rs.getString("time");
					String state = rs.getString("state");
					al=new ApplyList(applyId, userId, reasons, time, state);
					break;
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.closeAll(con);
			}
			return al;
		}
		
		//通过浏览数查询新闻列表
		public ArrayList showHotNews() {
			ArrayList list = new ArrayList();
			Connection con = conn.getCon();
			String sqlString = "select * from News,`User` where News.UserId=`User`.UserId and NewsStatus=1 order by Browse desc limit 10";
			try {
				PreparedStatement pre = con.prepareStatement(sqlString);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					String createTime = rs.getString("CreateTime");
					
					int newsId = rs.getInt("NewsId");
					String newsTitle = rs.getString("NewsTitle");
					String userName = rs.getString("UserName");
					int browse=rs.getInt("browse");
					String updateTime = rs.getString("updateTime");
					String newsCover=rs.getString("newsCover");
					String newsContent=rs.getString("newsContent");
					int userId = rs.getInt("UserId");
					int newsStatus = rs.getInt("NewsStatus");
					int newsContentNum=showContentNum(newsId);//调用方法查询回复数
					News news = new News(newsId, newsTitle, userName, createTime,userId, browse, updateTime, newsStatus, newsCover, newsContentNum, newsContent);
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