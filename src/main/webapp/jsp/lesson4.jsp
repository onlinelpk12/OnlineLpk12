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
	 <link rel="stylesheet" href="../styles/lesson4.css">
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
            <h2>Recall the family</h2>
                    <li> What we know </li>
                        <ul>
                            <li> John is the father of Peter&sbquo;Sarah and Linda </li>
                            <li> Joann is also the mother of Peter&sbquo;Sarah and Linda </li>
                        </ul>
                    <li> Questions </li>
                        <ul>
                            <li> Is John the father of Peter? </li>
                            <li> Who is Peter&rsquo;s father? </li>
                            <li> Who is Peter&rsquo;s dad? </li>
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
            <h2>Knowledge on &ldquo;Dad&rdquo;</h2>
                <li>Question: Who is the dad of Peter?</li> 
                <ul>    
                <input id="fBox" type="text" class="form-control" required>
					<div id="cAnswer"></div>
				</ul>  
                
            	<li>Knowledge</li> 
            	<ul>
		            <li> We manually added all facts about dad although we have all information about the father relation already in the model.</li>
		            <li>Can we reuse the information about father in our abstraction?</li> 
		            <li>As human beings&sbquo;once we know the father relation&sbquo;we know the dad relation because we have the knowledge:</li>   
             	</ul>
		            <li>A person is the dad of another person if he is the father of the other.</li>
		        <br>
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
                <!-- <img src="../images/Lesson4image2.png" alt="Image" width="500" height="300"> -->
                <h2>Knowledge on &ldquo;Dad&rdquo;: Using Variables</h2>
                <ul>
                	<li>&ldquo;A person is the dad of another person if he is the father of the other.&rdquo;</li>
                	<li>&lsquo;A person&rsquo;, &lsquo;another person&rsquo;, &lsquo;he&rsquo;, &lsquo;the other: a bit uneasy.</li>
                	<li>We would like to use variables to replace that information such as &ldquo;A person&rdquo; and &ldquo;another one&rdquo;: X for &lsquo;a person&rsquo;, and Y for another one. Then &ldquo;he&rdquo; is X, and &ldquo;the other&rdquo; is Y.</li>
                	<li>The knowledge becomes: &ldquo;For every X and Y, X is the dad of Y if X is the father of Y.&rdquo;</li>
                </ul>
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
                <!-- <img src="../images/Lesson4image3.png" alt="Image" width="500" height="200"> -->
                <h2>Abstraction with Variables</h2>
                <li>A variable is used to refer to something.</li>
                <ul>
                	<li>Sometimes, you use it to refer something you don&lsquo;t know but you want to know. E.g., the variables we used earlier.</li>
                	<li>Sometimes, you just use it to refer to something more general than a specific object, e.g., &ldquo;a person&rdquo; or &ldquo;another person&rdquo;</li>
                </ul>
                <li>There are many ways to name a variable. In SPARC, a variable is a name starting with a capital letter. (This is called the syntax of how to write a variable in SPARC.)</li>
               
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
                <h4>Extend your model for &ldquo;parent&rdquo; rule</h4>
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
            <ul>     
               <li>Knowledge For every X and Y, X is the dad of Y if X is the father of Y.</li>
               <li>To represent the knowledge, we identify objects or variables and relations in the sentence</li>
               </ul>
             <li>Write the query between dad and father relation?</li>
              <input id="yBox" type="text" class="form-control" required>
					<div id="zAnswer"></div>

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
                <h4>Extend your model for dad rule</h4>
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
                <h2>Learning outcome 2: Extending the model for dad relation</h2>
                <li>We add for all to each variable in the rule, and read each relation according to its intended meaning.</li>
               
                <li>For example, dad(X, Y) :- father(X, Y).</li>
                <ul>       
            	<li>it is read as For all X and Y, X is the dad of Y if X is the father of Y.</li> 
            	</ul>
            	<li>How to read: father(X, Y) :- dad(X, Y).?</li>
            	<li>Assume inLubbock(X) means person X is in Lubbock and inTexas(X) means person X is in Texas. How to read</li>
            	<ul>
		            <li>inTexas(X) :- inLubbock(X).?</li>
		            <li>inLubbock(X) :- inTexas(X).?</li>  
             	</ul>
             	<li>Do the two rules mean the same?</li>  
             	 <input id="iBox" type="text" class="form-control" required>
					<div id="uAnswer"></div>
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
        <h2>Learning outcome 3: Extending the model for father relation</h2>
         
                <li>We add for all to each variable in the rule, and read each relation according to its intended meaning.</li>
                
                <li>For example, dad(X, Y) :- father(X, Y).</li>
                <ul>       
            		<li>it is read as For all X and Y, X is the dad of Y if X is the father of Y.</li> 
            	</ul>
            	<li>How to read: father(X, Y) :- dad(X, Y).?</li>
            	<li>Assume inLubbock(X) means person X is in Lubbock and inTexas(X) means person X is in Texas.</li>
             	Write  the rule for the above situation?
             	<div id="mothername" class="form-group">
					  <input id="exBox" type="text" class="form-control" required></div>
					<div id="exAnswer"></div>
        
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(4, 3, 'version-1-course-x-lesson-4-page-20', false, -1)"> Previous </a>
        <a class="btn btn-primary pull-right"
            onclick="gotoNext(4, 3, 'version-1-course-x-lesson-4-page-20', false, -1)"> Next </a>
    </div>
    </div>
</section>

	<section id="version-1-course-x-lesson-4-page-21" class="container"
		hidden>
		<div class="row">
			<div class="col-md-6 content" style="margin-left: 20rem">
				<h2>Learning outcome 3: Extending the model for father relation
				</h2>
				<!-- <img src="../images/Lesson4image5.png" alt="Image" width="500" height="300"> -->
				<li>We add for all to each variable in the rule, and read each
					relation according to its intended meaning.</li>

				<li>For example, dad(X, Y) :- father(X, Y).</li>
				<ul>
					<li>it is read as For all X and Y, X is the dad of Y if X is
						the father of Y.</li>
				</ul>
				<li>How to read: father(X, Y) :- dad(X, Y).?</li>
				<li>Assume inLubbock(X) means person X is in Lubbock and inTexas(X) means person X is in Texas. How to read </li>
				<ul>
					<li>inTexas(X) :- inLubbock(X).?</li>
					<li>inLubbock(X) :- inTexas(X).?</li>
					<li>Do the two rules mean the same?</li>
						
					<input type="radio" name="yes_no" checked>Yes</input>						
					<input type="radio" name="yes_no">No</input>
				</ul>
				<a
					class="btn btn-primary pull-left"
					onclick="gotoPrevious(4, 3, 'version-1-course-x-lesson-4-page-21', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(4, 3, 'version-1-course-x-lesson-4-page-21', false, -1)">
					Next </a>
			</div>
		</div>
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
                <textarea id="program3" name="program3" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
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
<script src="../js/lesson4/validations.js" type="text/javascript">  </script>
   </body>

</html>