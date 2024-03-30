<html lang="en">

<head>
    <title>Lesson 8</title>
    <meta charset="utf-8">
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
    </style>  
</head>

<body>
    <script type="text/javascript"> 
        $( document ).ready(function() { 
            sessionStorage.removeItem(sessionKeyIsAssessmentPassed);
            sessionStorage.removeItem(sessionKeyIsSparcPassed);
            

        let pageIdToShow= sessionStorage.getItem(sessionKeyShowPageId);
  		if(pageIdToShow== null || pageIdToShow == '' || pageIdToShow == undefined){
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(8);
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
    <section id="version-1-course-x-lesson-8-page-1" hidden>
        <!-- <div class="row-center">
            <div class="col-md-8 content" >
            <h1 style="text-align:center" >  Lesson 8: Model Mass Numbers </h1> <br>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 0, 'version-1-course-x-lesson-8-page-1', false, -1)"> Next </a>
            </div>
        </div> 
         <div class="p-5 mb-4 bg-light rounded-3 content" style="box-shadow:3px 3px 3px 3px #888888;">
      		<div class="container-fluid py-5">
       		 <h2 class="fw-bold text-center"> Lesson 8: Model Mass Numbers</h2>
       
        	<button class="btn btn-primary btn-lg mx-auto" type="button" onclick="gotoNext(8, 0, 'version-1-course-x-lesson-8-page-1', false, -1)" style="display:flex; margin-top:50px"> Start Lesson </button>
      </div>-->
      
      <div class="row">
            <div class="container" >
			<h2>Lesson 8: Model Mass Numbers </h2>
			<button class="btn btn-primary btn-lg mx-auto" onclick="gotoNext(8, 0, 'version-1-course-x-lesson-8-page-1', false, -1)" style="display:flex; margin-top:50px;"> <p style="width:100%; text-align:center;margin:0">Next </p> </button>
			</div>
			</div>
			
    </section>
    
    <section id="version-1-course-x-lesson-8-page-2"  hidden>
        <!-- <div class="row-center">
            <div class="col-md-6 content" style="margin-bottom:20px" >
                <h1 class="text-primary text-center"> Atoms and Their Mass Number </h1>
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
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(8, 0, 'version-1-course-x-lesson-8-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(8, 0, 'version-1-course-x-lesson-8-page-2', false, -1)"> Next 
                </a>
            </div>
        </div> -->
        <div class="row">
            <div class="container" >
			<h2>Atoms and Their Mass Number </h2>
                
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
				
				<div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 0, 'version-1-course-x-lesson-8-page-2', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 0, 'version-1-course-x-lesson-8-page-2', false, -1)">Next</button>
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
                    onclick="gotoPrevious(8, 0, 'version-1-course-x-lesson-8-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(8, 0, 'version-1-course-x-lesson-8-page-2', false, -1)"> Next 
                </a>
            </div>
      </div> -->
    </section>
    
    

    <!-- Lesson 8 assement 0 - program 0 -->
	<section id="version-1-course-x-lesson-8-page-3" hidden>
        <div class="row">
            <div class="container mt-5" >
                <h2>Activity : From mass number and proton number to neutron number </h2>
                <ul>
                		<li>Assume we use MassNumber(X, Y) and protonsOf(X, Y) to denote the symbol for element X is Y. Build a model for the relationship between neutron,proton and mass number, proton and atomic number of Element E</li>
                	</ul>
                <form action="">
                    <label for="ques1">write the relation rule between neutrons, protrons and mass number of an element N?</label><br/>
                    <textarea id="program0" name="program0" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    
                    <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(7, 0, 'version-1-course-x-lesson-8-page-3', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(7, 0, 'version-1-course-x-lesson-7-page-4', false, -1)">Next</button>
    </div>
                  <!--    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(7, 0, 'version-1-course-x-lesson-8-page-3', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-8-page-3', 'program0')"> Submit </a>
                    </div>
                    <a class="btn btn-primary pull-right"  style="margin: -35px; margin-right: 76px; background-color: lightcoral;"
	                    onclick="gotoNext(7, 0, 'version-1-course-x-lesson-7-page-4', false, -1)">Skip Pre-Assessment</a> -->
                </form>
            </div>
        </div>
    </section>
	<!-- onlineSPARC -->
	<!-- skipped 4,5 pages -->
	
	<!-- learning outcome 1 -->
    <!-- <section id="version-1-course-x-lesson-8-page-6" class="container" hidden>
        <div class="row-center">
            <div class="col-md-6 content" >
            <h2> Learning outcome 1:Mass Number</h2>
               		<ul>
               			<li>Mass number: The Mass number of an element is addition of proton and neutron number of an element . </li>
               			</ul>
               			<li>Type the knowledge as fact </li>
               		<div id="knowledgeAssignment" class="form-group">
					  <input id="massNumHBox" type="text" class="form-control" required>
					</div>
					<div id="eAnswer"></div>
               		<li>Type the fact/rule to represent that knowledge </li>
               		<div id="ruleAssignment" class="form-group">
					  <input id="massNumPBox" type="text" class="form-control" required></div>
					<div id="pAnswer"></div>
               				
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-6', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-6', false, -1)"> Next </a>
            </div>
        </div>  
    </section> -->
    
     <!-- Lesson 8 assement 1 - program 1 -->
	<section id="version-1-course-x-lesson-8-page-7" class="container" hidden>
        <div class="row-center">
            <div class="col-md-6 content" >
                <h3><b>Activity : Extend Periodic Table Model -- Mass Numbers</b></h3>
                <ul>
                		<li>Expand model: Add to the model the knowledge needed to answer your question (on Mass number of hydrogen).</li>
              
                	</ul>
                <form action="">
                    <label for="ques1">Write the query about the Mass Number of hydrogen?</label><br/>
                    <textarea id="program1" name="program1" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-7', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-8-page-7', 'program1')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
	<!-- onlineSPARC -->
	<!-- skipped 8,9 pages -->
	
	<!-- learning outcome 1  -->
    <section id="version-1-course-x-lesson-8-page-10"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Learning outcome 1:Isotopes</h2>
            <img  class = "massNumberAtom" id="massNumberAtom" src="../images/lesson8/Picture6.png" alt="Image">

				<li>Isotopes</li>
				<ul>
					<li>Substances whose atoms have the same proton numbers but
						possibly different neutron numbers are called isotopes.</li>
				</ul>
				<ul>
					<li>For example,</li>
					<li>we have following substances with :</li>
					<li>atoms with 6 protons and 6 neutrons</li>
					<li>atoms with 6 protons and 7 neutrons</li>
					<div id="ruleAssignment" class="form-group">
						<!-- <input id="fBox" type="text" class="form-control" required>--> 
					</div>
					<div id="cAnswer"></div>
				</ul>
				   
				<div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-10', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-10', false, -1)">Next</button>
    </div>
          <!--   <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-10', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-10', false, -1)"> Next </a>-->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-8-page-11" hidden>
        <div class="row">
            <div class="container" >
            <!-- <img src="../images/lesson8/picture 2.png" alt="Image" width="500" height="250">  -->
             <h2 class="text-center">Isotopes and Elements</h2>
             	<li>Isotopes</li>
           		<ul>
           			<li>(example)Below Substances are isotopes with</li>
           			<ul>
           				<li>atom with 6 protons and 6 neutrons</li>
           				<li>atom with 6 protons and 7 neutrons</li>
           			</ul>
     
           		</ul>
             	<li>Elements</li>
             	<ul>
             		<li>We take all substances that are  isotopes as the same element.</li>
             		<li>In the example above, those both isotopes are called Carbon element (because of the proton number 6).</li>
             	</ul>
             <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-11', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-11', false, -1)">Next</button>
    </div>  
         <!--    <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-11', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-11', false, -1)"> Next </a>
            </div>-->
        </div>  
    </section>
    <section id="version-1-course-x-lesson-8-page-12"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Elements and atoms</h2>
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
        <button class="btn btn-primary" onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-12', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-12', false, -1)">Next</button>
    </div>    
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-12', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-12', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-8-page-13"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Atomic Mass of an Element</h2>
            <!-- <img src="../images/lesson8/picture 3.png" alt="Image" width="500" height="250"> -->
            <ul>
            	<li>The periodic table has one cell for each element. But we could have several isotopes of this element.</li>
            	<li>The atomic mass of an element is the weighted average of the mass number of the atoms of all isotopes of this element.</li>
            	<li>For example, for Carbon element, assume it has two isotopes: Carbon-12 and Carbon-13. Assume the portion of Carbon-12 among all Carbon isotopes is 30% and that of Carbon-13 is 70%. Then the atomic mass of Carbon element is 12*0.3 + 13*0.7 = 12.7</li>
            </ul>
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-13', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-13', false, -1)">Next</button>
    </div>      
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-13', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-13', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-8-page-14"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Elements and atoms</h2>
            <li>Questions</li>
            <ul>            
            	<li>Is 1 the mass number of a typical hydrogen atom ?</li> 
            	<li>We use approximation and the periodic table to answer this question. The approximation is by the standard rounding rule. So, the answer is yes.</li>  
             	</ul>				
			
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-14', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-14', false, -1)"disabled>Next</button>
    </div>    
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-14', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 1, 'version-1-course-x-lesson-8-page-14', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    
     <!-- Lesson 8 assement 2 - program 2 -->
	<section id="version-1-course-x-lesson-8-page-15" class="container" hidden>
        <div class="row-center">
            <div class="col-md-6 content" >
                <h3 class="text-center"><b>Activity : Extend and test as you like</b></h3>
                <ul>
                		<li>Atmoic Mass number for other element atoms</li>
                		<ul>
                			<li>Further extend your model about Atomic mass number of other elements</li>
                			<li>Test your model  </li>
                		</ul>
                	</ul>
                <form action="">
                    <label for="ques1">What is the atmoic mass number  of the hydrogen of element H?</label><br/>
                    <textarea id="program2" name="program2" rows="4" cols="50" class="knowledge-check-input"></textarea>
                    <br><br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(8, 1, 'version-1-course-x-lesson-8-page-15', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-8-page-15', 'program2')"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->
	<!-- skipped 16,17 pages -->
    
    <!-- learning outcome 2  -->
    <section id="version-1-course-x-lesson-8-page-17"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Learning outcome 2 : From mass number and protons to neutrons of an atom</h2>
            <!-- <img src="../images/lesson8/picture 4.png" alt="Image" width="500" height="250"> -->
            <li>Questions</li>
            <ul>
            	<li>We know a hydrogen atom has 1 proton.</li>
            	<li>We know its mass number is 2.</li>
            	<li>What is the number of neutrons in a hydrogen atom?</li>
            </ul>
            <li>By definition: Mass number = proton number + neutron number.</li>
            <li>So, Neutron number = Mass number - proton number.</li>
            <li>Therefore, the neutron number of hydrogen = 2 - 1 = 1</li>
            <br>
               <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 2, 'version-1-course-x-lesson-8-page-17', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 2, 'version-1-course-x-lesson-8-page-17', false, -1)">Next</button>
    </div>     
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 2, 'version-1-course-x-lesson-8-page-17', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 2, 'version-1-course-x-lesson-8-page-17', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-8-page-18"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Learning outcome 2</h2>
        			<li>Type the knowledge as fact </li>
               		<div id="knowledgeAssignment" class="form-group">
					  <input id="yBox" type="text" class="form-control" required>
					</div>
					<div id="zAnswer"></div>
               		<li>Type the fact/rule to represent that knowledge </li>
               		<div id="ruleAssignment" class="form-group">
					  <input id="gBox" type="text" class="form-control" required></div>
					<div id="nAnswer"></div>	
					<br>	  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 2, 'version-1-course-x-lesson-8-page-18', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 2, 'version-1-course-x-lesson-8-page-18', false, -1)">Next</button>
    </div>      
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 2, 'version-1-course-x-lesson-8-page-18', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right" 
                onclick="gotoNext(8, 2, 'version-1-course-x-lesson-8-page-18', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    
   
	<!-- learning outcome 2 program 2--->
	<section id="version-1-course-x-lesson-8-page-19" class="container" hidden>
	    <div class="row-center">
	        <div class="col-md-6 content" >
	            <form action="">
	              <h3 class="text-center"><b>Activity : From mass number and proton number to neutron number</b></h3>
	               
	                		<ul>
	                			<li>Extend Model</li>
	                			<li>Test your model </li>
	                		</ul>
	                	</ul>
	                <label for="ques1">write the relation between neutrons, mass number and protrons  of the element N?</label><br/>
	                <textarea id="program3" name="program3" rows="4" cols="50" class="knowledge-check-input"></textarea>
	                <br><br>
	                <br>
	                <a class="btn btn-primary pull-left"
	                onclick="gotoPrevious(8, 2, 'version-1-course-x-lesson-8-page-19', false, -1)"> Previous </a>
	                <div class="text-center">
	                    <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-8-page-19', 'program3')"> Submit </a>
	                </div>
	            </form>
	        </div>
	    </div>
	
	</section>
	<!-- onlineSPARC -->
	<!-- skipped 21,22 pages -->
	<!-- #learning outcome 3//4 -->
	 <section id="version-1-course-x-lesson-8-page-22"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Learning Outcome 3</h2>
            <h3 class="text-center">Practice: From protons and neutrons to mass number</h3>
       		<!-- <img src="../images/lesson8/picture 5.png" alt="Image" width="500" height="250"> -->
       		<li>New Questions</li>
       		<ul>
       			<li>We know a carbon atom has</li>
       			<ul>
       				<li>6 protons, and</li>
       				<li>11 neutrons.</li>
       			</ul>
       			<li>What is the mass number of this carbon atom?</li>
       			<li>What knowledge did we use to answer this question?</li>       			       			
       		</ul>
       		
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 3, 'version-1-course-x-lesson-8-page-22', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 3, 'version-1-course-x-lesson-8-page-22', false, -1)">Next</button>
    </div>   
            <!-- <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 3, 'version-1-course-x-lesson-8-page-22', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 3, 'version-1-course-x-lesson-8-page-22', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-8-page-23"  hidden>
        <div class="row">
            <div class="container" >
            <h2 class="text-center">Learning outcome 3</h2>
        			<li>Type the knowledge as fact </li>
               		<div id="knowledgeAssignment" class="form-group">
					  <input id="iBox" type="text" class="form-control" required>
					</div>
					<div id="uAnswer"></div>
               		<li>Type the fact/rule to represent that knowledge </li>
               		<div id="ruleAssignment" class="form-group">
					  <input id="exBox" type="text" class="form-control" required></div>
					<div id="exAnswer"></div>		  
                <div class="d-flex justify-content-between">
        <button class="btn btn-primary" onclick="gotoPrevious(8, 3, 'version-1-course-x-lesson-8-page-23', false, -1)">Previous</button>
        <button class="btn btn-primary" onclick="gotoNext(8, 3, 'version-1-course-x-lesson-8-page-23', false, -1)">Next</button>
    </div>      
           <!--  <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(8, 3, 'version-1-course-x-lesson-8-page-23', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(8, 3, 'version-1-course-x-lesson-8-page-23', false, -1)"> Next </a> -->
            </div>
        </div>  
    </section>
    <section id="version-1-course-x-lesson-8-page-24" class="container" hidden>
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
	                onclick="gotoPrevious(8, 3, 'version-1-course-x-lesson-8-page-24', false, -1)"> Previous </a>
	                <div class="text-center">
	                    <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment('version-1-course-x-lesson-8-page-24', 'program4')"> Submit </a>
	                </div>
	            </form>
	        </div>
	    </div>
	
	</section>

<!-- onlineSPARC -->
<!-- skipped 26.27 pages -->
<%@ include file = "footer1.jsp" %>
<script src="../js/lesson8/validations.js" type="text/javascript">  </script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   </body>

</html>
