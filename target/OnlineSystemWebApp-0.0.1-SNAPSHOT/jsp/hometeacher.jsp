<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/verifytoken.js" type="text/javascript"></script>
<script type="text/javascript">
  $(function(){
    verifytoken();
  });
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "header.jsp" %>
</head>
<body>
<div class="container pt-5">
<div class="row">
<div class="col-sm-6">
<h2>Lessons</h2>
<div class="card" style="width:400px">
<form action="lessonnumber.jsp">
<img class="card-img-top" src="../images/lessons.png" alt="lessons" style="width:100%">
<div class="card-body">
<p class="card-text">Click below to view lessons</p>
<a href="../jsp/lesson.jsp" class="btn btn-primary">Lessons</a>
</div>
</form>
</div>
</div>
<div class="col-sm-6">
<h2>Student's Progress</h2>
<div class="card" style="width:400px">
<form action="progress.jsp">
<img class="card-img-top" src="../images/progress.jpg" alt="progress" style="width:100%">
<div class="card-body">
<p class="card-text">Click below to view progress</p>
<a href="../jsp/courseList.jsp" class="btn btn-primary">Student's progress</a>
</div>
</form>
</div>
</div>
</div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>
