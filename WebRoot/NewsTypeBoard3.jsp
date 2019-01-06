<%@page import="db.NewsManage"%>
<%@page import="entity.NewsType"%>
<%@page import="entity.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="head" class="table-info">
	<%
		request.setCharacterEncoding("utf-8");
		int Page=1;
		if(request.getParameter("page")!=null){
			Page = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("logout")!=null){//如果进入页面logout有值传入
			session.removeAttribute("UserAccount");//清空session	
			session.removeAttribute("UserType");
			session.removeAttribute("UserId");
		}
    	if (session.getAttribute("UserAccount") != null) {	
    		String UserAccount=(String)session.getAttribute("UserAccount"); 
    		String UserType=session.getAttribute("UserType").toString();
    		String UserId=session.getAttribute("UserId").toString();
    %>   		
    		<label>&nbsp;您好：</label><a href="UManage/UserMessageManage.jsp"><%=UserAccount %></a>
    		<a class="text-primary" href="index.jsp?logout=1">登出</a>
    		<label>&nbsp;&nbsp;|</label>
    		<label>您的用户类型是：</label><%=UserType %>
    		<label>您的用户Id是：</label><%=UserId %>
    <%
    	}else{
    %>
		<a href="Login.jsp">登陆</a> 
		<label>&nbsp;|&nbsp;</label>
		<a href="Register.jsp">注册</a>
    <%		
    	}
    %>
    </div>
  	<div id="NewsType">
  		<ul>
  			<li>
				<a href="index.jsp">首页</a>
			</li>
  			<%
  				NewsManage nm = new NewsManage();
  				
  				
				ArrayList list = nm.showNewsType();
				int NewsTypeId=1;
				if(request.getParameter("NewsTypeId")!=null){
					NewsTypeId=Integer.parseInt(request.getParameter("NewsTypeId"));
				}
				
				int pageCount=nm.ShowPageCountBynewstypeid(NewsTypeId);//总分页数
  	    		if(Page<1) Page = 1;//如果页码小于1，则页码置为第1页
  	    		if(Page>=pageCount) Page = pageCount;//如果当前页码大于总分的页数，就将当前页码置为最后一页
  	    		
				for (int i = 0; i < list.size(); i++) {
					NewsType newstype = (NewsType)list.get(i);
					
  			 %>
			<li>
				<a href="NewsTypeBoard3.jsp?NewsTypeId=<%=newstype.getNewsTypeId() %>"><%=newstype.getNewsTypeName() %></a>
			</li>
			<%
  				}
  			 %>
		</ul>
  	</div>
  	
  	
  	<div id="Search"><!--搜索部分开始  -->
  	<form action="Search.jsp" method="post">
		<table width="600" border="1" align="center" cellspacing="0">
  			<tr>
    			<td align="center"><input name="Search" type="text" /></td>
    			<td align="center"><input name="" type="submit" value="搜索" /></td>
 			</tr>
		</table>
	</form>
  	</div><!--搜索部分结束  -->
  	
  	<div id="main">
  	<div style="float: left;border: 1px solid; width:70%"><!-- 新闻列表开始 -->
			<table style="border: 1px solid;width: 100%">
			<tr>
				<td>新闻封面</td>
				<td>新闻标题</td>
				<td>作者</td>
				<td>最后修改时间</td>
				<td>评论数</td>
			</tr>
			<%
				
				ArrayList list2 = nm.showNewsListByNewsTypeId(NewsTypeId, Page);/*通过新闻类型Id查询新闻内容  */
				for (int i = 0; i < list2.size(); i++) {
				News news = (News)list2.get(i);
			%>
				<tr>
					<td><img src="<%=news.getNewsCover()%>"></td>
					<td><a href="NewsDetail.jsp?NewsId=<%=news.getNewsId()%>"><%=news.getNewsTitle()%></a></td>
					<td><%=news.getUserName()%></td>
					<td><%=news.getUpdateTime()%></td>
					<td><%=news.getNewsContentNum() %></td>
				</tr>
			<%} %>
		        <tr>
		        	<td colspan="4">
		        		<div id="Page">
							<a href = "NewsTypeBoard3.jsp?NewsTypeId=<%=NewsTypeId %>&page=1" >首页</a>
							<a href = "NewsTypeBoard3.jsp?NewsTypeId=<%=NewsTypeId %>&page=<%=Page-1%>" >上一页</a>
							<%for(int i=1;i<=pageCount;i++){ 
								if(i==Page){		
							%>
								<%=i %>
							<%	
								}
								else{
							%>
								<a href = "NewsTypeBoard3.jsp?NewsTypeId=<%=NewsTypeId %>&page=<%=i%>" ><%=i%></a>
							<%
								}	
							} 
							%>
							<a href = "NewsTypeBoard3.jsp?NewsTypeId=<%=NewsTypeId %>&page=<%=Page+1%>" >下一页</a>
							<a href = "NewsTypeBoard3.jsp?NewsTypeId=<%=NewsTypeId %>&page=<%=pageCount%>" >尾页</a>
						</div>
		        	</td>
		        </tr>
			</table>
		</div><!-- 新闻列表结束 -->
  	</div>
</body>
</html>