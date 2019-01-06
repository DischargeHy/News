package servlet.ck5;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import util.Url;

@WebServlet("/ck5/Upload")
public class UploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
		String savePath = this.getServletContext().getRealPath("/upload");
		String newFileName=null;
//		System.out.println("savePath:" + savePath);
		File file = new File(savePath);
		// 判断上传文件的保存目录是否存在
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savePath + "目录不存在，需要创建");
			// 创建目录
			file.mkdir();
		}

		newFileName=Url.upload(request, savePath);
		String filePathWEBUrl=Url.getWEBUrlByProject(request)+"/upload/"+newFileName;
//		System.out.println(filePathWEBUrl);
		String strJson="{\"url\": \""+filePathWEBUrl+"\",\"uploaded\": 1}";
//				System.out.println(str);
		response.setContentType("application/json;charset=utf-8;");
		response.getWriter().print(strJson);
	}
}