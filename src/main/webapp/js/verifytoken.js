	
	function verifytoken(){

	if(sessionStorage.getItem("userRole")=="Student"){
	fetch("https://onlinelpk12nodeservice.azurewebsites.net/api/test/student",{

				headers:{
				
				    'x-access-token':sessionStorage.getItem("token")
				
				}
				
				}).then(function(response){
					var resp=response.json();
					console.log("hello verify")
				    if(response.status==200){
					resp.then((data)=>{		
						return true;	
					})
	
				    }
				
				    else{
				
				       resp.then((data)=>{
				    	if(data.message==false){
				    	sessionStorage.clear();
				    	location.href="../jsp/login.jsp";	
				    	}
				    
				       })
				}


    });
    }
    else if(sessionStorage.getItem("userRole")=="Teacher"){
	fetch("https://onlinelpk12nodeservice.azurewebsites.net/api/test/teacher",{

				headers:{
				
				    'x-access-token':sessionStorage.getItem("token")
				
				}
				
				}).then(function(response){
					var resp=response.json();
					
				    if(response.status==200){
					resp.then((data)=>{		
						return true;	
					})
	
				    }
				
				    else{
				
				       resp.then((data)=>{
				    	if(data.message==false){
				    	sessionStorage.clear();
				    	location.href="../jsp/login.jsp";	
				    	}
				    
				       })
				}


    });
    
}
else{
	sessionStorage.clear();
	location.href="../jsp/login.jsp";	
}
}
