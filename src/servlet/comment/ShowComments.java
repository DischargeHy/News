package servlet.comment;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import db.DBCon;
import dto.Comment;
import dto.CommentImpl;

/**
 * Servlet implementation class ShowComments
 */
@WebServlet("/ShowComments")
public class ShowComments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowComments() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String newsIdString=request.getParameter("newsId");
		String commentIdString=request.getParameter("commentId");
		
		CommentImpl commentImpl=new CommentImpl(new DBCon().getCon());
		if (newsIdString!=null) {
			int newsId=Integer.parseInt(newsIdString);
			if (commentIdString!=null) {
				//查看次级评论
				//查看主评论
				int commentId=Integer.parseInt(commentIdString);
				LinkedList<Comment> linkedList=null;
				try {
					linkedList=commentImpl.selectComments(newsId,commentId);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				response.getWriter().print(JSON.toJSONString(linkedList));
			}else {
				//查看主评论
				LinkedList<Comment> linkedList=null;
				try {
					linkedList=commentImpl.selectComments(newsId);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				response.getWriter().print(JSON.toJSONString(linkedList));
			}
		}		
		
	}

}
