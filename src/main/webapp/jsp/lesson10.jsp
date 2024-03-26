<html lang="en">

<head>
    <title>Lesson 10</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function reInitiateFreshPage(){
            sessionStorage.setItem("pageIdToShow",'version-1-course-x-lesson-11-page-1');
    }
  </script>
	
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
        list-style: none;
        padding-left: 0;
        margin: 0;
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
   
   justify-content {
    text-align: justify;
    /* Ensuring that the last line is not justified but left-aligned */
 text-align-last: left;
 letter-spacing: 0.5px;  /* Adjust as needed */
    word-spacing: 1px;
}

.main-point > li {
  list-style-type: circle; /* Large circle for main points */
  margin-left: 20px; /* Indentation for main points */
}

/* Style for sub points */
.sub-point {
    padding-left: 20px; /* Add some padding to the sub-points for hierarchy */
}



.sub-point > li {
  list-style-type: disc; /* Small circle for sub points */
}

/* Style for sub-sub points */
.sub-sub-point {
  padding-left: 40px; /* Further indentation for sub-sub points */
}

.sub-sub-point > li {
  list-style-type: square; /* Square for sub-sub points */
}
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(10);
  			 let currentSection = document.getElementById(firstPageIdOfCurrentLesson);
  			if (currentSection) {
  			    currentSection.hidden = false;
  			} else {
  			    console.error("Element with ID '" + firstPageIdOfCurrentLesson + "' not found.");
  			}
  			 //currentSection.hidden = false;
  		}
  		else{
  			 let currentSection = document.getElementById(pageIdToShow);
  			 currentSection.hidden = false;
  		}           
    });    
    </script>
	<%@ include file = "header1.jsp" %>
  <!--   <section id="version-1-course-x-lesson-10-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 10: </h1> 
            <h1 style="text-align:center">  Modeling Periodic Table </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section> -->
    
    <section id="version-1-course-x-lesson-10-page-1" hidden>
        <div class="row">
            <div class="container" >
            <h2 style="text-align:center">  Lesson10:  </h2> <br>
            <h2 style="text-align:center">  Modeling Periodic Table </h2>
            <button class="btn btn-primary btn-lg mx-auto pull-right" onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-1', false, -1)" style="display:flex; margin-top:50px;"> <p style="width:100%; text-align:center;margin:0">Next </p> </button>
            </div>
        </div>
    </section>
    
     <section id="version-1-course-x-lesson-10-page-2" hidden>
        <div class="row">
            <div class="container" >
                <h1 class="text-primary" style="text-align:center"> Periodic Table</h1>
                
                	<li class="main-point"> <b>What is Periodic Table ?</b></li> 
                	<ul class="sub-points"> 
                    <li>There have been numerous artificial materials in our life, they are all from basic elements. We would like to know all elements on the earth. Periodic table lists all of them.
                    </li>                    
					
                </ul>
                <li class="main-point"> <b>What is a chemical element?
     </b></li> 
                	<ul class="sub-points"> 
                    <li>Each cell of the periodic table represents a chemical element. 
                    </li>   
                    <li>E.g. Hydrogen, Carbon, Sodium etc </li>                 
					
                </ul>
                <li class="main-point"> <b>What is a chemical symbol for any element?
                </b></li> 
                	<ul class="sub-points"> 
                    <li>Elements are so frequently used in chemistry, scientists and practitioners need a short name for them. They are called chemical symbols of the elements</li>
                    <li> E.g. H for Hydrogen, C fo Carbon, Na for Sodiam etc</li>                    
					
                </ul>
               <!--  <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-2', false, -1)"> Next 
                </a> -->
              <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-2', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-2', false, -1)">Next</button>
    			</div>
            </div>
        </div>
    </section>
    
    
    <section id="version-1-course-x-lesson-10-page-3"  hidden>
        <div class="row">
            <div class="container" >
               <h3 class="text-primary" style="text-align:center"> Computer model for periodic table</h3>
               <h5><b> Can you develop a computer model for a given question and an intended specification of a relation on chemical symbols? </b></h5> 
                
                	<li class="main-point"> <b>Question
                	?</b></li> 
                	<ul class="sub-points"> 
                    <li>Is h is the chemical symbol of Hydrogen?
                    
                    </li>     
                    </ul>
                    <li class="main-point"> <b>Intended specification of the relation
                	?</b></li>      
                	<ul class="sub-points"> 
                    <li>symbolFor(E,S) means the chemical symbol for an element E is S.</li>

                           
					
                </ul>
              
               		
               		
               <!--  <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-3', false, -1)"> Next
                </a> -->
              <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-3', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-3', false, -1)">Next</button>
    			</div>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-10-page-4"  hidden>
        <div class="row" >
            <div class="container" >
           
            <h2 style="text-align:center"> Computer model for chemical symbols</h2>
            
  
                     <ul class="main-point">
                       <li><b> Question: Is H the chemical symbol of Hydrogen? </b>
                             
                             </li>
                          </ul>
                        <ul class="main-point">
                       <li><b> Knowledge needed to answer the question </b>
                             <ul class="sub-point">
                                <li>H is the chemical symbol for Hydrogen.</li>
                              </ul>
                             </li>
                          </ul>

						<ul class="main-point">
    						<li> <b>Identifying objects</b>
       						 <ul class="sub-point">
            				<li>According to the intended specification of the relation, we have two objects to identify
               					 <ul class="sub-sub-point">
                    				<li>One is the element, E, and</li>
                    					<li>Other is the symbol, S</li>
                					</ul>
            					</li>
            				<li>From the knowledge, we get two objects
                				<ul class="sub-sub-point">
                    			<li>Hydrogen and</li>
                    			<li>H</li>
                			</ul>
            				</li>
            				</ul>
            				</li>
            				</ul>
            				<ul class="main-point">
           				 <li> <b> Identifying relation </b>
               				 <ul class="sub-sub-point">
                   		 <li>"is the chemical symbol for" which is represented as "symbolFor" in the intended specification of this relation.</li>
               			 </ul>
               			
            		</li>
        		</ul>
    			
			

            
                      		
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-4', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-4', false, -1)"> Next </a> -->
             <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-4', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-4', false, -1)">Next</button>
    			</div>
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-10-page-5" hidden>
        <div class="row" >
            <div class="container" >
            <div class="justify-content">
            <h3 class="text-primary" style="text-align:center"> Computer model for chemical symbols</h3>
            
  
                     <ul class="main-point">
                       <li><b> So we have the fact/rule </b>
                             
                       </li>
                          </ul>
                       <ul class="main-point">
                       <li><b> symbolFor(hydrogen, h). </b></li>
                             
                        <li>We can comment "%H is the chemical symbol for Hydrogen%" to explain the rule beforehand.</li>
                             
                          </ul>

						<ul class="main-point">
    						<li> <b>Testing the computer model/asking query to computer model to get a expected/predicted answer for a question.</b>
       						 <ul class="sub-point">
            				<li>Question: is H is the symbol for hydrogen?</li>
            				<li>Query: symbolFor(hydrogen,h)?</li>
            				<li>You can write this query in query box and click on "Submit" button to get answer and compare it with your expect/predicted answer.</li>
            				</ul>
            				</li>
            				</ul>
            				
            				
            				
               					
            			
            			

            
                      		
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-5', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-5', false, -1)"> Next </a> -->
             <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-5', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-5', false, -1)">Next</button>
    			</div>
            </div>
            </div>
        </div>  
    </section>
    
    <section id="version-1-course-x-lesson-10-page-6"  hidden>
        <div class="row">
        <div class="container" >
            
            <h2>Learning outcome 1</h2>
            <ul class="main-point">
    	<li> <b>Question</b>
       						 <ul class="sub-point">
            				<li>Is C the chemical symbol for Carbon?</li>
            				</ul>
            				</li>
            				</ul>
          <ul class="main-point">
    	<li> <b>can you extend the computer model to answer this question?</b></li>
            
        
				
				
            <ul class="lesson-list" style="padding:0;">
				<li class="main-point"> <b>Type the knowledge as comments </b></li>
						
               </ul>
               	
               		
 <div id="protonAssignment" class="form-group">
					  <input id="wBox" type="text" class="form-control" required>
					</div>
					<div id="yAnswer"></div>
					<ul class="lesson-list" style="padding:0;">
				<li class="main-point"> <b>Type the fact/rule to represent that knowledge</b></li>
						
               </ul>
               	
               		
               		
               		<div id="ruledAssigment" class="form-group">
					  <input id="yBox" type="text" class="form-control" required></div>
					<div id="zAnswer"></div>
               </ul>         		
                </ul>  
                <br><br>   
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(10, 2, 'version-1-course-x-lesson-10-page-6', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right" id="nextButton" disabled
                onclick="gotoNext(10, 2, 'version-1-course-x-lesson-10-page-6', false, -1)"> Next </a> -->
            <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(10, 0, 'version-1-course-x-lesson-10-page-6', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-6', false, -1)">Next</button>
    			</div>
            </div>
        </div>  
    </section>
    
    <section id="version-1-course-x-lesson-10-page-7"  hidden>
        <div class="row">
            <div class="container" >
           
            <h1 style="text-align:center"> End of Lesson </h1> <br>
           <div class="d-flex justify-content-between"><!--
           
                                <button class="btn btn-primary" onclick="gotoNext(10, 0, 'version-1-course-x-lesson-10-page-7', false, -1)">Next</button> -->
                                <a class="btn btn-primary" href="../jsp/lesson11.jsp" onclick="reInitiateFreshPage()">Next</a>
                            </div>
            </div>
        </div>
    </section>
    
    
     
    
  
  <%@ include file = "footer1.jsp" %>
  <script src="../js/lesson10/validation.js" type="text/javascript">  </script>
   

   </body>

</html>
