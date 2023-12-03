//let total_learning_outcomes = 3;
let current_lesson_number = -1;
let current_assessment_number = -1;
function disableElement(id) {
    let element = document.getElementById(id);
    if (element) {
        element.disabled = true
    }
}

const apiBaseUrl = "https://localhost:7155/api";
const lessonsUrl = "/onlineSystem/lessonnumber.jsp"

let userIdFromSession = 0;
let userId = sessionStorage.getItem("userId");
if (userId) {
    userIdFromSession = parseInt(userId);
}

const sessionKeyCurrentLessonNumber = "currentLessonNumber";
const sessionKeyCurrentLearningOutcomeNumber = "currentLearningOutcomeNumber";
const sessionKeyShowPageId = "pageIdToShow";
const sessionKeyIsAssessmentPassed = "isAssessmentPassed";
const sessionKeyIsSparcPassed = "isSparcPassed";


const nextStepPage = "postSubmit.jsp";
const sparcPage = "sparc.jsp";


//let lessonNumber = '<%=request.getParameter("lessonNumber")%>';
let quizContent = null;

function gotoNext(currentLessonNumber, currentLearningOutcomeNumber, currentPageId, isNextPageQuiz, nextAssessmentNumber) {
    sessionStorage.setItem(sessionKeyCurrentLessonNumber, currentLessonNumber.toString());
    sessionStorage.setItem(sessionKeyCurrentLearningOutcomeNumber, currentLearningOutcomeNumber.toString()); 
    sessionStorage.setItem(sessionKeyShowPageId, currentPageId.toString())

    let currentPageDetails = getCurrentPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,currentPageId);
    let nextPageId = currentPageDetails.nextPageId;
    
    //#119 Workbook Integration
    let nextPageDetails = getNextPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,nextPageId);
    if(nextPageDetails.pageType!="SparcPage"){		
	    let currentPage = document.getElementById(currentPageId);
	    let nextPage = document.getElementById(nextPageId);
	
	    currentPage.hidden = true;
	    nextPage.hidden = false;	
	}else{
		sessionStorage.setItem(sessionKeyShowPageId, nextPageId.toString())
		window.open(sparcPage, "_self");
	}
    SaveStudentLessonsProgressThroughAPI(currentLessonNumber, currentLearningOutcomeNumber, currentPageId);
}


function gotoPrevious(currentLessonNumber, currentLearningOutcomeNumber, currentPageId, isPreviousPageQuiz, previousAssessmentNumber) {
    sessionStorage.setItem(sessionKeyCurrentLessonNumber, currentLessonNumber.toString());
    sessionStorage.setItem(sessionKeyCurrentLearningOutcomeNumber, currentLearningOutcomeNumber.toString());
    
    let currentPageDetails = getCurrentPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,currentPageId);
    let previousPageId = currentPageDetails.previousPageId;
   
    let currentSection = document.getElementById(currentPageId);
    let previousSection = document.getElementById(previousPageId);
    currentSection.hidden = true;
    previousSection.hidden = false;
}

function gotoOnlineSparc(currentLessonNumber, learningOutcomeNumber, currentPageId, isNextSectionQuiz, nextAssessmentNumber, sparcPageValue) {
    sessionStorage.setItem(sessionKeyCurrentLessonNumber, currentLessonNumber.toString());
    sessionStorage.setItem(sessionKeyCurrentLearningOutcomeNumber, currentLearningOutcomeNumber.toString());

    let currentSection = document.getElementById(currentPageId);
    currentSection.hidden = true;
}

function GetFirstPageIdOfCurrentLessonFromJSON(currentLessonId){
    let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonId)[0];
    let firstPageDetails = currentLessonDetails.rootLearningOutcome.pages[0];
    return firstPageDetails.pageId;
}

function getCurrentPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,currentPageId){
    let currentPageDetails = null;
    let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonNumber)[0];
    if (currentLearningOutcomeNumber == currentLessonDetails.rootLearningOutcome.learningOutcomeId) {
        currentPageDetails = currentLessonDetails.rootLearningOutcome.pages.filter(page => page.pageId == currentPageId)[0];
    }
    else{
        let learningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(x=> x.learningOutcomeId == currentLearningOutcomeNumber)[0];
        currentPageDetails =  learningOutcomeDetails.pages.filter(page => page.pageId == currentPageId)[0];
    }
    return currentPageDetails;
}

//119 
function getNextPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,nextPageId){
    let nextPageDetails = null;
    let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonNumber)[0];
    if (currentLearningOutcomeNumber == currentLessonDetails.rootLearningOutcome.learningOutcomeId) {
        nextPageDetails = currentLessonDetails.rootLearningOutcome.pages.filter(page => page.pageId == nextPageId)[0];
    }
    else{
        let learningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(x=> x.learningOutcomeId == currentLearningOutcomeNumber)[0];
        nextPageDetails =  learningOutcomeDetails.pages.filter(page => page.pageId == nextPageId)[0];
    }
    return nextPageDetails;
}


const studentLevel = ["good", "average", "lessgood"]
const result = ["pass", "fail"]

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

function getGrading(studentLevel, input, answer) {
     let percentageMatching = similarity(input, answer)*100;
    
    return  percentageMatching.toFixed();
    //return result[getRandomInt(result.length)]
}

function submitAssessment(currentPageId, consoleOutput, isSparcPassed){
 SaveStudentLessonsProgressThroughAPI(parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber)), parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber)), currentPageId);
     
  let submittedAnswer = consoleOutput;
  let isAssessmentPassed = null;
  let assessmentStatus = null;
  let score = 0;
  let actualQuestionAns = null;
  if(submittedAnswer == null || submittedAnswer == undefined || submittedAnswer.trim().length == 0){
    isAssessmentPassed = false;
  }
  else{
    let currentLessonNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber));
    let currentLearningOutcomeNumber =  parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber));
    //actualQuestionAns =  getAssessmentQuestionAndAnswer(currentLessonNumber, programId);
    actualQuestionAns =  getActivityInformation(currentLessonNumber, currentLearningOutcomeNumber);
    
    //score = getGrading(studentLevel[getRandomInt(studentLevel.length)], submittedAnswer, actualQuestionAns.answer);
    score = isSparcPassed ? 100 : 50;
      if(score >= 70){
        isAssessmentPassed = true;
        assessmentStatus = "pass"
    }
    else{
        assessmentStatus = "fail";
    }
  }
    sessionStorage.setItem(sessionKeyIsAssessmentPassed, isAssessmentPassed);
    
    Promise.all(
        [SaveStudentAssessmentStatusThroughAPI(score, 100, assessmentStatus),
        SaveStudentAssessmentSubmissionThroughAPI(actualQuestionAns.question, submittedAnswer)])
        .then(function (responses) {
            return Promise.all(responses.map(function (response) { return response; }));
        }).then(function (data) {
            //	console.log(data);
        })
        .catch(function (error) {
            // console.log(error);
        });
    
    //window.open(nextStepPage, "_self");
}

function getAssessmentQuestionAndAnswer(currentLessonNumber, programId)
{
    let question = null;
    let answer = null;
    if(currentLessonNumber == 2)
    {
        if(programId == "program0" || programId == "program3"){
            question = "Extent your model for the relation of mom";
            answer = "%Joaan is the mother of peter mother (joaan, peter)"   
        }
        else if(programId == "program1"){
            question = "Extend Family Model for Parent of Peter";
            answer = "%John is a parent of Peter parent(john, peter)";
        }
        else if(programId == "program2"){
            question = "Extend your Model for dad of peter";
            answer = "%John is the dad of peter dad(john, peter)";
        }
    }
    else if(currentLessonNumber == 3)
    {
        if(programId == "program0"){
            question = "who is the mother of Peter?";
            answer = "%Joaan is the mother of peter mother(Joaan, peter)";  
        }
        else if(programId == "program1"){
            question = "Extend your model for who is the father of Peter?";
            answer = "%John is a father of Peter father(John, peter)";
        }
        else if(programId == "program2"){
            question = 'Extend your Model for "Whom is John the father of?"';
            answer = "%John is the father of peter father(john, peter)";
        }
        else if(programId == "program3")
        {
            question = 'Extend your Model for "Who is the Dad of Peter?"';
            answer = "%John is the dad of peter dad(john, peter)";
        }
    }
    else if(currentLessonNumber == 4)
    {
        if(programId == "program0" || programId == "program3"){
            question = 'Extend your model for "parent" rule';
            answer = "%Joaan is the parent of peter parent (joaan, peter)"   
        }
        else if(programId == "program1"){
            question = "Extend your model for dad rule";
            answer = "%John is a dad of Peter dad(john, peter)";
        }
        else if(programId == "program2"){
            question = "Extend your model for mon rule";
            answer = "%Jooan is the mom of peter mom(Jooan, peter)";
        }
        else if(programId == "program3")
        {
            question = "Extend your model for parent rule";
            answer = "%John is the parent of peter parent(john, peter)";
        }
    }
    else if(currentLessonNumber == 5)
    {
    	let elementSelectedFlag = sessionStorage.getItem("elementSelected");
    	let elementName = sessionStorage.getItem("elementName");
    	let symbolSelected = sessionStorage.getItem("elementSymbol");
        if(programId == "program0" || programId == "program4"){
            question = 'Extend your model for one of the first 20 elements in the periodic table';
            answer = "% The chemical symbol for helium is He symbolFor(helium, he)"   
        }
        else if(programId == "program1"){
            question = "Extend your model for Hydrogen";
            answer = "% The chemical symbol for hydrogen is H symbolFor(hydrogen, h)";
        }
        else if(programId == "program2"){
            question = "Extend your model for Carbon";
            answer = "% The chemical symbol for carbon is C symbolFor(carbon, c)";
        }
        else if(programId == "program3" && elementSelectedFlag)
        {
            question = "Extend your model for any element";
            answer = "% The chemical symbol for "+elementName+" is "+symbolSelected+" symbolFor("+elementName+", "+symbolSelected+")";
        }
        else if(programId == "program3" && !elementSelectedFlag){
        	question = "Extend your model for Phosphorus";
            answer = "% The chemical symbol for helium is He symbolFor(helium, he)";        
        }
    }
    else if(currentLessonNumber == 6){
		let elementSelectedFlag = sessionStorage.getItem("elementSelected");
    	let elementName = sessionStorage.getItem("elementName");
    	let symbolSelected = sessionStorage.getItem("elementSymbol");
		if(programId == "program0"){
            question = 'What is the proton and atomic number of carbon ?';
            answer = "% The atomic number of carbon is 6 atomicNumber(carbon, 6)";   
        }
        else if(programId == "program1"){
			question = 'What is the proton and atomic number of hydrogen ?';
            answer = "% The atomic number of hydrogen is 1 atomicNumber(hydrogen, 1)";   
		}
		else if(programId == "program2"){
			question = 'What is the proton and atomic number of oxygen ?';
            answer = "% The atomic number of oxygen is 8 atomicNumber(oxygen, 8)";
		}
		else if(programId == "program3" && elementSelectedFlag){			
    		question = "Extend your model for any element";
            answer = "% The atomic number of "+elementName+" is "+symbolSelected+" atomicNumber("+elementName+", "+symbolSelected+")";
		}
	}
    else if(currentLessonNumber == 7){
		let elementSelectedFlag = sessionStorage.getItem("elementSelected");
    	let elementProtonNumber = sessionStorage.getItem("elementProtonNumber");
    	let symbolSelected = sessionStorage.getItem("elementSymbol");
		if(programId == "program0"){
            question = 'write the relation rule protron and atomic number of hydrogen?';
            answer = "% protonsOf(E, N) :- atomicNumber(E, N).";   
        }
        else if(programId == "program1"){
			question = 'Write query about protrons of  hydrogen ?';
            answer = "% The proton number of hydrogen is 1 protonsOf(H,1)";   
		}
		else if(programId == "program2"){
			question = 'write the relation between proton and atomic number of the hydrogen of element H?';
            answer = "% N is the atomic number of the element E if N is the number of protons of element E protonsOf(E, N) :- atomicNumber(E, N)";
		}
		else if(programId == "program3"){
			question = 'write the relation between atomic and protron number of the hydrogen of element H?';
            answer = "% N is the atomic number of the element. if N is the number of protons of element E. atomicNumber(E, N) :- protonsOf(E, N).";
		}
		else if(programId == "program4" && elementSelectedFlag){			
    		question = "write the relation between atomic and proton number of the element";
            answer = "% The number of protons of the atom of an element"+symbolSelected+" is "+elementProtonNumber+", if "+elementProtonNumber+" is the atomic number of the element "+symbolSelected+".protonsOf("+symbolSelected+","+elementProtonNumber+") :- atomicNumber("+symbolSelected+", "+elementProtonNumber+")."+elementProtonNumber+" is the atomic number of the element "+symbolSelected+" if "+elementProtonNumber+" is the number of protons of element "+symbolSelected+".atomicNumber("+symbolSelected+", "+elementProtonNumber+") :- protonsOf("+symbolSelected+", "+elementProtonNumber+").";
		}
	}
   return {"question" : question, "answer" : answer}; 
}


function SaveStudentAssessmentSubmissionThroughAPI(question, submittedAnswer) {    
    let assessmentSubmissionRequest = {
        assessmentId: 0,
        lessonId: parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber)),
        studentId: parseInt(sessionStorage.getItem("userId")),
        learningOutcome: parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber)),
        questionAnswers: [
            {
                question: question,
                answer: submittedAnswer
            }
        ]
    }

    const saveStudentAssessmentSubmissionAPIUrl = apiBaseUrl+ "/Student/" + assessmentSubmissionRequest.studentId + "/assessmentDetails";
    $.ajax({
        contentType: 'application/json',
        data: JSON.stringify(assessmentSubmissionRequest),
        dataType: 'json',
        type: 'POST',
        url: saveStudentAssessmentSubmissionAPIUrl,
        success: function (data) {
            return data;
        },
        statusCode: {
            400: function (error) {
                return error;
            },
            404: function (error) {
                return error;
            },
            500: function (error) {
                return error;
            }
        },
        error: function (error) {
            return error;
        }
    });
}

function SaveStudentAssessmentStatusThroughAPI(score, totalScore, assessmentStatus){   
    let assessmentStatusRequest =  {
        assessmentId: 0,
        lessonId: parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber)),
        studentId: parseInt(sessionStorage.getItem("userId")),
        learningOutcome:  parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber)),
        status : assessmentStatus,
        score: score,
        totalScore: totalScore
      }

    const saveStudentAssessmentStatusAPIUrl = apiBaseUrl+ "/Student/"+assessmentStatusRequest.studentId+"/assessmentStatus";
  $.ajax({
      contentType: 'application/json',
      data: JSON.stringify(assessmentStatusRequest),
      dataType: 'json',
      type: 'POST',
      url: saveStudentAssessmentStatusAPIUrl,
      success: function (data) {
         
      },
      statusCode: {
          400: function (error) {
          },
          404: function (error) {
          },
          500: function (error) {
          }
      },
      error: function (error) {
      }       
  });
}


function similarity(s1, s2) {
    var longer = s1;
    var shorter = s2;
    if (s1.length < s2.length) {
      longer = s2;
      shorter = s1;
    }
    var longerLength = longer.length;
    if (longerLength == 0) {
      return 1.0;
    }
    return (longerLength - editDistance(longer, shorter)) / parseFloat(longerLength);
  }

  function editDistance(s1, s2) {
    s1 = s1.toLowerCase();
    s2 = s2.toLowerCase();
  
    var costs = new Array();
    for (var i = 0; i <= s1.length; i++) {
      var lastValue = i;
      for (var j = 0; j <= s2.length; j++) {
        if (i == 0)
          costs[j] = j;
        else {
          if (j > 0) {
            var newValue = costs[j - 1];
            if (s1.charAt(i - 1) != s2.charAt(j - 1))
              newValue = Math.min(Math.min(newValue, lastValue),
                costs[j]) + 1;
            costs[j - 1] = lastValue;
            lastValue = newValue;
          }
        }
      }
      if (i > 0)
        costs[s2.length] = lastValue;
    }
    return costs[s2.length];
  }

  function SaveStudentLessonsProgressThroughAPI(lessonId, learningOutcomeId, pageId){
     let pageIdIndex = pageId.indexOf("page");
     let ActualpageId = pageId.substring(pageIdIndex,pageId.length).replace("page-","");
     
      let studentLessonProgressRequest = {
          studentId: parseInt(sessionStorage.getItem('userId')),
          lessonId: lessonId,
          learningOutcome: learningOutcomeId,
          pageNumber: parseInt(ActualpageId),
          activityTime: null
        };
      
      const saveStudentProgressAPIUrl = apiBaseUrl+ "/Student/"+studentLessonProgressRequest.studentId+"/lessonprogress";
    $.ajax({
        contentType: 'application/json',
        data: JSON.stringify(studentLessonProgressRequest),
        dataType: 'json',
        type: 'POST',
        url: saveStudentProgressAPIUrl,
        success: function (data) {
           
        },
        statusCode: {
            400: function (error) {
            },
            404: function (error) {
            },
            500: function (error) {
            }
        },
        error: function (error) {
        }       
    });
  }
// above functions are used now.

/*function gotoNextAfterAssessment(isAssessmentPassed) {
    if (isAssessmentPassed && (current_assessment_number == 0 || current_assessment_number == total_learning_outcomes)) {
        let nextLessonUrl = "lesson" + (current_lesson_number + 1) + ".html"
        window.open(nextLessonUrl, "_self");
    }
    else if (isAssessmentPassed && current_assessment_number > 0) {
        let nextLearningOutcome = current_assessment_number + 1;
        gotoNext(2, 'assessment', 'learning-outcome-' + nextLearningOutcome, false, -1);
    }
    else {
        let nextLearningOutcome = getNextLearningOutcomeId();
        gotoNext(2, 'assessment', 'learning-outcome-' + nextLearningOutcome, false, -1);
    }
}

function getNextLearningOutcomeId() {
    if (current_assessment_number == 0) {
        return Math.ceil(total_learning_outcomes / 2);
    }
    else if (current_assessment_number == 1) {
        return 1;
    }
    return Math.ceil(current_assessment_number / 2);
}

function cleanUpAssessmentMessagesSection() {
    let errorsSectionMain = document.getElementById('errors-section-main');
    let ScoreSectionMain = document.getElementById('score-section-main');
    let scoreSection = document.getElementById('score-section');
    let scoreSectionMessage = document.getElementById('score-section-message');
    let scoreSectionEmoji = document.getElementById('score-section-emoji');
    let scoreSectionErrors = document.getElementById('errors');

    if (scoreSection) {
        scoreSection.classList.remove('alert-danger');
    }

    if (scoreSectionMessage) {
        scoreSectionMessage.innerHTML = '';
    }
    if (scoreSectionEmoji) {
        scoreSectionEmoji.innerHTML = '';
    }
    if (scoreSectionErrors) {
        scoreSectionErrors.innerHTML = '';
    }
}

function gotoAssessment(lessonNumber, assessmentNumber) {
    getApiData(lessonNumber, assessmentNumber);
}

function getApiData(lessonNumber, assessmentNumber) {
    // this will the response we get from .NET API. Once once we have API published just replace the API URL, it will work as expected.	
    var response = null;
    let getQuizApiUrl = apiBaseUrl + "/StudentProgress/quiz?lessonId=" + (assessmentNumber + 2) + "&userId=" + userIdFromSession;
    try {
        $.ajax({
            statusCode: {
                400: function (error) {
                    showErrorsInUI(error);
                },
                404: function (error) {
                    showErrorsInUI(error);
                },
                500: function (error) {
                    showErrorsInUI(error);
                }
            },
            url: getQuizApiUrl,
            async: false,
            type: 'GET',
            success: function (data) {
                quizContent = data.content;
                ShowQuizzesInUI(data.content);

            },
            error: function (error) {
                showErrorsInUI(error);
            }
        });
    }
    catch (error) {
        console.log("error occurred");
    }
    return response;
}

function showErrorsInUI(error) {
    cleanUpAssessmentMessagesSection();

    let errorsList = "<ul>"
    if (!isNullOrUndefined(error)) {
        let obj = JSON.parse(error.responseText);
        if (!isNullOrUndefined(obj)) {
            for (let i = 0; i < obj.errors.length; i++) {
                errorsList += "<li>" + obj.errors[i] + "</li>"
            }
            errorsList += "</ul>"
        }
        errorsSectionMain = document.getElementById('errors-section-main');
        errorsSectionMain.style.display = '';
        errorsSection = document.getElementById('errors');
        errorsSection.innerHTML = errorsList;
    }

}

function ShowQuizzesInUI(quizObj) {

    cleanUpAssessmentMessagesSection();

    let element = document.getElementById('lesson-name');
    if (current_assessment_number == 0) {
        element.innerHTML = "Overall assessment for lesson 2";
    }
    else {
        element.innerHTML = "Assessment for Learning outcome " + (current_assessment_number) + ". ";
    }

    let questions = "";
    for (let i = 0; i < quizObj.questions.length; i++) {
        let question = "<div  class='container' style='margin-top:15px'> <p><strong>" + (i + 1) + ". " + quizObj.questions[i].questionDescription + "</strong></p>";
        let options = "<div style='margin-left:10px'>";

        if (quizObj.isTeacher || quizObj.status.toLowerCase() == "pass") { // quiz passed
            for (let j = 0; j < quizObj.questions[i].options.length; j++) {
                let checked = "";
                let option = "";
                if (quizObj.questions[i].options[j].optionId == quizObj.questions[i].answerOption) {
                    option = "<label class='radio-inline'> <input disabled checked type='radio' id='";
                }
                else {
                    option = "<label class='radio-inline'> <input disabled type='radio' id='";
                }

                option += "ques_" + (quizObj.questions[i].id) + "_opt_" + (quizObj.questions[i].options[j].optionId) + "'";
                option += "name = 'ques_" + (quizObj.questions[i].id) + "_ans" + "'>"
                option += quizObj.questions[i].options[j].optionDescription
                option += "</label>";
                options += option;
            }
        }
        else {
            for (let j = 0; j < quizObj.questions[i].options.length; j++) {
                let option = "<label class='radio-inline'> <input type='radio' id='";
                option += "ques_" + (quizObj.questions[i].id) + "_opt_" + (quizObj.questions[i].options[j].optionId) + "'";
                option += "name = 'ques_" + (quizObj.questions[i].id) + "_ans" + "'>"
                option += quizObj.questions[i].options[j].optionDescription
                option += "</label>";
                options += option;
            }
        }
        options += "</div>";
        question += options
        question += "</div>"
        questions += question;
    }

    $('#quiz-section').html(questions);
    if (quizObj.isTeacher || quizObj.status.toLowerCase() == "pass") {
        disableElement('submit-quiz-button');
    }
}

function submitQiz() {
    let selectedAns = getSelectedOptions();
    let submitQuizRequest = buildSubmitQuizRequest(selectedAns);
    PostQuiz(submitQuizRequest);
}

function getSelectedOptions() {
    selectedAns = [];
    for (let i = 0; i < quizContent.questions.length; i++) {
        let optionName = "ques_" + (quizContent.questions[i].id) + "_ans";
        let options = document.getElementsByName(optionName);
        if (options != null && options != undefined && options.length > 0) {
            for (let j = 0; j < options.length; j++) {
                let option = options[j];
                if (option != null && option != undefined && option.checked) {
                    if (option.id != null && option.id != undefined) {
                        let fullOptionId = option.id.split("_");
                        if (fullOptionId != null && fullOptionId != undefined && fullOptionId.length > 3) {
                            let selectedOptionId = fullOptionId[3];
                            let ans = {
                                "id": quizContent.questions[i].id,
                                "selectedOption": (selectedOptionId),
                            }
                            selectedAns.push(ans);
                            break;
                        }
                    }
                }
            }
        }
    }
    return selectedAns;
}

function buildSubmitQuizRequest(selectedAns) {
    let SubmitQuizRequest = {
        "quizId": 0,
        "lessonId": 0,
        "userId": 0,
        "questions": []
    }
    if (quizContent.lessonId) {
        SubmitQuizRequest.lessonId = quizContent.lessonId;
    }
    if (quizContent.quizId) {
        SubmitQuizRequest.quizId = quizContent.quizId;
    }

    if (userIdFromSession) {
        SubmitQuizRequest.userId = userIdFromSession;
    }

    SubmitQuizRequest.questions = selectedAns;

    return SubmitQuizRequest;
}

function PostQuiz(submitQuizRequest) {
    let postQuizApiUrl = "";
    let score_secured = 0;
    let success = false;
    if (!isNullOrUndefined(quizContent)) {
        postQuizApiUrl = apiBaseUrl + "/StudentProgress/quiz/";
    }

    $.ajax({
        contentType: 'application/json',
        data: JSON.stringify(submitQuizRequest),
        dataType: 'json',
        success: function (data) {
            let score = isNullOrUndefined(data.content.quizScore) ? 0 : data.content.quizScore;
            score = score * 100;
            showScoreToUser(score);

            // decide what will be the next step
            setTimeout(function () {
                gotoNextAfterAssessment(score >= 70);
            }, 5000);
        },
        statusCode: {
            400: function (error) {
                showErrorsInUI(error);
            },
            404: function (error) {
                showErrorsInUI(error);
            },
            500: function (error) {
                showErrorsInUI(error);
            }
        },
        error: function (error) {
            showErrorsInUI(error)
        },
        type: 'POST',
        url: postQuizApiUrl
    });
}

function showScoreToUser(score) {
    let scoreSectionMain = document.getElementById('score-section-main');
    let scoreSection = document.getElementById('score-section');
    let scoreSectionEmoji = document.getElementById('score-section-emoji');
    let scoreSectionMessage = document.getElementById('score-section-message');
    if (!isNullOrUndefined(scoreSection)) {
        if (score >= 70) {
            scoreSection.classList.remove('alert-danger');
            scoreSection.classList.add('alert-success');
            if (!isNullOrUndefined(scoreSectionEmoji)) {
                scoreSectionEmoji.innerHTML = "&#128512;"; // smiling face emoji        				
            }
            if (!isNullOrUndefined(scoreSectionMessage)) {
                scoreSectionMessage.innerHTML = " Congratulations! You have passed the quiz for this lesson. You have secured a score of " + score + "%.";
            }
        }
        else {
            scoreSection.classList.remove('alert-success');
            scoreSection.classList.add('alert-danger');
            if (!isNullOrUndefined(scoreSectionEmoji)) {
                scoreSectionEmoji.innerHTML = "&#128524;"; // sad face emoji
            }
            if (!isNullOrUndefined(scoreSectionMessage)) {
                scoreSectionMessage.innerHTML = " You have not passed the quiz. You have secured a score of " + score + "%.";
            }
        }
        if (scoreSectionMain) {
            scoreSectionMain.style.display = '';
        }
    }
    let errosSection = document.getElementById('errors');
    errosSection.style.display = "none";
}


function isNullOrUndefined(input) {
    return input == null || input == undefined;
}
*/