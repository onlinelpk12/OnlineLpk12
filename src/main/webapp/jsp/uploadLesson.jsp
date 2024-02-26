<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>

<link rel="stylesheet" href="../styles/upload.css">
<script type="text/javascript">
    function reInitiateFreshPage(){
    	sessionStorage.setItem("pageIdToShow",'');
    }
</script>
<meta charset="UTF-8">
<title id="title"></title>
<%@ include file = "header.jsp" %>
</head>
<body>
	<div class="container pt-5">
	<div class="row">
	<div class="col-sm-6">
	
		<div class="file-input">
		  <form action="uploadLesson" method="post" id="uploadForm" enctype="multipart/form-data">
	        <label for="pdfFile">
	        Select Lesson as PDF File
	        </label>
	        <input type="file" id="pdfFile" name="file" class="file" accept=".pdf"><p class="pdffile-name"></p>
			<br><br>
			<p class="uploadPdf"></p>
			<br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <button type="button" onclick="submitPDF()">Upload</button>
	    </form>
		</div>
		
		<br>
		<br>
		<hr class="dashed">
		<br>
		<br>
		
		<div class="file-input">
	        <label for="excelFile">
	        Assessment as Excel File
	        </label>
	        <input type="file" id="excelFile" name="file" class="file" accept=".xlsx"><p class="excelfile-name"></p>
			<br><br>
			<p class="uploadExcel"></p>
			<br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <button type="button" onclick="submitExcel()">Upload</button>
		</div>
	    
	</div>
	<div class="col-sm-6" style="text-align: center;">
		<div class="card" style="width:400px">
			<img class="card-img-top" src="../images/uploadlesson.jpg" alt="progress" style="width:100%">
			<div class="card-body">
			</div>
		</div>
	</div>
	</div>
	</div>
    <script src="../js/uploadLesson.js"></script>
<%@ include file = "footer.jsp" %>
</body>
</html>
