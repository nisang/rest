package com.che.user.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserEntity implements Serializable{
	private static final long serialVersionUID = 3479431072603874382L;

	private Long id; // 用户id
	private String mobile;// 手机号
	private String account; //'账号',
	private String password;// 密码
	private String user_name; // 用户名称
	private String avatar;//头像
	private String introduce;//介绍，签名
    private Integer sex; // 0:女, 1:男, null:未知
	private String open_id; //微信id
	private String open_id_mp; //微信公众号id
	private String union_id; //微信id
	
	
	private String province;//省/直辖市
	private Long province_id;//省/直辖市id
	

    private String city;//城市
	private Long city_id;//城市代码
	
	
	private Integer user_status; //用户状态：0正常
	private Long inviter_id;//邀请人id	
	private String invite_code; //邀请码
	private Timestamp create_time;//'创建时间',
	private Timestamp update_time;//'更新时间',
	private String hx_username;
	private String hx_passwd;
	
	private Integer companyId;//公司Id
	private Integer mianuser;//是否是主账户

}
