package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.NewsManage;
import entity.ApplyList;
import entity.Suggest;
import entity.User;

/**
 * Servlet implementation class AdviseServlet
 */
public class AdviseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdviseServlet() {
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
		doGet(request, response);
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String text = request.getParameter("txt_advice");


		if (text.equals("")) {
			out.println("<script>alert('Advise can not be empty');history.back(-1)</script>");
		} else {
			Suggest sg=new Suggest(text, userId);
			NewsManage nm = new NewsManage();
			int j = nm.insertAdvise(sg);// 调用新增用户方法
			if (j > 0) {
				out.println("<script>alert('Thank you for your advice');history.back(-1)</script>");
			} else {
				out.println("<script>alert('Submit Fail');history.back(-1)</script>");
			}
		}
	}

}
