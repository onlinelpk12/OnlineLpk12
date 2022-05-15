	
	function verifytoken(){
	fetch("https://onlinelpk12node.azurewebsites.net/api/test/student",{

				headers:{
				
				    'x-access-token':sessionStorage.getItem("token")
				
				}
				
				}).then(function(response){
					var resp=response.json();
					
				    if(response.status==200){
					resp.then((data)=>{		
							return data;	
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