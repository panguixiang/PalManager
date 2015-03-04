package com.afmobi.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.CpMapper;
import com.afmobi.model.manager.Cp;

/**
 * CP service
 * @author panguixiang
 *
 */
@Service
public class CpService {

	@Autowired
	private CpMapper cpMapper;
	
	public List<Map<String,String>> getCpList(Map<String, Object> map) throws SQLException {
		return cpMapper.getCpList(map);
	}
	
	public int getCpCount(Map<String, Object> map) throws SQLException {
		return cpMapper.getCpCount(map);
	}
	
	public List<Map<String,String>> getCpNameList(String status) throws SQLException {
		return cpMapper.getCpNameList(status);
	}
	
	public int cpCountByInSaleId(String inSaleId) throws SQLException {
		return cpMapper.cpCountByInSaleId(inSaleId);
	}
	
	public Cp getCpDetail(String cpID) throws SQLException {
		return cpMapper.getCpDetail(cpID);
	}
	
	public String cpInSalePoolById(String cpId) throws SQLException {
		return cpMapper.cpInSalePoolById(cpId);
	}
	
	public void saveCp(Cp cp) throws SQLException {
		cpMapper.saveCp(cp);
	}
	
	public void updateCp(Cp cp) throws SQLException {
		cpMapper.updateCp(cp);
	}
	
	public void deleteCp(String cpID) throws SQLException {
		cpMapper.deleteCp(cpID);
	}
	
	public void resetCpPasswd(String cpID, String paswd) throws SQLException {
		cpMapper.resetCpPasswd(cpID, paswd);
	}
	
	public int getCpItemListCount(Map<String, Object> map) throws SQLException {
		return cpMapper.getCpItemListCount(map);
	}
	
	public List<Map<String,String>> getCpItemList(Map<String, Object> map) throws SQLException {
		return cpMapper.getCpItemList(map);
	}
	
	public Map<String, Object> getCpItemDetailByItemID(String itemID) throws SQLException {
		return cpMapper.getCpItemDetailByItemID(itemID);
	}
	
	public List<Map<String,Object>> cpItemCheckList(String itemID) throws SQLException {
		return cpMapper.cpItemCheckList(itemID);
	}
	
	public void saveCpItemCheck(String itemID, int submitManagerID, String status, 
			String testResultFileID, String des) throws SQLException {
		cpMapper.saveCpItemCheck(itemID, submitManagerID, status, testResultFileID, des);
	}
	
	public void updateInSalePool(String cpId, String inSalePool) throws SQLException {
		cpMapper.updateInSalePool(cpId, inSalePool);
	}
}
