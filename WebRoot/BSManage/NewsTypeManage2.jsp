<%@page import="entity.NewsType"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新闻分类管理</title>
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
int userId =(Integer)session.getAttribute("UserId");
int userType = (Integer)session.getAttribute("UserType");
%>
<body>
	<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
            </div>
		<div class="contain">
			<ul class="am-nav am-navbar-nav am-navbar-left">
					<li><h4 class="page-title">新闻类型</h4></li>
			</ul>
		</div>
		</header>
		<div class="admin">
				 <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="<%=session.getAttribute("UserHead") %>" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
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
	                                <a href="../index.jsp?logout=1">登出</a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a href="../"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 新闻管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="../BSManage/NewsManage2.jsp?page=1">查询管理</a></li>
						        <%if(userType==3){ %>
                                <li><a href="../BSManage/NewsExamine2.jsp?page=1" class="am-cf">审核列表 </a></li>
                                <li style="background-color: #E0E0E0;"><a href="../BSManage/NewsTypeManage2.jsp?page=1" class="am-cf">分类管理 </a></li>
						        <%} %>
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
						        <li><a href="../BSManage/UserSuggest2.jsp?page=1" class="am-cf">反馈查看</a></li>
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
								<p>
								  <!-- col start -->
								 <form action="../updateType" method="post">
								  添加板块：
								  <input type="text" id="type-1" name="NewsTypeName" placeholder="请填写需要添加的新闻类型" style="width:200px;height:25px" />
								  <input type="hidden" name="NewsTypeId" value="0">
								  <input type="hidden" name="edit" value="insert">
								  <a href=""><input type="submit" value="添加" style="background-color: #4AAA4A;color: white;border: 0px;width: 50px;height: 28px;"></a>
							     </form>
							      </p>
								<table class="am-table">
                                <thead>
                                    <tr>                                      
                                        <th width="700" style="word-break:break-all">新闻类型</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
										NewsManage nm = new NewsManage();
										ArrayList list = nm.showNewsType();
										int NewsTypeId=1;
										for (int i = 0; i < list.size(); i++) {
										NewsType newstype = (NewsType)list.get(i);
									%>
                                    <tr> 
                                        <td width="700" style="word-break:break-all">
											<div id="Type<%=newstype.getNewsTypeId() %>" style="display:">
												<%=newstype.getNewsTypeName() %>
											</div>
										</td>
                                        <td>
                                        	<form action="../updateType" method="post"><td>
                                        		<button  type="button"  class="am-btn am-btn-primary"  id="doc-prompt-toggle<%=newstype.getNewsTypeId()%>">修改</button>
												<input type="hidden" name="NewsTypeId" value="<%=newstype.getNewsTypeId()%>">
												<input type="hidden" name="edit" value="delete">
												<button  type="button"  class="am-btn am-btn-danger"  id="doc-prompt-toggle<%=newstype.getNewsTypeId()%>del">删除</button>											<!-- 弹窗 -->
											<!-- 开始 -->
										<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt<%=newstype.getNewsTypeId()%>del">
										  <div class="am-modal-dialog">
										    <div class="am-modal-hd">是否删除</div>
											    <div class="am-modal-footer">
											     <input type="submit" value="是" style="width: 100%;background-color:#F8F8F8;border: 0px;color:#0E90D2;line-height: 100%;">
											     <span class="am-modal-btn" data-am-modal-cancel>否</span>
											    </div>
											  </div>
											</div>
											<script type="text/javascript">
												$(function() {
													  $('#doc-prompt-toggle<%=newstype.getNewsTypeId()%>del').on('click', function() {
													    $('#my-prompt<%=newstype.getNewsTypeId()%>del').modal({
													      relatedTarget: this,
													      onConfirm: function(e) {
													        alert('你输入的是：' + e.data || '')
													      },
													    });
													  });
													});
											</script>
											<!-- 弹窗 结束-->
										</td></form>
										<form action="../updateType" method="post" id="form">
                                    	<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt<%=newstype.getNewsTypeId()%>">
										  <div class="am-modal-dialog">
										    <div class="am-modal-hd">板块更改</div>
										    <div class="am-modal-bd">
										      <input type="text" class="am-modal-prompt-input" name="NewsTypeName" value="<%=newstype.getNewsTypeName()%>">
										    </div>
												<input type="hidden" name="NewsTypeId" value="<%=newstype.getNewsTypeId()%>">
												<input type="hidden" name="edit" value="update">
											    <div class="am-modal-footer">
											     <input type="submit" value="提交" form="form" style="width: 100%;background-color:#F8F8F8;border: 0px;color:#0E90D2;line-height: 100%;">
											     <span class="am-modal-btn" data-am-modal-cancel>取消</span>
											    </div>
										  </div>
										</div>
										</form>
										<script type="text/javascript">
											$(function() {
												  $('#doc-prompt-toggle<%=newstype.getNewsTypeId()%>').on('click', function() {
												    $('#my-prompt<%=newstype.getNewsTypeId()%>').modal({
												      relatedTarget: this,
												      onConfirm: function(e) {
												        alert('你输入的是：' + e.data || '')
												      },
												    });
												  });
												});
										</script>
                                        </td> 
                                    </tr>
                                    <%} %>
                                </tbody>
                                	
                            </table>
                            <!-- col end -->
                        </div>
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