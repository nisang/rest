package com.che.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.che.user.entity.UserEntity;
import com.che.user.pojo.FriendEntity;
import com.che.user.pojo.FriendRepEntity;
import com.che.user.pojo.LoginReq;

public interface UserEntityMapper {

	@Select(" select * from tb_user where id = #{id} and user_status=0")
	UserEntity getUserById(Long id);
	
	@Select(" select * from tb_user where code = #{code} and user_status=0")
	UserEntity getUserByCode(Long code);
	
    @Insert({"INSERT INTO `tb_user` ",
         "(`id`,`account`,`password`,`user_name`, `mobile`, `open_id`,`union_id`,`invite_code`,`avatar`,`sex`,`city`,`city_id`,`province`,`province_id`,`introduce`, `create_time`,`source`) VALUES "
         + "(#{id},#{account},#{password}, #{userName}, #{mobile}, #{open_id},#{union_id}, #{inviteCode}, #{avatar},#{sex},#{city},#{city_id},#{province},#{province_id},#{introduce}, now(),#{source})"})
    int regist(@Param("id") Long id,@Param("account") String account,@Param("password") String password,@Param("userName") String userName, @Param("mobile") String mobile, @Param("open_id") String open_id,@Param("union_id") String unionId
		 , @Param("inviteCode") String inviteCode, @Param("avatar") String avatar
		 ,@Param("sex") Integer sex, @Param("city") String city, @Param("city_id") Long city_id, @Param("province") String province, 
		 @Param("province_id") Long province_id, @Param("introduce") String introduce, @Param("source") int source);
    
    @Insert({"INSERT INTO `tb_user` ",
        "(`id`,`user_name`, `mobile`, `open_id_mp`,`union_id`,`code`,`auth_status`,`invite_code`,`avatar`,`sex`,`city`,`city_id`,`province`,`province_id`,`introduce`, `create_time`,`hx_username`,`hx_passwd`,`source`) VALUES "
        + "(#{id}, #{userName}, #{mobile}, #{open_id},#{union_id},#{code}, #{authStatus}, #{inviteCode}, #{avatar},#{sex},#{city},#{city_id},#{province},#{province_id},#{introduce}, now(),#{hxusername},#{hxpasswd},#{source})"})
   int registByOpenId(@Param("id") Long id,@Param("userName") String userName, @Param("mobile") String mobile, @Param("open_id") String open_id,@Param("union_id") String unionId
		 , @Param("code") Long code, @Param("authStatus") Integer authStatus, @Param("inviteCode") String inviteCode, @Param("avatar") String avatar
		 ,@Param("sex") Integer sex, @Param("city") String city, @Param("city_id") Long city_id, @Param("province") String province, 
		 @Param("province_id") Long province_id, @Param("introduce") String introduce, @Param("hxusername") String hxUsername, @Param("hxpasswd") String hxUserPasswd, @Param("source") int source);
	   

    @Select({"<script>",
		"select * from tb_user where mobile = #{mobile} and user_status=0 limit 1" ,
		"</script>"})
	UserEntity getUsersByMobile(@Param("mobile") String mobile);
    @Select({"<script>",
		"select * from tb_user where account = #{account} and user_status=0 limit 1" ,
		"</script>"})
	UserEntity getUsersByAccount(@Param("account") String account);
    
    @Select({"<script>",
		"select * from tb_user where open_id = #{openId} limit 1" ,
		"</script>"})
	UserEntity getUsersByOpenId(@Param("openId") String openId);
    
    @Select({"<script>",
		"select * from tb_user where union_id = #{unionId} limit 1" ,
		"</script>"})
	UserEntity getUsersByUnionId(@Param("unionId") String unionId);
    
	@Update({"<script>",
		" UPDATE `tb_user`" ,
		" <set> " ,
		" <if test=\"user_name != null\"> `user_name` = #{user_name} , </if> " ,
		" <if test=\"mobile	!= null\"> `mobile` = #{mobile} , </if> " ,
		" <if test=\"avatar != null\"> `avatar` = #{avatar}	 , </if> " ,
		" <if test=\"sex != null\"> `sex` = #{sex} , </if> " ,
		" <if test=\"city != null\"> `city`	= #{city} , </if> " ,
		" <if test=\"city_id != null\"> `city_id` = #{city_id} , </if> " ,
		" <if test=\"province != null\"> `province`	= #{province} , </if> " ,
		" <if test=\"province_id != null\"> `province_id` = #{province_id} , </if> " ,
		" <if test=\"inviter_id != null\"> `inviter_id`	= #{inviter_id} , </if> " ,
		" <if test=\"invite_code != null\"> `invite_code` = #{invite_code} , </if> " ,
		" <if test=\"introduce != null\"> `introduce` = #{introduce} , </if> " ,
		" <if test=\"update_time != null\"> `update_time` = #{update_time} , </if> " ,
		" </set> WHERE " ,
		" (`id` = #{id}) ",
	    "</script>"})
	void update(UserEntity user);
	
	@Update({"<script>",
		" UPDATE `tb_user`" ,
		" <set> " ,
		" <if test=\"password != null\"> `password`= #{password}, </if> " ,
		" </set> WHERE " ,
		" (`mobile` = #{mobile}) ",
	    "</script>"})
	void modifyPwd(@Param("mobile") String mobile, @Param("password") String password);

	@Select(" select count(1) from tb_user where invite_code = #{inviteCode} and user_status=0")
	int hasSameCode(String inviteCode);
	
	@Select(" select id from tb_user where invite_code = #{inviteCode} and user_status=0")
	Long getUserIdByInviteCode(String inviteCode);
	
	@Update({"<script>",
		" UPDATE `tb_user`" ,
		" <set> " ,
		" <if test=\"user_name != null\"> `user_name` = #{user_name} , </if> " ,
		" <if test=\"account != null\"> `account`	= #{account}	 , </if> " ,
		" <if test=\"bail != null\"> `bail`	= #{bail}	 , </if> " ,
		" <if test=\"mobile	!= null\"> `mobile` = #{mobile} , </if> " ,
		" <if test=\"avatar != null\"> `avatar` = #{avatar}	 , </if> " ,
		" <if test=\"sex != null\"> `sex` = #{sex} , </if> " ,
		" <if test=\"city != null\"> `city`	= #{city} , </if> " ,
		" <if test=\"city_id != null\"> `city_id` = #{city_id} , </if> " ,
		" <if test=\"province != null\"> `province`	= #{province} , </if> " ,
		" <if test=\"province_id != null\"> `province_id` = #{province_id} , </if> " ,
		" <if test=\"auth_status != null\"> `auth_status` = #{auth_status} , </if> " ,
		" <if test=\"user_status != null\"> `user_status` = #{user_status} , </if> " ,
		" <if test=\"inviter_id != null\"> `inviter_id`	= #{inviter_id} , </if> " ,
		" <if test=\"invite_code != null\"> `invite_code` = #{invite_code} , </if> " ,
		" <if test=\"introduce != null\"> `introduce` = #{introduce} , </if> " ,
		" <if test=\"create_time != null\"> `create_time` = #{create_time} , </if> " ,
		" <if test=\"update_time != null\"> `update_time` = #{update_time} , </if> " ,
		" </set> WHERE " ,
		" (`code` = #{code}) ",
	    "</script>"})
	void updateByCode(UserEntity user);
	
	@Select("select ta.name from tb_user_achievement tu left join tb_achievement_system ta on tu.achieve_id = ta.id where uid = #{uid}")
	List<String> getAchievementsByUid(Long uid);
	
	//////////////////////////////////以上为1.0.0版本//////////////////////////////////
	
	@Select({"<script>",
		"select ",
		" tu.id uid,",
		"tu.mobile mobile,",
		"tu.user_name userName,",
		"ext.public_car_total publicCarTotal,",
		"tu.avatar avatar",
		" from tb_user tu",
		" left join tb_user_ext ext on tu.id=ext.uid",
		" where tu.mobile in ",
		" <foreach collection='list' item='phones' index='index' open='(' separator=',' close=')'>",
		"  #{phones.mobile}  ",
		" </foreach>",
	"</script>"})
	List<FriendRepEntity> queryFriends(List<FriendEntity> phones);
	
	
    @Select({"<script>",
		"select * from tb_user where open_id = #{open_id} and user_status=0 limit 1" ,
		"</script>"})
	UserEntity getUserByOpenId(@Param("open_id") String open_id);
    
    @Select({"<script>",
		"select * from tb_user where union_id = #{unionId} limit 1" ,
		"</script>"})
	UserEntity queryUserbyUnionnId(@Param("unionId") String unionId);
	@Select({
		" select",
		" * ",
		" from",
		" tb_user",
		" where open_id=#{openId} and user_status=0 limit 1"
	})
	UserEntity queryUserbyOpenId(@Param("openId") String openId);
	
	@Select({
		" select",
		" * ",
		" from",
		" tb_user",
		" where hx_username=#{hxName} and user_status=0 limit 1"
	})
	UserEntity queryUserbyhxName(@Param("hxName") String hxName);
	
	
	@Select({
		"select * from tb_user where mobile=#{mobile} limit 0,1"
	})
	UserEntity queryUserPhone(@Param("mobile") String mobile);
	
	@Update({
		"update tb_user set mobile=#{mobile} where id=#{uid}",
	""})
	int updateUserMobile(@Param("uid") Long uid,@Param("mobile") String mobile);
	
	@Update({
		"update tb_user set union_id=#{unionId} where open_id=#{openId}"
	})
	int updateUnionUser(@Param("unionId") String unionId,@Param("openId") String openId);
	@Update({
		"<script>",
		"update tb_user ",
		" <set> " ,
		" <if test=\"unionId != null\"> `union_id`= #{unionId}, </if> " ,
		" <if test=\"openId != null\"> `open_id`= #{openId}, </if> " ,
		" <if test=\"avatar != null\"> `avatar`= #{avatar}, </if> " ,
		" <if test=\"sex != null\"> `sex`= #{sex}, </if> " ,
		" <if test=\"city != null\"> `city`= #{city}, </if> " ,
		" <if test=\"province != null\"> `province`= #{province}, </if> " ,
		" <if test=\"introduce != null\"> `introduce`= #{introduce}, </if> " ,
		" <if test=\"userName != null\"> `user_name`= #{userName} </if> " ,
		"</set> where id=#{uid}",
		"</script>"
	})
	int updateWxUserByMobile(@Param("uid") Long uid,
			@Param("unionId") String unionId,
			@Param("openId") String openId,
			@Param("avatar") String avatar,
			@Param("sex") int sex,
			@Param("city") String city,
			@Param("province") String province,
			@Param("introduce") String introduce,
			@Param("userName") String userName
			);
	
	@Update({
		"update tb_user set open_id=#{open_id},union_id=#{union_id},user_name=#{userName},",
		"avatar=#{avatar},sex=#{sex},province=#{province},city=#{city},introduce=#{introduce},update_time=NOW()",
		"where id=#{uid}",
	""})
	int updateUserWeixinInfo(LoginReq req);
	
	/**
	 * 更新公众号平台里的open_id
	 * @param uid
	 * @param open_id
	 * @return
	 */
	@Update({"<script>",
		"update tb_user set open_id_mp=#{open_id} where id=#{uid}",
		"</script>"})
	int updateUserOpenIdWp(@Param("uid") Long uid,@Param("open_id") String open_id);
	
	/**
	 * 更新开发平台里的open_id
	 * @param uid
	 * @param open_id
	 * @return
	 */
	@Update({"<script>",
		"update tb_user set open_id=#{open_id} where id=#{uid}",
		"</script>"})
	int updateUserOpenId(@Param("uid") Long uid,@Param("open_id") String open_id);
}