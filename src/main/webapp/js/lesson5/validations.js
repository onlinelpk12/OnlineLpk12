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
