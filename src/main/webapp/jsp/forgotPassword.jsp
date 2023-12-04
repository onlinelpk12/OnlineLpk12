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

          <h1>Forgot password</h1>

  	  <form id="form" method="post" >

	    <label for="email">Email id</label>

	    <input type="text"  name="email" placeholder="email" id="email" required>

	    <br>

	    <label for="newPassword">New Password</label>

	    <input type="Password" placeholder="New Password" id="newPassword" required>

	    <br>

	    <br>

            <input type="submit"  value="Change Password" >  <br>

            <a href="login.jsp">Return to Login</a>  <br>

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

      var email=document.getElementById('email').value;

      var newPassword=document.getElementById('newPassword').value;

      //fetch post request

      //const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";

      const forgotPasswordAPI = "http://localhost:8083/api/auth/forgotPassword";

      fetch(forgotPasswordAPI,{

        method:'POST',

        body: JSON.stringify({

            "email_id":email,

            "password":newPassword

        }),

        headers:{

          'Content-Type':'application/json; charset=UTF-8'

        }

      }).then(function(response){

        var resp=response.json();

        console.log(resp)

        if(response.status==200){

            resp.then((data)=>{

                location.href='login.jsp'

              	

            })

        }

        else{

            if(response.status==404){

                resp.then((data)=>{

                    alert(data.message)

                    location.href='forgotPassword.jsp'

                })

            }

            else if (response.status=401){

            	resp.then((data)=>{

            		alert(data.message)

            		location.href='forgotPassword.jsp'

            	})

            }

        }

    }).then(function(data){

    });

})

</script>

</html>