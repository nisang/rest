package com.che.user.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.che.user.entity.ValidateEntity;

/**
 * @Description: 验证码
 * @author wangyanlong
 * @date 2015-12-10下午1:04:41
 */
public interface SmsCodeMapper {

	/**
	 * 保存验证码
	 */
	@Insert("INSERT INTO t_auth_validate(addtime,destination,code) VALUES(NOW(),#{destination},#{code})")
	public void saveValidateCode(ValidateEntity vate);

	/**
	 * 删除验证码
	 */
	@Delete("DELETE FROM t_auth_validate WHERE destination =#{phone}")
	public void deleteValidateCode(String phone);

	/**
	 * 查询验证码
	 */
	@Select("SELECT * FROM t_auth_validate WHERE destination=#{phone} order by addtime desc limit 0,1 ")
	public ValidateEntity findValidateCodeByPhone(String phone);
}
