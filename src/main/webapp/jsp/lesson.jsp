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
<style>
a.disabled {
/* Make the disabled links grayish*/color: gray;
/* And disable the pointer events */pointer-events: none;
}
</style>
</head>
<body>
<div class="container pt-5">
<div class="row">
<div class="col-sm-6">
<h2>Click below links to view the lessons:</h2>
<ul>
<p></p>
<li><a href="../jsp/lesson2.jsp">Click here to View Lesson 2!</a></li>
<p></p>
<li><a href="../jsp/lesson3.jsp">Click here to View Lesson 3!</a></li>
<p></p>
<li><a href="../jsp/lesson4.jsp">Click here to View Lesson 4!</a></li>
<p></p>
<li><a href="../jsp/lesson5.jsp" class="disabled">Click here to View Lesson 5!</a></li>
<p></p>
<li><a href="../jsp/lesson6.jsp" class="disabled">Click here to View Lesson 6!</a></li>
<p></p>
<li><a href="../jsp/lesson7.jsp" class="disabled">Click here to View Lesson 7!</a></li>
<p></p>
<li><a href="../jsp/lesson8.jsp" class="disabled">Click here to View Lesson 8!</a></li>
</ul>
</div>





</div>
</div>
<br>
<%@ include file = "footer.jsp" %>
</body>
</html>
