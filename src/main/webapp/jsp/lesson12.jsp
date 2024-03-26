<html lang="en">

<head>
    <title>Lesson 12</title>
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(12);
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
    <!-- <section id="version-1-course-x-lesson-12-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 12: </h1> 
            <h1 style="text-align:center">  Modeling Proton Numbers </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section> -->
    
    <!-- PAGE -1  -->
    <section id="version-1-course-x-lesson-12-page-1" hidden>
        <div class="row">
            <div class="container" >
            <h2 style="text-align:center">  Lesson12:  </h2> <br>
            <h2 style="text-align:center">  Modeling Proton Numbers</h2>
            <button class="btn btn-primary btn-lg mx-auto pull-right" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-1', false, -1)" style="display:flex; margin-top:50px;"> <p style="width:100%; text-align:center;margin:0">Next </p> </button>
            </div>
        </div>
    </section>
    <!-- PAGE - 2 -->
    <section id="version-1-course-x-lesson-12-page-2"  text-align:center hidden>
        <div class="row">
         <div class="container" >
           
                <h1 class="text-primary" style="text-align:center"> Atomic number and Proton Number</h1>
                
                	<li class="main-point"> <b>What is the atomic number of an atom?</b></li> 
                	<ul class="sub-points"> 
                    <li>The atomic number of an element is the number of protons in the nucleus of an atom.
                    </li>                    
					 </ul>
					 <li class="main-point"> <b>What is the proton number of an element? </b></li> 
                	<ul class="sub-points"> 
                    <li>The proton number is the number of protons in the nucleus of an atom.  
                    </li>                    
					 </ul>
					  
					  <img src="../images/lesson12/lesson12f.jpg" alt="Image" style="display:block; margin:auto" width="200" height="200">
                <br><br> 
					 
                <!-- <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-2', false, -1)"> Next 
                </a> -->
                 <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-2', false, -1)">Previous</button>
        			<button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-2', false, -1)">Next</button>
    			</div>
            </div>
        </div>
    </section>
<!-- PAGE - 3 -->
    <section id="version-1-course-x-lesson-12-page-3"  text-align:center hidden>
        <div class="row">
             <div class="container" >
                <h1 class="text-primary" style="text-align:center"> Atomic number and Proton Number</h1>
                
                	<ul class="main-point"> 
                	<li><b>What is the atomic number of an atom?</b></li> 
                	</ul>
                	<ul class="sub-points"> 
                    <li>The atomic number of an element is the proton number of that element.
                    
                    </li>                    
					 </ul>
					 <ul class="main-point">
					 <li> From the cell of an chemical from Periodic table, we can easily know the atomic number of that element.</li>
					  <li>From the hydrogen cell we know its atomic number which is 1.</li>
					 </ul>
					 <ul class="main-point"> 
                	<li><b>What is the proton number of an atom?</b></li> 
                	</ul>
                	<ul class="sub-points"> 
                    <li>The Proton number of an element is the atomic number of that element.
                    
                    
                    </li>        
                    </ul>            
					  
                	
                     
					  
<!--                                           <img src="../images/lesson12/lesson12f.jpg" alt="Image" style="display:block; margin:auto" width="200" height="200">
                
 -->                 
<br><br> 
					 
               <!--  <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-3', false, -1)"> Next 
                </a> -->
                 <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-3', false, -1)">Previous</button>
        	<button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-3', false, -1)">Next</button>	
<!-- 	<button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-11-page-3', false, -1)">Next</button> -->
    			</div>
            

</div>
        </div>
    </section>
    
     <!-- PAGE-4 -->
    <section id="version-1-course-x-lesson-12-page-4"  text-align:center hidden>
        <div class="row">
         <div class="container" >
          
                <h1 class="text-primary" style="text-align:center"> Developing Computer Model on Proton number</h1>
                        <ul class="main-point">
                        <li> <b>We will develop a model (facts/rules) for answering proton number questions from atomic numbers</b></li>
                        <li ><b>[Design of activities] - General Pattern: </b></li>
                        </ul>
                        <ul class="main-point">
                    <li><b>when using earlier concepts (e.g., asking a query), either a review is given or some materials provided for students to easily refer to? </b></li>
                    </ul>
                    <ul class = "sub-points">
                    <li>When ask students to model a piece of information (using new LP construct), we may directly give the construct and let students to figure out a connection between the knowledge and the model? Then we can provide some guides?</li>
                    </ul>
                <br><br>
                 <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-4', false, -1)">Previous</button>
                                <button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-4', false, -1)">Next</button>
                            </div>
            </div>
        </div>
    </section>
    <!-- PAGE-5 -->
    <section id="version-1-course-x-lesson-12-page-5"  text-align:center hidden>
        <div class="row">
         <div class="container" >
          
                <h1 class="text-primary" style="text-align:center"> Developing Computer Model on Proton number</h1>
                <ul class="main-point">
                        <li> <b>We will develop a model (facts/rules) for answering proton number questions from atomic numbers</b></li>
                        <li ><b>[Design of activities] - particulars </b></li>
                        </ul>
                        <ul class="sub-points">
                    <li>A clear question of designing (vocabularies of developing = design + coding + debugging) a model to answer the question of proton numbers of elements GIVEN atomic number AND intended specification of protons(E, N)? </li>
                    </ul>
                    <ul class = "sub-points">
                    <li>[maybe showing the facts on atomic numbers] Ask students to propose designs? [ 5 minutes ] </li>
                    </ul>
                    <ul class = "sub-points">
                    <li>One possible design - write facts using protons() manually (using atomic number information).</li>
                    </ul>
                    
                        
              <br><br>
                                        <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-5', false, -1)">Previous</button>
                                <button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-5', false, -1)">Next</button>
                            </div>
            </div>
        </div>
    </section>
    
    <!-- PAGE-6 -->
    <section id="version-1-course-x-lesson-12-page-6"  text-align:center hidden>
        <div class="row">
         <div class="container" >
          
                <h1 class="text-primary" style="text-align:center"> Developing Computer Model on Proton number</h1>
                <ul class="main-point">
                        <li> <b>As human beings, we may need to collect all the atomic numbers for each element from the periodic table. Once done, how do we answer the questions of the protons? [with atomic number info available, ask student the proton number] [5 minutes discussion?] </b></li>
                        </ul>
                        <ul class="sub-points">
                        <li class="main-point"><b>Okay some of us use the knowledge: </b></li>                  
                    <li>atomic number of an element is the number of protons of any atom of the element. </li>
                    </ul>
                    <ul class="main-point">
                        <li> <b>Now lets apply our methodology to represent this information.</b></li>
                        <li class= "sub-point"><b>Objects:</b> [note the arguments, maybe need an English teaching expert on how to provide arguments in a sentence.] </li>
                        <li class="sub-point"><b>E:</b> an element </li>
                        <li class="sub-point"><b>NP:</b> the number of protons of element E</li>
                        <li class="sub-point"><b>NA:</b> the atomic number of E </li>
                        </ul>
                    
                    
                        
              <br><br>
                                        <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-6', false, -1)">Previous</button>
                                <button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-6', false, -1)">Next</button>
                            </div>
            </div>
        </div>
    </section>
    <!-- PAGE-7 -->
        <section id="version-1-course-x-lesson-12-page-7"  text-align:center hidden>
        <div class="row">
         <div class="container" >
          
                <h1 class="text-primary" style="text-align:center"> Developing Computer Model on Proton number</h1>
                <ul class="main-point">
                        <li> <b>Relations:  (which objects are related? Give that relationship a name):</b></li>
                        <li class="sub-point"><b> E and NP:</b> protonNumber(E, NP) </li>
                        <li class="sub-point"><b> E and NA:</b> atomicNumber(E, NA) </li>
                        <li class="sub-point"><b>NP and NA are the same:</b>  NP = NA </li>
                        </ul>
                        <ul class="sub-points">
                        <li class="main-point"><b>Logic connectives relating relation instances -- how these relation instances are related? </b></li>                  
                    </ul>
              <br><br>
                                        <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-7', false, -1)">Previous</button>
                                <button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-7', false, -1)">Next</button>
                            </div>
            </div>
        </div>
    </section>
    
    <!-- PAGE-8 -->
    <section id="version-1-course-x-lesson-12-page-10"  text-align:center hidden>
        <div class="row">
         <div class="container" >
          
                <h1 class="text-primary" style="text-align:center"> Developing Computer Model on Proton number</h1>
                <ul class="main-point">
                        <li> <b>One methodology - decide which relation instance(s) can be obtained from which other relation instances? Or which is given and which is derivable from the given ones? Which relation instances imply which relation instance? [We may need a few different descriptions of the methodology] [research: we can collect data to see how students respond to these methodology and/or general responses to the task of developing model in this case] </b></li>
                        </ul>
                        
              <br><br>
                                        <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-10', false, -1)">Previous</button>
                                <button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-10', false, -1)">Next</button>
                            </div>
            </div>
        </div>
    </section>
    <!-- PAGE-9 -->
    <section id="version-1-course-x-lesson-12-page-11"  text-align:center hidden>
        <div class="row">
         <div class="container" >
          
                <h1 class="text-primary" style="text-align:center"> Developing Computer Model on Proton number</h1>
                <ul class="main-point">
                        <li> <b>Example of possible discussions: </b></li>
                        </ul>
                        <ul class="sub-point">
                        <li> English or pseudo code? [which is easier for students?]  English: Proton number of an element depends on the atomic number.  [objects depends on objects may be more natural to students. But relation instance depend on another might not be natural? Find by research] Pseudocode: protonNumber(E, NP) depends atomicNumber(E, NA). How about NP = NA? </li>
                        <li> <b>Pseudocode:</b> protonNumber(E, NP) depends on atomicNumber(E, NA) AND NP = NA. In this case, using implication, we say if atomicNumber(E, NA) AND NP = NA then protonNumber(E, NP). We introduce :- for if and <b>,</b> for AND. We use rule:
pN(E, NP) :- aN(E, NA), NP=NA </li>
                        
                        </ul>
                        
              <br><br>
                                        <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-11', false, -1)">Previous</button>
                                <button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-11', false, -1)">Next</button>
                            </div>
            </div>
        </div>
    </section>
     <!-- PAGE-10 -->
    <section id="version-1-course-x-lesson-12-page-12"  text-align:center hidden>
        <div class="row">
         <div class="container" >
          
                <h1 class="text-primary" style="text-align:center"> Developing Computer Model on Proton number</h1>
                <ul class="main-point">
                        <li> <b>Make sure students are able to write the rule and read it. [5 minutes] </b></li>
                        <li><b>A new task:</b> what if we know the proton numbers, how do we develop model to answer questions on atomic number? </li>
                        </ul>
                        
              <br><br>
                                        <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-12', false, -1)">Previous</button>
<!--                                 <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-1', false, -1)">Next</button>
 -->                            </div>

	</div>

        </div>
    </section>
    
    <%@ include file = "footer1.jsp" %>
     <script src="../js/lesson11/validation.js" type="text/javascript">  </script>
    
    
   </body>
   </html>
    
