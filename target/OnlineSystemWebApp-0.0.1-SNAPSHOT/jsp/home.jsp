<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="../js/verifytoken.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Home</title>
<%@ include file = "header.jsp" %>
</head>
<body>

<div class="container pt-5" style="text-align:center">
<div class="row">
<div class="col-md-6">
<h2>Lessons</h2>
<div class="card" style="width:400px">
<form action="lessonnumber.jsp">
<img class="card-img-top" src="../images/lessons.png" alt="lessons" style="width:100%">
<div class="card-body">
<p class="card-text">Click below to view lessons</p>
<a href="lesson.jsp" class="btn btn-primary">Lessons</a>
</div>
</form>
</div>
</div>

<div class="col-sm-6">
<h2>My Progress</h2>
<div class="card" style="width:400px">
<form action="progress.jsp">






<img class="card-img-top" src="../images/progress.jpg" alt="progress" style="width:100%">
<div class="card-body">
<p class="card-text">Click below to view progress</p>
<a href="../jsp/student.jsp" class="btn btn-primary">My Progress</a>
</div>
</form>
</div>
</div>

</div>
</div>
<br>
<%@ include file = "footer.jsp" %>
<script>

$(function() {
 verifytoken();
$("#goBackButton").hide();
});

</script>
</body>
</html>
