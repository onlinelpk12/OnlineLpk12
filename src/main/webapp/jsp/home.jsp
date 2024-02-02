<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- -->
<meta charset="UTF-8">
<title>Home</title>
<%@ include file = "header.jsp" %>
<style>
    .card {
                width: 275px;
                margin: 0 auto; /* Center the card horizontally */
            }
    </style>
</head>
<body>
<div class="container">
        <h2>LPK Project</h2>
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                            Online LPK12
                        </a>
                    </h4>
                </div>
                <div id="collapse1" class="panel-collapse collapse">
                    <div class="panel-body">
                       <div id="lpk12" class="container pt-5" style="text-align: center">
		<div class="course-header">
			<h1>OnlineLpk12</h1>
		</div>
		<div class="row">
			<div class="col-md-6">
				<h2>Lessons</h2>
				<div class="card" style="width: 400px">
					<form action="lessonnumber.jsp">
						<img class="card-img-top" src="../images/lessons.png"
							alt="lessons" style="width: 100%">
						<div class="card-body">
							<p class="card-text">Click below to view lessons</p>
							<a href="lesson.jsp" class="btn btn-primary">Lessons</a>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-6">
				<h2>My Progress</h2>
				<div class="card" style="width: 400px">
					<form action="progress.jsp">
						<img class="card-img-top" src="../images/progress.jpg"
							alt="progress" style="width: 100%">
						<div class="card-body">
							<p class="card-text">Click below to view progress</p>
							<a href="../jsp/student.jsp" class="btn btn-primary">My
								Progress</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                            LogicDS
                        </a>
                    </h4>
                </div>
                <div id="collapse2" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div id="lpk12" class="container pt-5" style="text-align: center">
		<div class="course-header">
			<h1>Logic DS</h1>
		</div>
		<div class="row">
			<div class="col-md-6">
				<h2>Lessons</h2>
				<div class="card" style="width: 400px">
					<form action="lessonnumber.jsp">
						<img class="card-img-top" src="../images/lpkimage.jpg"
							alt="lessons" style="width: 100%">
						<div class="card-body">
							<p class="card-text">Click below to view lessons</p>
							<a href="logicDsPages.jsp" class="btn btn-primary">Lessons</a>
						</div>
					</form>
				</div>
			</div>
								 

			<div class="col-sm-6">
				<h2>My Progress</h2>
				<div class="card" style="width: 400px">
					<form action="progress.jsp">
						<img class="card-img-top" src="../images/progress.jpg"
							alt="progress" style="width: 100%">
						<div class="card-body">
							<p class="card-text">Click below to view progress</p>
							<a href="../jsp/student.jsp" class="btn btn-primary">My
								Progress</a>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<br>
	<%@ include file="footer.jsp"%>
	<script>
$(function() {
$("#goBackButton").hide();
});
</script>
</body>
</html>