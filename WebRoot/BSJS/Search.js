function changeHref1(NewsType){
	var s = document.getElementById("search").value;
	document.getElementById("aForm").href="../BSManage/NewsManage2.jsp?page=1&search="+s+"&NewsType="+NewsType;
}
function changeHref2(NewsStatus){
	var s = document.getElementById("search").value;
	document.getElementById("aForm").href="../BSManage/NewsManage2.jsp?page=1&search="+s+"&NewsStatus="+NewsStatus;
}
