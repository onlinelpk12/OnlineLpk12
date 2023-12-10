<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Online LPK12</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
    <link href="../styles/style-login-register.css" rel="stylesheet" type="text/css"/>
    <link href="../styles/style.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>
    <%@ include file = "headerlog.jsp" %>
    <h2>Online LPK12</h2>
    <div class="row" style="margin-top:10rem">
      <div class="col-md-6 col-md-offset-2">
        <img src="../images/education.png" alt="Image" width="500" height="600">
      </div>
      <div class="col-md-2">
        <div class="form-group">
          <h1>Login Account</h1>
  	  <form id="form" method="post" >
 	    <label for="login">Username</label>
	    <input type="text"  name="userName" placeholder="Username" id="username" required>
	    <br>
 	    <label for="password">Password</label>
	    <input type="password" placeholder="Password" id="password" required>
 	    <br>
	    <br>
            <input type="submit"  value="Login" >  <br>
            <a href="forgotPassword.jsp">Forgot Password?</a><br>
            <a href="register.jsp">Create New Account</a>  <br>
          </form>
          <br>
	</div>
      </div>
    </div>
    <%@ include file = "footer.jsp" %>
  </body>
  <script type="text/javascript">
    var form=document.getElementById('form');
    form.addEventListener('submit',function(e){
      e.preventDefault()
      var username=document.getElementById('username').value;
      var password=document.getElementById('password').value;
      //fetch post request
      const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";
      const signInAPI = corsProxy+"https://onlinelpk12nodeservice.herokuapp.com/api/auth/signin";
      fetch(signInAPI,{
        method:'POST',
        body: JSON.stringify({
            "username":username,
            "password":password
        }),
        headers:{
          'Content-Type':'application/json; charset=UTF-8'
        }
      }).then(function(response){
        var resp=response.json();
        console.log(resp)
        if(response.status==200){
            resp.then((data)=>{
                sessionStorage.setItem("username",data.username)
                sessionStorage.setItem("userId",data.id)
		sessionStorage.setItem("token",data.accessToken)
                console.log(sessionStorage.getItem("userId"))	
              	if(data.roles=="ROLE_TEACHER"){
		  sessionStorage.setItem("userRole","Teacher")
              	  location.href='hometeacher.jsp'
              	}
              	else if(data.roles=='ROLE_STUDENT'){
		  sessionStorage.setItem("userRole","Student")
              	  location.href='home.jsp'
              	}
            })
        }
        else{
            if(response.status==404){
                resp.then((data)=>{
                    alert(data.message)
                })
            }
            else if (response.status=401){
            	resp.then((data)=>{
            		alert(data.message)
            	})
            }
        }
    }).then(function(data){
    });
})
</script>
</html>
