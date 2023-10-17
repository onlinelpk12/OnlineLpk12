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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
 <script src="../js/verifytoken.js" type="text/javascript"></script>
<style>
  .table-styled {
    border-collapse: collapse
  }
</style>
<meta charset="UTF-8">
<title>Student Details</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="student-progress-table" style="width:80%;margin:2% 10%;">
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script type="text/javascript">

$(function() {
	 verifytoken();
});

window.onload = function() {
	getApiData();
}
function getApiData()
{
let course_id=sessionStorage.getItem("courseId");
let name= sessionStorage.getItem("studentUserName");
let studentid=sessionStorage.getItem("studentid");
const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";
const teacher_url = corsProxy+"https://onlinelpk12api.herokuapp.com/api/Teacher/"+studentid+"/assessment";



$.get(teacher_url, function(data, status){
buildLessonList(data);
});
}
	

function buildLessonList(response){
let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
let headerRow = "<tr style='background-color:#275E9B;color:white'>";

headerRow += "<th>" + "Assessment ID" + "</th>";
headerRow += "<th>" + "Lesson ID" + "</th>";
headerRow += "<th>" + "Learning Outcome" + "</th>";
headerRow += "<th>" + "Questions & Answers Selected" + "</th>";
headerRow += "<th>" + "Assessment Status" + "</th>";
headerRow += "<th>" + "Assessment Score" + "</th>";
htmlTable+= headerRow;
for(let i=0; i<response.content.length;i++)
{
let row = `<tr>`
	+ `<td> ${response.content[i]?.assessmentId}</td>`
	+ `<td> ${response.content[i]?.lessonId} </td>`
	+ `<td> ${response.content[i]?.learningOutcome} </td>`
	+ `<td> <a class='btn btn-primary' onclick='viewQuestionsAndAnswers("${response.content[i]?.lessonId}", "${response.content[i]?.learningOutcome}")' > Click here to view Students Questions And Answers </a>`
	+ `<td> ${response.content[i]?.status} </td>`
	+ `<td> ${response.content[i]?.score}  </td>`
	+ `</tr>`;
	htmlTable+=row;
}
htmlTable += '</table>';
$('#student-progress-table').html(htmlTable);

}

function viewQuestionsAndAnswers(lessonid,learningoutcome){
	sessionStorage.setItem("lessonID", lessonid);
	sessionStorage.setItem("lessonOutcome", learningoutcome);
    window.location.href="Q&AList.jsp";
	
}

</script>
