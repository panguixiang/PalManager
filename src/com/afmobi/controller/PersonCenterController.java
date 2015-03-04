package com.afmobi.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.service.PersonCenterService;

/**
 * 后台个人中心背景管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/personCenter")
public class PersonCenterController {

	@Autowired
	private PersonCenterService personService;
	
	/**
	 * 分页查询个人中心背景集合
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	@ResponseBody
	@RequestMapping(value = "personCenterList")
	public Map<String, Object> personCenterlist(@RequestParam("page") int page,
			@RequestParam("rows") int rows) throws SQLException {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("total",personService.personCenterCount());
		returnMap.put("rows", personService.personCenterlist((page-1)*rows, rows));
		return returnMap;
	}
	
	/**
	 * 查询个人中心背景信息
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	@ResponseBody
	@RequestMapping(value = "personCenter")
	public Map<String, Object> personCenter(@RequestParam("bgID") String bgID) throws SQLException {
		return personService.personCenter(bgID.trim());
	}
	
	/**
	 * 删除个人中心背景记录
	 * @param bgID
	 * @throws SQLException
	 */
	@ResponseBody
	@RequestMapping(value = "deletePersonCenter")
	public void deletePersonCenter(String bgID) throws SQLException {
		personService.deletePersonCenter(bgID);
	}
	
	/**
	 * 保存/更新个人中心背景信息
	 * @param name
	 * @param imgID
	 * @throws SQLException
	 */
	@ResponseBody
	@RequestMapping(value = "updatePersonCenter")
	public void savePersonCenter(@RequestParam(value = "bgID", required = false) String bgID, 
			@RequestParam("name") String name, @RequestParam("imgID") String imgID) throws SQLException {
		
		if(StringUtils.isBlank(bgID)) {
			personService.savePersonCenter(name, imgID);
		} else {
			personService.updatePersonCenter(bgID, name, imgID);
		}
	}
	
}
