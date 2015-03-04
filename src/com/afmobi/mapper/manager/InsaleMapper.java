package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface InsaleMapper {

	public List<Map<String, Object>> getInsalePackageList(@Param("start") Integer start, 
			@Param("end") Integer end) throws SQLException;
	
	public int getInsalePackageCount() throws SQLException;
	
	public List<Map<String, Object>> cpInsaleList(@Param("start") int start, @Param("end") int end, 
			@Param("cpName") String cpName, @Param("inSalePool") String inSalePool) throws SQLException;
	
	public int cpInsaleCount(@Param("cpName") String cpName, @Param("inSalePool") String inSalePool) throws SQLException;
	
	public List<Map<String, Object>> inSaleInfoList(@Param("start") int start, @Param("end") int end, 
			@Param("inSalePackageID") int inSalePackageID) throws SQLException;
	
	public int inSaleInfoCount(@Param("inSalePackageID") int inSalePackageID) throws SQLException;
	
	public void saveInSalePackage() throws SQLException;
	
	public void saveInSaleInfo(@Param("inSalePackageID") String inSalePackageID, @Param("mccMnc") String mccMnc, 
			@Param("port") String port, @Param("cmd") String cmd, @Param("price") String price, 
			@Param("unit") String unit, @Param("rateRMB") String rateRMB,
			 @Param("rateUSD") String rateUSD) throws SQLException;
	
	
	public void updateInSaleInfo(@Param("id") String id, @Param("mccMnc") String mccMnc, 
			@Param("port") String port, @Param("cmd") String cmd,
			@Param("price") String price, @Param("unit") String unit, @Param("rateRMB") String rateRMB, 
			@Param("rateUSD") String rateUSD) throws SQLException;
	
	public void addCpInsalePackage(@Param("pakcageId") String pakcageId, @Param("cpInSaleCode") 
			String cpInSaleCode) throws SQLException;
	
	public Integer getinSalePackageCpInsaleCodeId(@Param("cpInSaleCode") String cpInSaleCode) throws SQLException;
	
	public void updateCpInsalePackage(@Param("id") int id, @Param("inSalePackageID") String inSalePackageID) throws SQLException;
	
	public List<Map<String, Object>> cpItemInSaleList(@Param("start") int start, @Param("end") int end, 
			@Param("itemName") String itemName, @Param("cpID") String cpID) throws SQLException;
	
	public int cpItemInSaleCount(@Param("itemName") String itemName, @Param("cpID") String cpID) throws SQLException;
}
