package com.afmobi.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.frame.ApplicationListener;
import com.afmobi.frame.ContentObject;
import com.afmobi.service.ItemService;
import com.afmobi.service.RankService;

/**
 * 榜单管理controller
 * @author panguixiang
 *
 */
@Controller
@RequestMapping("/rank")
public class RankController {
	
	static Logger logger = Logger.getLogger(RankController.class.getName());
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private ItemService itemService;
	
	/**
	 * 后台管理查询榜单分页列表
	 * @param page
	 * @param rows
	 * @param rankType
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "rankList")
	public Map<String, Object> rankList(@RequestParam("page") int page, @RequestParam("rows") int rows, 
			 @RequestParam("rankType") String rankType) {
		Map<String, Object> map = null;
		try {
			map = rankService.getRankListByType(rankType, (page-1)*rows, rows);
		} catch (SQLException e) {
			logger.error("后台管理查询榜单分页列表，异常=", e);
		}
		return map;
	}
	
	/**
	 * 新增榜单
	 * @param rankType
	 * @param name
	 * @param cate1Name
	 * @param cate2Name
	 * @param rule
	 */
	@ResponseBody
	@RequestMapping(value = "addRank")
	public void addRank(@RequestParam(value = "rankID", required = false) String rankID,  @RequestParam("type") String rankType,
			@RequestParam("name") String name, @RequestParam(value = "category1", required = false) String category1, 
			@RequestParam(value = "category2", required = false) String category2, 
			 @RequestParam(value = "rule", required = false) String rule) {
		
		try {
			if(StringUtils.isNotBlank(rankID.trim())) {
				rankService.updateRank(rankID, name, rule);
			} else {
				rankService.addRank(name, rankType, rule, category1, category2);
			}
		} catch (SQLException e) {
			logger.error("后台管理新增榜单，异常=", e);
		}
	}
	
	/**
	 * 删除榜单
	 * @param rankID
	 * @param type
	 */
	@ResponseBody
	@RequestMapping(value = "deleteRank")
	public void deleteRank(@RequestParam("rankID") String rankID, 
			@RequestParam(value = "type", required = false) String type) {
		try {
			rankService.deleteRank(rankID.trim(), type);
		} catch (SQLException e) {
			logger.error("后台管理新增榜单，异常=", e);
		}
	}
	
	/**
	 * feature列表页
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "featureList")
	public String feautureList(Model model, @RequestParam(value = "category2", required = false) String category2)  {
		List<Map<String, String>> feauturList = null;
		String[] itemIdArr = new String[5];
		Map<String, List<Map<String, String>>> returnMap = new HashMap<String, List<Map<String, String>>>();
		try {
			feauturList = rankService.feautureList(null);
			for(Map<String, String> feauture : feauturList) {
				itemIdArr[0] = feauture.get("itemID0");
				itemIdArr[1] = feauture.get("itemID1");
				itemIdArr[2] = feauture.get("itemID2");
				itemIdArr[3] = feauture.get("itemID3");
				itemIdArr[4] = feauture.get("itemID4");
				returnMap.put(feauture.get("featureType"), itemService.itemListByids(itemIdArr));
			}
		} catch (SQLException e) {
			logger.error("后台管理feauture榜单列表，异常=", e);
		}
		model.addAttribute("category2", category2);
		model.addAttribute(ContentObject.STATIC_URL, ApplicationListener.getValueByKey(ContentObject.STATIC_URL));
		model.addAttribute("feautMap", returnMap);
		return "admin/rank/feautureList";
	}
	
	/**
	 * 根据item名称，二级类别，查询item集合
	 * @param category2
	 * @param name
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "searchFeItemList")
	public Map<String, Object> addFeauteList(@RequestParam(value = "category2", required = false) String category2, @RequestParam("name") String name) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, String>> list = null;
		try {
			if(StringUtils.isBlank(category2)) {
				list = itemService.itemListByNameOrId(name);
			} else if((category2.trim()).length()>0){
				list = itemService.itemListByName(category2, name);
			}
		} catch (SQLException e) {
			logger.error("后台管理查询榜单分页列表，异常=", e);
		}
		returnMap.put("rows", list);
		return returnMap;
	}
	
	/**
	 * feature修改
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updateFeature")
	public String update(@RequestParam("field") String field, @RequestParam("newItemId") String newItemId,
			@RequestParam("feautype") String feautype)  {
		
		try {
			rankService.updateFeauture(field, newItemId, feautype);
		} catch (SQLException e) {
			logger.error("后台管理 feature榜单修改，异常=", e);
		}
		
		return "redirect:/rank/featureList?category2="+feautype;
	}
	
	/**
	 * 后台管理查询专题分页列表
	 * @param page
	 * @param rows
	 * @param rankType
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "collectionList")
	public Map<String, Object> collectionList(@RequestParam("page") int page, @RequestParam("rows") int rows) {
		Map<String, Object> map = null;
		try {
			map = rankService.collectionList((page-1)*rows, rows);
		} catch (SQLException e) {
			logger.error("后台管理查询榜单分页列表，异常=", e);
		}
		return map;
	}
	
	/**
	 * 添加 修改 collection榜单
	 * @param name
	 * @param iconId
	 * @param des
	 * @param cate1gory
	 * @param cate2gory
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "addCollection")
	public Map<String, Object> addCollection(@RequestParam(value = "colID", required = false) String colID, @RequestParam("name") String name, 
			@RequestParam("iconId") String iconId, @RequestParam(value = "des", required = false) String des, @RequestParam("cate1gory") 
		String cate1gory, @RequestParam(value = "cate2gory", required = false) String cate2gory) {
		cate2gory = StringUtils.isBlank(cate2gory)?"":cate2gory;
		try {
			if(StringUtils.isNotBlank(colID)) {
				rankService.updateCollection(colID, name, iconId, des, cate1gory, cate2gory);
			} else {
				rankService.addCollection(name, iconId, des, cate1gory, cate2gory);
			}
		} catch (SQLException e) {
			logger.error("后台管理 修改，添加 collection榜单，异常=", e);
		}
		return null;
	}
	
	/**
	 * 获得collection榜单数据
	 * @param name
	 * @param iconId
	 * @param des
	 * @param cate1gory
	 * @param cate2gory
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "initUpdateCollection")
	public Map<String, Object> initUpdateCollection(@RequestParam("colId") String colId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap = rankService.initUpdateCollection(colId);
		} catch (SQLException e) {
			logger.error("后台管理 添加collection榜单，异常=", e);
		}
		return returnMap;
	}
	
	/**
	 * 删除collection专题
	 * @param colID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteColl")
	public Map<String, Object> deleteCollByID(@RequestParam("colID") String colID) {
		try {
			rankService.deleteCollByID(colID.trim());
		} catch (Exception e) {
			logger.error("后台管理 删除collection专题，异常=", e);
		}
		return null;
	}
	
	/**
	 * 修改  排序
	 * @param colID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateSortV")
	public Map<String, Object> updateCollSortV(@RequestParam("ids") String ids,
			 @RequestParam("key") String key, @RequestParam("tableName") String tableName) {
		
		if(StringUtils.isBlank(ids.trim())) {
			return null;
		}
		String[] parentArr,mapArr;
		try {
			parentArr = ids.split("\\|");
			for(String s : parentArr) {
				if(StringUtils.isNotBlank(s)) {
					mapArr = s.split(",");
					rankService.updateSortV(Integer.parseInt(mapArr[1]), mapArr[0], tableName, key);
				}
			}
		} catch (Exception e) {
			logger.error("后台管理 修改  排序，异常=", e);
		}
		return null;
	}
	
	/**
	 * 初始化版本产品列表页
	 * @param model
	 * @param rankId
	 * @param category
	 * @param view
	 * @return
	 */
	@RequestMapping(value = "initRankItem")
	public String initRankItem(Model model, @RequestParam("rankID") String rankID,
			@RequestParam("view") String view) {
		Map<String, Object> rankMap;
		try {
			rankMap = rankService.getRankByRankId(rankID);
			model.addAttribute("rank", rankMap);
		} catch (SQLException e) {
			logger.error("后台管理 根据rankID获得rank对象，异常=", e);
		}
		return view;
	}
	
	
	/**
	 * 手动榜单产品列表
	 * @param itemID
	 * @param itemName
	 * @param category1
	 * @param category2
	 * @param rankID
	 * @param page
	 * @param rows
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "homeRankItemList")
	public Map<String, Object> homeRankItemList(@RequestParam(value = "itemID", required = false) String itemID, 
			@RequestParam(value = "itemName", required = false) String itemName, 
			@RequestParam(value = "category1", required = false) String category1,
			@RequestParam(value = "category2", required = false) String category2, 
			@RequestParam("rankID") String rankID,
			@RequestParam("page") int page, @RequestParam("rows") int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> returnMap = null;
		map.put("start", (page-1)*rows);
		map.put("end", rows);
		map.put("itemID", itemID);
		map.put("itemName", itemName);
		map.put("category1", category1);
		map.put("category2", category2);
		map.put("rankID", rankID);
		try {
			returnMap = rankService.homeRankItemList(map);
		} catch (SQLException e) {
			logger.error("后台管理查询榜单分页列表，异常=", e);
		}
		return returnMap;
	}
	
	/**
	 * 批量插入产品手动榜单表
	 * @param itemIDS
	 * @param rankID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "addItemHomeRank")
	public Map<String, Object> addBatchItemHomeRank(@RequestParam("itemIDS") String itemIDS, 
			@RequestParam("rankID") String rankID) {
		
		if(StringUtils.isBlank(itemIDS.trim())) {
			return null;
		} 
		String[] array = itemIDS.split(",");
		rankID = rankID.trim();
		List<String> readyItemIdList = null;
		try {
			readyItemIdList = rankService.getItemIdFromItemHomeRankByRankId(rankID);
			if(CollectionUtils.isEmpty(readyItemIdList)) {
				rankService.addBatchItemHomeRank(array, rankID);
			} else { //过滤掉已经被添加的itemID
				for(String itemId : array) {
					if(readyItemIdList.contains(itemId)) {//如果已经存在则移除
						array = ArrayUtils.removeElement(array, itemId);
					}
				}
				if(array.length>0) {
					rankService.addBatchItemHomeRank(array, rankID);
				}
			}
		} catch (SQLException e) {
			logger.error("后台管理 批量插入产品手动榜单表，异常=", e);
		}
		return null;
	} 
	
	/**
	 * 删除手动榜单产品
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteItemHomeRank")
	public Map<String, Object> deleteItemHomeRank(@RequestParam("id") String id) {
		
		if(StringUtils.isBlank(id.trim())) {
			return null;
		}
		try {
			  rankService.deleteItemHomeRank(id.split(","));
		} catch (Exception e) {
			logger.error("后台管理 删除手动榜单产品，异常=", e);
		}
		return null;
	}
	
	/**
	 * rank榜单(非手动榜单，排名榜单)产品列表
	 * @param itemID
	 * @param itemName
	 * @param category1
	 * @param category2
	 * @param rankID
	 * @param page
	 * @param rows
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "rankItemList")
	public Map<String, Object> rankItemList(@RequestParam("category2") String category2, 
			@RequestParam("page") int page, @RequestParam("rows") int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> returnMap = null;
		map.put("start", (page-1)*rows);
		map.put("end", rows);
		map.put("category2", category2);
		map.put("status", ContentObject.LIST);
		try {
			returnMap = itemService.getItemList(map);
		} catch (SQLException e) {
			logger.error("后台管理 查询rank榜单(非手动榜单，排名榜单)产品列表，异常=", e);
		}
		return returnMap;
	}
	
	/**
	 * 修改广告Adjson
	 * @param rankID
	 * @param adJsonStr
	 * @param field
	 */
	@ResponseBody
	@RequestMapping(value = "updateAdJson")
	public void updateAdJson(@RequestParam("rankID") String rankID, @RequestParam(value = "adJsonStr", required = false) String adJsonStr, 
			@RequestParam("field") String field) {
		try {
			rankService.updateAdJson(rankID, adJsonStr, field);
		} catch (SQLException e) {
			logger.error("后台管理 查询rank榜单(非手动榜单，排名榜单)产品列表，异常=", e);
		}
	}
	
	
	/**
	 * 初始化专题产品列表页
	 * @param model
	 * @param rankId
	 * @param category
	 * @param view
	 * @return
	 */
	@RequestMapping(value = "initCollectItemList")
	public String initCollectItemList(Model model, @RequestParam("colID") String colID) {
		Map<String, Object> map;
		try {
			map = rankService.initUpdateCollection(colID.trim());
			model.addAttribute("col", map);
		} catch (SQLException e) {
			logger.error("后台管理 初始化collection产品列表页，异常=", e);
		}
		return "admin/rank/collectItemList";
	}
	
	/**
	 * collection榜单产品列表
	 * @param itemID
	 * @param itemName
	 * @param category1
	 * @param category2
	 * @param rankID
	 * @param page
	 * @param rows
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "collectionItemList")
	public Map<String, Object> collectionItemList(@RequestParam(value = "itemID", required = false) String itemID, 
			@RequestParam(value = "itemName", required = false) String itemName, 
			@RequestParam(value = "category1", required = false) String category1,
			@RequestParam(value = "category2", required = false) String category2, 
			@RequestParam("colID") String colID,
			@RequestParam("page") int page, @RequestParam("rows") int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> returnMap = null;
		map.put("start", (page-1)*rows);
		map.put("end", rows);
		map.put("itemID", itemID);
		map.put("itemName", itemName);
		map.put("category1", category1);
		map.put("category2", category2);
		map.put("colID", colID);
		try {
			returnMap = rankService.collectionItemList(map);
		} catch (SQLException e) {
			logger.error("后台管理查询collection榜单产品分页列表，异常=", e);
		}
		return returnMap;
	}
	
	
	/**
	 * 批量新增collection榜单产品
	 * @param itemIDS
	 * @param rankID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "addCollectionItems")
	public Map<String, Object> addCollectionItems(@RequestParam("itemIDS") String itemIDS, 
			@RequestParam("colID") String colID) {
		
		if(StringUtils.isBlank(itemIDS.trim())) {
			return null;
		} 
		String[] array = itemIDS.split(",");
		colID = colID.trim();
		List<String> readyItemIdList = null;
		try {
			readyItemIdList = rankService.getCollectionItemByColId(colID);
			if(CollectionUtils.isEmpty(readyItemIdList)) {
				rankService.addBatchCollectItems(array, colID);
			} else { //过滤掉已经被添加的itemID
				for(String itemId : array) {
					if(readyItemIdList.contains(itemId)) {//如果已经存在则移除
						array = ArrayUtils.removeElement(array, itemId);
					}
				}
				if(array.length>0) {
					rankService.addBatchCollectItems(array, colID);
				}
			}
		} catch (SQLException e) {
			logger.error("后台管理批量新增collection榜单产品，异常=", e);
		}
		return null;
	} 
	
	/**
	 * 删除collection榜单产品
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteCollectItems")
	public Map<String, Object> deleteCollectItems(@RequestParam("id") String id) {
		
		if(StringUtils.isBlank(id.trim())) {
			return null;
		}
		try {
			  rankService.deleteCollectionItemByID(id.split(","));
		} catch (Exception e) {
			logger.error("后台管理 删除手动榜单产品，异常=", e);
		}
		return null;
	}
	
}
