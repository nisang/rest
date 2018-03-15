package com.che.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.che.common.web.service.SmsSendLog;
import com.che.rw.annotation.Master;
import com.che.rw.annotation.Slave;



public interface SmsLogMapper {

	
	@Slave
	@Select("select * from s_sms_send_log a where a.mobile = #{0} and isSuccess='success' order by addTime desc limit 0,#{1}")
	public List<SmsSendLog> querySendNum(String mobile, Integer limit);
	
	@Master
	@Insert({"<script>INSERT INTO s_sms_send_log <trim prefix='(' suffix=')' suffixOverrides=',' >",
		"<if test='addTime != null'>addTime,</if>",
		"<if test='mobile != null'>mobile,</if>",
		"<if test='smsContent != null'>smsContent,</if>",
		"<if test='isSuccess != null'>isSuccess,</if>",
		"<if test='remark != null'>remark,</if>",
		"<if test='source != null'>source,</if></trim>",
		"<trim prefix='values (' suffix=')' suffixOverrides=',' >",
		"<if test='addTime != null'>#{addTime,jdbcType=TIMESTAMP},</if>",
		"<if test='mobile != null'>#{mobile,jdbcType=VARCHAR},</if>",
		"<if test='smsContent != null'>#{smsContent,jdbcType=VARCHAR},</if>",
		"<if test='isSuccess != null'>#{isSuccess,jdbcType=VARCHAR},</if>",
		"<if test='remark != null'>#{remark,jdbcType=VARCHAR},</if>",
		"<if test='source != null'>#{source,jdbcType=VARCHAR},</if></trim></script>"})
		public void save(SmsSendLog ssl); 
}
