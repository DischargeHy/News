package serverlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BSManage;
import db.NewsManage;

public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public updateUserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String type = request.getParameter("UserType");
		String UserId = request.getParameter("UserId");
		
		System.out.println(type);
		System.out.println(UserId);
		PrintWriter out = response.getWriter();  
		BSManage bsm = new BSManage();
		int i = bsm.changeUserType(UserId, type);
		if(i!=0) {
			out.print("<script>alert('change success!');location.href='BSManage/UserManage.jsp?page=1';</script>");
		}
		else {
			out.print("<script>alert('change failed!');location.href='BSManage/UserManage.jsp?page=1';</script>");
		}
	}

}
