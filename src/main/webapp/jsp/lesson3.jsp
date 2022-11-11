<html lang="en">

<head>
    <title>Lesson 3</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	 <script src="../js/verifytoken.js" type="text/javascript">  </script>
	 <link rel="stylesheet" href="../styles/lesson3.css">
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(3);
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
    <section id="version-1-course-x-lesson-3-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 3: Variables and Queries </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(3, 0, 'version-1-course-x-lesson-3-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-3-page-2" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2> Recall the family </h2>
                <ul>
                    <li> What we know </li>
                        <ul>
                            <li> John is the father of Peter </li>
                            <li> John is also the father of Sara and Linda </li>
                        </ul>
                    <li> Questions </li>
                        <ul>
                            <li> Is John the father of Peter? </li>
                            <li> Who is Peter's father? </li>
                            <li> Who is Peter's dad? </li>
                            <li> Who is the mother of Peter? </li>
                        </ul>
                </ul>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(3, 0, 'version-1-course-x-lesson-3-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(3, 0, 'version-1-course-x-lesson-3-page-2', false, -1)"> Next 
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-3-page-3" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2> What-questions</h2>
                       <ul>
                        <li> Who is the father of Peter? </li>
                      <div id="fathername" class="form-group">
					  <input id="iBox" type="text" class="form-control" required>
					</div>
					<div id="uAnswer"></div>
                        <li> Who is Peter's mother? </li>
                        <div id="mothername" class="form-group">
					  <input id="exBox" type="text" class="form-control" required>
					  </div>
					<div id="exAnswer"></div>
                    </ul>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(3, 0, 'version-1-course-x-lesson-3-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(3, 0, 'version-1-course-x-lesson-3-page-3', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-3-page-4" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <!-- <img src="../images/Lesson3image1.png" alt="Image" width="500" height="300"> -->
                <h2>Variables and Queries</h2>
                <li>(English) <b>Who</b> is the father of Peter?</li>
                <ul>
                	<li>We don&rsquo;t know the father of Peter, and we want to know it, so we introduce variable X to represent Peter&rsquo;s father.</li>
                	<li>The <b>query to our model for that question is</b><br>
                		father(<FONT COLOR="#ff0000">X</FONT>, peter)?<br>
                		means what is the value of X such that X is the father of Peter?
                	</li>
                	<li>In this case, the <b>answer from our model</b> will be of the form <FONT COLOR="#ff0000">X</FONT> = john.</li>                	
                </ul>
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(3, 0, 'version-1-course-x-lesson-3-page-4', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(3, 0, 'version-1-course-x-lesson-3-page-4', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-3-page-5" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <!-- <img src="../images/Lesson3image2.png" alt="Image" width="500" height="300"> -->
                <h2>Variables and Queries</h2>
                <li>(English) <b>Who</b> is the father of Peter?</li>
                <li><b>Query to our model</b></li>
                <ul>
                	<li>
                		Alternatively, we can use a better name for the variable Who.Then our query becomes have<br>
                		father(<FONT COLOR="#ff0000">W</FONT>ho, peter)?
                	</li>
                	<li>The answer will be <FONT COLOR="#ff0000">Who</FONT> = john.</li>
                	<li>Note: the name for a variable must start with a capital letter!</li>
                </ul>
               
                <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(3, 0, 'version-1-course-x-lesson-3-page-5', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(3, 0, 'version-1-course-x-lesson-3-page-5', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-3-page-6" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h4>Extent your model for "who is the mother of Peter?"</h4>
                <br>
                <form action="">
                    <label for="ques1"> Representing knowledge as comment and fact  </label><br />
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(3, 0, 'version-1-course-x-lesson-3-page-6', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-3-page-6', 'program0')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- page-7 status page -->
    <!-- page-8 Online SPARC -->

    <!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-3-page-9" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2> Learning outcome 1: Extend the Model for father relation</h2>
            <li>Who is the father of peter?</li>   
            <ul>                         
            	<li>We don&rsquo;t know the father of Peter&sbquo; and we want to know it&sbquo; so we introduce variable X to represent Peter&rsquo;s father.</li> 
            </ul>
            <li>The query to our model for that question is</li>
            	<ul>		            
		            <li>father(X&sbquo; peter)? </li> 
		            <li>means what is the value of X such that X is the father of Peter?</li>   
             	</ul>
             	<li>In this case&sbquo; the answer from our model will be of the form X = john</li>
             	 	<li>Write the query for the father relation of peter?</li>
             	 	<div id="knowledgeAssignment" class="form-group">
					  <input id="yBox" type="text" class="form-control" required>
					</div>
					<div id="zAnswer"></div>			

            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(3, 1, 'version-1-course-x-lesson-3-page-9', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(3, 1, 'version-1-course-x-lesson-3-page-9', false, -1)"> Next </a>
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-3-page-10" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Learning outcome 1: Extending the model for Father relation </h2>
                <br>
                <h4>Extent your model for "who is the father of Peter?"</h4>
                <br>
                <form action="">
                    <label for="ques1"> Representing knowledge as comment and fact  </label><br />
                    <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(3, 1, 'version-1-course-x-lesson-3-page-10', false, -1)"> Previous </a>
                <div class="text-center">
                <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-3-page-10', 'program1')"> Submit</a>
            </div>
           
            </form>
          </div>
        </div>  
    </section>
    <!-- page-11 status page -->
    <!-- page-12 onlineSPARC -->

    <!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-3-page-13" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Learning outcome 2: Extending the model for father relation</h2>
            <li>Whom is John the father of?</li> 
            <ul>                      
            	</ul>
            	<li>We introduce a variable (X or Whom or AKidOfJohn ...) for &ldquo;Whom&rdquo;in the question and then write query with this variable:</li> 
            	<ul>
		            <li>(query) father(john&sbquo; X)? or</li>
		            <li>(query) father(john&sbquo; Whom)? or</li> 
		            <li>(query) father(john&sbquo; AKidOfJohn)?</li>   
             	</ul>
		            <li>Note: no space is allowed in the name AKidOfJohn</li>
		            <li>Note the order of the parameters</li>
             	 	Write the relation between john and AKidOfJohn?
             	 	 <div id="motherrelation" class="form-group">
					<input id="fBox" type="text" class="form-control" required></div>
					<div id="cAnswer"></div>

                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(3, 2, 'version-1-course-x-lesson-3-page-13', false, -1)"> Previous </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(3, 2, 'version-1-course-x-lesson-3-page-13', false, -1)"> Next </a>
            </div>
        </div>
    </section>
                
    <section id="version-1-course-x-lesson-3-page-14" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 2: Extending the model for father relation </h2>
            <br>
            <h4> Extend your Model for "Whom is John the father of?" </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <br>
                <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(3, 2, 'version-1-course-x-lesson-3-page-14', false, -1)"> Previous </a>
                <div class="text-center">
                    <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-3-page-14', 'program2')"> Submit</a>
                </div>
            </form>
            <br>
            
            </div>
        </div>
    </section>
    
    <!-- page-15 status page -->
    <!-- page-16 onlineSPARC -->

    <!-- learning outcome 3 -->
	<section id="version-1-course-x-lesson-3-page-17" class="container"
		hidden>
		<div class="row">
			<div class="col-md-6 content" style="margin-left: 20rem">
				<h2>Learning outcome 3: Extending the model for Dad relation</h2>
				<li>Who is the dad of peter?</li>
				<ul>
					<li>Assume we have a relation dad(p1,p2) where p1 is the dad
						person of p2 variable</li>
				</ul>
				<li>Who is the dad of peter?</li> <input id="gBox" type="text"
					class="form-control" required>
				<div id="nAnswer"></div>
				<a class="btn btn-primary pull-left"
					onclick="gotoPrevious(3, 3, 'version-1-course-x-lesson-3-page-17', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(3, 3, 'version-1-course-x-lesson-3-page-17', false, -1)">
					Next </a>
			</div>
		</div>
	</section>

	<section id="version-1-course-x-lesson-3-page-18" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 3: Extending the model for Dad relation </h2>
            <br>
            <h4> Extend your Model for "Who is the Dad of Peter?" </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program3" name="program3" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <br>
                <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(3, 3, 'version-1-course-x-lesson-3-page-18', false, -1)"> Previous </a>
                <div class="text-center">
                    <a class="btn btn-primary"  style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-3-page-18', 'program3')"> Submit</a>
        
    </div>
</section>

    <!-- page-19 status page -->
    <!-- page-20 onlineSPARC -->

<%@ include file = "footer.jsp" %>
<script src="../js/lesson3/validations.js" type="text/javascript">  </script>
   </body>

</html>