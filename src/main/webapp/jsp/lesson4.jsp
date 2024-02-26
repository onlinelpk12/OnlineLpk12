<html lang="en">

<head>
    <title>Lesson 4</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	 <link rel="stylesheet" href="../styles/lesson4.css">


<style>
       body
    	{
            font-family: Arial, sans-serif;
            font-size: 14px;
            overflow-x:hidden;
        }
 
        .container {
           
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.6);
            max-width: 600px;
        }
 
        h2 
        {
            margin-bottom: 20px;
            text-align: center;
            color: #0056b3;
        }
 
        ul 
        {
            margin-bottom: 30px;
        }
        
        section 
        {
	        margin-top:0!important;
	        margin-left:0!important;
	        min-height:100vh;
        }
 
        button.btn 
        {
            width: 100px;
        }
         .row
          {
			    border-radius: 10px; /* Rounded corners */
			    
			   
			   .lesson-list 
			   {
			    	padding-left: 0; /* Remove default left padding */
			   }
			 
			.lesson-list .sub-points 
			{
			    padding-left: 20px; /* Add some padding to the sub-points for hierarchy */
	        }
   
          }
</style>
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
	<%@ include file = "header1.jsp" %>
    <section id="version-1-course-x-lesson-4-page-1" hidden>
        <div class="row">
            <div class="container">
            <h1 style="text-align:center">  Lesson 4:  Modeling Dad using Variables and Rules</h1> <br>
            <div class="d-flex pull-right">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-1', false, -1)">Next</button>
        	</div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-4-page-2" hidden>
        <div class="row">
            <div class="container">
            <h2 class="text-primary" style="text-align:center;">Recall the family</h2>
            <ul class="lesson-list">
                    <li class="main-point"><strong> What we know </strong></li>
                        <ul class="sub-points">
                            <li> John is the father of Peter&sbquo;Sarah and Linda </li>
                            <li> Joann is also the mother of Peter&sbquo;Sarah and Linda </li>
                        </ul>
                    <li class="main-point"> <strong>Questions</strong> </li>
                        <ul class="sub-points">
                            <li> Is John the father of Peter? </li>
                            <li> Who is Peter&rsquo;s father? </li>
                            <li> Who is Peter&rsquo;s dad? </li>
                            <li> Who is the mother of Peter? </li>
                        </ul>
             </ul>
                <div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-2', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-2', false, -1)">Next</button>
    			</div>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-4-page-3" hidden>
        <div class="row">
            <div class="container">   
            <h2 class="text-primary" style="text-align:center;">Knowledge on &ldquo;Dad&rdquo;</h2>
            <ul class="lesson-list">
                <li class="main-point"><strong>Who is the dad of Peter?</strong></li> 
               <div style="margin:0px 0px 0px 20px">
                <input id="fBox" type="text" class="form-control" placeholder="Press enter to review the answer" required>
					<div id="cAnswer"></div>
				</div>
			
                
            	<li class="main-point"><strong>Knowledge</strong></li> 
            	<ul class="sub-points">
		            <li> We manually added all facts about dad although we have all information about the father relation already in the model.</li>
		            <li>Can we reuse the information about father in our abstraction?</li> 
		            <li>As human beings&sbquo;once we know the father relation&sbquo;we know the dad relation because we have the knowledge:</li>   
             	</ul>
		            <li class="main-point">A person is the dad of another person if he is the father of the other.</li>
		            </ul>
		        <br>
		         <div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-3', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" id="nextButton" style="background-color:#1b84f5" onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-3', true, 1)" disabled>Next</button>
    			</div>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-4-page-4" hidden>
        <div class="row">
            <div class="container">
                <!-- <img src="../images/Lesson4image2.png" alt="Image" width="500" height="300"> -->
                <h2 class="text-primary" style="text-align:center;">Knowledge on &ldquo;Dad&rdquo;: Using Variables</h2>
                <ul class="sub-points">
                	<li class="main-point">&ldquo;A person is the dad of another person if he is the father of the other.&rdquo;</li>
                	<li class="main-point">&lsquo;A person&rsquo;, &lsquo;another person&rsquo;, &lsquo;he&rsquo;, &lsquo;the other: a bit uneasy.</li>
                	<li class="main-point">We would like to use variables to replace that information such as &lsquo;A person&rsquo; and &lsquo;another one&rsquo;: X for &lsquo;A person&rsquo;, and Y for &lsquo;another one&rsquo;. Then &lsquo;he&rsquo; is X, and &lsquo;the other&rsquo; is Y.</li>
                	<li class="main-point">The knowledge becomes: &ldquo;For every X and Y, X is the dad of Y if X is the father of Y.&rdquo;</li>
                </ul>
                <br>
                <div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-4', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-4', true, 1)">Next</button>
    			</div>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-4-page-5" hidden>
        <div class="row">
            <div class="container">
                <!-- <img src="../images/Lesson4image3.png" alt="Image" width="500" height="200"> -->
                <h2 class="text-primary" style="text-align:center;">Abstraction with Variables</h2>
                <ul class="lesson-list">
                <li class="main-point">A variable is used to refer to something.</li>
                <ul class="sub-points">
                	<li>Sometimes, you use it to refer something you don&lsquo;t know but you want to know. E.g., the variables we used earlier.</li>
                	<li>Sometimes, you just use it to refer to something more general than a specific object, e.g., &lsquo;a person&rsquo; or &lsquo;another person&rsquo;</li>
                </ul>
                <li class="main-point">There are many ways to name a variable. In SPARC, a variable is a name starting with a capital letter. (This is called the syntax of how to write a variable in SPARC.)</li>
                </ul>
               
                <br>
                
                <div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoPrevious(4, 0, 'version-1-course-x-lesson-4-page-5', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoNext(4, 0, 'version-1-course-x-lesson-4-page-5', true, 1)">Next</button>
    			</div>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-4-page-6" hidden>
        <div class="row">
            <div class="container">
                <h4 class="text-primary" style="text-align:center;">Extend your model for &ldquo;parent&rdquo; rule</h4>
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
    <section id="version-1-course-x-lesson-4-page-10" hidden>
        <div class="row">
            <div class="container">
            <h2 class="text-primary" style="text-align:center;"> Learning outcome 1: Extend the Model for parent relation</h2>
			<ul class="lesson-list">
			     <li class="main-point">Knowledge For every X and Y, X is the dad of Y if X is the father of Y.</li>
			     <li class="main-point">To represent the knowledge, we identify objects or variables and relations in the sentence</li>
			     <li class="main-point">Write the query between dad and father relation?</li>
             <div>
              <input id="yBox" type="text" class="form-control" required>
					<div id="zAnswer"></div>
			  </div>
			</ul>
                <div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoPrevious(4, 1, 'version-1-course-x-lesson-4-page-10', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" id="yBoxNextButton" disabled style="background-color:#1b84f5" onclick="gotoNext(4, 1, 'version-1-course-x-lesson-4-page-10', false, -1)">Next</button>
    			</div>
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-4-page-11" hidden>
        <div class="row">
            <div class="container" >
                <h2 class="text-primary" style="text-align:center;">Learning outcome 1: Extend the Model for parent relation </h2>
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
    <section id="version-1-course-x-lesson-4-page-15" hidden>
        <div class="row">
            <div class="container">
                <h2 class="text-primary" style="text-align:center;">Learning outcome 2: Extending the model for dad relation</h2>
                
                <ul class="lesson-list">
                <li class="main-point">We add for all to each variable in the rule, and read each relation according to its intended meaning.</li>
                <li class="main-point">For example, dad(X, Y) :- father(X, Y).</li>
                <ul>       
            		<li class="main-point">it is read as For all X and Y, X is the dad of Y if X is the father of Y.</li> 
            	</ul>
            	<li class="main-point">How to read: father(X, Y) :- dad(X, Y).?</li>
            	<li class="main-point">Assume inLubbock(X) means person X is in Lubbock and inTexas(X) means person X is in Texas. How to read</li>
            	<ul class="sub-points">
		            <li>inTexas(X) :- inLubbock(X).?</li>
		            <li>inLubbock(X) :- inTexas(X).?</li>  
             	</ul>
             	<li>Do the two rules mean the same?</li>  
             	 <input id="iBox" type="text" class="form-control" required>
				 <div id="uAnswer"></div>
				</ul>
				
				<div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoPrevious(4, 2, 'version-1-course-x-lesson-4-page-15', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" disabled id="iBoxNextButton" style="background-color:#1b84f5" onclick="gotoNext(4, 2, 'version-1-course-x-lesson-4-page-15', false, -1)">Next</button>
    			</div>
            </div>
        </div>
    </section>
                
    <section id="version-1-course-x-lesson-4-page-16" hidden>
        <div class="row">
            <div class="container">
            <h2 class="text-primary" style="text-align:center;">Learning outcome 2: Extending the model for dad relation </h2>
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
        <section id="version-1-course-x-lesson-4-page-20" hidden>
            <div class="row">
                <div class="container" >
        <h2 class="text-primary" style="text-align:center;">Learning outcome 3: Extending the model for father relation</h2>
         <ul class="lesson-list">
                <li class="main-point">We add for all to each variable in the rule, and read each relation according to its intended meaning.</li>
                
                <li class="main-point">For example, dad(X, Y) :- father(X, Y).</li>
                <ul class="sub-points">       
            		<li>it is read as For all X and Y, X is the dad of Y if X is the father of Y.</li> 
            	</ul>
            	<li class="main-point">How to read: father(X, Y) :- dad(X, Y).?</li>
            	<li class="main-point">Assume inLubbock(X) means person X is in Lubbock and inTexas(X) means person X is in Texas.</li>
             	Write  the rule for the above situation?
             	<div id="mothername" class="form-group">
					  <input id="exBox" type="text" class="form-control" required></div>
					<div id="exAnswer"></div>
					</ul>
        
        	    <div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary"  style="background-color:#1b84f5" onclick="gotoPrevious(4, 3, 'version-1-course-x-lesson-4-page-20', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" id="exBoxNextButton" style="background-color:#1b84f5" onclick="gotoNext(4, 3, 'version-1-course-x-lesson-4-page-20', false, -1)" disabled>Next</button>
    			</div>
    </div>
    </div>
</section>

	<section id="version-1-course-x-lesson-4-page-21"
		hidden>
		<div class="row">
			<div class="container">
				<h2 class="text-primary" style="text-align:center;">Learning outcome 3: Extending the model for father relation
				</h2>
				<!-- <img src="../images/Lesson4image5.png" alt="Image" width="500" height="300"> -->
				<ul class="lesson-list">
				<li class="main-point">We add for all to each variable in the rule, and read each
					relation according to its intended meaning.</li>

				<li class="main-point">For example, dad(X, Y) :- father(X, Y).</li>
				<ul class="sub-points">
					<li>it is read as For all X and Y, X is the dad of Y if X is
						the father of Y.</li>
				</ul>
				<li class="main-point">How to read: father(X, Y) :- dad(X, Y).?</li>
				<li class="main-point">Assume inLubbock(X) means person X is in Lubbock and inTexas(X) means person X is in Texas. How to read </li>
				<ul class="sub-points">
					<li>inTexas(X) :- inLubbock(X).?</li>
					<li>inLubbock(X) :- inTexas(X).?</li>
					<li>Do the two rules mean the same?</li>
						
					<input type="radio" name="yes_no" checked>Yes</input>						
					<input type="radio" name="yes_no">No</input>
				</ul>
				</ul>
				<br>
				
				<div class="d-flex justify-content-between">
        			<button class="btn btn-lg btn-primary"  style="background-color:#1b84f5" onclick="gotoPrevious(4, 3, 'version-1-course-x-lesson-4-page-21', false, -1)">Previous</button>
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" onclick="gotoNext(4, 3, 'version-1-course-x-lesson-4-page-21', false, -1)" disabled>Next</button>
    			</div>
    			
			</div>
		</div>
	</section>

	<section id="version-1-course-x-lesson-4-page-22" hidden>
    <div class="row">
        <div class="container">
            <h2 class="text-primary" style="text-align:center;">Learning outcome 3: Extending the model for father relation </h2>
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
<%@ include file = "footer1.jsp" %>
<script src="../js/lesson4/validations.js" type="text/javascript">  </script>
   </body>

</html>
