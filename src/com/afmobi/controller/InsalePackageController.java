package com.afmobi.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.service.CpService;
import com.afmobi.service.InsaleService;
import com.afmobi.util.CommonUtil;

/**
 * 内计费管理
 * @author panguixiang
 *
 */
@Controller
@RequestMapping("/insale")
public class InsalePackageController {

	static Logger logger = Logger.getLogger(InsalePackageController.class.getName());
	
	@Autowired
	private InsaleService inSaleService;
	
	@Autowired
	private CpService cpService;
	
	/**
	 * 内计费包列表
	 * @param page
	 * @param rows
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "packageList")
	public Map<String, Object> list(int page, int rows) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("total",inSaleService.inSalePackageCount());
			returnMap.put("rows", inSaleService.inSalePackageList((page-1)*rows, rows));
		} catch (Exception e) {
			logger.error(e);
		} 
		return returnMap;
	}
	
	@RequestMapping(value = "initView")
	public String initView(String id, String view, Model model) {
		model.addAttribute("id", id);
		return view;
	}
	
	/**
	 * 访问内计费申请页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "cpInsaleView")
	public String initView(Model model, @RequestParam("viewUrl") String view,
			@RequestParam(value = "cpID", required = false) String cpID) {
		List<Map<String, Object>> insaleList = null;
		try {
			insaleList = inSaleService.inSalePackageList(null,null);
		} catch (SQLException e) {
			logger.error(e);
		}
		if(StringUtils.isNotBlank(cpID)) {
			model.addAttribute("cpID", cpID);
		}
		model.addAttribute("inSalePackagelist", insaleList);
		return view;
	}
	
	
	/**
	 * cp内计费申请列表
	 * @param page
	 * @param rows
	 * @param cpName
	 * @param inSalePool
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "cpInsaleList")
	public Map<String, Object> cpInsaleList(@RequestParam("page") int page, @RequestParam("rows") 
		int rows, @RequestParam(value = "cpName", required = false) String cpName, 
		@RequestParam("inSalePool") String inSalePool) {
		
		inSalePool = inSalePool.trim();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("total",inSaleService.cpInsaleCount(cpName, inSalePool));
			returnMap.put("rows", inSaleService.cpInsaleList((page-1)*rows, rows, cpName, inSalePool));
		} catch (Exception e) {
			logger.error(e);
		} 
		return returnMap;
	}
	
	
	/**
	 * 内计费包信息列表
	 * @param page
	 * @param rows
	 * @param inSalePackageID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "infoList")
	public Map<String, Object> infoList(@RequestParam("page") int page, @RequestParam("rows") 
		int rows, @RequestParam("inSalePackageID") int inSalePackageID) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("total",inSaleService.inSaleInfoCount(inSalePackageID));
			returnMap.put("rows", inSaleService.inSaleInfoList((page-1)*rows, rows, inSalePackageID));
		} catch (Exception e) {
			logger.error(e);
		} 
		return returnMap;
	}
	
	/**
	 * 新增 内计费包 
	 */
	@ResponseBody
	@RequestMapping(value = "saveInSalePackage")
	public void saveInSalePackage() {
		
		try {
			inSaleService.saveInSalePackage();
		} catch (SQLException e) {
			logger.error(e);
		}
	}
			
	/**
	 * 新增 、修改内计费包信息
	 * @param id
	 * @param inSalePackageID
	 * @param mccMnc
	 * @param port
	 * @param cmd
	 * @param price
	 * @param unit
	 * @param rate
	 */
	@ResponseBody
	@RequestMapping(value = "saveInSaleInfo")
	public void saveInSaleInfo(
			@RequestParam(value = "id", required = false) String id,
			@RequestParam("inSalePackageID") String inSalePackageID ,
			@RequestParam("mccMnc") String mccMnc,
			@RequestParam("port") String port,
			@RequestParam("cmd") String cmd,
			@RequestParam("price") String price,
			@RequestParam("unit") String unit,
			@RequestParam("rate") String rate
			) {
		String rateRMB ="0.00", rateUSD = "0.00";
		if(unit.equals("RMB")) {
			rateRMB = rate;
		} else {
			rateUSD = rate;
		}
		try {
			if(StringUtils.isNotBlank(id.trim())) {
				inSaleService.updateInSaleInfo(id.trim(), mccMnc.trim(), port.trim(), cmd.trim(),
						price.trim(), unit.trim(), rateRMB.trim(), rateUSD.trim());
			} else {
				inSaleService.saveInSaleInfo(inSalePackageID.trim(), mccMnc.trim(), port.trim(), cmd.trim(),
						price.trim(), unit.trim(), rateRMB, rateUSD);
			}
		} catch (SQLException e) {
			logger.error(e);
		}
	}
	
	/**
	 * 新增 cp内计费代码对应的内计费包
	 * @param packageID
	 * @param cpID
	 */
	@ResponseBody
	@RequestMapping(value = "addCpInSalePackage")
	public void addCpInSalePackage(@RequestParam("packageID") String inSalePackageID, @RequestParam("cpID") String cpID) {
		
		inSalePackageID = inSalePackageID.trim();
		cpID = cpID.trim();
		String cpInSalePool = "",newcpInSalePool="";
		Integer id;
		try {
			cpInSalePool = cpService.cpInSalePoolById(cpID);//根据cpID获得此CP的内计费池
			id = inSaleService.getinSalePackageCpInsaleCodeId(cpID+cpInSalePool);//查询是否已经存在
			if(id == null) {//新增操作
				newcpInSalePool = cpInSalePool.replaceAll("^(0+)", "");
				newcpInSalePool = CommonUtil.lpad(3, Integer.parseInt(cpInSalePool));
				inSaleService.addCpInsalePackage(inSalePackageID, cpID+newcpInSalePool);
			} else {
				inSaleService.updateCpInsalePackage(id, inSalePackageID);
			}
		} catch (SQLException e) {
			logger.error(e);
		}
	}
	
	/**
	 * 查询产品内计费包关联列表
	 * @param page
	 * @param rows
	 * @param itemName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "cpItemInSaleList")
	public Map<String, Object> cpItemInSaleList(@RequestParam("page") int page, @RequestParam("rows") 
		int rows, @RequestParam("cpID") String cpID, @RequestParam(value = "itemName", required = false) String itemName) {
		
		cpID = cpID.trim();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("total",inSaleService.cpItemInSaleCount(itemName, cpID));
			returnMap.put("rows", inSaleService.cpItemInSaleList((page-1)*rows, rows, itemName, cpID));
		} catch (Exception e) {
			logger.error(e);
		} 
		return returnMap;
	}
	
	/**
	 * 修改产品内计费包 
	 */
	@ResponseBody
	@RequestMapping(value = "updateItemInSalePackage")
	public void updateItemInSalePackage(@RequestParam("id") String packageID, 
			@RequestParam("packageCode") String packageCode) {
		packageID = packageID.trim();
		packageCode = packageCode.trim();
		try {
			inSaleService.updateCpInsalePackage(Integer.parseInt(packageID), packageCode);
		} catch (SQLException e) {
			logger.error(e);
		}
	}
}
