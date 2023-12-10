<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sparc Program</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="student-progress" style='width:80%;margin:2% 10%'>
</div>

<script type="text/javascript">
let div = "<div style='text-align:center'>";
let content = "<h2>Student Progress</h2>";
content += "<br>";
content += "<h5><b>Student Name:</b></h5>";
content += "<h5><b>Student Id:</b></h5>";
div += content;
div += "</div>";
div += "<div style='width:80%;margin:2% 10%;'>";
let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
let headerRow = "<tr style='background-color:#275E9B;color:white'>";
headerRow += "<th>" + "Program Number" + "</th>";
headerRow += "<th>" + "Program written by student" + "</th>";
htmlTable+= headerRow;
for(let i=1; i<2; i++)
{
let row = "";
row += "<tr>";
row += '<td>' + i + '</td>';
row += '<td>' + '</td>';
row += '</tr>';
htmlTable += row;
}
htmlTable += '</table>';
div += htmlTable;
div += "</div>";
$('#student-progress').html(div);

</script>
</body>
<jsp:include page="footer.jsp"/>
</html>