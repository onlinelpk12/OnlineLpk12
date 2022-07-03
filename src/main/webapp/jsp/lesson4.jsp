<!DOCTYPE html>
<html lang="en">
    
<head>
    <title>Lesson 4</title>
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(4);
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
    <section id="version-1-course-x-lesson-4-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 4:  Modeling Dad using Variables and Rules</h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-4-page-2" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                    <li> What we know </li>
                        <ul>
                            <li> John is the father of Peter,Sarah and Linda </li>
                            <li> Joann is also the mother of Peter,Sarah and Linda </li>
                        </ul>
                    <li> Questions </li>
                        <ul>
                            <li> Is John the father of Peter? </li>
                            <li> Who is Peter's father? </li>
                            <li> Who is Peter's dad? </li>
                            <li> Who is the mother of Peter? </li>
                        </ul>

                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-2', false, -1)"> Next 
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-4-page-3" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <img src="../images/Lesson4image1.png" alt="Image" width="500" height="250">
                
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-3', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-4-page-4" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <img src="../images/Lesson4image2.png" alt="Image" width="500" height="300">
                
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-4', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-4', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-4-page-5" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <img src="../images/Lesson4image3.png" alt="Image" width="500" height="200">
               
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-5', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-5', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-4-page-6" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h4>Extent your model for "parent" rule</h4>
                <br>
                <form action="">
                    <label for="ques1"> Representing knowledge as comment and fact  </label><br />
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-6', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-4-page-6', 'program0')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Online SPARC -->
    <!-- skipped 7,8,9 pages -->


    <!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-4-page-10" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2> Learning outcome 1: Extend the Model for parent relation</h2>
            <img src="../images/Lesson4image4.png" alt="Image" width="500" height="300">

            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(4, 1, 'version-1-course-x-lesson-4-page-10', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(4, 1, 'version-1-course-x-lesson-4-page-10', false, -1)"> Next </a>
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-4-page-11" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Learning outcome 1: Extend the Model for parent relation </h2>
                <br>
                <h4>Extent your model for dad rule</h4>
                <br>
                <form action="">
                    <label for="ques1"> Representing knowledge as comment and fact  </label><br />
                    <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(4, 1, 'version-1-course-x-lesson-4-page-11', false, -1)"> Previous </a>
                <div class="text-center">
                <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-4-page-11', 'program1')"> Submit</a>
            </div>
           
            </form>
          </div>
        </div>  
    </section>
    <!-- onlineSPARC -->
    <!-- skipped 12,13,14 pages -->


    <!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-4-page-15" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Learning outcome 2: Extending the model for dad relation </h2>
                <img src="../images/Lesson4image5.png" alt="Image" width="500" height="200">

                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4, 2, 'version-1-course-x-lesson-4-page-15', false, -1)"> Previous </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(4, 2, 'version-1-course-x-lesson-4-page-15', false, -1)"> Next </a>
            </div>
        </div>
    </section>
                
    <section id="version-1-course-x-lesson-4-page-16" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 2: Extending the model for dad relation </h2>
            <br>
            <h4> Extend your Model for mom rule </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <br>
                <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(4, 2, 'version-1-course-x-lesson-4-page-16', false, -1)"> Previous </a>
                <div class="text-center">
                    <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-4-page-16', 'program2')"> Submit</a>
                </div>
            </form>
            <br>
            
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->
    <!-- skipped 17,18,19 pages -->


    <!-- learning outcome 3 -->
        <section id="version-1-course-x-lesson-4-page-20" class="container" hidden>
            <div class="row">
                <div class="col-md-6 content" style="margin-left:20rem">
        <h2>Learning outcome 3: Extending the model for father relation </h2>
        <img src="../images/Lesson4image4.png" alt="Image" width="500" height="300">
        
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(4, 3, 'version-1-course-x-lesson-4-page-20', false, -1)"> Previous </a>
        <a class="btn btn-primary pull-right"
            onclick="gotoNext(4, 3, 'version-1-course-x-lesson-4-page-20', false, -1)"> Next </a>
    </div></div>
</section>

    <section id="version-1-course-x-lesson-4-page-21" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
    <h2>Learning outcome 3: Extending the model for father relation </h2>
    <img src="../images/Lesson4image5.png" alt="Image" width="500" height="300">

    <a class="btn btn-primary pull-left"
        onclick="gotoPrevious(4, 3, 'version-1-course-x-lesson-4-page-21', false, -1)"> Previous </a>
    <a class="btn btn-primary pull-right"
        onclick="gotoNext(4, 3, 'version-1-course-x-lesson-4-page-21', false, -1)"> Next </a>
    </div></div>
</section>

<section id="version-1-course-x-lesson-4-page-22" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 3: Extending the model for father relation </h2>
            <br>
            <h4> Extend your Model for parent rule </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <br>
                <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(4, 3, 'version-1-course-x-lesson-4-page-22', false, -1)"> Previous </a>
                <div class="text-center">
                    <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-4-page-22', 'program3')"> Submit</a>
        
    </div></div>
</section>

        
<!-- onlineSPARC -->
<!-- skipped 23,24,25 pages -->
	<%@ include file = "footer.jsp" %>
   </body>
</html>