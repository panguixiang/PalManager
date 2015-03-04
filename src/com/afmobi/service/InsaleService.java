package com.afmobi.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.InsaleMapper;

/**
 * 内计费service
 * @author panguixiang
 *
 */
@Service
public class InsaleService {

	@Autowired
	private InsaleMapper insaleMapper;
	
	public List<Map<String, Object>> inSalePackageList(Integer start, Integer end) throws SQLException {
		return insaleMapper.getInsalePackageList(start, end);
	}
	
	public int inSalePackageCount() throws SQLException {
		return insaleMapper.getInsalePackageCount();
	}
	
	
	public List<Map<String, Object>> cpInsaleList(int start, int end, String cpName, String inSalePool) throws SQLException {
		return insaleMapper.cpInsaleList(start, end, cpName, inSalePool);
	}
	
	public int cpInsaleCount(String cpName, String inSalePool) throws SQLException {
		return insaleMapper.cpInsaleCount(cpName, inSalePool);
	}
	
	public void saveInSalePackage() throws SQLException {
		insaleMapper.saveInSalePackage();
	}
	
	public List<Map<String, Object>> inSaleInfoList(int start, int end, int inSalePackageID) throws SQLException {
		return insaleMapper.inSaleInfoList(start, end, inSalePackageID);
	}
	
	public int inSaleInfoCount(int inSalePackageID) throws SQLException {
		return insaleMapper.inSaleInfoCount(inSalePackageID);
	}
	
	public void saveInSaleInfo(String inSalePackageID, String mccMnc, String port, String cmd,
			String price, String unit, String rateRMB, String rateUSD) throws SQLException {
		insaleMapper.saveInSaleInfo(inSalePackageID, mccMnc, port, cmd, price, unit, rateRMB, rateUSD);
	}
	
	public void updateInSaleInfo(String id, String mccMnc, String port, String cmd,
			String price, String unit, String rateRMB, String rateUSD) throws SQLException {
		insaleMapper.updateInSaleInfo(id, mccMnc, port, cmd, price, unit, rateRMB, rateUSD);
	}
	
	public void addCpInsalePackage(String pakcageId, String cpInSaleCode) throws SQLException {
		insaleMapper.addCpInsalePackage(pakcageId, cpInSaleCode);
	}
	
	public Integer getinSalePackageCpInsaleCodeId(String cpInSaleCode) throws SQLException {
		return insaleMapper.getinSalePackageCpInsaleCodeId(cpInSaleCode);
	}
	
	public void updateCpInsalePackage(int id, String inSalePackageID) throws SQLException {
		insaleMapper.updateCpInsalePackage(id, inSalePackageID);
	}
	
	public List<Map<String, Object>> cpItemInSaleList(int start, int end, String itemName, String cpID) throws SQLException {
		return insaleMapper.cpItemInSaleList(start, end, itemName, cpID);
	}
	
	public int cpItemInSaleCount(String itemName, String cpID) throws SQLException {
		return insaleMapper.cpItemInSaleCount(itemName, cpID);
	}
}
