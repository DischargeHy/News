<%@page import="entity.ApplyList"%>
<%@page import="entity.User"%>
<%@page import="entity.News"%>
<%@page import="entity.NewsType"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户权限申请</title>
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> 
		<link rel="stylesheet" href="../houtai/assets/css/amazeui.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../houtai/assets/css/core.css" />
		<link rel="stylesheet" href="../houtai/assets/css/menu.css" />
		<link rel="stylesheet" href="../houtai/assets/css/index.css" />
		<link rel="stylesheet" href="../houtai/assets/css/admin.css" />
		<link rel="stylesheet" href="../houtai/assets/css/page/typography.css" />
		<link rel="stylesheet" href="../houtai/assets/css/page/form.css" />
		<script type="text/javascript" src="../assets3/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="../assets3/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
</head>
<%
	NewsManage nm = new NewsManage();
	int userId =(Integer)session.getAttribute("UserId");
	int userType = (Integer)session.getAttribute("UserType");
	String ApplyPage = request.getParameter("page");
	String search = request.getParameter("search");
	int page_num = 0;//总页数
	int allPage = 0;//总行数
	String type = "0";
	if(request.getParameter("type")!=null){
		type = request.getParameter("type");
	}
%>
<body>
	<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="../houtai/html/index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">用户权限申请</h4></li>
				</ul>
			</div>
		</header>
		<!-- end page -->
		
		
		<div class="admin">
			
				 <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="../houtai/assets/img/avatar-1.jpg" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                         <%if (session.getAttribute("UserAccount") != null) {	
					    		String UserAccount=(String)session.getAttribute("UserAccount"); 
					    		String UserType=session.getAttribute("UserType").toString();
					    		String UserId=session.getAttribute("UserId").toString();
					    		String UserName=session.getAttribute("UserName").toString();
				  			 %>   
	                        <h5><a href="NewsManage2.jsp"><%=UserName %></a> </h5>
	                        <%} %>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="#">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>	                                </a>	                            </li>
	
	                            <li>
	                                <a href="#" class="text-custom">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>	                                </a>	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						 <ul class="am-list admin-sidebar-list">
						    <li><a href="#"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 新闻管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <%if(userType==3){ %>
                                <li><a href="../BSManage/NewsExamine2.jsp?page=1" class="am-cf">审核列表 </a></li>
                                <li><a href="../BSManage/NewsTypeManage2.jsp?page=1" class="am-cf">分类管理 </a></li>
						        <%} %>
						        <li><a href="../BSManage/NewsManage2.jsp?page=1">查询管理</a></li>
						      </ul>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-line-chart" aria-hidden="true"></i> 评论管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
						        <li><a href="../BSManage/commentManage2.jsp?page=1" class="am-cf">举报管理</a></li>
						       
						      </ul>
						    </li>
						    <%if(session.getAttribute("UserType").toString().equals("3")){ %>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav5'}"><span class="am-icon-file"></span> 用户管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav5">
						        <li><a href="../BSManage/UserManage2.jsp?page=1" class="am-cf">权限管理</a></li>
						        <li><a href="../BSManage/UserApply2.jsp?page=1">权限申请管理</a></li> 
						      </ul>
						    </li>
							<%} %>
						  </ul>
						  <br />
				</div>
				</div>
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="am-g">
					<!-- Row start -->
						<div class="am-u-sm-12">
							<div class="card-box">
								<!-- col start -->
                            <table class="am-table">
                                <thead>
                                    <tr>
                                        <th width="100" style="word-break:break-all">用户头像</th>
                                        <th width="230" style="word-break:break-all">用户名</th>
                                        <th width="230" style="word-break:break-all">用户邮箱</th>
<<<<<<< HEAD
                                        <th width="200" style="word-break:break-all">申请时间</th>
                                        <th>操作</th>
                                       
                                        
=======
                                        <th width="190" style="word-break:break-all">申请时间</th>
                                        <th colspan="2">操作</th>
>>>>>>> branch 'master' of https://github.com/DischargeHy/News.git
                                    </tr>
                                </thead>
                                <tbody>
                                <%
									ArrayList list = null;//用户列表
									if(userType!=3){
										response.sendRedirect("BSManage/NewsManage.jsp?page=1");
									}
									list = nm.showApply(ApplyPage);//根据页数显示内容
									allPage = nm.getApplyPage();
									page_num = allPage/10;
									if(allPage%10!=0){
										page_num+=1;
									}
							       	int p1 = Integer.parseInt(request.getParameter("page")); 
							        p1=p1-1;
							        int p2 = Integer.parseInt(request.getParameter("page")); 
							        p2=p2+1;
									for (int i = 0; i < list.size(); i++) {
									ApplyList al = (ApplyList)list.get(i);
								%>
                                    <tr>
<<<<<<< HEAD
                                        <td width="100" style="word-break:break-all"><img src="../houtai/assets/img/avatar-1.jpg" width="30px" height="30px"/></td>
                                        <td width="230" style="word-break:break-all">username</td>
                                        <td width="230" style="word-break:break-all">useremail</td>
                                        <td width="200" style="word-break:break-all">applytime</td>
                                        <td><a href=""><button type="submit">允许申请</button></a> &nbsp;<a 	href="update.html"><button type="submit">拒绝申请</button></a></td>
                                       
                                        
=======
                                        <td width="100" style="word-break:break-all"><img src="<%=al.getUserHead()%>" width="30px" height="30px"/></td>
                                        <td width="230" style="word-break:break-all"><%=al.getUserName()%></td>
                                        <td width="230" style="word-break:break-all"><%=al.getUserEMail()%></td>
                                        <td width="190" style="word-break:break-all"><%=al.getTime()%></td>
                                        <td>
										<form action="../updateApplyServlet" method="post">
											<input type="hidden" value="<%=al.getApplyId() %>" name="ApplyId">
											<input type="hidden" value="<%=al.getUserId() %>" name="UserId">
											<input type="hidden" value="1" name="change">
											<button  type="button"  class="am-btn am-btn-success"  id="doc-prompt-toggle<%=al.getApplyId() %>">允许</button>
											<!-- 弹窗开始 -->
											<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt<%=al.getApplyId() %>">
										  <div class="am-modal-dialog">
										    <div class="am-modal-hd">确认权限更改</div>
											    <div class="am-modal-footer">
											     <input type="submit" value="是" style="width: 100%;background-color:#F8F8F8;border: 0px;color:#0E90D2;line-height: 100%;">
											     <span class="am-modal-btn" data-am-modal-cancel>否</span>
											    </div>
											  </div>
											</div>
											<script type="text/javascript">
												$(function() {
													  $('#doc-prompt-toggle<%=al.getApplyId() %>').on('click', function() {
													    $('#my-prompt<%=al.getApplyId() %>').modal({
													      relatedTarget: this,
													      onConfirm: function(e) {
													        alert('你输入的是：' + e.data || '')
													      },
													    });
													  });
													});
											</script>
											<!-- 弹窗结束 -->
										</form>
										</td>
										<td>
											<form action="../updateApplyServlet" method="post">
												<input type="hidden" value="<%=al.getApplyId() %>" name="ApplyId">
												<input type="hidden" value="<%=al.getUserId() %>" name="UserId">
												<input type="hidden" value="0" name="change">
												<button  type="button"  class="am-btn am-btn-success"  id="doc-prompt-toggle<%=al.getApplyId() %>no">拒绝</button>
											<!-- 弹窗开始 -->
											<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt<%=al.getApplyId() %>no">
										  <div class="am-modal-dialog">
										    <div class="am-modal-hd">是否拒绝</div>
											    <div class="am-modal-footer">
											     <input type="submit" value="是" style="width: 100%;background-color:#F8F8F8;border: 0px;color:#0E90D2;line-height: 100%;">
											     <span class="am-modal-btn" data-am-modal-cancel>否</span>
											    </div>
											  </div>
											</div>
											<script type="text/javascript">
												$(function() {
													  $('#doc-prompt-toggle<%=al.getApplyId() %>no').on('click', function() {
													    $('#my-prompt<%=al.getApplyId() %>no').modal({
													      relatedTarget: this,
													      onConfirm: function(e) {
													        alert('你输入的是：' + e.data || '')
													      },
													    });
													  });
													});
											</script>
											<!-- 弹窗结束 -->
											</form>
										</td>
>>>>>>> branch 'master' of https://github.com/DischargeHy/News.git
                                    </tr>
<<<<<<< HEAD
                                     <tr>
                                      <td width="100" style="word-break:break-all"><img src="../houtai/assets/img/avatar-1.jpg" width="30px" height="30px"/></td>
                                        <td width="230" style="word-break:break-all">username</td>
                                        <td width="230" style="word-break:break-all">useremail</td>
                                        <td width="200" style="word-break:break-all">applytime</td>
                                       <td><a href=""><button type="submit">允许申请</button></a> &nbsp;<a 	href="update.html"><button type="submit">拒绝申请</button></a></td>
                                        
                                        
                                    </tr>
                                     <tr>
                                        <td width="100" style="word-break:break-all"><img src="../houtai/assets/img/avatar-1.jpg" width="30px" height="30px"/></td>
                                        <td width="230" style="word-break:break-all">username</td>
                                        <td width="230" style="word-break:break-all">useremail</td>
                                        <td width="200" style="word-break:break-all">applytime</td>
                                        <td><a href=""><button type="submit">允许申请</button></a> &nbsp;<a 	href="update.html"><button type="submit">拒绝申请</button></a></td>
                                        
                                        
                                        
                                    </tr>
                                    <tr>
                                       <td width="100" style="word-break:break-all"><img src="../houtai/assets/img/avatar-1.jpg" width="30px" height="30px"/></td>
                                        <td width="230" style="word-break:break-all">username</td>
                                        <td width="230" style="word-break:break-all">useremail</td>
                                        <td width="200" style="word-break:break-all">applytime</td>
                                      <td><a href=""><button type="submit">允许申请</button></a> &nbsp;<a 	href="update.html"><button type="submit">拒绝申请</button></a></td>
                                       
                                        
                                    </tr>
                                    <tr>
                                        <td width="100" style="word-break:break-all"><img src="../houtai/assets/img/avatar-1.jpg" width="30px" height="30px"/></td>
                                        <td width="230" style="word-break:break-all">username</td>
                                        <td width="230" style="word-break:break-all">useremail</td>
                                        <td width="200" style="word-break:break-all">applytime</td>
                                        <td><a href=""><button type="submit">允许申请</button></a> &nbsp;<a 	href="update.html"><button type="submit">拒绝申请</button></a></td>
                                        
                                        
                                    </tr>
=======
                                 <%} %>
>>>>>>> branch 'master' of https://github.com/DischargeHy/News.git
                                </tbody>
                            </table>
                            <!-- col end -->
                        </div>
                    </div>
					<div class="fy" style="float:right; margin-right:20px;">
           				<ul class="pagination">
           			<%if(p1>=1){ %>
                        <li><a id="up" href="BSManage/UserApply.jsp?page=<%=p1%>">上一页</a></li>
                    <%} %>
                    <%for(int i = 1 ; i <= page_num ; i++){%>
                        <%if(Integer.parseInt(request.getParameter("page"))!=i){%><!-- 不是当前页页码则是超链接跳转 -->
		        			<li><a href="BSManage/UserApply.jsp?page=<%=i%>"><%=i %></a></li>
		        		<%}
		        		else{%>
		        			<li><a style="color: red"><%=i %></a></li>
		        		<%}%>
                    <%} %>
                    <%if(p2<=page_num){ %>
                        <li><a id="down" href="BSManage/UserApply.jsp?page=<%=p2 %>">下一页</a></li>
                    <%} %>
                    </ul>
                  </div>
			</div>
		</div>
		<!-- end right Content here -->
		<!--</div>-->
		</div>
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="../houtai/assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="../houtai/assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="../houtai/assets/js/app.js" ></script>
		<script type="text/javascript" src="../houtai/assets/js/blockUI.js" ></script>
</body>
</html>