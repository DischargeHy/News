package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


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
	public ArrayList showNewsByTitle(String title) {
		ArrayList list = new ArrayList();
		Connection con = conn.getCon();
		String sqlString = "select * from news where NewsTitle like '%" + title + "%'";
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
}