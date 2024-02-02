<html lang="en">

<head>
    <title>Lesson 5</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	
	 <link rel="stylesheet" href="../styles/lesson5.css">

    <link rel="stylesheet" href="../styles/style.css">
    <script src="../js/lessonDataStructureJSON.js"></script>
    <script src="../js/script.js"></script>   
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
	<%@ include file = "header1.jsp" %>
    <section id="version-1-course-x-lesson-5-page-1" hidden>
        <div class="row">
            <div class="container">
            <h1 style="text-align:center">  Lesson 5: Model periodic table - chemical symbols </h1> <br>
            <div class="d-flex pull-right">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(5, 0, 'version-1-course-x-lesson-5-page-1', false, -1)">Next</button>
        	</div>
            
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-5-page-2" hidden>
        <div class="row">
            <div class="container">
                <h1 class="text-primary"> Periodic Table </h1>
                <ul class="lesson-list">
                    <li class="main-point"><strong>What is the periodic table for?</strong> </li>
                    <p> a periodic table tells us important information of an element (i.e., chemical symbol, mass number, atomic number)  and helps up to predicate 
	properties of elements. </p>
					<li class="main-point">We will develop computer model for the basic information of a periodic table. 
					</li>
                </ul>
                <br>
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
					onclick="gotoPrevious(5, 0, 'version-1-course-x-lesson-5-page-2', false, -1)">Previous</button>
					<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
					onclick="gotoNext(5, 0, 'version-1-course-x-lesson-5-page-2', false, -1)">Next</button>
				</div> 
 
            </div>
        </div>
    </section>
	
	 <!-- Lesson 5 assement 0 - program 0 -->
	<section id="version-1-course-x-lesson-5-page-3" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            	<h3><b>Activity : Extend and Test Model as You Like</b></h3>
                <ul>
                		<li>Extend model: add knowledge to model about element(s) of your choice. The element has to be one of the first 20 in the periodic table.</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">Test your model: ask a query about Element.</label><br/>
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input" placeholder="//Type your comment first &#10; //Type the fact about this knowledge"></textarea>
                    <br><br>
                    <br>
                    <div id="outer">
	                    <a class="btn btn-primary pull-left"
	                    onclick="gotoPrevious(5, 0, 'version-1-course-x-lesson-5-page-3', false, -1)"> Previous </a>
	                    <div class="text-center">
	                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-5-page-3', 'program0')"> Submit </a>
	                    </div>
	                     <a class="btn btn-primary pull-right"  style="margin: -35px; margin-right: 76px; background-color: lightcoral;"
	                    onclick="gotoNext(5, 0, 'version-1-course-x-lesson-5-page-3', false, -1)">Skip Pre-Assessment</a>
                    </div>
                </form>
            </div>
        </div>
    </section>    

    <!-- Online SPARC -->
    <!-- skipped 4,5 pages -->

    <!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-5-page-6" hidden>
        <div class="row">
            <div class="container">
            <h2> Learning outcome 1</h2>
            <img src="../images/lesson5/HydrogenSlide.png" alt="Image" width="500" height="300">
			<div class="d-flex justify-content-between">
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoPrevious(5, 1, 'version-1-course-x-lesson-5-page-6', false, -1)">Previous</button>
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoNext(5, 1, 'version-1-course-x-lesson-5-page-6', false, -1)">Next</button>
			</div> 
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-5-page-7" hidden>
        <div class="row">
            <div class="container" >
               <h4 style="text-align:center;color: #0056b3;"><b>Computer Model for Chemical symbols</b></h4>
               <ol class="lesson-list">
               		<li>Assume symbolFor(E, S)means that the chemical symbol for element E is S.  
               		</li>
               		<li>For your computer model to answer the earlier question, how would you expand your model 
               		</li>
               </ol>
               
               <ul class="lesson-list">
               		<li class="main-point">Type the knowledge as comments 
               		</li>
               		
               		<div id="hydrogenAssessment" class="form-group">
					  <input id="knowledgeComment" type="text" class="form-control" required>
					</div>
					<div id="correctAnswerComment"></div>
               		<li class="main-point">Type the fact/rule to represent that knowledge 
               		</li>
               		<div id="factAssessmentHydrogen" class="form-group">
					  <input id="fact" type="text" class="form-control" required>
					</div>
					<div id="correctAnswerFact"></div>
               </ul>
                
                <br>
             <div class="d-flex justify-content-between">
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoPrevious(5, 1, 'version-1-course-x-lesson-5-page-7', false, -1)">Previous</button>
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" id="kNextBtn"
				onclick="gotoNext(5, 1, 'version-1-course-x-lesson-5-page-7', false, -1)" disabled>Next</button>
			</div> 
			
            </div>
        </div>
    </section>
	
	<!-- Lesson 5 assement 1 - program 1 -->
	<!-- <section id="version-1-course-x-lesson-5-page-8" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h3><b>Activity : Extend Periodic Table Model - hydrogen</b></h3>
                <ul>
                		<li>Add to the model the knowledge: The chemical symbol for hydrogen is H.</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">Test your model: ask a query about Hydrogen. </label><br/>
                    <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input" placeholder="//Type your comment first &#10; //Type the fact about this knowledge"></textarea>
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
    </section> -->
    <!-- onlineSPARC -->
    <!-- skipped 9,10 pages -->


    <!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-5-page-11" hidden>
        <div class="row">
            <div class="container">
                <h2>Learning outcome 2: A cell in a periodic table - a new element </h2>
                <ul class="lesson-list">
                		<li class="main-point">Question</li>
                		<ul class="sub-points">
                			<li>What is the chemical symbol of Carbon?</li>
                		</ul>
                		<div>
                			<img  class = "carbon" src="../images/lesson5/carbon.png" alt="Image" width="105" height="90">
                		</div>
                </ul>
                <br><br><br><br>
                <br><br>
                <div id="carbonSymbol" class="form-group">
					  <input id="identifySymbolC" type="text" class="form-control" required>
				</div>
               
                <br>
            <div class="d-flex justify-content-between">
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoPrevious(5, 2, 'version-1-course-x-lesson-5-page-11', false, -1)">Previous</button>
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoNext(5, 2, 'version-1-course-x-lesson-5-page-11', false, -1">Next</button>
			</div> 
            </div>
        </div>
    </section>
                
    <!-- Lesson 5 assement 2 - program 2 -->
	<section id="version-1-course-x-lesson-5-page-12" hidden>
        <div class="row">
            <div class="container">
                <h3><b>Activity : Extend and Test Model -- Carbon</b></h3>
                <ul>
                		<li>Extend model: add the knowledge about symbol for Carbon to the model</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>                
                	<form action="">
                    <label for="ques1">Test your model: ask a query about Carbon.</label><br/>
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
    <section id="version-1-course-x-lesson-5-page-15" hidden>
            <div class="row">
            <div class="container">
        	<h2>Learning outcome 3: Continue to expand your model </h2>
            <ul class="lesson-list">
            		<li class="main-point">Question</li>
            		<ul class="sub-points">
            			<li>What is the chemical symbol of Phosphorus?</li>
            		</ul>
            		<div>
            			<img  class = "carbon" src="../images/lesson5/phosphorous.png" alt="Image" width="105" height="120">
            		</div>
            </ul>
            <br><br><br><br>
            <br><br>
            <div id="phosphorousSymbol" class="form-group">
		  		<input id="identifySymbolP" type="text" class="form-control" required>
			</div>
			<div class="d-flex justify-content-between">
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoPrevious(5, 3, 'version-1-course-x-lesson-5-page-15', false, -1)">Previous</button>
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5" id="identifyNextBtn"
				onclick="gotoNext(5, 3, 'version-1-course-x-lesson-5-page-15', false, -1)" disabled>Next</button>
			</div> 
              </div>
          </div>
    </section>
    <!-- learning outcome 3 assigment 3--->

    <section id="version-1-course-x-lesson-5-page-16" hidden>
        <div class="row">
            <div class="container">
                <form action="">
                    <h3><b>Activity : Extend and Test Model -- Phosphorus</b></h3>
                	<ul>
                		<li>Extend model: add the knowledge about symbol for Phosphorus to the model</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>  
                    <label for="ques1">Test your model: ask a query about Phosphorus.</label><br/>
                    <textarea id="program3" name="program3" rows="4" cols="50" class="knowledge-check-input" placeholder="//Type your comment first &#10; //Type the fact about this knowledge"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(5, 3, 'version-1-course-x-lesson-5-page-16', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-5-page-16', 'program3')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    
    </section>
<!-- onlineSPARC pages 17,18,19-->
     <!-- learning outcome 4 -->
    <section id="version-1-course-x-lesson-5-page-20" hidden>
        <div class="row">
            <div class="container">
   <h2>Learning outcome 3: A cell in a periodic table </h2>
            <ul class="lesson-list">
            		<li class="main-point">Can you ask a question similar to our earlier ones?</li> 
            		<div id="elementSymbol" class="form-group">
				  		<input id="elementBox" type="text" class="form-control" required>
					</div>     
					    		
            		<div>
            			<img  id = "randomImageDisplay" class = "element" src="../images/lesson5/elements/17.png" alt="Image" width="105" height="120">
            		</div>
            </ul>
            
            <div>
            	<p>Would you like to try it out for another element 
            		<a href="#" onclick="changeImageRandomly(); return false;"><b><i>click here</i></b></a>
            	</p>
            </div>
            <br>
            <div class="d-flex justify-content-between">
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoPrevious(5, 4, 'version-1-course-x-lesson-5-page-20', false, -1)">Previous</button>
				<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
				onclick="gotoNext(5, 4, 'version-1-course-x-lesson-5-page-20', false, -1)">Next</button>
			</div> 
          </div>
      </div>
</section>
<!-- learning outcome 4 assigment 4--->

<section id="version-1-course-x-lesson-5-page-21" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
            <form action="">
              <h3><b>Activity : Extend and Test Model as You Like</b></h3>
                <ul>
                		<li id="chosenElement">Extend model: add the knowledge about symbol to the model</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <label for="ques1">Test your model: ask a query about Element.</label><br/>
                <textarea id="program4" name="program4" rows="4" cols="50" class="knowledge-check-input" placeholder="//Type your comment first &#10; //Type the fact about this knowledge"></textarea>
                <br><br>
                <br>
                <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(5, 4, 'version-1-course-x-lesson-5-page-21', false, -1)"> Previous </a>
                <div class="text-center">
                    <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-5-page-21', 'program4')"> Submit </a>
                </div>
            </form>
        </div>
    </div>

</section>
<!-- sparc  22,23,24 pages -->
<%@ include file = "footer1.jsp" %>
	<script src="../js/lesson5/validations.js" type="text/javascript">  </script>
	    
	
   </body>

</html>
