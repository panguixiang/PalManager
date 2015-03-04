package com.afmobi.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.ManagerMapper;

/**
 * manager service
 * @author panguixiang
 *
 */
@Service
public class ManagerService {

	@Autowired
	private ManagerMapper managerMapper;
	
	public List<Map<String,Object>> getManagerList(int start, int end) throws SQLException {
		return managerMapper.getManagerList(start, end);
	}
	
	public int getManagerCount() throws SQLException {
		return managerMapper.getManagerCount();
	}
	
	public Map<String, Object> getManagerById(String managerID) throws SQLException {
		return managerMapper.getManagerById(managerID);
	}
	
	public void save(String name,String account,String paswd, String role,String des) throws SQLException {
		managerMapper.save(name, account, paswd, role, des);
	}
	
	public void update(String managerID, String name,String role,String des) throws SQLException {
		managerMapper.update(managerID, name, role, des);
	}
	
	public void deleteManagerById(String managerID) throws SQLException {
		managerMapper.deleteManagerById(managerID);
	}
	
	public void resetPswd(String managerID, String newPassword) throws SQLException {
		managerMapper.resetPswd(managerID, newPassword);
	}
	
	public Map<String, Object> getManagerByAccount(String account, String password) throws SQLException {
		return managerMapper.getManagerByAccount(account, password);
	}
	
	public List<Map<String,Object>> getCheckItemList(String status) throws SQLException {
		return managerMapper.getCheckItemList(status);
	}
}
