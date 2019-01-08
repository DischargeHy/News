function changeHref1(type){
	var s = document.getElementById("search").value;
	document.getElementById("aForm").href="../BSManage/UserManage2.jsp?page=1&search="+s+"&type="+type;
}
