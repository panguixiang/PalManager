package com.afmobi.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.frame.ApplicationListener;
import com.afmobi.frame.ContentObject;
import com.afmobi.model.manager.Cp;
import com.afmobi.service.CounterService;
import com.afmobi.service.CpService;
import com.afmobi.service.ItemService;
import com.afmobi.util.CommonUtil;

/**
 * CP 信息管理controller
 * @author panguixiang
 *
 */
@Controller
@RequestMapping("/cp")
public class CpController {

	static Logger logger = Logger.getLogger(CpController.class.getName());
	
	@Autowired
	private CpService cpService;
	
	@Autowired
	private CounterService counterService;
	
	@Autowired
	private ItemService itemService;
	
	
	/**
	 * cp list分页列表
	 * @param page
	 * @param rows
	 * @param cpID
	 * @param status
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "cpList")
	public Map<String, Object> cpList(int page, int rows, String account, String name, String status) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("account", account);
		map.put("name", name);
		map.put("status", status);
		map.put("start", (page-1)*rows);
		map.put("end", rows);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("total",cpService.getCpCount(map));
			returnMap.put("rows", cpService.getCpList(map));
		} catch (Exception e) {
			logger.error("后台管理 产品列表，标签，公司列表异常,",e);
		} 
		return returnMap;
	}
	
	/**
	 * 新增 修改 cp
	 * @param cp
	 */
	@ResponseBody
	@RequestMapping(value = "updateCp", method = RequestMethod.POST)
	public void updateCp(Cp cp) {
		if(StringUtils.isBlank(cp.getCpID().trim())) {//新增
			try {
				int cpID = counterService.counter(ContentObject.CP_ID)+1;
				cp.setCpID(CommonUtil.lpad(4,cpID));//计算cpID
				cp.setPw(DigestUtils.md5Hex(cp.getPw().trim()));
				cp.setInSalePool(ContentObject.DEFAULT_INSALE_POOL);
				cpService.saveCp(cp);
				counterService.updateCounter(cpID, ContentObject.CP_ID);
			} catch (SQLException e) {
				logger.error("后台管理 新增CP异常,",e);
			}
		} else {
			try {
				cpService.updateCp(cp);
			} catch (SQLException e) {
				logger.error("后台管理 修改CP异常,",e);
			};
		}
	}
	
	/**
	 * 获得CP明细
	 * @param cpID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "cpDetail")
	public Map<String, Object> cpDetail(@RequestParam("cpID") String cpID) {
		Map<String, Object> map = new HashMap<String, Object>();
		Cp cp = null;
		try {
			cp = cpService.getCpDetail(cpID.trim());
		} catch (SQLException e) {
			logger.error("后台管理 获得CP明细异常,",e);
		}
		map.put("cp", cp);
		return map;
	}
	
	/**
	 * 删除CP
	 * @param cpID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteCp")
	public void deleteCp(@RequestParam("cpID") String cpID) {
		try {
			cpService.deleteCp(cpID.trim());
		} catch (SQLException e) {
			logger.error("后台管理 删除CP细异常,",e);
		}
	}
	
	/**
	 * CP密码重置
	 * @param cpID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "resetCpPaswd")
	public void resetCpPaswd(@RequestParam("cpID") String cpID, @RequestParam("password") String password) {
		try {
			cpService.resetCpPasswd(cpID.trim(), DigestUtils.md5Hex(password.trim()));
		} catch (SQLException e) {
			logger.error("后台管理 CP密码重置异常,",e);
		}
	}
	
	/**
	 * cp产品审批分页列表
	 * @param page
	 * @param rows
	 * @param cpID
	 * @param status
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "cpItemList")
	public Map<String, Object> cpItemList(int page, int rows, String itemID, String versionCateGory,
			String name, String status, String cpName, String category1, String category2) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(versionCateGory) && versionCateGory.indexOf(category2) >-1) {
			map.put("Soft", versionCateGory);//需要显示版本号的类别配表二级类别
		}
		map.put("itemID", itemID.trim());
		map.put("name", name.trim());
		map.put("status", status.trim());
		map.put("cpName", cpName.trim());
		map.put("category1", category1.trim());
		map.put("category2", category2.trim());
		map.put("start", (page-1)*rows);
		map.put("end", rows);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("total",cpService.getCpItemListCount(map));
			returnMap.put("rows", cpService.getCpItemList(map));
		} catch (Exception e) {
			logger.error("后台管理 cp产品审批分页列表异常,",e);
		} 
		return returnMap;
	}
	
	/**
	 * 查询cp 产品审批明细
	 * @param itemID
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "cpItemDetail")
	public String cpItemDetail(@RequestParam("itemID") String itemID, Model model) {
		
		Map<String, Object> map = null;
		List<Map<String, Object>> checkList = null;
		itemID = itemID.trim();
		model.addAttribute(ContentObject.SOURCE_URL,
				ApplicationListener.getValueByKey(ContentObject.SOURCE_URL));
		model.addAttribute(ContentObject.STATIC_URL,
				ApplicationListener.getValueByKey(ContentObject.STATIC_URL));
		try {
			map = cpService.getCpItemDetailByItemID(itemID);
			checkList = cpService.cpItemCheckList(itemID);
		} catch (SQLException e) {
			logger.error("后台管理 cp产品审批获得产品明细异常异常,",e);
		}
		model.addAttribute("detail", map);
		model.addAttribute("checkList", checkList);
		return "admin/cp/cpItemCheck";
	}
	
	/**
	 * 提交cp产品审批
	 * @param page
	 * @param rows
	 * @param cpID
	 * @param status
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "subCheck")
	public void subCheck(@RequestParam("itemID") String itemID, @RequestParam("desc") String desc,
			@RequestParam("status") String status,@RequestParam(value = "fileHid", required = false) 
			String testResultFileID, HttpSession session) {
		
		itemID = itemID.trim();
		status = status.trim();
		Object obj = session.getAttribute(ContentObject.LOGIN_SESSION);
		Map<String, Object> manager = (Map<String, Object>)obj;
		try {
			itemService.updateStatus(itemID.trim(), status.trim());
			cpService.saveCpItemCheck(itemID, (Integer)manager.get("managerID"), status, testResultFileID, desc);
		} catch (SQLException e) {
			logger.error("后台管理 提交cp产品审批， 异常,",e);
		}
	}
}
