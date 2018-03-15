package com.che.common.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.che.common.util.MyDateUtils;

import lombok.Data;

/**
 * 公共Reply类
 */
@Data
@Configuration
public class Reply implements java.io.Serializable{
    private static final long serialVersionUID = -3428103714057908538L;

	/**
	 * 请求返回值：0成功；非0失败
	 */
    private Integer resultCode = 0;

	/**
	 * 应答信息：对 replyCode\resultCode 的文字描述
	 */
    private String message = "执行成功！";
    /**
     * 请求标识，服务器从终端请求中复制该字段到应答字段，若没有，置为null
     */
    private Integer reqId;
    
    /**
     * 服务器时间
     */
	private Long serverTime = MyDateUtils.getTimeMillis();
	
    /**
	 * 与业务相关的状态 0:成功 1:其他非预期状态
	 */
    private Integer replyCode = 0;
    
    private Object data;
    
}

