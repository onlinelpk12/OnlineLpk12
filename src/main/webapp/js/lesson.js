window.onload = function() {

	const getLessonsListAPI = "https://localhost:7155/api/Lesson/getLessonList?course=Onlinelpk12";
	const cn = "Onlinelpk12";
	fetch(getLessonsListAPI, {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json; charset=UTF-8',
			'Authorization': "Bearer " + sessionStorage.getItem("token")
		}
	}).then(function(response) {
		var resp = response.json();
		if (response.status == 200) {
			resp.then((lessonsList) => {
				generateLessonLinks(lessonsList.content);
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
	}).then(function(data) { });
};

function generateLessonLinks(lessons) {

	var ulElement = document.getElementById('lessonList');

	// Clear existing content
	ulElement.innerHTML = '';

	// Generate dynamic <li> and <a> elements
	lessons.forEach(function(lesson) {
		var liElement = document.createElement('li');
		var aElement = document.createElement('a');

		aElement.href = 'renderLesson.jsp?lesson=' + lesson;
		aElement.textContent = 'Click here to View ' + lesson + '!';


		liElement.appendChild(aElement);
		ulElement.appendChild(liElement);

	});



}
