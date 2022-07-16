<html lang="en">

<head>
    <title>Lesson 5</title>
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
            

        let pageIdToShow= sessionStorage.getItem(sessionKeyShowPageId);
  		if(pageIdToShow== null || pageIdToShow == '' || pageIdToShow == undefined){
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(5);
  			 let currentSection = document.getElementById(firstPageIdOfCurrentLesson);
  			 currentSection.hidden = false;
  		}
  		else{
  			 let currentSection = document.getElementById(pageIdToShow);
  			 currentSection.hidden = false;
  		}           
    });    
    </script>
	<%@ include file = "header.jsp" %>
    <section id="version-1-course-x-lesson-5-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 5: Model periodic table - chemical symbols </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(5, 0, 'version-1-course-x-lesson-5-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-5-page-2" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h1 class="text-primary"> Model the Chemical Symbol </h1>
                <ul>
                    <li> A periodic table tell us us important information of an element and help us predicate properties of elements </li>
                    <li> In this Chapter we learn modeling the chemical symbols into computer knowledge </li>
                    <li> Let us see where you stand in modeling the chemical symbol with small assessment </li>
                </ul>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(5, 0, 'version-1-course-x-lesson-5-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(5, 0, 'version-1-course-x-lesson-5-page-2', false, -1)"> Next 
                </a>
            </div>
        </div>
    </section>
	
	 <!-- Lesson 5 assement 0 - program 0 -->
	<section id="version-1-course-x-lesson-5-page-3" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h4>Extent your model to add knowledge about element(s) of your choice</h4>
                <form action="">
                    <label for="ques1"> The element has to be one of the first 20 in the periodic table, represent knowledge as comment and fact  </label><br/>
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(5, 0, 'version-1-course-x-lesson-5-page-3', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-5-page-3', 'program0')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>    

    <!-- Online SPARC -->
    <!-- skipped 4,5 pages -->

    <!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-5-page-6" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2> Learning outcome 1: Periodic Table</h2>
            <ul>
				<li> What is the periodic table for? </li>
				<li> We will develop computer model for the basic information of a periodic table </li>
			</ul>
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(5, 1, 'version-1-course-x-lesson-5-page-6', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(5, 1, 'version-1-course-x-lesson-5-page-6', false, -1)"> Next </a>
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-5-page-7" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <img src="../images/lesson-5-page-7.png" alt="Image" width="500" height="300">
                
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(5, 1, 'version-1-course-x-lesson-5-page-7', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(5, 1, 'version-1-course-x-lesson-5-page-7', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
	
	<!-- Lesson 5 assement 1 - program 1 -->
	<section id="version-1-course-x-lesson-5-page-8" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h4>Assume symbolFor(E, S)means that the chemical symbol for element E is S</h4>
				<h4>Extend the computer model to answer the question</h4>
                <form action="">
                    <label for="ques1"> Represent knowledge as comment and fact for chemical symbol </label><br/>
                    <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(5, 1, 'version-1-course-x-lesson-5-page-8', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-5-page-8', 'program1')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->
    <!-- skipped 9,10 pages -->


    <!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-5-page-11" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Learning outcome 2: A cell in a periodic table - a new element </h2>
                <img src="../images/lesson-5-page-11.png" alt="Image" width="500" height="300">
                
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(5, 2, 'version-1-course-x-lesson-5-page-11', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(5, 2, 'version-1-course-x-lesson-5-page-11', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
                
    <!-- Lesson 5 assement 2 - program 2 -->
	<section id="version-1-course-x-lesson-5-page-12" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h4>Assume symbolFor(E, S)means that the chemical symbol for element E is S</h4>
				<h4>Extend the computer model to answer the question</h4>
                <form action="">
                    <label for="ques1"> Represent knowledge as comment and fact for chemical symbol </label><br/>
                    <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(5, 2, 'version-1-course-x-lesson-5-page-12', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-5-page-12', 'program2')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->
    <!-- skipped 13,14 pages -->


    <!-- learning outcome 3 -->
    <section id="version-1-course-x-lesson-5-page-15" class="container" hidden>
            <div class="row">
                <div class="col-md-6 content" style="margin-left:20rem">
        <h2>Learning outcome 3: Extending the model for Phosphorous </h2>
        <ul>
            <li> Questions </li>
            <ul>
                <li> Is P the chemical symbol for Phosphorus? </li>
            </ul>
        </ul>
        <ul>
            <li> develop model  </li>
            <ul>
                <li>Extend model (with the needed knowledge)</li>
				<li> Test model (by asking query) </li>
            </ul>
			 <li> [Students work on paper or board] </li>
			 <li> Go to Activity 4  on Workbook  </li>
        </ul>
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(5, 3, 'version-1-course-x-lesson-5-page-15', false, -1)"> Previous </a>
         <a class="btn btn-primary pull-right"
            onclick="gotoNext(5, 3, 'version-1-course-x-lesson-5-page-15', false, -1)"> Next </a>
    </div></div>
    </section>

<!-- onlineSPARC -->
<!-- skipped 23,24,25 pages -->
<!-- learning outcome 3 -->

<%@ include file = "footer.jsp" %>
   </body>

</html>