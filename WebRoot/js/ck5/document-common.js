/**
 *
 */
var newsCovertring;
window.onload=function (){

	let edit;
	DecoupledEditor
		.create( document.querySelector( '#editor' ), {
			// toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]
			 language: 'zh-cn', // 设置中文
			    ckfinder: {  // 上传文件
			        uploadUrl: '/News/ck5/Upload',
			    }
		} )
		.then( editor => {
			const toolbarContainer = document.querySelector( 'main .toolbar-container' );
			edit=editor;
			toolbarContainer.prepend( editor.ui.view.toolbar.element );

			window.editor = editor;
		} )
		.catch( err => {
			console.error( err.stack );
		} );

}




