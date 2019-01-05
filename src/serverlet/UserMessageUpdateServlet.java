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
 * Servlet implementation class UserMessageUpdateServlet
 */
public class UserMessageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMessageUpdateServlet() {
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
		
		String Year=request.getParameter("year");
		String Month=request.getParameter("month");
		String Day=request.getParameter("day");
		String UserTypeName=request.getParameter("usertypeName");//获取用户类型的名字
				
		int userId=Integer.parseInt(request.getParameter("userId"));
		String userAccount=request.getParameter("txt_uAccount");	
		String userName=request.getParameter("txt_uName");	
		String RealUserPass=request.getParameter("txt_uRealPass");//原密码
		String userPass=request.getParameter("txt_uPass");//新密码
		String ReuserPass=request.getParameter("txt_ReuPass");//在次输入新密码
		String userEMail=request.getParameter("txt_uemail");
		String userBirthday=Year+"-"+Month+"-"+Day;
		int userSex=Integer.parseInt(request.getParameter("rdo_gender"));
		int userType=1;
		if(UserTypeName.equals("普通用户")) {
			userType=1;
		}
		if(UserTypeName.equals("小编")) {
			userType=2;
		}
		String userHead=null;
		
		/*
		 * //以下输出用于测试是否全接收到数据没有出错 System.out.println(Year); System.out.println(Month);
		 * System.out.println(Day); System.out.println(userId);
		 * System.out.println(userAccount); System.out.println(userName);
		 * System.out.println(RealUserPass); System.out.println(userPass);
		 * System.out.println(ReuserPass); System.out.println(userEMail);
		 * System.out.println(userBirthday); System.out.println(userSex);
		 * System.out.println(userType); System.out.println(userHead); out.println(
		 * "<script>alert('OK');window.location.href='UManage/UserMessageManage.jsp'</script>"
		 * );
		 */
		
		//修改个人信息（不包括密码）
		if(RealUserPass.equals("")&&userPass.equals("")&&ReuserPass.equals("")) {
			NewsManage nm=new NewsManage();
			User user=new User(userId, userAccount, ReuserPass, userName, userEMail, userType, userHead, userSex, userBirthday);
			int j = nm.updateUserNoPass(user);// 调用修改用户信息方法
			if (j > 0) {
				out.println("<script>alert('Update Success');window.location.href='UManage/UserMessageManage.jsp'</script>");
			} else {
				out.println("<script>alert('Update Fail');window.location.href='UManage/UserMessageManage.jsp'</script>");
			}
		}
		
		
		
	}

}
