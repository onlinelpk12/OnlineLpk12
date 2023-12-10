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
elementSymbolMap.set(0,"16");
elementSymbolMap.set(1,"13");
elementSymbolMap.set(2,"18");
elementSymbolMap.set(3,"4");
elementSymbolMap.set(4,"5");
elementSymbolMap.set(5,"20");
elementSymbolMap.set(6,"6");
elementSymbolMap.set(7,"17");
elementSymbolMap.set(8,"9");
elementSymbolMap.set(9,"2");
elementSymbolMap.set(10,"3");
elementSymbolMap.set(11,"12");
elementSymbolMap.set(12,"10");
elementSymbolMap.set(13,"7");
elementSymbolMap.set(14,"8");
elementSymbolMap.set(15,"19");
elementSymbolMap.set(16,"14");
elementSymbolMap.set(17,"11");

const elementSelected = false;
const elementName = ""; 
const elementSymbol = "";



function changeImageRandomly(){
	let randomNumber = getRandomInt(17);
	console.log(randomNumber);
	document.getElementById("randomImageDisplay").src = "../images/lesson5/elements/"+randomNumber+".png";
	let selectedElement = elementMap.get(randomNumber);
	document.getElementById("chosenElement").innerHTML = "Extend model: add the knowledge about atomic number of <b>"+elementMap.get(randomNumber)+"</b> to the model";
	sessionStorage.setItem("elementSelected",true);
	sessionStorage.setItem("elementName",selectedElement);
	sessionStorage.setItem("elementSymbol",elementSymbolMap.get(randomNumber));
}

function getRandomInt(max) {
	  return Math.floor(Math.random() * max);
}
