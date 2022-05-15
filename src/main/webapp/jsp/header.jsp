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

<div class="container pt-5 my-10 bg-primary text-white" style="width:100%; height:10%; margin-bottom:5%">


 <div class="col-sm-3">
  <form action="header.jsp">
  	  <a href="#" id="goBackButton" onclick="history.back()" style="margin-top:25px"><img height="30" width="40" src="../images/back.png" style="margin-top:25px" ></a>
  	  <a id="homepagelink" href="home.jsp" style="margin-top:25px"><img height="30" width="40" src="../images/home.png" style="margin-top:25px"></a>
      </form>
  </div>


<div class="col-sm-6" style="text-align:center">
     
<h2 id="title"> Welcome to Online LPK12 Course</h2>
</div>

<div class="col-sm-2" style="margin-top:30px">
<h4 id="userName"> </h4>
</div>
<div class="col-sm-1">
<a onclick="sessionclear()" style="margin-top:30px" class="btn btn-warning">Logout</a>
</div>
</div>
</body>
<script type="text/javascript">
function sessionclear(){
	
	sessionStorage.clear();
	window.location.href="login.jsp"
}
</script>
</html>
