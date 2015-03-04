package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.afmobi.model.manager.CateGory3;

public interface CateGoryMapper {

	public List<CateGory3> list(@Param("category2") String category2) throws SQLException;
	
	public CateGory3 getCateGory3ById(@Param("cateGoryId") String cateGoryId) throws SQLException;
	
	public List<Map<String, String>> tagListByCate3(@Param("cateGory3Id") String cateGory3Id) throws SQLException;
	
	public void batchAddTag(@Param("list") List<Map<String, String>> list)  throws SQLException;
	
	public void batchDeleteTag(@Param("idArray") String[] idArray) throws SQLException;
	
	public void addCateGory3(@Param("gory3") CateGory3 gory3) throws SQLException;
	
	public void updateCateGory3(@Param("gory3") CateGory3 gory3) throws SQLException;
	
	public void deleteCate3(@Param("cate3Id") String cate3Id) throws SQLException;
	
	public void deleteTagsByCate3(@Param("cate3Id") String cate3Id) throws SQLException;
}
