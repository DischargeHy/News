package serverlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BSManage;

public class updateApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public updateApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		BSManage bsm = new BSManage();
		int change =Integer.parseInt(request.getParameter("change"));
		String UserId = request.getParameter("UserId");
		String ApplyId = request.getParameter("ApplyId");
		String state = "申请成功";
		int i = 0;
		int k = 0;
		switch (change) {
		case 0:
			state = "申请失败";
			break;
		default:
			break;
		}
		PrintWriter out = response.getWriter();  
		k = bsm.upadateApply(ApplyId, state);
		if(change==1) {
			i = bsm.changeUserType(UserId, "2");
			if(i!=0) {
				out.print("<script>alert('change success!');location.href='BSManage/UserApply2.jsp?page=1';</script>");
			}
			else {
				out.print("<script>alert('change failed!');location.href='BSManage/UserApply2.jsp?page=1';</script>");
			}
		}
		else {
			if(k!=0) {
				out.print("<script>alert('change success!');location.href='BSManage/UserApply2.jsp?page=1';</script>");
			}
			else {
				out.print("<script>alert('change failed!');location.href='BSManage/UserApply2.jsp?page=1';</script>");
			}
		}
		if(i!=0) {
			out.print("<script>alert('change success!');location.href='BSManage/UserApply2.jsp?page=1';</script>");
		}
		else if(k!=0) {
			out.print("<script>alert('change success!');location.href='BSManage/UserApply2.jsp?page=1';</script>");
		}
		
	}

}
