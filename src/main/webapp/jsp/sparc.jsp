<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="../js/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/mode-sparc.js" type="text/javascript"></script>
<script src="../js/sparc_programs.js" type="text/javascript"></script>
<script src="../js/script.js" type="text/javascript"></script>
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
	}
	li {
  		display: inline;
	}
	#txt_query{
		margin-top: 8px;
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
									<input type="text" class="form-control" placeholder="Enter query" name="txt_query" id="txt_query" size="50">
								</li>
								<li>
									<button type="submit" class="btn btn-default navbar-btn" id="btn_getQuery" value="getQuery" onclick="submitrequest()">
	                            			Submit
	                            	</button>
								</li>
							</ul>
                			<ul class="nav navbar-nav navbar-right">
                				<li> 
                    				<button type="submit" class="btn btn-default navbar-btn" id="btn_saveSparcProgram" value="saveSparcProgram" onclick="saveSparcProgram()">
                        				Save Sparc Program
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
                    			<li> 
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
let currentLearningOutcomeNumber = sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber);
let currentLessonNumber = sessionStorage.getItem(sessionKeyCurrentLessonNumber);
window.onload = function(){
	let response = getSparcProgram(currentLearningOutcomeNumber);
	console.log(response);
	editor.setValue(response);	
}
let userId = sessionStorage.getItem("userId");
const apiBaseUrl = "https://onlinelpk12dotnetapi.azurewebsites.net/api/sparc/";
//var input="getAnswerSets";
var editor = ace.edit("editor");
editor.session.setMode("ace/mode/sparc");	
var showResults=function(response){
	$('#results').html('<center> <button onclick="clearResults()">Clear the Results</button> </center>');
	$('#results').append(response);
}
    
var clearResults=function(){
	$('#results').empty();
}
	
function execute(){
	let program = editor.getValue(); 
	if(program == null || program == '' || program == undefined){
		program = '';
	}
	let request = {
		"userid": userId,
		"learningOutcome":currentLearningOutcomeNumber,
		"lessonId":  currentLessonNumber,
	        "action": "getAnimation",
	        "editor":  program
	};
	PostSparc(request,"execute");
}
function saveSparcProgram(){
	let program = editor.getValue(); 
	if(program == null || program == '' || program == undefined){
		return "Please enter valid Sparc program to save";
	}
	let request = {
		"userid" : userId,
	        "learningOutcome":currentLearningOutcomeNumber,
		"lessonId":  currentLessonNumber,
	        "editor":  program
	};
	PostSparc(request,"save");
}
function answerSets(){
	let program = editor.getValue(); 	
	if(program == null || program == '' || program == undefined){
		program = '';
	}
	let request = {
		"userid": userId,
		"learningOutcome":currentLearningOutcomeNumber,
		"lessonId":  currentLessonNumber,
	        "action": "getAnswerSets",
	        "editor":  program
	};
	PostSparc(request,"execute");
}	
function submitrequest(){
	let program = editor.getValue(); 
	let query = $('#txt_query').val();
	if(program == null || program == '' || program == undefined){
		program = '';
	}
	if(query == null || query == '' || query == undefined){
		query = '';
	}
	let request = {
		"userid": userId,
		"learningOutcome":currentLearningOutcomeNumber,
		"lessonId":  currentLessonNumber,
	        "action": "getQuery",
	        "query" : query,
	        "editor":  program
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
            success: function (data) {
                res= data;
            },
            type: 'POST',
            url: apiBaseUrl + url,
            success: function(data){
            	console.log('response content: ',data.content);
            	showResults(data.content);
            },
            error: function(data){
            	console.log(data);
            }
        });
}
</script>
<%@ include file = "sparc-footer.jsp" %> 
</body>
</html>
