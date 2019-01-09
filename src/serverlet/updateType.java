package serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BSManage;


public class updateType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public updateType() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int NewsTypeId =Integer.parseInt(request.getParameter("NewsTypeId"));
		String NewsTypeName = request.getParameter("NewsTypeName");
		String edit = request.getParameter("edit");
		BSManage bs = new BSManage();
		int num = 0;
		System.out.println(NewsTypeId);
		System.out.println(NewsTypeName);
		PrintWriter out = response.getWriter();  
		if(edit.equals("update")){
			try {
				num = bs.updateNewsType(NewsTypeId, NewsTypeName);
				if(num!=0) {
					out.print("<script>alert('edit success!');location.href='BSManage/NewsTypeManage2.jsp';</script>");
				}
				else {
					out.print("<script>alert('edit failed!');location.href='BSManage/NewsTypeManage2.jsp';</script>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(edit.equals("delete")){
			try {
				num = bs.deleteNewsType(NewsTypeId);
				if(num!=0) {
					out.print("<script>alert('delete success!');location.href='BSManage/NewsTypeManage2.jsp';</script>");
				}
				else {
					out.print("<script>alert('delete failed!');location.href='BSManage/NewsTypeManage2.jsp';</script>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(edit.equals("insert")) {
			try {
				num = bs.insertNewsType(NewsTypeName);
				if(num!=0) {
					out.print("<script>alert('add success!');location.href='BSManage/NewsTypeManage2.jsp';</script>");
				}
				else {
					out.print("<script>alert('add failed!');location.href='BSManage/NewsTypeManage2.jsp';</script>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
