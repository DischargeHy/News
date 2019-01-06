package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BSManage;
public class updateNewsExamine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public updateNewsExamine() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String NewsId = request.getParameter("NewsId");
		String state = request.getParameter("state");
		int i = 0;
		BSManage bsm = new BSManage();
		PrintWriter out = response.getWriter();  
		try {
			if( request.getParameter("News")==null) {
				i = bsm.changeNewsStatus(NewsId, state);
				if(i!=0) {
					out.print("<script>alert('deal success!');location.href='BSManage/NewsExamine.jsp?page=1';</script>");
				}
				else {
					out.print("<script>alert('deal failed!');location.href='BSManage/NewsExamine.jsp?page=1';</script>");
				}
			}
			else {
				String search = request.getParameter("search");
				String page = request.getParameter("page");
				i = bsm.changeNewsStatus(NewsId, state);
				if(i!=0) {
					out.print("<script>alert('deal success!');location.href='BSManage/NewsManage.jsp?page=" + page + "&search=" + search + "';</script>");
				}
				else {
					out.print("<script>alert('deal failed!');location.href='BSManage/NewsManage.jsp?page=" + page + "&search=" + search + "';</script>");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
