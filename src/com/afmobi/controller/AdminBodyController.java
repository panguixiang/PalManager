package com.afmobi.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.afmobi.frame.ContentObject;
import com.afmobi.service.ManagerService;

/**
 * @ClassName: HomeController
 * @Description: 首页
 * @author proteus
 * @date 2011-7-14 上午11:14:32
 * 
 */
@Controller
@RequestMapping("/body")
public class AdminBodyController {

	static Logger logger = Logger.getLogger(AdminBodyController.class.getName());
	
	@Autowired
	private ManagerService managerService;
	
	/**
	 * 进入登录页
	 * @param userName
	 * @param passWord
	 * @return
	 */
	@RequestMapping(value = "initLogin", method = RequestMethod.GET)
	public String initLogin() {
		return "login";
	}
	
	/**
	 * 执行登录，进入首页
	 * @param userName
	 * @param passWord
	 * @return
	 */
	@RequestMapping(value="admin_main", method = RequestMethod.POST)
	public String adminMain(@RequestParam("account") String account, @RequestParam("password") String password, 
			@RequestParam("go") String go, HttpSession session, Model model) {
			/*超级管理员： super
			运营管理员： operater
			测试管理员： tester*/
		Map<String, Object> map = null;
		model.addAttribute("account", account);
		try {
			map = managerService.getManagerByAccount(account.trim(), DigestUtils.md5Hex(password.trim()));
		} catch (SQLException e) {
			logger.error(e);
		}
		if(MapUtils.isEmpty(map)) {
			model.addAttribute("loginError", "用户名或密码不正确!");
			return "login";
		}
		account = (String)map.get("role");
		if(go.equals("1") && !account.equals("super") && !account.equals("tester")) {//登录管理，测试平台
			model.addAttribute("loginError", "您没有管理员或测试权限!");
			return "login";
		}
		else if(go.equals("2") && !account.equals("operater")) {//登录运营平台
			model.addAttribute("loginError", "您没有运营权限!");
			return "login";
		}
		session.setAttribute(ContentObject.LOGIN_SESSION, map);
		return "admin_main";
	}
	
	@RequestMapping(value="admin_top")
	public String index(Model model) {
		model.addAttribute("now", new Date());
		return "admin_top";

	}
	@RequestMapping(value="admin_left")
	public String left() {
		return "admin_left";

	}
	@RequestMapping(value="admin_switchLeft")
	public String header() {
		return "admin_switchLeft";

	}
	
	@RequestMapping(value="body")
	public String body(Model model, HttpSession session) {
		Object obj = session.getAttribute(ContentObject.LOGIN_SESSION);
		if(obj != null) {
			Map<String, Object> map = (Map<String, Object>)obj;
			String role = (String)map.get("role");
			/**
			 * 超级管理员： super, 运营管理员： operater, 测试管理员： tester
			 */
			List<Map<String, Object>> itemList = null;
			try {
				if(role.equals("super")) {
					itemList = managerService.getCheckItemList(ContentObject.READY_CHECK);
				} else if(role.equals("tester")) {
					itemList = managerService.getCheckItemList(ContentObject.READY_TEST);
				}
			} catch(SQLException e) {
				logger.error(e);
			}
			model.addAttribute("itemList", itemList);
		}
		return "body";

	}
	@RequestMapping(value="admin_switchTop")
	public String admin_switchTop() {
		return "admin_switchTop";

	}
	
	/**
	 * 公用的跳转页
	 * @param viewName
	 * @return
	 */
	@RequestMapping(value = "initPage", method = RequestMethod.GET)
	public String approve(@RequestParam("viewUrl") String viewUrl) {
		return viewUrl;
	}
	
	/**
	 * 公用的跳转页
	 * @param viewName
	 * @return
	 */
	@RequestMapping(value = "loginOut", method = RequestMethod.GET)
	public String loginOut(HttpSession session) {
		session.removeAttribute(ContentObject.LOGIN_SESSION);
		return "redirect:initLogin";
	}
}
