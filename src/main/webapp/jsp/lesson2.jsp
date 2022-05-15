<html lang="en">

<head>
    <title>Lesson 2</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="../js/script.js"></script>
    <link rel="stylesheet" href="../styles/style.css">
    <%@ include file = "header.jsp" %>
</head>

<body>
    <script type="text/javascript"> 
        $( document ).ready(function() { 
            sessionStorage.removeItem(sessionKeyIsAssessmentPassed);
            sessionStorage.removeItem(sessionKeyIsSparcPassed);
            

        let pageIdToShow= sessionStorage.getItem(sessionKeyShowPageId);
  		if(pageIdToShow== null || pageIdToShow == '' || pageIdToShow == undefined){
              let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(2);
  			 let currentSection = document.getElementById(firstPageIdOfCurrentLesson);
  			 currentSection.hidden = false;
  		}
  		else{
  			 let currentSection = document.getElementById(pageIdToShow);
  			 currentSection.hidden = false;
  		}           
    });    
    </script>
    <section id="version-1-course-x-lesson-2-page-1" class="container" hidden>
        <div class="row">
            <div class="col-md-8 content" style="margin-left:20rem">
            <h1> Lesson 2: Extend the family model </h1>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-1', false, -1)"> Next </a>
            </div>
        </div>
    </section>


    <section id="version-1-course-x-lesson-2-page-2" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h1 class="text-primary"> Recall the family </h1>
                <ul>
                    <li> What we know </li>
                    <ul>
                        <li> John is the father of Peter </li>
                        <li> John is also the father of Sara and Linda </li>
                    </ul>
                </ul>
                <ul>
                    <li> Questions </li>
                    <ul>
                        <li> Old ones </li>
                        <ul>
                            <li> Is John the father of Peter? </li>
                            <li> Is John a parent of Peter? </li>
                            <li> Who is Peter's father? </li>
                            <li> Who is Peter's dad? </li>
                        </ul>
                    </ul>
                </ul>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-2', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-2', false, -1)"> Next 
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-2-page-3" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <!-- <h1 class="text-primary">  </h1> -->
                <img src="../images/image1.png" alt="Image" width="500" height="400">
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-3', false, -1)"> Previous
                </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 0, 'version-1-course-x-lesson-2-page-3', true, 1)"> Next
                </a>
            </div>
        </div>
    </section>

    <section id="version-1-course-x-lesson-2-page-4" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Extent your model for the relation of mom</h2>
                <form action="">
                    <label for="ques1"> Representing knowledge as comment and fact  </label><br />
                    <input type="text" id="ques1" name="ques1" class="knowledge-check-input"><br><br>
                    Test your model <br>
                    <br>
                    <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 0, 'version-1-course-x-lesson-2-page-4', false, -1)"> Previous </a>
                    <div class="text-center">
                        <a class="btn btn-primary" style="margin-left: -15rem;" onclick="submitAssessment()"> Submit </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Online SPARC -->

<!--
    <section id="assessment" class="container content" hidden>
        <div class="row">
            <div id="errors-section-main" class="col-md-8" style="display:none;margin-top:20px;">
                <div id="errors" class="alert alert-danger" style="display:flex; width: fit-content;" role="alert">

                </div>
            </div>
            <div id="score-section-main" class="col-md-8" style="display:none;margin-top:20px;">
                <div id="score-section" class="alert" style="display:flex; width: fit-content;" role="alert">
                    <div id="score-section-emoji"></div>
                    <div id="score-section-message"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <h3 id="lesson-name" class="text-center text-primary"></h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8" id="quiz-section">
            </div>
        </div>
        <div class="row" style="margin-top:2rem;margin-left: 2rem;">
            <div class="col-md-8">
                <a id="submit-quiz-a" class='btn btn-primary' style="margin-left: 22rem !important;"
                    onclick='submitQiz()'> Submit Quiz </a>
            </div>
        </div>
    </section>
-->

    <!-- <section id="learning-outcome-0-part-5" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
            <h1 class="text-primary"> Root Assessment </h1>
            <h2> Extent family model for mom relation </h2>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label><br />
                <input type="text" id="ques1" name="ques1"><br><br>
                Test your model <br>
                <br>
                <div class="text-center">
                    <a class="btn btn-primary" onclick="gotoNext(2, 'learning-outcome-0-part-5','learning-outcome-1', false, -1)"> Submit </a>
                </div>
            </form>
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 'learning-outcome-0-part-5','learning-outcome-0-part-4', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(2, 'learning-outcome-0-part-5','learning-outcome-1', false, -1)"> Next </a>
        </div>
    </div>
    </section> -->
    <!-- OnlineSPARC --> 


    <!-- learning outcome 1 -->
    <section id="version-1-course-x-lesson-2-page-5" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2> Learning outcome 1: Extend the Model for Parent relation</h2>
            <img src="../images/image1.png" alt="Image" width="500" height="400">

            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 1, 'version-1-course-x-lesson-2-page-5', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(2, 1, 'version-1-course-x-lesson-2-page-5', false, -1)"> Next </a>
            </div>
        </div>  
    </section>

    <section id="version-1-course-x-lesson-2-page-6" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h3> Extend Family Model for Parent of Peter:</h3>
            <br>
            <h4> Extend your model by the following </h4>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <input type="text" id="ques1" name="ques1"><br><br>
                <br>
            <div class="text-center">
                <a class="btn btn-primary" onclick="gotoNext(2, 'version-1-course-x-lesson-2-page-6', false, -1)"> Submit</a>
            </div>
            </form>
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 1, 'version-1-course-x-lesson-2-page-6', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoOnlineSparc(2, 1, 'version-1-course-x-lesson-2-page-6', false, -1,false)"> Next </a>
            </div>
        </div>  
    </section>
    <!-- onlineSPARC -->


    <section id="version-1-course-x-lesson-2-page-7" class="container" hidden>
        <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
        <h3> Extend Family Model for Parent of other kids:</h3>
        <br>
        <h4> Extend Model </h4>
        <ul>
            <li> For sarah, </li>
        </ul>
        <form action="">
            <label for="ques1"> Representing knowledge as comment and fact </label>
            <input type="text" id="ques1" name="ques1"><br><br>
            <br>
            <h4> Extend Model </h4>
            <ul>
                <li> For Linda, </li>
            </ul>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <input type="text" id="ques1" name="ques1"><br><br>
                <br>
            <br>
            <div class="text-center">
                <a class="btn btn-primary"> Submit</a>
            </div>
        </form>
        <br>
        <a class="btn btn-primary pull-left"
            onclick="gotoOnlineSparc(2, 1, 'version-1-course-x-lesson-2-page-7','version-1-course-x-lesson-2-page-6', false, -1,true)"> Previous </a>
        <a class="btn btn-primary pull-right"
            onclick="gotoNext(2, 1, 'version-1-course-x-lesson-2-page-7', false, -1)"> Next </a>
        </div>
    </div>  
    </section>
    <!-- onlineSPARC -->

    <!-- learning outcome 2 -->
    <section id="version-1-course-x-lesson-2-page-8" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <h2>Learning outcome 2: Extending the model for Dad relation </h2>
                <ul>
                    <li> Questions: we want your model to answer queries using dad and mom directly. E.g., is John the
                        dad of Peter? </li>
                    <li> Extend your model: </li>
                    <ul>
                        <li> Write knowledge about “dad” relation for the kids </li>
                        <li> Represent the knowledge into facts </li>
                    </ul>
                </ul>
                <a class="btn btn-primary pull-left"
                    onclick="gotoPrevious(2, 2, 'version-1-course-x-lesson-2-page-8', false, -1)"> Previous </a>
                <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 2, 'version-1-course-x-lesson-2-page-8', false, -1)"> Next </a>
            </div>
        </div>
    </section>
                
    <section id="version-1-course-x-lesson-2-page-9" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 2: Extending the model for Dad relation </h2>
            <br>
            <h4> Extend your Model for dad of peter: </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <input type="text" id="ques1" name="ques1"><br><br>
                Test your model <br>
                <br>
                <br>
                <div class="text-center">
                     <a class="btn btn-primary"> Submit</a>
                </div>
            </form>
            <br>
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 2, 'version-1-course-x-lesson-2-page-9', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                onclick="gotoNext(2, 2, 'version-1-course-x-lesson-2-page-9', false, -1)"> Next </a>
            </div>
        </div>
    </section>
    <!-- onlineSPARC -->

    <section id="version-1-course-x-lesson-2-page-10" class="container" hidden>
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
        <h2>Learning outcome 2: Extending the model for Dad relation </h2>
        <h3> Extend Family Model for Dad of other kids</h3>
        <br>
        <h4> Extend your Model for dad relation of Sarah: </h4>
        <br>
        <form action="">
            <label for="ques1"> Representing knowledge as comment and fact </label>
            <input type="text" id="ques1" name="ques1"><br><br>
            <br>
            <h4> Extend your Model for dad relation of Linda: </h4>
            <br>
            <form action="">
                <label for="ques1"> Representing knowledge as comment and fact </label>
                <input type="text" id="ques1" name="ques1"><br><br>
            <br>
            <div class="text-center">
                <a class="btn btn-primary"> Submit</a>
            </div>
            <a class="btn btn-primary pull-left"
                onclick="gotoPrevious(2, 2, 'version-1-course-x-lesson-2-page-10', false, -1)"> Previous </a>
            <a class="btn btn-primary pull-right"
                    onclick="gotoNext(2, 2, 'version-1-course-x-lesson-2-page-10', false, -1)"> Next </a>
        </form>
        <br>
        </div></div>
    </section>
    <!-- onlineSPARC -->

    <!-- learning outcome 3 -->
        <section id="version-1-course-x-lesson-2-page-11" class="container" hidden>
            <div class="row">
                <div class="col-md-6 content" style="margin-left:20rem">
        <h2>Learning outcome 3: Extending the model for new family </h2>
        <ul>
            <li> What we know </li>
            <ul>
                <li> John is the father of Peter </li>
                <li> Joaan is the mother of Peter </li>
            </ul>
        </ul>
        <ul>
            <li> Questions </li>
            <ul>
                <li> Old ones </li>
                <ul>
                    <li> Is John the father of Peter? </li>
                    <li> Who is Peter's father? </li>
                    <li> Who is Peter's dad? </li>
                    <li> Is John a parent of Peter? </li>
                </ul>
            </ul>
        </ul>
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-11', false, -1)"> Previous </a>
         <a class="btn btn-primary pull-right"
            onclick="gotoNext(2, 3, 'version-1-course-x-lesson-2-page-11', false, -1)"> Next </a>
    </div></div>
</section>

<section id="version-1-course-x-lesson-2-page-12" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
            <h2>Learning outcome 3: Extending the model for new family </h2>
        <ul>
            <li> Assume we have the following relations </li>
            <ul>
                <li> mother(X, Y)means person X is the mother of Y </li>
                <li> mom(X, Y)means person X is the mom of Y </li>
            </ul>
        </ul>
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-12', false, -1)"> Previous </a>
        <a class="btn btn-primary pull-right"
            onclick="gotoNext(2, 3, 'version-1-course-x-lesson-2-page-12', false, -1)"> Next </a>
    </div></div>
</section>

<section id="version-1-course-x-lesson-2-page-13" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem">
        <h3> Extend Family Model for mother relation: </h3>
        <br>
        <h4> Extend your Model for the relation of mother: </h4>
        <br>
        <form action="">
            <label for="ques1"> Representing knowledge as comment and fact </label>
            <input type="text" id="ques1" name="ques1"><br><br>
            Test your model <br>
            <br>
            <br>
            <div class="text-center">
                <a class="btn btn-primary"> Submit</a>
            </div>
        </form>
        <br>
        <a class="btn btn-primary pull-left"
            onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-13', false, -1)"> Previous </a>
        <a class="btn btn-primary pull-right"
            onclick="gotoNext(2, 3, 'version-1-course-x-lesson-2-page-13', false, -1)"> Next </a>
    </div></div>
</section>
<!-- onlineSPARC -->

       
<section id="version-1-course-x-lesson-2-page-14" class="container" hidden>
    <div class="row">
        <div class="col-md-6 content" style="margin-left:20rem"> 
        <h3> Extend Family Model for mom relation:</h3>
        <br>
        <h4> Extend your Model for the relation of mom: </h4>
        <br>
        <form action="">
            <label for="ques1"> Representing knowledge as comment and fact </label>
            <input type="text" id="ques1" name="ques1"><br><br>
            Test your model <br>
            <br>
            <br>
            <div class="text-center">
                <a class="btn btn-primary"> Submit</a>
            </div>
        </form>
        <br>
        <a class="btn btn-primary pull-left"
        onclick="gotoPrevious(2, 3, 'version-1-course-x-lesson-2-page-14', false, -1)"> Previous </a>
        </div>
    </div>
</section>
<!-- onlineSPARC -->


    <!-- <section id="part-x" hidden>

        <a class="btn btn-primary" onclick="gotoNext('part-x','part-x+1')"> Next </a>
    </section>

    <section id="part-x" hidden>

        <a class="btn btn-primary" onclick="gotoPrevious('part-x','part-x-1')"> Previous </a>
        <a class="btn btn-primary" onclick="gotoNext('part-x','part-x+1')"> Next </a>
    </section> -->
    <body>
        <div class="footer">
          <h4>Online LPK12 Course</h4>
        </div>

</body>

</html>