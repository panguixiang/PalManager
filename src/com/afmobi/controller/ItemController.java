package com.afmobi.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
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
import com.afmobi.model.manager.Item;
import com.afmobi.model.manager.MusicItem;
import com.afmobi.model.manager.SoftItem;
import com.afmobi.model.manager.VideoItem;
import com.afmobi.service.CpService;
import com.afmobi.service.ItemService;
import com.afmobi.util.CommonUtil;

/**
 * CP管理控制器
 * @author panguixiang
 *
 */
@Controller
@RequestMapping("/item")
public class ItemController {
	
	static Logger logger = Logger.getLogger(ItemController.class.getName());
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private CpService cpService;
	
	/**
	 * 进入新增产品页面
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "initAddItem")
	public String approve(@RequestParam("category1") String category1, 
			@RequestParam(value = "category2", required =false) String category2,
			@RequestParam(value = "jsp", required =false) String jsp,
			Model model) {
		model.addAttribute("category1", category1);//type按照一定的类别，jsp命名规则 来获得一级或二级类别
		model.addAttribute("category2", category2);//type按照一定的类别，jsp命名规则 来获得一级或二级类别
		return "admin/item/"+jsp;
	}
	
	/**
	 * 重定向操作，防止刷新浏览器表单重复提交
	 * @param itemId
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "optSuccess")
	public String optSuccess(@RequestParam("itemID") String itemId) {
		return "redirect:optSuccessJsp?itemID="+itemId;
	}
	/**
	 * 跳转到成功提示页面
	 * @param itemId
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "optSuccessJsp")
	public String optSuccessToJsp(@RequestParam("itemID") String itemId, Model model) {
		model.addAttribute("itemId", itemId);
		return "admin/item/optSuccess";
	}
	
	/**
	 * 产品编辑
	 * @param page
	 * @param rows
	 * @param itemID
	 * @param status
	 * @param versionCateGory
	 * @param category2
	 * @param countryCode
	 * @param name
	 * @param category3
	 * @param addTime
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "itemList")
	public Map<String, Object> itemList(@RequestParam("page") int page, @RequestParam("rows") int rows
			,@RequestParam(value = "itemID", required = false) String itemID,
			@RequestParam(value = "status" , required = false) String status,
			@RequestParam(value = "versionCateGory", required = false) String versionCateGory,
			@RequestParam(value = "category1", required = false) String category1,
			@RequestParam(value = "category2", required = false) String category2,
			@RequestParam(value = "countryCode", required = false) String countryCode,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "category3", required = false) String category3,
			@RequestParam(value = "addTime", required = false) String addTime) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("category1", category1);
		map.put("category2", category2);
		category2 = StringUtils.isBlank(category2)?"":category2;
		if(StringUtils.isNotBlank(versionCateGory) && versionCateGory.indexOf(category2) >-1) {
			map.put("Soft", versionCateGory);//需要显示版本号的类别配表二级类别
		}
		countryCode = StringUtils.isBlank(countryCode)?"":countryCode;
		if(StringUtils.isNotBlank(countryCode)) {
			map.put("countryCode", "item_country".concat("_").concat(countryCode.toLowerCase()));
		}
		map.put("itemID", itemID);
		map.put("name", name);
		map.put("category3", category3);
		if(StringUtils.isNotBlank(addTime)) {
			String[] time = addTime.split("--");
			map.put("beginTime", time[0]);
			map.put("endTime", time.length>1?time[1]:"");
		}
		map.put("start", (page-1)*rows);
		map.put("end", rows);
		Map<String, Object> returnMap = null;
		try {
			returnMap = itemService.getItemList(map);
		} catch (Exception e) {
			logger.error("后台管理 产品列表异常,",e);
		} 
		return returnMap;
	}
	
	
	
	
	
	/**
	 * 根据二级类别获得三级类别列表
	 * 根据三级类别获得标签列表
	 * 获得公司列表
	 * @param type
	 * @param param
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getProStr")
	public Map<String, Object> getProStr(@RequestParam("type") String type, 
			@RequestParam(value = "param", required=false) String param,
			@RequestParam(value = "status", required=false) String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		try {
			if(type.equals("cate3")) {
				list = itemService.getCatesList(param);
			}
			else if(type.equals("tag")) {
				list = itemService.getTagList(param);
			}
			else if(type.equals("cp")) {
				if(StringUtils.isBlank(status)) {
					status = null;
				}
				list = cpService.getCpNameList(status);
			}
		} catch (Exception e) {
			logger.error("后台管理 获得三级类别，标签，公司列表异常,type="+type,e);
		}
		map.put("proList", list);
		return map;
	}
	
	/**
	 * 产品删除
	 * @param itemIds
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteItems")
	public Map<String, Object> deleteItems(@RequestParam("itemIds") String itemIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(itemIds.trim())) {
			try {
				itemService.deleteItems(itemIds.split("\\|"));
			} catch (Exception e) {
				logger.error("后台管理 产品删除异常==",e);
				map.put("message", "新增软件产品异常");
			}
		}
		return map;
	}
	
	/**
	 * 产品上架/下架
	 * @param itemIds
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateItemStatus")
	public Map<String, Object> itemsPutAway(@RequestParam("itemIds") String itemIds, @RequestParam("status") String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(itemIds.trim())) {
			try {
				if(StringUtils.equals(status.trim(), ContentObject.LIST)) {
					itemService.itemListStatus(status, itemIds.split(","));//上架
				} else {
					itemService.dwListItem(status, itemIds.split(","));//下架
				}
			} catch (Exception e) {
				logger.error("后台管理 产品上下架异常==",e);
				map.put("message", "产品上下架异常");
			}
		}
		return map;
	}
	
	/**
	 * soft 新增
	 * @param item
	 * @param soft
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "saveSoft")
	public Map<String, Object> saveSoft(Item item, SoftItem soft) {
		Map<String, Object> map = new HashMap<String, Object>();
		String itemId = CommonUtil.createItemId(ContentObject.SOFT);
		boolean isSaveStatic = false;
		String type="new";
		try {
			map = saveSoftBeforeCheck(map, soft, item.getCpID(), type);
			if(map.get("message") != null) {
				return map;
			}
			String itenNum = itemService.getItemNumByPackageName(soft.getPackageName().trim());
			if(StringUtils.isNotBlank(itenNum)) {
				item.setItemNum(itenNum);
			} else {
				isSaveStatic = true;
				item.setItemNum(itemId);
			}
			itemService.softSave(item, soft, itemId, (String)map.get("intSalePool"), isSaveStatic, type);
			map.put("itemId", itemId);
		} catch (Exception e) {
			logger.error("后台管理 新增软件产品异常，softName="+item.getName(),e);
			map.put("message", "新增软件产品异常");
		}
		return map;
	}
	
	/**
	 * soft 更新 前提 同报名 版本号大于旧的版本号
	 * @param item
	 * @param soft
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "renewSoft")
	public Map<String, Object> renewSoft(Item item, SoftItem soft) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String newItemID = CommonUtil.createItemId(ContentObject.SOFT);
		String type = "renew";
		try {
			map = saveSoftBeforeCheck(map, soft, item.getCpID(), type);
			if(map.get("message") != null) {
				return map;
			}
			item.setItemNum(item.getItemID());
			itemService.softSave(item, soft, newItemID, (String)map.get("intSalePool"), false, type);
			map.put("itemId", newItemID);
		} catch (Exception e) {
			logger.error("后台管理 更新软件产品异常，softName="+item.getName(),e);
			map.put("message", "更新软件产品异常");
		}
		return map;
	}
	
	/**
	 * soft 修改
	 * @param item
	 * @param soft
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateSoft")
	public Map<String, Object> updateSoft(Item item, SoftItem soft, String oldCountryCodes, String oldCategory2) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!StringUtils.equals(item.getStatus(), ContentObject.LIST)) {//对非上架产品进行修改
			item.setStatus(ContentObject.READY_CHECK);
		}
		try {
			itemService.updateSoft(item, soft, oldCountryCodes, oldCategory2);
			map.put("itemId", item.getItemID());
		} catch (Exception e) {
			logger.error("后台管理 修改软件产品异常，softName="+item.getName(),e);
			map.put("message", "修改软件产品异常");
		}
		return map;
	}
	
	
	/**
	 * Video 新增
	 * @param item
	 * @param video
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "saveVideo")
	public Map<String, Object> saveVideo(Item item, VideoItem video) {
		Map<String, Object> map = new HashMap<String, Object>();
		String itemId = CommonUtil.createItemId(ContentObject.VIDEO);
		item.setItemNum(itemId);
		try {
			itemService.saveVideo(item, video, itemId);
			map.put("itemId", itemId);
		} catch (Exception e) {
			logger.error("后台管理 新增视频产品异常，videoName="+item.getName(),e);
			map.put("message", "新增视频产品异常");
		}
		return map;
	}
	
	/**
	 * Video 更新
	 * @param item
	 * @param video
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "renewVideo")
	public Map<String, Object> renewVideo(Item item, VideoItem video) {
		Map<String, Object> map = new HashMap<String, Object>();
		item.setItemNum(item.getItemID());
		String newItemId = CommonUtil.createItemId(ContentObject.VIDEO);
		try {
			if(itemService.getItemCountByItemId(newItemId)>0) {
				map.put("message", "此产品已经存在一个处于更新状态的产品，暂不能提交新的更新！");
				return map;
			}
			itemService.saveVideo(item, video, newItemId);
			map.put("itemId", newItemId);
		} catch (Exception e) {
			logger.error("后台管理 更新视频产品异常，videoName="+item.getName(),e);
			map.put("message", "更新视频产品异常");
		}
		return map;
	}
	
	/**
	 * Video 修改
	 * @param item
	 * @param video
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateVideo")
	public Map<String, Object> updateVideo(Item item, VideoItem video, String oldCountryCodes, String oldCategory2) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(!StringUtils.equals(item.getStatus(), ContentObject.LIST)) {//对非上架产品进行修改
			item.setStatus(ContentObject.READY_LIST);
		}
		try {
			itemService.updateVideo(item, video, oldCountryCodes, oldCategory2);
			map.put("itemId", item.getItemID());
		} catch (Exception e) {
			logger.error("后台管理 修改视频产品异常，videoName="+item.getName(),e);
			map.put("message", "修改视频产品异常");
		}
		return map;
	}
	
	
	/**
	 * 数字产品 新增(music，picture)
	 * @param item
	 * @param music
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "saveMusic")
	public Map<String, Object> saveMusic(Item item, MusicItem music) {
		Map<String, Object> map = new HashMap<String, Object>();
		String itemId = CommonUtil.createItemId(ContentObject.DIGTIAL);
		item.setItemNum(itemId);
		try {
			itemService.saveMusic(item, music, itemId);
			map.put("itemId", itemId);
		} catch (Exception e) {
			logger.error("后台管理 新增音乐产品异常，videoName="+item.getName(),e);
			map.put("message", "新增数字产品异常");
		}
		return map;
	}
	
	/**
	 * 数字产品（picture，music） 更新
	 * @param item
	 * @param video
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "renewMusic")
	public Map<String, Object> renewMusic(Item item, MusicItem music) {
		Map<String, Object> map = new HashMap<String, Object>();
		item.setItemNum(item.getItemID());
		String newItemId = CommonUtil.createItemId(ContentObject.VIDEO);
		try {
			if(itemService.getItemCountByItemId(newItemId)>0) {
				map.put("message", "此产品已经存在一个处于更新状态的产品，暂不能提交新的更新！");
				return map;
			}
			itemService.saveMusic(item, music, newItemId);
			map.put("itemId", newItemId);
		} catch (Exception e) {
			logger.error("后台管理 更新数字产品异常，videoName="+item.getName(),e);
			map.put("message", "更新数字产品异常");
		}
		return map;
	}
	
	/**
	 * 数字产品 修改(music，picture)
	 * @param item
	 * @param music
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateMusic")
	public Map<String, Object> updateMusic(Item item, MusicItem music, String oldCountryCodes, String oldCategory2) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(!StringUtils.equals(item.getStatus(), ContentObject.LIST)) {//对非上架产品进行修改
			item.setStatus(ContentObject.READY_LIST);
		}
		try {
			itemService.updateMusic(item, music, oldCountryCodes, oldCategory2);
			map.put("itemId", item.getItemID());
		} catch (Exception e) {
			logger.error("后台管理 修改音乐、图片产品异常，name="+item.getName(),e);
			map.put("message", "修改数字产品异常");
		}
		return map;
	}
	
	/**
	 * 初始化修改页面
	 * @param itemID
	 * @param view view=1表示进入详情页面
	 * @param type 存在则表示是进入更新页面     否则进入修改页面
	 * @return
	 */
	@RequestMapping(value = "initUpdate")
	public String initUpdateItem(@RequestParam("itemID") String itemID, 
			@RequestParam(value = "type", required =false) String type, 
			@RequestParam("view") String view, 
			Model model) {
		Item item = null;
		itemID = itemID.trim();
		char itemType = itemID.charAt(0);
		String returnView="";
		model.addAttribute("type", StringUtils.isBlank(type)?"":type);
		try {
			item = itemService.getItemByItemID(itemID);
			if(item == null) {
				return "admin/item/updateSoft";
			} 
			else if(itemType=='s') {
				model.addAttribute("product",itemService.getSoftByItemID(itemID));
				returnView = "admin/item/"+view+"Soft";
			}
			else if(itemType=='v') {
				model.addAttribute("product",itemService.getVideoByItemID(itemID));
				returnView = "admin/item/"+view+"Video";
			} else if(itemType=='d'){//数字产品页面是按照前缀+category2来定义的
				model.addAttribute("product",itemService.getDigitalByItemID(itemID));
				returnView = "admin/item/"+view.concat(item.getCategory2());
			}
			model.addAttribute("item",item);
			List<Map<String,Integer>> tagList = itemService.getTagsByItemId(itemID);
			StringBuffer tagBuffer = new StringBuffer();
			if(CollectionUtils.isNotEmpty(tagList)) {
				for(Map<String,Integer> tag : tagList) {
					tagBuffer.append(tag.get("tagID")).append(",");
				}
			}
			model.addAttribute("tags", tagBuffer.toString());
			model.addAttribute("itemStatics", itemService.getItemStaticsByItemNum(item.getItemNum()));
		} catch (SQLException e) {
			logger.error("后台管理 initUpdate异常，itemID="+itemID,e);
		}
		model.addAttribute(ContentObject.SOURCE_URL,
				ApplicationListener.getValueByKey(ContentObject.SOURCE_URL));
		model.addAttribute(ContentObject.STATIC_URL,
				ApplicationListener.getValueByKey(ContentObject.STATIC_URL));
		return returnView;
	}
	
	
	/**
	 * 新增 Soft 之前对 包名称，版本号，内计费ID的校验，更新Soft 之前对 包名称，版本号的校验
	 * 
	 * 修改操作需要校包名称和验版本号，新增操作只需要校验包名称
	 * @param soft
	 * @param cpId
	 * @return
	 * @throws Exception
	 */
	private Map<String, Object> saveSoftBeforeCheck(Map<String, Object> map, SoftItem soft, String cpId, String type) throws Exception {
		/**
		 * 根据版本号查询出相同包名称的软件集合 itemID，版本号，状态
		 */
		List<Map<String, Object>> oldMapList = itemService.checkSoftPackageName(soft.getPackageName().trim());
		
		/**
		 * 校验软件包
		 */
		if(!CollectionUtils.isEmpty(oldMapList)) {//如果没有此包则返回
			int verson;
			for(Map<String, Object> itemMap : oldMapList) {
				String ss = (String)itemMap.get("status");
				if((ContentObject.CAN_SAVE_ITEM_STATUS).indexOf(ss)==-1) {//校验是全部是非LIST，非DW_LIST状态的item_soft否则不可以上传
					map.put("message", "已有同包名产品被提交！");
					return map;
				}
				verson = (Integer)itemMap.get("versionCode");
				if(soft.getVersionCode()<=verson) {//校验新产品版本号是否大于老版本版本号
					map.put("message", "目前入库产品的版本小于或等于库中的同包名的产品版本！");
					return map;
				}
			}
		}
		if(type.equals("renew")) {//更新操作不修改内计费包 也就无需校验
			return map;
		}
		/**
		 * 校验内计费ID
		 */
		String intSalePool="", inSalePool = "";
		if(StringUtils.equals(soft.getIsInSale(),"T")) {
			/*	1.	查询soft表是否有重复记录。有重复记录则不合法
				2.	根据输入的inSaleID，截取出前4位（cpID），查出CP。没有CP则不合法。
				3.	再截取出后3位，转为整形和CP中的inSalePool对比，大于后者则不合法*/
				String saleID = soft.getInSaleID().trim();
				if(itemService.getSoftCountBySaleId(saleID)>0) {
					map.put("message", soft.getInSaleID()+"内计费ID已被使用!");
					return map;
				} else if(cpService.cpCountByInSaleId(saleID.substring(0, 4))==0) {
					map.put("message", soft.getInSaleID()+"内计费ID对应的CP不存在!");
					return map;
				} else  {
					inSalePool = cpService.cpInSalePoolById(cpId);
					intSalePool = inSalePool.replaceAll("^(0+)", "");
					if(CommonUtil.checkInSaleId(intSalePool,saleID)) {
						map.put("message", soft.getInSaleID()+"内计费ID已被使用!");
						return map;
					}
				}
		}
		map.put("intSalePool", intSalePool);
		return map;
	}
	
	
	/**
	 * 产品国家拉黑操作
	 * @param itemIDS
	 * @param blackCountryCodes
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "blackItemOpt", method=RequestMethod.POST)
	public String blackItemOpt(@RequestParam("itemIDS") String itemIDS, 
			@RequestParam("blackCountryCodes") String blackCountryCodes) {
		
		List<Map<String, String>> itemList = null;
		if(StringUtils.isBlank(blackCountryCodes)) {
			return null;
		}
		String[] countryCodeArr = blackCountryCodes.split(",");
		Map<String, List<String>> cnMap = new HashMap<String, List<String>>();//国家分表与itemID集合
		Map<String,String> cnMap2 = new HashMap<String,String>();//itemID与国家country字符串集合
		List<String> itemIdList = null;
		String itemCountryCode = "";
		try {
			itemList = itemService.itemCountryListByItemIDs(itemIDS.split(","));//去item_country表查询出所有itemId的countryCode集合
			for(String code : countryCodeArr) {//遍历黑名单国家集合Code
				if(StringUtils.isBlank(code.trim())) {
					continue;
				}
				code = code.toUpperCase();
				itemIdList = new ArrayList<String>();
				if(CollectionUtils.isEmpty(itemList)) {
					return null;
				}
				for(Map<String, String> map : itemList) {
					if(map.get("country").indexOf(code)>-1) {//赛选掉所有在code国家下的产品
						if(StringUtils.isBlank(cnMap2.get(map.get("itemID")))){
							itemCountryCode = map.get("country");
							
						} else {
							itemCountryCode = cnMap2.get(map.get("itemID"));
						}
						itemCountryCode = itemCountryCode.replace(code.concat(","), "");//去掉产品的code国家编码
						cnMap2.put(map.get("itemID"), itemCountryCode);
						itemIdList.add(map.get("itemID"));//将属于此国家 的产品ID添加到list里
					}
				}
				cnMap.put(code, itemIdList);
			}
			for(String key : cnMap2.keySet()) {//修改item_country表
				itemService.updateItemCountry(key, cnMap2.get(key));
			}
			for(String key : cnMap.keySet()) {//删除国家分表里的itemID
				if(CollectionUtils.isNotEmpty(cnMap.get(key))) {
					itemService.batchDeleteItemCountryCode(key.trim(), cnMap.get(key));
				}
			}
		} catch (Exception e) {
			logger.error("后台管理 产品国家拉黑操作 异常 ",e);
		}
		return null;
	}
	
	
	/**
	 * 线下产品列表List
	 * @param page
	 * @param rows
	 * @param itemID
	 * @param status
	 * @param category1
	 * @param category2
	 * @param name
	 * @param addTime
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "offLineItemList")
	public Map<String, Object> itemList(@RequestParam("page") int page, @RequestParam("rows") int rows, 
			@RequestParam("rank") String rank,
			@RequestParam("status") String status,
			@RequestParam(value = "itemID", required = false) String itemID,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "addTime", required = false) String addTime) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("rank", rank);
		map.put("itemID", itemID);
		map.put("name", name);
		if(StringUtils.isNotBlank(addTime)) {
			String[] time = addTime.split("--");
			map.put("beginTime", time[0]);
			map.put("endTime", time.length>1?time[1]:"");
		}
		map.put("start", (page-1)*rows);
		map.put("end", rows);
		Map<String, Object> returnMap = null;
		try {
			returnMap = itemService.getoffLineItemList(map);
		} catch (Exception e) {
			logger.error("后台管理 线下产品列表异常,",e);
		} 
		return returnMap;
	}
	
	/**
	 * 批量删除线下产品表
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteOfline")
	public void deleteOfline(@RequestParam("ids") String ids) {
		if(StringUtils.isNotBlank(ids.trim())) {
			try {
				itemService.deleteBatchOfLine(ids.split(","));
			} catch (Exception e) {
				logger.error("后台管理 批量删除线下产品表异常==",e);
			}
		}
	}
	
	/**
	 * 修改现在产品排序，价格
	 * @param str = id+'-'+price+'-'+sortV+','
	 */
	@ResponseBody
	@RequestMapping(value = "updateOfLineSortV")
	public void updateOfLineSortV(@RequestParam("str") String str) {
		
		String[] child = null;
		if(StringUtils.isNotBlank(str.trim())) {
			try {
				for(String parent : str.split(",")) {
					if(StringUtils.isNotBlank(parent.trim())) {
						child = parent.split("-");
							itemService.updateOfLineSortVAndPrice(Integer.parseInt(child[0]), 
									Integer.parseInt(child[2]), Integer.parseInt(child[1]));
					}
				}
			} catch (Exception e) {
				logger.error("后台管理 修改现在产品排序，价格 异常==",e);
			}
		}
	}
	
	/**
	 * 新增 修改线下产品上架
	 * @param str = itemId+'-'+Router+' '+PAD+','
	 */
	@ResponseBody
	@RequestMapping(value = "addOfLineSortV")
	public void addOfLineSortV(@RequestParam("str") String str, @RequestParam("rank") String rank) {
		
		rank = rank.trim();
		List<String> oldItemList = null;
		String oldItemStrs = "";
		String[] newArr = null;
		try {
			oldItemList = itemService.getOfLineItemIdListByRank(rank);//根据rank查询已经存在于线下产品榜单中的itemId
			if(CollectionUtils.isNotEmpty(oldItemList)) {//修改已经存在的
				oldItemStrs = oldItemList.toString();
				for(String itemIDArr : str.split(",")) {
					newArr = itemIDArr.split("-");
					if(oldItemStrs.indexOf(newArr[0])>-1) {//此产品已经被添加在此类别的线下榜单表里，只需要修改操作
						itemService.updateOfLineByItemIdAndRank(newArr[0].trim(), rank, newArr[1]);
					} else {//insert 操作
						itemService.saveOfLine(rank, newArr[0].trim(), newArr[1]);
					}
				}
			} else {
				for(String itemIDArr : str.split(",")) {
					newArr = itemIDArr.split("-");
					itemService.saveOfLine(rank, newArr[0].trim(), newArr[1]);
				}
			}
		} catch (SQLException e) {
			logger.error("后台管理 新增/修改线下产品上架 异常==",e);
		}
	}
}
