	
	function getSparcProgram(id) {
       if(id=="0" || id=="3"){
       
       	return `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		%% Template for a SPARC file
		%% Author: 
		%% Description:
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		sorts
   		#people = {peter, joaan}.
		predicates
    	mother (#people, #people).
		rules
    	mother (joaan, peter).`     
       }
       
       else if(id=="1"){
       
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
       
       else if(id=="2"){
       
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