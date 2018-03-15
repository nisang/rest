package com.che.common.util;

import java.io.InputStream;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.PutObjectResult;

public class OssUpload {
	private static String endpoint = "oss-cn-shanghai.aliyuncs.com";
	
	private static String accessKeyId = "2jvmNR4Af3zixpXU";
	private static String accessKeySecret = "aI2AXdJpAJaEs7sRX48AfzCM0N1vRY";
	private static String securityToken = "";
	private static String bucketName = "chechengupload";
	
	private static String folder = "gujia";
	/**
	 * 上传文件流
	 * @param inputStream
	 */
	public static String uploadStream(InputStream inputStream,String fileName){
		OSSClient ossClient = null;
    	// 创建OSSClient实例
    	try {
    		ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
	    	//InputStream inputStream = new URL("http://car3.autoimg.cn/cardfs/product/g10/M06/8C/08/t_autohomecar__wKgH0VYFFGuAXMz6AAdEOmIbcJM581.jpg").openStream();
    		PutObjectResult result = ossClient.putObject(bucketName, folder+"/"+fileName, inputStream);
    		//System.out.println(result.getETag());
    		//System.out.println(result.getRequestId()+"");
    		//System.out.println(fileName);
    		//System.out.println("http://chechengupload.oss-cn-shanghai.aliyuncs.com/"+fileName);
    		System.out.println("http://chechengupload.oss-cn-shanghai.aliyuncs.com/"+folder+"/"+fileName);
    		//System.out.println(result.getCallbackResponseBody()+"");
    		//return result.getETag();
    		return "http://chechengupload.oss-cn-shanghai.aliyuncs.com/"+folder+"/"+fileName;
    	}catch(Exception ex){
    		ex.printStackTrace();
    	}finally {
		}
    	return "";
    }
}
