package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CommentImpl {
	private Connection connection;

	public CommentImpl(Connection connection) {
		this.connection = connection;
	}
	
	//
	public boolean insertNews(Comment comment) throws SQLException {

		PreparedStatement preparedStatement=connection.prepareStatement("INSERT INTO `comment` (`commentContent`, `userId`,`newsId`,`replyId`) "
				+ "VALUES (?,?,?,?)");
		preparedStatement.setString(1, comment.getCommentContent());
		preparedStatement.setInt(2, comment.getUserId());
		preparedStatement.setInt(3, comment.getNewsId());
		preparedStatement.setInt(4, comment.getReplyId());

		preparedStatement.execute();

		return true;
	}
	
}
