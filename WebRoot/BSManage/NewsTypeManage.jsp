<%@page import="entity.NewsType"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="BSJS/TypeUpdate.js"></script><!-- 修改显示判断JS -->
  </head>
<body>
	<div style="width: 100%;border: 1px solid;">
		<a href="#">新闻管理模块</a>
		<a href="#">用户管理模块</a>
		<a href="#">留言管理模块</a>
	</div>
	<div style="margin-top: 30px; width: 100%"><!-- 主体外部DIV开始 -->
		<div style="float: left;border: 1px solid;">
			<p><a href="BSManage/NewsManage.jsp?page=1">新闻查询管理</a></p>
			<p><a>分类管理</a></p>
			<p><a href="#">新闻发布</a></p>
		</div>
		<div style="float: left;border: 1px solid;"><!-- 新闻类型列表开始 -->
			<table>
			<%
				NewsManage nm = new NewsManage();
				ArrayList list = nm.showNewsType();
				int NewsTypeId=1;
				for (int i = 0; i < list.size(); i++) {
				NewsType newstype = (NewsType)list.get(i);
			%>
				<tr>
					<td>
						<div id="Type<%=newstype.getNewsTypeId() %>" style="display:"><%=newstype.getNewsTypeName() %></div>
						
						<div id="updateType<%=newstype.getNewsTypeId() %>" style="display: none"><!-- 点击修改才出现 -->
							<form action="updateType" method="post">
								<input type="text" value="<%=newstype.getNewsTypeName() %>" name="NewsTypeName">
								<input type="hidden" name="NewsTypeId" value="<%=newstype.getNewsTypeId()%>">
								<input type="hidden" name="edit" value="update"><br>
								<centetr>
									<input id="yes" type="submit" value="确认" style="width: 75px;text-indent:0px;margin-top: 0px;">
    	    						<input id="no" type="button" value="取消" style="width: 75px;text-indent:0px;margin-top: 0px;"onclick="hidden_updateType(<%=newstype.getNewsTypeId()%>)">
    	    					</centetr>
							</form>
						</div><!-- 点击修改才出现结束 -->
						
					</td>
					<td><input id="submit" type="submit" name="修改" value="修改" class="submit_button"onclick="show_updateType(<%=newstype.getNewsTypeId()%>)"/></td>
					<form action="updateType" method="post"><td>
						<input type="hidden" name="NewsTypeId" value="<%=newstype.getNewsTypeId()%>">
						<input type="hidden" name="edit" value="delete">
						<input type="submit" value="删除">
					</td></form>
				</tr>
			<%} %>
			
				<form action="updateType" method="post"><!-- 分类添加 -->
					<tr>
						<td>
							<input type="text" name="NewsTypeName">
							<input type="hidden" name="NewsTypeId" value="0">
							<input type="hidden" name="edit" value="insert">
						</td>
						<td><input type="submit" value="添加"></td>
					</tr>
				</form><!-- 分类添加结束 -->
				
			</table>
		</div><!-- 新闻类型列表结束 -->
	</div><!-- 主体外部DIV结束 -->
</body>
</html>