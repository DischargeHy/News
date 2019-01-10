/**
 *
 *  @param mainComment    评论
	@param secondComment  回复   即 评论的评论



 *
 */
var authorId;
var newsId;
var userId;  //当前登录用户的id
function ini_date(a,n,u){
	authorId=a;
	newsId=n;
	userId=u;
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

function showComments(newsId){
	var Data;

	Data = "newsId="+newsId
	
	$.ajax({
	    //几个参数需要注意一下
	        type: "POST",//方法类型
	        dataType: "json",//预期服务器返回的数据类型
	        url: "/News/ShowComments" ,//url
//	        data: $('#commentForm').serialize(),
	        data: Data,
	        success: function (result) {
	            console.log(result);//打印服务端返回的数据(调试用)
//	            alert("success");

//	            test_ul(result);
//	            test(result[0]);   
//	            test_product_d(result[0],get_comment_num());
	            
	            for(i in result){
	            	$('#comment_area').append(product_d(result[i],comment_num));
	            }
	            
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
//newsId
//commentId
//num 序号
//dom   this   为<a>标签
function show_reply(newsId,commentId,num,dom){
	var Data;
	if(commentId){
		Data = "newsId="+newsId+"&"+"commentId="+commentId;
	}else{
		Data = "newsId="+newsId;
	}
	var d_post_comtent_main=$(dom).parent().parent();
	$(d_post_comtent_main).children("div:last-child").toggle("slow");
	$.ajax({
	    //几个参数需要注意一下
	        type: "POST",//方法类型
	        dataType: "json",//预期服务器返回的数据类型
	        url: "/News/ShowComments" ,//url
//	        data: $('#commentForm').serialize(),
	        data: Data,
	        success: function (result) {
	            console.log(result);//打印服务端返回的数据(调试用)
//	            alert("success");
	            
	            var ul=product_reply_ul(result,comment_num);
//	            $(ul).hide();
	            $(d_post_comtent_main).children("div:last-child").html(ul);
	            
	            
	            
//	            if (result.resultCode == 200) {
//	                alert("SUCCESS");
//	                
//	            }
	            ;
	        },
	        error : function() {
	            alert("异常！");
	        }
	    });
}

function pinglun(replyId,who) {
	$('body,html').animate({scrollTop: $('#commentForm').offset().top-50}, 500);
	$('#replyId').val(replyId);
	$('#who').html("回复ta@<a>"+who+"</a>");
}

function resetForm(){
//	$('#replyId').removeAttr('id');
	$('#replyId').val('');
	$('#who').html('');
}

function submit_pinglun(){
	$.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/News/AddComment" ,//url
        data: $('#commentForm').serialize(),
        success: function (result) {
//            console.log(result);//打印服务端返回的数据(调试用)
        	window.location.reload();
//            if (result.resultCode == 200) {
//                alert("SUCCESS");
//
//            }
            ;
        },
        error : function() {
            alert("异常！");
        }
    });
}


var comment_num=0;
function get_comment_num(){
    return comment_num++;
}
function test_product_d(mainComment,comment_num){
	$('#xx').append(product_d(mainComment,comment_num));
}

function product_d(mainComment,comment_num){
	var d=$('<div class="d"></dvi>');
	
	var d_author=$('<div class="d_author"></div>');
	
	var d_author_head=$('<div class="d_author_head"></div>');
	
	var d_author_head_img=$('<img class="d_author_head_img" src="">').attr("src",mainComment.userHead);
	
	$(d_author_head).append(d_author_head_img);
	
	var d_author_name=$('<div class="d_author_name"></div>').append($('<a href="#"></a>').text(mainComment.userName));
	
	d_author.append(d_author_head).append(d_author_name);
	$(d).append(d_author);
	
	var d_post_comtent_main=$('<div class="d_post_comtent_main"></div>').attr('id','comment-'+comment_num);
	d_post_comtent_main.append(product_p_content(mainComment,comment_num));
	
	$(d).append(d_author).append(d_post_comtent_main);
	return d;
}

//
//@param JSON mainComment  单个评论 主要内容   不包含 该评论的 回复部分
function product_p_content(mainComment,comment_num){
    var p_content=$("<div class='p_content'></div>"); //评论的内容部分

    var p_text=$('<div class="p_text"></div>').text(mainComment.commentContent); //评论的内容

    var p_bottom=$('<div class="p_bottom"></div>');  //评论内容的底部   显示 评论时间和 该评论的回复数量
    
    var comment_time=$('<span class="reply_time"></span>').text(mainComment.commentTime);
    
//    var huifu=$("<a href='javascript:pinglun("+mainComment.commentId+",\'"+mainComment.userName+"\')' >回复</a>");
    
    //如果是自己的评论或者是作者
    var huifuOrShanchu;
    var zuozhe;
    if(authorId==userId){
    	huifuOrShanchu=$("<a href=''>删除</a>");
    	var href="javascript:delect_comment("+mainComment.commentId+")";
    	zuozhe=$("<a href=''>回复</a>");
    	var href="javascript:pinglun("+mainComment.commentId+",'"+mainComment.userName+"')";
    	$(zuozhe).attr('href',href);
    }else if(userId==mainComment.userId){
    	huifuOrShanchu=$("<a href=''>删除</a>");
    	var href="javascript:delect_comment("+mainComment.commentId+")";
    	$(huifuOrShanchu).attr('href',href);
    }
    else{
    	huifuOrShanchu=$("<a href=''>回复</a>");
    	var href="javascript:pinglun("+mainComment.commentId+",'"+mainComment.userName+"')";
    	$(huifuOrShanchu).attr('href',href);
    }
    
    //举报   report_comment()
	var report=$("<a href=''>举报</a>");
	var href="javascript:report_comment("+mainComment.commentId+")";
	$(report).attr('href',href);
    
    $(p_bottom).append(comment_time).append(huifuOrShanchu).append(zuozhe).append(report);
   
    
    
    p_content.append(p_text).append(p_bottom);
    
    if(mainComment.replyCount>0){
        var button=$('<button class="am-btn am-btn-primary" data-am-collapse="{target: "#reply_ul_'+comment_num+'" }  onclick="show_reply('+mainComment.newsId+','+mainComment.commentId+','+comment_num+',this)"></button>'); //
        button.append('<i>查看回复('+mainComment.replyCount+')</i>');
        
        var reply_content=$('<div class="reply_content" ></div>').hide();
        
        $(p_bottom).append(button).after(reply_content);
        
    }else{
    	
    }
    
    return p_content;
    //

}



//回复部分  多条回复
//@param JSON secondCommentList  //单个评论的所有回复
function product_reply_ul(secondCommentList,comment_num){
	
    var reply_ul=$('<ul class="reply_ul" id=""></ul>').attr('id','reply_ul_'+comment_num); // 无序列表 里头装的是回复
    for(var li in secondCommentList){
//    	console.log(secondCommentList[li]);
        $(reply_ul).append(product_reply_li(secondCommentList[li]));
    }

    return reply_ul;
}


//回复部分  单条回复
//@param JSON secondComment // 单个回复  json 类型 
function product_reply_li(secondComment){
	var reply_li=$('<li class="reply_li"></li>');	//单条评论

	var reply_li_div_head=$('<div class="reply_li_div_head"></div>');	//回复者头像
	
	var img=$("<img class='reply_head'></img>").attr('src',secondComment.userHead);  
	$(reply_li_div_head).append(img);//  将图片放入 上述 div 中
	
	var reply_li_div_content=$('<div class="reply_li_div_content"></div>'); //单条回复的主要内容

	var reply_text=$('<div class="reply_text"></div>'); //回复的内容
	
	var userName=$('<a href="#"></a>').text(secondComment.userName);   //发表回复的那个人的名字
	
	var replyUserName=$('<a href="#"></a>').text(secondComment.replyUserName);
	$(reply_text).append(userName).append('<i>@</i>').append(replyUserName).append('<span class="reply_p">'+secondComment.commentContent+'</span>');

	
	var reply_bottom=$('<div class="reply_bottom"></div>'); //回复的底部
	
	//如果是自己的评论或者是作者
    var huifuOrShanchu;
    var zuozhe;
    if(authorId==userId){
    	huifuOrShanchu=$("<a href=''>删除</a>");
    	var href="javascript:delect_comment("+secondComment.commentId+")";
    	zuozhe=$("<a href=''>回复</a>");
    	var href="javascript:pinglun("+secondComment.commentId+",'"+secondComment.userName+"')";
    	$(zuozhe).attr('href',href);
    }else if(userId==secondComment.userId){
    	huifuOrShanchu=$("<a href=''>删除</a>");
    	var href="javascript:delect_comment("+secondComment.commentId+")";
    	$(huifuOrShanchu).attr('href',href);
    }
    else{
    	huifuOrShanchu=$("<a href=''>回复</a>");
    	var href="javascript:pinglun("+secondComment.commentId+",'"+secondComment.userName+"')";
    	$(huifuOrShanchu).attr('href',href);
    }
	
//	var a=$("<a href=''>回复</a>");
//	var href="javascript:pinglun("+secondComment.commentId+",'"+secondComment.userName+"')";
//	$(a).attr('href',href);
    
	$(reply_bottom).append('<span class="reply_time">'+secondComment.commentTime+'</span>');
//	$(reply_bottom).append(a);
	//举报   report_comment()
	var report=$("<a href=''>举报</a>");
	var href="javascript:report_comment("+secondComment.commentId+")";
	$(report).attr('href',href);
	
	$(reply_bottom).append(huifuOrShanchu).append(zuozhe).append(report);
	
	
	
	
	
	$(reply_li_div_content).append(reply_text);
    $(reply_li_div_content).append(reply_bottom);

    $(reply_li).append(reply_li_div_head);
    $(reply_li).append(reply_li_div_content);

	return reply_li;
}





function test(json){
	var x=product_reply_li(json);
	$("#xx").append(x);
//	console.log(x);
	
}

function test_ul(json){
	var x=product_reply_content(json,get_comment_num());
	$("#xx").append(x);
//	console.log(x);
}




function delect_comment(commentId){
	var Data="commentId="+commentId;
	if(confirm("是否删除")){
		$.ajax({
		    //几个参数需要注意一下
		        type: "POST",//方法类型
		        dataType: "json",//预期服务器返回的数据类型
		        url: "/News/DelectComment" ,//url
		        data: Data,
		        success: function (result) {
//		            console.log(result);//打印服务端返回的数据(调试用)
		        	window.location.reload();
//		            if (result.resultCode == 200) {
//		                alert("SUCCESS");
		//
//		            }
		            ;
		        },
		        error : function() {
		            alert("异常，删除失败！");
		        }
		    });
	}
}

function report_comment(commentId){
	var Data="commentId="+commentId;
	if(confirm("是否举报")){
		$.ajax({
		    //几个参数需要注意一下
		        type: "POST",//方法类型
		        dataType: "json",//预期服务器返回的数据类型
		        url: "/News/ReportComment" ,//url
		        data: Data,
		        success: function (result) {
//		            console.log(result);//打印服务端返回的数据(调试用)
		        	alert("举报成功！");
//		        	window.location.reload();
//		            if (result.resultCode == 200) {
//		                alert("SUCCESS");
		//
//		            }
		            ;
		        },
		        error : function() {
		            alert("异常，举报失败！");
		        }
		    });
	}
}












