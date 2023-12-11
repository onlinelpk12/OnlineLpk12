<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title id="title"></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="../js/verifytoken.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../styles/lesson2.css">
    <script type="text/javascript">
        $(function () {
            verifytoken();
        });

        function reInitiateFreshPage() {
            sessionStorage.setItem("pageIdToShow", '');
        }
    </script>
    
	<%@ include file = "header.jsp" %>
</head>
<body>
    <div class="container">
    
        <div id="pdfContainer" class="text-center"></div>
		<section id="dynamicContent" class="container" hidden>
		    <div class="row">
		        <div class="col-md-6 content" style="margin-left: 20rem;">
		            <h1 class="text-primary" id="header"></h1>
		            <div id="data"></div>
		
		            <div id="questionsAndInputs"></div>
				</div>
		    </div>
		</section>
        <nav aria-label="Page navigation">
            <center> <ul class="pagination">
                <li id="prevPage" class="page-item">
                    <a class="page-link" href="#">Previous</a>
                </li>
                <li id="nextPage" class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
            </center>
        </nav>
    </div>
    
    

    <!-- Include Bootstrap and jQuery JS libraries -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Include PDF.js library locally -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
	<script src="../js/renderLesson.js"></script> 
    
</body>
</html>
