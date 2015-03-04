package com.afmobi.mapper.manager;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

public interface CounterMapper {

	public int counter(@Param("counter") String counter) throws SQLException;

	public void updateCounter(@Param("count") int count, 
			@Param("counter") String counter) throws SQLException;

}
