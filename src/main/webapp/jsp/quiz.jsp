<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    </head>

    <body> 
        <jsp:include page="header.jsp" />

        <div class="row">
            <div id="erros-section-main" class="col-md-9 p-3" style="display:none;margin-top:20px; padding-left:30%">
                <div id="errors" class="alert alert-danger" style="display:flex; width: fit-content;" role="alert">

                </div>
            </div>
            <div id="score-section-main" class="col-md-9 p-3" style="display:none;margin-top:20px; padding-left:30%">
                <div id="score-section" class="alert" style="display:flex; width: fit-content;" role="alert">
                    <div id="score-section-emoji"></div>
                    <div id="score-section-message"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 p-3" style="padding-left:31%">
                <h3 id="lesson-name"></h3>
            </div>
            <div class="col-md-6 p-3" id="quiz-section" style="padding-left:30%">
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>

    <script type="text/javascript">
        const apiBaseUrl = "https://onlinelpk12appservice.azurewebsites.net/api";
        const lessonsUrl = "/onlineSystem/lessonnumber.jsp"
        
        //sessionStorage.setItem("userId", 10);
        
        let userIdFromSession = 0;
        let userId = sessionStorage.getItem("userId");
        if (userId) {
        	userIdFromSession = parseInt(userId);
        }
        
        let lessonNumber = '<%=request.getParameter("lessonNumber")%>';
        let quizContent = null;
        window.onload = function () {
            getApiData(lessonNumber);
        }

        function getApiData(lessonNumber) {
            // this will the response we get from .NET API. Once once we have API published just replace the API URL, it will work as epxcted.	
            var response = null;
            let getQuizApiUrl = apiBaseUrl + "/StudentProgress/quiz?lessonId=" + lessonNumber+"&userId="+userIdFromSession;
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
                        ShowQizzesInUI(data.content);

                    },
                    error: function (error) {
                        showErrorsInUI(error);
                    }
                });
            }
            catch (error) {
                console.log("error occured");
            }
            return response;
        }

        function showErrorsInUI(error) {
            let errorsList = "<ul>"
            if (!isNullOrUndefined(error)) {
                let obj = JSON.parse(error.responseText);
                if (!isNullOrUndefined(obj)) {
                    for (let i = 0; i < obj.errors.length; i++) {
                        errorsList += "<li>" + obj.errors[i] + "</li>"
                    }
                    errorsList += "</ul>"
                }
                errorsSectionMain = document.getElementById('erros-section-main');
                errorsSectionMain.style.display = '';
                errorsSection = document.getElementById('errors');
                errorsSection.innerHTML = errorsList;
            }

        }

        function ShowQizzesInUI(quizObj) {
            let element = document.getElementById('lesson-name');
            element.innerHTML = "Lesson " + quizObj.lessonId + ". " + quizObj.lessonName;
            let questions = "";
            for (let i = 0; i < quizObj.questions.length; i++) {
                let question = "<div  class='container' style='margin-top:15px'> <p><strong>" + (i+1) + ". " + quizObj.questions[i].questionDescription + "</strong></p>";
                let options = "<div style='margin-left:10px'>";
                
                if(quizObj.isTeacher || quizObj.status.toLowerCase() == "pass"){ // quiz passed
                	for (let j = 0; j < quizObj.questions[i].options.length; j++) {
                		let checked = "";
                		let option = "";
                		if(quizObj.questions[i].options[j].optionId == quizObj.questions[i].answerOption){
                			option = "<label class='radio-inline'> <input disabled checked type='radio' id='";
                		}
                		else{
                			option = "<label class='radio-inline'> <input disabled type='radio' id='";
                		}
                        
                        option += "ques_" + (quizObj.questions[i].id) + "_opt_" + (quizObj.questions[i].options[j].optionId) + "'";
                        option += "name = 'ques_" + (quizObj.questions[i].id) + "_ans" + "'>"
                        option += quizObj.questions[i].options[j].optionDescription
                        option += "</label>";
                        options += option;
                    }
                }
                else{
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
            if(!quizObj.isTeacher && quizObj.status.toLowerCase() != "pass"){ // quiz not passed)
            	questions += "<div style='text-align:center;padding-top:20px'><button class='btn btn-primary' onclick='submitQiz();'> Submit Quiz </button></div>"	
            }
            else if(!quizObj.isTeacher){
            	questions += "<div style='text-align:center;padding-top:20px'><button disabled class='btn btn-primary' onclick='submitQiz();'> Submit Quiz </button></div>"
            }
            
            $('#quiz-section').html(questions);
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
                        showScoreToUser(score);                    
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
            return { score: score_secured, isSuccess: success }
        }

        function showScoreToUser(score) {        	      	        
        	score = score *100;
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
                        scoreSectionMessage.innerHTML = " Congratualtions! You have passed the quiz for this lesson. You have secured a score of " + score + "%.";
                    }
                }
                else {
                	scoreSection.classList.remove('alert-success');
                    scoreSection.classList.add('alert-danger');
                    if (!isNullOrUndefined(scoreSectionEmoji)) {
                        scoreSectionEmoji.innerHTML = "&#128524;"; // sad face emoji
                    }
                    if (!isNullOrUndefined(scoreSectionMessage)) {                    	
                        scoreSectionMessage.innerHTML = " You have not passed the quiz. You have secured a score of " + score + "%." + " You must score 70% or more to pass the quiz." + " We recommend you to go through lessons and learn the concepts <a href='"+lessonsUrl+"'>here</a>";
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

    </script>

    </html>