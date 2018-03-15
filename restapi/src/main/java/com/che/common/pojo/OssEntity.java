package com.che.common.pojo;

import java.io.Serializable;

import com.che.common.web.Reply;

import lombok.Data;

/**
 * android 上传文件规则：
 * ios_20160714030027184.jpg
 * android_20160714030027184.jpg
 * @author Administrator
 *
 */

@Data
public class OssEntity implements Serializable{
	
	private static final long serialVersionUID = 7813186750503501648L;
	private String accessKeyId;
	private String accessKeySecret;
	private String securityToken;
	private String expiration;
	private String bucketName;
	private String endpoint;
	private String folder = "gujia";
	private String baseUrl;
	
	public OssEntity() {
	}

	public OssEntity(String accessKeyId, String accessKeySecret, String securityToken, String expiration,
			String bucketName, String endpoint,String folder) {
		this.accessKeyId = accessKeyId;
		this.accessKeySecret = accessKeySecret;
		this.securityToken = securityToken;
		this.expiration = expiration;
		this.bucketName = bucketName;
		this.endpoint = endpoint;
		this.baseUrl = "http://"+bucketName+"."+endpoint+"/"+folder+"/";
	}
	
	
}
