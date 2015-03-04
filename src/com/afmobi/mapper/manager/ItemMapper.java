package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.afmobi.model.manager.Item;
import com.afmobi.model.manager.ItemVo;
import com.afmobi.model.manager.MusicItem;
import com.afmobi.model.manager.SoftItem;
import com.afmobi.model.manager.VideoItem;

public interface ItemMapper {

	public List<Map<String,String>> getCatesList(@Param("cate2Id") String cate2Id) throws SQLException;
	
	public int getItemListCount(@Param("map") Map<String, Object> map) throws SQLException;
	
	public List<ItemVo> getItemList(@Param("map") Map<String, Object> map) throws SQLException;
	
	public List<Map<String,String>> getTagList(@Param("cate3Id") String cate3Id) throws SQLException;
	
	public int getSoftCountBySaleId(@Param("inSaleID") String inSaleID) throws SQLException;
	
	public List<Map<String, Object>> checkSoftPackageName(@Param("packageName") String packageName) throws SQLException;
	
	public Map<String, Object> getSoftVersionCodeByItemId(@Param("itemID") String itemID) throws SQLException;
	
	public void saveItem(@Param("item") Item item) throws SQLException;

	public void saveSoft(@Param("soft") SoftItem soft)  throws SQLException;

	public void saveItemCountry(@Param("itemID") String itemID, @Param("countrys") String countrys)  throws SQLException;

	public void saveItemCountrySplit(@Param("itemCountryTable") String itemCountryTable, @Param("itemID") String itemID) throws SQLException;

	public void saveItemTag(@Param("itemID") String itemID, @Param("tagID") String tagID) throws SQLException;

	public void saveItemSearch(@Param("itemSearchTable") String itemSearchTable,@Param("term") String term, @Param("itemID") String itemID) throws SQLException;

	public void saveItemStatics(@Param("itemNum") String itemNum, @Param("star") int star) throws SQLException;

	public void saveVideo(@Param("video") VideoItem video)  throws SQLException;
	
	public void saveMusic(@Param("music") MusicItem music)  throws SQLException;
	
	public void deleteItem(@Param("itemID") String itemID) throws SQLException;
	
	public void deleteItemTable(@Param("itemTable") String itemTable, @Param("itemID") String itemID) throws SQLException;
	
	public void deleteItemCountry(@Param("itemID") String itemID) throws SQLException;
	
	public void deleteItemTag(@Param("itemID") String itemID) throws SQLException;
	
	public void updateBatchItemStatus(@Param("status") String status, @Param("itemIdArr") String[] itemIdArr) throws SQLException;
	
	public Item getItemByItemID(@Param("itemID")  String itemID) throws SQLException;
	
	public SoftItem getSoftByItemID(@Param("itemID") String itemID) throws SQLException;
	
	public VideoItem getVideoByItemID(@Param("itemID") String itemID) throws SQLException;
	
	public MusicItem getDigitalByItemID(@Param("itemID") String itemID) throws SQLException;
	
	public List<Map<String,Integer>> getTagsByItemId(@Param("itemID") String itemID) throws SQLException;
	
	public Map<String, Object> getItemStaticsByItemNum(@Param("itemNum") String itemNum) throws SQLException;
	
	public void updateItemCountry(@Param("itemID") String itemID, @Param("countryCodes") String countryCodes) throws SQLException;
	
	public void updateItem(@Param("item") Item item) throws SQLException;
	
	public void updateSoft(@Param("soft") SoftItem item) throws SQLException;
	
	public void updateVideo(@Param("video")  VideoItem video)  throws SQLException;
	
	public void updateMusic(@Param("music") MusicItem music)  throws SQLException;
	
	public int getItemCountByItemId(@Param("itemID") String itemID) throws SQLException;
	
	public String getItemCountryCode(@Param("itemID") String itemID) throws SQLException;
	
	public void deleteCpItemCheck(@Param("itemID") String itemID) throws SQLException;
	
	public void updateItemId(@Param("tableName") String tableName, @Param("listItemId") String listItemId,
			@Param("itemID") String itemID) throws SQLException;
	
	public String getItemGateGory2(@Param("itemID") String itemID) throws SQLException;
	
	public void updateStatus(@Param("itemID") String itemID,
			@Param("status") String status) throws SQLException;
	
	public List<Map<String, String>> itemListByids(@Param("array") String[] itemIdArr) throws SQLException;
	
	public List<Map<String, String>> itemListByName(@Param("category2") String category2, 
			@Param("name") String name) throws SQLException;
	
	public List<Map<String, String>> itemCountryListByItemIDs(@Param("array") String[] itemIDArray) throws SQLException; 
	
	public void batchDeleteItemCountryCode(@Param("code") String code, @Param("list") List<String> list) throws SQLException;   
	
	public List<Map<String, String>> itemListByNameOrId(@Param("name") String name) throws SQLException;
	
	public void deleteOfflineByItemID(@Param("array") String[] array) throws SQLException;
	
	public Map<String,Object> getItemPackageByItemID(@Param("itemID") String itemID, @Param("status") String status) throws SQLException;
	
	public void deleteBatchItemStatics(@Param("array") String[] array) throws SQLException;
	
	public String getItemNumByPackageName(@Param("packageName") String packageName) throws SQLException;
	
	public List<String> getitemNumsByitemId(@Param("itemID") String itemID) throws SQLException;
	
	public List<ItemVo> getoffLineItemList(@Param("map") Map<String, Object> map) throws SQLException;

	public int getoffLineItemCounts(@Param("map") Map<String, Object> map) throws SQLException;
	
	public void deleteBatchOfLine(@Param("idArr") String[] idArr) throws SQLException;
	
	public void updateOfLineSortVAndPrice(@Param("id") int id, @Param("sortV") int sortV, 
			@Param("price") int price) throws SQLException;
	
	public List<String> getOfLineItemIdListByRank(@Param("rank") String rank) throws SQLException;
	
	public void updateOfLineByItemIdAndRank(@Param("itemId") String itemID, @Param("rank") String rank,
			@Param("deviceType") String deviceType) throws SQLException;
	
	public void saveOfLine(@Param("rank") String rank, @Param("itemId") String itemId,
			@Param("deviceType") String deviceType) throws SQLException;
}
 