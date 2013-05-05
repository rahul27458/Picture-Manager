function validate_ext() {
    var filename = document.getElementById("image_upload").value;
  //  var filename2 = document.getElementById("file2").value;

    var ext = getExt(filename);
  
    if((ext=="jpg") || (ext=="jpeg") || (ext=="png") || (ext=="PNG") || (ext=="gif") || (ext=="GIF"))
    { return true;
    
    }
    else{
    	
    
    alert("Please upload files in correct format only.");
    return false;
    }
   
}
function validate_ext_profile() {
    var filename = document.getElementById("image_upload_profile").value;
  //  var filename2 = document.getElementById("file2").value;

    var ext = getExt(filename);
  
    if((ext=="jpg") || (ext=="jpeg") || (ext=="png") || (ext=="PNG") || (ext=="gif") || (ext=="GIF"))
    { return true;
    
    }
    else{
    	
    
    alert("Please upload files in correct format only.");
    return false;
    }
   
}
function video_ext() {
      var filename2 = document.getElementById("video_upload").value;

    var ext2 = getExt(filename2);
    if((ext2=="mp4") || (ext2=="MP4") )
    { return true;
    
    }
    else{
    alert("Please upload files with .mp4 extension only.");
    return false;
    }
   
}


function getExt(filename) {
    var dot_pos = filename.lastIndexOf(".");
    if(dot_pos == -1)
        return "";
    return filename.substr(dot_pos+1).toLowerCase();
}