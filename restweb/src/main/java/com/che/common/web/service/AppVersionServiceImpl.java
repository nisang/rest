/**
 * 
 */
package com.che.common.web.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.che.common.pojo.AppVersionReply;


/**
 * @author karlhell
 *
 */
@Service
public class AppVersionServiceImpl implements AppVersionService {

	@Value("${app.versionCode}")
	private Integer versionCode;
	@Value("${app.url}")
	private String url;
	@Value("${app.desc}")
	private String desc;
	@Value("${app.isMustInstall}")
	private Boolean isMustInstall;
	
	@Override
	public AppVersionReply version() {
		AppVersionReply reply = new AppVersionReply();
		reply.setVersionCode(versionCode);
		reply.setUrl(url);
		reply.setDesc(desc);
		reply.setMustInstall(isMustInstall);
		return reply;
	}

}
