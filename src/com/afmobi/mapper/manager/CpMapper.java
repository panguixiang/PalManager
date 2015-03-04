package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.afmobi.model.manager.Cp;

public interface CpMapper {
	
	public List<Map<String,String>> getCpList(@Param("map") Map<String, Object> map) throws SQLException;
	
	public int getCpCount(@Param("map") Map<String, Object> map) throws SQLException;
	
	public List<Map<String,String>> getCpNameList(@Param("status") String status) throws SQLException;
	
	public int cpCountByInSaleId(@Param("inSaleId") String inSaleId) throws SQLException;
	
	public String cpInSalePoolById(@Param("cpId") String cpId) throws SQLException;
	
	public void updateInSalePool(@Param("cpId") String cpId, @Param("inSalePool") String inSalePool) throws SQLException;
	
	public Cp getCpDetail(@Param("cpID") String cpID) throws SQLException;
	
	public void saveCp(@Param("cp") Cp cp) throws SQLException;
	
	public void updateCp(@Param("cp") Cp cp) throws SQLException;
	
	public void deleteCp(@Param("cpID") String cpID) throws SQLException;
	
	public void resetCpPasswd(@Param("cpID") String cpID, @Param("paswd") String paswd) throws SQLException;
	
	public int getCpItemListCount(@Param("map") Map<String, Object> map) throws SQLException;
	
	public List<Map<String,String>> getCpItemList(@Param("map") Map<String, Object> map) throws SQLException;
	
	public Map<String,Object> getCpItemDetailByItemID(@Param("itemID") String itemID) throws SQLException;
	
	public List<Map<String,Object>> cpItemCheckList(@Param("itemID") String itemID) throws SQLException;
	
	public void saveCpItemCheck(@Param("itemID") String itemID, @Param("submitManagerID") int submitManagerID, @Param("status") String status, 
			@Param("testResultFileID") String testResultFileID, @Param("des") String des) throws SQLException;
}
