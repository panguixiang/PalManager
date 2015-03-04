package com.afmobi.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.CateGoryMapper;
import com.afmobi.model.manager.CateGory3;

@Service
public class CateGoryService {

	@Autowired
	private CateGoryMapper cateMapper;
	
	public List<CateGory3> list(String category2) throws SQLException {
		return cateMapper.list(category2);
	}
	
	public CateGory3 getCateGory3ById(String cateGoryId) throws SQLException {
		return cateMapper.getCateGory3ById(cateGoryId);
	}
	
	public List<Map<String, String>> tagListByCate3(String cateGory3Id) throws SQLException {
		return cateMapper.tagListByCate3(cateGory3Id);
	}
	
	public void batchDeleteTag(String[] idArra) throws SQLException {
		cateMapper.batchDeleteTag(idArra);
	}
	
	public void batchAddTag(List<Map<String, String>> list) throws SQLException {
		cateMapper.batchAddTag(list);
	}
	
	public void addCateGory3(CateGory3 gory3) throws SQLException {
		cateMapper.addCateGory3(gory3);
	}
	
	public void updateCateGory3(CateGory3 gory3) throws SQLException {
		cateMapper.updateCateGory3(gory3);
	}
	
	public void deleteCate3(String cate3Id) throws SQLException {
		cateMapper.deleteCate3(cate3Id);
		cateMapper.deleteTagsByCate3(cate3Id);
	}
}
