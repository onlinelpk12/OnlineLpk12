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
<div id="teacher-courses-table" style="width:80%;margin:2% 10%;">



</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script type="text/javascript"> 
window.onload = function() {
	getApiData();
}

$(function() {
	 verifytoken();
});


function getApiData()
{
	let teacherId = sessionStorage.getItem("userId");
	const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";
	const teacher_url = corsProxy+"https://onlinelpk12api.herokuapp.com/api/Teacher/"+teacherId;

	$.get(teacher_url, function(data, status){
		buildLessonList(data);
	});
}

function buildLessonList(response){
	let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
	let headerRow = "<tr style='background-color:#275E9B;color:white'>";

	headerRow += "<th>" + "Semester" + "</th>";
	headerRow += "<th>" + "Term" + "</th>";
	headerRow += "<th>" + "Course" + "</th>";
	headerRow += "<th>" + "Link to access Students under course" + "</th>";
	htmlTable+= headerRow;
for(let i=0; i<response.content.length;i++)
{
let course_id= response.content[i]?.courseId;
let row = "";
row += "<tr>";

row += '<td>' + response.content[i]?.semester + '</td>';
row += '<td>' + response.content[i]?.year + '</td>';
row += '<td>' + response.content[i]?.courseName + '</td>';
row += '<td>' + "<a class='btn btn-primary' onclick='saveCourseID("+response.content[i]?.courseId+");' > Click here to view Students Progress enrolled in this course </a>" +'</td>'; 
row += '</tr>';
htmlTable += row;
}
htmlTable += '</table>';
$('#teacher-courses-table').html(htmlTable);
}

function saveCourseID(course_id){
	sessionStorage.setItem("courseId", course_id);
	window.location.href="studentList.jsp";	
}


</script>
 
 
 
 