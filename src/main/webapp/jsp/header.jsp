<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online LPK12 Course</title>
</head>
<body>
<%
String username = request.getParameter("username");
%>
<div class="container pt-5 my-10 bg-primary text-white" style="width:100%">


 <div class="col-sm-3">
  <form action="header.jsp">
  	  <a href="#" id="goBackButton" onclick="history.back()" style="margin-top:25px"><img height="30" width="40" src="back.png" style="margin-top:25px" ></a>
  	  <a href="jsp/home.jsp" style="margin-top:25px"><img height="30" width="40" src="images/home.png" style="margin-top:25px"></a>
      </form>
  </div>


<div class="col-sm-6" style="text-align:center">
     
<h2 id="title"> Welcome to Online LPK12 Course</h2>
</div>

<div class="col-sm-2" style="margin-top:30px">
<h4><%= username %> </h4>
</div>
<div class="col-sm-1">
<a href="jsp/logout.jsp" style="margin-top:30px" class="btn btn-warning">Logout</a>
</div>
</div>
</body>
</html>