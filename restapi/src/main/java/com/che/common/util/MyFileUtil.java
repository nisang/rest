/**
 * 
 */
package com.che.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.codec.binary.Base64;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;



/**
 * @author liujinghao
 *
 */
public class MyFileUtil {

	private static Logger logger = LogManager.getLogger(MyFileUtil.class); 
	
	 
	public static void createPic(String content,String filepath){
		boolean flag = false;
		int count = 0;
         while(!flag){
        	 if(count == 3){
        		 flag = true;
        	 }else{
        		 flag = createPicFile(content,filepath);
        	 }
        	 count ++;
         }
	}
	
	private static boolean createPicFile(String content,String path){
		boolean flag = false;
		try {
			Base64 decoder = new Base64();
	            byte[] b = decoder.decode(content);
	            for (int i = 0; i < b.length; ++i) {
	   	         if (b[i] < 0) {// 调整异常数据
	   	         b[i] += 256;
	   	         }
	            }
	            createFile(path,b);
	            flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
   		return flag;
	}
	
	
	 public synchronized static void createFile(String path, byte[] content) throws IOException {  
			File file = new File(path);
			if(!file.exists()){
				file.createNewFile();
			}
	        FileOutputStream fos = new FileOutputStream(path);  
	        fos.write(content);  
	        fos.flush();
	        fos.close(); 
	        fos = null;
	        logger.info("creat file:" + path);
	 }  
	 
	 @SuppressWarnings("unused")
    private static byte[] hexToBytes(String hexString) {
			if (hexString == null || hexString.equals("")) {
				return null;
			}
			hexString = hexString.toUpperCase();
			int length = hexString.length() / 2;
			char[] hexChars = hexString.toCharArray();
			byte[] d = new byte[length];
			for (int i = 0; i < length; i++) {
				int pos = i * 2;
				d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));
			}
			return d;
		}
		
		private static byte charToByte(char c) {
			return (byte) "0123456789ABCDEF".indexOf(c);
		}
	 
	 
	 public synchronized static void createBFile(String filepath,byte[] content){
		    DataOutputStream dos=null; 
		    try{  
	            if(!new File(filepath).exists()){  
	                new File(filepath).createNewFile();  
	            }else{
	            	logger.info("bfile exists:" + filepath);
	            	return;
	            }  
	            dos=new DataOutputStream(new FileOutputStream(filepath,true));  
	            dos.write(content);
	            dos.flush();
	            dos.close();
	            logger.info("create bfile:" + filepath);
	        }catch(Exception e){  
	            e.printStackTrace();  
	            logger.error("create binary file error:" + e.getMessage());
	        }  
	 }
	 
	 public synchronized static void createFileNewLine(String fileName, String content) {  
	        try {  
	        	File file = new File(fileName);
				if(!file.exists()){
					file.createNewFile();
				}
	            FileWriter writer = new FileWriter(fileName, true);  
	            writer.write(content+"\r\n");  
	            writer.close();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	    }  
	 
	 
	 public synchronized static void deleteFile(String filepath){ 
		 
		 try{
			 File file = new File(filepath);
			 if(file.exists()){                    
			                       
			    file.delete();    
//			    log.info("delete file:" + filepath);
			
			}else{
				logger.info("deleteFile file not exists:" + filepath);
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.error("delete file exception:" + e.getMessage());
		}
		 
	}
	 
	 public synchronized static void copyFile(String sfile,String dfile){
		 logger.info("_____copyfile from " + sfile + " to " + dfile);
		 BufferedInputStream inBuff = null;
		 BufferedOutputStream outBuff = null;
		 try {
           inBuff = new BufferedInputStream(new FileInputStream(sfile));
           outBuff = new BufferedOutputStream(new FileOutputStream(dfile));
           byte[] b = new byte[1024 * 5];
           int len;
           while ((len = inBuff.read(b)) != -1) {
               outBuff.write(b, 0, len);
           }
           outBuff.flush();
		 } catch(Exception e){
			 logger.error("_____copy file error! source:" + sfile +" dest:" + dfile );
		 }
		 finally {
			try {
	            if (inBuff != null)
					inBuff.close();
	            if (outBuff != null)
	                outBuff.close();
			} catch (IOException e) {
				e.printStackTrace();
				logger.error("copy file close buf error!");
			}
		 }
	        
	 }
	 
	 public static byte[] toByteArray(String filename){  
	        File f = new File(filename);  
	        if (!f.exists()) {  
	            return null;
	        }  
	  
	        ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());  
	        BufferedInputStream in = null;  
	        try {  
	            in = new BufferedInputStream(new FileInputStream(f));  
	            int buf_size = 1024;  
	            byte[] buffer = new byte[buf_size];  
	            int len = 0;  
	            while (-1 != (len = in.read(buffer, 0, buf_size))) {  
	                bos.write(buffer, 0, len);  
	            }  
	            return bos.toByteArray();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        } finally {  
	            try {  
	                in.close();  
	                bos.close();  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        return null;  
	    }  
	 
	 
	public static String getHexString(byte[] b){
		String result = "";
		for (int i=0; i < b.length; i++) {
			result += Integer.toString( ( b[i] & 0xff ) + 0x100, 16).substring( 1 );
		}
		return result;
	}
	 
	public static void createDirectory(String dirpath){
		try{
			 File file = new File(dirpath);
			 if(!file.exists()){
				 file.mkdirs();
				 logger.info("create dir:" + dirpath);
			 }
		}catch(Exception e){
			e.printStackTrace();
			logger.error("create dir error:" + e.getMessage());
		}
	}
}
