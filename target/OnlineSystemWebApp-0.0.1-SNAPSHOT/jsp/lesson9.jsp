<html lang="en">

<head>
    <title>Lesson 7</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	 <script src="../js/verifytoken.js" type="text/javascript">  </script>
<script type="text/javascript">
$(function(){
    verifytoken();
});
</script>
    <link rel="stylesheet" href="../styles/style.css">
    <script src="../js/lessonDataStructureJSON.js"></script>
    <script src="../js/script.js"></script>    
</head>

<body>
    <script type="text/javascript"> 
        $( document ).ready(function() { 
            sessionStorage.removeItem(sessionKeyIsAssessmentPassed);
            sessionStorage.removeItem(sessionKeyIsSparcPassed);
            

        /* let pageIdToShow= sessionStorage.getItem(sessionKeyShowPageId);
  		if(pageIdToShow== null || pageIdToShow == '' || pageIdToShow == undefined){
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(7);
  			 let currentSection = document.getElementById(firstPageIdOfCurrentLesson);
  			 currentSection.hidden = false;
  		}
  		else{
  			 let currentSection = document.getElementById(pageIdToShow);
  			 currentSection.hidden = false;
  		}   */         
    });    
    </script>
	<%@ include file = "header.jsp" %>
    <section id="version-1-course-x-lesson-9-page-1" class="container">
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  End of Course</h1> <br>
            <a class="btn btn-primary pull-right" href="../jsp/lesson.jsp"
                onclick=""> Go to Home </a>
            </div>
        </div>
    </section>

<!-- onlineSPARC -->
<!-- skipped 23,24,25 pages -->
<%@ include file = "footer.jsp" %>
   </body>

</html>
