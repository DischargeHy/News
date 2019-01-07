<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${news.getNewsTitle()}</title>
<script src="${pageContext.request.contextPath}/ck5/document/ckeditor.js"></script>

</head>
<body>

<div>
<jsp:include page="/template/newsContent.jsp"></jsp:include>
</div>

</body>
</html>