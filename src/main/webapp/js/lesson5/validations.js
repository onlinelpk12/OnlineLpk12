//Hydrogen assessment Validation
let elementMap = new Map();
elementMap.set(0,"Sulfur");
elementMap.set(1,"Aluminium");
elementMap.set(2,"Argon");
elementMap.set(3,"Beryllium");
elementMap.set(4,"Boron");
elementMap.set(5,"Calcium");
elementMap.set(6,"Carbon");
elementMap.set(7,"Chlorine");
elementMap.set(8,"Fluorine");
elementMap.set(9,"Helium");
elementMap.set(10,"Lithium");
elementMap.set(11,"Magnesium");
elementMap.set(12,"Neon");
elementMap.set(13,"Nitrogen");
elementMap.set(14,"Oxygen");
elementMap.set(15,"Potassium");
elementMap.set(16,"Silicon");
elementMap.set(17,"Sodium");


let elementSymbolMap = new Map();
elementSymbolMap.set(0,"S");
elementSymbolMap.set(1,"Al");
elementSymbolMap.set(2,"Ar");
elementSymbolMap.set(3,"Be");
elementSymbolMap.set(4,"B");
elementSymbolMap.set(5,"Ca");
elementSymbolMap.set(6,"C");
elementSymbolMap.set(7,"Cl");
elementSymbolMap.set(8,"F");
elementSymbolMap.set(9,"He");
elementSymbolMap.set(10,"Li");
elementSymbolMap.set(11,"Mg");
elementSymbolMap.set(12,"Ne");
elementSymbolMap.set(13,"N");
elementSymbolMap.set(14,"O");
elementSymbolMap.set(15,"P");
elementSymbolMap.set(16,"Si");
elementSymbolMap.set(17,"Na");

const elementSelected = false;
const elementName = ""; 
const elementSymbol = "";

var factBox = document.getElementById("fact");
var identifyNextBtn = document.getElementById("identifyNextBtn");
var kNextBtn = document.getElementById("kNextBtn");
var knowledgeCommentBox = document.getElementById("knowledgeComment");
console.log(knowledgeCommentBox)
    knowledgeCommentBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("correctAnswerComment");
    		
    		let originalFactAnswer = "symbolFor(hydrogen, H)";
    		let answerFact = factBox.value;
        	let answer = knowledgeCommentBox.value;
        	let originalAnswer = "% The chemical symbol for hydrogen is H";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		knowledgeCommentBox.className = 'form-control-correct';
        		correctAnswerComment.innerHTML = "";
        		if(answer.toLowerCase() == originalAnswer.toLowerCase()
        	   && answerFact.toLowerCase() == originalFactAnswer.toLowerCase())
        	   {
        			kNextBtn.removeAttribute("disabled");
        		}
        	}
        	else {
        		knowledgeCommentBox.className = 'form-control-incorrect';
        		correctAnswerComment.innerHTML = "% The chemical symbol for hydrogen is H";
        		kNextBtn.setAttribute("disabled", "disabled");
        	}
    	}
    	
}); 
knowledgeCommentBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("correctAnswerComment");
	if(knowledgeCommentBox.value === "")
	{
		knowledgeCommentBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});
// 


factBox.addEventListener('keydown', function(e){
	if (e.key === "Enter") { 
		
		
		let answerKc = knowledgeCommentBox.value;
		let originalKcAnswer = "% The chemical symbol for hydrogen is H";
    	var correctAnswerComment = document.getElementById("correctAnswerFact");
    	let answer = factBox.value;
    	let originalAnswer = "symbolFor(hydrogen, H)";
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		factBox.className = 'form-control-fact-correct';
    		correctAnswerComment.innerHTML = "";
    		if(answer.toLowerCase() == originalAnswer.toLowerCase() && 
    	answerKc.toLowerCase() == originalKcAnswer.toLowerCase())
    	{
    		kNextBtn.removeAttribute("disabled");
    		}
    	}
    	else {
    		factBox.className = 'form-control-fact-incorrect';
    		correctAnswerComment.innerHTML = "symbolFor(hydrogen, H)";
    		kNextBtn.setAttribute("disabled", "disabled");
    	}
	}
	
}); 

factBox.addEventListener('input', function()
{
	var correctAnswerComment = document.getElementById("correctAnswerFact");
	if(factBox.value === "")
	{
		factBox.className = 'form-control';
		correctAnswerComment.innerHTML = "";
	}	
});

var icnextbutton=document.getElementById("icnextbutton");
var symbolCBox = document.getElementById("identifySymbolC");

symbolCBox.addEventListener('keyup', function(){
	    //do some stuff
	    //alert("hello");
    	let answer = symbolCBox.value;
    	let originalAnswer = "C";
    	var correctAnswerC=document.getElementById("correctAnswerC");
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		symbolCBox.className = 'form-control-carbon-correct';
    		icnextbutton.removeAttribute("disabled");
    		correctAnswerC.innerHTML="";
    	}
    	else {
    		symbolCBox.className = 'form-control-carbon-incorrect';
    		icnextbutton.setAttribute("disabled","disabled");
    		correctAnswerC.innerHTML="C";
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
    		identifyNextBtn.removeAttribute("disabled");
    	}
    	else {
    		symbolPBox.className = 'form-control-p-incorrect';
    		identifyNextBtn.setAttribute("disabled", "disabled");
    	}
});

function changeImageRandomly(){
	let randomNumber = getRandomInt(17);
	console.log(randomNumber);
	document.getElementById("randomImageDisplay").src = "../images/lesson5/elements/"+randomNumber+".png";
	let selectedElement = elementMap.get(randomNumber);
	document.getElementById("chosenElement").innerHTML = "Extend model: add the knowledge about symbol <b>"+elementMap.get(randomNumber)+"</b> to the model";
	sessionStorage.setItem("elementSelected",true);
	sessionStorage.setItem("elementName",selectedElement);
	sessionStorage.setItem("elementSymbol",elementSymbolMap.get(randomNumber));
	
}

function getRandomInt(max) {
	  return Math.floor(Math.random() * max);
}
