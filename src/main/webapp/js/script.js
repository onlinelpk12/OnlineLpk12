let total_learning_outcomes = 3;
let current_lesson_number = -1;
let current_assessment_number = -1;
function disableElement(id) {
    let element = document.getElementById(id);
    if (element) {
        element.disabled = true
    }
}

const apiBaseUrl = "https://onlinelpk12appservice.azurewebsites.net/api";
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

    let currentPageDetails = getCurrentPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,currentPageId);
    let nextPageId = currentPageDetails.nextPageId;

    let currentPage = document.getElementById(currentPageId);
    let nextPage = document.getElementById(nextPageId);

    currentPage.hidden = true;
    nextPage.hidden = false;
    
    SaveStudentLessonsProgress(currentLessonNumber, currentLearningOutcomeNumber, currentPageId);
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

function submitAssessment(currentPageId, textAreaId){
 SaveStudentLessonsProgressThroughAPI(parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber)), parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber)), currentPageId);
  
    
  let input = document.getElementById(textAreaId).value;
  let isAssessmentPassed = null;
  let assessmentStatus = null;
  let score = 0;
  if(input == null || input == undefined || input.trim().length == 0){
    isAssessmentPassed = false;
  }
  else{
    let answer = null;
    if(textAreaId == "program0" || textAreaId == "program3"){
     answer = "%Joaan is the mother of peter mother (joaan, peter)"   
    }
    else if(textAreaId == "program1"){
     answer = "%John is a parent of Peter parent(john, peter)";
    }
    else if(textAreaId == "program2"){
     answer = "%John is the dad of peter dad(john, peter)";
    }
    score = getGrading(studentLevel[getRandomInt(studentLevel.length)], input, answer);
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
        SaveStudentAssessmentSubmissionThroughAPI(question, submittedAnswer)])
        .then(function (responses) {
            return Promise.all(responses.map(function (response) { return response; }));
        }).then(function (data) {
            //	console.log(data);
        })
        .catch(function (error) {
            // console.log(error);
        });
    
    window.open(nextStepPage, "_self");
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

    const saveStudentAssessmentSubmissionAPIUrl = "https://onlinelpk12dotnetapi.azurewebsites.net/api/Student/" + assessmentSubmissionRequest.studentId + "/assessmentDetails";
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

    const saveStudentAssessmentStatusAPIUrl = "https://onlinelpk12dotnetapi.azurewebsites.net/api/Student/"+assessmentStatusRequest.studentId+"/assessmentStatus";
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
      
      const saveStudentProgressAPIUrl = "https://onlinelpk12dotnetapi.azurewebsites.net/api/Student/"+studentLessonProgressRequest.studentId+"/lessonprogress";
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

function gotoNextAfterAssessment(isAssessmentPassed) {
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
