package com.che.user.pojo;

import com.che.common.web.Reply;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author karlhell
 *
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class UserReply extends Reply {
	
	private static final long serialVersionUID = 1L;

	private Long id; // 用户id
	private Long uid; //
	private String mobile;// 手机号
	private String user_name; // 用户名称
	private String account;//用户账号
    private String avatar;//头像
    private Integer sex; // 0:女, 1:男, null:未知
    private String city;//城市
	private Long city_id;//城市代码
	private String province;//省/直辖市
	private Long province_id;//省/直辖市id
	private String open_id;//微信ID
	private String union_id;//
	private Integer user_status;//0正常 
	private String introduce;//介绍，签名
	private String sessionId;
	/** 环信账号 登录用户名*/
	private String hxUsername;
	/** 环信登录密码 */
	private String hxPasswd;
	/** 环信 昵称  */
	private String hxpetName;
	
	
}
