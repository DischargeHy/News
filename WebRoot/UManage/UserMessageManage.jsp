<%@page import="db.NewsManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-top: 30px; width: 100%">
		<!-- 主体外部DIV开始 -->
		<div style="float: left; border: 1px solid;">
			<p><a>个人信息管理</a></p>
			<p><a href="UManage/NewsTypeManage.jsp">评论管理</a></p>
			<p><a href="#">回复查看</a></p>
		</div>
		<div style="float: left; border: 1px solid; width: 70%">
			<!-- 个人信息列表开始 -->
			<form name="form1" method="post" action="UpdateServlet"
				enctype="multipart/form-data">
				<table width="277" height="181" border="1" cellspacing="0">
					<tr>
						<td colspan="2"><div align="center">
								<span class="STYLE1">修改界面</span>
							</div></td>
					</tr>
					<tr>
						<td width="70">用户编号</td>
						<td width="191"><label> <input type="text"
								name="bookcode" value="<%%>">

						</label></td>
					</tr>
					<tr>
						<td>用户账号:</td>
						<td><label> <input type="text" name="bookname"
								value="<%%>">
						</label></td>
					</tr>
					<tr>
						<td>用户昵称:</td>
						<td><label> <%-- <input type="text" name="booktype" value="<%=book.getBType() %>"> --%>
								<select name="booktype">
									<option>文学</option>
									<option>教科书</option>
							</select>
						</label></td>
					</tr>
					<tr>
						<td>详细:</td>
						<td><label> <input type="text" name="bookdescribe"
								value="<%=%>">
						</label></td>
					</tr>
					<tr>
						<td>作者:</td>
						<td><label> <input type="text" name="bookauthor"
								value="<%=%>">
						</label></td>
					</tr>
					<tr>
						<td>出版社:</td>
						<td><label> <input type="text" name="publish"
								value="<%=%>">
						</label></td>
					</tr>
					<tr>
						<td>单价:</td>
						<td><label> <input type="text" name="bookprice"
								value="<%=%>">
						</label></td>
					</tr>
					<tr>
						<td>库存量:</td>
						<td><label> <input type="text" name="bookinventory"
								value="<%=%>">
						</label></td>
					</tr>
					<tr>
						<td>建议:</td>
						<td><label> <%--  <input type="text" name="bookadvise" value="<%=book.getBAdvise() %>"> --%>
								<select name="bookadvise">
									<option>推荐</option>
									<option>不推荐</option></label></td>
					</tr>
					<tr>
						<td>图片:</td>
						<td><label> <input type="file" name="bookpicture" />
						</label></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><label> <input type="submit" name="Submit"
								value="修改"> <input type="hidden" name="id"
								value="<%=%>">
						</label></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 新闻列表结束 -->
	</div>
	<!-- 主体外部DIV结束 -->
</body>
</html>