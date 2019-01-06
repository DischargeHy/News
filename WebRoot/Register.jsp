<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>注册</title>
  <link rel="stylesheet" href="assets/css/amazeui.min.css">
  <link rel="stylesheet" href="assets/css/app.css">
</head>
<body>
<header>
  <div class="log-header">
  </div>    
  <div class="log-re">
    <button type="button" class="am-btn am-btn-default am-radius log-button"><a href="Login2.jsp">登 录</a></button>
  </div> 
</header>

<div class="log"> 
  <div class="am-g">
  <div class="am-u-lg-3 am-u-md-6 am-u-sm-8 am-u-sm-centered log-content">
    <h1 class="log-title am-animation-slide-top">注册</h1>
    <form class="am-form" id="log-form" action="RegisterServlet">
      <div class="am-input-group am-radius am-animation-slide-left">       
        <input type="text" id="doc-vld-email-2-1" name="UserAccount" class="am-radius" data-validation-message="请输入正确账号" placeholder="账号" required/>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
		<input type="text" id="doc-vld-email-2-1" name="UserName" class="am-radius" data-validation-message="请输入正确用户名" placeholder="用户名" required/>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
      </div>
      <br>
      <div class="am-input-group am-animation-slide-left log-animation-delay">       
        <input type="password" id="log-password" name="UserPass" class="am-form-field am-radius log-input" placeholder="密码" minlength="6" required>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
     
      
        
        <input type="password" data-equal-to="#log-password" name="ReuserPass" class="am-form-field am-radius log-input" placeholder="确认密码" data-validation-message="请确认密码一致" required>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
      </div>
      <br>
      <div class="am-input-group am-radius am-animation-slide-left">       
        <input type="text" id="doc-vld-email-2-1" name="UserEMail" class="am-radius" data-validation-message="请输入正确邮箱" placeholder="邮箱" required/>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
      </div>
      
      <br>
      <button type="submit" class="am-btn am-btn-primary am-btn-block am-btn-lg am-radius am-animation-slide-bottom log-animation-delay-b">注 册</button>
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