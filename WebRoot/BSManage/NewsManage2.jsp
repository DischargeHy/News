<%@page import="entity.News"%>
<%@page import="entity.NewsType"%>
<%@page import="db.NewsManage"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
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
		<script type="text/javascript" src="../BSJS/Search.js"></script>
		<script type="text/javascript" src="../assets3/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="../assets3/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
</head>
<%
			String NewsStatus = ""; 
			NewsManage nm = new NewsManage();
			int userId =(Integer)session.getAttribute("UserId");
			int userType = (Integer)session.getAttribute("UserType");
			String NewsPage = request.getParameter("page");
			ArrayList list = null;
			int page_num = 0;//总页数
			int allPage = 0;//总行数
			String NewsType = "0";
			String search = null;
			if(request.getParameter("search")!=null){
				search = request.getParameter("search");
			}
			if(request.getParameter("NewsStatus")!=null){
				NewsStatus = request.getParameter("NewsStatus");
			}
			if(request.getParameter("NewsType")!=null){
				NewsType = request.getParameter("NewsType");
			}
			if(userType==2){
				if(search==null||search.equals("null")){
					out.print(userId);
					list = nm.showNewsList(userId, NewsPage, NewsStatus);/*通过用户ID查询文章（小编）  */
					allPage = nm.getNewsPage(userId, NewsStatus);
				}
				else{
					String NewsTitle = request.getParameter("search");//通过搜索给出数据
					list = nm.showNewsList(userId, NewsTitle,NewsPage, NewsStatus);
					allPage = nm.getNewsPage(userId, NewsTitle,NewsStatus);
				}
			}
			else if(userType==3){
				if(search==null||search.equals("null")){
					list = nm.showNewsListByType(NewsPage, NewsType);
					allPage = nm.getNewsPageAll(NewsType);
				}
				else{
					String NewsTitle = request.getParameter("search");//通过搜索给出数据（管理员）
					list = nm.showNewsList(NewsTitle, NewsPage, NewsType);
					allPage = nm.getNewsPage(NewsTitle, NewsType);
				}
			}
		%>
<body>
	<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="../" class="logo"><span>Home<span>Page</span></span><i class="zmdi zmdi-layers"></i></a></div>
            </div>
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">新闻查询管理</h4></li>
				</ul>
				<ul class="am-nav am-navbar-nav am-navbar-right">
					<li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
					<li class="hidden-xs am-hide-sm-only">
                        <form role="search" class="app-search" method="post" action="NewsManage2.jsp" id="searchForm" name="searchForm">
	                        <input type="hidden" value="1" name="page">
							<input type="hidden" value="<%=NewsStatus%>" name="NewsStatus">
							<input type="hidden" value="<%=NewsType%>" name="NewsType">
							<%if(userType==3){ %>
                            <input id="search" value="<%if(request.getParameter("search")==null){out.print("");}else{out.print(request.getParameter("search"));}%>" type="text" placeholder="请输入搜索内容" class="form-control" onchange="changeHref1(<%=NewsType%>)">
                            <a id="aForm" href="../BSManage/NewsManage2.jsp?page=1&search=<%if(search==null||search.equals("")){out.print("null");}else{out.print(search);}%>&NewsType=<%=NewsType%>"><img src="../houtai/assets/img/search.png"></a>
                            <%} 
							else{ %>
                            <input id="search" value="<%if(request.getParameter("search")==null){out.print("");}else{out.print(request.getParameter("search"));}%>" type="text" placeholder="请输入搜索内容" class="form-control" onchange="changeHref2(<%=NewsStatus%>)">
                      		<a id="aForm" href="../BSManage/NewsManage2.jsp?page=1&search=<%if(search==null||search.equals("")){out.print("null");}else{out.print(search);}%>&NewsStatus=<%=NewsStatus%>"><img src="../houtai/assets/img/search.png"></a>
                      		 <%} %>
                               
 
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
						        <li style="background-color: #E0E0E0;"><a href="../BSManage/NewsManage2.jsp?page=1">查询管理</a></li>
						        <%if(userType==3){ %>
                                <li><a href="../BSManage/NewsExamine2.jsp?page=1" class="am-cf">审核列表 </a></li>
                                <li><a href="../BSManage/NewsTypeManage2.jsp?page=1" class="am-cf">分类管理 </a></li>
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
							<%if(userType!=3){ %>
							    <form method="post" action="../BSManage/NewsManage2.jsp?page=1">
							    <input type="hidden" value="1" name="page">
								<input type="hidden" value="<%=search %>" name="search">
								新闻审核状态：<select name="NewsStatus" style="width:100px;height:25px">
								  	<option value="" <%if(NewsStatus.equals("")){ out.print("selected=\"selected\"");} %>>审核通过</option>
									<option value="0" <%if(NewsStatus.equals("0")){ out.print("selected=\"selected\"");} %>>审核中</option>
									<option value="2" <%if(NewsStatus.equals("2")){ out.print("selected=\"selected\"");} %>>审核失败</option>
  								</select>
								<input type="submit" value="筛选" style="background-color: #4AAA4A;color: white;border: 0px;width: 50px;height: 28px;">
								</form>
							<%} else{%>
							<form method="post" action="../BSManage/NewsManage2.jsp?page=1"><!-- 筛选框 -->
									<input type="hidden" value="1" name="page">
									<input type="hidden" value="<%=search %>" name="search">
									新闻板块：<select name="NewsType" style="width:100px;height:25px">
									<option value="0" <%if(NewsType.equals("0")){ out.print("selected=\"selected\"");} %>>所有版块</option>
									<%
										ArrayList Typelist = nm.showNewsType();
										for (int i = 0; i < Typelist.size(); i++) {
											NewsType newstype = (NewsType)Typelist.get(i);
									%>
										<option value="<%=newstype.getNewsTypeId() %>" <%if(NewsType.equals(""+newstype.getNewsTypeId())){ out.print("selected=\"selected\"");} %>><%=newstype.getNewsTypeName() %></option>
									<%} %>
									</select>
									<a href=""><input type="submit" value="筛选" style="background-color: #4AAA4A;color: white;border: 0px;width: 50px;height: 28px;"></a>
							</form>
							<%} %>
								  </p>
								<table class="am-table">
                                <thead>
                                    <tr>
                                        <th width="40%" style="word-break:break-all">标题</th>
                                        <th width="10%" style="word-break:break-all">类型</th>
                                        <th width="10%" style="word-break:break-all">作者</th>
                                        <th width="20%" style="word-break:break-all">发表时间</th>
                                        <th width="20%" colspan="2">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                               	<%
									page_num = allPage/6;
									if(allPage%6!=0){
										page_num+=1;
									}
							       	int p1 = Integer.parseInt(request.getParameter("page")); 
							        p1=p1-1;
							        int p2 = Integer.parseInt(request.getParameter("page")); 
							        p2=p2+1;
									for (int i = 0; i < list.size(); i++) {
									News news = (News)list.get(i);// 有以下NewsId,NewsTitle,CreateTime,NewsTypeName,UserName
								%>
                                    <tr height="80px">
                                       <td width="300" style="word-break:break-all"><a href="../ShowNews?newsId=<%=news.getNewsId()%>"><%=news.getNewsTitle()%></a></td>
                                        <td width="100" style="word-break:break-all"><%=news.getNewsTypeName()%></td>
                                        <td width="100" style="word-break:break-all"><%=news.getUserName()%></td>
                                        <td width="180" style="word-break:break-all"><%=news.getCreateTime()%></td>
                                        <td width="180">
	                                       <%if(userType!=3){ %>
	                                       		<form action="../EditNews?newsId=<%=news.getNewsId()%>" method="post" style="float: left">
		                                      	<input type="hidden" value="<%=news.getNewsId()%>" name="NewsId">
			                                    <button  type="button" class="am-btn am-btn-primary"  id="doc-prompt-toggle<%=news.getNewsId()%>edit">编辑</button>&nbsp;
											<!-- 弹窗开始 -->
											<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt<%=news.getNewsId()%>edit">
										  <div class="am-modal-dialog">
										    <div class="am-modal-hd">是否进入编辑页面</div>
											    <div class="am-modal-footer">
											     <input type="submit" value="是" style="width: 100%;background-color:#F8F8F8;border: 0px;color:#0E90D2;line-height: 100%;">
											     <span class="am-modal-btn" data-am-modal-cancel>否</span>
											    </div>
											  </div>
											</div>
											<script type="text/javascript">
												$(function() {
													  $('#doc-prompt-toggle<%=news.getNewsId()%>edit').on('click', function() {
													    $('#my-prompt<%=news.getNewsId()%>edit').modal({
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
			                               <%} 
	                                       else{%>
		                                       <form action="../updateNewsExamine" method="post" style="float: left">
													<input type="hidden" name="News" value="News">
													<input type="hidden" name="state" value="2">
													<input type="hidden" name="search" value="<%=search%>">
													<input type="hidden" name="page" value="<%=NewsPage%>">
													<input type="hidden" name="NewsType" value="<%=NewsType%>">
													<input type="hidden" value="<%=news.getNewsId()%>" name="NewsId">
													<button  type="button"  class="am-btn am-btn-primary"  id="doc-prompt-toggle<%=news.getNewsId()%>">重审</button>&nbsp;
											<!-- 弹窗开始 -->
											<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt<%=news.getNewsId()%>">
										  <div class="am-modal-dialog">
										    <div class="am-modal-hd">是否重审</div>
											    <div class="am-modal-footer">
											     <input type="submit" value="是" style="width: 100%;background-color:#F8F8F8;border: 0px;color:#0E90D2;line-height: 100%;">
											     <span class="am-modal-btn" data-am-modal-cancel>否</span>
											    </div>
											  </div>
											</div>
											<script type="text/javascript">
												$(function() {
													  $('#doc-prompt-toggle<%=news.getNewsId()%>').on('click', function() {
													    $('#my-prompt<%=news.getNewsId()%>').modal({
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
	                                       <%} %>
		                                       <form action="../updateNewsServlet" method="post" style="float: left">
													<input type="hidden" value="<%=news.getNewsId()%>" name="NewsId">
													<input type="hidden" value="delete" name="edit">
													<button  type="button"  class="am-btn am-btn-danger"  id="doc-prompt-toggle<%=news.getNewsId()%>del">删除</button>
											<!-- 弹窗开始 -->
											<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt<%=news.getNewsId()%>del">
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
													  $('#doc-prompt-toggle<%=news.getNewsId()%>del').on('click', function() {
													    $('#my-prompt<%=news.getNewsId()%>del').modal({
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
                                    </tr>
                                <%} 
                                if(list.size()==0){%>
							        <tr height="80px">
                                       <td width="100%" style="word-break:break-all" colspan="5">未查找到相关新闻！</td>
                                    </tr>
							        <%}%>
                                </tbody>
                            </table>
                            <!-- col end -->
                        </div>
                    </div>
           <div class="fy" style="float:right; margin-right:20px;">
           	<ul class="pagination">
           			<%if(p1>=1){ %>
                        <li><a id="up" href="../BSManage/NewsManage2.jsp?page=<%=p1%>&search=<%=search%>&NewsStatus=<%=NewsStatus%>&NewsType=<%=NewsType%>">上一页</a></li>
                    <%} %>
                    <%for(int i = 1 ; i <= page_num ; i++){%>
                        <%if(Integer.parseInt(request.getParameter("page"))!=i){%><!-- 不是当前页页码则是超链接跳转 -->
		        			<li><a href="../BSManage/NewsManage2.jsp?page=<%=i%>&search=<%=search%>&NewsStatus=<%=NewsStatus%>&NewsType=<%=NewsType%>"><%=i %></a></li>
		        		<%}
		        		else{%>
		        			<li><a style="color: red"><%=i %></a></li>
		        		<%}%>
                    <%} %>
                    <%if(p2<=page_num){ %>
                        <li><a id="down" href="../BSManage/NewsManage2.jsp?page=<%=p2 %>&search=<%=search%>&NewsStatus=<%=NewsStatus%>&NewsType=<%=NewsType%>">下一页</a></li>
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