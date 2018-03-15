package com.che.user.service;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.che.common.id.IdWorker;
import com.che.common.util.EmojiUtil;
import com.che.common.util.InviteCodeRule;
import com.che.common.util.Md5Encrypt;
import com.che.common.util.RandomUtil;
import com.che.common.util.SHA1;
import com.che.common.web.Constants;
import com.che.config.security.AccountAuthenticationToken;
import com.che.config.security.MobileAuthenticationToken;
import com.che.config.security.OpenWeixinAuthenticationToken;
import com.che.config.security.WeiXinUnionAuthenticationToken;
import com.che.user.entity.UserEntity;
import com.che.user.entity.UserExtEntity;
import com.che.user.mapper.UserEntityMapper;
import com.che.user.mapper.UserExtMapper;
import com.che.user.pojo.LoginReply;
import com.che.user.pojo.LoginReq;
/**
 * @author karlhell
 *
 */
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserEntityMapper userEntityMapper;
	
	@Autowired
	private UserEntityMapper userMapper;
	
	@Autowired
	private UserService userCommonService;
	
	@Autowired
	private UserExtMapper userExtMapper; 
	
    @Autowired
    private IdWorker idWorker;
    
	@Override
	public UserEntity getUsersByMobile(String mobile) {
		return userEntityMapper.getUsersByMobile(mobile);
	}
	@Override
	public UserEntity getUsersByAccount(String account) {
		return userEntityMapper.getUsersByAccount(account);
	}
	@Override
	public UserEntity getUserByOpenId(String open_id) {
		return userEntityMapper.getUserByOpenId(open_id);
	}
	
	@Override
	public UserEntity getUserByUnionId(String union_id) {
		return userEntityMapper.queryUserbyUnionnId(union_id);
	}
	@Override
	public LoginReply login(LoginReq req) {
		LoginReply reply = new LoginReply();
		AuthenticationToken token = null;
		if(1 == req.getLoginType()){
			 token = new MobileAuthenticationToken(req.getMobile(), null , true);
		}else if(2 == req.getLoginType()){
			 token = new AccountAuthenticationToken(req.getAccount(), req.getPassword() , true);
		}
		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.logout();
			currentUser.login(token);
			// 登录成功
			UserEntity user = (UserEntity) currentUser.getPrincipal();
			reply.setSessionId(userCommonService.getSessionId());
			reply.setUid(user.getId()+"");
			String openId = StringUtils.isEmpty(user.getOpen_id())?"":user.getOpen_id();
			reply.setOpen_id(openId);
			reply.setUserName(user.getUser_name());
			reply.setAvatar(user.getAvatar());
			reply.setSex(user.getSex());
			reply.setCity(user.getCity());
			reply.setProvince(user.getProvince());
			reply.setMobile(user.getMobile());
			reply.setIntroduce(user.getIntroduce());
			reply.setUnion_id(user.getUnion_id());
			//需要补充的数据
			reply.setAmount(0.00);
			reply.setCompanyId(1);
			reply.setMianuser(0);
		} catch (AuthenticationException e) {
			String mes = e.getMessage();
			reply.setReplyCode(-2);
			reply.setMessage("登录系统错误");
			if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ERRORTOKEN + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ERRORTOKEN);
				reply.setMessage("帐号信息有误，请您核对后再重试。");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_UNKOWNSOURCE + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_UNKOWNSOURCE);
				reply.setMessage("未知的用户 类型");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ACCOUNTDISABLED + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ACCOUNTDISABLED);
				reply.setMessage("用户不可用");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ACCOUNTNOTEXISTS + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ACCOUNTNOTEXISTS);
				reply.setMessage("您的帐号还未绑定手机号码");
			} else {
				reply.setReplyCode(Constants.AUTHEXCEPTION_OTHER);
				reply.setMessage("帐号或密码错误，请您核对后再重试。");
			}
		}

		return reply;
	}
	
	/**
	 * 微信登录
	 * @param req
	 * @return
	 */
	@Override
	public LoginReply loginv2(LoginReq req) {
		LoginReply reply = new LoginReply();
		AuthenticationToken token = new WeiXinUnionAuthenticationToken(req.getUnion_id(), null, true);
		
		if(req.getLoginType() == 0){
			token = new MobileAuthenticationToken(req.getMobile(), req.getPassword(), true);
		}

		Subject currentUser = SecurityUtils.getSubject();

		try {
			currentUser.logout();
			currentUser.login(token);
			// 登录成功
			UserEntity user = (UserEntity) currentUser.getPrincipal();
			reply.setSessionId(userCommonService.getSessionId());
			reply.setUid(user.getId()+"");
			String openId = StringUtils.isEmpty(user.getOpen_id())?"":user.getOpen_id();
			reply.setOpen_id(openId);
			reply.setUnion_id(user.getUnion_id());
			reply.setUserName(user.getUser_name());
			reply.setAvatar(user.getAvatar());
			reply.setSex(user.getSex());
			reply.setCity(user.getCity());
			reply.setProvince(user.getProvince());
			reply.setMobile(user.getMobile());
			reply.setIntroduce(user.getIntroduce());
		} catch (AuthenticationException e) {
			String mes = e.getMessage();
			reply.setReplyCode(-2);
			reply.setMessage("登录系统错误");
			if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ERRORTOKEN + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ERRORTOKEN);
				reply.setMessage("帐号信息有误，请您核对后再重试。");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_UNKOWNSOURCE + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_UNKOWNSOURCE);
				reply.setMessage("未知的用户 类型");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ACCOUNTDISABLED + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ACCOUNTDISABLED);
				reply.setMessage("用户不可用");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ACCOUNTNOTEXISTS + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ACCOUNTNOTEXISTS);
				reply.setMessage("您的帐号还未绑定手机号码");
			} else {
				reply.setReplyCode(Constants.AUTHEXCEPTION_OTHER);
				reply.setMessage("帐号或密码错误，请您核对后再重试。");
			}
		}

		return reply;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public LoginReply regist(LoginReq req) {
		LoginReply reply = new LoginReply();
		String mobile = req.getMobile();
		String unionId = req.getUnion_id()==null?"":req.getUnion_id();
		String openId = req.getOpen_id()==null?"":req.getOpen_id();
		int source = 0;
		Long userId = idWorker.nextId();
		//生成唯一的邀请码
		String inviteCode = RandomStringUtils.randomAlphanumeric(8);
		while(hasSameCode(inviteCode) > 0){
			inviteCode = RandomStringUtils.randomAlphanumeric(8);
		}
		String account = "kc"+RandomUtil.setRandom8();
		String userName = req.getUserName()!=null?req.getUserName():"";
		String avatar = req.getAvatar()!=null?req.getAvatar():"http://static.che.com/checdn/app/aichegujia/img/avatar.png";
		Integer sex = req.getSex()!=null?req.getSex():-1;
		String city = req.getCity()!=null?req.getCity():"";
		Long cityId = req.getCity_id()!=null?req.getCity_id():0L;
		String prevince = req.getProvince()!=null?req.getProvince():"";
		Long previnceId = req.getProvince_id()!=null?req.getProvince_id():0L;
		String introduce = req.getIntroduce()!=null?req.getIntroduce():"";
//		userName = "快车"+InviteCodeRule.generate();
		String password = SHA1.encode("123456");
		userEntityMapper.regist(userId,account,password, userName,mobile, openId,unionId, inviteCode, avatar,
				sex, city, cityId,prevince ,
				previnceId, introduce,source);
		UserExtEntity userExt = new UserExtEntity();
		userExt.setUid(userId);
		userExt.setQuota(0.00);
		userExt.setRemain_quota(0.00);
		userExtMapper.insert(userExt);
		return reply;
	}
	
	
	
	/**
	 * 只有微信注册
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public LoginReply registv2(LoginReq req) {
		LoginReply reply = new LoginReply();
		String unionId = req.getUnion_id()==null?"":req.getUnion_id();
		String mobile = "";
		if((req.getPlatform()==1 || req.getPlatform()==2) && req.getMobile()!=null && StringUtils.isNotEmpty(req.getMobile())){
			mobile = req.getMobile();
			//
		}
		int source = 0;
		//验证手机号是否注册过
		String openId = req.getOpen_id()==null?"":req.getOpen_id();
		try{
			if(StringUtils.isNotEmpty(openId)){
				UserEntity userEntity = userEntityMapper.getUsersByOpenId(openId);
				//更新union_id
				if(userEntity!=null && StringUtils.isEmpty(userEntity.getUnion_id())){
					userEntityMapper.updateUnionUser(unionId,openId);
				}
				
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		UserEntity userEntity = userEntityMapper.getUsersByUnionId(unionId);
		if(null != userEntity){
			reply.setReplyCode(-14);
			reply.setMessage("该微信账号已绑定");
			return reply;
		}else{//注册
			if((req.getPlatform()==1 || req.getPlatform()==2) && req.getMobile()!=null && StringUtils.isNotEmpty(req.getMobile())){
				//直接更新数据
				UserEntity user = userEntityMapper.queryUserPhone(mobile);
				if(user!=null && (user.getUnion_id()==null || StringUtils.isEmpty(user.getUnion_id()))){
					user.setUnion_id(req.getUnion_id());
					user.setOpen_id(req.getOpen_id());
					req.setUserName(EmojiUtil.parse(req.getUserName()));
					userEntityMapper.updateWxUserByMobile(user.getId(), unionId, openId, req.getAvatar(), req.getSex(), req.getCity(), req.getProvince(), req.getIntroduce(), req.getUserName());
					return reply;
				}
			}
			Long userId = idWorker.nextId();
//			Long inviterId = null;
			Long code = null;
			Integer authStatus = 0;//0未校验
			
			//生成唯一的邀请码
			String inviteCode = RandomStringUtils.randomAlphanumeric(8);
			while(hasSameCode(inviteCode) > 0){
				inviteCode = RandomStringUtils.randomAlphanumeric(8);
			}
			String account = "kc"+RandomStringUtils.randomAlphanumeric(8);
			String hxUsername = "acgj"+(Md5Encrypt.md5(unionId).substring(0,9));
			String hxUserPasswd = InviteCodeRule.generate();//Md5Encrypt.md5(hxUsername);
			String userName = req.getUserName()!=null?req.getUserName():"";
			String password = SHA1.encode("123456");
			userEntityMapper.regist(userId,account,password, userName , mobile, req.getOpen_id(),unionId,  inviteCode, req.getAvatar()!=null?req.getAvatar():"",
					req.getSex()!=null?req.getSex():-1, req.getCity()!=null?req.getCity():"", req.getCity_id()!=null?req.getCity_id():0L, req.getProvince()!=null?req.getProvince():"",
					req.getProvince_id()!=null?req.getProvince_id():0L, req.getIntroduce()!=null?req.getIntroduce():"",source);

		//添加用户辅助表记录
			UserExtEntity userExt = new UserExtEntity();
			userExt.setUid(userId);
			userExtMapper.insert(userExt);

		}
		return reply;
	}
	@Override
	public void modifyPwd(String mobile, String password) {
		userEntityMapper.modifyPwd(mobile, password);
	}

	
	@Override
	public int hasSameCode(String inviteCode) {
		return userEntityMapper.hasSameCode(inviteCode);
	}

	@Override
	public Long getUserIdByInviteCode(String inviteCode) {
		return userEntityMapper.getUserIdByInviteCode(inviteCode);
	}

	
	@Override
	public LoginReply loginbyWpOpenId(LoginReq req) {
		LoginReply reply = new LoginReply();
		AuthenticationToken token = new OpenWeixinAuthenticationToken(req.getOpen_id(), null, true);
		
		if(req.getLoginType() == 0){
			token = new MobileAuthenticationToken(req.getMobile(), req.getPassword(), true);
		}

		Subject currentUser = SecurityUtils.getSubject();

		try {
			currentUser.logout();
			currentUser.login(token);
			// 登录成功
			UserEntity user = (UserEntity) currentUser.getPrincipal();
			reply.setSessionId(userCommonService.getSessionId());
			reply.setUid(user.getId()+"");
			reply.setOpen_id(user.getOpen_id());
			reply.setUserName(user.getUser_name());
			reply.setAvatar(user.getAvatar());
			reply.setSex(user.getSex());
			reply.setCity(user.getCity());
			reply.setProvince(user.getProvince());
			reply.setMobile(user.getMobile());
			reply.setIntroduce(user.getIntroduce());
			
		} catch (AuthenticationException e) {
			String mes = e.getMessage();
			reply.setReplyCode(-2);
			reply.setMessage("登录系统错误");
			if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ERRORTOKEN + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ERRORTOKEN);
				reply.setMessage("帐号信息有误，请您核对后再重试。");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_UNKOWNSOURCE + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_UNKOWNSOURCE);
				reply.setMessage("未知的用户 类型");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ACCOUNTDISABLED + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ACCOUNTDISABLED);
				reply.setMessage("用户不可用");
			} else if (StringUtils.equals(mes, Constants.AUTHEXCEPTION_ACCOUNTNOTEXISTS + "")) {
				reply.setReplyCode(Constants.AUTHEXCEPTION_ACCOUNTNOTEXISTS);
				reply.setMessage("您的帐号还未绑定手机号码");
			} else {
				reply.setReplyCode(Constants.AUTHEXCEPTION_OTHER);
				reply.setMessage("帐号或密码错误，请您核对后再重试。");
			}
		}

		return reply;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public LoginReply registWx(LoginReq req) {
		LoginReply reply = new LoginReply();
		String openId = req.getOpen_id();
		String unionId = req.getUnion_id();
		//验证手机号是否注册过
		UserEntity userEntity = userEntityMapper.getUsersByUnionId(unionId);
		if(null != userEntity){
			reply.setReplyCode(-14);
			reply.setMessage("您的手机号已被绑定！");
			return reply;
		}else{//注册    
			Long userId = idWorker.nextId();
//			Long inviterId = null;
			Long code = null;
			Integer authStatus = 0;//0未校验
			
			//生成唯一的邀请码
			String inviteCode = RandomStringUtils.randomAlphanumeric(8);
			while(hasSameCode(inviteCode) > 0){
				inviteCode = RandomStringUtils.randomAlphanumeric(8);
			}
			String hxUsername = "aichegujia"+openId;
			String hxUserPasswd = InviteCodeRule.generate();//Md5Encrypt.md5(hxUsername);
			String userName = req.getUserName()!=null?req.getUserName():"爱估"+inviteCode;
			int source = req.getLoginType();
			//注册用户 来自微信公众号
			userEntityMapper.registByOpenId(userId, userName , "", openId, unionId,code, authStatus, inviteCode, req.getAvatar()!=null?req.getAvatar():"",
					req.getSex()!=null?req.getSex():-1, req.getCity()!=null?req.getCity():"", req.getCity_id()!=null?req.getCity_id():0L, req.getProvince()!=null?req.getProvince():"",
					req.getProvince_id()!=null?req.getProvince_id():0L, req.getIntroduce()!=null?req.getIntroduce():"",hxUsername,hxUserPasswd,source);

		//添加用户辅助表记录
			UserExtEntity userExt = new UserExtEntity();
			userExt.setUid(userId);
			userExtMapper.insert(userExt);

		}
		return reply;
	}

	
}
