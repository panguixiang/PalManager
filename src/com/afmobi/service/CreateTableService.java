package com.afmobi.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.ManaCreateTableMapper;
import com.afmobi.mapper.operation.LogCreateTableMapper;

@Service
public class CreateTableService {

	@Autowired
	private ManaCreateTableMapper mangMapper;
	
	@Autowired
	private LogCreateTableMapper logMapper;
	
	public void createService(String sql, String dbName) throws SQLException{
		if(dbName.equals("item")) {
			mangMapper.createTable(sql);
		}
		else if(dbName.equals("log")) {
			logMapper.createTable(sql);
		}
	}
}
