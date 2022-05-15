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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
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
<div id="student-progress-table" style="width:80%;margin:2% 10%;">

 
<br>
<h2>Courses that are accessible</h2> 

 <br>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script type="text/javascript"> 
let htmlTable = "<table class='table table-sm table-bordered table-hover'>";
let headerRow = "<tr style='background-color:#275E9B;color:white'>";
headerRow += "<th>" + "Student ID" + "</th>";
headerRow += "<th>" + "Student Name" + "</th>";
headerRow += "<th>" + "username" + "</th>";
headerRow += "<th>" + "Programs executed in Sparc" + "</th>";
headerRow += "<th>" + "Answers submitted in assessments" + "</th>";
headerRow += "<th>" + "Lesson status" + "</th>";


htmlTable+= headerRow;
for(let i=1; i<=6;i++)
{
let row = "";
row += "<tr>";
row += '<td>' + '1'+ '</td>';
row += '<td>' + 'Sadhana' + '</td>';
row += '<td>' + 'sadhana' + '</td>';
row+='<td>' + ' <a href="teacher2.jsp"> ' + 'Click here to view Students Sparc programs</a>' +'</td>'; 
row+='<td>' + ' <a href="teacher4.jsp"> ' + 'Click here to view Students answers submitted in assessments </a>' +'</td>'; 
row+='<td>' + ' <a href="teacher6.jsp"> ' + 'Click here to view Students lesson Status </a>' +'</td>'; 
row += '</tr>';
htmlTable += row;
}
htmlTable += '</table>';
$('#student-progress-table').html(htmlTable);


</script>
 
 
 
 









 