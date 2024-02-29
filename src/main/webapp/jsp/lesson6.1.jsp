<html lang="en">

<head>
    <title>Lesson 6 New</title>
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
            max-height: 630px;
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
    
    <section id="version-1-course-x-lesson-6-page-2" hidden>
        <div class="row">
        <div class="container">
                <h1 class="text-primary"> Outline </h1>
                <ul class="lesson-list">
                    <li class="sub-point">Atomic Structure</li>                    
					<li class="sub-point">Modeling the Atomic Number</li>
                </ul>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-2', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-2', false, -1)"> Next 
                </button>
            </div>
        </div>
        </div>
    </section>
    
    <section id="version-1-course-x-lesson-6-page-3" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">What is Atomic Structure and Atomic Number?</h2>
                <ul class="lesson-list">
                		<li>Atomic Structure</li>
                		<ul>
                			<li class="sub-point">Nucleus</li>
                			<ul>
                			<li class="sub-point">Protons</li>
                			<li class="sub-point">Neutrons</li>
                			</ul>
                			<li class="sub-point">Electrons</li>
                		</ul>
                		<li class="sub-point">Atomic Number = Number of Protons</li>
                		<li class="sub-point">We can find the atomic number from the periodic table</li>
                </ul>               
                <br>
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
    
    <section id="version-1-course-x-lesson-6-page-4"  hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Motivation about Atoms</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">How to say something that can give more motivation for student to learn atoms?</li>
                </ul>  
           		<div style="padding-left:200px ">
           			<img  class = "atomGif" src="../images/lesson6/image003.gif" align="middle" alt="Image" width="105" height="90" >
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
                <h2 style="text-align:center;">Periodic Table of the Elements</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">How to find an atomic number of an element from a periodic table?</li>
                </ul>  
           		<div style="padding-leftt: 100px;">
           			<img  class = "atomGif" src="../images/lesson6/PeriodTable.png" align="middle" alt="Image" width="550" height="400" >
           		</div>   
                <br>
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
                <h2 style="text-align:center;">How to ask a question about atomic number of an element?</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">We have a knowledge of the element hydrogen</li>
                		<ul>
                		<li class="sub-point">The atomic number for Hydrogen is 1.</li>
                		</ul>
                		<li class="sub-point">Now, based on this knowledge, how can we ask a question about atomic number of hydrogen?</li>
                		<ul>
                		<li class="sub-point">Is the atomic number for hydrogen 1?</li>
                		<li class="sub-point">What is the atomic number of Hydrogen?</li>
                		</ul>
                		<li class="sub-point">Go to <a href="practise1.jsp">practise1</a></li>
                </ul>   
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
                <h2 style="text-align:center;">Develop a computer model(facts) for answering the question on atomic number of elements</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">We have a question</li>
                		<ul>
                		<li class="sub-point">Is the atomic number for Hydrogen is 1?</li>
                		</ul>
                		<li class="sub-point">We realize that the objects in the question are:</li>
                		<ul>
                		<li class="sub-point">Object 1: the element - Hydrogen</li>
                		<li class="sub-point">Object 2: Number - 1</li>
                		</ul>
                		<li class="sub-point">We know the relation instance in the question is:</li>
                		<ul>
                		<li class="sub-point">Relation instance: atomic number</li>
                		<ul>
                		<li class="sub-point">Syntax: atomicNumber() - recall to father(), mother(), dad(), etc in the family lesson.</li>
                		</ul>
                		</ul>
                		<li>Based on our iterative refinement methodology, we can write a comment and fact(rule) for the relation instance in the SPARC.</li>
                		<ul>
                		<li>Comment: % The atomic number of hydrogen is 1.</li>
                		<li class="sub-point">Fact: atomicNumber(hydrogen,1)</li>
                		</ul>
                		<li class="sub-point">Go to Activity 1 in the Workbook</li>
                </ul>   
                <br><br>
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
                <h2 style="text-align:center;">Test the computer model</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">We have a fact (rule) about atomic number of hydrogen. Now we need to test the computer model to know whether it can answer our question.</li>
                		<ul>
                		<li class="sub-point">To ask a computer model, we need to write a query (the computer model can not understand English, it need a specialized language, we called programming language. In fact, we use SPARC to write a query.</li>
                		<ul>
                		<li>Fact: atomicNumber(hydrogen,1)</li>
                		<li class="sub-point">Query: atomicNumber(hydrogen,X)? (Recall to the variables in the lesson 3)</li>
                		</ul>
                		</ul>
                		<li class="sub-point">Go to Activity 2 in the Workbook.</li>
                </ul>   
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
                <h2 style="text-align:center;">Extend the model to answer a new question</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">Now, we have a new knowledge</li>
                		<ul>
                		<li class="sub-point">The atomic number of carbon is 6.</li>
                		</ul>
                		<li class="sub-point">How can we ask a question about the atomic number of carbon?</li>
                		<li class="sub-point">How can we write a new fact to extend the model?</li>
                		<ul>
                		<li>We know that if we ask the old model about carbon, it will answer unknown, right?</li>
                		<li class="sub-point">Therefore, we have to teach the model about the new thing, here is carbon and its atomic number.</li>
                		</ul>
                		<li class="sub-point">Go to <a href="practise2.jsp">practise2</a></li>
                </ul>   
                <br><br><br><br>
                <br><br><br><br><br>
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
    
        <section id="version-1-course-x-lesson-6-page-10" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">A query with one variable </h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">Recall to the variable in the lesson 3</li>
                		<ul>
                		<li class="sub-point">There are two types of variables</li>
                		<ul>
                		<li class="sub-point">Unknown variable</li>
                		<li class="sub-point">Referring variable</li>
                		</ul>
                		</ul>
                		<li class="sub-point">We can ask a computer model to get an answer using a variable.</li>
                		<ul>
                		<li class="sub-point">E.g., atomicNumber(hydrogen,Y)? or atomicNumber(X, 1)?</li>
                		</ul>
                		<li claas="sub-point">Go to Activity 3 in the Workbook.</li>
                </ul>   
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-10', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-10', false, -1)"> Next
                </button>  
                </div>  
            </div>
        </div>
    </section>
    
     <section id="version-1-course-x-lesson-6-page-11" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Answer to queries with more than one variable</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">We know that we can inquire a computer model to get an answer using a query with one variable</li>
                		<ul>
                		<li class="sub-point">E.g., atomicNumber(hydrogen, Y)?</li>
                		</ul>
                		<li class="sub-point">Now, if we have a question: What are the atomic numbers of elements?</li>
                		<ul>
                		<li class="sub-point">We have a knowledge that the atomic number of an element = number of protons.</li>
                		<li class="sub-point">We can write a query to answer the question above such as:</li>
                		<ul>
                		<li class="sub-point">atomicNumber(X,Y)?</li>
                		</ul>
                		</ul>
                		<li class="sub-point">Go to Activity 4 in the Workbook.</li>
                </ul>   
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-11', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-11', false, -1)"> Next
                </button>    
            </div>
            </div>
        </div>
    </section>
    
         <section id="version-1-course-x-lesson-6-page-12" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Multiple variable functions</h2>
           		<div>
           		<div style="padding-left:100px">
           			<img  class = "atomGif" src="../images/lesson6/table.png" align="middle" alt="Image" width="105" height="90" >
           		</div>  
           		<ul class="lesson-list">
                		<li class="sub-point">We use the example in the table above to elaborate the position of a relation.</li>
                		<li class="sub-point">We may have various relation instances from the table.</li>
                		<ul class="main-point">
                		<li class="sub-point">For example</li>
                		<ul class="main-point">
                		<li class="sub-point">massNumber()</li>
                		<li class="sub-point">isElement()</li>
                		<li class="sub-point">isProtons()</li>
                		<li class="sub-point">isNeutrons()</li>
                		</ul>
                		</ul>
                </ul>   
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-12', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-12', false, -1)"> Next
                </button>    
            </div>
        </div>
        </div>
    </section>
    
             <section id="version-1-course-x-lesson-6-page-13"  hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Answer to queries with multiple variable relations </h2>
           		<div>  
           		<ul class="lesson-list">
                		<li class="sub-point">We know that we can ask a computer model to provide an answer using a query with one variable.</li>
                		<ul>
                		<li class="sub-point">E.g., massNumber(beryllium, X)?</li>
                		</ul>
                		<li class="sub-point">Now, if we have a question: What is the mass number of beryllium if we know its protons are 4 and its neutrons are 5, respectively?</li>
                		<ul>
                		<li class="sub-point">We have a knowledge that the mass number of an element = the number of protons + the number of neutrons.</li>
                		<li class="sub-point">We can write a query like this:</li>
                		<ul>
                		<li class="sub-point">massNumber(X, 4, 5)?</li>
                		</ul>
                		<li class="sub-point">To answer the query, the computer model needs to be trained beforehand by writing a fact, such as.</li>
                		<ul>
                		<li class="sub-point">massNumber(Beryllium,4,5).</li>
                		</ul>
                		</ul>
                		<li class="sub-point">Go to Activity 5 in the Workbook.</li>
                </ul>   
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-13', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-13', false, -1)"> Next
                </button>    
            </div>
            </div>
        </div>
    </section>
    
                 <section id="version-1-course-x-lesson-6-page-14" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">More practices </h2>
           		<div>  
           		<ul class="lesson-list">
                		<li class="sub-point">Now, we know about the multiple objects and multiple variables. Can we extend the computer model to answer other questions.</li>
                		<ul class="main-top">
                		<li class="sub-point">What is the number of protons in the element Carbon when it has 6 neutrons and a mass number of 12?</li>
                		<li class="sub-point">Which element has 5 protons, 5 neutrons, and a mass number of 10?</li>
                		<li class="sub-point">How many neutrons does the element Magnesium have when it 12 protons and a mass  number of 24?</li>
                		</ul>
                		<li class="sub-point">Go to <a href="practise3.jsp">practise 3</a></li>
                </ul>   
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-14', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-14', false, -1)"> Next
                </button>  
                </div>  
            </div>
        </div>
    </section>
    
        <section id="version-1-course-x-lesson-6-page-15" hidden>
        <div class="row">
        <div class="container">
                <h2 style="text-align:center;">Summary</h2>
           		<div>
           		<ul class="lesson-list">
                		<li class="sub-point">We have provided an explanation of atomic structure and atomic number in the chemistry.</li>
                		<li class="sub-point">We have introduced the facts and discussed how to develop a computer model to address questions.</li>
                		<li class="sub-point">We have elaborated the relation instances to answer additional questions</li>
                </ul>   
                <br><br><br><br>
                <br><br><br><br><br>
                <button class="btn btn-primary pull-left" style="background-color :#1b84f5;"
                    onclick="gotoPrevious(6, 0, 'version-1-course-x-lesson-6-page-15', false, -1)"> Previous
                </button>
                <button class="btn btn-primary pull-right" style="background-color :#1b84f5;"
                    onclick="gotoNext(6, 0, 'version-1-course-x-lesson-6-page-15', false, -1)"> Next
                </button> 
                </div>   
            </div>
        </div>
    </section> 

 
<%@ include file = "footer1.jsp" %>
<script src="../js/lesson6/validations.js" type="text/javascript">  </script>
   </body>

</html>
