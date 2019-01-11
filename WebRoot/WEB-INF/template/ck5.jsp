
<%@page import="entity.NewsType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/ck5/document/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/ck5/document/translations/zh-cn.js"></script>

<form id="editNews">

<div style="text-align: center;">
<br>
<label style="height:30px;font-size:15px">新闻标题:&nbsp;&nbsp;&nbsp;<input id="newsTitle" name="newsTitle" size="80" type="text" value="${news.getNewsTitle() }" style="height:30px"/></label>&nbsp;&nbsp;
<label style="height:30px;font-size:15px">新闻类型:&nbsp;&nbsp;</label>

<!-- 新闻类型 -->

<select id="newsType" name="newsTypeId" style="height:30px">

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
<br>
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



<div style="width: 400px;">
</div>
<br>
<br>

	<div class="center" >
	<input type="hidden" id="newsId" name="newsId" value="${news.getNewsId()}">
	<br>
	<center><img alt="新闻封面" src="<%if(news!=null){out.print(news.getNewsCover());}
						else{ %>${pageContext.request.contextPath}/img/java.png<%} %>" style="max-width: 300px;" id="fengmian">
	设置新闻封面：<label ><input type="file" id="file_img" name="file_img" accept="image/png,image/gif,image/jpeg"  /></label>
	</center>
	
	</div>
	
	</div>
	<div style="text-align: center;">
	<br>
	<br>
</div>
<input type="hidden" id="newsCover" name="newsCover" value="${news.getNewsCover()}">

</form>
<div style="text-align: center;">
<button onclick="publishConfirm()" type="button"  style="height:35px; width:100px;" class="am-btn am-btn-danger am-radius">发布新闻</button><br>
	<span id="publishMessage" style="color: red;"></span>
</div>	
<script type="text/javascript">
var img = document.getElementById('file_img').addEventListener('change',function() {
	newsCover();
})
</script>
