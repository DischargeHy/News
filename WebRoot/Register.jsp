<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="RegisterServlet" method="post">
		<table width="600" border="1" align="center" cellspacing="0">
  			<tr>
    			<td align="center">账号：<input name="txt_uAccount" type="text" /></td>
 			</tr>
 			<tr>
    			<td align="center">用户昵称：<input name="txt_uName" type="text" /></td>
 			</tr>
 			<tr>
  				<td align="center">密码：<input name="txt_uPass" type="password" /></td>
		  	</tr>
 		 	<tr>
 		   		<td align="center">重复密码：<input name="txt_RuPass" type="password" /></td>
		  	</tr>
 		 	<tr>
  		  		<td align="center">邮箱：<input name="txt_uemail" type="text" /></td>
 		 	</tr>

  			<tr>
    			<td align="center"><input name="" type="submit" value="注册" /></td>
  			</tr>
		</table>
	</form>
	</div>
</body>
</html>