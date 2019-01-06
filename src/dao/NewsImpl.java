package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class NewsImpl {
	
	//
	public boolean insertNews(News news,Connection conn) throws SQLException {

		PreparedStatement preparedStatement=conn.prepareStatement("INSERT INTO `News` (`newsTitle`, `newsContent`,`newsTypeId`,`userId`,`newsCover`) "
				+ "VALUES (?,?,?,?,?)");
		preparedStatement.setString(1, news.getNewsTitle());
		preparedStatement.setString(2, news.getNewsContent());
		preparedStatement.setInt(3, news.getNewsTypeId());
		preparedStatement.setInt(4, news.getUserId());
		preparedStatement.setString(5, news.getNewsCover());
		preparedStatement.execute();

		return true;
	}
	
	public int getLastInsertId(Connection conn) throws SQLException {
		PreparedStatement ps=conn.prepareStatement("SELECT LAST_INSERT_ID()");
		ResultSet resultset=ps.executeQuery();
		if (resultset.next()) {
			return resultset.getInt(1);
		}else {
			return -1;
		}
	}
	
}
