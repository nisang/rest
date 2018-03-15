package com.che.user.pojo;

import com.che.common.web.Reply;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author karlhell
 *
 */
@EqualsAndHashCode(callSuper=false)
@Data
public class LoginReply extends Reply {
	private static final long serialVersionUID = 4729872597038110004L;
	
	private String mobile;// 手机号
	private String account;//账号
	private String open_id;
	private String union_id;
	private String uid; //用户id
	private String sessionId; // sessionid
	
	private String userName; // 用户名称
    private String avatar;//头像
    private Integer sex; // 0:女, 1:男, null:未知
    private String city;//城市
	private Long city_id;//城市代码
	private String province;//省/直辖市
	private Long province_id;//省/直辖市id
	private String introduce;//介绍，签名
	
	private double amount;//总额度
	private int mianuser;//0:子账号或者个人账号
	private int companyId;//公司Id
	
}
