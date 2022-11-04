let id = parseInt(sessionStorage.getItem("currentLearningOutcomeNumber"));
let lessonNumber = parseInt(sessionStorage.getItem("currentLessonNumber"));
getSparcProgram(id);
function getSparcProgram(id) {
    if(lessonNumber == 2)
    {   
	if(id == 0 || id == 3){       
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {peter, joaan}.
predicates
	mother(#people, #people).
rules
	mother(joaan, peter).`     
	}       
	else if(id == 1){       
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {peter, john}.
predicates
	parent(#people, #people).
rules
	parent(john, peter).`
	}
	else if(id == 2){       
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {peter, john}.
predicates
	dad(#people, #people).
rules
	dad(john, peter).` 
	}
	else{       
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {sara, bob}.
predicates
	father(#people, #people).
rules
	father(bob, sara).`
	}
}
else if(lessonNumber == 3)
{
    if(id == 0)
    {
        return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #people = {peter, joaan}.
predicates
   mother(#people, #people).
rules
   mother(joaan, peter).`;
    }
    else if(id == 1)
    {
        return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #people = {peter, john}.
predicates
   father(#people, #people).
rules
   father(john, peter).`;
    }
    else if(id == 2)
    {
        return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #people = {peter, john}.
predicates
   father(#people, #people).
rules
   father(john, peter).`;
    }
    else if(id == 3)
    {
        return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #people = {peter, john}.
predicates
   dad(#people, #people).
rules
    dad(john, peter).`;
    }
}
else if(lessonNumber == 4)
{
    if(id == 0)
    {
    	return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {peter, john}.
predicates
	parent(#people, #people).
rules
	parent(john, peter).`;
    }
    else if(id == 1)
    {
    	return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {peter, john}.
predicates
	dad(#people, #people).
rules
	dad(john, peter).`;
    }
    else if(id == 2)
    {
    	return  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {peter, jooan}.
predicates
	mom(#people, #people).
rules
	mom(jooan, peter).`;
    }
    else if(id == 3)
    {
return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#people = {peter, john}.
predicates
	parent(#people, #people).
rules
	parent(john, peter).`;
    }
}
else if(lessonNumber == 5)
{
    if(id == 0 || id == 4)
    {
    	return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {helium, he}.
predicates
	symbolFor(#element, #element).
rules
	%Please write your fact here`;
    }
    else if(id == 1)
    {
    	return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {hydrogen, h}.
predicates
	symbolFor(#element, #element).
rules
	%Please write your fact here`;
    }
    else if(id == 2)
    {
    	return  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {carbon, c}.
predicates
	symbolFor(#element, #element).
rules
	%Please write your fact here`;
    }
    else if(id == 3)
    {
    	return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {phosphorus, p}.
predicates
	symbolFor(#element, #element).
rules
	%Please write your fact here`;
    }
}
else if(lessonNumber == 6){
	if(id == 0){
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {carbon, 6}.
predicates
	atomicNumber(#element, #element).
rules
	atomicNumber(carbon, 6).`;
	}
	else if(id == 1){
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {hydrogen, 1}.
predicates
	atomicNumber(#element, #element).
rules
	atomicNumber(hydrogen, 1).`;
	}
	else if(id == 2){
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {oxygen, 8}.
predicates
	atomicNumber(#element, #element).
rules
	atomicNumber(oxygen, 8).`;
	}
	else if(id == 3){
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {helium, 2}.
predicates
	atomicNumber(#element, #element).
rules
	atomicNumber(helium, 2).`;
	}
}
else if(lessonNumber == 7){
		if(id == 0){
			return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% Template for a SPARC file
	%% Author: 
	%% Description:
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	sorts
		#element = {Hydrogen, 1}.
	predicates
		atomicNumber(#element, #prtonNumber).
	rules
		atomicNumber(H, 1).`;
		}
		else if(id == 1){
			return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% Template for a SPARC file
	%% Author: 
	%% Description:
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	sorts
		#element = {hydrogen, 1}.
	predicates
		PrtonNumber(#element, #element).
	rules
		protonNumber(hydrogen, 1).`;
		}
		else if(id == 2){
			return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% Template for a SPARC file
	%% Author: 
	%% Description:
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	sorts
	#element = {h, 1}.
predicates
	 protonNumber(#element, #element).
	 atomicNumber(#element, #element).
rules
	protonNumber(h, 1).
	atomicNumber(h,1).`;
		}
	else if(id == 3){
			return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% Template for a SPARC file
	%% Author: 
	%% Description:
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	sorts
	#element = {h, 1}.
predicates
	 protonNumber(#element, #element).
	 atomicNumber(#element, #element).
rules
	protonNumber(h, 1).
	atomicNumber(h,1).`;
		}
		else if(id == 4){
			return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% Template for a SPARC file
	%% Author: 
	%% Description:
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	sorts
		#element = {n, e}.
	predicates
		atomicNumber(#element, #element).
	rules
		atomicNumber(n, e).`;
		}
	}
else if(lessonNumber == 8){
	 if(id == 0 )
   {
       return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #element = {hydrogen, h}.
predicates
   symbolFor(#element, #element).
rules
   symbolFor(H, 1).`;
   }

	else if(id == 1)
   {
       return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #element = {hydrogen, 1}.
predicates
   massNumber(#element, #element).
rules
   massNumber(hydrogen, 1).`;
   }

	else if(id == 2)
   {
       return  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #element = {carbon, 12}.
predicates
   massNumber(#element, #element).
rules
   massNumber(carbon, 12).`;
   }

else if(id == 3)
   {
       return  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #element = {e,n}.
predicates
   massNumber(#element, #element).
   protonsOf(#element, #element).
   neutronsOf(#element, #element).
rules
  neutronsOf(e, n).`;
   }

else if(id == 4)
   {
       return  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #element = {e, p}.
predicates
   protonsOf(#element, #element).
rules
   protonsOf(e, p).`;
   }
}
    return null;
};




//for sparc workbook activity questions :
function getActivityInformation(currentLessonNumber, currentLearningOutcomeNumber) {
	if (currentLessonNumber == 5) {
		let elementName = sessionStorage.getItem("elementName");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Extend and Test Model as You Like';
			question = "Extend model: add knowledge to model about element(s) of your choice. The element has to be one of the first 20 in the periodic table."
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Periodic Table Model - hydrogen';
			question = "Add to the model the knowledge: The chemical symbol for hydrogen is H."
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extend and Test Model -- Carbon";
			question = "Extend model: add the knowledge about symbol for Carbon to the model";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extend and Test Model -- Phosphorus";
			question = "Extend model: add the knowledge about symbol for Phosphorus to the model";
		}
		else if (currentLearningOutcomeNumber == 4) {
			title = "Activity : Extend and Test Model as You Like";
			question = "Extend model: add the knowledge about symbol <b>" + elementName + "</b> to the model";
		}
	}
	else if (currentLessonNumber == 6) {
		let elementName = sessionStorage.getItem("elementName");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Extend Periodic Table Model -- Atomic Numbers';
			question = "Add to the model the knowledge needed to answer your question (on atomic number of carbon)."
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Periodic Table Model -- Atomic Numbers';
			question = "Expand model: Add to the model the knowledge needed to answer your question (on atomic number of hydrogen)."
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extend Periodic Table Model -- Atomic Numbers";
			question = "Expand model: Add to the model the knowledge needed to answer your question (on atomic number of oxygen).";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extend and Test Model as You Like";
			question = "Extend model: add the knowledge about symbol <b>" + elementName + "</b> to the model";
		}

	}
	else if(currentLessonNumber == 7){
    	let symbolSelected = sessionStorage.getItem("elementSymbol");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Extend and Test Model as You Like';
			question = "Assume we use atomicNumber(X, Y) and protonsOf(X, Y) to denote the symbol for element X is Y. Build a model for the relationship between proton and atomic number of hydrogen"
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Atomic Number of Model - hydrogen';
			question = "Expand model: Add to the model the knowledge needed to answer your question (on atomic number of hydrogen)."
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extend Relation between Proton and Atomic Number of Model - hydrogen";
			question = "Expand model: Add to the model the knowledge of the relation between protron and atomic number of hydorgen?";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extend and Test Model -- Hydrogen";
			question = "Extend model: add the knowledge describing the relation between atomic and proton number of element H?.";
		}
		else if (currentLearningOutcomeNumber == 4) {
			title = "Activity : Extend and Test Model as You Like";
			question = "Extend model: add knowledge about the relation between atomic and proton number of the element <b>" + symbolSelected + "</b> to the model";
		}
	}
	else if (currentLessonNumber == 8) {
		let elementName = sessionStorage.getItem("elementName");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : From mass number and proton number to neutron number ';
			question = "Assume we use MassNumber(X, Y) and protonsOf(X, Y) to denote the symbol for element X is Y. Build a model for the relationship between neutron,proton and mass number, proton and atomic number of Element E. write the relation rule between neutrons, protrons and mass number of an element N?"
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Periodic Table Model -- Mass Numbers';
			question = "Expand model: Add to the model the knowledge needed to answer your question (on Mass number of hydrogen).Write the query about the Mass Number of hydrogen?"
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Atmoic Mass number for other element atoms";
			question = "Further extend your model about Atomic mass number of other elements.What is the atmoic mass number  of the carbon of element C?";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : From mass number and proton number to neutron number";
			question = "Extend Model.write the relation between neutrons, mass number and protrons  of the element N?";
		}
		else if (currentLearningOutcomeNumber == 4) {
			title = "Activity : Mass numbers from protons and neutron";
			question = "Activity : Extend and test as you like.write the relation between mass number, proton number and atomic number of the element N?";
		}
	}
	return { "title": title, "question": question };
};