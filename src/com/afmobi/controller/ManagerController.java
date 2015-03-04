package com.afmobi.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.frame.ContentObject;
import com.afmobi.service.ManagerService;

/**
 * manager管理控制器
 * @author panguixiang
 *
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {

	static Logger logger = Logger.getLogger(ManagerController.class.getName());
	
	@Autowired
	private ManagerService managerService;
	
	/**
	 * manager分页列表
	 * @param page
	 * @param rows
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "managerList")
	public Map<String, Object> managerList(@RequestParam("page") int page, @RequestParam("rows") int rows) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("total", managerService.getManagerCount());
			returnMap.put("rows", managerService.getManagerList((page-1)*rows, rows));
		} catch (SQLException e) {
			logger.equals("manager分页列表,异常="+e);
		}
		return returnMap;
	}
	
	/**
	 * 新增/修改 管理员
	 * @param account
	 * @param name
	 * @param pw
	 * @param role
	 * @param des
	 */
	@ResponseBody
	@RequestMapping(value = "addManager")
	public void addManager(
			 @RequestParam(value = "managerID", required = false) String managerID, 
			 @RequestParam(value = "account", required = false) String account,
			 @RequestParam("name") String name, @RequestParam(value = "pw", required = false) String pw, 
			 @RequestParam("role") String role, @RequestParam("des") String des) {
		try {
			if(StringUtils.isNotBlank(managerID)) {
				managerService.update(managerID, name, role, des);
			} else {
				managerService.save(name, account, DigestUtils.md5Hex(pw.trim()), role, des);
			}
		} catch (SQLException e) {
			logger.equals("manager 新增 修改 管理员,异常="+e);
		}
	}
	
	/**
	 * 删除 管理员
	 * @param account
	 * @param name
	 * @param pw
	 * @param role
	 * @param des
	 */
	@ResponseBody
	@RequestMapping(value = "deleteManager")
	public void deleteManager(@RequestParam("managerID") String managerID) {
		try {
			managerService.deleteManagerById(managerID.trim());
		} catch (SQLException e) {
			logger.equals("manager 删除管理员,异常="+e);
		}
	}
	
	/**
	 * manager密码重置
	 * @param cpID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "resetPaswd")
	public void resetPaswd(@RequestParam("managerID") String managerID, @RequestParam("password") String password) {
		try {
			managerService.resetPswd(managerID.trim(), DigestUtils.md5Hex(password.trim()));
		} catch (SQLException e) {
			logger.error("后台管理 重置密码 异常,",e);
		}
	}
	
	
	/**
	 * manager密码修改
	 * @param cpID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updatePaswd")
	public Map<String, Object> resetPaswd(@RequestParam("oldPassword") String oldPassword, 
			@RequestParam("password") String password, HttpSession session) {
		Object obj = session.getAttribute(ContentObject.LOGIN_SESSION);
		Map<String, Object> map = new HashMap<String, Object>();
		if(obj == null) {
			map.put(ContentObject.ERROR, "操作失败，请先登录!");
			return map;
		}
		Map<String, Object> manager = (Map<String, Object>)obj;
		try {
			if(MapUtils.isEmpty(
					managerService.getManagerByAccount((String)manager.get("account"), DigestUtils.md5Hex(oldPassword.trim())))) {
				map.put(ContentObject.ERROR, "操作失败，旧密码输入不正确!");
				return map;
			}
			managerService.resetPswd(manager.get("managerID")+"", DigestUtils.md5Hex(password.trim()));
		} catch (SQLException e) {
			logger.error("后台管理 重置密码 异常,",e);
		}
		map.put(ContentObject.SUCCESS, "操作成功，请牢记您的密码!");
		return map;
	}
}
