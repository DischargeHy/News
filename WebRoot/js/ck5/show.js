/**
 * 
 */
import '${pageContext.request.contextPath}/css/custom.css';

window.onload=function (){

	DecoupledEditor
		.create(document.querySelector('#cke_content'))
		.then(editor => {
	      editor.isReadOnly = true; //将编辑器设为只读
	    }).catch(error => {
	      console.error(error);
	    });
}
