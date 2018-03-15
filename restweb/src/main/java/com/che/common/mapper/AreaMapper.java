package com.che.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.che.common.entity.AirportRailway;
import com.che.common.entity.City;
import com.che.rw.annotation.Master;

public interface AreaMapper {
	
	@Master
	@Select("<script> "
			+ "select cityId as id, che300_city as name, fid as provinceId, FIRST_NUM as num,lng,lat,code,hot,isopen from s_area_city "
			+ "where 1=1 "
			+ "<if test='provinceId != null'> and fid = #{provinceId}</if> "
			+ "<if test='isopen != null'> and isopen = #{isopen}</if> "
			+ "ORDER BY FIRST_NUM ASC </script>")
	List<City> selectCitys(@Param("provinceId")Long provinceId, @Param("isopen")Integer isopen);
	
	@Select({
		"select * from s_area_airport_railway ",
		"where code=#{code} and type=#{type}",
	})
	List<AirportRailway> selectAirportRailway(@Param("code") String code,@Param("type") int type);
}
