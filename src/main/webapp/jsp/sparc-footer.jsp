<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/script.js"></script>
<script>
	function goToPreviousPage(){
		let currentLessonNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber));
		let currentLearningOutcomeNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber));
		let currentPageId = sessionStorage.getItem(sessionKeyShowPageId);
		let currentPageDetails = getCurrentPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,currentPageId);
	    let previousPageId = currentPageDetails.previousPageId;
	    sessionStorage.setItem(sessionKeyShowPageId, previousPageId);
	    let LessonUrl = "../jsp/lesson" + (currentLessonNumber) + ".jsp";
        window.location.href = LessonUrl;
	}	
	
	function skipToLearningOutcome01(){
		let currentLessonNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber));
        let currentLearningOutcomeNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber));
        let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonNumber)[0];
		let firstLearningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(x => x.learningOutcomeId == 1)[0];
        let nextPageId = firstLearningOutcomeDetails.pages[0].pageId;
        sessionStorage.setItem(sessionKeyShowPageId, nextPageId);
        let firstLessonUrl = "../jsp/lesson" + (currentLessonNumber) + ".jsp";
        window.location.href = firstLessonUrl;
	}	
	
	function onSparcResultGoToDestination(){
		let currentLessonNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber));
		let currentLearningOutcomeNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber));
        let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonNumber)[0];
		_isSparcPassed = sessionStorage.getItem(sessionKeyIsSparcPassed) === 'true';
		let message = document.getElementById('next-step-link');
		if (_isSparcPassed) {
			sessionStorage.removeItem(sessionKeyShowPageId);
			//let pageIdToShow = sessionStorage.getItem(sessionKeyShowPageId);
			//message.innerHTML = "Congratulations on completing the programming task. Please click <a href='" + nextLessonUrl + "'> here </a> to go to next steps."
			
			// student passed root assessment, so allow student to go to next lesson
			if (_isSparcPassed && currentLearningOutcomeNumber == 0) {
				let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber + 1) + ".jsp";
				window.location.href = nextLessonUrl;
				// message.innerHTML = "You have passed the root assessment. please click <a href='" + nextLessonUrl + "'> here </a> to go to next lesson";
			}
			// passed all learning outcomes in the lesson
			else if (_isSparcPassed && currentLearningOutcomeNumber == currentLessonDetails.rootLearningOutcome.subLearningOutcomes.length) {
				let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber + 1) + ".jsp";
				window.location.href = nextLessonUrl;
				//message.innerHTML = "You have passed all the assessments. please click <a href='" + nextLessonUrl + "'> here </a> to go to next lesson";
			}
			else if (_isSparcPassed && currentLearningOutcomeNumber > 0) {
				let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber) + ".jsp";
				let nextLearningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(x=> x.learningOutcomeId ==  currentLearningOutcomeNumber+1)[0];
				let showPageId = nextLearningOutcomeDetails.pages[0].pageId;
				sessionStorage.setItem(sessionKeyShowPageId,showPageId);
				window.location.href = nextLessonUrl;
			}
		} else {
            let nextLearningOutcomeNumber = getNextLearningOutcomeIdUsingBinarySearch(currentLessonNumber, currentLearningOutcomeNumber);
            let nextLearningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(x => x.learningOutcomeId == nextLearningOutcomeNumber)[0];
            let nextPageId = nextLearningOutcomeDetails.pages[0].pageId;//getNextLearningOutcomeFirstPageId(currentLessonId, currentLearningOutcomeNumber);
            sessionStorage.setItem(sessionKeyShowPageId, nextPageId);

            let nextLessonUrl = "../jsp/lesson" + (currentLessonNumber) + ".jsp";
            window.location.href = nextLessonUrl; 
	 }
	}
</script>
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
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLongTitle">Assessment Result</h4>            
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="message-div" class="alert" role="alert">
			<p id="next-step-link"></p>			
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Stay in Assessment</button>
        <button type="button" class="btn btn-primary" onclick="onSparcResultGoToDestination()">Go to Next Page</button>
      </div>
    </div>
  </div>
</div>

<div class="footer">
 <div class="row" style="margin:1rem 5rem 0 5rem">
 	<div class="col-md-4">
	 	<div id="sparcFooterPrevBtn">
	 	     <button class="btn btn-primary pull-left" onclick="goToPreviousPage()" id="sparc-footer-prev-btn"> Prev</button>
	 	  </div>
 	</div>
 	<div class="col-md-4">
 	  <h4 style="text-align:center">Online SPARC</h4>
 	</div>
 	<div class="col-md-4"> 	
 	  <div id="sparcFooterNextBtn">
 	  	 <a id= "sparc-footer-skip-btn" class="btn btn-primary pull-right"  style="margin-top: 0px;margin-right: 160px;margin-left: -354px;background-color: lightcoral;"
	                    onclick="skipToLearningOutcome01()">Skip Pre-Assessment</a>
 	     <button class="btn btn-primary pull-right"  data-toggle="modal" data-target="#exampleModalCenter" onclick="SubmitSparc()" id="sparc-footer-next-btn"> Submit Assessment</button>
 	  </div>
 	</div>
 </div>

</div>

</body>

</html>
