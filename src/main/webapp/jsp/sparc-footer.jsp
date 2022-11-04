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
 	  	 <a id= "sparc-footer-skip-btn" class="btn btn-primary pull-right"  style="margin-top: 0px;margin-right: 76px;margin-left: -232px;background-color: lightcoral;"
	                    onclick="skipToLearningOutcome01()">Skip Pre-Assessment</a>
 	     <button class="btn btn-primary pull-right" onclick="SubmitSparc()" id="sparc-footer-next-btn"> Next</button>
 	  </div>
 	</div>
 </div>

</div>

</body>

</html>
