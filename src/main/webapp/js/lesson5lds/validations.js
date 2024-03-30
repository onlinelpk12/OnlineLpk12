//best name validatin
function validateBestName() {
	var best_name = document.bestPerformer.children;
	var a = best_name[0].children[0];
	var b = best_name[0].children[1];
	if (a.value.toLowerCase() == "sam") {
		a.classList.remove("is-invalid");
		a.classList.add("is-valid");
		b.classList.remove("invalid-feedback");
		b.classList.add("valid-feedback");
		b.innerText = 'Yes! Your answer is correct';
	} else {
		a.classList.remove("is-valid");
		a.classList.add("is-invalid");
		b.classList.remove("valid-feedback");
		b.classList.add("invalid-feedback");
		b.innerText = 'No! The correct answer is Sam';
	}
}

/*Worst Name Validator*/
function validateWorstName() {
	var best_name = document.worstPerformer.children;
	var a = best_name[0].children[0];
	var b = best_name[0].children[1];
	if (a.value.toLowerCase() == "kate") {
		a.classList.remove("is-invalid");
		a.classList.add("is-valid");
		b.classList.remove("invalid-feedback");
		b.classList.add("valid-feedback");
		b.innerText = 'Yes! Your answer is correct';
	} else {
		a.classList.remove("is-valid");
		a.classList.add("is-invalid");
		b.classList.remove("valid-feedback");
		b.classList.add("invalid-feedback");
		b.innerText = 'No! The correct answer is Kate';
	}
}
/*var worst_name = document.worstPerformer.worstName.parentNode.children
var worst_name_text = document.getElementById("worstNameText");
function validateWorst(){
	worst_name_text.innerHTML = '';
	if(worst_name[0].value.toLowerCase() == "kate"){
		worst_name[0].parentNode.classList.remove("has-error","has-feedback")	
		worst_name[0].parentNode.classList.add("has-success","has-feedback")
		worst_name[1].classList.remove("glyphicon-remove")	
		worst_name[1].classList.add("glyphicon-ok")	
		var text = document.createTextNode("Yes, you are correct.")
		worst_name_text.appendChild(text);
	}else{
		worst_name[0].parentNode.classList.remove("has-success","has-feedback")	
		worst_name[0].parentNode.classList.add("has-error","has-feedback")		
		worst_name[1].classList.remove("glyphicon-ok")	
		worst_name[1].classList.add("glyphicon-remove")
		var text = document.createTextNode("No, correct answer is Kate.")
		worst_name_text.appendChild(text);
	}
}*/