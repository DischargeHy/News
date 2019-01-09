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

function showComments(newsId,commentId){
	var Data;
	if(commentId){
		Data = "newsId="+newsId+"&"+"commentId="+commentId
	}else{
		Data = "newsId="+newsId
	}
	$.ajax({
	    //几个参数需要注意一下
	        type: "POST",//方法类型
	        dataType: "json",//预期服务器返回的数据类型
	        url: "/News/ShowComments" ,//url
//	        data: $('#commentForm').serialize(),
	        data: Data,
	        success: function (result) {
	            console.log(result);//打印服务端返回的数据(调试用)
	            if (result.resultCode == 200) {
	                alert("SUCCESS");
	                
	            }
	            ;
	        },
	        error : function() {
	            alert("异常！");
	        }
	    });

}
function pinglun() {
    $.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/News/AddComment" ,//url
        data: $('#commentForm').serialize(),
        success: function (result) {
            console.log(result);//打印服务端返回的数据(调试用)
            if (result.resultCode == 200) {
                alert("SUCCESS");
                
            }
            ;
        },
        error : function() {
            alert("异常！");
        }
    });
}

function productPinglun(json){
	var d=$("<div class='d'></div>");  //单条评论  
	
	var d_author=$("<div class='d_author'></div");  //评论人信息
	
	var d_author_head=$("<div class='d_author_head_div'><img class='d_author_head' src=''></div>"); //评论人头像部分
	
	var d_author_name=$("<div class='d_author_name'></div>");   //评论人昵称部分
	
	var d_post_comtent_main=$("<div class='d_post_comtent_main'></div>");  // 评论的主要内容 里面包括了 回复   PS:回复即评论的评论
	
	var p_content=$("<div class='p_content'></div>"); //评论的内容
	
	var reply_content=$('<div class="reply_content"></div>');  //回复区域
	
	
	
	
	
	
	
	
	
	
	
}