	const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";
	function verifytoken(){

	if(sessionStorage.getItem("userRole")=="Student"){
		
        const studentAPI = corsProxy+"https://onlinelpk12nodeservice.herokuapp.com/api/test/student";		
	fetch(studentAPI,{

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
        const teacherAPI = corsProxy+"https://onlinelpk12nodeservice.herokuapp.com/api/test/teacher";
	fetch(teacherAPI,{

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
