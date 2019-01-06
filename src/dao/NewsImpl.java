package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class NewsImpl {
	
	private Connection connection;

	public NewsImpl(Connection connection) {
		this.connection = connection;
	}
	
	//
	public boolean insertNews(News news) throws SQLException {

		PreparedStatement preparedStatement=connection.prepareStatement("INSERT INTO `News` (`newsTitle`, `newsContent`,`newsTypeId`,`userId`,`newsCover`) "
				+ "VALUES (?,?,?,?,?)");
		preparedStatement.setString(1, news.getNewsTitle());
		preparedStatement.setString(2, news.getNewsContent());
		preparedStatement.setInt(3, news.getNewsTypeId());
		preparedStatement.setInt(4, news.getUserId());
		preparedStatement.setString(5, news.getNewsCover());
		preparedStatement.execute();

		return true;
	}
	
	public int getLastInsertId() throws SQLException {
		PreparedStatement ps=connection.prepareStatement("SELECT LAST_INSERT_ID()");
		ResultSet resultset=ps.executeQuery();
		if (resultset.next()) {
			return resultset.getInt(1);
		}else {
			return -1;
		}
	}
	
	public News selectNewsByNewsId(int newsId) throws SQLException {
		
		PreparedStatement ps=connection.prepareStatement("SELECT newsId, newsTitle, newsContent, createTime, "
				+ "updateTime, newsStatus, browse, newsTypeId, userId, newsCover"
				+ " from `News` " + 
				" where newsId=? ");
		ps.setInt(1, newsId);
		ResultSet resultset=ps.executeQuery();
		if (resultset.next()) {
			return new News(resultset.getInt("newsId"), resultset.getString("newsTitle"), 
					resultset.getString("newsContent"), resultset.getDate("createTime"), resultset.getDate("updateTime"),
					resultset.getInt("newsStatus"), resultset.getInt("browse"), resultset.getInt("newsTypeId"),
					resultset.getInt("userId"), resultset.getString("newsCover"));
		}else {
			return null;
		}
		
	}
	
}
