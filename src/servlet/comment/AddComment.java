package servlet.comment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mysql.cj.xdevapi.DbDoc;

import dao.Comment;
import dao.CommentImpl;
import db.DBCon;
import util.wordFilter.SensitivewordFilter;

/**
 * Servlet implementation class Comment
 */
@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		System.out.println("addComment");
		request.setCharacterEncoding("UTF-8");
		int userId=(Integer)request.getSession().getAttribute("UserId");
		int newsId=Integer.parseInt(request.getParameter("newsId"));

		String commentContent=request.getParameter("commentContent");
		
		SensitivewordFilter sFilter=(SensitivewordFilter)this.getServletContext().getAttribute("wordFilter");
		
		commentContent=sFilter.replaceSensitiveWord(commentContent,SensitivewordFilter.minMatchTYpe,"*");
		
		
		
		String replyIdString=request.getParameter("replyId");
		Comment comment=null;

		try {
			int replyId=Integer.parseInt(replyIdString);
			comment=new Comment(commentContent, userId, newsId,replyId);
		} catch (Exception e) {
			// TODO: handle exception
			comment=new Comment(commentContent, userId, newsId);
			
		}
		CommentImpl commentImpl=new CommentImpl(new DBCon().getCon());
		
		
		String jsonString;
		try {
			commentImpl.insertComment(comment);
			jsonString=JSON.toJSONString(comment);
			response.setContentType("application/json;charset=UTF-8");
//			System.out.println(jsonString);
//			response.getWriter().print("true");
			response.getWriter().print(jsonString);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}

	}

}
