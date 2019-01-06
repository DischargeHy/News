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
//发布新闻
function publish(message){
	//获取新闻内容
	var newsContent=editor.getData();


//	alert(newsContent);

	var xmlhttp = createXmlHttp();

	if(!xmlhttp) {
	    alert("您的浏览器不支持AJAX！");
	    return 0;
	}
	var url = '/News/PublishNews';
	var fengmian=document.getElementById("fengmian").src;//新闻封面 
	var newsTitle=document.getElementById("newsTitle").value;//新闻标题
	var newsType=document.getElementById("newsType");
	var index=newsType.selectedIndex;
	var newsTypeId=newsType.options[index].value; //新闻类型
//	var formData = new FormData(); 
//	formData.append("newsContent", newsContent);  //新闻内容
//	formData.append("newsCover", document.getElementById("fengmian").src);//新闻封面 
//	formData.append("newsTitle", document.getElementById("newsTitle").value);//新闻标题
//	var newsTypeName=document.getElementById("newsTypeName");
//	var index=newsTypeName.selectedIndex;
//	formData.append("newsTypeName", newsTypeName.options[index].value); //新闻类型
//	formData.append("t", Math.random()); 
	var postData="";
	postData+="newsContent="+newsContent;   //新闻内容
	postData+="&newsCover="+fengmian;	//新闻封面
	postData+="&newsTitle="+newsTitle;  //新闻标题
	postData+="&newsTypeId="+newsTypeId;//新闻类型
	


	xmlhttp.onreadystatechange = function() {
	    if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {

	    	//result 为发布成功后跳转的页面
	        var result=xmlhttp.responseText;

	        if(result == null || result == " "){
	        	console.log(result);
	        }else{
	        	window.location.href=result;
	        }
	    }else{
	    	//发布失败
	    	message.innerHTML="上传失败";
	    }
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(postData);
//	xmlhttp.send(formData);


}

function createXmlHttp() {
    var xmlhttp = null;
    try {
        //Firefox, Opera 8.0+, Safari
        xmlhttp = new XMLHttpRequest();
    } catch (e) {
        //IE
        try {
            xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlhttp;
}

function publishConfirm(){
	var r=confirm("是否发布新闻");
	var message=document.getElementById("publishMessage");
	message.innerHTML="";
	if (r==true){
		publish(message);
	}
}

//上传新闻封面
function newsCover(){
	var xmlhttp = createXmlHttp();
	var newsCover=document.getElementById("newsCover").files[0];
	// 实例化一个表单数据对象 
	var formData = new FormData(); 
	formData.append("newsCover", newsCover); 
	formData.append("t", Math.random()); 
	if(!xmlhttp) {
	    alert("您的浏览器不支持AJAX！");
	    return 0;
	}
	var url = '/News/ck5/Upload';

	xmlhttp.onreadystatechange = function() {
	    if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {

	    	//result 为发布成功后跳转的页面
	        var result=xmlhttp.responseText;
	        
	        if(result == null || result == " "){
	        	
	        }else{
	        	var result_json;
		        result_json=eval("(" + result + ")");
		        alert(result_json.url);
		        document.getElementById("fengmian").src = result_json.url;
	        }
	    }else{
	    	//发布失败
	    	
	    }
	}
	xmlhttp.open("POST", url, true);
	
//	xmlhttp.setRequestHeader("Content-Type", "multipart/form-data");
//	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(formData);
}



