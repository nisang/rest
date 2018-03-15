
/**
 * 
 */
package com.che.common.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author wangfuyun
 *
 */
@Component
public class GlobalInfo {
	
	private static GlobalInfo globalInfo;

	public static GlobalInfo getInstance() {
		return globalInfo;
	}

	public GlobalInfo() {
		globalInfo = this;
	}

	@Value("${oss.bucketName}")
	public String bucketName;
	
	@Value("${oss.endpoint}")
	public String endpoint;

}
