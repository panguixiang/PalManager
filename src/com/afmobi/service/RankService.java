package com.afmobi.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.RankMapper;

/**
 * 榜单管理模块service
 * @author panguixiang
 *
 */
@Service
public class RankService {

	@Autowired
	private RankMapper rankMapper;
	
	
	/**
	 * 查询榜单分页列表
	 * @param type
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> getRankListByType(String type, int start, int end) throws SQLException{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = rankMapper.getRankListByType(type, start, end);
		returnMap.put("total",rankMapper.getRankCountByType(type));
		returnMap.put("rows", list);
		return returnMap;
	}
	
	/**
	 * 新增榜单
	 * @param name
	 * @param rankType
	 * @param sortV
	 * @param rule
	 * @param category1
	 * @param category2
	 * @throws SQLException
	 */
	public void addRank(String name, String rankType, String rule, 
			String category1, String category2) throws SQLException {
		rankMapper.addRank(name, rankType, rule, category1, category2);
	}
	
	/**
	 * 删除榜单
	 * @param rankID
	 * @throws SQLException
	 */
	public void deleteRank(String rankID, String type) throws SQLException {
		
		rankMapper.deleteRank(rankID);
		if(StringUtils.isNotBlank(type)) {
			rankMapper.deleteItemHomeRankByRankId(rankID);
		}
	}
	
	public void updateRank(String rankID, String name, String rule) throws SQLException {
		rankMapper.updateRank(rankID, name, rule);
	}
	
	public List<Map<String, String>> feautureList(String itemID) throws SQLException {
		return rankMapper.feautureList(itemID);
	}
	
	public void updateFeauture(String field, String newItemId, String feautype) throws SQLException {
		rankMapper.updateFeauture(field, newItemId, feautype);
	}
	
	/**
	 * 查询专题分页列表
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> collectionList(int start, int end) throws SQLException{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = rankMapper.collectionList(start, end);
		returnMap.put("total",rankMapper.collectionCount());
		returnMap.put("rows", list);
		return returnMap;
	}
	
	public void addCollection(String name, String iconId, String des, String cate1gory, String cate2gory) throws SQLException{
		rankMapper.addCollection(name, iconId, des, cate1gory, cate2gory);
	}

	public void updateCollection(String colId, String name, String iconId, String des, String cate1gory, String cate2gory) throws SQLException{
		rankMapper.updateCollection(colId, name, iconId, des, cate1gory, cate2gory);
	}
	
	public Map<String, Object> initUpdateCollection(String colId) throws SQLException {
		return rankMapper.initUpdateCollection(colId);
	}
	
	public void deleteCollByID(String colID) throws SQLException {
		rankMapper.deleteCollByID(colID);
		rankMapper.deleteCollectionItemByColId(colID);
	}
	
	public void updateSortV(int sortv, String colId, String tableName, String key) throws SQLException {
		rankMapper.updateSortV(sortv, colId, tableName, key);
	}
	
	public Map<String, Object> getRankByRankId(String rankId) throws SQLException {
		return rankMapper.getRankByRankId(rankId);
	}
	
	/**
	 * 查询home普通榜单产品分页列表
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> homeRankItemList(Map<String, Object> paramMap) throws SQLException{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = rankMapper.homeRankItemList(paramMap);
		returnMap.put("total",rankMapper.homeRankItemCount(paramMap));
		returnMap.put("rows", list);
		return returnMap;
	}
	
	/**
	 * 根据rankID查询产品手动榜单表 item_home_rank 里关联的itemID集合
	 * @param rankID
	 * @return
	 * @throws SQLException
	 */
	public List<String> getItemIdFromItemHomeRankByRankId(String rankID) throws SQLException{
		return rankMapper.getItemIdFromItemHomeRankByRankId(rankID);
	}
	
	/**
	 * 批量插入产品手动榜单表
	 * @param array
	 * @param rankID
	 * @throws SQLException
	 */
	public void addBatchItemHomeRank(String[] array, String rankID) throws SQLException {
		rankMapper.addBatchItemHomeRank(array, rankID);
	}
	
	/**
	 * 删除手动榜单产品
	 * @param idArray
	 * @throws SQLException
	 */
	public void deleteItemHomeRank(String[] idArray) throws SQLException {
		rankMapper.deleteItemHomeRank(idArray);
	}
	
	public void updateAdJson(String rankID, String adJsonStr, String field) throws SQLException {
		rankMapper.updateAdJson(rankID, adJsonStr, field);
	}
	
	public void deleteHomeRankByItemID(String[] array) throws SQLException {
		rankMapper.deleteHomeRankByItemID(array);
	}
	
	public void deleteCollectionByItemID(String[] array) throws SQLException {
		rankMapper.deleteCollectionByItemID(array);
	}
	
	
	/**
	 * 查询collection榜单产品分页列表
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> collectionItemList(Map<String, Object> paramMap) throws SQLException{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = rankMapper.collectionItemList(paramMap);
		returnMap.put("total",rankMapper.collectionItemCount(paramMap));
		returnMap.put("rows", list);
		return returnMap;
	}
	
	
	/**
	 * 根据colID查询item_collection里关联的itemID集合
	 * @param colID
	 * @return
	 * @throws SQLException
	 */
	public List<String> getCollectionItemByColId(String colID) throws SQLException{
		return rankMapper.getCollectionItemByColId(colID);
	}
	
	
	/**
	 * 批量新增collection产品
	 * @param array
	 * @param colID
	 * @throws SQLException
	 */
	public void addBatchCollectItems(String[] array, String colID) throws SQLException {
		rankMapper.addBatchCollectItems(array, colID);
	}
	
	public void deleteCollectionItemByID(String[] array) throws SQLException {
		rankMapper.deleteCollectionItemByID(array);
	}
}
