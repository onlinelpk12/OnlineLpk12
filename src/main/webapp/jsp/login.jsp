
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html><html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>Join Us</title> <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet"> <link href="style.css" rel="stylesheet" type="text/css"/> </head> <body> <%@ include file = "headerlog.jsp" %> <div class="container"> <div class="box"> <h1>Login Account</h1><form id="form" method="post"> <p>Username</p><input type="text" name="userName" placeholder="Username" id="username" required> <p>Password</p><input type="password" placeholder="Password" id="password" required> <input type="submit" value="Login" > <a href="forgotPassword.jsp">Forgot Password?</a><br> <a href="register.jsp">Create New Account</a> </form></div></div><%@ include file = "footer.jsp" %></body><script type="text/javascript">var form=document.getElementById('form');form.addEventListener('submit',function(e){ e.preventDefault() var username=document.getElementById('username').value; var password=document.getElementById('password').value; //fetch post request fetch("https://onlinelpk12node.azurewebsites.net/api/auth/signin",{ method:'POST', body: JSON.stringify({ "username":username, "password":password }), headers:{ 'Content-Type':'application/json; charset=UTF-8' } }).then(function(response){ var resp=response.json(); console.log(resp) if(response.status==200){ resp.then((data)=>{ sessionStorage.setItem("username",data.username) sessionStorage.setItem("userId",data.id) console.log(sessionStorage.getItem("userId"))
if(data.roles=="ROLE_TEACHER"){
location.href='hometeacher.jsp'
}
else if(data.roles=='ROLE_STUDENT'){
location.href='home.jsp'
} }) } else{ if(response.status==404){ resp.then((data)=>{ alert(data.message) }) }
else if (response.status=401){
resp.then((data)=>{
alert(data.message)
})
} } }).then(function(data){ });})</script></html><%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html><html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>Join Us</title> <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet"> <link href="style.css" rel="stylesheet" type="text/css"/> </head> <body> <%@ include file = "headerlog.jsp" %> <div class="container"> <div class="box"> <h1>Login Account</h1><form id="form" method="post"> <p>Username</p><input type="text" name="userName" placeholder="Username" id="username" required> <p>Password</p><input type="password" placeholder="Password" id="password" required> <input type="submit" value="Login" > <a href="forgotPassword.jsp">Forgot Password?</a><br> <a href="register.jsp">Create New Account</a> </form></div></div><%@ include file = "footer.jsp" %></body><script type="text/javascript">var form=document.getElementById('form');form.addEventListener('submit',function(e){ e.preventDefault() var username=document.getElementById('username').value; var password=document.getElementById('password').value; //fetch post request fetch("https://onlinelpk12node.azurewebsites.net/api/auth/signin",{ method:'POST', body: JSON.stringify({ "username":username, "password":password }), headers:{ 'Content-Type':'application/json; charset=UTF-8' } }).then(function(response){ var resp=response.json(); console.log(resp) if(response.status==200){ resp.then((data)=>{ sessionStorage.setItem("username",data.username) sessionStorage.setItem("userId",data.id) console.log(sessionStorage.getItem("userId"))
if(data.roles=="ROLE_TEACHER"){
location.href='hometeacher.jsp'
}
else if(data.roles=='ROLE_STUDENT'){
location.href='home.jsp'
} }) } else{ if(response.status==404){ resp.then((data)=>{ alert(data.message) }) }
else if (response.status=401){
resp.then((data)=>{
alert(data.message)
})
} } }).then(function(data){ });})</script></html>

