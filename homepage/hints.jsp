<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function showHint(str)
{
var xmlhttp;
if (str.length==0)
  { 
  document.getElementByName("txt1").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","posthint.jsp?q="+str,true);
xmlhttp.send();
}
</script>
</head>
<body>
<form id="tw-form" method="post">
<input id="tw-input-text" size="10" name="txt1" onkeyup="showHint(this.value)" />
<input id="tw-input-submitadd"  type="submit" value=""/><br/><span id="txtHint"></span>
</form>
</body>
</html>