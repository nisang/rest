/**
 * 
 */
package com.che.user.service;

import com.che.user.entity.UserEntity;
import com.che.user.pojo.LoginReply;
import com.che.user.pojo.LoginReq;

/**
 * @author karlhell
 *
 */
public interface LoginService {

	/**
	 * 通过手机号查询用户
	 * @param mobile
	 * @return
	 */
	UserEntity getUsersByMobile(String mobile);
	
	/**
	 * 根据账号查询用户信息
	 * @param account
	 * @return
	 */
	UserEntity getUsersByAccount(String account);
	/**
	 * 通过open_id查询用户
	 * @param mobile
	 * @return
	 */
	UserEntity getUserByOpenId(String open_id);
	
	
	/**
	 * 通过open_id查询用户
	 * @param mobile
	 * @return
	 */
	UserEntity getUserByUnionId(String union_id);
	
	/**
	 * 登录
	 * @param req
	 * @return
	 */
	LoginReply login(LoginReq req);
	
	/**
	 * 微信 union_id 登录
	 * @param req
	 * @return
	 */
	LoginReply loginv2(LoginReq req);
	/**
	 * 登录-微信公众号登录
	 * open_id 代表 open_id_wp
	 * @param req
	 * @return
	 */
	LoginReply loginbyWpOpenId(LoginReq req);
	
	/**
	 * 注册
	 * @param UserRegistReq
	 * @return
	 */
	LoginReply regist(LoginReq req);
	
	
	
	/**
	 * 注册 无需手机号
	 * @param UserRegistReq
	 * @return
	 */
	LoginReply registv2(LoginReq req);
	
	/**
	 * 注册
	 * @param UserRegistReq
	 * @return
	 */
	LoginReply registWx(LoginReq req);

	/**
	 * 重置密码
	 * @param mobile
	 * @param password
	 */
	void modifyPwd(String mobile, String password);
	
	/**
	 * 是否有相同邀请码（不区分大小写）
	 * @param inviteCode
	 * @return
	 */
	int hasSameCode(String inviteCode);
	
	Long getUserIdByInviteCode(String inviteCode);
	
}
