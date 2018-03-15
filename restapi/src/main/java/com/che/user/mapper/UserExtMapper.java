package com.che.user.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.che.user.entity.UserExtEntity;

public interface UserExtMapper {

	@Select(" select * from tb_user_ext where uid = #{uid}")
	UserExtEntity getUserExtById(Long uid);
	   
    @Insert({"INSERT INTO `tb_user_ext` (`uid`, `quota`,`remain_quota`,`create_time`) VALUES (#{uid},#{quota},#{remain_quota}, NOW())"})
    void insert(UserExtEntity userExt);
    
	@Update({"<script>",
		" UPDATE `tb_user_ext`" ,
		" <set> " ,
		" <if test=\"quota != null\"> `quota`= #{quota}, </if> " ,
		" <if test=\"remain_quota != null\"> `remain_quota` = #{remain_quota} , </if> " ,
		" <if test=\"create_time	!= null\"> `create_time` = #{create_time} , </if> " ,
		" <if test=\"update_time != null\"> `update_time` = #{update_time}	 , </if> " ,
		" </set> WHERE " ,
		" `uid` = #{uid} ",
	    "</script>"})
	void update(UserExtEntity userExt);
	
	@Update({"<script>",
		" UPDATE `tb_user_ext`" ,
		" <set> " ,
		" `assess_car_num` = `assess_car_num`+1,",
		" `update_time` = now() ",
		" </set> WHERE " ,
		" `uid` = #{uid} ",
	    "</script>"})
	void addAssessTotal(@Param("uid") Long uid);
	
	@Update({"<script>",
		" UPDATE `tb_user_ext`" ,
		" <set> " ,
		" `public_car_total`	= `public_car_total`+1 , " ,
		" `update_time` = now() , " ,
		" </set> WHERE " ,
		" `uid` = #{uid} ",
	    "</script>"})
	void addCarTotal(@Param("uid") Long uid);
	
	@Update({"<script>",
		" UPDATE `tb_user_ext`" ,
		" <set> " ,
		" `order_car_total` = `order_car_total`+1 , " ,
		" `update_time` = now()	, " ,
		" </set> WHERE " ,
		" `uid` = #{uid} ",
	    "</script>"})
	void addOrderTotal(@Param("uid") Long uid);
	
	@Update({
		" update tb_user_ext",
		" set invite_time=invite_time+1",
		" where uid=#{uid}"
	})
	int updateInviteTimeByUid(@Param("uid") Long uid);
}