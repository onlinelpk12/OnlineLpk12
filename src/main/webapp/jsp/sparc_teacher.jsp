<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="../js/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/mode-sparc.js" type="text/javascript"></script>
<script src="../js/sparc_programs.js" type="text/javascript"></script>
<script src="../js/script.js" type="text/javascript"></script>
<script type="text/javascript" src="../static/global.js"></script>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="sparc_teacher.jsp"></script>

<title>Online SPARC</title>
<style type="text/css" media="screen">
#editor {
position: fixed;
margin: 0;
float: left;
width: 55%;
height: 100%;
top: 50;
}
#column-resizer{
position: fixed;
left: 56%;
cursor: col-resize;
margin: 0;
padding: 0;
width: 0.8%;
height: 100%;
background-color: #DDD;
border-radius: 3px;
}

#results{
position: relative;
margin: 0;
float: right;
width: 39%;
}
ul {
list-style-type: none;
margin: 0;
padding: 0;
padding-left:2em;
}
ul li {
padding-left:2em;
 color: black;
}
li {
display: inline;
}
#txt_query{
margin-top: 8px;
}

#dropdown{
color: white;
}
</style>
</head>
<body>



<div id="wrapper" class="toggled">
<div id="wrap">
<div id="navbar">
<header>
<nav class="navbar navbar-dark bg-primary">
<div class="container-fluid">
<div class="collapse navbar-collapse">
<ul class="nav navbar-nav navbar-left">
<li>
<form>
  	  <a href="#" id="goBackButton" onclick="history.back()" style="margin-top:13px"><img height="30" width="40" src="../images/back.png" style="margin-top:13px" ></a>
   <a id="homepagelink" href="home.jsp" style="margin-top:13px"><img height="30" width="40" src="../images/home.png" style="margin-top:13px"></a>
      </form>
</li>
</ul>
<ul class="nav navbar-nav navbar-right">
<li>
<label for="grade" id="dropdown">Choose a grade:</label>
  <select name="grade" id="grade" class="btn btn-default navbar-btn">
  	  <option value="NA" selected disabled>Select Grade</option>
      <option value="A+">A+</option>
      <option value="A">A</option>
      <option value="A-">A-</option>
      <option value="B+">B+</option>
       <option value="B">B</option>
      <option value="B-">B-</option>
       <option value="C+">C+</option>
       <option value="C">C</option>
      <option value="C-">C-</option>
       <option value="D">D</option>
       <option value="F">F</option>
  </select>
</li>
<li>
<button type="submit" class="btn btn-default navbar-btn" id="btn_submit_grade" value="getQuery" onclick="submitGrade()">
Submit Grade
</button>
</li>
<li>
<button type="submit" class="btn btn-default navbar-btn" id="btn_getAnswerSets" value="getAnswerSets" onclick="answerSets()">
Get Answer Sets
</button>
</li>
<li> </li>
<li>
<button type="submit" class="btn btn-default navbar-btn" id="btn_getAnimation" value="getAnimation" onclick="execute()">
Execute
</button>
</li>
</ul>
</div>
</div>
</nav>
</header>
</div>
</div>
</div>



<div id="page-content-wrapper">
<div id="editor"></div>
<div id="column-resizer"></div>
<div id="results"></div>
</div>

<script src="../js/resizer.js" type="text/javascript"></script>
<script type="text/javascript">
var studentid=sessionStorage.getItem("studentid");
var lessonid=sessionStorage.getItem("lessonID");
var lessonoutcome=sessionStorage.getItem("lessonOutcome");
var userRole = sessionStorage.getItem('userRole');
//const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";
const apiBaseurl = dotnet_endpoint+"api/sparc/";

var editor = ace.edit("editor");
editor.session.setMode("ace/mode/sparc");

// var showResults=function(response){
// 	$('#results').html('<center> <button onclick="clearResults()">Clear the Results</button> </center>');
// 	$('#results').append(response);
// }
	
var clearResults=function(){
	$('#results').empty();
}

$(function(){
	getApiData();
	if(userRole == 'Student'){
		$('#dropdown').hide();
		$('#grade').hide();
		$('#btn_submit_grade').hide();
		$('#btn_getAnswerSets').hide();
		$('#btn_getAnimation').hide();
	}
	else if (userRole == 'Teacher'){
		$('#dropdown').show();
		$('#grade').show();
		$('#btn_submit_grade').show();
		$('#btn_getAnswerSets').show();
		$('#btn_getAnimation').show();
	}
	
});

function getApiData()
{
	let lessonid=sessionStorage.getItem("lessonID");
	let lessonoutcome=sessionStorage.getItem("lessonOutcome");
	const teacher_url = dotnet_endpoint+"api/Teacher/"+studentid+"/sparc/lessson/"+lessonid+"/learningoutcome/"+lessonoutcome;
	$.ajaxSetup({
   headers:{
      'Authorization': "Bearer "+ sessionStorage.getItem("token")
   }
	});	
	$.get(teacher_url, function(data, status){
		editor.setValue(data.content.program);
	});
}

function execute(){
	let program = editor.getValue();
	if(program == null || program == '' || program == undefined){
		program = '';
	}
	let request = {
		"userid": studentid,
		"learningOutcome":lessonoutcome,
		"lessonId": lessonid,
		"action": "getAnimation",
		"editor": program
	};
	PostSparc(request,"execute");
}

function answerSets(){
	let program = editor.getValue();

	if(program == null || program == '' || program == undefined){
		program = '';
	}
	let request = {
		"userid": studentid,
		"learningOutcome":lessonoutcome,
		"lessonId": lessonid,
		"action": "getAnswerSets",
		"editor": program
	};
	PostSparc(request,"execute");
}

function PostSparc(request,suburl) {
	let url=suburl;
	let success = false;
	let res="";
	console.log('request: ', request);
	$.ajax({
		contentType:'application/x-www-form-urlencoded',
		data: request,
		headers:{
      'Authorization': "Bearer "+ sessionStorage.getItem("token")
   		},
		success: function (data) {
			res= data;
		},
		type: 'POST',
		url: apiBaseurl + url,
		success: function(data){
			console.log('response content: ',data.content);
			showResults(data.content);
		},
		error: function(data){
			console.log(data);
		}
	});
}

function submitGrade(){
	let grade = $('#grade').val();
	let request = {
			"userid": studentid,
			"learningOutcome":lessonoutcome,
			"lessonId": lessonid,
			"grade":grade
			};
			PostSparc(request,"submitgrade");
}

</script>
<%@ include file = "footer.jsp" %>
</body>
</html>