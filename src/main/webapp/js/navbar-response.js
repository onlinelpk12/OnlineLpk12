var ajaxurl = 'ajax.php';

/* Fluents for navigation of file system 
   They are changed by easyTree.js, and used by other js 
*/
var sthSelected=false; // true if some item is selected
var selectedItem=""; // it can be a full path file name or 
		     // folder name or "" - nothing selected
var selectedItemType = ""; // the type of the selected item
			   // is either folder or file or 
			   // "" - nothing selected

var currentFolder=""; // the most recently selected folder
var currentFile="";  // the most recently selected file


/*
    refreshDirectory() : empties the directory, refills with
        accessible directory for session username
*/
var refreshDirectory = function() {
	let userid = sessionStorage.getItem("userId");
    //var data = {'action': "getAccessibleDirectory"};
	//US-13
	$.ajax({
	        type: 'GET',
	        url: 'https://onlinelpk12dotnetapi.azurewebsites.net/api/SparcFileSystem/getallfoldersfiles',
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
var setCurrentFolderNew = function(folderName) {
    if (sthSelected) {
       currentFolder = folderName;
       var data = {'action': "setCurrentFolder",
                   'currentfolder': folderName};
       $.post(ajaxurl, data, function(response) {}); 

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
      var data = {'action': "setCurrentFile",
                  'currentfile': fileName};
      $.post(ajaxurl, data, function(response) {
        $('#span_currentfileid').empty();

        if (!currentFile) {
            $('#span_currentfileid').append("");
            $('#span_currentfileid').data("value", "");
        } else {
            $('#span_currentfileid').append(currentFile);
            $('#span_currentfileid').data("value", currentFile);
        }
      });
    }
};


/*
    setCurrentFolder(foldername) : sets the PHP Session variable
        to the folder folderName and then updates current folder
        on front-end
*/
var setCurrentFolder = function(folderName) {
    var data = {'action': "setCurrentFolder",
                'currentfolder': folderName};
    $.post(ajaxurl, data, function(response) {
        
        var folderurl = response;
        $('#span_currentfolderid').empty();
        $('#span_currentfolderid').append(folderurl);
        $('#span_currentfolderid').data("value", folderurl); 
    });
};

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
    //precondition: either a file or folder have to be selected. 	
    
    var userName = getCurrentUsername();
    var homeFolder = userName + "/";
    if (name == homeFolder){
	// home folder cannot be deleted, we do nothing.
        return; 
    }
	
    // update front end info about current folder / file and vars of currentFolder/File
    if (sthSelected) {
	var currentFileiInCurrentFolder = (currentFile.indexOf(currentFolder) == 0); 

        if (selectedItemType == "folder") 
	   setCurrentFolderNew("");
	if ((selectedItemType == "file") || currentFileiInCurrentFolder) {
	   setCurrentFileNew(""); 
    	   // clear the editor content
    	   var editor = ace.edit("editor");
    	   editor.setValue("", -1);
	}
    }

    // delete the file from server side 
    var data = {
	   'action': "deleteFileOrFolder",
	   'fname': name
    };

    $.post(ajaxurl, data, function(response) {
            //setResultsToString(response);
    });

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
    
    var oldfileurl = currentFile;
    var newfileurl = oldfileurl.substring(0, oldfileurl.lastIndexOf("/")+1) + newName;
    
    if (oldfileurl == newfileurl) { //do nothing if the name is not changed
	return; 
    }
    // rename file at back end 
    var data = {
           'action': "renameFile",
           'oldfileurl': oldfileurl,
	   'newfileurl': newfileurl
    };

    $.post(ajaxurl, data, function(response) {
            // setResultsToString(response);
    });
  
    // update the current file 
    selectedItem = newfileurl; 
    setCurrentFileNew(newfileurl); 
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
    var data = {'action': "getCurrentFile"};
    $.post(ajaxurl, data, function(response) {
        var fileurl = response;
        $('#span_currentfileid').empty();

        if (!fileurl) {
            //TODO do we want untitled
            $('#span_currentfileid').append("");
	    $('#span_currentfileid').data("value", "");
        } else {
            $('#span_currentfileid').append(fileurl);
            $('#span_currentfileid').data("value", fileurl);
        }
    });
};

/*
 updateSetting() : update the setting using the session variables
 called whenever the page is updated
 
 returns : nothing
 */
var updateSetting = function() {
    var data = {'action': "getSetting"};
    $.post(ajaxurl, data, function(response) {
           // get timeout
           var setting = JSON.parse(response);
           // $('#printSetting').append("timeout = " + setting.timeout + "#sets = " + setting.sets);
           // $('#printSetting').append(response);
           // $('#printSetting').show(); 

           // altert(setting);
           $('#setting_timeout').val(setting.timeout);
           if (setting.sets === "other"){
               $('#setting_sets_2').prop('checked',true);
           }
           else{
             if (setting.sets === "all"){
               $('#setting_sets_1').prop('checked',true);
             }
             else $('#setting_sets_0').prop('checked',true);
           }
       });
};



/*
    setCurrentFile(fileName) : sets the PHP Session variable
        to the file fileName and then updates current folder on
        back-end
*/
var setCurrentFile = function(fileName) {
    var data = {'action': "setCurrentFile",
            'currentfile': fileName};
    $.post(ajaxurl, data, function(response) {
        $('#span_currentfileid').empty();

        if (!fileName) {
            $('#span_currentfileid').append("");
	    $('#span_currentfileid').data("value", "");
        } else {
            $('#span_currentfileid').append(fileName);
	    $('#span_currentfileid').data("value", fileName);
        } 
    });
};

/*
    setEditorToFile(fileName) : sets the ACE editor text to the
        file fileName
*/
var setEditorToFile = function(fileName) {

    setCurrentFileNew(fileName);
    if (!fileName) {
        fileName = "_templates/sparc.sp";
    }

    var data = {'action': "getFileContent",
                'fileurl': fileName};    
    $.post(ajaxurl, data, function(response) {
        var editor = ace.edit("editor");
        editor.setValue(response, -1);
    });
}

/*
    setEditorToCurrentFile() : sets ACE editor text to current file name
        in session

    returns : nothing
*/
var setEditorToCurrentFile = function() {
    var data = {'action': "getCurrentFile"};

    $.post(ajaxurl, data, function(response) {
        if (!response) {
            response = "";
        }
        setEditorToFile(response);
    });
    return;
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
    var username = $('#login').attr('data-username');
    if (!username || username === "Log-in") {
        return "";
    }
    return username;
}

var isResponseError = function(response) {
    var errorMessage = "Something went wrong";
    if (response.indexOf(errorMessage) == 0) {
        return true;
    }
    return false;
};

var setResultsToString = function(string) {
    $('#results').empty();
    var clearResults = '<center> <button onclick="clearResults()" > \
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
  var editor = ace.edit("editor")
  //var program = editor.getValue();
  //var cursor = editor.getCursorPosition();
  editor.resize();
  // editor.setValue(program, cursor);
  return;
}
// end of YL

// When the DOM is ready
$(document).ready(function() {

    var editor = ace.edit("editor");
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
        var editorValue = editor.getValue();
        var queryValue = $('#txt_query').val();
	// RE - Fixed 3/9/20 10:44 ams
	queryValue = queryValue.replace(/\?/g, "");

        var data = {'action': "getQuery",
                    'query': queryValue,
                    'editor': editorValue};

        // Expected response : answer sets
        $.post(ajaxurl, data, function(response) {
            setResultsToString(response);
        });
    });

    // Get Answer Sets button handler
    $('#btn_getAnswerSets').click(function(e) {
        var editorValue = editor.getValue();
        var data = {'action': "getAnswerSets",
                   'editor': editorValue};
        
	// $('#results').append("hello");

        // Expected response : answer sets in XML
        $.post(ajaxurl, data, function(response) {
            setResultsToString(response);
        });
    });

	    // Animate button handler
    $('#btn_getAnimation').click(function(e) {
        var editorValue = editor.getValue();
        var data = {'action': "getAnimation",
                    'editor': editorValue};

        // Expected response : answer sets in XML
        $.post(ajaxurl, data, function(response) {
            setResultsToString(response);
        });
    });
	
    // New folder button
    $('#newFolder').click(function(e) {
        e.preventDefault();
        var currentFolder = $("#span_currentfolderid").data("value");

	if (currentFolder == "") {
	   alert("Please select a folder from the directory panel.");
	   return;
	}	

        var folderName = prompt("Please enter folder name");
        data = {'action': "addNewFolder",
                'newfolder': folderName,
		'currentFolder': currentFolder};

        // Expected response : success message
        $.post(ajaxurl, data, function(response) {
            if (!isResponseError(response)) {
                refreshDirectory();
                setCurrentFolderNew(currentFolder+folderName+"/");
                updateCurrentFolder();
            } else {
                setResultsToString(response);
            }
        });
    });

    // New file button
    $('#newFile').click(function(e) {
        e.preventDefault();
        var fileName = prompt("Please enter file name");
        // var editorValue = editor.getValue();
	var editorValue = ""; // we set the new file to be empty
        data = {'action': "addNewFile",
                'newfile': fileName,
                'editor': editorValue};

        // Expected response : success message
        $.post(ajaxurl, data, function(response) {

            if (!isResponseError(response)) {
                refreshDirectory();
                setEditorToFile(response);
                updateCurrentFile();
            } else {
                setResultsToString(response);
            }
            //setCurrentFile(response);
        });
    });

    // Delete button -- we don't hvae delete  button of #btn_delete. We have a delete button in easyTree.js
    $("#btn_delete").click(function(e) {
        e.preventDefault();
        // TODO configure this
        data = {'action': "deleteFolder",
                'folderurl': "christian/deletefolder/"};

        $.post(ajaxurl, data, function(response) {
            setResultsToString(response);
            //$('#results').append(response + "</br>");
        });
    });

    // Share button
    $("#btn_share").click(function(e) {
        e.preventDefault();
        var currentFile = $("#span_currentfileid").html();
        var otherUser = $("#share_username").val();
        data = {'action': "shareFile",
                'fileurl': currentFile,
                'username2': otherUser,
                'permissions': "1"};

        $.post(ajaxurl, data, function(response) {

            if (response === "1") {
                //alert("Share successful!");
                $('#shareModal').modal("hide");
            } else {
                //alert("Error sharing file");
                $('#shareModal').modal("hide");
            }

        });
    });

// Setting  button XY
    $("#btn_changesetting").click(function(e) {

        e.preventDefault();
        var timeout = $("#setting_timeout").val();
        var sets = $("input:radio[name=setting_sets]:checked").val();
        var otherNumSets = $("#setting_numSets").val();
                  
          $("#changeSetting_fail").empty();
          $("#changeSetting_fail").hide();
                                  
          if($.isNumeric(timeout)){
              if(parseInt(timeout)>50){
                $("#changeSetting_fail").append("Error: your timeout is greater than the limit of 50s.");
                $("#changeSetting_fail").show();
              }
              else {
                  data = {'action': "changeSetting",
                  'timeout': timeout,
                  'sets': sets,
		  'otherNumSets': otherNumSets};
                  //    $('#settingModal').modal("hide");
                  $.post(ajaxurl, data, function(response) {
                         //   alert(response);
                         //   $('#setting_timeout').val(50);
                         //   $('#setting_sets_0').prop('checked',true)
                         
                         // $("#changeSetting_fail").append("repsonse=",response);
                         // $("#changeSetting_fail").show();
                         if (response === "1") {
                         //alert("setting change successful!");
                         $('#settingModal').modal("hide");
                         } else {
                         //alert("Error sharing file");
                         //$("changeSetting_fail").show();
                         }
                });

              }
           }
           else{
                 $("#changeSetting_fail").append("Error: your timeout is not a number.");
                 $("#changeSetting_fail").show();
           }
    });
  $("#btn_cancelsetting").click(function(e) {
    e.preventDefault();
    $('#settingModal').modal("hide");
    });

    //End of Setting XY

    // Issues button
    $("#navbar_btn_issues").click(function(e) {
        var issue = prompt("What is your issue? Please give details as to what you did before you received an error.");
        var data = {'action': "addIssue",
                    'issue': issue};

        $.post(ajaxurl, data, function(response) {
            alert("Thank you for your contribution.");
        });
    });

    // Save button
    $("#btn_save").click(function(e) {
        // TODO check if currentuser is null then show log-in button
                         

        var editorValue = editor.getValue();
    
        updateCurrentFile();
        var currentFile = $("#span_currentfileid").data("value");

        updateCurrentFolder();
        var currentFolder = $("#span_currentfolderid").data("value");

        // save an untitled file
	var newFile = false; 
        if (!currentFile || currentFile == "") {
            currentFile = prompt("Please enter a file name");
	    if (currentFile === null) {// user canceled the input box. 
		alert("Nothing is saved since you didn't input a file name.");
		return;
	    } 
	    newFile = true; 
            currentFile = currentFolder.trim() + currentFile.trim();
        }
        var currentFileurl = currentFile;

        data = {'action': "saveFile",
                'fileurl': currentFileurl,
                'editor': editorValue};

        // setResultsToString("current file is:" + currentFileurl); 
        $.post(ajaxurl, data, function(response) {
            // setResultsToString(response);

            if (!isResponseError(response)) {
                setCurrentFile(currentFileurl);
                updateCurrentFile();
		if (newFile) 
		   refreshDirectory();
            }
        });
    });

    $(document).on("click", ".dir-item", function() {
        var fileurl = $(this).data("value");
        setEditorToFile(fileurl);

        var folderurl = fileurl.substring(0, fileurl.lastIndexOf("/")+1);
        setCurrentFile(fileurl);
        setCurrentFolder(folderurl);
        setCurrentFile(fileurl);
        updateCurrentFolder();
        updateCurrentFile();
    });

    /* when an item is CLICKED (which may select or unselect the item from the file system */
    $(document).on("click", ".dir-item-text", function(e) {
        var isFolder = $(this).parent().parent().hasClass('dir-folder');
        var fileurl = $(this).parent().parent().data("value");

        // if the selected file/folder is clicked, sthSelected will be toggled
	// otherwise sth is selectged 
        var sameSelectionAsBefore = (fileurl == selectedItem); 
	
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

          var folderurl = fileurl.substring(0, fileurl.lastIndexOf("/")+1);
	  
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
        var font_size = $(this).val();
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

    /* This does not work 
    $(document).on("click", ".dir-folder parent_li", function() {
        var folderurl = $(this).data("value");
        alert("This fires");
        setCurrentFolder(folderurl);
    }); */
    

    // TODO: remove

    /*
    function displayResults(xml) {
        var xsl = loadXMLDoc("compiler/SPARC/parser/NoQuery.xsl");
        // code for IE
        if (window.ActiveXObject|| xhttp.responseType == "msxml-document") {
            var ex = xml.transformNode(xsl);
            document.getElementById("result").innerHTML = ex;
        }
        // code for Chrome, Firefox, Opera, etc.
        else if (document.implementation && document.implementation.createDocument) {
            var xsltProcessor = new XSLTProcessor();
            xsltProcessor.importStylesheet(xsl);
            resultDocument = xsltProcessor.transformToFragment(xml, document);
            document.getElementById("result").appendChild(resultDocument);
            ("#result").append(resultDocument);
        }
    }

    */
});
