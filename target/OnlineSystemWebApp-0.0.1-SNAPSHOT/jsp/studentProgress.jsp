<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Progress</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
 <script src="../js/verifytoken.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="header.jsp"/>



<div id="student-progress" style='width:80%;margin:2% 10%'>



</div>
<jsp:include page="footer.jsp"/>



<script type="text/javascript">
window.onload = function(){
	 verifytoken();
getApiData();
var response = getApiData();
}



function getApiData()
{
let azureResponse = null;
//let userId = sessionStorage.getItem("userId");
let userId = "9";
var response = null;
let apiUrl = "https://onlinelpk12appservice.azurewebsites.net/api/StudentProgress/lessons/"+userId;
$.get(apiUrl, function(data, status){
response = data
buildStudentProgressTable(response);
});
return response;
}



function buildStudentProgressTable(response){
let div = "<div style='text-align:center'>";
let content = "<h2>Student Progress</h2>";
content += "<br>";
content += "<h5><b>Student Name:</b> "+ response.content.firstName + " " + response.content.lastName + "</h5>";
content += "<h5><b>Student Id:</b> "+ response.content.studentId + "</h5>";
div += content;
div += "</div>";
div += "<div style='width:80%;margin:2% 10%;'>";
let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
let headerRow = "<tr style='background-color:#275E9B;color:white'>";
headerRow += "<th>" + "Lesson Number" + "</th>";
headerRow += "<th>" + "Lesson Status" + "</th>";
headerRow += "<th>" + "Assessment Status" + "</th>";
headerRow += "<th>" + "Program Executed on Online SPARC" + "</th>";
headerRow += "<th>" + "Answers submitted in Assessment" + "</th>";
htmlTable+= headerRow;
for(let i=0; i<response.content.lessonAndQuizStatus.length; i++)
{
let row = "";
row += "<tr>";
row += '<td>' + response.content.lessonAndQuizStatus[i].lessonId + '</td>';
row += '<td>' + response.content.lessonAndQuizStatus[i].lessonStatus + '</td>';
row += '<td>' + response.content.lessonAndQuizStatus[i].quizStatus + '</td>';
row += '<td>' + '<a href="sparc_details_teacher.jsp">Click here to view program</a>' + '</td>';
row += '<td>' + '<a href="assessment_details_teacher.jsp">Click here to view assessment details</a>' + '</td>';
row += '</tr>';
htmlTable += row;
}
htmlTable += '</table>';
div += htmlTable;
div += "</div>";
$('#student-progress').html(div);
}
</script>



</body>
</html>