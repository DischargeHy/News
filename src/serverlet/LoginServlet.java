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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		
		String UserAccount=request.getParameter("txt_uName");		
		String uPass=request.getParameter("txt_uPass");
		if(request.getParameter("txt_uName").equals("")||request.getParameter("txt_uPass").equals("")){
			out.println("<script>alert('UserName or Pass is null');window.location.href='Login.jsp'</script>");
		}
		
		NewsManage nm=new NewsManage();
		ArrayList list=nm.showUser();
		if (list.size()==0) {
			out.println("<script>alert('无该用户');window.location.href='Login.jsp'</script>");
		} else {
			int k=0;
			String RealuPass=null;
			User user=null;
			for (int i = 0; i < list.size(); i++) {
				user = (User) list.get(i);
				if (user.getUserAccount().equals(UserAccount)){
					k=1;
					RealuPass=user.getUserPass();
					break;
				}
			}
			if (k==1) {
				if(uPass.equals(RealuPass)){
					HttpSession session=request.getSession();
					session.setAttribute("UserAccount", UserAccount);
					session.setAttribute("UserType", user.getUserType());
					response.sendRedirect("index.jsp");
				}else{
					out.println("<script>alert('Password error');window.location.href='Login.jsp'</script>");
				}
			} else {
				out.println("<script>alert('this User is not exist');window.location.href='Login.jsp'</script>");
			}
		}
	}

}
