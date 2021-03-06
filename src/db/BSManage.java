package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import entity.User;

public class BSManage {
	DBCon dbcon = new DBCon();
	public int updateNewsType(int NewsTypeId,String NewsTypeName) throws SQLException {
		int count = 0;
		Connection con = dbcon.getCon();
		String sqlString = "update NewsType set NewsTypeName='" + NewsTypeName + "' where NewsTypeId="
				+ NewsTypeId;
		try {
			PreparedStatement ps = con.prepareStatement(sqlString);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
	public int deleteNewsType(int NewsTypeId) throws SQLException {
		int count = 0;
		Connection con = dbcon.getCon();
		String sqlString = "delete from NewsType where NewsTypeId=" + NewsTypeId;
		try {
			PreparedStatement ps = con.prepareStatement(sqlString);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
	public int insertNewsType(String NewsTypeName) throws SQLException {
		int count = 0;
		Connection con = dbcon.getCon();
		String sqlString = "insert into `NewsType`(`NewsTypeName`) values('" + NewsTypeName + "')";
		try {
			PreparedStatement ps = con.prepareStatement(sqlString);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
	public int deleteNews(int NewsId) throws SQLException {
		int count = 0;
		Connection con = dbcon.getCon();
		String sqlString = "delete from News where NewsId=" + NewsId;
		try {
			PreparedStatement ps = con.prepareStatement(sqlString);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
	public int changeUserType(String UserId,String type) {
		int count = 0;
		Connection con = dbcon.getCon();
		int UserId1 = Integer.parseInt(UserId);
		int type1 = Integer.parseInt(type);
		String sqlString = "update User set UserType="+ type1 +" where UserId=" + UserId1;
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			count = pre.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con);
		}
		return count;
	}
	public int upadateApply(String ApplyId,String state) {
		int count = 0;
		Connection con = dbcon.getCon();
		int ApplyId1 = Integer.parseInt(ApplyId);
		System.out.println(ApplyId1);
		String sqlString = "update Apply set state='"+ state +"' where ApplyId=" + ApplyId1;
		try {
			PreparedStatement pre = con.prepareStatement(sqlString);
			count = pre.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con);
		}
		return count;
	}
	public int changeComment(String CommentId,String operate) throws SQLException {
		int count = 0;
		Connection con = dbcon.getCon();
		int CommentId1 = Integer.parseInt(CommentId);
		int operate1 = Integer.parseInt(operate);
		String sqlString = null;
		switch (operate1) {
		case 0:
			sqlString = "update Comment set state='"+ 0 +"' where CommentId=" + CommentId1;
			break;
		case 1:
			sqlString = "delete from Comment where CommentId=" + CommentId1;
			break;
		default:
			break;
		}
		try {
			PreparedStatement ps = con.prepareStatement(sqlString);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
	public int deleteApply(String UserId) throws SQLException {
		int count = 0;
		Connection con = dbcon.getCon();
		int UserId1 = Integer.parseInt(UserId);
		String sqlString = "delete from Apply where UserId=" + UserId1;
		try {
			PreparedStatement ps = con.prepareStatement(sqlString);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
	public int changeNewsStatus(String NewsId,String state) throws SQLException {
		int count = 0;
		Connection con = dbcon.getCon();
		int NewsId1 = Integer.parseInt(NewsId);
		int state1 = Integer.parseInt(state);
		String sqlString = null;
			sqlString = "update News set NewsStatus="+ state1 +" where NewsId=" + NewsId1;
		try {
			PreparedStatement ps = con.prepareStatement(sqlString);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
}

