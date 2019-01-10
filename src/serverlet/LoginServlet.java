
package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.NewsManage;
import entity.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String UserAccount=request.getParameter("txt_uAccount");		
		String UserPass=request.getParameter("txt_uPass");
		if(request.getParameter("txt_uAccount").equals("")||request.getParameter("txt_uPass").equals("")){
			out.println("<script>alert('UserAccount or Pass is null');window.location.href='Login.jsp'</script>");
		}
		
		NewsManage nm=new NewsManage();
		ArrayList list=nm.showUser();
		if (list.size()==0) {
			out.println("<script>alert('this User is not exist!');window.location.href='Login.jsp'</script>");
		} else {
			int k=0;
			String RealUserPass=null;
			User user=null;
			for (int i = 0; i < list.size(); i++) {
				user = (User) list.get(i);
				if (user.getUserAccount().equals(UserAccount)){
					k=1;
					RealUserPass=user.getUserPass();
					break;
				}
			}
			if (k==1) {
				if(UserPass.equals(RealUserPass)){
					//判断是否为封禁账号
					if (user.getUserType() == 4) {
						out.println("<script>alert('Your account is blocked,Cannot log in!');window.location.href='Login.jsp'</script>");
					} else {
						HttpSession session = request.getSession();
						session.setAttribute("UserId", user.getUserId());
						session.setAttribute("UserAccount", UserAccount);
						session.setAttribute("UserType", user.getUserType());
						session.setAttribute("UserName", user.getUserName());
						session.setAttribute("UserHead", user.getUserHead());
						if (user.getUserType() == 1 || user.getUserType() == 2) {
							response.sendRedirect("index.jsp");
						} else {
							response.sendRedirect("BSManage/NewsManage2.jsp?page=1");
						}
					}
				}else{
					out.println("<script>alert('Password error');window.location.href='Login.jsp'</script>");
				}
			} else {
				out.println("<script>alert('this User is not exist');window.location.href='Login.jsp'</script>");
			}
		}
	}

}