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

sessionStorage.setItem("userId", 15);

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


const nextStepPage = "../jsp/postSubmit.jsp";
const sparcPage = "sparc.jsp";


//let lessonNumber = '<%=request.getParameter("lessonNumber")%>';
let quizContent = null;

function gotoNext(currentLessonNumber, currentLearningOutcomeNumber, currentPageId, isNextPageQuiz, nextAssessmentNumber) {
    // TODO: remove after integration
    sessionStorage.setItem(sessionKeyCurrentLessonNumber, currentLessonNumber.toString());
    sessionStorage.setItem(sessionKeyCurrentLearningOutcomeNumber, currentLearningOutcomeNumber.toString()); 

    let currentPageDetails = getCurrentPageDetailsFromJSON(currentLessonNumber, currentLearningOutcomeNumber,currentPageId);
    let nextPageId = currentPageDetails.nextPageId;

    let currentPage = document.getElementById(currentPageId);
    let nextPage = document.getElementById(nextPageId);

    currentPage.hidden = true;
    nextPage.hidden = false;

    // current_lesson_number = currentLessonNumber;
    // current_assessment_number = nextAssessmentNumber;
    // if (isNextPageQuiz) {
    //     gotoAssessment(currentLessonNumber, current_assessment_number);
    // }
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

    // current_lesson_number = currentLessonNumber;
    // current_assessment_number = previousAssessmentNumber;

    // if (isPreviousPageQuiz) {
    //     gotoAssessment(currentLessonNumber, current_assessment_number);
    // }
}

function gotoOnlineSparc(currentLessonNumber, learningOutcomeNumber, currentPageId, isNextSectionQuiz, nextAssessmentNumber, sparcPageValue) {
    sessionStorage.setItem(sessionKeyCurrentLessonNumber, currentLessonNumber.toString());
    sessionStorage.setItem(sessionKeyCurrentLearningOutcomeNumber, currentLearningOutcomeNumber.toString());

    let currentSection = document.getElementById(currentPageId);
    currentSection.hidden = true;
    // sessionStorage.setItem("showSectionId", nextSectionId);
    // sessionStorage.setItem("sparcValue", sparcPageValue);
    // window.location.href = "sparc.jsp";
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
    return currentPageDetails;
}

function submitAssessment(){
    // TODO:
    let isAssessmentPassed = true;//getGrading() == "pass" ? true : false;
    sessionStorage.setItem(sessionKeyIsAssessmentPassed, isAssessmentPassed);
    window.open(nextStepPage, "_self");
}


const studentLevel = ["good", "average", "lessgood"]
const result = ["pass", "fail"]

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

function getGrading(studentLevel) {
    return result[getRandomInt(result.length)]
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

let lessonsJson = {
    "lessons": [
        {
            "lessonId": 2,
            "lessonTitle": "Extend the family model",
            "rootLearningOutcome": {
                "learningOutcomeId": 0,
                "pages": [
                    {
                        "pageId": "version-1-course-x-lesson-2-page-1",
                        "previousPageId": null,
                        "nextPageId": "version-1-course-x-lesson-2-page-2"
                    },
                    {
                        "pageId": "version-1-course-x-lesson-2-page-2",
                        "previousPageId": "version-1-course-x-lesson-2-page-1",
                        "nextPageId": "version-1-course-x-lesson-2-page-3"
                    },
                    {
                        "pageId": "version-1-course-x-lesson-2-page-3",
                        "previousPageId": "version-1-course-x-lesson-2-page-2",
                        "nextPageId": "version-1-course-x-lesson-2-page-4"
                    },
                    {
                        "pageId": "version-1-course-x-lesson-2-page-4",
                        "previousPageId": "version-1-course-x-lesson-2-page-3",
                        "nextPageId": "version-1-course-x-lesson-2-page-5"
                    },
                    {
                        "pageId": "version-1-course-x-lesson-2-page-5",
                        "previousPageId": "version-1-course-x-lesson-2-page-4",
                        "nextPageId": "version-1-course-x-lesson-2-page-6"
                    },
                    {
                        "pageId": "version-1-course-x-lesson-2-page-6",
                        "previousPageId": "version-1-course-x-lesson-2-page-5",
                        "nextPageId1": "version-1-course-x-lesson-3-page-12",
                        "nextPageId2": "version-1-course-x-lesson-2-page-1"
                    }
                ],
                "subLearningOutcomes": [
                    {
                        "learningOutcomeId": 1,
                        "pages": [
                            {
                                "pageId": "version-1-course-x-lesson-2-page-7",
                                "previousPageId": "version-1-course-x-lesson-2-page-6",
                                "nextPageId": "version-1-course-x-lesson-2-page-8",
                                "isStartPage": true,
                                "isAssessmentPage": false
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-8",
                                "previousPageId": "version-1-course-x-lesson-2-page-7",
                                "nextPageId": "version-1-course-x-lesson-2-page-9",
                                "isStartPage": false,
                                "isAssessmentPage": false
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-9",
                                "previousPageId": "version-1-course-x-lesson-2-page-8",
                                "nextPageId": "version-1-course-x-lesson-2-page-10"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-10",
                                "previousPageId": "version-1-course-x-lesson-2-page-9",
                                "nextPageId": "version-1-course-x-lesson-2-page-11"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-11",
                                "previousPageId": "version-1-course-x-lesson-2-page-10",
                                "nextPageId1": "version-1-course-x-lesson-2-page-12",
                                "nextPageId2": "version-1-course-x-lesson-2-page-7"
                            }
                        ]
                    },
                    {
                        "learningOutcomeId": 2,
                        "pages": [
                            {
                                "pageId": "version-1-course-x-lesson-2-page-12",
                                "previousPageId": "version-1-course-x-lesson-2-page-11",
                                "nextPageId": "version-1-course-x-lesson-2-page-13"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-13",
                                "previousPageId": "version-1-course-x-lesson-2-page-12",
                                "nextPageId": "version-1-course-x-lesson-2-page-14"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-14",
                                "previousPageId": "version-1-course-x-lesson-2-page-13",
                                "nextPageId": "version-1-course-x-lesson-2-page-15"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-15",
                                "previousPageId": "version-1-course-x-lesson-2-page-14",
                                "nextPageId": "version-1-course-x-lesson-2-page-16"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-16",
                                "previousPageId": "version-1-course-x-lesson-2-page-15",
                                "nextPageId1": "version-1-course-x-lesson-2-page-17",
                                "nextPageId2": "version-1-course-x-lesson-2-page-12",
                                "nextPageId3": "version-1-course-x-lesson-2-page-7"
                            }
                        ]
                    },
                    {
                        "learningOutcomeId": 3,
                        "pages": [
                            {
                                "pageId": "version-1-course-x-lesson-2-page-17",
                                "previousPageId": "version-1-course-x-lesson-2-page-16",
                                "nextPageId": "version-1-course-x-lesson-2-page-18"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-18",
                                "previousPageId": "version-1-course-x-lesson-2-page-17",
                                "nextPageId": "version-1-course-x-lesson-2-page-19"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-19",
                                "previousPageId": "version-1-course-x-lesson-2-page-18",
                                "nextPageId": "version-1-course-x-lesson-2-page-20"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-20",
                                "previousPageId": "version-1-course-x-lesson-2-page-19",
                                "nextPageId": "version-1-course-x-lesson-2-page-21"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-21",
                                "previousPageId": "version-1-course-x-lesson-2-page-20",
                                "nextPageId": "version-1-course-x-lesson-2-page-22"
                            },
                            {
                                "pageId": "version-1-course-x-lesson-2-page-22",
                                "previousPageId": "version-1-course-x-lesson-2-page-21",
                                "nextPageId1": "version-1-course-x-lesson-3-page-1",
                                "nextPageId2": "version-1-course-x-lesson-2-page-17",
                                "nextPageId3": "version-1-course-x-lesson-2-page-12"
                            }
                        ]
                    }
                ]
            }
        }
    ]
}
