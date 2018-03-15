package com.che.service;

import com.alibaba.dubbo.config.annotation.Service;

/**
 * 注册服务
 * 
 * @author Administrator
 *
 */

@Service(version="1.0.0")
public class DubboServiceImpl implements DubboService{

	@Override
	public void doSomething() {
		
	}

}
