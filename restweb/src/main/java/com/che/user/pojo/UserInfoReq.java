package com.che.user.pojo;

import lombok.Data;

@Data
public class UserInfoReq {

	/** 更新信息 */
	private String user_name; // 用户名称
	private String avatar;//头像
	private String introduce;//介绍，签名
    private Integer sex; // 0:女, 1:男, null:未知
    
    
	private String uid;
	private String account; //'账号',
	private String mobile;// 手机号
	private String password;// 密码
	private String open_id; //微信id
	private String open_id_mp; //微信公众号id
	private String union_id; //微信id
	private String province;//省/直辖市
	private Long province_id;//省/直辖市id
    private String city;//城市
	private Long city_id;//城市代码
}
