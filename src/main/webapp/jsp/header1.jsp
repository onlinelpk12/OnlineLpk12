<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online LPK12 Course</title>

</head>

<body>
<script type="text/javascript">
window.onload = function(){
	let usernameEle = document.getElementById("userName");
	usernameEle.innerHTML = sessionStorage.getItem("username");
	
	let homepagelink = document.getElementById("homepagelink");
	homepagelink.href = sessionStorage.getItem("userRole") == "Teacher" ? "hometeacher.jsp": "home.jsp";
	
	}
	
</script>




  <div class="my-10  text-white" style="display: flex; background-color :#1b84f5;width: 100%; height: 10%; margin-bottom: 5%; justify-content: space-between; align-items: center; padding-left: 1%; padding-right: 1%;">
  <div style="flex: 0 0 auto; width: auto; max-width: none;">
    <form action="header.jsp">
      <a href="#" id="goBackButton" onclick="history.back()"><img height="30" width="40" src="../images/back.png"></a>
      <a id="homepagelink" href="home.jsp"><img height="30" width="40" src="../images/home.png"></a>
    </form>
  </div>
  <div style="flex: 1 0 auto; text-align: center;">
    <h2 id="title" style="color: white;">Welcome to Online LPK12 Course</h2>
  </div>
  <div style="flex: 0 0 auto; text-align: right;">
    <h4 id="userName" style="color: white; margin-right: 10px;">nav1008</h4>
  </div>
  <div style="flex: 0 0 auto; text-align: right;">
    <a onclick="sessionclear()" class="btn btn-warning">Logout</a>
  </div>
</div>
  






</body>
<script type="text/javascript">
function sessionclear(){
	
	sessionStorage.clear();
	window.location.href="login.html"
}
</script>
</html>
