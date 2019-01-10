package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.NewsManage;
import entity.User;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		
		String userAccount=request.getParameter("txt_uAccount");	
		String userName=request.getParameter("txt_uName");	
		String userPass=request.getParameter("txt_uPass");
		String ReuserPass=request.getParameter("txt_ReuPass");
		String userEMail=request.getParameter("txt_uemail");
		String userBirthday="2000-01-01";
		int userSex=0;
		int userType=1;
		String userHead="http://localhost:8080/News/img/java.png";
		
		if (request.getParameter("txt_uAccount").equals("") || request.getParameter("txt_uPass").equals("")) {
			out.println("<script>alert('UserAccount or Password is null');window.location.href='Register.jsp'</script>");
		} else {
			// 判断2次密码是否相同
			if (userPass.equals(ReuserPass)) {
				// 获取数据库中所有用户名
				NewsManage nm=new NewsManage();
				ArrayList list=nm.showUser();
				
				// 当TBL_USER表为空
				if (list.size() == 0) {
					User newUser =new User(userAccount, ReuserPass, userName, userEMail, userType, userHead, userSex, userBirthday);
					int j = nm.insertUser(newUser);// 调用新增用户方法
					if (j > 0) {
						out.println("<script>alert('Register Success');window.location.href='Login.jsp'</script>");
					} else {
						out.println("<script>alert('Register Fail');window.location.href='Register.jsp'</script>");
					}
				} else {
					int k = 0;// 用于判断用户名是否存在
					for (int i = 0; i < list.size(); i++) {
						User user = (User) list.get(i);
						if (user.getUserAccount().equals(userAccount)) {
							k = 1;
							break;
						}
					}
					if (k == 1) {
						out.println("<script>alert('This username has been used');window.location.href='Register.jsp'</script>");
					} else {
						User newUser =new User(userAccount, ReuserPass, userName, userEMail, userType, userHead, userSex, userBirthday);
						int j = nm.insertUser(newUser);
						if (j > 0) {
							out.println("<script>alert('Register Success');window.location.href='Login.jsp'</script>");
						} else {
							out.println("<script>alert('Register Fail');window.location.href='Register.jsp'</script>");
						}
					}
				}
			} else {
				out.println("<script>alert('The passwords entered twice are different！');window.location.href='Register.jsp'</script>");
			}
		}
	}

}
