package dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;



public class CommentImpl {
	private Connection connection;

	public CommentImpl(Connection connection) {
		this.connection = connection;
	}
	
	public int CountComments(int newsId) throws SQLException{
		String sqlString="SELECT count(*) as count FROM V_comment WHERE newsId=? AND replyId=null";
		PreparedStatement preparedStatement=connection.prepareStatement(sqlString);
		preparedStatement.setInt(1, newsId);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		return resultSet.getInt("count");
	}
	
	public int CountComments(int newsId,int reply) throws SQLException{
		String sqlString="SELECT count(*) as count FROM V_comment WHERE newsId=? replyId=?";
		PreparedStatement preparedStatement=connection.prepareStatement(sqlString);
		preparedStatement.setInt(1, newsId);
		preparedStatement.setInt(2, reply);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		return resultSet.getInt("count");
	}
	
	
	public LinkedList<Comment> selectComments(int newsId) throws SQLException{
		LinkedList<Comment> linkedList=new LinkedList<Comment>();
		
		String sqlString="SELECT * FROM V_comment WHERE newsId=? AND replyId=null";
		PreparedStatement preparedStatement=connection.prepareStatement(sqlString);
		preparedStatement.setInt(1, newsId);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while (resultSet.next()) {
			linkedList.add(new Comment(resultSet.getInt("commentId"), resultSet.getString("commentContent"), 
					resultSet.getDate("commentTime"), resultSet.getInt("userId"), resultSet.getInt("newsId"), 
					resultSet.getInt("replyId"), resultSet.getString("state"),resultSet.getInt("replyCount"),
					resultSet.getString("userName"), resultSet.getString("userHead"),resultSet.getInt("replyUserId"), 
					resultSet.getString("replyUserName"),resultSet.getString("replyUserHead")));
		}
		
		return linkedList;
	}
	
	public LinkedList<Comment> selectComments(int newsId,int replayId) throws SQLException{
		LinkedList<Comment> linkedList=new LinkedList<Comment>();
		
		String sqlString="SELECT * FROM V_comment WHERE newsId=? AND replyId!=null";
		PreparedStatement preparedStatement=connection.prepareStatement(sqlString);
		preparedStatement.setInt(1, newsId);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while (resultSet.next()) {
			linkedList.add(new Comment(resultSet.getInt("commentId"), resultSet.getString("commentContent"), 
					resultSet.getDate("commentTime"), resultSet.getInt("userId"), resultSet.getInt("newsId"), 
					resultSet.getInt("replyId"), resultSet.getString("state"),resultSet.getInt("replyCount"),
					resultSet.getString("userName"), resultSet.getString("userHead"),resultSet.getInt("replyUserId"), 
					resultSet.getString("replyUserName"),resultSet.getString("replyUserHead")));
		}
		
		return linkedList;
		
	}
}
