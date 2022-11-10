<html lang="en">

<head>
    <title>Lesson 2</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	 <script src="../js/verifytoken.js" type="text/javascript">  </script>
	 <link rel="stylesheet" href="../styles/lesson2.css">
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(2);
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
    <section id="version-1-course-x-lesson-2-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 2: Extend the family model </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-2-page-2" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h1 class="text-primary"> Recall the family </h1>
                <ul>
                    <li> What we know </li>
                    <ul>
                        <li> John is the father of Peter </li>
                        <li> John is also the father of Sara and Linda </li>
                    </ul>
                </ul>
                <ul>
                    <li> Questions </li>
                    <ul>
                        <li> Old ones </li>
                        <ul>
                            <li> Is John the father of Peter? </li>
                            <li> Is John a parent of Peter? </li>
                            <li> Who is Peter's father? </li>
                            <li> Who is Peter's dad? </li>
                            <li> Is Joaan the mother of Peter? </li>
                            <li> Who is Peter's mother? </li>
                            <li> Who is Peter's mom? </li>
                            <li> Is Joaan a parent of Peter? </li>
                        </ul>
                    </ul>
                </ul>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-2', false, -1)"> Next 
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-2-page-3" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h1 class="text-primary"> Extend Our Model for Parent of Peter -- 1  </h1>
                <ul>
                    <li> Extend your model: </li>
                    <ul>
                        <li> Assume the relation you will use is</li>
                        <li> parent(P1, P2)means that person P1 is the parent of person P2.</li>
                    </ul>
                </ul>
                <li>Write your knowledge as a comment </li>
               		<div id="knowledgeAssignment" class="form-group">
					  <input id="iBox" type="text" class="form-control" required>
					</div>
					<div id="uAnswer"></div>
               		<li>Represent your knowledge as a fact </li>
               		<div id="ruleAssignment" class="form-group">
					  <input id="exBox" type="text" class="form-control" required></div>
					<div id="exAnswer"></div>		  
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-3', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-2-page-4" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <img src="../images/Newimage1.png" alt="Image" width="300" height="200">
                <img src="../images/Newimage2.png" alt="Image" width="400" height="100">
                
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-4', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-4', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-2-page-5" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h4> click the link <a target="_blank" href="https://docs.google.com/document/d/1T89hafM54WKt9gKXFbMG3uXjo4CVq-lGQSdHuSypb88/edit"> SL2-newfamily-working </a></h4>
                <h4> Select all text there and press Ctrl+c </h4>
                <h4> Go back to the onlineSPARC, click anywhere in the editor and press key Ctrl+v to paste the family model to the editor </h4>
               
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-5', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-5', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-2-page-6" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Extent your model for the relation of mom</h2>
                <form action="">
                    <label for="ques1"> Representing knowledge as comment and fact  </label><br />
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-6', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-2-page-6', 'program0')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Online SPARC -->
    <!-- skipped 7,8,9 pages -->


    <!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-2-page-10" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2> Learning outcome 1: Extend the Model for Parent relation</h2>
            <img src="../images/image1.png" alt="Image" width="500" height="400">

            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 1, 'version-1-course-x-lesson-2-page-10', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(2, 1, 'version-1-course-x-lesson-2-page-10', false, -1)"> Next </a>
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-2-page-11" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h3> Extend Family Model for Parent of Peter:</h3>
            <br>
            <h4> Extend your model by the following </h4>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 1, 'version-1-course-x-lesson-2-page-11', false, -1)"> Previous </a>
                <div class="text-center">
                <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-2-page-11', 'program1')"> Submit</a>
            </div>
           
            </form>
          </div>
        </div>  
    </section>
    <!-- onlineSPARC -->
    <!-- skipped 12,13,14 pages -->


    <!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-2-page-15" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Learning outcome 2: Extending the model for Dad relation </h2>
                <ul>
                    <li> Questions: we want your model to answer queries using dad and mom directly. E.g., is John the
                        dad of Peter? </li>
                    <li> Extend your model: </li>
                    <ul>
                        <li> Write knowledge about "Dad" relation for the kids </li>
                        <li> Represent the knowledge into facts </li>
                    </ul>
                </ul>
                <li>Write the dad relation between John and Peter?</li>
               		<div id="knowledgeAssignment" class="form-group">
					  <input id="yBox" type="text" class="form-control" required>
					</div>
					<div id="zAnswer"></div>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 2, 'version-1-course-x-lesson-2-page-15', false, -1)"> Previous </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 2, 'version-1-course-x-lesson-2-page-15', false, -1)"> Next </a>
            </div>
        </div>
    </section>
                
    <section id="version-1-course-x-lesson-2-page-16" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 2: Extending the model for Dad relation </h2>
            <br>
            <h4> Extend your Model for dad of peter: </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <br>
                <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 2, 'version-1-course-x-lesson-2-page-16', false, -1)"> Previous </a>
                <div class="text-center">
                    <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-2-page-16', 'program2')"> Submit</a>
                </div>
            </form>
            <br>
            
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->
    <!-- skipped 17,18,19 pages -->


    <!-- learning outcome 3 -->
        <section id="version-1-course-x-lesson-2-page-20" class="container" hidden>
            <div class="row">
                <div class="col-md-6 content" style="margin-left:20rem">
        <h2>Learning outcome 3: Extending the model for new family </h2>
        <ul>
            <li> What we know </li>
            <ul>
                <li> John is the father of Peter </li>
                <li> Joaan is the mother of Peter </li>
            </ul>
        </ul>
        <ul>
            <li> Questions </li>
            <ul>
                <li> Old ones </li>
                <ul>
                    <li> Is John the father of Peter? </li>
                    <li> Who is Peter's father? </li>
                    <li> Who is Peter's dad? </li>
                    <li> Is John a parent of Peter? </li>
                </ul>
            </ul>
        </ul>
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-20', false, -1)"> Previous </a>
         <a class="btn btn-primary pull-right"
            onclick="gotoNext(2, 3, 'version-1-course-x-lesson-2-page-20', false, -1)"> Next </a>
    </div></div>
</section>

<section id="version-1-course-x-lesson-2-page-21" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 3: Extending the model for new family </h2>
        <ul>
            <li> Assume we have the following relations </li>
            <ul>
                <li> mother(X, Y)means person X is the mother of Y </li>
                <li> mom(X, Y)means person X is the mom of Y </li> 
            </ul>
        </ul>
        <li>Write the Mom relation between joaan and Peter?</li>
        <div id="motherrelation" class="form-group">
					  <input id="fBox" type="text" class="form-control" required></div>
					<div id="cAnswer"></div>
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-21', false, -1)"> Previous </a>
        <a class="btn btn-primary pull-right"
            onclick="gotoNext(2, 3, 'version-1-course-x-lesson-2-page-21', false, -1)"> Next </a>
    </div></div>
</section>

<section id="version-1-course-x-lesson-2-page-22" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
        <h3> Extend Family Model for mother relation: </h3>
        <br>
        <h4> Extend your Model for the relation of mother: </h4>
        <br>
        <form action="">
            <label for="ques1"> Representing knowledge as comment and fact </label>
            <textarea id="program3" name="program3" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
            <br>
            <br>
            <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-22', false, -1)"> Previous </a>
            <div class="text-center">
                <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-2-page-22', 'program3')"> Submit</a>
            </div>
        </form>
        <br>
        
    </div></div>
</section>
<!-- onlineSPARC -->
<!-- skipped 23,24,25 pages -->
<%@ include file = "footer.jsp" %>
 <%@ include file = "footer.jsp" %>
<script src="../js/lesson2/validations.js" type="text/javascript">  </script>
   </body>

</html>