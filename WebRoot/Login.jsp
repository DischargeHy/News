<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>登录</title>
  <link rel="stylesheet" href="assets/css/amazeui.min.css">
  <link rel="stylesheet" href="assets/css/app.css">
</head>
<body>
<header>
  <div class="log-header">
  </div>    
  <div class="log-re">
    <button type="button" class="am-btn am-btn-default am-radius log-button"><a href="Register.jsp">注 册</a></button>
    <button type="button" class="am-btn am-btn-default am-radius log-button"><a href="index.jsp">首 页 </a></button>
  </div> 
</header>
<div class="log"> 
  <div class="am-g">
  <div class="am-u-lg-3 am-u-md-6 am-u-sm-8 am-u-sm-centered log-content">
    <h1 class="log-title am-animation-slide-top">登 录</h1>
    <br>
    <form class="am-form" id="log-form" action="LoginServlet" method="post">
      <div class="am-input-group am-radius am-animation-slide-left">       
        <input type="text" id="doc-vld-email-2-1" name="txt_uAccount" class="am-radius" data-validation-message="请输入正确的用户名" placeholder="用户账号" minlength="2" maxlength="16" required/>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
      </div>
      <br>
      <div class="am-input-group am-animation-slide-left log-animation-delay">
        <input type="password" id="log-password" name="txt_uPass" class="am-form-field am-radius log-input" placeholder="密码" minlength="6" maxlength="16" data-validation-message="请输入正确的密码" required>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
      </div>
      <br>
      <button type="submit" class="am-btn am-btn-primary am-btn-block am-btn-lg am-radius am-animation-slide-bottom log-animation-delay-b">登 录</button>
      <br>
      <div class="am-btn-group am-animation-slide-bottom log-animation-delay-b">
      </div>
    </form>
  </div>
  </div>
  <footer class="log-footer">   

  </footer>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>