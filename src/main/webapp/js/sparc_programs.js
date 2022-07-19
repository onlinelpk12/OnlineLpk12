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
	symbolFor(helium, he).`;
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
	symbolFor(hydrogen, h).`;
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
	symbolFor(carbon, c).`;
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
	symbolFor(phosphorus, p).`;
    }
}

}
