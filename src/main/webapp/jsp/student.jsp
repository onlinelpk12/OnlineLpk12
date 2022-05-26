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
//let user_id = sessionStorage.getItem("userId");
let user_id="14";
let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
let headerRow = "<tr style='background-color:#275E9B;color:white'>";

headerRow += "<th>" + "Sparc Programs" + "</th>";
headerRow += "<th>" + "Lesson Progress" + "</th>";


htmlTable+= headerRow;
	let row = `<tr>`
		+ `<td> <a class='btn btn-primary' onclick='viewSparcProgram("${user_id}")' > Click here to view My Sparc programs </a> </td>`
		+ `<td> <a class='btn btn-primary' onclick='viewLessonProgress("${user_id}")' > Click here to view My Lesson progress </a> </td>`
		+ `</tr>`;
htmlTable += row;

htmlTable += '</table>';
$('#teacher-courses-table').html(htmlTable);


function viewSparcProgram(user_id){
	window.location.href="sparcProgramsList.jsp";	
}

function viewLessonProgress(user_id){
	window.location.href="lessonList.jsp";	
}
</script>
 
 
 
 