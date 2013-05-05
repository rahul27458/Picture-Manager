package com.Model;

	import java.io.File;	
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.commons.fileupload.FileItemStream;

public class FileUpload2 {
  public static String processFile(String path,FileItemStream item)
  {
	  try{
		  path="D:\\";
		  File f=new File(path);
		  // gets filename
		  String fileName=item.getName();
		  // to remove ext and add a random number so that new file is created for same fileupload
		  String fname="";
		  String ext="";
		  int mid= fileName.lastIndexOf(".");
		  fname=fileName.substring(0,mid);
		  ext=fileName.substring(mid+1,fileName.length()); 
		  String newFilename=fname+Math.random()+"."+ext;
		 
		  if(!f.exists())f.mkdir();
		  File savedfile=new File(f.getAbsolutePath()+File.separator+newFilename);
		  FileOutputStream fos=new FileOutputStream(savedfile);
		  InputStream is=item.openStream();
		  int x=0;
		  byte[] b= new byte[is.available()];
		  
		  while((x=is.read(b))!=-1){
			  fos.write(b, 0, x);
			  
				  }
		  fos.flush();
		  fos.close();
		  return newFilename;
		  
	  }catch(Exception e){
		  e.printStackTrace();
	  }
	  
	  return "";
  }




}
