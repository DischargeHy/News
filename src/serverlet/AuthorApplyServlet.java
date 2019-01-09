package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.NewsManage;
import entity.ApplyList;

/**
 * Servlet implementation class AuthorApplyServlet
 */
public class AuthorApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AuthorApplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		int userId = Integer.parseInt(request.getParameter("userId"));
		String reasons = request.getParameter("txt_apply");
		String state = "申请中";

		if (reasons.equals("")) {
			out.println("<script>alert('You must have a reason!');window.location.href='UManage/UserMessageManage.jsp'</script>");
		} else {

			ApplyList al = new ApplyList(userId, reasons, state);
			NewsManage nm = new NewsManage();
			int j = nm.insertApply(al);// 调用新增用户方法
			if (j > 0) {
				out.println("<script>alert('Apply Success');window.location.href='UManage/UserMessageManage.jsp'</script>");
			} else {
				out.println("<script>alert('Apply Fail');window.location.href='UManage/UserMessageManage.jsp'</script>");
			}
		}
	}

}
