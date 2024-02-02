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
    <section id="version-1-course-x-lesson-12-page-1" hidden>
        <div class="row">
            <div class="container" >
            <h2 style="text-align:center">  Lesson12:  </h2> <br>
            <h2 style="text-align:center">  Modeling Proton Numbers</h2>
            <button class="btn btn-primary btn-lg mx-auto pull-right" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-1', false, -1)" style="display:flex; margin-top:50px;"> <p style="width:100%; text-align:center;margin:0">Next </p> </button>
            </div>
        </div>
    </section>
    
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
					  
                	
                     
					  
					  <img src="../images/lesson12/lesson12f.jpg" alt="Image" style="display:block; margin:auto" width="200" height="200">
                <br><br> 
					 
               <!--  <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-12-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(12, 0, 'version-1-course-x-lesson-12-page-3', false, -1)"> Next 
                </a> -->
                 <div class="d-flex justify-content-between">
        			<button class="btn btn-primary" style="background-color:#1b84f5;" onclick="gotoPrevious(12, 0, 'version-1-course-x-lesson-11-page-3', false, -1)">Previous</button>
        		<!-- 	<button class="btn btn-primary" onclick="gotoNext(12, 0, 'version-1-course-x-lesson-11-page-3', false, -1)">Next</button> -->
    			</div>
            </div>
        </div>
    </section>
    
    <%@ include file = "footer1.jsp" %>
     <script src="../js/lesson11/validation.js" type="text/javascript">  </script>
    
    
   </body>
   </html>
    