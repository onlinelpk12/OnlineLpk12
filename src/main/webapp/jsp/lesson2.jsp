<html lang="en">

<head>
    <title>Lesson 2</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	
	 <link rel="stylesheet" href="../styles/lesson2.css">

    <link rel="stylesheet" href="../styles/style.css">
    <script src="../js/lessonDataStructureJSON.js"></script>
    <script src="../js/script.js"></script>  
    
     
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        /* Applying colors and reducing margins for H1 and H2 */
   
       
   body {
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
 
        h2 {
            
            margin-bottom: 20px;
            text-align: center;
            
            color:#4992e0;
        }
 
        ul {
            margin-bottom: 30px;
        }
        
        section {
        margin-top:0!important;
        margin-left:0!important;
        min-height:100vh;
        }
 
        button.btn {
            width: 100px;
        }
         .row {
    border-radius: 10px; /* Rounded corners */
    
   
   .lesson-list {
    padding-left: 0; /* Remove default left padding */
}

.lesson-list .sub-points {
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
	<%@ include file = "header1.jsp" %>
    <section id="version-1-course-x-lesson-2-page-1" hidden>
        <div class="row">
            <div class="container" >
            <h2 style="text-align:center">  Lesson 2:  </h2> <br>
            <h2 style="text-align:center">  Extend the family model</h2>
            <div class="text-center">
        		<p>Page 1 of 15</p>
    		</div>
            <button class="btn btn-primary btn-lg mx-auto" onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-1', false, -1)" style="display:flex; margin-top:50px;"> <p style="width:100%; text-align:center;margin:0">Next </p> </button>
            </div>
        </div>
    </section>

<section id="version-1-course-x-lesson-2-page-2" hidden>
        <div class="row">
            <div class="container" >
                <h1 class="text-primary" style="text-align:center"> Recall the family </h1>
                <ul>
                    <li> <b>What we know ?</b></li>
                    <ul>
                        <li> John is the father of Peter </li>
                        <li> John is also the father of Sara and Linda </li>
                    </ul>
                </ul>
                <ul>
                    <li> <b>Questions</b> </li>
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
                <div class="text-center">
        			<p>Page 2 of 15</p>
    			</div>
                <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-2', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-2', false, -1)">Next</button>
    			</div>
    			
            </div>
        </div>
    </section>
     <section id="version-1-course-x-lesson-2-page-2.1" hidden>
    <div class="row ">
        <div class="container" >
            <h1 class="text-primary"> Representing Knowledge </h1>
            <ul class="lesson-list">
                <li class="main-point"> <b>Comment:</b>
                    <ul class="sub-points">
                        <li><b>Purpose:</b> To annotate and explain parts of your code without affecting its execution.</li>
                        <li><b>Syntax:</b> % Your description here.</li>
                        <li><b>Example:</b> % John is a parent of Peter.</li>
                    </ul>
                </li>
                <li class="main-point"> <b>Fact:</b>
                    <ul class="sub-points">
                        <li><b>Purpose:</b> To assert a true statement or relationship within the domain of knowledge.</li>
                        <li><b>Syntax:</b> relationship_name(entity1, entity2).</li>
                        <li><b>Example:</b> parent(john, peter).</li>
                    </ul>
                </li>
            </ul>
          		<div class="text-center">
	        		<p>Page 3 of 15</p>
	    		</div>
           		<div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-2.1', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-2.1', false, -1)">Next</button>
    			</div>
    			
        </div>
    </div>
</section>

    <section id="version-1-course-x-lesson-2-page-3" hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-primary"> Extend Our Model for Parent of Peter -- 1</h2>
				    <ul class ="main-point">
				        <li> <b> Extend your model: </b>
				            <ul class="sub-points">
				                <li>Assume the relation you will use is</li>
				                <li>parent(P1, P2) means that person P1 is the parent of person P2.</li>
				            </ul>
				        </li>
				        <li> <b>Write your knowledge as a comment:</b>
				            <div id="knowledgeAssignment" class="form-group">
				                <input id="iBox" type="text" class="form-control" required>
				            </div>
				            <div id="uAnswer"></div>
				        </li>
				        <li> <b>Represent your knowledge as a fact:</b>
				            <div id="ruleAssignment" class="form-group">
				                <input id="exBox" type="text" class="form-control" required>
				            </div>
				            <div id="exAnswer"></div>
				        </li>
				    </ul>			  
                <div class="text-center">
	        		<p>Page 4 of 15</p>
	    		</div>
               	<div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-3', false, -1)">Previous</button>
        			<button class="btn btn-primary"  id="iNextBtn"onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-3', true, 1)" >Next</button>
    			</div> 
    			
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-2-page-4" hidden>
        <div class="row">
            <div class="container" >
                <!--  <img src="../images/Newimage1.png" alt="Image" width="300" height="200">
                <img src="../images/Newimage2.png" alt="Image" width="400" height="100">-->
                  <!-- Instructions for onlineSPARC -->
			    <div class="instructions">
				    <h2 class="text-primary" >Instructions for onlineSPARC:</h2>
				    <ol>
				        <li>Log on to the onlineSPARC platform.</li>
				        <li>Navigate to the top left corner of the interface and click on the "New" button.</li>
				        <li>From the drop-down list, select "New File".</li>
				        <li>In the dialog window for the file name, input your desired file name following the format "newFamily.sp".</li>
				        <li>Click OK in the dialog to confirm your changes.</li>
				    </ol>
				</div>    
                <br>
                <div class="text-center">
	        		<p>Page 5 of 15</p>
	    		</div>
                <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-4', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-4', false, -1)">Next</button>
    			</div> 
    			
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-2-page-5" hidden>
        <div class="row">
            <div class="container" >
                <!--<h4> Click the link <a target="_blank" href="https://docs.google.com/document/d/1T89hafM54WKt9gKXFbMG3uXjo4CVq-lGQSdHuSypb88/edit"> SL2-newfamily-working </a></h4>
                <h4> Select all text there and press Ctrl+c </h4>
                <h4> Go back to the onlineSPARC, click anywhere in the editor and press key Ctrl+v to paste the family model to the editor </h4><-->
                 
				    <ul class="main-point">
	
				            <li>Click the link: <a target="_blank" href="https://docs.google.com/document/d/1T89hafM54WKt9gKXFbMG3uXjo4CVq-lGQSdHuSypb88/edit">SL2-newfamily-working</a>
				        </li>
				        <li>
				          Select all text there and press Ctrl+C.
				        </li>
				        <li>
				            Go back to onlineSPARC, click anywhere in the editor and press Ctrl+V to paste the family model into the editor.
				        </li>
    			</ul>
                <br>
                <div class="text-center">
	        		<p>Page 6 of 15</p>
	    		</div>
                <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-5', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-5', false, -1)">Next</button>
    			</div> 
    			
            </div>
        </div>
    </section>
  
   

    
     <section id="version-1-course-x-lesson-2-page-5.1" hidden>
        <div class="row">
            <div class="container" >
                <h1 class="text-primary"> Logic Programming Basic </h1>
                <ul class="lesson-list">
                <li class="main-point"> <b>Sorts</b> 
                 <ul class="sub-points">
                 		<li><b>What it is:</b> Think of sorts like "labels" or "tags" we put on things.</li>
						<li><b>Example:</b> Person(John).
						               Person(Peter)</li>
                        <li> This means both 'John' and 'Peter' are labeled as persons.</li>
                        
                        
                    </ul>
                    </li>
                    <li class="main-point"> <b>Predicates:</b> 
                 <ul class="sub-points">
                 		<li><b>What it is: </b>Predicates are like stating a fact about someone or something.</li>
                        <li><b>Example:</b> parent(john, peter).</li>
                        <li> Here, we're stating a fact: john is a parent of peter. It's like saying John is Peter's dad.</li>
                       
                    </ul>
                     </li>
                      <li  class="main-point"> <b>Rules:</b> 
                 <ul class="sub-points" >
                 		<li><b> What it is:</b> Rules are like instructions or recipes that tell us new things based on what we already know.</li>
                        <li><b>Example: </b>is_ancestor(X, Y) :- parent(X, Y).</li>
                        <li> The rules here tell us :- If someone is your parent, they are also your ancestor.</li>
                        
                    </ul>
                    </li>
                    
                </ul>
               <div class="text-center">
	        		<p>Page 7 of 15</p>
	    		</div>	
               <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-5.1', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-5.1', true, 1)">Next</button>
    			</div> 
    			 
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-2-page-6" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2 class="text-primary">Extent your model for the relation of mom</h2>
                <form action="">
                    <label for="ques1"> Representing knowledge as comment and fact  </label><br />
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <div class="text-center">
		        		<p>Page 8 of 15</p>
		    		</div>
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
    <section id="version-1-course-x-lesson-2-page-10" hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-primary"> Learning outcome 1: Extend the Model for Parent relation</h2>
            <img src="../images/image1.png" alt="Image" style="display:block; margin:auto"width="350" height="300">
			<div class="text-center">
        		<p>Page 9 of 15</p>
    		</div>
            	<div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 1, 'version-1-course-x-lesson-2-page-10', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 1, 'version-1-course-x-lesson-2-page-10', false, -1)">Next</button>
    			</div> 
    			
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-2-page-11" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h3> Extend Family Model for Parent of Peter:</h3>
            <br>
            <h4> Extend your model by the following </h4>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <div class="text-center">
	        		<p>Page 10 of 15</p>
	    		</div>
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
    <section id="version-1-course-x-lesson-2-page-15" hidden>
        <div class="row">
            <div class="container" >
                <h2 class="text-primary">Learning outcome 2: Extending the model for Dad relation </h2>
                <ul class="lesson-list">
                    <li> <b>Questions:</b> we want your model to answer queries using dad and mom directly. E.g., is John the
                        dad of Peter? </li>
                    <li><b> Extend your model:</b> </li>
                    <ul class="sub-points">
                        <li> Write knowledge about "Dad" relation for the kids </li>
                        <li> Represent the knowledge into facts </li>
                    </ul>
                
                <li> <b>Write the dad relation between John and Peter? </b></li>
               		<div id="knowledgeAssignment" class="form-group">
					  <input id="yBox" type="text" class="form-control" required>
					</div>
					</ul>
					<div id="zAnswer"></div>
                <div class="text-center">
	        		<p>Page 11 of 15</p>
	    		</div>
                <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 2, 'version-1-course-x-lesson-2-page-15', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 2, 'version-1-course-x-lesson-2-page-15', false, -1)">Next</button>
    			</div> 
    			
            </div>
        </div>
    </section>
                
    <section id="version-1-course-x-lesson-2-page-16" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:35rem">
            <h2 class="text-primary">Learning outcome 2: Extending the model for Dad relation </h2>
            <br>
            <h4> Extend your Model for dad of peter: </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea><br><br>
                <br>
                <div class="text-center">
	        		<p>Page 12 of 15</p>
	    		</div>
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
        <section id="version-1-course-x-lesson-2-page-20" hidden>
            <div class="row">
                <div class="container" >
        <h2 class="text-primary">Learning outcome 3: Extending the model for new family </h2>
        <ul class="lesson-list" >
            <li> <b>What we know </b></li>
            <ul class="sub-points">
                <li> John is the father of Peter </li>
                <li> Joaan is the mother of Peter </li>
            </ul>
        </ul>
        <ul class="lesson-list">
            <li> <b>Questions</b> </li>
            <ul class ="main-point">
                <li> Old ones </li>
                <ul class="sub-points">
                    <li> Is John the father of Peter? </li>
                    <li> Who is Peter's father? </li>
                    <li> Who is Peter's dad? </li>
                    <li> Is John a parent of Peter? </li>
                </ul>
            </ul>
        </ul>
        		<div class="text-center">
	        		<p>Page 13 of 15</p>
	    		</div>
       			<div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-20', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(2, 3, 'version-1-course-x-lesson-2-page-20', false, -1)">Next</button>
    			</div> 
    			
    </div></div>
</section>

<section id="version-1-course-x-lesson-2-page-21" hidden>
    <div class="row">
        <div class="container" >
            <h2 class="text-primary">Learning outcome 3: Extending the model for new family </h2>
        <ul class="lesson-list">
            <li><b> Assume we have the following relations </b> </li>
            <ul class="sub-points">
                <li> mother(X, Y)means person X is the mother of Y </li>
                <li> mom(X, Y)means person X is the mom of Y </li> 
            </ul>
        </ul>
         <ul class="lesson-list">
        <li> <b>Write the Mom relation between joaan and Peter? </b></li>
        <div id="motherrelation" class="form-group">
					  <input id="fBox" type="text" class="form-control" required></div>
					<div id="cAnswer"></div>
	    </ul>
        		<div class="text-center">
	        		<p>Page 14 of 15</p>
	    		</div>
        		<div class="d-flex justify-content-between">
        			<button class="btn btn-primary" onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-21', false, -1)">Previous</button>
        			<button class="btn btn-primary" id="fNextBtn" onclick="gotoNext(2, 3, 'version-1-course-x-lesson-2-page-21', false, -1)" disabled>Next</button>
    			</div> 
    			
    </div></div>
</section>

<section id="version-1-course-x-lesson-2-page-22" hidden>
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
            <div class="text-center">
        		<p>Page 15 of 15</p>
    		</div>
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
<%@ include file = "footer1.jsp" %>

<script src="../js/lesson2/validations.js" type="text/javascript">  </script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   </body>

</html>