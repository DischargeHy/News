
<%@page import="entity.NewsType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/ck5/document/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/ck5/document/translations/zh-cn.js"></script>
<form id="editNews">
<div style="text-align: center;">
<label>新闻标题<input id="newsTitle" name="newsTitle" size="80" type="text" value="${news.getNewsTitle() }"/></label>
<label>新闻类型</label>
<!-- 新闻类型 -->
<select id="newsType" name="newsTypeId">
	<%
		News news=(News)request.getAttribute("news");
	
		ArrayList<NewsType> list=(ArrayList<NewsType>)request.getAttribute("typeList");
		for(NewsType newsType:list){
	%>	 
			<option  value="<%=newsType.getNewsTypeId()%>" 
				<%if(news!=null&&news.getNewsTypeId()==newsType.getNewsTypeId()){
					out.print("selected=\"selected\"");
					} %>>
				<%=newsType.getNewsTypeName()%>
			</option>
	<%		
		}
	%>
</select>
</div>
<main>
	<div class="centered">
		<div class="document-editor">
			<div class="toolbar-container"></div>
			<div class="content-container">
				<div id="editor">
					${news.getNewsContent()}
				</div>
			</div>
		</div>
	</div>
</main>

<script src="${pageContext.request.contextPath}/js/ck5/document-common.js"></script>
<script src="${pageContext.request.contextPath}/js/newsEdit.js"></script>
<div style="text-align: center;">
<span id="publishMessage" style="color: red;"></span>
</div>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ck5.css" type="text/css" />

<div style="text-align: center;">
	<input type="file" id="newsCover" name="newsCover" accept="image/png,image/gif,image/jpeg"/>
	<button onclick="newsCover()">上传图片作为封面</button>
<div style="width: 400px;">
</div>
<img alt="新闻封面" src="<%if(news!=null){out.print(news.getNewsCover());}
						else{ %>${pageContext.request.contextPath}/img/java.png<%} %>" style="max-width: 300px;" id="fengmian">
</div>
</form>
<button onclick="publishConfirm()" style="display: bloack; margin: 0 auto;">发布新闻</button>