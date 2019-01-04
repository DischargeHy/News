package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}

