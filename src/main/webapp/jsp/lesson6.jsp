<html lang="en">

<head>
    <title>Lesson 6</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="../js/verifytoken.js" type="text/javascript">  </script>
	<link rel="stylesheet" href="../styles/lesson6.css">
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
	<%@ include file = "header.jsp" %>
    <section id="version-1-course-x-lesson-6-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1 style="text-align:center">  Lesson 6: Model periodic table - Atomic Number </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-2" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h1 class="text-primary"> Outline </h1>
                <ul>
                    <li>Atomic structure</li>                    
					<li>Model atomic number</li>
                </ul>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-2', false, -1)"> Next 
                </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-3" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Atomic Structure</h2>
                <ul>
                		<li>Matter</li>
                		<ul>
                			<li>The term matter describes all of the physical substances around us: your table, your body, a pencil, water, and so forth.</li>
                		</ul>
                		<li>Matter is made of atoms</li>
                		
                </ul>               
                <br>
                <div>
           			<img  class = "atomGif"   src="../images/lesson6/atomstructure.gif" alt="Image" width="105" height="90">
           		</div>
           		<br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-3', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-4" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Atomic Structure</h2>
                <div>
                	<img  class = "atom" id="atom" src="../images/lesson6/slide4.png" alt="Image">
           		</div>
                <ul>
                		<li>Atomic structure</li>
                		<ul>
                			<li>Nucleus</li>
                			<ul>
                				<li>Protons</li>
                				<li>Neutrons</li>
                			</ul>
                			<li>Electrons</li>
                		</ul>
                		
                </ul>               
                <br><br><br><br>
                <br><br><br><br><br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-4', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-4', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-5" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Atomic Structure</h2>
                <div>
           			<img  id = "atom" src="../images/lesson6/slide5.png" alt="Image">
           		</div>
                <ul>
                		<li>Electrons</li>
                		<ul>
                			<li>Tiny, very light particles</li>                			
                			<li>Move around the outside of the nucleus</li>
                		</ul>
                		
                </ul>               
                <br><br><br><br>
                <br><br><br><br><br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-5', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-5', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-6" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Atomic Structure</h2>
                <div>
          			<img  id = "atom" src="../images/lesson6/slide6.png" alt="Image">
          		</div>
                <ul>
                		<li>Protons</li>
                		<ul>
                			<li>A proton is much larger and heavier than an electron</li>                			
                			<li>A proton is located in the nucleus of the atom</li>
                		</ul>                		
                </ul>               
                <br><br><br><br>
                <br><br><br><br><br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-6', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-6', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-7" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Atomic Structure</h2>
                <div>
           			<img  id = "neutron" src="../images/lesson6/slide7.png" alt="Image">
           		</div>
                <ul>
                		<li>Neutrons</li>
                		<ul>
                			<li>A neutron is large and heavy like a proton</li>                			
                			<li>A neutron is located in the nucleus of the atom</li>
                		</ul>                		
                </ul>               
                <br><br><br><br>
                <br><br><br><br><br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-7', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-7', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-8" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            	<h2>The Atomic Number</h2>
                <div>
           			<img  id = "atomnumber" src="../images/lesson6/slide8.png" alt="Image">
           		</div>
                <ul>
               		<li><b>Atomic number</b></li>
               		<ul>
               			<li>The <b>atomic number</b> of an element is the number of <b>protons</b> of the atom of the element.</li>                			
               			<li>We can find the atomic number from periodic table.</li>
               		</ul>                		
                </ul>               
                <br><br><br><br>
                <br><br><br><br><br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-8', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-8', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-9" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            	<h2>Atomic Number - Carbon</h2>
                <div>
           			<img  id = "carbon" src="../images/lesson5/carbon.png" alt="Image" width="105" height="90" >
           		</div>
                <ul>
               		<li>Question</li>
               		<ul>
               			<li>What is the proton number of carbon ?</li>
               			<ul>
               				<li>The proton number of carbon is 6 it is shown on the top of the symbol.</li>
               			</ul>                			
               			<li>What is the atomic number of carbon?</li>
               			<ul>
               				<li>The atomic number of carbon is 6. Because the atomic number is equal to the number of protons in an element.</li>
               			</ul>
               		</ul>                		
                </ul>               
                <br><br><br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-9', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-9', false, -1)"> Next
                </a>
            </div>
        </div>
    </section>
    
    <!-- Lesson 6 assement 0 - program 0 -->
	<section id="version-1-course-x-lesson-6-page-10" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h3><b>Activity : Extend Periodic Table Model -- Atomic Numbers</b></h3>
                <ul>
                		<li>Add to the model the knowledge needed to answer your question (on atomic number of carbon).</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">What is the proton and atomic number of carbon ?</label><br/>
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-10', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-6-page-10', 'program0')"> Submit </a>
                    </div>
                    <a class="btn btn-primary pull-right"  style="margin: -35px; margin-right: 76px; background-color: lightcoral;"
	                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-10', false, -1)">Skip Pre-Assessment</a>
                </form>
            </div>
        </div>
    </section>
	<!-- onlineSPARC -->
	<!-- skipped 11,12 pages -->
	
	<!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-6-page-13" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2> Learning outcome 1</h2>
            <div>
   				<img  id = "carbon" src="../images/lesson6/hydrogen.png" alt="Image" width="105" height="90" >
			</div>
            <ul>
               		<li>Question</li>
               		<ul>
               			<li>What is the proton number of hydrogen ?</li>
               			<ul>
               				<li>The proton number of Hydrogen is 1 it is shown on the top of the symbol.</li>
               			</ul>                			
               			<li>What is the atomic number of Hydrogen?</li>
               			<ul>
               				<li>The atomic number of Hydrogen is 1. Because the atomic number is equal to the number of protons in an element.</li>
               			</ul>
               		</ul>                		
                </ul> 
                <br><br>   
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(6, 1, 'version-1-course-x-lesson-6-page-13', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(6, 1, 'version-1-course-x-lesson-6-page-13', false, -1)"> Next </a>
            </div>
        </div>  
    </section>
    
     <!-- Lesson 6 assement 1 - program 1 -->
	<section id="version-1-course-x-lesson-6-page-14" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h3><b>Activity : Extend Periodic Table Model -- Atomic Numbers</b></h3>
                <ul>
                		<li>Expand model: Add to the model the knowledge needed to answer your question (on atomic number of hydrogen).</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">What is the proton and atomic number of hydrogen ?</label><br/>
                    <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 1, 'version-1-course-x-lesson-6-page-14', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-6-page-14', 'program1')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
	<!-- onlineSPARC -->
	<!-- skipped 15,16 pages -->
	
	<!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-6-page-17" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 2</h2>
            <div>
   				<img  id = "carbon" src="../images/lesson6/oxygen.png" alt="Image" width="105" height="90" >
			</div>
            <ul>
               		<li>Question</li>
               		<ul>
               			<li>What is the proton number of  Oxygen?</li>
               			<ul>
               				<li>The proton number of oxygen is 8. it is shown on the top of the symbol</li>
               			</ul>                			
               			<li>What is the atomic number of oxygen?</li>
               			<ul>
               				<li>The atomic number of oxygen is 8. Because the atomic number is equal to the number of protons in an element.</li>
               			</ul>
               		</ul>                		
                </ul>  
                <br><br>   
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(6, 2, 'version-1-course-x-lesson-6-page-17', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(6, 2, 'version-1-course-x-lesson-6-page-17', false, -1)"> Next </a>
            </div>
        </div>  
    </section>
    
     <!-- Lesson 6 assement 2 - program 2 -->
	<section id="version-1-course-x-lesson-6-page-18" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h3><b>Activity : Extend Periodic Table Model -- Atomic Numbers</b></h3>
                <ul>
                		<li>Expand model: Add to the model the knowledge needed to answer your question (on atomic number of oxygen).</li>
                		<ul>
                			<li>Remember to write the comment first</li>
                			<li>Then write the fact about this knowledge. </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">What is the proton and atomic number of oxygen ?</label><br/>
                    <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(6, 2, 'version-1-course-x-lesson-6-page-18', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-6-page-18', 'program2')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->
	<!-- skipped 19,20 pages -->
    
    <!-- learning outcome 3 -->
    <section id="version-1-course-x-lesson-6-page-21" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
   			<h2>Learning outcome 3: Atomic number on more elements </h2>
            <ul>
            		<li>Can you ask a question similar to our earlier ones?</li> 
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
    <a class="btn btn-primary pull-left"
        onclick="gotoPrevious(6, 3, 'version-1-course-x-lesson-6-page-21', false, -1)"> Previous </a>
     <a class="btn btn-primary pull-right"
        onclick="gotoNext(6, 3, 'version-1-course-x-lesson-6-page-21', false, -1)"> Next </a>
          </div>
	      </div>
	</section>
	
	<!-- learning outcome 3 program 3--->
	<section id="version-1-course-x-lesson-6-page-22" class="container" hidden>
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
	                <textarea id="program3" name="program3" rows="4" cols="50" class="knowledge-check-input"></textarea>
	                <br><br>
	                <br>
	                <a class="btn btn-primary pull-left"
	                onclick="gotoPrevious(6, 3, 'version-1-course-x-lesson-6-page-22', false, -1)"> Previous </a>
	                <div class="text-center">
	                    <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-6-page-22', 'program3')"> Submit </a>
	                </div>
	            </form>
	        </div>
	    </div>
	
	</section>
<%@ include file = "footer.jsp" %>
<script src="../js/lesson6/validations.js" type="text/javascript">  </script>
   </body>

</html>
