package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PersonCenterMapper {

	public List<Map<String, Object>> personCenterlist(@Param("start") int start, @Param("end") int end) throws SQLException;
	
	public int personCenterCount() throws SQLException;
	
	public Map<String, Object> personCenter(@Param("bgID") String bgID) throws SQLException;
	
	public void deletePersonCenter(@Param("bgID") String bgID) throws SQLException;
	
	public void savePersonCenter(@Param("name") String name, @Param("imgID") String imgID) throws SQLException;
	
	public void updatePersonCenter(@Param("bgID") String bgID, @Param("name") String name, @Param("imgID") String imgID) throws SQLException;
}
