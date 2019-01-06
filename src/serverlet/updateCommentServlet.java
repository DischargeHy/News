package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BSManage;
public class updateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public updateCommentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String CommentId = request.getParameter("CommentId");
		String operate = request.getParameter("operate");
		int i = 0 ; 
		BSManage bsm = new BSManage();
		PrintWriter out = response.getWriter();
		try {
			i = bsm.changeComment(CommentId, operate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i!=0) {
			out.print("<script>alert('operate success!');location.href='BSManage/commentManage.jsp?page=1';</script>");
		}
		else {
			out.print("<script>alert('operate failed!');location.href='BSManage/commentManage.jsp?page=1';</script>");
		}
	}

}
