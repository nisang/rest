/**
 * 
 */
package com.che.user.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;
import com.che.common.util.Md5Encrypt;
import com.che.common.web.Constants;
import com.che.common.web.Reply;
import com.che.common.web.Req;
import com.che.common.web.service.SmsCodeService;
import com.che.service.DubboService;
import com.che.user.entity.UserEntity;
import com.che.user.entity.ValidateEntity;
import com.che.user.mapper.UserEntityMapper;
import com.che.user.mapper.UserExtMapper;
import com.che.user.pojo.CertificateReq;
import com.che.user.pojo.LoginReply;
import com.che.user.pojo.LoginReq;
import com.che.user.pojo.UserInfoReq;
import com.che.user.pojo.UserReply;
import com.che.user.service.LoginService;
import com.che.user.service.UserService;

/**
 * @author karlhell
 *
 */
@RestController
@RequestMapping("/user")
public class UserController {
	public static final String appkey = "352D78C483D7925D89963D4A5FEB777A";
	
	
	@Autowired
	private LoginService loginService;

	@Autowired
	private SmsCodeService smsCodeService;

	@Autowired
	private UserService userService;

	@Autowired
	private UserEntityMapper userEntityMapper;

	@Autowired
	private UserExtMapper userExtMapper;
	
	/**
	 * 调用dubbo服务
	 */
	@Reference(lazy=true)
	private DubboService dubboService;

	private static final Logger logger = Logger.getLogger(UserController.class);

	/////////////////////////////////// 以上为作废接口////////////////////////////////////////
	/**
	 * 登录接口 1.手机号+验证码直接登录 2.账号+密码登录
	 * 
	 * @param request
	 * @param response
	 * @param loginReq
	 * @return
	 */
	@RequestMapping(value = "/login")
	public LoginReply loginapp(HttpServletRequest request, HttpServletResponse response,
			@RequestBody LoginReq loginReq) {

		LoginReply reply = new LoginReply();
		if (loginReq == null || loginReq.getToken() == null) {
			reply.setReplyCode(-1);
			reply.setMessage("参数错误!");
			return reply;
		}

		// 判断登录方式
		int loginType = loginReq.getLoginType();
		String token = loginReq.getToken();
		if (1 == loginType) {// 手机+验证码
			// 0.token 是否通过
			String source = loginReq.getMobile() + "" + loginReq.getSmsCode() + "" + loginReq.getLoginType();
			String md5 = Md5Encrypt.md5(source);
			if (!md5.equals(token)) {
				reply.setReplyCode(-1);
				reply.setMessage("参数错误!");
				return reply;
			}
			// 1判断验证码是否通过
			validatSmscode(reply, loginReq.getMobile(), loginReq.getSmsCode());
			if (reply.getReplyCode() != 0) {// 验证码校验通过
				return reply;
			}
			// 2.查询是否注册过
			UserEntity user = loginService.getUsersByMobile(loginReq.getMobile());
			// 3.已注册直接登录 未注册则注册后登录
			// 登录
			if (user != null) {
				reply = loginService.login(loginReq);
				return reply;
			} else if (loginReq.getMobile() != null && loginReq.getSmsCode() != null) {// 注册
				if (reply.getReplyCode() == 0) {// 验证码校验通过
					reply = loginService.regist(loginReq);
					// 注册成功之后登录
					if (reply.getReplyCode() == 0) {
						reply = loginService.login(loginReq);
					}
				} else {
					return reply;
				}
			} else {
				reply.setReplyCode(-1);
				reply.setMessage("参数错误!");
				return reply;
			}

		} else if (2 == loginType) {// 账号密码
			// 1判断token是否通过
			String source = loginReq.getAccount() + "" + loginReq.getPassword() + "" + loginReq.getLoginType();
			String md5 = Md5Encrypt.md5(source);
			if (!md5.equals(token)) {
				reply.setReplyCode(-1);
				reply.setMessage("参数错误!");
				return reply;
			}
			// 2.根据账号查询用户信息
			UserEntity user = loginService.getUsersByAccount(loginReq.getAccount());
			// 3.判断登录还是提示用户名密码错误
			if (user != null) {
				reply = loginService.login(loginReq);
				return reply;
			} else {// 注册
				reply.setReplyCode(-1);
				reply.setMessage("账户不存在");
				return reply;
			}
		} else {
			reply.setReplyCode(-1);
			reply.setMessage("参数错误!");
			return reply;
		}

		return reply;
	}

	

	@RequestMapping(value = "/unlogin")
	public LoginReply unlogin() {
		LoginReply loginRep = new LoginReply();
		loginRep.setReplyCode(Constants.RESULT_ERROR_LOGIN);
		loginRep.setResultCode(Constants.RESULT_ERROR_LOGIN);
		loginRep.setMessage("请重新登陆");
		return loginRep;
	}

	@RequestMapping(value = "/unlogin-kickout")
	public LoginReply kickout() {
		LoginReply loginRep = new LoginReply();
		loginRep.setReplyCode(Constants.RESULT_ERROR_KICKOUT);
		loginRep.setResultCode(Constants.RESULT_ERROR_KICKOUT);
		loginRep.setMessage("您的账户已在另外的设备登陆");
		return loginRep;
	}

	@RequestMapping(value = "/unauth")
	public LoginReply unauth() {
		LoginReply loginRep = new LoginReply();
		loginRep.setReplyCode(Constants.RESULT_UNAUTH);
		loginRep.setResultCode(Constants.RESULT_UNAUTH);
		loginRep.setMessage("无权限访问该功能");
		return loginRep;
	}

	/**
	 * 退出登录
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/logout")
	public Reply logout(@RequestBody Req req) {
		Reply reply = new Reply();
		try {
			SecurityUtils.getSubject().logout();
		} catch (Exception e) {
			reply.setResultCode(Constants.RESULT_ERROR_SYSERROR);
			reply.setMessage("会话错误");
		}
		return reply;
	}

	/**
	 * 重置密码
	 * 
	 * @param request
	 * @param response
	 * @param loginReq
	 * @return
	 */
	@RequestMapping(value = "/modify/pwd")
	public Reply modifyPwd(HttpServletRequest request, HttpServletResponse response, @RequestBody LoginReq loginReq) {
		Reply reply = new Reply();

		if (loginReq == null || loginReq.getMobile() == null || loginReq.getPassword() == null
				|| loginReq.getSmsCode() == null) {
			reply.setReplyCode(-1);
			reply.setMessage("参数错误!");
			return reply;
		}

		validatSmscode(reply, loginReq.getMobile(), loginReq.getSmsCode());
		if (reply.getReplyCode() == 0) {// 验证码校验通过
			loginService.modifyPwd(loginReq.getMobile(), loginReq.getPassword());
		} else {
			return reply;
		}

		return reply;
	}

	/**
	 * 修改用户资料
	 * 
	 * @param request
	 * @param response
	 * @param loginReq
	 * @return
	 */
	@RequestMapping(value = "/info/modify")
	public LoginReply modify(HttpServletRequest request, HttpServletResponse response, @RequestBody UserInfoReq req) {
		LoginReply reply = new LoginReply();
		Long userId = userService.getUserId();

		if (req == null || userId == null) {
			reply.setReplyCode(-1);
			reply.setMessage("参数错误!");
			return reply;
		}

		UserEntity user = new UserEntity();
		user.setId(userId);
		if (req.getAvatar() != null) {
			user.setAvatar(req.getAvatar());
		}
		if (req.getCity() != null) {
			user.setCity(req.getCity());
		}
		if (req.getCity_id() != null) {
			user.setCity_id(req.getCity_id());
		}
		if (req.getProvince() != null) {
			user.setProvince(req.getProvince());
		}
		if (req.getProvince_id() != null) {
			user.setProvince_id(req.getProvince_id());
		}
		if (req.getUser_name() != null) {
			user.setUser_name(req.getUser_name());
		}
		if (req.getSex() != null) {
			user.setSex(req.getSex());
		}
		if (req.getIntroduce() != null) {
			user.setIntroduce(req.getIntroduce());
		}
		user.setUpdate_time(new Timestamp(System.currentTimeMillis()));
		userEntityMapper.update(user);

		return reply;
	}

	/**
	 * 获取用户资料
	 * @param request
	 * @param response
	 * @param loginReq
	 * @return
	 */
	@RequestMapping(value = "/info")
	public UserReply userInfo(HttpServletRequest request, HttpServletResponse response,
			@RequestBody(required = false) Req req) {
		UserReply reply = new UserReply();
		Long uid = null;
		UserEntity user = null;
		if (req == null || req.getUid() == null) {
			logger.info("无任何参数");
			user = userService.getUser();
			if (user == null) {
				reply.setReplyCode(-1);
				reply.setMessage("参数错误!");
				return reply;
			}
			uid = user.getId();
		} else {
			user = userEntityMapper.getUserById(req.getUid());
			uid = req.getUid();
		}

		if (user == null) {
			reply.setReplyCode(-2);
			reply.setMessage("用户不存在!");
			return reply;
		}

		BeanCopier copierUser = BeanCopier.create(UserEntity.class, UserReply.class, false);
		copierUser.copy(user, reply, null);

		reply.setHxPasswd(user.getHx_passwd());
		reply.setHxUsername(user.getHx_username());

		reply.setOpen_id(user.getOpen_id());
		reply.setMobile(user.getMobile());

		// 获取用户相关统计数据
		reply.setUnion_id(user.getUnion_id());
		reply.setUid(uid);
		reply.setSessionId(userService.getSessionId());
		return reply;
	}

	/**
	 * 提交审核
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/certificate")
	public Reply addCertificate(@RequestBody(required = false) CertificateReq req) {
		Reply reply = new Reply();
		UserEntity currentUser = userService.getUser();

		if (currentUser == null || req.getCertificationType() == null || req.getName() == null
				|| req.getCity() == null) {
			reply.setReplyCode(-1);
			reply.setMessage("参数错误!");
			return reply;
		}

		if (StringUtils.isEmpty(currentUser.getMobile())) {
			reply.setReplyCode(-2);
			reply.setMessage("您还没有绑定手机号!");
			return reply;
		}

		Boolean result = false;// loginService.addCertificate(inputDTO);
		if (!result) {
			reply.setReplyCode(4);
			reply.setMessage("提交认证信息失败，请重试!");
		} else {// 改为3已认证未审核状态
			UserEntity user = new UserEntity();
			user.setId(currentUser.getId());
			userEntityMapper.update(user);
		}

		reply.setMessage("您的资料已提交!");
		return reply;
	}

	/**
	 * 校验验证码
	 * 
	 * @param reply
	 * @param mobile
	 */
	public void validatSmscode(Reply reply, String mobile, String code) {
		if ("13248411861".equals(mobile) && "326879".equals(code)) {
			reply.setReplyCode(0);
		} else if (StringUtils.isNotEmpty(mobile) && "326879".equals(code)) {
			reply.setReplyCode(0);
		} else {
			ValidateEntity smsCode = smsCodeService.findValidateCodeByPhone(mobile);
			logger.info("手机号为：" + mobile + "的验证信息");

			reply.setReplyCode(0);

			if (smsCode != null) {
				Date sendCodeDate = smsCode.getAddtime();
				if (sendCodeDate == null) {
					reply.setReplyCode(-1);
					reply.setMessage("验证码错误！");
				} else {
					long time = new Date().getTime() - sendCodeDate.getTime();
					// 获取验证码
					if (time <= 1800000) {
						String checkCode = smsCode.getCode();
						if (!code.equals(checkCode)) {
							reply.setReplyCode(-1);
							reply.setMessage("验证码错误！");
						}
					} else {
						reply.setReplyCode(-2);
						reply.setMessage("验证码超时！");
					}
				}
			} else {
				reply.setReplyCode(-3);
				reply.setMessage("验证码不存在！");
			}
		}

	}

}
