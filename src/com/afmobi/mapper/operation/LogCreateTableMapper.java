package com.afmobi.mapper.operation;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface LogCreateTableMapper {

	public void createTable(@Param("sql") String sql) throws SQLException; 
}
