package com.afmobi.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.PersonCenterMapper;

/**
 * 个人中心后台管理service
 * @author panguixiang
 *
 */
@Service
public class PersonCenterService {

	@Autowired
	private PersonCenterMapper personMapper;
	
	/**
	 * 分页查询个人中心背景集合
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, Object>> personCenterlist(int start, int end) throws SQLException {
		return personMapper.personCenterlist(start, end);
	}
	
	/**
	 * 查询个人中心背景集合数量
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	public int personCenterCount() throws SQLException {
		return personMapper.personCenterCount();
	}
	
	/**
	 * 查询个人中心背景信息
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> personCenter(String bgID) throws SQLException {
		return personMapper.personCenter(bgID);
	}
	
	
	/**
	 * 删除个人中心背景记录
	 * @param bgID
	 * @throws SQLException
	 */
	public void deletePersonCenter(String bgID) throws SQLException {
		personMapper.deletePersonCenter(bgID);
	}
	
	/**
	 * 保存个人中心背景信息
	 * @param name
	 * @param imgID
	 * @throws SQLException
	 */
	public void savePersonCenter(String name, String imgID) throws SQLException {
		personMapper.savePersonCenter(name, imgID);
	}
	
	/**
	 * 修改个人中心背景信息
	 * @param name
	 * @param imgID
	 * @throws SQLException
	 */
	public void updatePersonCenter(String bgID, String name, String imgID) throws SQLException {
		personMapper.updatePersonCenter(bgID, name, imgID);
	}
	
}
