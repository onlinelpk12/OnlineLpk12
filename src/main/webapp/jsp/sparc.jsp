<!DOCTYPE html>
<html lang="en">
<head>
<!-- EASYTREE -->
<link rel="stylesheet" type="text/css" href="../styles/easyTree.css">
<link rel="stylesheet" type="text/css" href="../styles/simple-sidebar.css" >
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script src="../js/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/mode-sparc.js" type="text/javascript"></script>
<script src="../js/sparc_programs.js" type="text/javascript"></script>
<script src="../js/script.js" type="text/javascript"></script>
<script src="../js/lessonDataStructureJSON.js"></script>
<!-- <script src="scripts/ace-builds/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script> -->
<script src="../js/navbar-response.js" type="text/javascript"></script>
<script src="../js/easyTree.js" type="text/javascript"></script>
<script src="../js/easytree-response.js" type="text/javascript"></script>
<script src="../js/resizer.js" type="text/javascript"></script>
<script src="../js/init.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.xslt.js"></script>

<title>Online SPARC</title>
<style type="text/css" media="screen">
#editor {
	position: fixed;
	margin: 0;
	left: 545px;
	float: left;
	width: 32%;
	height: 100%;
	top: 50;
}
#workbookActivity {
	position: fixed;
	margin: 0;
	float: left;
	width: 58%;
	height: 100%;
	top: 50;
}

#column-resizer {
	position: fixed;
	left: 56%;
	cursor: col-resize;
	margin: 0;
	padding: 0;
	width: 0.8%;
	height: 100%;
	background-color: #DDD;
	border-radius: 3px;
	margin-top: -80px;
}

#results {
	position: relative;
	margin: 0;
	float: right;
	width: 39%;
}

#navbar {
    min-width: 1025px;
}

.navbar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	padding-left: 0.5em;
}

.navbar ul li {
	padding-left: 0.5em;
}

.navbar li {
	display: inline;
} 

#txt_query {
	margin-top: 8px;
}

#btn_new {
	color: white
}

#btn_new:hover {
	color: black;
}
.nav .open>a, .nav .open>a:focus, .nav .open>a:hover {
    background-color: #3798d0;
    border-color: #337ab7;
}
#fileSystem{
	padding-left: 525px;
    padding-right: 451px;
}


/* for  panels*/
.panel-heading {
    width: 430px;
}
.panel-title {
    height:18px
}
.panel-title a {
    float:right;
    text-decoration:none;
    padding: 10px 430px;
    margin: -10px -430px;
}
.panel-body {
   /*  height: 432px; */
  /*  height: 580px;
    rotate: 90deg; */
    
    height: 482px;
    margin-inline: 58px;
    
    /*margin-right: -39px;*/
    rotate: 90deg;
}

.panel-group {
    /*width:430px;*/
    width: 580px;
    z-index: 100;
    -webkit-backface-visibility: hidden;
    -webkit-transform: translateX(-100%) rotate(-90deg);
    -webkit-transform-origin: right top;
    -moz-transform: translateX(-100%) rotate(-90deg);
    -moz-transform-origin: right top;
    -o-transform: translateX(-100%) rotate(-90deg);
    -o-transform-origin: right top;
    transform: translateX(-100%) rotate(-90deg);
    transform-origin: right top;
}

.combined{

}

</style>
</head>
<body>
	<div id="wrapper" class="toggled">
		<div id="sidebar-wrapper">
			<div class="easy-tree" id="directory">
				<ul>
					<li>Example 3
						<ul>
							<li>Example 3a</li>
							<li>Example 3b</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div id="wrap">
			<div id="navbar">
				<header>
					<nav class="navbar navbar-dark bg-primary">
						<div class="container-fluid">
							<div class="collapse navbar-collapse">
								<ul class="nav navbar-nav navbar-left">
									<!-- <li>
										<a href="#" id="goBackButton" onclick="history.back()" style="margin-top: -30px;margin-left: -55px;margin-bottom: -15px;"><img height="30" width="40" src="../images/back.png" style="margin-top:25px" ></a>
									</li> -->
									<li>
										<button type="button" class="btn btn-default navbar-btn"
											id="menu-toggle" value="getAccessibleDirectory">Directory</button>
									</li>
									<!-- New Menu -->
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspop="true"
										aria-expanded="true" id="btn_new"> New <span class="caret"></span>
									</a>
										<ul class="dropdown-menu">
											<li><a href="#" id="newFolder">New Folder</a></li>
											<li><a href="#" id="newFile">New File</a></li>
										</ul></li>
									<!-- Save Button -->
									<li>
										<button type="button" class="btn btn-default navbar-btn"
											id="btn_save">Save</button>
									</li>

									
								</ul>
								<ul class="nav navbar-nav navbar-right">
									<li><input type="text" class="form-control"
										placeholder="Enter query" name="txt_query" id="txt_query"
										size="50"></li>
									<li>
										<button type="submit" class="btn btn-default navbar-btn"
											id="btn_getQuery" value="getQuery" onclick="submitrequest()">
											Submit</button>
									</li>
									<!-- <li>
										<button type="submit" class="btn btn-default navbar-btn"
											id="btn_saveSparcProgram" value="saveSparcProgram"
											onclick="saveSparcProgram()">Save Sparc Program</button>
									</li> -->
									<li>
										<button type="submit" class="btn btn-default navbar-btn"
											id="btn_getAnswerSets" value="getAnswerSets"
											onclick="answerSets()">Get Answer Sets</button>
									</li>
									<li></li>
									<li>
										<button type="submit" class="btn btn-default navbar-btn"
											id="btn_getAnimation" value="getAnimation"
											onclick="execute()">Execute</button>
									</li>
									<li></li>
								</ul>
							</div>
						</div>
					</nav>
				</header>
			</div>
		</div>
		
		<div id="page-content-wrapper">
			<div id="div_editorpanel">
				<div id="workbookActivity">
					<div class="row">
						<div class="col-md-6 content">
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a id ="questionToggle" aria-expanded="true" data-toggle="collapse" data-parent="#accordion"
												href="#collapseOne"> Activity Description </a>
										</h4>

									</div>
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<h3>
												<b id="activityTitle">Activity : Extend and Test Model
													as You Like</b>
											</h3>
											<ul>
												<li id="question">Extend model: add knowledge to model
													about element(s) of your choice. The element has to be one
													of the first 20 in the periodic table.</li>
												<ul>
													<li>Remember to write the comment first</li>
													<li>Then write the fact about this knowledge.</li>
												</ul>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="combined">
					<div>
						<div id="fileSystem">
							<div id="span_currentfolder">
								Current folder: <span id="span_currentfolderid"></span>
							</div>
							<div id="span_currentfile">
								Current file: <span id="span_currentfileid"></span>
							</div>

							<div id="div_fontsize">
								<span> Font size: </span> <select id="select_fontsize">
									<option value="8">8px</option>
									<option value="12" selected="selected">12px</option>
									<option value="18">18px</option>
									<option value="24">24px</option>
									<option value="36">36px</option>
									<option value="72">72px</option>
								</select>
							</div>
						</div>
						<div  class="combined" id="editor"></div>
					</div>
					<div class="combined" id="column-resizer" style="left: 1030.8px;"></div>
					<div class="combined" id="results" style="width: 450.49px;"></div>
				</div>				
			</div>
		</div>
	</div>

<script type="text/javascript">	
	let currentLearningOutcomeNumber = sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber);
	let currentLessonNumber = sessionStorage.getItem(sessionKeyCurrentLessonNumber);
	let currentConsoleOutput = "currentConsoleOutput";
	window.onload = function(){
		document.getElementById("sparc-footer-next-btn").disabled = true;
		if(currentLearningOutcomeNumber != 0){
			document.getElementById("sparc-footer-skip-btn").style.display="none";
		}
		let response = getSparcProgram(currentLearningOutcomeNumber);
		console.log(response);
		editor.setValue(response);
		let titleQuestion =  getActivityInformation(currentLessonNumber,currentLearningOutcomeNumber);
	    document.getElementById("activityTitle").innerHTML = titleQuestion.title;
	    document.getElementById("question").innerHTML = titleQuestion.question;
	}
	let userid = sessionStorage.getItem("userId");
	const apiBaseurl = "https://localhost:7155/api/sparc/";
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
				 "userid": userid,
				 "learningOutcome":currentLearningOutcomeNumber,
				 "lessonId":  currentLessonNumber,
	             "action": "getAnimation",
	             "editor":  program
	         };
		PostSparc(request,"execute");
		document.getElementById("sparc-footer-next-btn").disabled = false;
	}
	
	function saveSparcProgram(){
		let program = editor.getValue(); 
		if(program == null || program == '' || program == undefined){
			return "Please enter valid Sparc program to save";
		}
		let request = {
				 "userid" : userid,
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
				"userid": userid,
				 "learningOutcome":currentLearningOutcomeNumber,
				 "lessonId":  currentLessonNumber,
	             "action": "getAnswerSets",
	             "editor":  program
	         };
		PostSparc(request,"execute");
		document.getElementById("sparc-footer-next-btn").disabled = false;
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
				"userid": userid,
				 "learningOutcome":currentLearningOutcomeNumber,
				 "lessonId":  currentLessonNumber,
	             "action": "getQuery",
	             "query" : query,
	             "editor":  program
	         };
		PostSparc(request,"execute");
		document.getElementById("sparc-footer-next-btn").disabled = false;
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
            url: apiBaseurl + url,
            success: function(data){
            	console.log('response content: ',data.content);
            	showResults(data.content);
            	sessionStorage.setItem(currentConsoleOutput,data.content);
            },
            error: function(data){
            	console.log(data);
            }
        });
	}
</script>
<script type="text/javascript">	
	function removeTags(str) {
	    if ((str===null) || (str===''))
	        return false;
	    else
	        str = str.toString();
	          
	    // Regular expression to identify HTML tags in 
	    // the input string. Replacing the identified 
	    // HTML tag with a null string.
	    return str.replace( /(<([^>]+)>)/ig, '');
	}
	
	function evaluateSparcConsoleOutput(consoleResponse){
		if(consoleResponse.toLowerCase().includes("answer to query") && consoleResponse.toLowerCase().includes("yes")){
			return true;
		} 
		else if(consoleResponse.toLowerCase().includes("answer to query") && consoleResponse.toLowerCase().includes("=")){
			let combinationsMap = processConstVaraiableCombination(consoleResponse);
			if(combinationsMap.size > 0){ // datastructure is a valid one having combination of varables and constants
				return true;
			}
		}
		else return false;
		
	}
	
	function getPosition(string, subString, index) {
		  return string.split(subString, index).join(subString).length;
	} 
	
	function processConstVaraiableCombination(outputString){
		outputString = outputString.replace('\n','');
		let combinationsMap = new Map();
		const searchTerm = '  ';
		const indexOfFirst = outputString.indexOf(searchTerm);
		var combinationCombinedString = outputString.substring(indexOfFirst, outputString.length).trim();
		console.log(combinationCombinedString);
		var numberOfCombinations = outputString.match(/[=]/g).length;
		if(numberOfCombinations > 1){
			const dividerIndexPosition = getPosition(combinationCombinedString, ' ', 3);
			var variable1 = combinationCombinedString.substring(0, dividerIndexPosition).trim();
			console.log(variable1);
			var variable2 = combinationCombinedString.substring(dividerIndexPosition, combinationCombinedString.length).trim();
			console.log(variable2);
			combinationsMap.set(variable1.substring(0,variable1.indexOf('=')).trim(),
  				    variable1.substring(variable1.indexOf('=')+1,variable1.length).trim());
			combinationsMap.set(variable2.substring(0,variable2.indexOf('=')).trim(),
			  				    variable2.substring(variable2.indexOf('=')+1,variable2.length).trim());
		} else if(numberOfCombinations == 1){
			var variable1 = combinationCombinedString.trim();
			console.log(variable1);
			combinationsMap.set(variable1.substring(0,variable1.indexOf('=')).trim(),
  				    variable1.substring(variable1.indexOf('=')+1,variable1.length).trim());
		}
		return combinationsMap;		
	}
	
	  function getNextLearningOutcomeFirstPageId(currentLessonId, currentLearningOutcomeId) {
          let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonId)[0];
          let nextLearningOutcomeDetails = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.filter(lo => lo.learningOutcomeId == currentLearningOutcomeId + 1)[0];
          return nextLearningOutcomeDetails.pages[0].pageId;
      }

      function getNextLearningOutcomeIdUsingBinarySearch(currentLessonId, currentLearningOutcomeNumber) {
          let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonId)[0];
          let currentLessonTotalLearningOutcomes = currentLessonDetails.rootLearningOutcome.subLearningOutcomes.length;

          if (currentLearningOutcomeNumber == 0) {
              return Math.ceil(currentLessonTotalLearningOutcomes / 2);
          }
          else if (currentLearningOutcomeNumber == 1) {
              return 1;
          }
          return Math.ceil(currentLearningOutcomeNumber / 2);
      }

	function SubmitSparc() {	
		let _isSparcPassed = false;
		let sessionKeyIsSparcPassed ="isSparcPassed";
		var sparcConsoleOutput = removeTags(sessionStorage.getItem(currentConsoleOutput));
		_isSparcPassed = evaluateSparcConsoleOutput(sparcConsoleOutput);
		console.log(_isSparcPassed);
		sessionStorage.setItem(sessionKeyIsSparcPassed, _isSparcPassed);
		let currentLessonNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLessonNumber));
		let currentLearningOutcomeNumber = parseInt(sessionStorage.getItem(sessionKeyCurrentLearningOutcomeNumber));
		let currentLessonDetails = lessonsJson.lessons.filter(lesson => lesson.lessonId == currentLessonNumber)[0];
		let titleQuestion =  getActivityInformation(currentLessonNumber,currentLearningOutcomeNumber);
        let isAssessmentPassed = sessionStorage.getItem(sessionKeyIsAssessmentPassed) === 'true';
        let messageAlert = document.getElementById('message-div');
		let message = document.getElementById('next-step-link');
        if (_isSparcPassed) {
		     messageAlert.classList.remove('alert-success');
		    messageAlert.classList.remove('alert-danger');		     
		     messageAlert.classList.add('alert-success')
                message.innerHTML = "You have passed the assessment. Please click on Next below to Proceed";
            }
        else{
        	messageAlert.classList.remove('alert-success');
    		messageAlert.classList.remove('alert-danger');
    		     
    		messageAlert.classList.add('alert-danger'); 
    		var hint = titleQuestion.hint;
            message.innerHTML = "You have not passed the assessment. Please click on Next below to go to next step or try again with<br>"+
            "<b>Hint</b> : <i>"+hint+"</i>";
                 
        }
		submitAssessment(sessionStorage.getItem("pageIdToShow"),sparcConsoleOutput ,_isSparcPassed);

    }	
	
	
	const toggle = document.getElementById("questionToggle");
    toggle.addEventListener('click', () => {
    	var isExpanded = $(toggle).attr("aria-expanded");
    	const element = document.querySelector('.combined');
    	const elementEditor = document.querySelector('#editor');
    	if(isExpanded == "false"){
    		//alert("expanded");
    		const element = document.querySelector('.combined');
    	    element.style.marginLeft ='0px';
    	    elementEditor.style.marginLeft ='0px';
    	}else{
    		//alert("closed");    		
    	    element.style.marginLeft ='-485px';    	    
    	    elementEditor.style.marginLeft ='-485px';
    	}
    });

</script>
	<%@ include file="sparc-footer.jsp"%>
</body>
</html>
