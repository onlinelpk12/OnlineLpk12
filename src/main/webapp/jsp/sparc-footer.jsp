<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/script.js"></script>
<meta charset="UTF-8">
<style>
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: steelblue;
  color: white;
  text-align: center;
}
</style>
<script type="text/javascript">
function SubmitSparc() {
	
    let isSparcPassed = true;
    let sessionKeyIsSparcPassed ="isSparcPassed";
    if(isSparcPassed==false){
    //validate sparc program
    
    return;
    
    }
    sessionStorage.setItem(sessionKeyIsSparcPassed, isSparcPassed);
    let currentLessonNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber));
    let currentLearningOutcomeNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber));
    let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonNumber)[0];
        
    let isAssessmentPassed = sessionStorage.getItem(sessionKeyIsAssessmentPassed) === 'true';
    let isSparcPassed = sessionStorage.getItem(sessionKeyIsSparcPassed) === 'true';
    
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

            let nextLearningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(x=> x.learningOutcomeId ==  currentLearningOutcomeNumber+1)[0];
            let showPageId = nextLearningOutcomeDetails.pages[0].pageId;
            sessionStorage.setItem(sessionKeyShowPageId,showPageId);

            message.innerHTML = "You have passed assessment Please click <a href='" + nextLessonUrl + "'> here </a> to go to next learning outcome";
        }
    }
    }

</script>
</head>
<body>


<div class="footer">
 <div class="row" style="margin:1rem 5rem 0 5rem">
 	<div class="col-md-4">
 	</div>
 	<div class="col-md-4">
 	  <h4 style="text-align:center">Online SPARC</h4>
 	</div>
 	<div class="col-md-4">
 	  <div id="sparcFooterNextBtn">
 	     <button class="btn btn-primary pull-right" onclick="SubmitSparc()" id="sparc-footer-next-btn"> Next</button>
 	  </div>
 	</div>
 </div>

</div>

</body>

</html>
