<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="script.js"></script>
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
 	  <!--  <div id="sparcFooterPrevBtn">
 	    <button class="btn btn-primary pull-left" onclick="goPrev()"> Previous </button>
 	  </div> -->
 	</div>
 	<div class="col-md-4">
 	  <h4 style="text-align:center">Online SPARC</h4>
 	</div>
 	<div class="col-md-4">
 	  <div id="sparcFooterNextBtn">
 	     <button class="btn btn-primary pull-right" onclick="SubmitSparc()"> Submit Program </button>
 	  </div>
 	</div>
 </div>

</div>

</body>
<script type="text/javascript">

function goNext() {
	let sparcPageValue= sessionStorage.getItem("sparcValue");
	if(sparcPageValue=="true"){
	window.location.href="../html/lesson2.html";
	}
	else{
		window.location.href="../jsp/sparc-results.jsp";
	}
}

function goPrev() {
	window.location.href="../html/lesson2.html";

}


function SubmitSparc() {

    let isSparcPassed = true;
    let sessionKeyIsSparcPassed ="isSparcPassed";
    if(isSparcPassed==false){
    //validate sparc program
    return;
    
    }
    
    sessionStorage.setItem(sessionKeyIsSparcPassed, isSparcPassed);

    if (isSparcPassed) {

        window.open("../html/postSubmit.html", "_self");

    }

}

</script>
</html>
