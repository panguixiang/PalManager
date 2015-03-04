package com.afmobi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.frame.ApplicationListener;
import com.afmobi.frame.ContentObject;
import com.afmobi.model.manager.CateGory3;
import com.afmobi.service.CateGoryService;
import com.afmobi.util.CommonUtil;

/**
 * 类别管理控制器
 * @author panguixiang
 *
 */
@Controller
@RequestMapping("/category")
public class CateGoryController {

	static Logger logger = Logger.getLogger(CateGoryController.class.getName());
	
	
	@Autowired
	private CateGoryService cateService;
	
	/**
	 * 类别列表
	 * @param selectedCategory
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "list")
	public Map<String, Object> list(@RequestParam("selectedCategory") String selectedCategory) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CateGory3> list = null;
		try {
			list = cateService.list(selectedCategory.trim());
		} catch (Exception e) {
			logger.error(e);
		}
		map.put("rows", list);
		return map;
	}
	
	/**
	 * 进入新增、修改 三级类别页面
	 * @param cateId
	 * @param category2
	 * @param mode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "initupdate")
	public Map<String, Object> initupdate(@RequestParam(value = "cateId", required = false) String cateId, 
			@RequestParam("category2") String category2) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(cateId)) {//修改操作
			try {
				map.put("category3", cateService.getCateGory3ById(cateId));
				map.put("tagList",cateService.tagListByCate3(cateId));
			} catch (Exception e) {
				logger.error(e);
			}
		}
		map.put(ContentObject.SOURCE_URL,
				ApplicationListener.getValueByKey(ContentObject.STATIC_URL));
		map.put("category2", category2);
		return map;
	}
	
	/**
	 * 删除标签
	 * @param tagIDS
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteTag")
	public Map<String, Object> deleteTag(@RequestParam("tagIDS") String tagIDS) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			cateService.batchDeleteTag(tagIDS.split(","));
		} catch (Exception e) {
			logger.error(e);
		}
		return map;
	}
	
	/**
	 * 删除Cate3
	 * @param Cate3
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "deleteCate")
	public Map<String, Object> deleteCate(@RequestParam("cate3Id") String cate3Id) {
		try {
			cateService.deleteCate3(cate3Id.trim());
		} catch (Exception e) {
			logger.error(e);
		}
		return null;
	}
	
	
	/**
	 * 新增三级类别
	 * @param gory3
	 * @param addTagHid
	 * @param mode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "addCate3")
	public String initupdate(CateGory3 gory3, String addTagHid) {
		try {
			if(StringUtils.isNotBlank(gory3.getCategory3())) {//修改操作
				cateService.updateCateGory3(gory3);
			} else {
				gory3.setCategory3(CommonUtil.create32UUID());
				cateService.addCateGory3(gory3);
			}
			if(StringUtils.isNotBlank(addTagHid)) {
				List<Map<String,String>> list = new ArrayList<Map<String,String>>();
				Map<String, String> map = null;
				String[] tagArr = addTagHid.split("\\|");
				for(String tagName : tagArr) {
					map = new HashMap<String, String>();
					map.put("name", tagName);
					map.put("category3", gory3.getCategory3());
					list.add(map);
				}
				if(list.size()>0) {
					cateService.batchAddTag(list);
				}
			}
		} catch (Exception e) {
			logger.error(e);
		}
		return "";
	}
	
}
