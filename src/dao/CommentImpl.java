package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;

import entity.User;

public class CommentImpl {
	private Connection connection;

	public CommentImpl(Connection connection) {
		this.connection = connection;
	}
	
//	public User getAuthor(int commentId) throws SQLException {
//		String sqlString="SELECT User.* FROM User,Comment WHERE User.userId=Comment.userId AND commentId=?";
//		PreparedStatement preparedStatement=connection.prepareStatement(sqlString);
//		preparedStatement.setInt(1, commentId);
//		ResultSet resultSet=preparedStatement.executeQuery();
//		return new User(resultSet.getInt("userId"),resultSet.getString("userAccount"),resultSet.getString("userName"),
//				);
//		
//	}
	
	//
	public boolean insertComment(Comment comment) throws SQLException {
		
		String sql="INSERT INTO `Comment` (`commentContent`, `userId`,`newsId`,`replyId`) "
				+ "VALUES (?,?,?,?)";
//		System.out.println(sql);
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
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
	
	public boolean delectComment(int commentId) throws SQLException {
		
		String sql="DELETE FROM `Comment` WHERE commentId=?";
//		System.out.println(sql);
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		preparedStatement.setInt(1, commentId);
		
		preparedStatement.execute();
		return true;
	}
	
	public boolean reportComment(int commentId) throws SQLException {
		String sql="UPDATE `Comment` SET state=1 WHERE commentId=?";
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		preparedStatement.setInt(1, commentId);
		
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
