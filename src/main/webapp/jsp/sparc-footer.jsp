<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/script.js"></script>
<meta charset="UTF-8">
<style>
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: steelblue;
  color: white;
  text-align: center;
}
</style>

</head>
<body>
<script type="text/javascript">

  </script>

<div class="footer">
 <div class="row" style="margin:1rem 5rem 0 5rem">
 	<div class="col-md-4">
 	</div>
 	<div class="col-md-4">
 	  <h4 style="text-align:center">Online SPARC</h4>
 	</div>
 	<div class="col-md-4">
 	  <div id="sparcFooterNextBtn">
 	     <button class="btn btn-primary pull-right" onclick="SubmitSparc()"> Next</button>
 	  </div>
 	</div>
 </div>

</div>

</body>
<script type="text/javascript">
function SubmitSparc() {

    let isSparcPassed = true;
    let sessionKeyIsSparcPassed ="isSparcPassed";
    if(isSparcPassed==false){
    //validate sparc program
    return;
    
    }
    
    sessionStorage.setItem(sessionKeyIsSparcPassed, isSparcPassed);

    if (isSparcPassed) {

        window.open("../jsp/postSubmit.jsp", "_self");

    }

}

</script>
</html>
