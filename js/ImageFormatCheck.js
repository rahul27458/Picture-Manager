
function TestFileType( fileName, fileTypes ) {
if (!fileName) return;

dots = fileName.split(".");
//get the part AFTER the LAST period.
fileType = "." + dots[dots.length-1];

return (fileTypes.join(".").indexOf(fileType) != -1) ?
alert('That file is OK!') : 
alert("Please only upload files that end in types: \n\n" + (fileTypes.join(" .")) + "\n\nPlease select a new file and try again.");
}

