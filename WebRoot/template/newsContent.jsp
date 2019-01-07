<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="cke_content" style="width: 1200px; margin: 0 auto;">
${news.getNewsContent()}
</div>
<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

window.onload=function (){

	DecoupledEditor
		.create(document.querySelector('#cke_content'))
		.then(editor => {
	      editor.isReadOnly = true; //将编辑器设为只读
	    }).catch(error => {
	      console.error(error);
	    });
}

</script>
