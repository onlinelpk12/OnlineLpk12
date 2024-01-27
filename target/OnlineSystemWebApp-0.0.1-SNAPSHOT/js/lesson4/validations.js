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


let elementProtonMap = new Map();
elementProtonMap.set(0,"16");
elementProtonMap.set(1,"13");
elementProtonMap.set(2,"18");
elementProtonMap.set(3,"4");
elementProtonMap.set(4,"5");
elementProtonMap.set(5,"20");
elementProtonMap.set(6,"6");
elementProtonMap.set(7,"17");
elementProtonMap.set(8,"9");
elementProtonMap.set(9,"2");
elementProtonMap.set(10,"3");
elementProtonMap.set(11,"12");
elementProtonMap.set(12,"10");
elementProtonMap.set(13,"7");
elementProtonMap.set(14,"8");
elementProtonMap.set(15,"19");
elementProtonMap.set(16,"14");
elementProtonMap.set(17,"11");

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


/*var knowledgeCommentBox = document.getElementById("massNumber");
console.log(knowledgeCommentBox)
    knowledgeCommentBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("correctAnswerComment");
        	let answer = knowledgeCommentBox.value;
        	let originalAnswer = "12";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		knowledgeCommentBox.className = 'form-control-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		knowledgeCommentBox.className = 'form-control-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        		let displayOtherTwo = document.getElementById("displayOnlyCorrect");
        		displayOtherTwo.hidden = false;
        	}
    	}
    	
}); */

var funBox = document.getElementById("fBox");
console.log(funBox)
    funBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("cAnswer");
        	let answer = funBox.value;
        	let originalAnswer = "John";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		funBox.className = 'form-control-sBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		funBox.className = 'form-control-sBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
});
/*var comBox = document.getElementById("cBox");
console.log(comBox)
    comBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("fAnswer");
        	let answer = comBox.value;
        	let originalAnswer = "12";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		comBox.className = 'form-control-dBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		comBox.className = 'form-control-dBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
}); 

/*var sunBox = document.getElementById("massNumHBox");
    sunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("eAnswer");
        	let answer = sunBox.value;
        	let originalAnswer = "% The mass number of hydrogen is 1";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		sunBox.className = 'form-control-eBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		sunBox.className = 'form-control-eBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
}); 

var hunBox = document.getElementById("massNumPBox");
console.log(hunBox)
    hunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("pAnswer");
        	let answer = hunBox.value;
        	let originalAnswer = "massNumber(H, 1)";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		hunBox.className = 'form-control-xBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		hunBox.className = 'form-control-xBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
}); 
var dunBox = document.getElementById("wBox");
console.log(dunBox)
    dunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("yAnswer");
        	let answer = dunBox.value;
        	let originalAnswer = "13";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		dunBox.className = 'form-control-zBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		dunBox.className = 'form-control-zBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
});*/ 

var zunBox = document.getElementById("yBox");
console.log(zunBox)
    zunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("zAnswer");
        	let answer = zunBox.value;
        	let originalAnswer = "dad(X, Y) :- father(X, Y).";
        	if(answer == originalAnswer){
        		zunBox.className = 'form-control-tBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		zunBox.className = 'form-control-tBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
}); 

/*var wunBox = document.getElementById("gBox");
console.log(wunBox)
    wunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("nAnswer");
        	let answer = wunBox.value;
        	var originalAnswer = "neutronsOf(E, N) :- massNumber(E, M), protonsOf(E, P),N = M-P";
        	if(answer == originalAnswer){
        		wunBox.className = 'form-control-oBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		wunBox.className = 'form-control-oBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
});*/ 

var yunBox = document.getElementById("iBox");
console.log(yunBox)
    yunBox.addEventListener('keydown', function(e){
    	if (e.key === "Enter") {  
    		var correctAnswerComment = document.getElementById("uAnswer");
        	let answer = yunBox.value;
        	let originalAnswer = "yes";
        	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
        		yunBox.className = 'form-control-xoBox-correct';
        		correctAnswerComment.innerHTML = "";
        	}
        	else {
        		yunBox.className = 'form-control-xoBox-incorrect';
        		correctAnswerComment.innerHTML = originalAnswer;
        	}
    	}
    	
}); 
var factBox = document.getElementById("exBox");
factBox.addEventListener('keydown', function(e){
	if (e.key === "Enter") { 
    	var correctAnswerComment = document.getElementById("exAnswer");
    	let answer = factBox.value;
    	let originalAnswer = "inTexas(X) :- inLubbock(X)";
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		factBox.className = 'form-control-exBox-correct';
    		correctAnswerComment.innerHTML = "";
    	}
    	else {
    		factBox.className = 'form-control-exBox-incorrect';
    		correctAnswerComment.innerHTML = originalAnswer;
    	}
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
