package com.che.user.pojo;

import com.che.common.util.EmojiUtil;
import com.che.common.web.Req;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 
 *
 */
@EqualsAndHashCode(callSuper=false)
public class LoginReq extends Req {
	
	private static final long serialVersionUID = 3424792863917230798L;
	
	//登录方式一
	/** 手机号码 */
	private String mobile;
	/**  短信验证码 */
	private String smsCode;
	
	
	//登录方式二
	/** 账号  */
	private String account;
	/** 密码  加密方式为 sha1(password源字符串) */
	private String password;//sha1 40位加密
	
	//加上token 校验
	/** token 如果是方式一登录，则token为md5(mobile+smsCode+loginType)  如果是方式二登录,则token为md5(accound+password+loginType)*/
	private String token;
	
	
	private Integer loginType = 1;//1手机号+验证码登录 2.账号密码登录
	
	private String open_id; //微信id
	private String union_id; //union_id
	private String userName; // 用户名称
	
    private String avatar;//头像
    private Integer sex = -1; // 0:女, 1:男, -1:未知
    private String city;//城市
	private Long city_id;//城市代码
	private String province;//省/直辖市
	private Long province_id;//省/直辖市id
	private String introduce;//介绍，签名
	
	private String invite_code; //邀请码
	
	private String force = "";
	/**
	 * 来源
	 * 注册来源 0:手机端 1:web微信端 2:微信公众号 3.官方注册可绑定
	 */
	private int source;
	/**
	 * 1:ios
	 * 2:android
	 * 3.web
	 */
	private int platform;
	public String getOpen_id() {
		return open_id;
	}
	public void setOpen_id(String open_id) {
		this.open_id = open_id;
	}
	public String getUnion_id() {
		return union_id;
	}
	public void setUnion_id(String union_id) {
		this.union_id = union_id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		userName = EmojiUtil.parse(userName);
		this.userName = userName;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSmsCode() {
		return smsCode;
	}
	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Long getCity_id() {
		return city_id;
	}
	public void setCity_id(Long city_id) {
		this.city_id = city_id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Long getProvince_id() {
		return province_id;
	}
	public void setProvince_id(Long province_id) {
		this.province_id = province_id;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getInvite_code() {
		return invite_code;
	}
	public void setInvite_code(String invite_code) {
		this.invite_code = invite_code;
	}
	public String getForce() {
		return force;
	}
	public void setForce(String force) {
		this.force = force;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public int getPlatform() {
		return platform;
	}
	public void setPlatform(int platform) {
		this.platform = platform;
	}

	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Integer getLoginType() {
		return loginType;
	}
	public void setLoginType(Integer loginType) {
		this.loginType = loginType;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	
}
