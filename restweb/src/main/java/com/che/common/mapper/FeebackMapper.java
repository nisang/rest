package com.che.common.mapper;

import org.apache.ibatis.annotations.Insert;

import com.che.common.entity.Feedback;

public interface FeebackMapper {

	@Insert({
		"insert into tb_feedback (uid,phone,content,imageurl,create_time)",
		" value(#{uid},#{phone},#{content},#{imageurl},NOW())"
	})
	int addfeeback(Feedback feedback);
}
