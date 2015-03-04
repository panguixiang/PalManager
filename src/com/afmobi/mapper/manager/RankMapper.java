package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface RankMapper {
	
	public int getRankCountByType(@Param("type") String type) throws SQLException;

	public List<Map<String, Object>> getRankListByType(@Param("type") String type, 
			@Param("start") int start, @Param("end") int end) throws SQLException;

	public void addRank(@Param("name") String name, @Param("rankType") String rankType, 
			@Param("rule") String rule, @Param("category1") String category1, @Param("category2") String category2) throws SQLException; 
	
	public void updateRank(@Param("rankID") String rankID, @Param("name") String name, @Param("rule") String rule) throws SQLException;
	
	public void deleteRank(@Param("rankID") String rankId) throws SQLException;
	
	public List<Map<String, String>> feautureList(@Param("itemID") String itemID) throws SQLException;
	
	public void updateFeauture(@Param("field") String field, @Param("newItemId") String newItemId, 
			@Param("feautype") String feautype) throws SQLException;
	
	public List<Map<String, Object>> collectionList(@Param("start") int start, @Param("end") int end) throws SQLException;
	
	public int collectionCount() throws SQLException;
	
	public void addCollection(@Param("name") String name, @Param("iconID") String iconId, @Param("des") String des, 
			@Param("category1") String cate1gory, @Param("category2") String cate2gory) throws SQLException;
	
	public void updateCollection(@Param("colId") String colId, @Param("name") String name, @Param("iconID") String iconId, @Param("des") String des, 
			@Param("category1") String cate1gory, @Param("category2") String cate2gory) throws SQLException;
	
	public Map<String, Object> initUpdateCollection(@Param("colId") String colId) throws SQLException;
	
	public void deleteCollByID(@Param("colId") String colID) throws SQLException;
	 
	public void updateSortV(@Param("sortV") int sortV, @Param("colId") String colId, 
			@Param("tableName") String tableName, @Param("key") String key) throws SQLException;
	
	public int homeRankItemCount(@Param("map") Map<String, Object> Map) throws SQLException;
	
	public List<Map<String, Object>> homeRankItemList(@Param("map") Map<String, Object> Map) throws SQLException;
	
	public Map<String, Object> getRankByRankId(@Param("rankID") String rankId) throws SQLException;
	
	public void addBatchItemHomeRank(@Param("array") String[] array, @Param("rankID") String rankID) throws SQLException;
	
	public void deleteItemHomeRank(@Param("array") String[] idArray) throws SQLException;
	
	public void deleteItemHomeRankByRankId(@Param("rankID") String rankID) throws SQLException;
	
	public List<String> getItemIdFromItemHomeRankByRankId(@Param("rankID") String rankID) throws SQLException;
	
	public void updateAdJson(@Param("rankID") String rankID, @Param("adJsonStr") String adJsonStr, 
			@Param("field") String field) throws SQLException;

	public void deleteHomeRankByItemID(@Param("array") String[] array) throws SQLException;
	
	public void deleteCollectionByItemID(@Param("array") String[] array) throws SQLException;
	
	public int collectionItemCount(@Param("map") Map<String, Object> Map) throws SQLException;
	
	public List<Map<String, Object>> collectionItemList(@Param("map") Map<String, Object> Map) throws SQLException;
	 
	public List<String> getCollectionItemByColId(@Param("colID") String rankID) throws SQLException;
	
	public void addBatchCollectItems(@Param("array") String[] array, @Param("colID") String colID) throws SQLException;
	
	public void deleteCollectionItemByID(@Param("array") String[] idArray) throws SQLException;
	
	public void deleteCollectionItemByColId(@Param("colID") String colID) throws SQLException;
}
