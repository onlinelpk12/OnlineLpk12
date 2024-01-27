const pdffile = document.querySelector('#pdfFile');
    pdffile.addEventListener('change', (e) => {
      // Get the selected file
      const [file] = e.target.files;
      // Get the file name and size
      const { name: fileName, size } = file;
      // Convert size in bytes to kilo bytes
      const fileSize = (size / 1000).toFixed(2);
      // Set the text content
      const fileNameAndSize = `${fileName} - ${fileSize}KB`;
      document.querySelector('.pdffile-name').textContent = fileNameAndSize;
    });    
    
    
    const excelfile = document.querySelector('#excelFile');
    excelfile.addEventListener('change', (e) => {
      // Get the selected file
      const [file] = e.target.files;
      // Get the file name and size
      const { name: fileName, size } = file;
      // Convert size in bytes to kilo bytes
      const fileSize = (size / 1000).toFixed(2);
      // Set the text content
      const fileNameAndSize = `${fileName} - ${fileSize}KB`;
      document.querySelector('.excelfile-name').textContent = fileNameAndSize;
    });    
    
    
    const toBase64 = file => new Promise((resolve, reject) => {
				    const reader = new FileReader();
				    reader.readAsDataURL(file);
				    reader.onload = () => resolve(reader.result);
				    reader.onerror = reject;
					});

    
    async function submitPDF() {
            document.querySelector('.uploadPdf').textContent = "Uploading Content....Please wait.....";
            var form = document.getElementById("uploadForm");
            const fileInput = document.getElementById('pdfFile');
            const selectedFile = fileInput.files[0];
            const fileName = fileInput.files[0].name.split("_");
            
		    try {
		      const result = await toBase64(selectedFile);
		      console.log(result)
		      fetch("https://localhost:7155/api/Lesson/uploadLesson", {
                method: 'POST',
                body: JSON.stringify({
		            "courseName":fileName[0],
		            "lessonName":fileName[1].split(".")[0],
		            "pdf": result.split('base64,')[1]}),
		        headers:{
	          			'Content-Type':'application/json; charset=UTF-8',
	          			'Authorization': "Bearer "+ sessionStorage.getItem("token")
	        			},
	            })
            .then(response => response.json())
            .then(data => {
                document.querySelector('.uploadPdf').textContent = "Content Upload successfull";
                // Handle the response from the server as needed
                alert(data.message); // Show a message or redirect to another page

            })
            .catch(error => {
                console.error("Error during fetch:", error);
            });
		      
		   	} catch(error) {
		      console.error(error);
		      
		   	};
			//return 0;
            
        }
	
        
        function submitExcel() {
        	const fileInput = document.getElementById('excelFile');
            const selectedFile = fileInput.files[0];
            var reader = new FileReader();

        	document.querySelector('.uploadExcel').textContent = "Uploading Content....Please wait.....";
            
            reader.onload = function(e) {
	            
				
                var data = new Uint8Array(e.target.result);
                var workbook = XLSX.read(data, { type: 'array' });
                var sheetName = workbook.SheetNames[0];
                var worksheet = workbook.Sheets[sheetName];
                var jsonData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });
                
            
                for (var i = 1; i < jsonData.length; i++) {
                	
                    var course_name = jsonData[i][0] || '';
                    if( course_name=="")
                	{
                		break;
                	}
                   
                    var lesson_name = jsonData[i][1] || '';
                    var page_num = jsonData[i][2] || '';
                    var header = jsonData[i][3] || '';
                    var data = jsonData[i][4] || '';
                    var questions = jsonData[i][5] || '';
                    var answers = jsonData[i][6] || '';
                    
                    var data = JSON.stringify({
                        "courseName":course_name,
                        "lessonName":lesson_name,
                        "pageNum":page_num,
                        "header":header,
                        "data":data,
                        "questions":questions,
                        "answers":answers
                    });
                   
                const uploadAssessmentAPI = "https://localhost:7155/api/Lesson/uploadAssessmentDetails";
                fetch(uploadAssessmentAPI,{
                  method:'POST',
                  body: data,
                  headers:{
  		            "Content-Type":"application/json",
  		            'Authorization': "Bearer "+ sessionStorage.getItem("token")
  		        }
                }).then(response => response.json())
                .then(data => {
                    document.querySelector('.uploadExcel').textContent = "Content Upload successfull";
                    // Handle the response from the server as needed
                    alert(data.message); // Show a message or redirect to another page

                })
                .catch(error => {
                    console.error("Error during fetch:", error);
                });

               
            }
           
         }
            reader.readAsArrayBuffer(selectedFile);
        }

     