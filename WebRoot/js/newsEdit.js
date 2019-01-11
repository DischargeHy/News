/**
 * 
 */
//发布新闻
function publish(message){
	//获取新闻内容
	var newsContent=editor.getData();
//	newsContent=newsContent.replace(/[\r\n]/g, " ");
//	newsContent=newsContent.replace(/&/g, "%26");
	newsContent=encodeURIComponent(newsContent);

	/*
//	alert(newsContent);

	var xmlhttp = createXmlHttp();

	if(!xmlhttp) {
	    alert("您的浏览器不支持AJAX！");
	    return 0;
	}
	
	var fengmian=document.getElementById("fengmian").src;//新闻封面 
	var newsTitle=document.getElementById("newsTitle").value;//新闻标题
	var newsType=document.getElementById("newsType");
	var index=newsType.selectedIndex;
	var newsTypeId=newsType.options[index].value; //新闻类型

	var postData="";
	postData+="newsContent="+newsContent;   //新闻内容
	postData+="&newsCover="+fengmian;	//新闻封面
	postData+="&newsTitle="+newsTitle;  //新闻标题
	postData+="&newsTypeId="+newsTypeId;//新闻类型
*/	
	$.ajax({
	    //几个参数需要注意一下
	        type: "POST",//方法类型
	        dataType: "json",//预期服务器返回的数据类型
	        url: "/News/PublishNews" ,//url
	        data: $('#editNews').serialize()+"&newsContent="+newsContent,
	        success: function (result) {
//	            console.log(result);//打印服务端返回的数据(调试用)
	        	if(result.uploaded==1){
	        		window.location.href=result.url;
	        	}else{
	        		message.innerHTML=result.message;
	        		
	        	}
	        	
//	            if (result.resultCode == 200) {
//	                alert("SUCCESS");
	//
//	            }
	            ;
	        },
	        error : function() {
	            alert("上传失败！");
	        }
	    });


	/*xmlhttp.onreadystatechange = function() {
	    if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {

	    	//result 为发布成功后跳转的页面
	        var result=xmlhttp.responseText;
	        
	        if(result == null || result == " "){
	        	console.log(result);
	        }else{
	        	var result_json=eval("(" + result + ")");
	        	window.location.href=result_json.url;
//	        	window.location.href=result;
	        }
	    }else{
	    	//发布失败
	    	message.innerHTML="上传失败";
	    }
	}
	var url = '/News/PublishNews';
	xmlhttp.open("POST", url, true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
	xmlhttp.send(postData);*/



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
	var newsCover=document.getElementById("file_img").files[0];
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
//		        alert(result_json.url);
		        document.getElementById("fengmian").src = result_json.url;
		        document.getElementById("newsCover").value = result_json.url;

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