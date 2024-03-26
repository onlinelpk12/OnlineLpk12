<html lang="en">

<head>
    <title>Lesson 11</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	
	 <link rel="stylesheet" href="../styles/lesson2.css">

    <link rel="stylesheet" href="../styles/style.css">
    <script src="../js/lessonDataStructureJSON.js"></script>
    <script src="../js/script.js"></script>  
    
     <script type="text/javascript">
    function reInitiateFreshPage(){
            sessionStorage.setItem("pageIdToShow",'version-1-course-x-lesson-12-page-1');
    }
    
  </script>
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
 
        /* ul {
        
        margin-bottom: 30px;
        } */
        
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(11);
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
    <!-- <section id="version-1-course-x-lesson-11-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 11: </h1> 
            <h1 style="text-align:center">  Variables and Queries </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section> -->
     <section id="version-1-course-x-lesson-11-page-1" hidden>
        <div class="row">
            <div class="container" >
            <h2 style="text-align:center">  Lesson11:  </h2> <br>
            <h2 style="text-align:center">  Variables and Queries </h2>
            <button class="btn btn-primary btn-lg mx-auto pull-right" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-1', false, -1)" style="display:flex; margin-top:50px;"> <p style="width:100%; text-align:center;margin:0">Next </p> </button>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-11-page-2"  hidden>
        <div class="row">
            <div class="container" >
                <h1 class="text-primary" style="text-align:center"> Variables and Queries </h1>
                <ul class="lesson-list">
                	<li class="main-point"> <b>Recall to write a query for answering the question: </b></li> 
                	<ul class="sub-points"> 
                    <li>what is the atomic number of hydrogen?
                    </li>                    
					 </ul>
					 </ul>
					  <ul class="lesson-list">
					 <li class="main-point"> <b>we were given the intended specification  </b></li> 
                	<ul class="sub-points"> 
                    <li>atomicNumber(E, N) means the atomic number of element E is N. 
                    </li>                    
					 </ul>
					 </ul>
					  <ul class="lesson-list">
					  <li class="main-point"> <b>The query is atomicNumber(hydrogen, X)   </b></li> 
                	<ul class="sub-points"> 
                    <li>Here X is a variable and the query means (reads): we want to find the 
	value of X such that X is the atomic number hydrogen.  
                    
                    </li>                    
					 </ul>
					 </ul>
					 
               <!--  <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-2', false, -1)"> Next 
                </a> -->
                <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-2', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-2', false, -1)">Next</button>
    			</div>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-11-page-3"  hidden>
        <div class="row">
            <div class="container" >
             <h1 class="text-primary" style="text-align:center">What are Variables </h1>
              <ul class="lesson-list">
              
              <li class="main-point"> <b>Variables are names (starting with a capital letter)
               </b></li>
               </ul>
                <ul class="lesson-list">
               <li class="main-point" > <b>We have two type of variables 
               </b> </li>
               
              <ul class="sub-points"> 
                    <li>Unknown variables. Unknown variables are variables to refer to unknown objects (or refer to something we do not know but want to know). 
                    </li>    
                    <li>Referring variables. Referring variables are used to refer to general (?) objects (some object?)  instead of a particular one. </li>                
			 </ul>
			 </ul>
			
                
                <br>
                <!-- <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-3', false, -1)"> Next
                </a> -->
                 <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-3', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-3', false, -1)">Next</button>
    			</div>
            </div>
        </div>
    </section>
     <section id="version-1-course-x-lesson-11-page-4"  hidden>
        <div class="row">
           <div class="container" >
             <h2 class="text-primary" style="text-align:center">Use of Unknown Variables</h2>
            
        				<ul class="lesson-list">
               			<li>Together with intended specification of relations, unknown variables are used to find answer(s) of given questions.   </li>
               				<li>We use unknown variables to find answers for questions, not only here, but in math, science and many other disciplines. 
               				 </li>
               			    <li>In this lesson, we focus on unknown variables and introduce a methodology of using unknown variables to find answers. </li>

               			</ul>       
               			   		  
                <br><br>   
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-4', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-4', false, -1)"> Next </a> -->
                
            <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-4', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-4', false, -1)">Next</button>
    			</div>
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-11-page-5" hidden>
        <div class="row">
            <div class="container" >
             <h3 class="text-primary" style="text-align:center">Example - Methodology of Using Variables</h3>
             <ul class="main-point">
             	<li> <b>An example of Modeling methodology of using unknown variables and query to answer questions 
               </b>
                 	<ul class="sub-points"> 
                    <li>Question: what is the atomic number of hydrogen? 
                    </li>    
                    <li>Intended specification of some relation(s). 
atomicNumber(E, N) means the atomic number of element E is N.  
                    </li>                
					 </ul>
					 </li>
					 </ul>
					 <ul class="main-point">
					  <li> <b>Objective-relation methodology for writing a query
               </b></li>
					 </ul>
					   
                
                <br>
            
        				 
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-5', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-5', false, -1)"> Next </a> -->
              <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-5', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-5', false, -1)">Next</button>
    			</div>
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-11-page-6"  hidden>
        <div class="row">
            <div class="container" >
             <h3 class="text-primary" style="text-align:center">Objective-relation methodology for writing a query</h3>
             <ul class="main-point">
             	<li> <b>Identify objects (in the questions): 
             	
               </b>
                 	<ul class="sub-points"> 
                    <li>Hydrogen 
                    </li>    
                                   
					 </ul>
					 </li>
					 </ul>
					 <ul class="main-point">
					  <li> <b>Identify unknown objects/variables:
               </b>
               <ul class="sub-points"> 
                    <li>We introduce variables for the unknowns (i.e., things we want to know but we do not know).
                     The atomic number of hydrogen here is the unknown object we want to know, so we introduce a 
                     variable for it and give it a meaning in the following format: 
                    
                    </li> 
                    <li>X: the atomic number of hydrogen</li>
             
					 </ul>
					 </li>
					 </ul>
					 <ul class="main-point">
             	<li> <b>The relation instance(s) among the objects and variables from the question (in English):
             	
               </b>
                 	<ul class="sub-points"> 
                    <li>atomicNumber(hydrogen, X)?  
                    </li>    
                                   
					 </ul>
					 </li>
					 </ul>
					 <ul>
					 <li> The result atomicNumber(X, hydrogen)? is the query we write.  </li> 

					 
					 </ul>
					 
					    <br> 
                
            
        	<!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-6', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-6', false, -1)"> Next </a> -->
               <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-6', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-6', false, -1)">Next</button>
    			</div>
            </div>
        </div>  
    </section>
    
     <section id="version-1-course-x-lesson-11-page-7"  hidden>
        <div class="row">
          <div class="container" >
             <h3 class="text-primary" style="text-align:center">Modeling Methodology of Using Unknown Variables </h3>
             <ul class="main-point">
             	<li> <b>Modeling methodology of using variables to answer questions  
               </b>
                 	<ul class="sub-points"> 
                    <li>There is a given question(s). 
                    
                    </li>    
                    <li>Assume the intended specification of some relation(s).      
                                   </li>   
                      <li> Objective-relation methodology for writing query 
                      <ul class="sub-sub-points">
                      <li>identify objects in the questions:</li>
                      <li>identify unknown objects/unknown variables:  </li>
                      <li>identify the relation instances among the objects and variables from the question </li>
                      </ul>
                      </li>
                                   
					 </ul>
					 </li>
					 </ul>
					
					   
                
            
        				 
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-7', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-7', false, -1)"> Next </a> -->
            <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-7', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-7', false, -1)">Next</button>
    			</div>
            </div>
            
        </div>  
    </section>
    
       <section id="version-1-course-x-lesson-11-page-8"  hidden>
        <div class="row">
            <div class="container" >
             <h3 class="text-primary" style="text-align:center">Methodology for writing queries using unknown variables  </h3>
             <ul class="main-point">
             	<li> <b>Question:</b>  What is the atomic number of hydrogen?</li> 
             	</ul>
                          <ul class="main-point">
             	<li> <b>Intended Specification:</b>  atomicNumber(E, N) means the atomic number of element E is N</li> 
             	
             	</ul>
             	<h3> ORM</h3>
             	 <ul class="main-point">
             	<li> <b>Objects:</b>
             	<ul>
                    <li>Hydrogen: an element </li>
                    </ul>
             	</li> 
             	</ul>
             	
                    <ul class="main-point">
             	<li> <b>Variables/Unknown Objects</b>
             	<ul class="sub-points"> 
                    <li>X: the atomic number of hydrogen </li>
                    </ul>
             	</li> 
             	</ul>
             	
                    <ul class="main-point">
             	<li> <b>Relation Instance in atomic use form </b>
             	<ul class="sub-points"> 
                    <li>atomicNumber(X, hydrogen) </li>
                    </ul>
             	
             	</li> 
             	</ul>
             	
             	
                 	
					
					
					   
                
            
        <!-- 				 
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-8', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-8', false, -1)"> Next </a> -->
              <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-8', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-8', false, -1)">Next</button>
    			</div>
            </div>
        </div>  
   
    </section>
    
    <section id="version-1-course-x-lesson-11-page-9"  hidden>
          <div class="row">
         <div class="container" >
            
            <h2>Learning outcome 1</h2>
             <ul class="lesson-list">
             	<li class="main-point"> <b>Question:</b>  What is the atomic number of Carbon?</li> 
             	</ul>
                 <ul class="lesson-list">
             	<li class="main-point"> <b>Intended Specification:</b>  atomicNumber(E, N) means the atomic number of element E is N</li> 
             	
             	</ul>
             	
					
				<li> <b>Objects </b> Write your objects below:</li>
				 <div id="protonAssignment" class="form-group">
				 <input id="wBox" type="text" class="form-control" required>
				   </div>
				   
                
                
					
					<li> <b>Variables/Unknown Objects</b> write your variables below</li>
				            <div id="ruledAssignment" class="form-group">
				                <input id="yBox" type="text" class="form-control" required>
				            </div>
				            <div id="zAnswer"></div>
				        
          
         <li> <b>Relation Instance in atomic use form:</b>Write your relation instances below</li>
				            <div id="objectAssignment" class="form-group">
				                <input id="xBox" type="text" class="form-control" required>
				            </div>
				            <div id="xAnswer"></div>
				        
				        
				
				
            
               	
  
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(11, 2, 'version-1-course-x-lesson-11-page-9', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right" id="nextButton" disabled
                onclick="gotoNext(11, 2, 'version-1-course-x-lesson-11-page-9', false, -1)"> Next </a> -->
             <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-9', false, -1)">Previous</button>
        			 <button class="btn btn-primary" onclick="gotoNext(11, 0, 'version-1-course-x-lesson-11-page-9', false, -1)">Next</button>
    			</div>
            </div>
            
        </div>  
</section>
 
<section id="version-1-course-x-lesson-11-page-10"  hidden>
        <div class="row">
            <div class="container" >
                <h1 class="text-primary" style="text-align:center"> Summary </h1>
                        <ul class="sub-points">
                    <li>We have reviewed the unknown variables and studied the methodology for using unknown variables and queries to answer questions.
                    </li>                    
                                         </ul>
                <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(11, 0, 'version-1-course-x-lesson-11-page-10', false, -1)">Previous</button>
    
                                <a class="btn btn-primary" href="../jsp/lesson12.jsp" onclick="reInitiateFreshPage()">Next</a>
                            </div>
            </div>
        </div>
    </section>
    
  <%@ include file = "footer1.jsp" %>
     <script src="../js/lesson11/validation.js" type="text/javascript">  </script>
    
    
   </body>
   </html>
    
