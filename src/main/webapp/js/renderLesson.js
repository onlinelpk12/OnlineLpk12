
    var pdfDoc;
    var count = 0;
    var answers ;
    
        window.onload = function () {
        	const queryString = window.location.search;
        	const urlParams = new URLSearchParams(queryString);
        	const lesson = urlParams.get('lesson');
            const getLessonAPI = "http://localhost:8083/api/auth/getLesson";
            const cn = "Onlinelpk12";
         
            
            fetch(getLessonAPI, {
                method: 'POST',
                body: JSON.stringify({
                    "course_name": cn,
                    "lesson_name": lesson
                }),
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                }
            }).then(function (response) {
                var resp = response.json();
                if (response.status == 200) {
                    resp.then((lessonData) => {
                        fetchAssessment(lessonData.pdf,lesson,cn);
                    });
                } else {
                    if (response.status == 404) {
                        resp.then((data) => {
                            alert(data.message);
                        });
                    } else if (response.status == 401) {
                        resp.then((data) => {
                            alert(data.message);
                        });
                    }
                }
            }).then(function (data) {});
        };
        
        function fetchAssessment(data,lesson,cn)
        {
            
            const getAssessmentAPI = "http://localhost:8083/api/auth/fetchAssessmentDetails";
            fetch(getAssessmentAPI, {
                method: 'POST',
                body: JSON.stringify({
                    "course_name": cn,
                    "lesson_name": lesson
                }),
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                }
            }).then(function (response) {
                var resp = response.json();
                if (response.status == 200) {
                    resp.then((assessmentData) => {
                        displayPdf(data,assessmentData);
                    });
                } else {
                    if (response.status == 404) {
                        resp.then((data) => {
                            alert(data.message);
                        });
                    } else if (response.status == 500) {
                        resp.then((data) => {
                        	displayPdf(data,"");
                        });
                    }
                }
            }).then(function (data) {});
            
        };

        function displayPdf(base64Data,assessmentData) {
            var pdfContainer = document.getElementById('pdfContainer');
            var currentPage = 1;
            

            // Decode Base64 string
            var binaryData = atob(base64Data);
            var byteArray = new Uint8Array(binaryData.length);
            for (var i = 0; i < binaryData.length; i++) {
                byteArray[i] = binaryData.charCodeAt(i);
            }

            // Load PDF using PDF.js
            pdfjsLib.getDocument(byteArray).promise.then(function (pdf) {
                pdfDoc = pdf;
                renderPage(currentPage);
            }).catch(function (error) {
                console.error('Error loading PDF:', error);
            });

            document.getElementById('prevPage').addEventListener('click', function () {
                if (currentPage > 1) {
                	currentPage--;
                	if(assessmentData!="" && currentPage==assessmentData.page_num)
                	{
                		var pdfContainer = document.getElementById('pdfContainer');

                        // Clear previous content
                        pdfContainer.innerHTML = '';
                		renderDynamicContent(assessmentData);
                		
                	}
                    
                    else
                	{
                    	var dynCon = document.getElementById('dynamicContent');
                    	dynCon.hidden=true
                    	
                        renderPage(currentPage);
                	}
                }
            });

            document.getElementById('nextPage').addEventListener('click', function () {
                if (currentPage < pdfDoc.numPages) {
                	currentPage++;
                	if(assessmentData!="" && currentPage==assessmentData.page_num)
                	{
                		var pdfContainer = document.getElementById('pdfContainer');

                        // Clear previous content
                        pdfContainer.innerHTML = '';
                		renderDynamicContent(assessmentData);
                	}
                	else
                	{   
                		var dynCon = document.getElementById('dynamicContent');
                        dynCon.hidden=true;
                        renderPage(currentPage);
                	}
                }
            });
        }

        function renderPage(pageNumber) {
            var pdfContainer = document.getElementById('pdfContainer');

            // Clear previous content
            pdfContainer.innerHTML = '';

            pdfDoc.getPage(pageNumber).then(function (page) {
                var canvas = document.createElement('canvas');
                var viewport = page.getViewport({ scale: 1 });

                canvas.height = viewport.height;
                canvas.width = viewport.width;

                var renderContext = {
                    canvasContext: canvas.getContext('2d'),
                    viewport: viewport
                };

                page.render(renderContext).promise.then(function () {
                    pdfContainer.appendChild(canvas);
                });
            });
        }
        
       

        // Function to render dynamic content
        function renderDynamicContent(lessonData) {
        		      		

                // Set header
                document.getElementById('header').innerText = lessonData.header;

                // Set data
                document.getElementById('data').innerText = lessonData.data;

                // Split questions by "~"
                var questions = lessonData.questions.split('~');
                answers = lessonData.answers.split('~');

                // Render questions and input fields
                var questionsAndInputsContainer = document.getElementById('questionsAndInputs');
                var ans = 0;
                questions.forEach(function (question) {
                    var questionElement = document.createElement('p');
                    questionElement.innerText = question;

                    var inputElement = document.createElement('input');
                    inputElement.type = 'text';
                    inputElement.className = 'form-control';
                    inputElement.id = ans;

                    
                    
                    inputElement.addEventListener('keydown', function (e) {
                        if (e.key === 'Enter') {
                            // Retrieve the event ID and perform actions accordingly
                             var eventId = e.target.id;
                             var inputbox = document.getElementById(eventId).value;
	           	        	 var correctAnswerComment = answers[eventId];
	           	        	 if(inputbox.toLowerCase() == correctAnswerComment.toLowerCase()){
	           	        		document.getElementById(eventId).className = 'form-control-sBox-correct';
	           	         		 //correctAnswerComment.innerHTML = "";
	           	         	}
	           	         	else {
	           	         	document.getElementById(eventId).className = 'form-control-sBox-incorrect';
	           	         		//correctAnswerComment.innerHTML = originalAnswer;
	           	         	}
                            
                        }
                    });
                    
                    
                    
                    // Append question and input to the container
                    if(count==0)
                    {
                    questionsAndInputsContainer.appendChild(questionElement);
                    questionsAndInputsContainer.appendChild(inputElement);
                    }
                    
                    ans++;
                   
                });
                count++;
                var dynCon = document.getElementById('dynamicContent');
                dynCon.appendChild(questionsAndInputsContainer);
                
                dynCon.hidden = false;
        }
          

