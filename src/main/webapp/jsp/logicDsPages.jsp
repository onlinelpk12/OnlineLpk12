<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- -->
<script type="text/javascript">
	function reInitiateFreshPage() {
		sessionStorage.setItem("pageIdToShow", '');
	}
</script>
<meta charset="UTF-8">
<title>Logic DS Lessons</title>
<%@ include file="header.jsp"%>
<style>
a.disabled {
	/* Make the disabled links grayish*/
	color: gray;
	/* And disable the pointer events */
	pointer-events: none;
}
</style>
</head>
<body>
	<div class="container pt-5">
		<div class="row">
			<div class="col-sm-6">
				<h2>Click below links to view the LogicDS lessons:</h2>
				<ul>
					<p></p>
					<li><a href="../jsp/lesson0Ids.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 0!</a></li>
					<p></p>
					<li><a href="../jsp/lesson1Part1Ids.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 1: Part I</a></li>
					<p></p>
					<li><a href="../jsp/lesson1Part2Ids.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 1: Part II</a></li>
					<p></p>
					<li><a href="../jsp/lesson2Ids.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 2!</a></li>
					<p></p>
					<li><a href="../jsp/lesson3Ids.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 3!</a></li>
					<p></p>
					<li><a href="../jsp/lesson4lds.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 4!</a></li>
					<p></p>
					<li><a href="../jsp/lesson4ReviewIds.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 4: Quick Review</a></li>
					<p></p>
					<li><a href="../jsp/lesson4N5ReviewIds.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 4, 5: Review of Computing and R</a></li>
					<p></p>
					<li><a href="../jsp/lesson5lds.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 5!</a></li>
					<p></p>
					
					<li><a href="../jsp/lesson6Ids.jsp"
						onclick="reInitiateFreshPage()">Click here to View Lesson 6!</a></li>
					<p></p>
				</ul>
			</div>
		</div>
	</div>
	<br>
	<%@ include file="footer.jsp"%>
</body>
</html>