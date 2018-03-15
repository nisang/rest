package com.che.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.http.ProtocolType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.aliyuncs.sts.model.v20150401.AssumeRoleRequest;
import com.aliyuncs.sts.model.v20150401.AssumeRoleResponse;
import com.che.common.pojo.OssEntity;


/**
 * https://help.aliyun.com/document_detail/28788.html?spm=5176.doc28763.6.248.lbRM1M
 * policy 约束说明
 * https://help.aliyun.com/document_detail/31921.html
 * @author Administrator
 *
 */
@Configuration
public class OSSConfig {
	private static final Logger logger = LoggerFactory.getLogger(OSSConfig.class);
	// 目前只有"cn-hangzhou"这个region可用, 不要使用填写其他region的值
	private static final String REGION_CN_HANGZHOU = "cn-hangzhou";
	// 当前 STS API 版本
	private static final String STS_API_VERSION = "2015-04-01";
//	private static String accessKeyId = "Tlx3GlK0KNkWqKCz";
//	private static String accessKeySecret = "D2ODXPRbBywNdtmubxovHB1tYDzNZG";
//	// AssumeRole API 请求参数: RoleArn, RoleSessionName, Policy, and
//	// DurationSeconds
//	// RoleArn 需要在 RAM 控制台上获取
//	private static String roleArn = "acs:ram::1359005659732092:role/test";
//	// RoleSessionName 是临时Token的会话名称，自己指定用于标识你的用户，主要用于审计，或者用于区分Token颁发给谁
//	// 但是注意RoleSessionName的长度和规则，不要有空格，只能有'-' '_' 字母和数字等字符
//	// 具体规则请参考API文档中的格式要求
//	private static String roleSessionName = "test";
	@Value("${oss.endpoint}")
	private String endpoint;//"oss-cn-shanghai.aliyuncs.com";
	@Value("${oss.bucketName}")
	private String bucketName;//"chechengupload";
	@Value("${oss.accessKeyId}")
	private String accessKeyId;//"2jvmNR4Af3zixpXU";
	@Value("${oss.accessKeySecret}")
	private String accessKeySecret;//"aI2AXdJpAJaEs7sRX48AfzCM0N1vRY";
	// AssumeRole API 请求参数: RoleArn, RoleSessionName, Policy, and
	// DurationSeconds
	// RoleArn 需要在 RAM 控制台上获取
	@Value("${oss.roleArn}")
	private String roleArn;//"acs:ram::1190140400908254:role/gujiarole";
	// RoleSessionName 是临时Token的会话名称，自己指定用于标识你的用户，主要用于审计，或者用于区分Token颁发给谁
	// 但是注意RoleSessionName的长度和规则，不要有空格，只能有'-' '_' 字母和数字等字符
	// 具体规则请参考API文档中的格式要求
	@Value("${oss.roleSessionName}")
	private String roleSessionName;//"dev-gujia";
	@Value("${oss.folder}")
	private String folder;
	// 如何定制你的policy
	//app-base-oss/gujia/
	private String policy = "{\n" +
            "    \"Version\": \"1\", \n" +
            "    \"Statement\": [\n" +
            "        {\n" +
            "            \"Action\": [\n" +
            "                \"oss:GetBucket\", \n" +
            "                \"oss:PutObject\" \n" +
            "            ], \n" +
            "            \"Resource\": [\n" +
            "                \"acs:oss:*:*:*\"\n" +
            "            ], \n" +
            "            \"Effect\": \"Allow\"\n" +
            "        }\n" +
            "    ]\n" +
            "}";
	// 此处必须为 HTTPS
	private static ProtocolType protocolType = ProtocolType.HTTPS;

	private static AssumeRoleResponse assumeRole(String accessKeyId, String accessKeySecret, String roleArn,
			String roleSessionName, String policy, ProtocolType protocolType) throws ClientException {
		try {
			// 创建一个 Aliyun Acs Client, 用于发起 OpenAPI 请求
			IClientProfile profile = DefaultProfile.getProfile(REGION_CN_HANGZHOU, accessKeyId, accessKeySecret);
			DefaultAcsClient client = new DefaultAcsClient(profile);
			// 创建一个 AssumeRoleRequest 并设置请求参数
			final AssumeRoleRequest request = new AssumeRoleRequest();
			request.setVersion(STS_API_VERSION);
			request.setMethod(MethodType.POST);
			request.setProtocol(protocolType);
			request.setDurationSeconds((long)3600);
			request.setRoleArn(roleArn);
			request.setRoleSessionName(roleSessionName);
			request.setPolicy(policy);
			//发起请求，并得到response
			final AssumeRoleResponse response = client.getAcsResponse(request);
			return response;
		} catch (ClientException e) {
			throw e;
		}
	}
	public OssEntity getOssToken() {
		try {
			final AssumeRoleResponse response = assumeRole(accessKeyId, accessKeySecret, roleArn, roleSessionName,
					policy, protocolType);
			logger.info("Expiration: " + response.getCredentials().getExpiration());
			logger.info("Access Key Id: " + response.getCredentials().getAccessKeyId());
			logger.info("Access Key Secret: " + response.getCredentials().getAccessKeySecret());
			logger.info("Security Token: " + response.getCredentials().getSecurityToken());
			String expiration = response.getCredentials().getExpiration();
			String accessKeyIdOther = response.getCredentials().getAccessKeyId();
			String accessKeySecretOther = response.getCredentials().getAccessKeySecret();
			String securityToken = response.getCredentials().getSecurityToken();
			OssEntity oss = new OssEntity(accessKeyIdOther, accessKeySecretOther, securityToken, expiration,bucketName,endpoint,folder);
			return oss;
		} catch (ClientException e) {
			logger.error("Failed to get a token.");
			logger.error("Error code: " + e.getErrCode());
			logger.error("Error message: " + e.getErrMsg());
		}
		return new OssEntity();
	}

}
