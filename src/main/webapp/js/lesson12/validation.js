/**
 * 
 */
const elementSelected = false;
const elementName = "";
const elementSymbol = "";

var yunBox = document.getElementById("iBox");
console.log(yunBox)
yunBox.addEventListener('keydown', function(e) {
	if (e.key === "Enter") {
		var correctAnswerComment = document.getElementById("uAnswer");
		let answer = yunBox.value;
		let originalAnswer = "% John is a parent of Peter";
		if (answer.toLowerCase() == originalAnswer.toLowerCase()) {
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
factBox.addEventListener('keydown', function(e) {
	if (e.key === "Enter") {
		var correctAnswerComment = document.getElementById("exAnswer");
		let answer = factBox.value;
		let originalAnswer = "parent(john, peter)";
		if (answer.toLowerCase() == originalAnswer.toLowerCase()) {
			factBox.className = 'form-control-exBox-correct';
			correctAnswerComment.innerHTML = "";
		}
		else {
			factBox.className = 'form-control-exBox-incorrect';
			correctAnswerComment.innerHTML = originalAnswer;
		}
	}

});


var funBox = document.getElementById("fBox");
console.log(funBox)
funBox.addEventListener('keydown', function(e) {
	if (e.key === "Enter") {
		var correctAnswerComment = document.getElementById("cAnswer");
		let answer = funBox.value;
		let originalAnswer = "mom(joaan, peter)";
		if (answer.toLowerCase() == originalAnswer.toLowerCase()) {
			funBox.className = 'form-control-sBox-correct';
			correctAnswerComment.innerHTML = "";
		}
		else {
			funBox.className = 'form-control-sBox-incorrect';
			correctAnswerComment.innerHTML = originalAnswer;
		}
	}

});

var zunBox = document.getElementById("yBox");
console.log(zunBox)
zunBox.addEventListener('keydown', function(e) {
	if (e.key === "Enter") {
		var correctAnswerComment = document.getElementById("zAnswer");
		let answer = zunBox.value;
		let originalAnswer = "dad(john,peter)";
		if (answer == originalAnswer) {
			zunBox.className = 'form-control-tBox-correct';
			correctAnswerComment.innerHTML = "";
		}
		else {
			zunBox.className = 'form-control-tBox-incorrect';
			correctAnswerComment.innerHTML = originalAnswer;
		}
	}

});

