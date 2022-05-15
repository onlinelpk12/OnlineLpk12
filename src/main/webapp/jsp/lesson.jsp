<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "header.jsp" %>
</head>
<body>



<%
//String lessonNumber = request.getParameter("lessonNumber");
//System.out.println("+++++++++++++++lessonNumber++++++++++++++++++"+lessonNumber);
%>



<%@ include file = "footer.jsp" %>
</body>
<iframe id="myIframe" frameborder="0" width="100%" height="460px" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
</html>
<script type="text/javascript">
var lessonNumber = <%= request.getParameter("lessonNumber") %>
//let userIdFromSession = sessionStorage.getItem("userId");
let userIdFromSession = "9";
window.onload = function(){
getApiData();
var response = getApiData();
buildLessonStatus();
var submitLessonStatus = buildLessonStatus();
postLessonStatus(submitLessonStatus);
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

function getApiData()
{
var response = null;
let apiUrl = "https://onlinelpk12appservice.azurewebsites.net/api/StudentProgress/content/"+lessonNumber;
$.get(apiUrl, function(data, status){
//response = '{"studentId":"R1234","lessons":[{"id":1,"name":"Lesson 1","status":"Pass"},{"id":2,"name":"Lesson 2","status":"In Progress"},{"id":3,"name":"Lesson 3","status":"Not Started"},{"id":4,"name":"Lesson 4","status":"Not Started"},{"id":5,"name":"Lesson 5","status":"Not Started"},{"id":6,"name":"Lesson 6","status":"Not Started"},{"id":7,"name":"Lesson 7","status":"Not Started"},{"id":8,"name":"Lesson 8","status":"Not Started"}]}';
response = data
buildLessonList(response);
});
return response;
}
function buildLessonList(response){
let contentURL = response.content.contentUrl;
let myIframe= document.getElementById("myIframe");
let url= contentURL;
myIframe.src=url;
}




function buildLessonStatus() {
let submitLessonStatus = {
"lessonId": 0,
"userId": 0,
}
submitLessonStatus.lessonId = lessonNumber;
submitLessonStatus.userId = parseInt(userIdFromSession);
return submitLessonStatus;
}




function postLessonStatus(submitLessonStatus) {
let postLessonApiUrl = "https://onlinelpk12appservice.azurewebsites.net/api/StudentProgress/updateLessonStatus";



$.ajax({
contentType: 'application/json',
data: JSON.stringify(submitLessonStatus),
dataType: 'json',
success: function (data) {
showErrorsInUI(data);
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
url: postLessonApiUrl
});
}
</script>