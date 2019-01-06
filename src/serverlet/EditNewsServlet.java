package serverlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.News;
import dao.NewsImpl;
import db.NewsManage;
import entity.NewsType;

/**
 * Servlet implementation class EditNewsServlet
 */
@WebServlet("/EditNews")
public class EditNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if ((Integer)request.getSession().getAttribute("UserType")!=2) {
//			System.out.println("你不是小编");
			response.sendError(3, "你不是小编！！！");
		}else {
			News news=null;
			String newsId=request.getParameter("newsId");
			if (newsId!=null) {
				NewsImpl newsImpl=new NewsImpl(new db.DBCon().getCon());
				try {
					news=newsImpl.selectNewsByNewsId(Integer.parseInt(newsId));
					request.setAttribute("news", news);
					
//					System.out.println(news.getNewsContent());
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			NewsManage nm = new NewsManage();
			ArrayList<NewsType> list =nm.showNewsType();  //新闻类型列表
			
			request.setAttribute("typeList", list);
			request.getRequestDispatcher("/WEB-INF/jsp/editNews.jsp").forward(request, response);
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
