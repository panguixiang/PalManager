package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * 管理员表 manager
 * @author panguixiang
 *
 */
public interface ManagerMapper {

	public List<Map<String,Object>> getManagerList(@Param("start") int start, @Param("end") int end) throws SQLException;
	
	public int getManagerCount() throws SQLException;
	
	public Map<String, Object> getManagerById(@Param("managerID") String id) throws SQLException;
	
	public void save(@Param("name") String name,@Param("account") String account,@Param("passwd") String passwd,
			@Param("role") String role,@Param("des") String des) throws SQLException;
	
	public void update(@Param("managerID") String managerID, @Param("name") String name, 
			@Param("role") String role, @Param("des") String des) throws SQLException;
	
	public void deleteManagerById(@Param("managerID") String id) throws SQLException; 
	
	public void resetPswd(@Param("managerID") String managerID, @Param("newPassword") String newPassword) throws SQLException;
	
	public Map<String, Object> getManagerByAccount(@Param("account") String account, 
			@Param("password") String password) throws SQLException;
	
	public List<Map<String,Object>> getCheckItemList(@Param("status") String status) throws SQLException;
}
