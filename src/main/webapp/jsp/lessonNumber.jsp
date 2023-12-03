<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="java.net.URL"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<style>
a.disabled {
pointer-events: none;
cursor: default;
}
</style>
<meta charset="UTF-8">
<title>Lesson Numbers</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="LessonStyle" style="width:95%;margin:3%">
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script type="text/javascript">
window.onload = function(){

getApiData();
var response = getApiData();
}

function getApiData()
{
//let userId = sessionStorage.getItem("userId");
let userId = "9";
var response = null;
let apiUrl = "http://wave.ttu.edu/ajax.php";
$.get(apiUrl, function(data, status){
response = data
buildLessonList(response);
});
return response;
}

function buildLessonList(response){
let buildList = "<ul>";
for(let i=0; i<response.content.lessonAndQuizStatus.length;i++)
{
let k = i;
if (i !=0)
{
k -= 1;
}
let li = "";
let lessonId = response.content.lessonAndQuizStatus[i].lessonId;
let prevLessonStatus = response.content.lessonAndQuizStatus[k].quizStatus;
li += "<li>";
if(lessonId == 1)
{
li+="<a href='lesson.jsp?lessonNumber=" + response.content.lessonAndQuizStatus[i].lessonId
li+="'>"
}
else{
li+="<a href='lesson.jsp?lessonNumber=" + response.content.lessonAndQuizStatus[i].lessonId
if(lessonId != 1 && prevLessonStatus != "Pass")
{
li+="' class='disabled'"
}
li+="'>"
}
li+= "Click here to view Lesson ";
li+= response.content.lessonAndQuizStatus[i].lessonId + "!" + "</a>";
li += "&emsp;";
li += response.content.lessonAndQuizStatus[i].lessonStatus;
li += "&emsp;";
li += "&emsp;";
li += "&emsp;";
li += "<a class='btn btn-primary' href='quiz.jsp?lessonNumber=" + response.content.lessonAndQuizStatus[i].lessonId + "'>";
li+= "Assessment ";
li+= response.content.lessonAndQuizStatus[i].lessonId + "</a>";
li += "&emsp;";
li += response.content.lessonAndQuizStatus[i].quizStatus;
li += "</li>";
li += "<br/>";
buildList += li;
}
buildList += "</ul>";
$('#LessonStyle').html(buildList);
}
document.getElementById('lesson').setAttribute('href', 'lesson.jsp?lessonNumber=' + lessonId);
</script>