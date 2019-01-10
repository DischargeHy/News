package dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NewsImpl {
	private Connection connection;

	public NewsImpl(Connection connection) {
		this.connection = connection;
	}
	
public News selectNewsByNewsId(int newsId) throws SQLException {
		
		PreparedStatement ps=connection.prepareStatement("SELECT * from `V_news` where newsId=? ");
		ps.setInt(1, newsId);

		ResultSet resultset=ps.executeQuery();
		if (resultset.next()) {
			return new News(resultset.getInt("newsId"), resultset.getString("newsTitle"), 
					resultset.getString("newsContent"), resultset.getDate("createTime"), resultset.getDate("updateTime"),
					resultset.getInt("newsStatus"), resultset.getInt("browse"), resultset.getInt("newsTypeId"),
					resultset.getInt("userId"), resultset.getString("newsCover"),resultset.getString("author"));
		}else {
			return null;
		}
		
	}
	
}
