package com.video;
import java.io.File;	
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.commons.fileupload.FileItemStream;
public class VideoUpload {
	public static boolean processFile(String path,FileItemStream item)
	  {
		  try{
			  path="D:\\";
			  File f=new File(path);
			  if(!f.exists())f.mkdir();
			  File savedfile=new File(f.getAbsolutePath()+File.separator+item.getName());
			  FileOutputStream fos=new FileOutputStream(savedfile);
			  InputStream is=item.openStream();
			  int x=0;
			  byte[] b= new byte[1024];
			  
			  while((x=is.read(b))!=-1){
				  fos.write(b, 0, x);
				  
					  }
			  fos.flush();
			  fos.close();
			  return true;
			  
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  
		  return false;
	  }


}
