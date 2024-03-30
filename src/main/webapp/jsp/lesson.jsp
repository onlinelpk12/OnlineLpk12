<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
    function reInitiateFreshPage(){
    	sessionStorage.setItem("pageIdToShow",'');
    }
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
<ul><p></p>
<li><a href="../jsp/lesson1.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 1!</a></li>
<p></p>
<li><a href="../jsp/lesson2.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 2!</a></li>
<p></p>
<li><a href="../jsp/lesson3.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 3!</a></li>
<p></p>
<li><a href="../jsp/lesson4.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 4!</a></li>
<p></p>
<li><a href="../jsp/Lesson4.1.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 4.1!</a></li>
<p></p>
<li><a href="../jsp/lesson5.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 5!</a></li>
<p></p>
<li><a href="../jsp/lesson6.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 6!</a></li>
<p></p>
<li><a href="../jsp/lesson6.1.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 6.1!</a></li>
<p></p>
<li><a href="../jsp/lesson7.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 7!</a></li>
<p></p>
<li><a href="../jsp/lesson8.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 8!</a></li>
<p></p>
<li><a href="../jsp/lesson10.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 10!</a></li>
<p></p>
<li><a href="../jsp/lesson11.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 11!</a></li>
<p></p>
<li><a href="../jsp/lesson12.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 12!</a></li>
<p></p>
<li><a href="../jsp/lesson18.jsp" onclick="reInitiateFreshPage()">Click here to View Lesson 18!</a></li>
</ul>

<!-- <ul id="lessonList"></ul> -->
</div>

</div>
</div>

<!-- <script src="../js/lesson.js"></script> -->

<%@ include file = "footer.jsp" %>
</body>
</html>

