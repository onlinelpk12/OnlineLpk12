const elementSelected = false;
const elementName = ""; 
const elementSymbol = "";
var nextButton = document.getElementById("nextButton");

var dunBox = document.getElementById("wBox");
console.log(dunBox)
    dunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("yAnswer");
        	let answer = dunBox.value;
        	let originalAnswer = "Carbon: an element";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		dunBox.className = 'form-control-zBox-correct';
        		correctAnswerComment.innerHTML = "";
        		nextButton.removeAttribute("disabled");
        	}
        	else {
        		dunBox.className = 'form-control-zBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        		nextButton.setAttribute("disabled", "disabled");
        	}
    	}
    	
}); 
dunBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("yAnswer");
	if(dunBox.value === "")
	{
		dunBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});

var zunBox = document.getElementById("yBox");
console.log(zunBox)
    zunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("zAnswer");
        	let answer = zunBox.value;
        	let originalAnswer = "X: the atomic number of carbon";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		zunBox.className = 'form-control-tBox-correct';
        		correctAnswerComment.innerHTML = "";
        		nextButton.removeAttribute("disabled");
        	}
        	else {
        		zunBox.className = 'form-control-tBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        		nextButton.setAttribute("disabled", "disabled");
        	}
    	}
    	
}); 
zunBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("zAnswer");
	if(zunBox.value === "")
	{
		zunBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});
var funBox = document.getElementById("xBox");
console.log(funBox)
    funBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("xAnswer");
        	let answer = funBox.value;
        	let originalAnswer = "atomicNumber(X, hydrogen)";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		funBox.className = 'form-control-sBox-correct';
        		correctAnswerComment.innerHTML = "";
        		nextButton.removeAttribute("disabled");
        	}
        	else {
        		funBox.className = 'form-control-sBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        		nextButton.setAttribute("disabled", "disabled");
        		
        	}
    	}
    	
}); 
funBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("xAnswer");
	if(funBox.value === "")
	{
		funBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});






