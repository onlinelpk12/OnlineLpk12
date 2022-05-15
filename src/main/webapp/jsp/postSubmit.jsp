<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Sparc results</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="../js/lessonDataStructureJSON.js"></script>
    <script src="../js/script.js"></script>
     <script src="../js/verifytoken.js" type="text/javascript"></script>
 <script type="text/javascript">
    $(function(){
      verifytoken();
    });
  </script>
    <%@ include file = "header.jsp" %>
</head>

<body>
    

    <section id="nextbutton" class="container">
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
                <p id="next-step-link"></p>
            </div>
        </div>
    </section>

    <!-- <%@ include file = "footer.jsp" %>  -->


    <script type="text/javascript">

        function getNextLearningOutcomeFirstPageId(currentLessonId, currentLearningOutcomeId) {
            let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonId)[0];
            let nextLearningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(lo => lo.learningOutcomeId == currentLearningOutcomeId + 1)[0];
            return nextLearningOutcomeDetails.pages[0].pageId;
        }

        function getNextLearningOutcomeIdUsingBinarySearch(currentLessonId, currentLearningOutcomeNumber) {
            let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonId)[0];
            let currentLessonTotalLearningOutcomes = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.length;

            if (currentLearningOutcomeNumber == 0) {
                return Math.ceil(currentLessonTotalLearningOutcomes / 2);
            }
            else if (currentLearningOutcomeNumber == 1) {
                return 1;
            }
            return Math.ceil(currentLearningOutcomeNumber / 2);
        }

        $(document).ready(function () {
            let message = document.getElementById('next-step-link');
            let isAssessmentPassed = sessionStorage.getItem(sessionKeyIsAssessmentPassed) === 'true';
            let isSparcPassed = sessionStorage.getItem(sessionKeyIsSparcPassed) === 'true';
            let nextLessonUrl = "sparc.html";

            let currentLessonNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber));
            let currentLearningOutcomeNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber));
            let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonNumber)[0];
                
            // show next step based on binary search

            if (isAssessmentPassed && !isSparcPassed) {
                message.innerHTML = "You have passed the assessment. Please click here <a href='" + sparcPage + "'> here </a> to to practice programming task."
                return;
            }

            if (isAssessmentPassed && isSparcPassed) {
                //sessionStorage.removeItem(sessionKeyIsAssessmentPassed);
                //let pageIdToShow = sessionStorage.getItem(sessionKeyShowPageId);
                //message.innerHTML = "Congratulations on completing the programming task. Please click <a href='" + nextLessonUrl + "'> here </a> to go to next steps."

                // student passed root assessment, so allow student to go to next lesson
                if (isAssessmentPassed && currentLearningOutcomeNumber == 0) {
                    let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber + 1) + ".jsp";
                    message.innerHTML = "You have passed the root assessment. please click <a href='" + nextLessonUrl + "'> here </a> to go to next lesson";
                }
                // passed all learning outcomes in the lesson
                else if (isAssessmentPassed && currentLearningOutcomeNumber == currentLessonDetails.totalLearningOutcomes) {
                    let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber + 1) + ".jsp";
                    message.innerHTML = "You have passed all the assessments. please click <a href='" + nextLessonUrl + "'> here </a> to go to next lesson";
                }
                else if (isAssessmentPassed && currentLearningOutcomeNumber > 0) {
                    let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber) + ".jsp";


                    message.innerHTML = "You have passed assessment Please click <a href='" + nextLessonUrl + "'> here </a> to go to next learning outcome";
                }
            }
            else {
                let nextLearningOutcomeNumber = getNextLearningOutcomeIdUsingBinarySearch(currentLessonNumber, currentLearningOutcomeNumber);
                let nextLearningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(x => x.learningOutcomeId == nextLearningOutcomeNumber)[0];
                let nextPageId = nextLearningOutcomeDetails.pages[0].pageId;//getNextLearningOutcomeFirstPageId(currentLessonId, currentLearningOutcomeNumber);
                sessionStorage.setItem(sessionKeyShowPageId, nextPageId);

                let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber) + ".jsp";
                message.innerHTML = "You have not passed the assessment. Please click <a href='" + nextLessonUrl + "'> here </a> to go to next step";
            }
        });
    </script>
</body>

</html>
