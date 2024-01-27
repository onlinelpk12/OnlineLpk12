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
        	let originalAnswer = "% C is the Chemical Symbol for Carbo";
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
        	let originalAnswer = "symbolFor(carbon,c)";
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


