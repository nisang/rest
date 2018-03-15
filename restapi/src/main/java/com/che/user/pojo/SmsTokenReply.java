package com.che.user.pojo;

import com.che.common.web.Reply;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class SmsTokenReply extends Reply {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String token;
}
