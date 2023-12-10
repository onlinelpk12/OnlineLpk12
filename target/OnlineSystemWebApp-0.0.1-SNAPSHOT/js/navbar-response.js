//let ajaxurl = 'ajax.php';

/* Fluents for navigation of file system 
   They are changed by easyTree.js, and used by other js 
*/
let sthSelected=false; // true if some item is selected
let selectedItem=""; // it can be a full path file name or 
		     // folder name or "" - nothing selected
let selectedItemType = ""; // the type of the selected item
			   // is either folder or file or 
			   // "" - nothing selected

let currentFolder=""; // the most recently selected folder
let currentFile="";  // the most recently selected file
const corsProxy = "https://onlinelpk12-corsproxy.herokuapp.com/";

/*
    refreshDirectory() : empties the directory, refills with
        accessible directory for session username
*/
var refreshDirectory = function() {
	let userid = getUserId();
	const getAllFilesForldersAPI = corsProxy+"https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/getallfoldersfiles";
    //var data = {'action': "getAccessibleDirectory"};
	//US-13
	$.ajax({
	        type: 'GET',
	        url: getAllFilesForldersAPI,
	        jsonpCallback: 'jsonCallback',
	        dataType: 'json',
	        data : "userId="+userid+"",
	        jsonp: false,
	        success: function (response) {
	         console.log(response.content);
	         $('#directory').empty();
	         $('#directory').append("<ul>" + response.content + "</ul>");
	         $('.easy-tree').EasyTree({
	             selectable: true,
	             deletable: true,
	             editable: true
	         });
	        },
	        error: function (e) {
	            $("#divResult").html("WebSerivce unreachable");
	        }
    	});
};

/*
    setCurrentFolderiNew(foldername) : 
        sets currentFolder value and the PHP Session variable
        to the folder folderName and then updates current folder
        on front-end
*/
function setRootAsDefaultFolder(){
	let currentFolderValue = getCurrentFolder();
	if(currentFolderValue =="" || currentFolderValue==null){
		setCurrentFolder(getCurrentUsername()+"/");
	} else if(currentFolderValue != ""){
		setCurrentFolder(currentFolderValue);
	}	
};

var setCurrentFolderNew = function(folderName) {
    if (sthSelected) {
       currentFolder = folderName;
       sessionStorage.setItem("currentFolder",currentFolder);

       $('#span_currentfolderid').empty();
       $('#span_currentfolderid').append(currentFolder);
       $('#span_currentfolderid').data("value", currentFolder);
    }
};

/*
    setCurrentFileNew(fileName) : 
	sets currentFIle and the PHP Session variable
        to the file fileName and then updates current folder on
        back-end
*/
var setCurrentFileNew = function(fileName) {
    if (sthSelected) {
      currentFile = fileName; // same as fileName 
      sessionStorage.setItem("currentFile",currentFile);
	  $('#span_currentfileid').empty();
	
	  if (!currentFile) {
		  $('#span_currentfileid').append("");
		  $('#span_currentfileid').data("value", "");
	  }
	  else {
		  $('#span_currentfileid').append(currentFile);
	      $('#span_currentfileid').data("value", currentFile);
	  }  
    }
};


/*
    setCurrentFolder(foldername) : sets the PHP Session variable
        to the folder folderName and then updates current folder
        on front-end
*/
var setCurrentFolder = function(folderName) {
    sessionStorage.setItem("currentFolder",folderName);
    
    let folderurl = getCurrentFolder();
    $('#span_currentfolderid').empty();
    $('#span_currentfolderid').append(folderurl);
    $('#span_currentfolderid').data("value", folderurl); 
};

var getCurrentFolder = function(){
	return sessionStorage.getItem("currentFolder");
}

var getUserId = function(){
	return sessionStorage.getItem("userId");
}
/*
    deleteFileOrFolder(name) :
        nothing needs to be done if name is home folder  
	sthSelected becomes .
	if a folder is deleted, the currentFolder becomes "" 
	if a file is deleted, both currentFolder and currentFile become "" 

	set the PHP session to delete file/folder with "name"
    this is invoked from the confirmation button click inside deletable option
    in easyTree.js. 
*/

var deleteFileOrFolder = function(name) {
	let userid = getUserId();
    //precondition: either a file or folder have to be selected. 	
    
    let userName = getCurrentUsername();
    let homeFolder = userName + "/";
    if (name == homeFolder){
	// home folder cannot be deleted, we do nothing.
        return; 
    }
	
    // update front end info about current folder / file and vars of currentFolder/File
    if (sthSelected) {
    	let currentFileiInCurrentFolder = (currentFile.indexOf(currentFolder) == 0);
    	if (selectedItemType == "folder"){
    		setCurrentFolderNew("");
    		
    		//Stroy 24
    		let index =  name.lastIndexOf("/");
    		let ApiFolderNameParam = name.substring(index+1);
    		let ApiParentURIParam = name.substring(0,index);
    		let data = {
				   		'userId': userid,
				   		'folderName':ApiFolderNameParam,
				   		'parentUrl': ApiParentURIParam
    			    	};
    		
    		//const folderDeletionAPI = "https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/deletefolder"+decodeURIComponent($.param(data,encodeData=false));
    		const folderDeletionAPI = corsProxy+"https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/deletefolder";
    		
    		postSparcData(folderDeletionAPI, data).then(resp =>{
    			console.log('response from post method: ', resp);
    			if (resp.errors.length==0) {
    				console.log(resp.content);
                }
    		})
    		.catch(x => console.log(x));
    		
    	}
        if ((selectedItemType == "file") || currentFileiInCurrentFolder) {
        	setCurrentFileNew("");
        	// clear the editor content
        	let editor = ace.edit("editor");
        	editor.setValue("", -1);
        	
        	let index =  name.lastIndexOf("/");
        	let ApiFileNameParam = name.substring(index+1);
    		let ApiFolderNameParam = name.substring(0,index);
        	let data = {
			   		'userId': userid,
			   		'fileName':ApiFileNameParam,
			   		'folderUrl': ApiFolderNameParam
			    	};
        	
        	const fileDeletionAPI = corsProxy+"https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/deletefile?"+decodeURIComponent($.param(data,encodeData=false));
        	postSparcData(fileDeletionAPI, data).then(resp =>{
    			console.log('response from post method: ', resp);
    			if (resp.errors.length==0) {
    				console.log(resp.content);
                }
    		})
    		.catch(x => console.log(x));        	
        }
    }
    // set selected data structure
    sthSelected = false;
    selectedItem = "";
    selectedItemType = "";
    //YL --curent set currentfile and currentfolder after deletion
}

/* 
    renameFile(newName):
	change the current file name to the newName
*/

var renameFile = function(newName) {
    // precondition: the newName must be a new name of currentFile 
    
    // let oldfileurl = currentFile;
    // let newfileurl = oldfileurl.substring(0, oldfileurl.lastIndexOf("/")+1) + newName;
    
    // if (oldfileurl == newfileurl) { //do nothing if the name is not changed
	// return; 
    // }
    // // rename file at back end 
    // let data = {
    //        'action': "renameFile",
    //        'oldfileurl': oldfileurl,
	//    'newfileurl': newfileurl
    // };

    // $.post(ajaxurl, data, function(response) {
    //         // setResultsToString(response);
    // });
  
    // // update the current file 
    // selectedItem = newfileurl; 
    // setCurrentFileNew(newfileurl); 
}

/*
    updateCurrentFolder() : updates folder and file ids on the front
        end to match the session variables

    returns : nothing
*/
var updateCurrentFolder = function() {
    /*var data = {'action': "getCurrentFolder"};
    $.post(ajaxurl, data, function(response) {
        var folderurl = response;
        $('#span_currentfolderid').empty();
        $('#span_currentfolderid').append(folderurl);
        $('#span_currentfolderid').data("value", folderurl);
    }); */
};

/*
    updateCurrentFile() : updates folder and file ids on the front
        end to match the session variables

    returns : nothing
*/
var updateCurrentFile = function() {
    let data = {'action': "getCurrentFile"};
    let fileurl = sessionStorage.getItem("currentFile");
    $('#span_currentfileid').empty();

    if (!fileurl) {
        //TODO do we want untitled
        $('#span_currentfileid').append("");
    $('#span_currentfileid').data("value", "");
    } else {
        $('#span_currentfileid').append(fileurl);
        $('#span_currentfileid').data("value", fileurl);
    }
};

/*
 updateSetting() : update the setting using the session variables
 called whenever the page is updated
 
 returns : nothing
 */
var updateSetting = function() {
    // let data = {'action': "getSetting"};
    // $.post(ajaxurl, data, function(response) {
    //        // get timeout
    //        let setting = JSON.parse(response);
    //        // $('#printSetting').append("timeout = " + setting.timeout + "#sets = " + setting.sets);
    //        // $('#printSetting').append(response);
    //        // $('#printSetting').show(); 

    //        // altert(setting);
    //        $('#setting_timeout').val(setting.timeout);
    //        if (setting.sets === "other"){
    //            $('#setting_sets_2').prop('checked',true);
    //        }
    //        else{
    //          if (setting.sets === "all"){
    //            $('#setting_sets_1').prop('checked',true);
    //          }
    //          else $('#setting_sets_0').prop('checked',true);
    //        }
    //    });
};



/*
    setCurrentFile(fileName) : sets the PHP Session variable
        to the file fileName and then updates current folder on
        back-end
*/
var setCurrentFile = function(fileName) {
   sessionStorage.setItem("currentFile",fileName);
   $('#span_currentfileid').empty();

   if (!fileName) {
	   $('#span_currentfileid').append("");
	   $('#span_currentfileid').data("value", "");
   } 
   else {
	   $('#span_currentfileid').append(fileName);
	   $('#span_currentfileid').data("value", fileName);
   } 
    
};

/*
    setEditorToFile(fileName) : sets the ACE editor text to the
        file fileName
*/
var setEditorToFile = function(fileName) {

	let userId = getUserId();
    setCurrentFileNew(fileName);
    if (!fileName) {
        fileName = "_templates/sparc.sp";
    }

    let folderurl = fileName.substring(0, fileName.lastIndexOf("/"));
    let fileNameParam = fileName.substring(fileName.lastIndexOf("/")+1);
    
    let data = {
    			 'userId': userId,
                 'fileName': fileNameParam,
                 'folderUrl':folderurl,
               };   
    
    const getFileAPI = corsProxy+"https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/getfile?"+($.param(data,encodeData=false));
    $.get(getFileAPI, data, function(response) {
    	console.log((response.content.program)?response.content.program:"empty program");
        let editor = ace.edit("editor");
        editor.setValue(response.content.program, -1);
    });
}

/*
    setEditorToCurrentFile() : sets ACE editor text to current file name
        in session

    returns : nothing
*/
var setEditorToCurrentFile = function() {
    // let data = {'action': "getCurrentFile"};

    // $.post(ajaxurl, data, function(response) {
    //     if (!response) {
    //         response = "";
    //     }
    //     setEditorToFile(response);
    // });
    // return;
}

var setEditorFontSize = function(font_size) {
    if (font_size < 0) {
        return;
    }

    if (font_size > 72) {
        return;
    }

    document.getElementById('editor').style.fontSize=''+font_size+'px';
}

var getCurrentUsername = function() {
    //var username = $("#login").html();
    let username = sessionStorage.getItem("username");
    if (!username || username === "Log-in") {
        return "";
    }
    return username;
}

var isResponseError = function(response) {
    let errorMessage = "Something went wrong";
    if (response.indexOf(errorMessage) == 0) {
        return true;
    }
    return false;
};

var setResultsToString = function(string) {
    $('#results').empty();
    let clearResults = '<center> <button onclick="clearResults()" > \
                        Clear the Results \
                    </button> </center>';
    $('#results').append(clearResults);
    $('#results').append(string);
};

var clearResults = function(){
    $("#results").empty();
}

var hideButtonsForLoggedInUsers = function() {
    $("#menu-toggle").hide();
    $("#btn_new").hide();
    $("#btn_save").hide();
    $("#navbar_btn_issues").hide();
    $("#navbar_btn_share").hide();
};

var showButtonsForLoggedInUsers = function () {
    $("#menu-toggle").show();
    $("#btn_new").show();
    $("#btn_save").show();
    $("#navbar_btn_issues").show();
    $("#navbar_btn_share").show();
};

var updateNavbar = function() {
    if (getCurrentUsername()) {
        showButtonsForLoggedInUsers();
    } else {
        hideButtonsForLoggedInUsers();
    }
};

var closeDirectory = function() {
  if ($("#wrapper").hasClass("toggled")){
     //$("#wrapper").toggleClass("toggled");
  }
  else{
    $("#wrapper").toggleClass("toggled");
  }
}

// YL 12-10 2015 for bug of non scrollable of the editor
function resizeAce(){
  // $('#editor').height($(window).height()-112);
  $('#editor').height($(window).height()-140);
  let editor = ace.edit("editor")
  //let program = editor.getValue();
  //let cursor = editor.getCursorPosition();
  editor.resize();
  // editor.setValue(program, cursor);
  return;
}
// end of YL

// When the DOM is ready
$(document).ready(function() {

    let editor = ace.edit("editor");
    editor.setTheme("ace/theme/textmate");
    editor.getSession().setMode("ace/mode/sparc");

    // YL 12-10 2015
    // listen window change
    $(window).resize(resizeAce);
    // ee initilization of editor in init.js
    // end of YL

    // clear the results area is clicked 
    /* The following two methods [for a button style (similar to navbar') in results area] it doesn't work 
    $('#btn_clearResults').click(function(e) {
        e.preventDefault();
	$('#results').empty();
    });
    
    $(document).on("click", "#bt_clearResults", function() {
        $('#results').empty();
    }); */


    // Get Query button handler
    $('#btn_getQuery').click(function(e) {
        e.preventDefault();
        let editorValue = editor.getValue();
        let queryValue = $('#txt_query').val();
	// RE - Fixed 3/9/20 10:44 ams
	queryValue = queryValue.replace(/\?/g, "");

        let data = {'action': "getQuery",
                    'query': queryValue,
                    'editor': editorValue};

        // Expected response : answer sets
        $.post(ajaxurl, data, function(response) {
            setResultsToString(response);
        });
    });

    // Get Answer Sets button handler
    // $('#btn_getAnswerSets').click(function(e) {
    //     let editorValue = editor.getValue();
    //     let data = {'action': "getAnswerSets",
    //                'editor': editorValue};
        
	// // $('#results').append("hello");

    //     // Expected response : answer sets in XML
    //     $.post(ajaxurl, data, function(response) {
    //         setResultsToString(response);
    //     });
    // });

	    // Animate button handler
    // $('#btn_getAnimation').click(function(e) {
    //     let editorValue = editor.getValue();
    //     let data = {'action': "getAnimation",
    //                 'editor': editorValue};

    //     // Expected response : answer sets in XML
    //     $.post(ajaxurl, data, function(response) {
    //         setResultsToString(response);
    //     });
    // });
	
    // New folder button
    $('#newFolder').click(function(e) {
        e.preventDefault();
        let parentURL = $("#span_currentfolderid").data("value");

		if (currentFolder == "") {
		   alert("Please select a folder from the directory panel.");
		   return;
		}	

        let folderName = prompt("Please enter folder name").toLowerCase();
        let userId = getUserId();
        parentURL = parentURL.slice(0,-1);
        data = {'userId': userId,
            	'folderName': folderName,
            	'parentUrl': parentURL
            	};
        const folderCreationAPI = corsProxy+"https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/createfolder";
        
        postSparcData(folderCreationAPI, data).then(resp =>{
			console.log('response from post method: ', resp);
			if (resp.errors.length==0) {
				console.log(resp.content);
                refreshDirectory();
                setCurrentFolderNew(currentFolder+folderName+"/");
                updateCurrentFolder();
            } else {
                setResultsToString(resp);
            }
		})
		.catch(x => console.log(x)); 
            
    });

    // New file button
    $('#newFile').click(function(e) {
    	let userId = getUserId();
        e.preventDefault();
        let fileName = prompt("Please enter file name").toLowerCase();
        // let editorValue = editor.getValue();
        let editorValue = ""; // we set the new file to be empty
        /*data = {'action': "addNewFile",
                'newfile': fileName,
                'editor': editorValue};*/
        let folderUrl = currentFolder.slice(0,-1);
        data = {
        		 'userId': userId,
                'fileName': fileName,
                'folderUrl': folderUrl
               };

        const fileCreationAPI = corsProxy+"https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/createfile";
        // Expected response : success message
        postSparcData(fileCreationAPI, data).then(resp =>{
			console.log('response from post method: ', resp);
			if (resp.errors.length==0) {
				refreshDirectory();
                setEditorToFile(currentFolder+fileName);
                updateCurrentFile();
            } else {
                setResultsToString(resp);
            }
		})
		.catch(x => console.log(x));
        
    });

    // Delete button -- we don't hvae delete  button of #btn_delete. We have a delete button in easyTree.js
    // $("#btn_delete").click(function(e) {
    //     e.preventDefault();
    //     // TODO configure this
    //     data = {'action': "deleteFolder",
    //             'folderurl': "christian/deletefolder/"};

    //     $.post(ajaxurl, data, function(response) {
    //         setResultsToString(response);
    //         //$('#results').append(response + "</br>");
    //     });
    // });

    // Share button
    // $("#btn_share").click(function(e) {
    //     e.preventDefault();
    //     let currentFile = $("#span_currentfileid").html();
    //     let otherUser = $("#share_username").val();
    //     data = {'action': "shareFile",
    //             'fileurl': currentFile,
    //             'username2': otherUser,
    //             'permissions': "1"};

    //     $.post(ajaxurl, data, function(response) {

    //         if (response === "1") {
    //             //alert("Share successful!");
    //             $('#shareModal').modal("hide");
    //         } else {
    //             //alert("Error sharing file");
    //             $('#shareModal').modal("hide");
    //         }

    //     });
    // });

// Setting  button XY
//     $("#btn_changesetting").click(function(e) {

//         e.preventDefault();
//         let timeout = $("#setting_timeout").val();
//         let sets = $("input:radio[name=setting_sets]:checked").val();
//         let otherNumSets = $("#setting_numSets").val();
                  
//           $("#changeSetting_fail").empty();
//           $("#changeSetting_fail").hide();
                                  
//           if($.isNumeric(timeout)){
//               if(parseInt(timeout)>50){
//                 $("#changeSetting_fail").append("Error: your timeout is greater than the limit of 50s.");
//                 $("#changeSetting_fail").show();
//               }
//               else {
//                   data = {'action': "changeSetting",
//                   'timeout': timeout,
//                   'sets': sets,
// 		  'otherNumSets': otherNumSets};
//                   //    $('#settingModal').modal("hide");
//                   $.post(ajaxurl, data, function(response) {
//                          //   alert(response);
//                          //   $('#setting_timeout').val(50);
//                          //   $('#setting_sets_0').prop('checked',true)
                         
//                          // $("#changeSetting_fail").append("repsonse=",response);
//                          // $("#changeSetting_fail").show();
//                          if (response === "1") {
//                          //alert("setting change successful!");
//                          $('#settingModal').modal("hide");
//                          } else {
//                          //alert("Error sharing file");
//                          //$("changeSetting_fail").show();
//                          }
//                 });

//               }
//            }
//            else{
//                  $("#changeSetting_fail").append("Error: your timeout is not a number.");
//                  $("#changeSetting_fail").show();
//            }
//     });
//   $("#btn_cancelsetting").click(function(e) {
//     e.preventDefault();
//     $('#settingModal').modal("hide");
//     });

    //End of Setting XY

    // Issues button
    // $("#navbar_btn_issues").click(function(e) {
    //     let issue = prompt("What is your issue? Please give details as to what you did before you received an error.");
    //     let data = {'action': "addIssue",
    //                 'issue': issue};

    //     $.post(ajaxurl, data, function(response) {
    //         alert("Thank you for your contribution.");
    //     });
    // });

    // Save button
    $("#btn_save").click(function(e) {
    	let userId = getUserId();
        // TODO check if currentuser is null then show log-in button
    	let editorValue = editor.getValue();
    	console.log("this is editor.getValue() :"+editorValue);
        updateCurrentFile();
        let currentFile = $("#span_currentfileid").data("value");

        updateCurrentFolder();
        let currentFolder = $("#span_currentfolderid").data("value");

        // save an untitled file
        let newFile = false; 
        if (!currentFile || currentFile == "") {
            currentFile = prompt("Please enter a file name");
	    if (currentFile === null) {// user canceled the input box. 
		alert("Nothing is saved since you didn't input a file name.");
		return;
	    } 
	    newFile = true; 
            currentFile = currentFolder.trim() + currentFile.trim();
        }
        let index =  currentFile.lastIndexOf("/");
        let currentFileName = currentFile.substring(index+1);
        let folderUrl = currentFolder.slice(0,-1);

        data = {
        		'userId': userId,
                'fileName': currentFileName,
                'folderUrl': folderUrl,
                'program' : editorValue 
               };
        
        console.log("data : ",data);
        const saveFileAPI = corsProxy+"https://onlinelpk12api.herokuapp.com/api/SparcFileSystem/savefile";
        postSparcData(saveFileAPI, data).then(resp =>{
			console.log('response from post method: ', resp);
			if (resp.errors.length==0) {
                	setCurrentFile(currentFile);
                	updateCurrentFile();
					if (newFile){ 
		   				refreshDirectory();
					}
            	}
		})
		.catch(x => console.log(x));
        
        alert("The program saved successfully to file "+currentFileName);
    });

    $(document).on("click", ".dir-item", function() {
        let fileurl = $(this).data("value");
        setEditorToFile(fileurl);

        let folderurl = fileurl.substring(0, fileurl.lastIndexOf("/")+1);
        setCurrentFile(fileurl);
        setCurrentFolder(folderurl);
        setCurrentFile(fileurl);
        updateCurrentFolder();
        updateCurrentFile();
    });

    /* when an item is CLICKED (which may select or unselect the item from the file system */
    $(document).on("click", ".dir-item-text", function(e) {
        let isFolder = $(this).parent().parent().hasClass('dir-folder');
        let fileurl = $(this).parent().parent().data("value");
        if(isFolder){
            fileurl=fileurl+"/";        	
        }

        // if the selected file/folder is clicked, sthSelected will be toggled
	// otherwise sth is selectged 
        let sameSelectionAsBefore = (fileurl == selectedItem); 
	
	if (sthSelected && sameSelectionAsBefore){
		sthSelected = false;
	   	selectedItem = "";
	   	selectedItemType = "";
        }
	else {
	   sthSelected = true;
	   selectedItem = fileurl;
 	}

	if (!sthSelected) return; 

	/* if sthSelected do the following */ 

	if (!isFolder){
	  selectedItemType = "file"; 

          setEditorToFile(fileurl); // change the content of the editor to currentfile

          let folderurl = fileurl.substring(0, fileurl.lastIndexOf("/")+1);
	  
          setCurrentFolderNew(folderurl);
          setCurrentFileNew(fileurl);
	}
	else{
	  selectedItemType = "folder"; 
	  setCurrentFolderNew(fileurl);
	}

        e.stopPropagation();
    });

    $(document).on("change", "#select_fontsize", function() {
        let font_size = $(this).val();
        setEditorFontSize(font_size);
    });
    
    var setEditorFontSize = function(font_size) {
        if (font_size < 0) {
            return;
        }

        if (font_size > 72) {
            return;
        }

        document.getElementById('editor').style.fontSize=''+font_size+'px';
    }
});

function postSparcData(url, data){
    return new Promise(function (resolve, reject) {
        $.ajax({
          type:'POST',
          url:url,
          data:JSON.stringify(data),
          contentType: "application/json; charset=utf-8",
          success: function (response) {
            resolve(response);
          },
          error: function (error) {
            reject(error);
          },
        });
    });
}