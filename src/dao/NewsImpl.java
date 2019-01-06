package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class NewsImpl {
	
	
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
}
