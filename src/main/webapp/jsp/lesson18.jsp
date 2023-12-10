<html lang="en">

<head>
    <title>Lesson 18</title>
    <meta charset="utf-18">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	 <script src="../js/verifytoken.js" type="text/javascript">  </script>
	 <link rel="stylesheet" href="../styles/lesson8.css">
<script type="text/javascript">
$(function(){
    verifytoken();
});
</script>
    <link rel="stylesheet" href="../styles/style.css">
    <script src="../js/lessonDataStructureJSON.js"></script>
    <script src="../js/script.js"></script> 
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            font-size: 18px;
            overflow-x:hidden;
        }
 
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }
 
        h2 {
            font-size: 26px;
            margin-bottom: 20px;
            text-align: center;
            color: #0056b3;
        }
 
       
        section {
        margin-top:0!important;
        margin-left:0!important;
        min-height:100vh;
        }
 
        button.btn {
            width: 100px;
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(18);
  			 let currentSection = document.getElementById(firstPageIdOfCurrentLesson);
  			 currentSection.hidden = false;
  		}
  		else{
  			 let currentSection = document.getElementById(pageIdToShow);
  			 currentSection.hidden = false;
  		}           
    });    
        
        function massAnswer(){
        	var ans=document.getElementById("massNumber");
        	if(ans.value=='12'){
        	ans.style.backgroundColor="lightgreen"
        	}
        	else{
        		ans.style.backgroundColor="red"
        	}
        }
        function massAnswerAtomsOne(){
        	var ans=document.getElementById("cBox");
        	if(ans.value=='12'){
        	ans.style.backgroundColor="lightgreen"
        	}
        	else{
        		ans.style.backgroundColor="red"
        	}
        }
        function massAnswerAtomstwo(){
        	var ans=document.getElementById("wBox");
        	if(ans.value=='13'){
        	ans.style.backgroundColor="lightgreen"
        	}
        	else{
        		ans.style.backgroundColor="red"
        	}
        }
    </script>
	<%@ include file = "header1.jsp" %>
    <section id="version-1-course-x-lesson-18-page-1" hidden>
        <!-- <div class="row-center">
            <div class="col-md-18 content" >
            <h1 style="text-align:center" >  Lesson 18: Model Mass Numbers </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-1', false, -1)"> Next </a>
            </div>
        </div> 
         <div class="p-5 mb-4 bg-light rounded-3 content" style="box-shadow:3px 3px 3px 3px #888888;">
      		<div class="container-fluid py-5">
       		 <h2 class="fw-bold text-center"> Lesson 18: Model Mass Numbers</h2>
       
        	<button class="btn btn-primary btn-lg mx-auto" type="button" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-1', false, -1)" style="display:flex; margin-top:50px"> Start Lesson </button>
      </div>-->
      
      <div class="row">
            <div class="container" >
			<h2>Lesson 18: MODELING MASS NUMBER- ARITHMETIC OPERATIONS IN SPARC
			 </h2>
			<button class="btn btn-primary btn-lg mx-auto" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-1', false, -1)" style="display:flex; margin-top:50px;width:150px"> Start Lesson </button>
			</div>
			</div>
			
    </section>
    <section id="version-1-course-x-lesson-18-page-2" hidden>
        
      
      <div class="row">
            <div class="container" >
			<h2>OUTLINE
			 </h2>
			 <ul>  
	                    <li>Atomic Structure</li>                    
						<li>Modeling the Mass Number</li>
	                </ul>
			<div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-2', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-2', false, -1)">Next</button>
    </div>
			</div>
			</div>
			
    </section>
    
    <section id="version-1-course-x-lesson-18-page-3"  hidden>
        <div class="row">
            <div class="container" >
			<h2>Atoms and Their Mass Number </h2>
                
                <div>
                	<img  class = "massNumberAtom" id="massNumberAtom" src="../images/lesson18/lesson18image1.png" alt="Image">
           		</div>
                <li> Atom </li>
	                <ul>  
	                           
						<li>Recall that an atom consists of a nucleus and electrons</li>
						<ul>  
	                           
						<li>A nucleus consists of a set of protons and neutrons
</li>
	                </ul>
	                </ul>
                <li>Mass number of an atom</li>  
                <ul>                	
                    <li>mass number  = proton number + neutron number</li>                    
                </ul>
                <li>Example:An atom with 6 protons and 6 neutrons. </li>  
                 <ul>                	
                    <li>mass number of the atom</li>   
                    <div id="hydrogenprotronnumber" class="form-group">
					  <input id="massNumber" type="text" class="form-control" required onkeypress="massAnswer()">
					</div>                 
                </ul>
                <li>Example:An atom with 6 protons and 7  neutrons. </li>  
                 <ul>                	
                    <li>mass number of the atom</li>   
                    <div id="hydrogenprotronnumber" class="form-group">
					  <input id="massNumber" type="text" class="form-control" required onkeypress="massAnswer()">
					</div>                 
                </ul>
				
				<div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-3', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-3', false, -1)">Next</button>
    </div>
				
                
            </div>
        </div>
        
      <!--  <div class="p-5 mb-4 bg-light rounded-3 content" style="box-shadow:3px 3px 3px 3px #888888;">
      		<div class="container-fluid py-5">
       		 <h2 class="fw-bold text-center">  Atoms and Their Mass Number </h2>
       		  <div>
                	<img  class = "massNumberAtom" id="massNumberAtom" src="../images/lesson8/Picture6.png" alt="Image">
           		</div> 
       		 <li> Atom </li>
	                <ul>  
	                    <li>On proton numbers</li>                    
						<li>Recall that an atom consists of a nucleus and electrons</li>
	                </ul>
                <li>Mass number of an atom</li>  
                <ul>                	
                    <li>mass number  = proton number + neutron number</li>                    
                </ul>
                <li>Example:An atom with 6 protons and 6 neutrons. </li>  
                 <ul>                	
                    <li>mass number of the atom</li>   
                    <div id="hydrogenprotronnumber" class="form-group">
					  <input id="massNumber" type="text" class="form-control" required onkeypress="massAnswer()">
					</div>                 
                </ul>
                <div class="space">
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-2', false, -1)"> Next 
                </a>
            </div>
      </div> -->
    </section>
    
    

   
	
	<!-- learning outcome 1  -->
    <section id="version-1-course-x-lesson-18-page-10"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Isotopes</h2>
            <img  class = "massNumberAtom" id="massNumberAtom" src="../images/lesson8/Picture6.png" alt="Image">

				<li>Isotopes</li>
				<ul>
					<li>Substances whose atoms have the same proton numbers but
						possibly different neutron numbers are called isotopes.</li>
				</ul>
				
					<li><b>For example,</b></li>
					<ul>
					we have following substances with :
					<li>atoms with 6 protons and 6 neutrons</li>
					<li>atoms with 6 protons and 7 neutrons</li>
					</ul>
					<!-- <div id="ruleAssignment" class="form-group">
						 <input id="fBox" type="text" class="form-control" required> 
					</div>
					<div id="cAnswer"></div>--> 
					
				
				<ul>
					<li>Are they isotopes? 
					</li>
					<li>Can you explain why or why not?
					</li>
					</ul>
				   
				<div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-10', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-10', false, -1)">Next</button>
    </div>
          <!--   <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 1, 'version-1-course-x-lesson-18-page-10', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 1, 'version-1-course-x-lesson-18-page-10', false, -1)"> Next </a>-->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-11" hidden>
        <div class="row">
            <div class="container" >
            <!-- <img src="../images/lesson8/picture 2.png" alt="Image" width="500" height="250">  -->
             <h2 class="text-center">Isotopes and Elements</h2>
             <div>
                	<img  class = "massNumberAtom" id="image2" src="../images/lesson18/lesson18image3.jpg" alt="Image">
           		</div>
           		
             	<li>Elements</li>
             	<ul>
             		<li>We take all substances that are  isotopes as the same element.</li>
             		<li>In the example above, those both isotopes are called Carbon element (because of the proton number 6).</li>
             	</ul>
             	
             <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-11', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-11', false, -1)">Next</button>
    </div>  
         <!--    <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 1, 'version-1-course-x-lesson-18-page-11', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 1, 'version-1-course-x-lesson-18-page-11', false, -1)"> Next </a>
            </div>-->
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-12"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Elements and atoms</h2>
            <div>
                	<img  style="float:right;width: 240px;height: 125px;" id="image" src="../images/lesson18/lesson18image4.png" alt="Image">
           		</div>
            <li>Isotope names</li>
            <ul>            
            	<li>Consider earlier example</li> 
            	<ul>
		            <li>atom with 6 protons and 6 neutrons</li>
		            <li>atom with 6 protons and 7 neutrons </li> 
             	</ul>
             	 <!-- <li>The mass number of the first atom 12 : <input id="cBox" type="text" class="form-control" required> <div id="fAnswer"></div></li> -->            	 
             	 <li>What is the mass number of the first atom? <input id="cBox" type="text" class="form-control" required onkeypress="massAnswerAtomsone()"> <div id="fAnswer"></div></li>
             	 <!-- <li>The mass number of the second atom 13: <input id="wBox" type="text" class="form-control" required>  <div id="yAnswer"></div></li>-->
             	 <li>What is the mass number of the second atom? <input id="wBox" type="text" class="form-control" required onkeypress="massAnswerAtomstwo()">  <div id="yAnswer"></div></li>
             	<li>We call the first isotope Carbon-12 (12 is the mass number)</li>
				<li>We call the second isotope Carbon-13</li>
             </ul>					
			
                	</ul>
             <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-12', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-12', false, -1)">Next</button>
    </div>    
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 1, 'version-1-course-x-lesson-18-page-12', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 1, 'version-1-course-x-lesson-18-page-12', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-13"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Atomic Mass of an Element</h2>
            <!-- <img src="../images/lesson8/picture 3.png" alt="Image" width="500" height="250"> -->
            <div>
                	<img  style="float:right;width: 100px;height: 100px;margin-left:15px" id="image" src="../images/lesson18/lesson18image5.png" alt="Image">
           		</div>
           		<div>
                	<img  style="float:right;width: 100px;height: 100px;" id="image" src="../images/lesson18/lesson18image6.png" alt="Image">
           		</div>
            <ul>
            	<li>The periodic table has one cell for each element. But we could have several isotopes of this element.</li>
            	<li>The atomic mass of an element is the weighted average of the mass number of the atoms of all isotopes of this element.</li>
            	<li>For example, </li>
            	<ul>
            	<li>for Carbon element, assume it has two isotopes: Carbon-12 and Carbon-13.</li><li> Assume the portion of Carbon-12 among all Carbon isotopes is 30% and that of Carbon-13 is 70%.</li><li> Then the atomic mass of Carbon element is 12*0.3 + 13*0.7 = 12.7</li>
            	</ul>
            </ul>
            
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-13', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-13', false, -1)">Next</button>
    </div>      
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 1, 'version-1-course-x-lesson-18-page-13', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 1, 'version-1-course-x-lesson-18-page-13', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-14"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Atomic Mass of an Element</h2>
            <div>
                	<img  style="float:right;width: 240px;height: 100px;" id="image" src="../images/lesson18/lesson18image7.png" alt="Image">
           		</div>
            <ul>            
            	<li>In the periodic table, atomic mass is given for each element. </li> 
            	<li>In the cell of an element given below, the atomic mass is given at the top right corner. 
            	</li>  
            	<li>For example, </li>
            	<ul>
            	<li> for the hydrogen element, its atomic mass is 1.0078 
            	</li>
            	<li> What is the atomic mass of Carbon element?
            	</li>
            	</ul>
             	</ul>				
			
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-14', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-14', false, -1)">Next</button>
    </div>    
           
            </div>
        </div>  
    </section>
    
     <!-- Lesson 18 assement 2 - program 2 -->
	<section id="version-1-course-x-lesson-18-page-15"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">IDENTIFY ATOMIC MASS FROM PERIODIC TABLE</h2>
            <div>
                	<img  style="float:right;width: 200px;height: 100px;" id="image" src="../images/lesson18/lesson18image8.png" alt="Image">
           		</div>
            <ul>            
            	<li>In the earlier periodic table cell example, the atomic mass is given at the top right corner. But it might not always be the case for all periodic tables. For some periodic table, it may be at top left or bottom. (Usually a key, or legend, is given in a periodic table on where it is located.) 
</li> 
            	<li>On the left is a cell, on the right is the legend/key. 
 
            	</li>  
            	
             	</ul>				
			
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-15', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-15', false, -1)">Next</button>
    </div>    
           
            </div>
        </div> 
    </section>
    <!-- onlineSPARC -->
	<!-- skipped 16,17 pages -->
    
    <!-- learning outcome 2  
    <section id="version-1-course-x-lesson-18-page-17"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Learning outcome 2 : From mass number and protons to neutrons of an atom</h2>-->
            <!-- <img src="../images/lesson8/picture 4.png" alt="Image" width="500" height="250"> 
            <li>Questions</li>
            <ul>
            	<li>We know a hydrogen atom has 1 proton.</li>
            	<li>We know its mass number is 2.</li>
            	<li>What is the number of neutrons in a hydrogen atom?</li>
            </ul>
            <li>By definition: Mass number = proton number + neutron number.</li>
            <li>So, Neutron number = Mass number - proton number.</li>
            <li>Therefore, the neutron number of hydrogen = 2 - 1 = 1</li>
               <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 2, 'version-1-course-x-lesson-18-page-17', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 2, 'version-1-course-x-lesson-18-page-17', false, -1)">Next</button>
    </div>   -->  
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 2, 'version-1-course-x-lesson-18-page-17', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 2, 'version-1-course-x-lesson-18-page-17', false, -1)"> Next </a> 
            </div>
        </div>  
    </section>-->
    <section id="version-1-course-x-lesson-18-page-18"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">MASS NUMBER</h2>
            <ul>
        			<li>To find the typical mass number of an element, we use its atomic mass and apply the standard rounding rule to nearest whole number.
					</li>
               		
               		<li>For example, a Carbon atom has a typical mass number is 12. 
 					</li>
               		<li>Is 1 the mass number of a hydrogen atom?
               		</li>	
               		</ul>	  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-18', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-18', false, -1)">Next</button>
    </div>      
           
            </div>
        </div>  
    </section>
    
   
	<!-- learning outcome 2 program 2--->
	<section id="version-1-course-x-lesson-18-page-19"  hidden>
	    <div class="row">
            <div class="container" >
            <h2 class="text-center">Develop a computer model for mass number of an element </h2>
            <ul>
        			<li>To find the typical mass number of an element, we use its atomic mass and apply the standard rounding rule to nearest whole number.
					</li>
               		
               		<li>For example, a Carbon atom has a typical mass number is 12. 
					 </li>
               		<li>Is 1 the mass number of a hydrogen atom?
               		</li>		 
               		</ul> 
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-19', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-19', false, -1)">Next</button>
    </div>      
           
            </div>
        </div> 
	
	</section>
	<!-- onlineSPARC -->
	<!-- skipped 21,22 pages -->
	<!-- #learning outcome 3//4 -->
	 <section id="version-1-course-x-lesson-18-page-22"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Writing comments and rules for the computer model.</h2>
            <ul>
        			<li>The computer model needs to know about the knowledge that need to be involved to answer our question.

					</li>
               		<ul>
               		<li>For example: The mass number of hydrogen is 1.
 
					 </li>
               		<li>In SPARC we write

               		</li>	
               		<ul>
               		<li>% The mass number of hydrogen is 1
               		
               		</li>
               		</ul>
               		<li>Now, we need a fact for computer model to understand the knowledge
               		</li>
               		<ul>
               		<li>
               		In SPARC we called a rule.
               		</li>
               		<ul>
               		<li>massNumber(hydrogen,1).
               		</li>
               		<li>We need the full stop "." at the end of the rule to teach the computer model that is the end of the knowledge.
               		</li>
               		</ul>
               		</ul>
               		</ul>	
       
            </ul> 
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-22', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-22', false, -1)">Next</button>
    </div>      
           
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-23"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Test the computer model </h2>
        			<ul>
        			<li>After teaching the computer model the fact(s), we need to verify the knowledge of the computer model.
        			</li>
        			<li>To verify the knowledge, we need to ask a question. However, in the symbolic world of the computer model, we need to write a query
        			</li>
        			<ul>
        			<li>In SPARC we write:
        			</li>
        			<ul>
        			<li>massNumber(hydrogen, 1)? to make sure that the mass number of hydrogen is 1. The computer model should answer "True".
        			
        			</li>
        			<li>massNumber(hydrogen, X)? to find an answer for the value of the variable X (unknown variable).
        			</li>
        			</ul>
        			</ul>
        			</ul>		  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-23', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-23', false, -1)">Next</button>
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-24"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">NEUTRON NUMBER </h2>
        			<ul>
        			<li>Questions</li>
        			<ul>
        			<li>We know hydrogen has 1 proton.</li>
        			<li>We know its mass number is 2.
        			</li>
        			<li>What is the number of neutrons in a hydrogen atom?
        			</li>
        			
        			</ul>
        			<li>By definition: Mass number = proton number + neutron number. 
        			</li>
        			<li>So, Neutron number = Mass number - proton number. 
        			</li>
        			<li>Therefore, the neutron number of hydrogen = 2 - 1 = 1
        			</li>
        			</ul>	  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-24', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-24', false, -1)">Next</button>
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-25"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Develop a computer model for obtaining neutron number from mass number and proton number  </h2>
        			<ul>
        			<li>We need to teach the computer model knowledge that need to be involved to answer for the question.
        			</li>
        			<ul>
        			<li>in English: The neutron number of an element is its mass number minus its proton number.
        			</li>
        			<li>in SPARC: we need to use comments, facts (rules) to represent the knowledge with its syntax.
        			</li>
        			</ul>
        			</ul>	  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-25', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-25', false, -1)">Next</button>
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-26"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Modeling Methodology of Using Unknown Variables Relations Objects</h2>
        			<ul>
        			<li>We need to identify objects based on the knowledge.
        			</li>
        			<ul>
        			<li>E: an element.
        			</li>
        			<li>NP: the proton number of E.
        			
        			</li>
        			<li>NM: The mass number of E
        			</li>
        			<li>NN: the neutron number of E
        			</li>
        			</ul>
        			</ul>	  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-26', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-26', false, -1)">Next</button>
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-27"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Modeling Methodology of Using Unknown Variables Relation</h2>
        			<ul>
        			<li>We need to identify objects based on the knowledge.
        			</li>
        			<ul>
        			<li>NN: the neutron number of E: neutronN(E, NP).
        			</li>
        			<li>NM: the mass number of E: massN(E, NP).
        			
        			</li>
        			<li>NP: the proton number of E: protonN(E, NP)
        			</li>
        			<li>NP = NM - NN.
        			</li>
        			</ul>
        			</ul>	  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-27', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-27', false, -1)">Next</button>
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-28"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Modeling Methodology of Using Unknown Variables
Relation Instances</h2>
        			<ul>
        			<li>Now, we need to find out the relation instances related. Assuming we know the mass number and proton number of a element. 
        			</li>
        			<ul>
        			<li>Which relation instances imply which one?
        			</li>
        			<li>We can start with the fact:</li>
        			<ul>
        			<li>neutronN(E, NN) if massN(E, NM) and protonN(E, NP) and NP = NM - NN.
        			</li>
        			<li>The meaning of the fact we called it intended specification</li>
        			<ul>
        			<li>The number of neutrons of element E is NN if the mass number is NM and the number of protons of element E is NP and NP = NM - NN
        			</li>
        			</ul>
        			<li>In SPARC, we can use a comment and rule to represent the fact.
        			</li>
        			<ul><li>neutronN(E, NP) :- massN(E,NM), protonN(E, NP), NP = NM - NN.</li></ul>
        			</ul>
        			</ul>
        			</ul>  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-28', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(18, 0, 'version-1-course-x-lesson-18-page-28', false, -1)">Next</button>
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-18-page-29"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Summary</h2>
        			<ul>
        			<li>We learned/reviewed neutron numbers, proton numbers, and the definition of mass numbers of atoms. 
        			</li>
        			<li>We learned concepts of isotopes and elements. </li>
        			<li>We develop intelligent models which can answer questions about mass number and neutron number of an element!</li>
        			<li>We learn more complex rules to represent knowledge!</li>
        			</ul>	  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(18, 0, 'version-1-course-x-lesson-18-page-29', false, -1)">Previous</button>
        
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(18, 3, 'version-1-course-x-lesson-18-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <!-- <section id="version-1-course-x-lesson-18-page" class="container" hidden>
	    <div class="row-center">
	        <div class="col-md-6 content" >
	            <form action="">
	              <h3 class="text-center"><b>Activity : Mass numbers from protons and neutron</b></h3>
	                <ul>
	                		<li>Activity : Extend and test as you like</li>
	                	</ul>
	                <label for="ques1">write the relation between mass number, proton number and atomic number of the element N?"</label><br/>
	                <textarea id="program4" name="program4" rows="4" cols="50" class="knowledge-check-input"></textarea>
	                <br><br>
	                <br>
	                <a class="btn btn-primary pull-left"
	                onclick="gotoPrevious(18, 3, 'version-1-course-x-lesson-18-page-24', false, -1)"> Previous </a>
	                <div class="text-center">
	                    <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-18-page-24', 'program4')"> Submit </a>
	                </div>
	            </form>
	        </div>
	    </div>
	
	</section>
 -->
<!-- onlineSPARC -->
<!-- skipped 26.27 pages -->
<%@ include file = "footer1.jsp" %>
<script src="../js/lesson8/validations.js" type="text/javascript">  </script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   </body>

</html>
