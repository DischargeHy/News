/**
 * 
 */
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

function pingun(){
	var xmlhttp = createXmlHttp();

	// 实例化一个表单数据对象 
	var formData = new FormData(); 
	formData.append("newsCover", newsCover); 

	if(!xmlhttp) {
	    alert("您的浏览器不支持AJAX！");
	    return 0;
	}
	var url = '/News/Comment';

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
	        }
	    }else{
	    	//发布失败
	    	
	    }
	}
	xmlhttp.open("POST", url, true);

	xmlhttp.send(formData);
}