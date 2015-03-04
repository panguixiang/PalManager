package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ManaCreateTableMapper {

	public void createTable(@Param("sql") String sql) throws SQLException; 
}
