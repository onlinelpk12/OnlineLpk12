<!DOCTYPE html>
<html lang="en">
<head>
<script src="ace.js" type="text/javascript" charset="utf-8"></script>
<script src="mode-sparc.js" type="text/javascript"></script>
<script src="easyTree.js" type="text/javascript"></script>
<script src="easytree-response.js" type="text/javascript"></script>
<script src = "jquery.min.js" type="text/javascript"></script>
<script src = "bootstrap.min.js" type="text/javascript"></script>
<link rel = "stylesheet" href  = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">    
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
                    <!-- OPEN BUTTON -->
                    <li> <button type="button" class="btn btn-default navbar-btn" id="menu-toggle" value="getAccessibleDirectory">
                        Directory
                    </button> </li>

                    <!-- NEW BUTTON -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="btn_new">
                            New
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a href="#" id="newFolder">New Folder</a></li>
                            <li><a href="#" id="newFile">New File</a></li>
                        </ul>
                    </li>

                    <!-- SAVE BUTTON -->
                    <li> <button type="button" class="btn btn-default navbar-btn" id="btn_save">
                        Save
                    </button> </li>
                    <!-- SHARE BUTTON -->
                    <li><a class="btn btn-launch" href="javascript:;" data-toggle="modal" data-target="#shareModal" id="navbar_btn_share">Share</a></li>
                    <!-- ISSUES  BUTTON -->
                    <li><a class="btn btn-launch" id="navbar_btn_issues">Issues?</a></li>
               		 </ul>
                			<ul class="nav navbar-nav navbar-right">
                				<li>
									<input type="text" class="form-control" placeholder="Enter query" name="txt_query" id="txt_query" size="50">
								</li>
								<li>
									<button type="submit" class="btn btn-default navbar-btn" id="btn_getQuery" value="getQuery" onclick="submitrequest()">
	                            			Submit
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

<script src="resizer.js" type="text/javascript"></script>
<script type="text/javascript">
	window.onload = function(){
	let request = {
        "action": "getFileContent",
        "fileurl": "_templates/sparc.sp"
    };
	PostSparc(request);
	}
	
	const apiBaseUrl = "https://onlinelpk12appservice.azurewebsites.net/api/sparc/execute";
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
	             "action": "getAnimation",
	             "editor":  program
	         };
		PostSparc(request);
		
	}
	
	function answerSets(){
		let program = editor.getValue(); 
		if(program == null || program == '' || program == undefined){
			program = '';
		}
		let request = {
	             "action": "getAnswerSets",
	             "editor":  program
	         };
		PostSparc(request);
		//let answersetsreq=buildGetAnswerSetsRequest();
		//PostGetAnswerSets(answersetsreq);
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
	             "action": "getQuery",
	             "query" : query,
	             "editor":  program
	         };
		PostSparc(request);
		//let submitreq=buildSubmitQueryRequest();
		//PostSubmit(submitreq);
	}
	
	function PostSparc(request) {
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
            url: apiBaseUrl,
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
</body>
</html>