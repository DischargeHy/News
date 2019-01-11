package servlet.news;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.News;
import dao.NewsImpl;
import db.DBCon;
import util.Url;
import util.wordFilter.SensitivewordFilter;
 
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
			String newsIdString=request.getParameter("newsId");
			
			SensitivewordFilter sFilter=(SensitivewordFilter)this.getServletContext().getAttribute("wordFilter");
			Set<String> set = sFilter.getSensitiveWord(newsContent, SensitivewordFilter.minMatchTYpe);
			
			//存在敏感词
			if (set.size()>0) {
				response.setContentType("text/plain;charset=UTF-8");
				response.getWriter().print("{\"uploaded\": 1 ,\"message\":\"新闻内容中包含敏感词的个数为：" + set.size() + "。分别是：" + set.toString()+"\"}");
			}else {
				int newsTypeId=Integer.parseInt(request.getParameter("newsTypeId"));
				
				int userId=(Integer) request.getSession().getAttribute("UserId");
		
		//		System.out.println(userId);
		
				Connection connection=new DBCon().getCon();
				NewsImpl newsImpl=new NewsImpl(connection);
				
				//存在newsId则更新
				if(newsIdString==null||newsIdString.equals("")) {
					System.out.println("插入");
					News news=new News(newsTitle, newsContent, newsTypeId, userId, newsCover);
					String newsId=null;
					try {
						newsImpl.insertNews(news);
						newsId=""+newsImpl.getLastInsertId();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
//							System.out.println(newsId);
					if (newsId!=null) {
						String strJson="{\"url\": \""+Url.getWEBUrlByProject(request)+"/ShowNews?newsId="+Integer.parseInt(newsIdString)+"\",\"uploaded\": 1}";
//								String strJson=Url.getWEBUrlByProject(request)+"/ShowNews?newsId="+newsId;
//								System.out.println(strJson);
						response.setContentType("application/json;charset=utf-8;");
//								response.setContentType("text/plain;");
						response.getWriter().print(strJson);
					}
				}else {
					System.out.println("更新");
					News news=new News(Integer.parseInt(newsIdString),newsTitle, newsContent, newsTypeId, userId, newsCover);
					try {
						newsImpl.updateNews(news);
						String strJson="{\"url\": \""+Url.getWEBUrlByProject(request)+"/ShowNews?newsId="+Integer.parseInt(newsIdString)+"\",\"uploaded\": 1}";
//						String strJson=Url.getWEBUrlByProject(request)+"/ShowNews?newsId="+newsId;
//						System.out.println(strJson);
						response.setContentType("application/json;charset=utf-8;");
//						response.setContentType("text/plain;");
						response.getWriter().print(strJson);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}

				
			}

		}
		
	}

}
