<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="login_tablediv">
	<form action="LoginServlet" method="post">
		<table id="login_table" class="table table-bordered" >
			<tr>
				<td align="center">

    			<span class="input-group-text">用&nbsp;&nbsp;户&nbsp;&nbsp;名</span> 

    			<input class="form-control" placeholder="UserName" name="txt_uName" type="text" />


    			<span class="input-group-text">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</span> 

    			<input class="form-control" placeholder="Password" name="txt_uPass" type="password" />
   
				<input class="btn btn-primary" name="" type="submit" value="登录" />	
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>