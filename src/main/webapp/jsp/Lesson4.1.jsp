<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lesson 4.1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

	 <link rel="stylesheet" href="../styles/lesson4.css">
	 <style>

	 .scrollableDiv{
	 		height: 400px;
	 		overflow-y:auto;
	 		overflow-x:hidden;  
	 }
    
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
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(4.1);
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
	 <section id="version-1-course-x-lesson-4.1-page-1" hidden>
        <div class="row">
            <div class="container">
            <h1 style="text-align:center">  Lesson 4.1:  Variables and Rules</h1> <br>
            <div class="d-flex pull-right">
        			<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-1', false, -1)">Next</button>
        	</div>
            
            </div>
        </div>
    </section>
    
        <section id="version-1-course-x-lesson-4.1-page-2" hidden>
        <div class="row">
            <div class="container">
            <h2 class="text-primary" style="text-align:center;">Recall The Family Example</h2>
                    <li> <strong>We know </strong></li>
                    <ul style="Margin:0;Padding:0;padding-left: 20px;">
                        <li style="list-style-type: none; padding:0;margin:0;"> John is the father of Peter&sbquo;Sarah and Linda </li>
                    </ul>
                    <br>

                    <li><strong> Question on Dad</strong> </li>
                    <ul style="Margin:0;Padding:0;padding-left: 20px;">
                        <li style="list-style-type: none;"> Who is dad of Peter? </li>
                    </ul>
                    <br>
            
                    <li>What general knowledge do we know to answer these questions? </li>
                    <br>
                
           <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-2', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-2', false, -1)">Next</button>
        	</div> 
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-4.1-page-3" hidden>
        <div class="row">
            <div class="container">   
            <h2 class="text-primary" style="text-align:center;">Knowledge</h2>  
               <ul class="lesson-list">      
            	<li class="main-point">Knowledge on particular objects and relations</li> 
            	<ul class="sub-points" style="list-style-type:circle">
		            <li> Relation instance of father relation with two objects: John and Peter</li>
		            <ul style="list-style-type:square">
		            <li>father(john,peter)</li>
		            </ul>
		            <li>Relation instance of dad relation with two objects: John and Peter</li> 
		            <ul style="list-style-type:square">
		            <li>dad(john,peter)</li>
		            </ul>
		        
             	</ul>
		        <li class="main-point">Knowledge not restrict to particular objects</li>
		        <ul class="sub-points" style="list-style-type:circle">
		        <li class="main-point">we call this general knowledge (or abstract knowledge)</li>
		        <li class="main-point">Usually such knowledge involves &ldquo;variables&rdquo; which are not  particular objects but refer to an object. E.g., a city is in a state.</li>
		        <li class="main-point">To represent general knowledge, we need variables (to refer to objects) and rules.</li>
		     
		        </ul>
		        <br>
		        <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-3', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-3', true, 1)">Next</button>
        	</div> 
                <!-- <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right" id="nextButton"
                    onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-3', true, 1)"> Next
                </a> -->
            </ul>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-4.1-page-4" hidden>
        <div class="row">
            <div class="container">   
            <h2 class="text-primary" style="text-align:center;">Variable</h2>  
               
               <ul class="lesson-list">     
            	<li class="main-point">It refers to an object &lpar;not in the sense that something we don't know but want to know&rpar;</li> 
            	<ul class="sub-points" style="list-style-type:circle">
		            <li> Example: A city, X is in a state,Y.</li>
		            <ul style="list-style-type:square">
		            <li>X refers to a particular city and Y refers to a particular state. X and Y are variables here.</li>
		            </ul>
             	</ul>
		        </ul>
		        <br>
		        <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-4', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-4', true, 1)">Next</button>
        	</div> 
        	
                <!-- <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-4', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right" id="nextButton"
                    onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-4', true, 1)"> Next
                </a> -->
            </div>
        </div>
    </section>
    
     <section id="version-1-course-x-lesson-4.1-page-5" hidden>
        <div class="row">
            <div class="container" >   
            <h2 class="text-primary" style="text-align:center;">Rules</h2>  
               
               <ul class="lesson-list">     
            	<li class="main-point"><strong>Question:</strong> Who is the dad of Peter?</li>
            	<li class="main-point"><strong>Knowledge we know:</strong> Fathers are dads.</li>
            	<li class="main-point">What general knowledge do we know to answer these questions?</li>
            	<li><strong>How to represent this knowledge using logic forms?</strong></li>
            	<ul class="sub-points" style="list-style-type:circle">
            		<li>Methodology</li>
            		<ul style="list-style-type:square">
            		<li>Identify objects and variables. We use variables when the knowledge involves non-specific objects</li>
            		<li>Identify relations among these objects</li>
            		<li>Identify relationship among these relations</li>
            		</ul>
            	</ul>
		        </ul>
		        <br>
		         <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-5', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-5', true, 1)">Next</button>
        	</div> 
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-4.1-page-6" hidden>
        <div class="row">
            <div class="container scrollableDiv">   
            <h2 class="text-primary" style="text-align:center;">Rules : Identify objects</h2>  
               
               <ul class="lesson-list">     
            	<li class="main-point">Question: Who is the dad of peter?</li>
            	<li class="main-point">Knowledge in English: fathers are dads</li>
            	<ul class="sub-points" style="list-style-type:circle">
            	<li>Methodology: when we write knowledge (relevant to questions), we try to make objects and relations explicit. </li>
            	</ul>
            	<li class="main-point">Identify objects and variable </li>
            	<ul class="sub-points" style="list-style-type:circle">
                  	<li>Specific objects? (such as Peter, John)?: no</li>
                  	<li>Variables</li>
                  	<ul style="list-style-type:square">
                  		<li>On fathers: father1, father2…</li>
                  	</ul>
                  	<li style="list-style-type:None">Since every variable refers to a father, we may just use one variable</li>
                  	<ul style="list-style-type:disc">
                  	<ul style="list-style-type:square">
                  		<li>F: a father</li>
                  	</ul>
					</ul>
                  	<ul style="list-style-type:square">
                  		<li>On dads: dad1, dad2…</li>
                  		<ul style="list-style-type:disc">
                  			<li>D: a dad</li>
                  		</ul>
                  	</ul>
            	</ul>
    
		        
		        <li class="main-point">Invisible objects</li>
               <ul class="sub-points" style="list-style-type:circle">     
				<li>F is the father of someone</li>
				<li>D is the dad of someone</li>
				<li>These two someones are the same and this someone is the son. </li>
				<li>Also a variable, lets use S to refer to the son</li>
    
		        </ul>
		        </ul>
		        <br>
		        
		         <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-6', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-6', true, 1)">Next</button>
        	</div> 
        	
       
            </div>
        </div>
    </section>
    
    <!-- <section id="version-1-course-x-lesson-4.1-page-7" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">   
            <h2 class="text-primary" style="text-align:center;">Rules : Identify objects</h2>  
               <div style="margin:0px 0px 0px 0px"> 
               <li>Invisible objects</li>
               <ul style="list-style-type:circle">     
				<li>F is the father of someone</li>
				<li>D is the dad of someone</li>
				<li>These two someones are the same and this someone is the son. </li>
				<li>Also a variable, lets use S to refer to the son</li>
    
		        </ul>
		        <br>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-7', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right" id="nextButton"
                    onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-7', true, 1)"> Next
                </a>
            </div>
        </div>
    </section> -->
    
    <section id="version-1-course-x-lesson-4.1-page-7" hidden>
        <div class="row">
            <div class="container">   
            <h2 class="text-primary" style="text-align:center;">Rules : Identify relations</h2>  
               <ul class="lesson-list">
               <li class="main-point">Identify relations among the object</li>
               <ul class="sub-points" style="list-style-type:circle">     
    				<li>Assume relations in intended specification: father(X, Y) - X is the father of Y</li>
    				<li>We have</li>
    				<ul style="list-style-type:square">
    				<li>Fathers are dads: F = D</li>
    				<li>Implicit relations (involving implicit objects)</li>
    				<ul style="list-style-type:disc">
    				<li>F is the father of S: father(F, S), </li>
    				<li>D is the dad of S: dad(D, S).</li>
    				</ul>
    				</ul>
		        </ul>
		        </ul>
		        <br>
		        
		   <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-7', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-7', true, 1)">Next</button>
        	</div> 
		        
            </div>
        </div>
    </section>
    <section id="version-1-course-x-lesson-4.1-page-8" hidden>
        <div class="row">
            <div class="container">   
            <h2 class="text-primary" style="text-align:center;">Rules : Identify relationships between relations</h2>  
               
               <ul class="lesson-list">
               <li class="main-point">We usually identify which relation depends on other relations. We can define that relation using the other relations.</li>
               <li class="main-point">In our example, the father relation is known, and we want to know dad relation from the father relation. So, we define dad relation using father relation.</li>
               <li class="main-point">The definition is usually of the form:</li>
               <ul class="sub-points" style="list-style-type:circle">
               <li>relation (holds) if relation 1 holds, and … relation n holds.</li>
               </ul>
               <li class="main-point">We have D is the dad of S if F is the father of S and F is D.</li>
               <li class="main-point">A rule is to represent the English above using logic form of relations, :- for if, “,” for and</li>
               <li class="main-point">Thus we have</li>
               <ul class="sub-points" style="list-style-type:circle">
               <li>dad(D, S) :- father(F, S), F=D.</li>
               </ul>
               </ul>
		        <br>
		   <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-8', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-8', true, 1)">Next</button>
        	</div> 
        	
            </div>
        </div>
    </section>
    <section id="version-1-course-x-lesson-4.1-page-9" hidden>
        <div class="row">
            <div class="container scrollableDiv">   
            <h2 class="text-primary" style="text-align:center;">Rules : An Example</h2>  
               
               <ul class="lesson-list">
               <li class="main-point">We know, The atomic number of hydrogen is 1.</li>
               <li class="main-point">Question: What is the proton number of hydrogen?</li>
               <li class="main-point">Knowledge: The atomic number of an element is equal to the proton number of that element.</li>
               <li class="main-point">Identify objects and variables</li>
               <ul class="sub-points">
               <ul style="list-style-type:circle">
               <li>Variables</li>
	               <ul style="list-style-type:square">
	               <li>An Element : element1, element2 …</li>
	               <li>Atomic number is a number</li>
	               <li>Proton number is also a number</li>
	               </ul>
               </ul>
               <li class="main-point" style="list-style-type:None">Since every variable refers to an element, we may just use one variable for all elements</li>
               <ul class="sub-points">
	               <ul style="list-style-type:disc">
	                   	<li>E : An element</li>
	               </ul>
               </ul>
               <li class="main-point" style="list-style-type:None">We can also use a variable to represent any number for atomic number</li>
               <ul class="sub-points">
	               <ul style="list-style-type:disc">
	               	<li>N: Atomic number</li>
	               </ul>
               
               </ul>
               <li class="main-point" style="list-style-type:None">We can also use a variable to represent any number for atomic number</li>
               <ul class="sub-points">
	               <ul style="list-style-type:disc">
	               <li>P: Proton number</li>
	               </ul>
               
               </ul>
               </ul>
               <li class="main-point" >Identify relations among the object</li>
               <ul class="sub-points"  style="list-style-type:circle">
               <li>Assume relations in intended specification: atomicNumber(X, Y) - The atomic number of element X is Y. </li>
               <li>We have</li>
               <ul style="list-style-type:square">
               <li>Atomic number of an element is the proton number of that element: N = P</li>
               <li>Implicit relations (involving implicit objects)</li>
               <ul style="list-style-type:disc">
               <li>N is the atomic number of E: atomicNumber(E, N).</li>
               <li>P is the proton number of E: protonNumber(E, P).</li>
               </ul>
               </ul>
               
               </ul>
               <li class="main-point" >Identify relationship between relations</li>
               <ul class="sub-points"  style="list-style-type:circle">
               <li>We have, The atomic number of an element E is N if the proton number of E is P.</li>
               <li>A rule is to represent the English above using logic form of relations, :- for if, “,” for and</li>
               <li>Thus we will have</li>
               <ul style="list-style-type:square">
               	<li>atomicNumber(E,N) :- protonNumber(E,P), N=P.</li>
               </ul>
               </ul>
               
              </ul>
               
		        <br>
		        <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-9', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-9', true, 1)">Next</button>
        	</div> 
        	
            </div>
        </div>
    </section>
  
    
        <section id="version-1-course-x-lesson-4.1-page-10" hidden>
        <div class="row">
            <div class="container">   
            <h2 class="text-primary" style="text-align:center;">How to read a rule?</h2>  
               <ul class="lesson-list">
               
               <li class="main-point"><strong>Rule</strong></li>
               <ul class="sub-points" style="list-style-type:circle">
               	<li>atomicNumber(E,N) :- protonNumber(E,P), N=P.</li>
               </ul>
               <li class="main-point"><strong>To read</strong></li>
               <ul class="sub-points" style="list-style-type:circle">
               	<li>For all E,N and P, the atomic number of an element E is N if the proton number of an element E if P and N=P.
               	</li>
               </ul>
               <li class="main-point"><strong>Rule</strong></li>
               <ul class="sub-points" style="list-style-type:circle">
               <li>dad(D,S) :- father(F,S) , D=F.</li>
               
               </ul>
               <li class="main-point"><strong>How to read it</strong></li>
               <ul class="sub-points" style="list-style-type:circle">
               	<li>?</li>
               </ul>
               </ul>
		        <br>
		          <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-10', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-10', true, 1)">Next</button>
        	</div> 
                
            </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-4.1-page-11" hidden>
        <div class="row">
            <div class="container" >   
            <h2 class="text-primary" style="text-align:center;">Understanding variable more deeply</h2>  
               <ul class="lesson-list">
               <li class="main-point"><strong>A fact :</strong> father(John, Peter).</li>
               <li class="main-point"><strong>What does it mean</strong></li>
               <ul class="sub-points" style="list-style-type:circle">
               	<li>John is a father of Peter ?</li>
               </ul>
               </ul>
		        <br>
		         <div class="d-flex justify-content-between">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-11', false, -1)">Previous</button>
        	<button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-11', true, 1)">Next</button>
        	</div> 
                
         
            </div>
        </div>
    </section>
    <section id="version-1-course-x-lesson-4.1-page-12" hidden>
        <div class="row">
            <div class="container" >   
            <h2 class="text-primary" style="text-align:center;">Understanding variable in rule more deeply</h2>  
               
               <ul class="lesson-list">
               <li class="main-point"><strong>A fact :</strong> father(John, Peter).</li>
               <li class="main-point"><strong>What does it mean</strong></li>
               <ul class="sub-points" style="list-style-type:circle;">
               	<li>John is a father of Peter ?</li>
               </ul>
               <li class="main-point" style="list-style-type:None;padding:0;margin:0">The answer is “No”</li>
               <li class="main-point">In SPARC, any name starting with a capital letter is a variable.</li>
               <li class="main-point"><strong>To read this:</strong> For every John and Peter, John is the father of Peter.</li>
               <li class="main-point">Here, John and Peter are variables, They can represent any object.</li>
               <li class="main-point">Concrete objects start with a lower-case letter in our abstraction or SPARC;</li>
               <ul class="sub-points" style="list-style-type:circle">
               <li>e.g., father(john, peter). </li>
               <ul style="list-style-type:square">
               <li>john and peter are both concrete objects.</li>
               </ul>
               </ul>
               </ul>
		        <br>
		         <div class="d-flex pull-left">
           <button class="btn btn-lg btn-primary" style="background-color:#1b84f5"
        			onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-12', false, -1)">Previous</button>
        	
        	</div> 
                <!-- <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(4.1, 0, 'version-1-course-x-lesson-4.1-page-12', false, -1)"> Previous
                </a> -->
                <!-- <a class="btn btn-primary pull-right" id="nextButton"
                    onclick="gotoNext(4.1, 0, 'version-1-course-x-lesson-4.1-page-12', true, 1)"> Next
                </a> -->
            </div>
        </div>
    </section>
    



<%@ include file = "footer1.jsp" %>
<script src="../js/lesson4.1/validations.js" type="text/javascript">  </script>
</body>
</html>