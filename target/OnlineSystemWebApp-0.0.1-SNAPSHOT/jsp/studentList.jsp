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
<div id="student-progress-table" style="width:80%;margin:2% 10%;">


 <br>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script type="text/javascript"> 
window.onload = function() {
	 verifytoken();
	getApiData();
}

function getApiData()
{
	let teacherId = sessionStorage.getItem("userId");
	let course_id=sessionStorage.getItem("courseId");
	const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";
	const teacher_url = corsProxy+"https://onlinelpk12api.herokuapp.com/api/Teacher/"+teacherId+"/course/"+course_id;

	$.get(teacher_url, function(data, status){
		buildLessonList(data);
	});
}	

function buildLessonList(response){
	let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
	let headerRow = "<tr style='background-color:#275E9B;color:white'>";
	headerRow += "<th>" + "Student ID" + "</th>";
	headerRow += "<th>" + "Student Name" + "</th>";
	headerRow += "<th>" + "username" + "</th>";
	headerRow += "<th>" + "Programs executed in Sparc" + "</th>";
	headerRow += "<th>" + "Answers submitted in assessments" + "</th>";
	headerRow += "<th>" + "Lesson status" + "</th>";
	htmlTable+= headerRow;
	for(let i=0; i<response.content.length;i++)
	{
		let row = `<tr> <td> ${response.content[i]?.id} </td> `
				+ `<td> ${response.content[i]?.firstName} ${response.content[i]?.lastName} </td>`
				+ `<td> ${response.content[i]?.userName} </td>`
				+ `<td> <a class='btn btn-primary' onclick='saveStudentName("${response.content[i]?.id}","${response.content[i]?.firstName} ${response.content[i]?.lastName}")' > Click here to view Students Sparc programs </a>`
				+ ` <td> <a class='btn btn-primary' onclick='saveStudentName1("${response.content[i]?.id}","${response.content[i]?.firstName} ${response.content[i]?.lastName}")'> Click here to view assessment answers</a> </td>`
				+ `<td> <a class='btn btn-primary' onclick='saveStudentName2("${response.content[i]?.id}","${response.content[i]?.firstName} ${response.content[i]?.lastName}")'> Click here to view lesson progress </a> </td> </tr>`;
		htmlTable+=row;
	}
	htmlTable += '</table>';
	$('#student-progress-table').html(htmlTable);
}

function saveStudentName(student_id,name){
	sessionStorage.setItem("studentid", student_id);
	sessionStorage.setItem("studentUserName", name);
	window.location.href="sparcProgramsList.jsp";	
}

function saveStudentName1(student_id,name){
	sessionStorage.setItem("studentid", student_id);
	sessionStorage.setItem("studentUserName", name);
	window.location.href="assessmentList.jsp";	
}

function saveStudentName2(student_id,name){
	sessionStorage.setItem("studentid", student_id);
	sessionStorage.setItem("studentUserName", name);
	window.location.href="lessonList.jsp";	
}
</script>
 
 
 
 









 