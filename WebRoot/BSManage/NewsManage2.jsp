<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新闻查询管理</title>
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> 
		<link rel="stylesheet" href="../houtai/assets/css/amazeui.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../houtai/assets/css/core.css" />
		<link rel="stylesheet" href="../houtai/assets/css/menu.css" />
		<link rel="stylesheet" href="../houtai/assets/css/index.css" />
		<link rel="stylesheet" href="../houtai/assets/css/admin.css" />
		<link rel="stylesheet" href="../houtai/assets/css/page/typography.css" />
		<link rel="stylesheet" href="../houtai/assets/css/page/form.css" />
</head>
<body>
	<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">新闻查询管理</h4></li>
				</ul>
				
				<ul class="am-nav am-navbar-nav am-navbar-right">
					<li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
					<li class="hidden-xs am-hide-sm-only">
                        <form role="search" class="app-search">
                            <input type="text" placeholder="Search..." class="form-control">
                            <a href=""><img src="../houtai/assets/img/search.png"></a>
                        </form>
                    </li>
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
	                        <h5><a href="#">Mat Helme</a> </h5>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="#">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	
	                            <li>
	                                <a href="#" class="text-custom">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a href="#"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 新闻管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        
                                <li><a href="../BSManage/NewsExamine2.jsp" class="am-cf">新闻审核列表 </a></li>
                                <li><a href="../BSManage/NewsTypeManage2.jsp" class="am-cf">新闻分类管理 </a></li>
						        <li><a href="../BSManage/NewsManage2.jsp">新闻查询管理</a></li>
						      </ul>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-line-chart" aria-hidden="true"></i> 评论管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
						        <li><a href="../BSManage/commentManage2.jsp" class="am-cf">评论举报管理</a></li>
						       
						      </ul>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav5'}"><span class="am-icon-file"></span> 用户管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav5">
						        <li><a href="../BSManage/UserManage2.jsp" class="am-cf">用户权限管理</a></li>
						        <li><a href="../BSManage/UserApply2.jsp">用户权限申请管理</a></li> 
                                
								
						      </ul>
						    </li>
							
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
							      新闻版块筛选：
								   <select name="select" style="width:100px;height:25px">
								  		<option>所有版块</option>
  										<option>吃竹鼠</option>
										<option>呵呵呵呵</option>
										<option>新闻类型10</option>
										<option>测试</option>
										<option>王煌煜</option>
										<option>竹鼠</option>
  									</select>
										<a href=""><button type="submit">筛选</button></a>
								  </p>
								<table class="am-table">
                                <thead>
                                    <tr>
                                        <th width="270" style="word-break:break-all">标题</th>
                                        <th width="200" style="word-break:break-all">类型</th>
                                        <th width="200" style="word-break:break-all">作者</th>
                                        <th width="180" style="word-break:break-all">发表时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                       <td width="270" style="word-break:break-all">15</td>
                                        <td width="200" style="word-break:break-all">吃竹鼠</td>
                                        <td width="200" style="word-break:break-all">admin</td>
                                        <td width="180" style="word-break:break-all">2019-01-04 21:03:41</td>
                                       <td ><a href=""><button type="submit">重审</button></a> &nbsp;<a 	href=""><button type="submit">删除</button></a></td> 
                                  <tr>
                                         <td width="270" style="word-break:break-all">15</td>
                                        <td width="200" style="word-break:break-all">竹鼠</td>
                                        <td width="200" style="word-break:break-all">admin</td>
                                        <td width="180" style="word-break:break-all">2019-01-04 21:03:41</td>
                                        <td><a href=""><button type="submit">重审</button></a> &nbsp;<a 	href=""><button type="submit">删除</button></a></td> 
                                  </tr>
                                     <tr>
                                        <td width="270" style="word-break:break-all">234</td>
                                        <td width="200" style="word-break:break-all">吃竹鼠</td>
                                        <td width="200" style="word-break:break-all">admin</td>
                                        <td width="180" style="word-break:break-all">2019-01-04 21:03:41</td>
                                        <td><a href=""><button type="submit">重审</button></a> &nbsp;<a 	href=""><button type="submit">删除</button></a></td> 
                                    </tr>
                                    <tr>
                                       <td width="270" style="word-break:break-all">2132123</td>
                                        <td width="200" style="word-break:break-all">吃竹鼠</td>
                                        <td width="200" style="word-break:break-all">aa</td>
                                        <td width="180" style="word-break:break-all">2019-01-04 21:03:41</td>
                                        <td><a href=""><button type="submit">重审</button></a> &nbsp;<a 	href=""><button type="submit">删除</button></a></td>  
                                    </tr>
                                    <tr>
                                        <td width="270" style="word-break:break-all">777</td>
                                        <td width="200" style="word-break:break-all">呵呵呵呵</td>
                                        <td width="200" style="word-break:break-all">（⊙ｏ⊙）</td>
                                        <td width="180" style="word-break:break-all">2019-01-04 21:03:41</td>
                                        <td><a href=""><button type="submit">重审</button></a> &nbsp;<a 	href=""><button type="submit">删除</button></a></td> 
                                    </tr>
                                </tbody>
                            </table>
                            <!-- col end -->
                        </div>
                    </div>
           <div class="fy" style="float:right; margin-right:20px;">
           			<ul class="pagination">
                        <li><a href="#">上一页</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">下一页</a></li>
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