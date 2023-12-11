window.onload = function () {
	
    const getLessonsListAPI = "http://localhost:8083/api/auth/lessonsList";
    const cn = "Onlinelpk12";
    fetch(getLessonsListAPI, {
        method: 'POST',
        body: JSON.stringify({
            "course_name": cn,
            "lesson_name": "Lesson2"
        }),
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        }
    }).then(function (response) {
        var resp = response.json();
        if (response.status == 200) {
            resp.then((lessonsList) => {
            	generateLessonLinks(lessonsList.lessons);
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

function generateLessonLinks(lessons) {

    var ulElement = document.getElementById('lessonList');

    // Clear existing content
    ulElement.innerHTML = '';

    // Generate dynamic <li> and <a> elements
    lessons.forEach(function (lesson) {
        var liElement = document.createElement('li');
        var aElement = document.createElement('a');

        aElement.href = 'renderLesson.jsp?lesson=' + lesson.lesson_name;
        aElement.textContent = 'Click here to View ' + lesson.lesson_name + '!';	
		

        liElement.appendChild(aElement);
        ulElement.appendChild(liElement);     
        
    });
    
    
    
}
