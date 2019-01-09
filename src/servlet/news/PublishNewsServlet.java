package servlet.news;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.News;
import dao.NewsImpl;
import db.DBCon;
import util.Url;
 
/**
 * Servlet implementation class PulishNews
 */
@WebServlet("/PublishNews")
public class PublishNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("-----------------PublishNewsGET-----------------");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("-----------------PublishNews-----------------");
		if ((Integer)request.getSession().getAttribute("UserType")!=2) {
			response.sendError(3, "你不是小编！！！");

		}else {
			String newsContent=request.getParameter("newsContent");
			String newsCover=request.getParameter("newsCover");
			String newsTitle=request.getParameter("newsTitle");
			int newsTypeId=Integer.parseInt(request.getParameter("newsTypeId"));
			
	//		String t=request.getParameter("t");
//			System.out.println("newsContent:"+newsContent);
	//		System.out.println("newsCover:"+newsCover);
	//		System.out.println("newsTitle:"+newsTitle);
	//		System.out.println("NewsTypeId:"+newsTypeId);
	//		System.out.println("t:"+t);
			int userId=(Integer) request.getSession().getAttribute("UserId");
	
	//		System.out.println(userId);
	
			Connection connection=new DBCon().getCon();
			NewsImpl newsImpl=new NewsImpl(connection);
	//		News news=new News(newsTitle, newsContent, newsTypeId, 5, newsCover);
			News news=new News(newsTitle, newsContent, newsTypeId, userId, newsCover);
			String newsId=null;
			try {
				newsImpl.insertNews(news);
				newsId=""+newsImpl.getLastInsertId();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			System.out.println(newsId);
			if (newsId!=null) {
				String strJson="{\"url\": \""+Url.getWEBUrlByProject(request)+"/ShowNews?newsId="+newsId+"\",\"uploaded\": 1}";
//				String strJson=Url.getWEBUrlByProject(request)+"/ShowNews?newsId="+newsId;
//				System.out.println(strJson);
				response.setContentType("application/json;charset=utf-8;");
//				response.setContentType("text/plain;");
				response.getWriter().print(strJson);
			}
		
		
		}
		
	}

}
