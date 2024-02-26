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
<script type="text/javascript" src="../static/global.js"></script>


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
<div id="student-progress-table" style="width:80%;margin:2% 10%">


</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script type="text/javascript">

$(function(){
	getApiData();
});


function getApiData()
{

let userName = sessionStorage.getItem("studentUserName");
//let userId = "14";
let studentid=sessionStorage.getItem("studentid");
let lessonid=sessionStorage.getItem("lessonID");
let lessonoutcome=sessionStorage.getItem("lessonOutcome");
const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";
const teacher_url = dotnet_endpoint+"api/Teacher/"+studentid+"/assessment/lessson/"+lessonid+"/learningoutcome/"+lessonoutcome;


$.ajaxSetup({
   headers:{
      'Authorization': "Bearer "+ sessionStorage.getItem("token")
   }
});
$.get(teacher_url, function(data, status){
	buildLessonList(data);
});
}


function buildLessonList(response){
	let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
	let headerRow = "<tr style='background-color:#275E9B;color:white'>";

	headerRow += "<th>" + "Questions" + "</th>";
	headerRow += "<th>" + "Answers" + "</th>";
	htmlTable+= headerRow;
	for(let i=0; i<response.content.questionAnswers.length;i++)
	{
	let row = `<tr>`
		+ `<td> ${response.content.questionAnswers[i]?.question}</td>`		
		+ `<td> ${response.content.questionAnswers[i]?.answer.split('\n').map(e => `<p>${e}</p>`).join('')} </td>`
		+ `</tr>`;
		htmlTable+=row;
	}
	htmlTable += '</table>';
	$('#student-progress-table').html(htmlTable);

}
</script>
