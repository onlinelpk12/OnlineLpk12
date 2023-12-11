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
	%write your comment here
	%write the fact here
	%mother(joaan, peter).`     
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
	%write your comment here
	%write the fact here
	%parent(john, peter).`
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
	%write your comment here
	%write the fact here
	%dad(john, peter).` 
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
	%write your comment here
	%write the fact here
	%father(bob, sara).`
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
    %write your comment here
	%write the fact here
	%mother(joaan, peter).`;
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
    %write your comment here
	%write the fact here
	%father(john, peter).`;
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
   	%write your comment here
	%write the fact here
	%father(john, peter).`;
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
    %write your comment here
	%write the fact here
	%dad(john, peter).`;
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
	%write your comment here
	%write the fact here
	%parent(john, peter).`;
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
	%write your comment here
	%write the fact here
	%dad(john, peter).`;
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
	%write your comment here
	%write the fact here
	%mom(jooan, peter).`;
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
	%write your comment here
	%write the fact here
	%parent(john, peter).`;
    }
}
else if(lessonNumber == 5)
{
    if(id == 0)
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
	%please write your comment here
	%please write the fact here
	%symbolFor(helium, he).`;
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
	%please write your comment here
	%please write the fact here
	%symbolFor(hydrogen, h).`;
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
	%please write your comment here
	%please write the fact here
	%symbolFor(carbon, c).`;
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
	%please write your comment here
	%please write the fact here
	%symbolFor(phosphorus, p).`;
    }
    else if(id == 4)
    {
	let elementName = sessionStorage.getItem("elementName").toLowerCase();
	let symbolSelected = sessionStorage.getItem("elementSymbol").toLowerCase();
    	return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {`+elementName+`, `+symbolSelected+`}.
predicates
	symbolFor(#element, #element).
rules
	%please write your comment here
	%please write the fact here
	%symbolFor(`+elementName+`, `+symbolSelected+`).`;
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
	%please write your comment here
	%please write the fact here
	%atomicNumber(carbon, 6).`;
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
	%please write your comment here
	%please write the fact here
	%atomicNumber(hydrogen, 1).`;
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
	%please write your comment here
	%please write the fact here
	%atomicNumber(oxygen, 8).`;
	}
	else if(id == 3){
		let elementName = sessionStorage.getItem("elementName").toLowerCase();
    	let atomicNumberOfSymbol = sessionStorage.getItem("elementSymbol");
		return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
	#element = {`+elementName+`, `+atomicNumberOfSymbol+`}.
predicates
	atomicNumber(#element, #element).
rules
	%please write your comment here
	%please write the fact here
	%atomicNumber(`+elementName+`, `+atomicNumberOfSymbol+`).`;
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
	%please write your comment here
	%please write the fact here
	%atomicNumber(H, 1).`;
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
	protonNumber(#element, #element).
rules
	%please write your comment here
	%please write the fact here
	%protonNumber(hydrogen, 1).`;
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
   atomicNumber(#element, #element).
   protonOf(#element, #element).
rules
    %please write your comment here
	%please write the fact here
	protonOf(h,1) :-
        atomicNumber(h,1).

   atomicNumber(h,1).
   
   %query:protonOf(h,1)
   %query:atomicNumber(h,1).`;
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
   atomicNumber(#element, #element).
   protonOf(#element, #element).
rules
	%please write your comment here
	%please write the fact here
    atomicNumber(h,1) :-
        protonOf(h,1).

   protonOf(h,1).
   
   %query : protonOf(h,1). or atomicNumber(h,1)`;
		}
		else if(id == 4){
			let elementProtonNumber = sessionStorage.getItem("elementProtonNumber");
	    	let symbolSelected = sessionStorage.getItem("elementSymbol").toLowerCase();
			return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author:
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
    #element = {`+symbolSelected+`, `+elementProtonNumber+`}.
predicates
   atomicNumber(#element, #element).
   protonOf(#element, #element).
rules
	%please write your comment here
	%please write the fact here
    protonOf(`+symbolSelected+`, `+elementProtonNumber+`) :-
        atomicNumber(`+symbolSelected+`, `+elementProtonNumber+`).

   atomicNumber(`+symbolSelected+`, `+elementProtonNumber+`).
   
    atomicNumber(`+symbolSelected+`, `+elementProtonNumber+`) :-
        protonOf(`+symbolSelected+`, `+elementProtonNumber+`).

   protonOf(`+symbolSelected+`, `+elementProtonNumber+`).
   
   %query : atomicNumber(`+symbolSelected+`, `+elementProtonNumber+`)`;
		}
	}
else if(lessonNumber == 8){
	if(id == 0)
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
   	%please write your comment here
	%please write the fact here
	%massNumber(hydrogen, 1).`;
   }

	else if(id == 1)
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
   	%please write your comment here
	%please write the fact here
	%massNumber(carbon, 12).`;
   }

else if(id == 2)
   {
       return  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author:
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #element = {hydrogen, 1, 2}.
predicates
   massNumberOf(#element, #element).
   protonsOf(#element, #element).
   neutronOf(#element, #element).
rules
   %please write your comment here
   %please write the fact here
   neutronOf(E, N) :-
        massNumberOf(E, M),
        protonsOf(E, P),
        N = M - P.

  massNumberOf(hydrogen, 2).
  protonsOf(hydrogen, 1).
   
%query : neutronOf(hydrogen,  N)`;
   }

else if(id == 3)
   {
       return  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author:
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts
   #element = {hydrogen, 1, 2}.
predicates
   massNumberOf(#element, #element).
   protonsOf(#element, #element).
   neutronOf(#element, #element).
rules
   %please write your comment here
   %please write the fact here
   massNumberOf(E, M) :- 
        neutronOf(E, N),
        protonsOf(E, P),
        M = N + P.

   neutronOf(hydrogen,1).
   protonsOf(hydrogen,1).
   
%query : massNumberOf(hydrogen,  M)`;
   }
}
    return null;
};




//for sparc workbook activity questions :
function getActivityInformation(currentLessonNumber, currentLearningOutcomeNumber) {
	if (currentLessonNumber == 2) {
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Model for the relation of mother';
			question = "Assume we use mother(X, Y) to denote the mother of X is Y. Build a model for the relation of mom"
			hint="Use the relation mother(X,Y)";
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Family Model for Parent of Peter';
			question = "Extend your Model for Parent of Peter"
			hint="Use the relation parent(X, Y) where X is Parent of Y";
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extending the model for Dad relation ";
			question = "Extend your Model for dad of peter";
			hint="Use the relation dad(X, Y) where X is dad of Y";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extend Family Model for mother relation";
			question = "Extend your Model for the relation of mother";
			hint="Use the relation mother(X,Y) where X is mother of Y"
		}
	}
	else if (currentLessonNumber == 3) {
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Model for the relation of mother';
			question = "Assume we use mother(X, Y) to denote the mother of X is Y. Build a model for the 'who is the mother of Peter?"
			hint="Use the relation mother(X,Y)";
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extending the model for Father relation';
			question = "Extent your model for 'who is the father of Peter?'"
			hint="Use the relation father(X, Y) where X is father of Y";
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extending the model for father relation ";
			question = "Extend your Model for 'Whom is John the father of?'";
			hint="Use the relation father(X, Y) where X is father of Y";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extending the model for Dad relation";
			question = "Extend your Model for 'Who is the Dad of Peter?'";
			hint="Use the relation dad(X, Y) where X is dad of Y";
		}
	}
	else if (currentLessonNumber == 4) {
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Model for the relation of Parent';
			question = "Assume we use parent(X, Y) to denote the parent of X is Y. Build a model for <b>'parent'</b> rule.";
			hint="Use the relation parent(X, Y)";
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend the Model for parent relation';
			question = "Extend your model for dad rule";
			hint="Use the relation dad(X, Y) where X is dad of Y";
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extending the model for dad relation";
			question = "Extend your Model for mom rule";
			hint="Use the relation mom(X, Y) where X is mom of Y";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extending the model for father relation ";
			question = "Extend your Model for parent rule ";
			hint="Use the relation parent(X, Y) where X is Parent of Y";
		}
	}
	else if (currentLessonNumber == 5) {
		let elementName = sessionStorage.getItem("elementName");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Extend and Test Model as You Like';
			question = "Extend model: add knowledge to model about element(s) of your choice. The element has to be one of the first 20 in the periodic table.";
			hint="Use the relation symbolFor(X,Y)";
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Periodic Table Model - hydrogen';
			question = "Add to the model the knowledge: The chemical symbol for hydrogen is H.";
			hint="Use the relation symbolFor(E, X), where X is the Symbol Of Element E";
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extend and Test Model -- Carbon";
			question = "Extend model: add the knowledge about symbol for Carbon to the model";
			hint="Use the relation symbolFor(E, X), where X is the Symbol Of Element E";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extend and Test Model -- Phosphorus";
			question = "Extend model: add the knowledge about symbol for Phosphorus to the model";
			hint="Use the relation symbolFor(E, X), where X is the Symbol Of Element E";
		}
		else if (currentLearningOutcomeNumber == 4) {
			title = "Activity : Extend and Test Model as You Like";
			question = "Extend model: add the knowledge about symbol <b>" + elementName + "</b> to the model";
			hint="Use the relation symbolFor(E, X), where X is the Symbol Of Element E";
		}
	}
	else if (currentLessonNumber == 6) {
		let elementName = sessionStorage.getItem("elementName");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Extend Periodic Table Model -- Atomic Numbers';
			question = "Add to the model the knowledge needed to answer your question (on atomic number of carbon).";
			hint="Use the relation atomicNumber(E, N)";
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Periodic Table Model -- Atomic Numbers';
			question = "Expand model: Add to the model the knowledge needed to answer your question (on atomic number of hydrogen).";
			hint="Use the relation atomicNumber(E, N), where N is the atomic number of element E";
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extend Periodic Table Model -- Atomic Numbers";
			question = "Expand model: Add to the model the knowledge needed to answer your question (on atomic number of oxygen).";
			hint="Use the relation atomicNumber(E, N), where N is the atomic number of element E";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extend and Test Model as You Like";
			question = "Extend model: add the knowledge about atomic number of <b>" + elementName + "</b> to the model";
			hint="Use the relation atomicNumber(E, N), where N is the atomic number of element E";
		}

	}
	else if(currentLessonNumber == 7){
    	let symbolSelected = sessionStorage.getItem("elementSymbol");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Extend and Test Model as You Like';
			question = "Assume we use atomicNumber(X, Y) and protonsOf(X, Y) to denote the symbol for element X is Y. Build a model for the relationship between proton and atomic number of hydrogen";
			hint="Use the relation atomicNumber(X, Y)";
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = 'Activity : Extend Atomic Number of Model - hydrogen';
			question = "Expand model: Add to the model the knowledge needed to answer your question (on proton number of hydrogen).";
			hint="Use the relation protonNumber(E, P), where P is the proton number of element E";
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : Extend Relation between Proton and Atomic Number of Model - hydrogen";
			question = "Expand model: Add to the model the knowledge of the relation between protron and atomic number of hydorgen?";
			hint="Use the relations either protonOf(E,P) or atomicNumber(E,A)";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Extend and Test Model -- Hydrogen";
			question = "Extend model: add the knowledge describing the relation between atomic and proton number of element H?.";
			hint="Use the relations either protonOf(E,P) or atomicNumber(E,A)";
		}
		else if (currentLearningOutcomeNumber == 4) {
			title = "Activity : Extend and Test Model as You Like";
			question = "Extend model: add knowledge about the relation between atomic and proton number of the element <b>" + symbolSelected + "</b> to the model";
			hint="Use the relation atomicNumber(E, A) where A is atomic number of element E";
		}
	}
	else if (currentLessonNumber == 8) {
		let elementName = sessionStorage.getItem("elementName");
		if (currentLearningOutcomeNumber == 0) {
			title = 'Activity : Extend Periodic Table Model -- Mass Numbers';
			question = "Expand model: Add to the model the knowledge needed to answer your question (on Mass number of hydrogen).Write the query about the Mass Number of hydrogen?";
			hint="Use the relation massNumber(E, M)";
		}
		else if (currentLearningOutcomeNumber == 1) {
			title = "Atmoic Mass number for other element atoms";
			question = "Further extend your model about Atomic mass number of other elements.What is the atmoic mass number  of the carbon of element C?";
			hint="Use the relation massNumber(E, M), where M is mass number of element E";
		}
		else if (currentLearningOutcomeNumber == 2) {
			title = "Activity : From mass number and proton number to neutron number";
			question = "Extend Model.write the relation between neutrons, mass number and protrons  of the element N?";
			hint="Use the relation neutronOf(E,  N), where N is the number of neutrons for element E";
		}
		else if (currentLearningOutcomeNumber == 3) {
			title = "Activity : Mass numbers from protons and neutron";
			question = "Activity : Extend and test as you like.write the relation between mass number, proton number and atomic number of the element N?";
			hint="Use the relation massNumber(E, M), where M is mass number of element E";
		}
	}
	return { "title": title, "question": question, "hint": hint };
};