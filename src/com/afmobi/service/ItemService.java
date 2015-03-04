package com.afmobi.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.frame.ContentObject;
import com.afmobi.mapper.manager.CpMapper;
import com.afmobi.mapper.manager.ItemMapper;
import com.afmobi.mapper.manager.RankMapper;
import com.afmobi.model.manager.Item;
import com.afmobi.model.manager.ItemVo;
import com.afmobi.model.manager.MusicItem;
import com.afmobi.model.manager.SoftItem;
import com.afmobi.model.manager.VideoItem;
import com.afmobi.util.CommonUtil;

@Service
public class ItemService {

	@Autowired
	private ItemMapper itemMapper;
	
	@Autowired
	private CpMapper cpMapper;
	
	@Autowired
	private RankMapper rankMapper;
	
	/**
	 * 商品编辑分页列表
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getItemList(Map<String, Object> map) throws SQLException {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int count = itemMapper.getItemListCount(map);
		List<ItemVo> list = itemMapper.getItemList(map);
		returnMap.put("total",count);
		returnMap.put("rows", list);
		return returnMap;
	}
	
	/**
	 * 线下产品分页列表
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> getoffLineItemList(Map<String, Object> map) throws SQLException {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int count = itemMapper.getoffLineItemCounts(map);
		List<ItemVo> list = itemMapper.getoffLineItemList(map);
		returnMap.put("total",count);
		returnMap.put("rows", list);
		return returnMap;
	}
	
	public List<Map<String,String>> getCatesList(String cate2Id) throws SQLException {
		return itemMapper.getCatesList(cate2Id);
	}
	
	public List<Map<String,String>> getTagList(String cate3Id) throws SQLException {
		return itemMapper.getTagList(cate3Id);
	}
	
	public int getSoftCountBySaleId(String inSaleID) throws SQLException {
		return itemMapper.getSoftCountBySaleId(inSaleID);
	}
	
	/**
	 * 根据包名称获得itemId和版本号,状态
	 * @param packageName
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, Object>> checkSoftPackageName(String packageName) throws SQLException {
		return itemMapper.checkSoftPackageName(packageName);
	}
	
	/**
	 * 根据itemId获得版本号
	 * @param itemID
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> getSoftVersionCodeByItemId(String itemID) throws SQLException {
		return itemMapper.getSoftVersionCodeByItemId(itemID);
	}
	
	
	/**
	 * 添加soft产品
	 * @param item
	 * @param soft
	 * @param itemId
	 * @throws Exception
	 */
	public void softSave(Item item, SoftItem soft, String itemId, String intSalePool, boolean isSaveStatic, String type) throws Exception {
		item.setItemID(itemId);
		soft.setItemID(itemId);
		itemMapper.saveSoft(soft);
		saveProduct(item, item.getName(), itemId, isSaveStatic);//search_soft 与 search_picture 的 term字段只包括产品名称。
		/**
		 * 修改cp内计费池 
		 */
		if(!StringUtils.equals(type,"renew") && StringUtils.equals(soft.getIsInSale(),"T")) {//非更新操作 并且是内计费则需要修改cp内计费池
			cpMapper.updateInSalePool(item.getCpID(), CommonUtil.lpad(3,Integer.parseInt(intSalePool)+1));
		}
	}
	
	/**
	 * 修改soft产品
	 * @param item
	 * @param soft
	 * @throws Exception
	 */
	public void updateSoft(Item item, SoftItem soft, String oldCountryCodes, String oldCategory2) throws Exception {
		itemMapper.updateSoft(soft);
		updateProduct(item, item.getName(), oldCountryCodes, oldCategory2);//search_soft 与 search_picture 的 term字段只包括产品名称。
	}
	
	/**
	 * 添加Video产品
	 * @param item
	 * @param video
	 * @param itemId
	 * @throws Exception
	 */
	public void saveVideo(Item item, VideoItem video, String itemId) throws Exception {
		item.setItemID(itemId);
		video.setItemID(itemId);
		itemMapper.saveVideo(video);
		StringBuffer buffer = new StringBuffer();
		buffer.append(item.getName()).append(" ").append(video.getDirector()).append(" ").append(video.getActor());
		saveProduct(item, buffer.toString(), itemId, true);//search_video 的 term 字段包含：产品名称 空格 导演 空格 主演
	}
	
	/**
	 * 修改Video产品
	 * @param item
	 * @param soft
	 * @throws Exception
	 */
	public void updateVideo(Item item, VideoItem video, String oldCountryCodes, String oldCategory2) throws Exception {
		itemMapper.updateVideo(video);
		updateProduct(item, item.getName(), oldCountryCodes, oldCategory2);//search_soft 与 search_picture 的 term字段只包括产品名称。
	}
	
	
	/**
	 * 添加Music picture产品
	 * @param item
	 * @param music
	 * @param itemId
	 * @throws Exception
	 */
	public void saveMusic(Item item,  MusicItem music, String itemId) throws Exception {
		item.setItemID(itemId);
		music.setItemID(itemId);
		itemMapper.saveMusic(music);
		StringBuffer buffer = new StringBuffer();
		buffer.append(item.getName()).append(" ").append(music.getSinger());
		saveProduct(item, buffer.toString(), itemId, true);//search_music 的 term字段包含：产品名称 空格 歌手
	}
	
	/**
	 * 修改 Music picture产品
	 * @param item
	 * @param MusicItem
	 * @throws Exception
	 */
	public void updateMusic(Item item,  MusicItem music, String oldCountryCodes, String oldCategory2) throws Exception {
		itemMapper.updateMusic(music);
		updateProduct(item, item.getName(), oldCountryCodes, oldCategory2);//search_soft 与 search_picture 的 term字段只包括产品名称。
	}
	
	/**
	 * 新增产品公共service
	 * @param item
	 * @param term
	 * @param itemId
	 * @param isSaveStatic
	 * @throws Exception
	 */
	private void saveProduct(Item item,  String term, String itemId, boolean isSaveStatic) throws Exception {
		itemMapper.saveItem(item);
		itemMapper.saveItemCountry(itemId, item.getCountryCodes());
		if(StringUtils.isNotBlank(item.getCountryCodes())) {
			String[] countrCodeArr = item.getCountryCodes().split(",");
			for(String country:countrCodeArr) {
				if(StringUtils.isNotBlank(country)) {
					itemMapper.saveItemCountrySplit("item_country_"+country.trim(), itemId);
				}
			}
		}
		if(StringUtils.isNotBlank(item.getTagCheckRight())) {
			for(String tag:item.getTagCheckRight().split(",")) {
				if(StringUtils.isNotBlank(tag)) {
					itemMapper.saveItemTag(itemId, tag);
				}
			}
		}
		String tableName = CommonUtil.searchTableName(item.getItemID(), item.getCategory2());
		if(StringUtils.isNotBlank(tableName)) {
			itemMapper.saveItemSearch(tableName.split(",")[1], term, itemId);
		}
		if(isSaveStatic) {
			itemMapper.saveItemStatics(item.getItemNum(), item.getStar());
		}
	}
	
	
	/**
	 * 修改产品公共service
	 * @param item
	 * @param term
	 * @param itemId
	 * @throws Exception
	 */
	private void updateProduct(Item item,  String term, String oldCountryCodes, String oldCategory2) throws Exception {
		
		itemMapper.updateItem(item);//修改ITEM
		itemMapper.updateItemCountry(item.getItemID(), item.getCountryCodes());//修改产品国家标
		/**
		 * 修改产品国家分表
		 */
		if(StringUtils.isNotBlank(oldCountryCodes)) {
			String[] countryArr = oldCountryCodes.split(",");
			for(int i=0;i<countryArr.length-1;i++) {
				itemMapper.deleteItemTable("item_country_".concat(countryArr[i].trim()), item.getItemID());
			}
		}
		if(StringUtils.isNotBlank(item.getCountryCodes())) {
			String[] countrCodeArr = item.getCountryCodes().split(",");
			for(String country:countrCodeArr) {
				if(StringUtils.isNotBlank(country)) {
					itemMapper.saveItemCountrySplit("item_country_"+country.trim(), item.getItemID());
				}
			}
		}
		/**
		 * 修改标签表
		 */
		itemMapper.deleteItemTag(item.getItemID());//产品标签表
		if(StringUtils.isNotBlank(item.getTagCheckRight())) {
			for(String tag:item.getTagCheckRight().split(",")) {
				if(StringUtils.isNotBlank(tag)) {
					itemMapper.saveItemTag(item.getItemID(), tag);
				}
			}
		}
		/**
		 * 修改 搜索表
		 */
		String tableName = CommonUtil.searchTableName(item.getItemID(), item.getCategory2());//根据二级类别获得搜索表
		if(StringUtils.isNotBlank(tableName)) {
			itemMapper.deleteItemTable(tableName.split(",")[1], item.getItemID());
			itemMapper.saveItemSearch(tableName.split(",")[1], term, item.getItemID());
		}
	}
	
	/**
	 * 产品删除
	 * @param itemIds
	 * @throws Exception
	 */
	public void deleteItems(String[] itemIds) throws Exception {
		char type;
		String itemTable="",searchTable = "";
		String[] itemArr; 
		StringBuffer readyDeleteItemIds = new StringBuffer();
		for(String itemIdCountry : itemIds) {
			itemArr = itemIdCountry.split(",");
			type = itemArr[0].charAt(0);
			if(type=='s') {
				itemTable = "item_soft";
				searchTable = "search_soft";
			} else if(type=='v') {
				itemTable = "item_video";
				searchTable = "search_video";
			} else if(type=='d') {
				itemTable = "item_music";
				searchTable = "search_picture,search_music";
			}
			itemMapper.deleteItem(itemArr[0]);//产品简要信息表item
			itemMapper.deleteItemTable(itemTable, itemArr[0]);//产品分表
			readyDeleteItemIds.append(itemArr[0]).append(",");
			itemMapper.deleteItemCountry(itemArr[0]);//删除产品国家总表
			for(int i=1;i<itemArr.length;i++) {//产品国家分表
				String itemAr = itemArr[i];
				if(StringUtils.isNotBlank(itemAr)) {
					itemMapper.deleteItemTable("item_country_".concat(itemAr.trim()), itemArr[0]);
				}
			}
			itemMapper.deleteItemTag(itemArr[0]);//产品标签表
			for(String searchTab : searchTable.split(",")) {
				itemMapper.deleteItemTable(searchTab, itemArr[0]);//产品搜索表
			}
		}
		deleteDwListItemRank(readyDeleteItemIds.toString().split(","), "delete");//删除榜单相关联的表
	}
	
	/**
	 * 产品上架操作 
	 * @param itemIds
	 * @throws Exception
	 */
	public int itemListStatus(String status, String[] itemIds) throws SQLException {
		StringBuffer readyItemIds = new StringBuffer();//上架itemID buffer
		Map<String, Object> oldMap = null,versionMap = null;
		for(String itemId : itemIds) {
			itemId = itemId.trim();
			oldMap = itemMapper.getItemPackageByItemID(itemId, ContentObject.LIST);
			versionMap = itemMapper.getSoftVersionCodeByItemId(itemId);
			if(MapUtils.isNotEmpty(oldMap)) {
				if((Integer)oldMap.get("versionCode")<=(Integer)versionMap.get("versionCode")) {//如果架上同报名产品版本号小于等于新上架产品版本号
					updateDwListItemRank(itemId, (String)oldMap.get("itemID"));//下架已经在架上的同包名产品的榜单相关联的表
					readyItemIds.append(itemId).append(",");//需要上架的
				}
			} else {
				readyItemIds.append(itemId).append(",");//需要上架的
			}
		}
		if(readyItemIds.length()>0) {
			itemMapper.updateBatchItemStatus(status, readyItemIds.toString().split(","));//批量上架
		}
		return 0;
	}
	
	/**
	 * 产品下架操作
	 * @param status
	 * @param itemIds
	 * @throws SQLException
	 */
	public void dwListItem(String status, String[] itemIds) throws SQLException {
		StringBuffer readyItemIds = new StringBuffer();
		for(String itemId : itemIds) {
			readyItemIds.append(itemId).append(",");
		}
		String[] readyItemIdArr = readyItemIds.toString().split(",");
		itemMapper.updateBatchItemStatus(status, readyItemIdArr);
		deleteDwListItemRank(readyItemIdArr,"updateStatus");//删除榜单相关联的表
	}
	
	public Item getItemByItemID(String itemId) throws SQLException {
		return itemMapper.getItemByItemID(itemId);
	}
	
	public SoftItem getSoftByItemID(String itemID) throws SQLException {
		return itemMapper.getSoftByItemID(itemID);
	}
	
	public VideoItem getVideoByItemID(String itemID) throws SQLException {
		return itemMapper.getVideoByItemID(itemID);
	}
	
	public MusicItem getDigitalByItemID(String itemID) throws SQLException {
		return itemMapper.getDigitalByItemID(itemID);
	}
	
	public List<Map<String,Integer>> getTagsByItemId(String itemID) throws SQLException {
		return itemMapper.getTagsByItemId(itemID);
	}
	
	public Map<String, Object> getItemStaticsByItemNum(String itemNum) throws SQLException {
		return itemMapper.getItemStaticsByItemNum(itemNum);
	}
	 
	public int getItemCountByItemId(String itemID) throws SQLException {
		return itemMapper.getItemCountByItemId(itemID);
	}
	
	
	/**
	 * itemId数组，查询item集合
	 * @param itemIdArr
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, String>> itemListByids(String[] itemIdArr) throws SQLException {
		return itemMapper.itemListByids(itemIdArr);
	}
	
	/**
	 * item 名称 ，二级类别，查询item集合
	 * @param itemIdArr
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, String>> itemListByName(String category2, String name) throws SQLException {
		return itemMapper.itemListByName(category2, name);
	}
	
	/**
	 * 根据itemID集合查询item_country表里的产品国家记录集合
	 * @param itemIDArray
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, String>> itemCountryListByItemIDs(String[] itemIDArray) throws SQLException {
		return itemMapper.itemCountryListByItemIDs(itemIDArray);
	}
	
	/**
	 * 修改item_country表里的countryCodes
	 * @param itemID
	 * @param countryCodes
	 * @throws SQLException
	 */
	public void updateItemCountry(String itemID, String countryCodes) throws SQLException {
		itemMapper.updateItemCountry(itemID, countryCodes);
	}
	
	/**
	 * 批量删除国家分表里的产品
	 * @param code 国家标后缀
	 * @param list
	 * @throws SQLException
	 */
	public void batchDeleteItemCountryCode(String code, List<String> list) throws SQLException {
		itemMapper.batchDeleteItemCountryCode(code, list);
	}
	
	/**
	 * 根据itemID或name模糊查询产品集合
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, String>>itemListByNameOrId(String name) throws SQLException {
		return itemMapper.itemListByNameOrId(name);
	}
	
	/**
	 * 删除itemID关联的榜单表
	 * @param itemID
	 * @throws SQLException
	 */
	public void deleteDwListItemRank(String[] itemIdArr, String type) throws SQLException {
		
		rankMapper.deleteHomeRankByItemID(itemIdArr);
		rankMapper.deleteCollectionByItemID(itemIdArr);
		itemMapper.deleteOfflineByItemID(itemIdArr);
		List<Map<String, String>> list = null;
		List<String> itemNumbList = null;
		StringBuffer buffer = new StringBuffer("");
		for(String itemID : itemIdArr) {
			itemID = itemID.trim();
			if(!type.equals("updateStatus")) {//删除操作
				itemNumbList = itemMapper.getitemNumsByitemId(itemID);
				if(CollectionUtils.isNotEmpty(itemNumbList) && itemNumbList.size()<2) {//同报名的soft最多只有一个时，可以删除item_static表里的记录
					buffer.append(itemNumbList.get(0)).append(",");
				}
			}
			list = rankMapper.feautureList(itemID);
			for(Map<String, String> map : list) {
				if(map.get("itemID0").equals(itemID)) {
					rankMapper.updateFeauture("itemID0", "", map.get("featureType"));
				} if(map.get("itemID1").equals(itemID)) {
					rankMapper.updateFeauture("itemID1", "", map.get("featureType"));
				}  if(map.get("itemID2").equals(itemID)) {
					rankMapper.updateFeauture("itemID2", "", map.get("featureType"));
				} if(map.get("itemID3").equals(itemID)) {
					rankMapper.updateFeauture("itemID3", "", map.get("featureType"));
				} if(map.get("itemID4").equals(itemID)) {
					rankMapper.updateFeauture("itemID4", "", map.get("featureType"));
				}
			}
		}
		if(buffer.length()>2) {//删除操作
			buffer.substring(0, buffer.length()-1);
			itemMapper.deleteBatchItemStatics((buffer.toString()).split(","));
		}
	}
	
	/**
	 * 修改itemID关联的榜单表 上架操作时候删除在架上的同报名的产品
	 * @param itemID
	 * @throws SQLException
	 */
	public void updateDwListItemRank(String itemId, String oldItemID) throws SQLException {
		
			List<Map<String, String>> list = null;
			itemMapper.updateStatus(oldItemID, "DW_LIST");
			itemMapper.updateItemId("item_home_rank", itemId, oldItemID);
			itemMapper.updateItemId("item_collection", itemId, oldItemID);
			itemMapper.updateItemId("item_offline", itemId, oldItemID);
			list = rankMapper.feautureList(oldItemID);
			for(Map<String, String> map : list) {
				if(map.get("itemID0").equals(oldItemID)) {
					rankMapper.updateFeauture("itemID0", itemId, map.get("featureType"));
				} if(map.get("itemID1").equals(oldItemID)) {
					rankMapper.updateFeauture("itemID1", itemId, map.get("featureType"));
				}  if(map.get("itemID2").equals(oldItemID)) {
					rankMapper.updateFeauture("itemID2", itemId, map.get("featureType"));
				} if(map.get("itemID3").equals(oldItemID)) {
					rankMapper.updateFeauture("itemID3", itemId, map.get("featureType"));
				} if(map.get("itemID4").equals(oldItemID)) {
					rankMapper.updateFeauture("itemID4", itemId, map.get("featureType"));
				}
			}
	}
	
	/**
	 * 根据packageName查询相同软件包名称下的itemNum
	 * @param packgeName
	 * @return
	 * @throws SQLException
	 */
	public String getItemNumByPackageName(String packgeName) throws SQLException {
		return itemMapper.getItemNumByPackageName(packgeName);
	}
	
	/**
	 * 修改item状态
	 * @param itemID
	 * @param status
	 * @throws SQLException
	 */
	public void updateStatus(String itemID, String status) throws SQLException {
		itemMapper.updateStatus(itemID, status);
	}
	
	/**
	 * 批量删除线下产品
	 * @param idArr
	 * @throws SQLException
	 */
	public void deleteBatchOfLine(String[] idArr) throws SQLException {
		itemMapper.deleteBatchOfLine(idArr);
	}
	
	/**
	 * 修改线下产品的排序，价格
	 * @param id
	 * @param sortV
	 * @param price
	 * @throws SQLException
	 */
	public void updateOfLineSortVAndPrice(int id, int sortV, int price) throws SQLException {
		itemMapper.updateOfLineSortVAndPrice(id, sortV, price); 
	}
	
	public List<String> getOfLineItemIdListByRank(String rank) throws SQLException {
		return itemMapper.getOfLineItemIdListByRank(rank);
	}
	
	/**
	 * 修改线下产品榜单设备配置
	 * @param itemID
	 * @param rank
	 * @param deviceType
	 * @throws SQLException
	 */
	public void updateOfLineByItemIdAndRank(String itemID, String rank, String deviceType) throws SQLException {
		itemMapper.updateOfLineByItemIdAndRank(itemID, rank, deviceType);
	}
	
	/**
	 * 新增线下产品榜单
	 * @param rank
	 * @param itemId
	 * @param deviceType
	 * @throws SQLException
	 */
	public void saveOfLine(String rank, String itemId, String deviceType) throws SQLException {
		itemMapper.saveOfLine(rank, itemId, deviceType);
	}
}
