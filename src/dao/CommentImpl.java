package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;

public class CommentImpl {
	private Connection connection;

	public CommentImpl(Connection connection) {
		this.connection = connection;
	}
	
	//
	public boolean insertComment(Comment comment) throws SQLException {

		PreparedStatement preparedStatement=connection.prepareStatement("INSERT INTO `comment` (`commentContent`, `userId`,`newsId`,`replyId`) "
				+ "VALUES (?,?,?,?)");
		preparedStatement.setString(1, comment.getCommentContent());
		preparedStatement.setInt(2, comment.getUserId());
		preparedStatement.setInt(3, comment.getNewsId());
		if (comment.getReplyId()==null) {
			preparedStatement.setNull(4, Types.INTEGER);
		}else {
			preparedStatement.setInt(4, comment.getReplyId());
		}
		
		preparedStatement.execute();

		return true;
	}
	
	public LinkedList<Comment> selectMainComments(int newsId) throws SQLException{
		LinkedList<Comment> linkedList=new LinkedList<Comment>();
		
		PreparedStatement preparedStatement=connection.prepareStatement("");
		
		
		
		return linkedList;
	}
	
	public LinkedList<Comment> selectSecondaryComments(int newsId,int replayId) throws SQLException{
		LinkedList<Comment> linkedList=new LinkedList<Comment>();
		
		PreparedStatement preparedStatement=connection.prepareStatement("");
		
		
		
		return linkedList;
	}
}
