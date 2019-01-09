package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BSManage;

/**
 * Servlet implementation class updateNewsServlet
 */
public class updateNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNewsServlet() {
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
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();  
		if(request.getParameter("edit").equals("delete")) {
			int NewsId =Integer.parseInt(request.getParameter("NewsId"));
			BSManage bm = new BSManage();
			int i = 0;
			try {
				i = bm.deleteNews(NewsId);
				if(i!=0) {
					out.print("<script>alert('delete success!');location.href='BSManage/NewsManage2.jsp?page=1';</script>");
				}
				else {
					out.print("<script>alert('delete failed!');location.href='BSManage/NewsManage2.jsp?page=1';</script>");
					out.flush();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}
