//Hydrogen assessment Validation

var knowledgeCommentBox = document.getElementById("knowledgeComment");
console.log(knowledgeCommentBox)
    knowledgeCommentBox.addEventListener('keyup', function(){
	    //do some stuff
	    //alert("hello");
    	var correctAnswerComment = document.getElementById("correctAnswerComment");
    	let answer = knowledgeCommentBox.value;
    	let originalAnswer = "% The chemical symbol for hydrogen is H";
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		knowledgeCommentBox.className = 'form-control-correct';
    		correctAnswerComment.innerHTML = "";
    	}
    	else {
    		knowledgeCommentBox.className = 'form-control-incorrect';
    		correctAnswerComment.innerHTML = "% The chemical symbol for hydrogen is H";
    	}
}); 
// 

var factBox = document.getElementById("fact");
factBox.addEventListener('keyup', function(){
	    //do some stuff
	    //alert("hello");
    	var correctAnswerComment = document.getElementById("correctAnswerFact");
    	let answer = factBox.value;
    	let originalAnswer = "symbolFor(hydrogen, H)";
    	if(answer.toLowerCase() == originalAnswer.toLowerCase()){
    		factBox.className = 'form-control-fact-correct';
    		correctAnswerComment.innerHTML = "";
    	}
    	else {
    		factBox.className = 'form-control-fact-incorrect';
    		correctAnswerComment.innerHTML = "symbolFor(hydrogen, H)";
    	}
}); 


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
});

function changeImageRandomly(){
	let randomNumber = getRandomInt(17);
	console.log(randomNumber);
	/*while(randomNumber>0 && randumNumber<=18){
		randomNumber = Math.random()*18;
	}*/
	document.getElementById("randomImageDisplay").src = "../images/lesson5/elements/"+randomNumber+".png";
	//alert(imagePath);
}

function getRandomInt(max) {
	  return Math.floor(Math.random() * max);
}
