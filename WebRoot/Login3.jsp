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

    			<span>用&nbsp;&nbsp;户&nbsp;&nbsp;名</span> 

    			<input name="txt_uAccount" type="text" /><br/>


    			<span >密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</span> 

    			<input name="txt_uPass" type="password" /><br/>
   
				<input type="submit" value="登录" />	
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>