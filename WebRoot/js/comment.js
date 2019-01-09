/**
 *
 *  @param mainComment    评论
	@param secondComment  回复   即 评论的评论



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

	var p_content=$("<div class='p_content'></div>"); //评论的内容部分

	var p_text=$('<div class="p_text"></div>'); //评论的内容

	var p_bottom=$('<div class="p_bottom"></div)');  //评论内容的底部   显示 评论时间和 该评论的回复数量

	var button=$('<button class="am-btn am-btn-primary" data-am-collapse="{target: "#reply_ul"}">查看回复<i>(32)</i></button>');

	var reply_content=$('<div class="reply_content"></div>');  //回复区域

	var reply_ul=$('<ul class="reply_ul" id="reply_ul"></ul>');	// 无序列表 里头装的是回复

	var reply_li=$('<li class="reply_li"></li>');	//单条评论

	var reply_li_div_head=$('<div class="reply_li_div_head"><img src="reply_img"></div>');	//回复者头像

	var reply_li_div_content=$('<div class="reply_li_div_content"></div>'); //单条回复的主要内容

	var reply_text=$('<div class="reply_text"></div>'); //回复的内容

	var reply_bottom=$('<div class="reply_bottom"></div>'); //回复的底部




}
var comment_num=0;
function get_comment_num(){
    return comment_num++;
}

//@param JSON mainComment  单个评论 主要内容   不包含 该评论的 回复部分
function product_p_content(mainComment,comment_num){
    var p_content=$("<div class='p_content'></div>"); //评论的内容部分

    var p_text=$('<div class="p_text">'+mainComment.commentContent+'</div>'); //评论的内容

    var p_bottom=$('<div class="p_bottom">'+mainComment.commentTime+'</div>');  //评论内容的底部   显示 评论时间和 该评论的回复数量

    if(mainComment.replyCount>0){
        var button=$('<button class="am-btn am-btn-primary" data-am-collapse="{target: "#reply_ul_'+comment_num+'"}">查看回复<i>(mainComment.replyCount)</i></button>'); //
    }else{

    }

    //


}

function append_reply_content(){

}


//@param JSON secondCommentList  //单个评论的所有回复
function product_reply_content(secondCommentList,comment_num){
    var reply_ul=$('<ul class="reply_ul" id="reply_ul_"+comment_num+"></ul>'); // 无序列表 里头装的是回复
    for(var li in secondCommentList){
        reply_ul.appendChild(product_reply_li(li));
    }
    return reply_ul;
}



//@param JSON secondComment // 单个回复  json 类型
function product_reply_li(secondComment){
	var reply_li=$('<li class="reply_li"></li>');	//单条评论

	var reply_li_div_head=$('<div class="reply_li_div_head"></div>');	//回复者头像
	
	$("<img class='reply-head'></img>").attr('src',secondComment.userHead);  //  将图片放入 上述 div 中
	
	var reply_li_div_content=$('<div class="reply_li_div_content"></div>'); //单条回复的主要内容

	var reply_text=$('<div class="reply_text"></div>'); //回复的内容
	
	$(reply_text).text(secondComment.commentContent);
	
	var reply_bottom=$('<div class="reply_bottom"></div>'); //回复的底部
	
	$(reply_bottom).text(secondComment.commentTime);
	
	
	
	reply_li_div_content.appendChild(reply_text);
    reply_li_div_content.appendChild(reply_bottom);

    reply_li.appendChild(reply_li_div_head);
    reply_li.appendChild(reply_li_div_content);

	return reply_li;
}


function test(){
	
}
















