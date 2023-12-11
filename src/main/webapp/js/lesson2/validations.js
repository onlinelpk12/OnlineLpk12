const elementSelected = false;
const elementName = ""; 
const elementSymbol = "";

var iNextBtn = document.getElementById("iNextBtn");
var yunBox = document.getElementById("iBox");
console.log(yunBox)
    yunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("uAnswer");
        	let answer = yunBox.value;
        	let originalAnswer = "% John is a parent of Peter";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		yunBox.className = 'form-control-xoBox-correct';
        		correctAnswerComment.innerHTML = "";
        		iNextBtn.removeAttribute("disabled");
        	}
        	else {
        		yunBox.className = 'form-control-xoBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        		iNextBtn.setAttribute("disabled", "disabled");
        	}
    	}
    	
}); 

yunBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("uAnswer");
	if(yunBox.value === "")
	{
		yunBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});


var factBox = document.getElementById("exBox");
factBox.addEventListener('keydown', function(e){
	if (e.key === "Enter") { 
    	var correctAnswerComment = document.getElementById("exAnswer");
    	let answer = factBox.value;
    	let originalAnswer = "parent(john, peter)";
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		factBox.className = 'form-control-exBox-correct';
    		correctAnswerComment.innerHTML = "";
    		iNextBtn.removeAttribute("disabled");
    	}
    	else {
    		factBox.className = 'form-control-exBox-incorrect';
    		correctAnswerComment.innerHTML = originalAnswer;
    		iNextBtn.setAttribute("disabled", "disabled");
    	}
	}
	
}); 

factBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("exAnswer");
	if(factBox.value === "")
	{
		factBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});


var fNextBtn = document.getElementById("fNextBtn");
var funBox = document.getElementById("fBox");
console.log(funBox)
    funBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("cAnswer");
        	let answer = funBox.value;
        	let originalAnswer = "mom(joaan, peter)";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		funBox.className = 'form-control-sBox-correct';
        		correctAnswerComment.innerHTML = "";
        		fNextBtn.removeAttribute("disabled");
        	}
        	else {
        		funBox.className = 'form-control-sBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        		fNextBtn.setAttribute("disabled", "disabled");
        	}
    	}
    	
});

funBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("cAnswer");
	if(funBox.value === "")
	{
		funBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});

var zunBox = document.getElementById("yBox");
console.log(zunBox)
    zunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("zAnswer");
        	let answer = zunBox.value;
        	let originalAnswer = "dad(john,peter)";
        	if(answer == originalAnswer){
        		zunBox.className = 'form-control-tBox-correct';
        		correctAnswerComment.innerHTML = "";
        		fNextBtn.removeAttribute("disabled");
        	}
        	else {
        		zunBox.className = 'form-control-tBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        		fNextBtn.setAttribute("disabled", "disabled");
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






/*
var symbolCBox = document.getElementById("identifySymbolC");
symbolCBox.addEventListener('keyup', function(){
	    //do some stuff
	    //alert("hello");
    	let answer = symbolCBox.value;
    	let originalAnswer = "C";
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		symbolCBox.className = 'form-control-carbon-correct';
    	}
    	else {
    		symbolCBox.className = 'form-control-carbon-incorrect';
    	}
}); 


var symbolPBox = document.getElementById("identifySymbolP");
symbolPBox.addEventListener('keyup', function(){
	    //do some stuff
	    //alert("hello");
    	let answer = symbolPBox.value;
    	let originalAnswer = "P";
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		symbolPBox.className = 'form-control-p-correct';
    	}
    	else {
    		symbolPBox.className = 'form-control-p-incorrect';
    	}
});*/

/*function changeImageRandomly(){
	let randomNumber = getRandomInt(17);
	console.log(randomNumber);
	document.getElementById("randomImageDisplay").src = "../images/lesson5/elements/"+randomNumber+".png";
	let selectedElement = elementMap.get(randomNumber);
	document.getElementById("chosenElement").innerHTML = "Extend model: write the relation between atomic number and proton number of <b>"+selectedElement+"</b>";
	sessionStorage.setItem("elementSelected",true);
	sessionStorage.setItem("elementProtonNumber",elementProtonMap.get(randomNumber));
	sessionStorage.setItem("elementSymbol",elementSymbolMap.get(randomNumber));
	
}

function getRandomInt(max) {
	  return Math.floor(Math.random() * max);
}*/
