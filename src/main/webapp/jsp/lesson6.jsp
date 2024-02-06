<html lang="en">

<head>
    <title>Lesson 6</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

	<link rel="stylesheet" href="../styles/lesson6.css">

    <link rel="stylesheet" href="../styles/style.css">
    <script src="../js/lessonDataStructureJSON.js"></script>
    <script src="../js/script.js"></script>  
    
    <style>
        /* Applying colors and reducing margins for H1 and H2 */
   
       
   body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            font-size: 14px;
            overflow-x:hidden;
        }
 
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            height:auto;
        }
 
        h2 {
            
            margin-bottom: 20px;
            text-align: center;
            color: #0056b3;
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(6);
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
    <section id="version-1-course-x-lesson-6-page-1" hidden>
        <div class="row">
        <div class="container">
            <h1 style="text-align:center">  Lesson 6: Model periodic table - Atomic Number </h1> <br>
            <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-1', false, -1)"> Next </button>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-2"  hidden>
        <div class="row">
        <div class="container">
                <h1 class="text-primary"> Outline </h1>
                <ul class="lesson-list">
                    <li class="main-point">Atomic structure</li>                    
					<li class="main-point">Model atomic number</li>
                </ul>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-2', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-2', false, -1)"> Next 
                </button>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-3" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Atomic Structure</h2>
                <ul class="lesson-list">
                		<li class="main-point">Matter</li>
                		<ul class="sub-point">
                			<li class="main-point">The term matter describes all of the physical substances around us: your table, your body, a pencil, water, and so forth.</li>
                		</ul>
                		<li class="main-point">Matter is made of atoms</li>
                		
                </ul>               
                <br>
                <div style="padding-bottom: 40px; padding-left:200px">
           			<!--  <img  class = "atomGif" src="../images/lesson6/atomstructure.gif" alt="Image" width="105" height="90" align="middle">-->
           			<img  class = "atomGif" src="../images/lesson6/image003.gif" align="middle" alt="Image" width="105" height="90" >
           		</div>
           		<br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-3', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-3', false, -1)"> Next
                </button>
            </div>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-4" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Atomic Structure</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="main-point">Atomic structure</li>
                		<ul class="sub-point">
                			<li>Nucleus</li>
                			<ul>
                				<li>Protons</li>
                				<li>Neutrons</li>
                			</ul>
                			<li>Electrons</li>
                		</ul>
                		
                </ul>  
           		</div>
                      <div  style="padding-bottom: 70px; padding-left:150px">
                	<!--<img  class = "atom" id="atom" src="../images/lesson6/slide4.png" alt="Image" width="400" height="400" align="middle">  -->
                	<img id="atom" src="../images/lesson6/c-atom_e.gif" width="40pt" height="40pt" align="left">
           			</div>       
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-4', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-4', false, -1)"> Next
                </button>  
                </div>  
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-5" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Atomic Structure</h2>
                <ul class="lesson-list">
                		<li class="main-point">Electrons</li>
                		<ul class="sub-point">
                			<li>Tiny, very light particles</li>                			
                			<li>Move around the outside of the nucleus</li>
                		</ul>
                		
                </ul>  
                <div  style="padding-bottom: 70px; padding-left: 150px">
           			<img  id = "atom" src="../images/lesson6/slide5.png" alt="Image">
           		</div>
                             
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-5', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-5', false, -1)"> Next
                </button>
                </div>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-6" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Atomic Structure</h2>
                <ul class="lesson-list">
                		<li class="main-point">Protons</li>
                		<ul class="sub-point">
                			<li>A proton is much larger and heavier than an electron</li>                			
                			<li>A proton is located in the nucleus of the atom</li>
                		</ul>                		
                </ul>
                
                <div style="padding-bottom: 70px; padding-left:150px">
          			<img  id = "atom" src="../images/lesson6/slide6.png" alt="Image">
          		</div>
                               
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-6', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-6', false, -1)"> Next
                </button>
                </div>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-7" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Atomic Structure</h2>
                <ul class="lesson-list">
                		<li class="main-point">Neutrons</li>
                		<ul class="sub-point">
                			<li>A neutron is large and heavy like a proton</li>                			
                			<li>A neutron is located in the nucleus of the atom</li>
                		</ul>                		
                </ul> 
                <div style="padding-bottom: 70px; padding-right:200px">
           			<img  id = "neutron" src="../images/lesson6/slide7.png" alt="Image">
           		</div>
                        
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-7', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-7', false, -1)"> Next
                </button>
                </div>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-8" hidden>
        <div class="row">
        <div class="container">
            	<h2 style="text-align:center;">The Atomic Number</h2>
            	<h3><b>Atomic number</b></h3>
                <ul class="lesson-list">
               		
               			<li class="main-point">The <b>atomic number</b> of an element is the number of <b>protons</b> of the atom of the element.</li>                			
               			<li class="main-point">We can find the atomic number from periodic table.</li>              		
                </ul>               
                <div style="padding-bottom: 140px; padding-right:120px">
           			<img  id = "atomnumber" src="../images/lesson6/slide8.png" alt="Image">
           		</div>
           	
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-8', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-8', false, -1)"> Next
                </button>
                </div>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-9" hidden>
        <div class="row">
        <div class="container">
            	<h2 style="text-align:center;">Atomic Number - Carbon</h2>
            	<ul class="lesson-list">
               		<li class="main-point">Question</li>
               		<ul class="sub-point">
               			<li>What is the proton number of carbon ?</li>
               			<ul classs="main-point">
               				<li class="sub-point">The proton number of carbon is 6 it is shown on the top of the symbol.</li>
               			</ul>                			
               			<li class="sub-point">What is the atomic number of carbon?</li>
               			<ul class="main-point">
               				<li class="sub-point">The atomic number of carbon is 6. Because the atomic number is equal to the number of protons in an element.</li>
               			</ul>
               		</ul>                		
                </ul>     
                <div style="padding-bottom:130px; padding-right:180px">
           			<img  id = "carbon" src="../images/lesson5/carbon.png" alt="Image" width="105" height="90" >
           		</div>
                          
                <br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-9', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-9', false, -1)"> Next
                </button>
                </div>
            </div>
        </div>
    </section>
    
    
    <!-- Lesson 6 assement 0 - program 0 -->
	<section id="version-1-course-x-lesson-6-page-10" hidden>
        <div class="row">
        <div class="container">
                <h3><b>Activity : Extend Periodic Table Model -- Atomic Numbers</b></h3>
                <ul class="lesson-list">
                		<li class="sub-point">Add to the model the knowledge needed to answer your question (on atomic number of carbon).</li>
                		<ul class="main-point">
                			<li class="sub-point">Remember to write the comment first</li>
                			<li class="sub-point">Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">What is the proton and atomic number of carbon ?</label><br/>
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-10', false, -1)"> Previous </button>
                    <div class="text-center">
                        <button class="btn btn-primary" style="margin-left: -15rem;background-color :#1b84f5;" onclick="submitAssessment('version-1-course-x-lesson-6-page-10', 'program0')"> Submit </button>
                    </div>
                    <button class="btn btn-primary pull-right"  style="margin: -35px; margin-right: 76px; background-color: lightcoral;"
	                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-10', false, -1)">Skip Pre-Assessment</button>
                </form>
                </div>
            </div>
        </div>
    </section>
	<!-- onlineSPARC -->
	<!-- skipped 11,12 pages -->
	
	<!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-6-page-13" hidden>
        <div class="row">
        <div class="container">
            <h2> Learning outcome 1</h2>
            <ul class="lesson-list">
               		<li class="main-point">Question</li>
               		<ul class="main-point">
               			<li class="sub-point">What is the proton number of hydrogen ?</li>
               			<ul class="main-point">
               				<li class="sub-point">The proton number of Hydrogen is 1 it is shown on the top of the symbol.</li>
               			</ul>                			
               			<li class="sub-point">What is the atomic number of Hydrogen?</li>
               			<ul class="main-point">
               				<li class="sub-point">The atomic number of Hydrogen is 1. Because the atomic number is equal to the number of protons in an element.</li>
               			</ul>
               		</ul>                		
                </ul> 
            <div style="padding-bottom: 130px; padding-right:200px">
   				<img  id = "carbon" src="../images/lesson6/hydrogen.png" alt="Image" width="105" height="90" >
			</div>
                <br><br>   
            <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                onclick="gotoPrevious(6, 1, 'version-1-course-x-lesson-6-page-13', false, -1)"> Previous </button>
            <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                onclick="gotoNext(6, 1, 'version-1-course-x-lesson-6-page-13', false, -1)"> Next </button>
            </div>
            </div>
        </div>  
    </section>
    
     <!-- Lesson 6 assement 1 - program 1 -->
	<section id="version-1-course-x-lesson-6-page-13" hidden>
        <div class="row">
        <div class="container">
                <h3><b>Activity : Extend Periodic Table Model -- Atomic Numbers</b></h3>
                <ul class="lesson-list">
                		<li class="sub-point">Expand model: Add to the model the knowledge needed to answer your question (on atomic number of hydrogen).</li>
                		<ul class="main-point">
                			<li class="sub-point">Remember to write the comment first</li>
                			<li class="sub-point">Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">What is the proton and atomic number of hydrogen ?</label><br/>
                    <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 1, 'version-1-course-x-lesson-6-page-12', false, -1)"> Previous </button>
                    <div class="text-center">
                        <button class="btn btn-primary" style="margin-left: -15rem; background-color :#1b84f5;" onclick="submitAssessment('version-1-course-x-lesson-6-page-14', 'program1')"> Submit </button>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </section>
	<!-- onlineSPARC -->
	<!-- skipped 15,16 pages -->
	
	<!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-6-page-17" hidden>
        <div class="row">
        <div class="container">
            <h2 style="text-align:center;">Learning outcome 2</h2>
            <ul class="lesson-list">
               		<li class="sub-point">Question</li>
               		<ul class="main-point">
               			<li class="sub-point">What is the proton number of  Oxygen?</li>
               			<ul class="main-point">
               				<li class="sub-point">The proton number of oxygen is 8. it is shown on the top of the symbol</li>
               			</ul>                			
               			<li class="sub-point">What is the atomic number of oxygen?</li>
               			<ul class="main-point">
               				<li class="sub-point">The atomic number of oxygen is 8. Because the atomic number is equal to the number of protons in an element.</li>
               			</ul>
               		</ul>                		
                </ul>  
            <div style="padding-bottom:130px; padding-right:200px">
   				<img  id = "carbon" src="../images/lesson6/oxygen.png" alt="Image" width="105" height="90" >
			</div>
            
                <br><br>   
            <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                onclick="gotoPrevious(6, 2, 'version-1-course-x-lesson-6-page-17', false, -1)"> Previous </button>
            <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                onclick="gotoNext(6, 2, 'version-1-course-x-lesson-6-page-17', false, -1)"> Next </button>
            </div>
        </div>  
        </div>
    </section>
    
     <!-- Lesson 6 assement 2 - program 2 -->
	<section id="version-1-course-x-lesson-6-page-18" hidden>
        <div class="row">
        <div class="container">
                <h3><b>Activity : Extend Periodic Table Model -- Atomic Numbers</b></h3>
                <ul class="lesson-list">
                		<li class="sub-point">Expand model: Add to the model the knowledge needed to answer your question (on atomic number of oxygen).</li>
                		<ul class="main-point">
                			<li class="sub-point">Remember to write the comment first</li>
                			<li class="sub-point">Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">What is the proton and atomic number of oxygen ?</label><br/>
                    <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 2, 'version-1-course-x-lesson-6-page-18', false, -1)"> Previous </button>
                    <div class="text-center">
                        <button class="btn btn-primary" style="margin-left: -15rem; background-color :#1b84f5;" onclick="submitAssessment('version-1-course-x-lesson-6-page-18', 'program2')"> Submit </button>
                    </div>
                </form>
            </div>
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->
	<!-- skipped 19,20 pages -->
    
    <!-- learning outcome 3 -->
    <section id="version-1-course-x-lesson-6-page-21" hidden>
        <div class="row">
        <div class="container">
   			<h2 style="text-align:center;">Learning outcome 3: Atomic number on more elements </h2>
            <ul class="lesson-list">
            		<li class="sub-point">Can you ask a question similar to our earlier ones?</li> 
            		<div id="elementSymbol" class="form-group">
				  		<input id="eBox" type="text" class="form-control" required>
				  		<br>
				  		<button id="eButtonAnswer" class="btn" onclick="getElementName()">Answer</button>
				  		
					</div> 
					<div id="elementAnswer"></div>
					    					    		
            		<div style="padding-bottom:30px; padding-right:50px">
            			<img  id = "randomImageDisplay" class = "element" src="../images/lesson5/elements/17.png" alt="Image" width="105" height="120">
            		</div>
            </ul>
            
            <div>
            	<p>Would you like to try it out for another element 
            		<a href="#" onclick="changeImageRandomly(); return false;"><b><i>click here</i></b></a>
            	</p>
            </div>
            <br>
    <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
        onclick="gotoPrevious(6, 3, 'version-1-course-x-lesson-6-page-21', false, -1)"> Previous </button>
     <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
        onclick="gotoNext(6, 3, 'version-1-course-x-lesson-6-page-21', false, -1)"> Next </button>
          </div>
	      </div>
	      </div>
	</section>
	
	<!-- learning outcome 3 program 3--->
	<section id="version-1-course-x-lesson-6-page-22" hidden>
	    <div class="row">
	    <div class="container">
	            <form action="">
	              <h3><b>Activity : Extend and Test Model as You Like</b></h3>
	                <ul class="lesson-list">
	                		<li class="sub-point" id="chosenElement">Extend model: add the knowledge about symbol to the model</li>
	                		<ul class="main-point">
	                			<li class="sub-point">Remember to write the comment first</li>
	                			<li class="sub-point">Then write the fact about this knowledge. </li>
	                		</ul>
	                	</ul>
	                <label for="ques1">Test your model: ask a query about Element.</label><br/>
	                <textarea id="program3" name="program3" rows="4" cols="50" class="knowledge-check-input"></textarea>
	                <br><br>
	                <br>
	                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
	                onclick="gotoPrevious(6, 3, 'version-1-course-x-lesson-6-page-22', false, -1)"> Previous </button>
	                <div class="text-center">
	                    <button class="btn btn-primary" style="margin-left: -15rem; background-color :#1b84f5;" onclick="submitAssessment('version-1-course-x-lesson-6-page-22', 'program3')"> Submit </button>
	                </div>
	            </form>
	        </div>
	        </div>
	    </div>
	
	</section>
<%@ include file = "footer1.jsp" %>
<script src="../js/lesson6/validations.js" type="text/javascript">  </script>
   </body>

</html>
