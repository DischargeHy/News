package serverlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.NewsManage;
import entity.User;

/**
 * Servlet implementation class UserPassUpdateServlet
 */
public class UserPassUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPassUpdateServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		int userId = Integer.parseInt(request.getParameter("userId"));
		String RealUserPass = request.getParameter("txt_uRealPass");// 原密码
		String userPass = request.getParameter("txt_uPass");// 新密码
		String ReuserPass = request.getParameter("txt_ReuPass");// 在次输入新密码

		// 修改密码
		if (RealUserPass.equals("") || userPass.equals("") || ReuserPass.equals("")) {
			out.println(
					"<script>alert('If you want to change your password,Three password options cannot be empty!');window.location.href='UManage/UserPassManage.jsp'</script>");
		} else {
			NewsManage nm = new NewsManage();
			// 验证密码
			if (nm.showUserByUserIdAndPass(userId, RealUserPass) > 0) {
				// 验证两次输入的新密码是否不一致
				if (userPass.equals(ReuserPass)) {
					User user = new User(userId, ReuserPass);
					int j = nm.updateUserIncludePass(user);// 调用修改用户信息方法（包括密码）
					if (j > 0) {
						out.println("<script>alert('Update Success');window.location.href='UManage/UserPassManage.jsp'</script>");
					} else {
						out.println("<script>alert('Update Fail');window.location.href='UManage/UserPassManage.jsp'</script>");
					}
				} else {
					out.println("<script>alert('Entering a new password twice is not the same');window.location.href='UManage/UserPassManage.jsp'</script>");
				}

			} else {
				out.println("<script>alert('Original password is wrong');window.location.href='UManage/UserPassManage.jsp'</script>");
			}

		}

	}

}
