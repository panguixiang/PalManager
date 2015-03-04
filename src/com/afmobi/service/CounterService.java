package com.afmobi.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.CounterMapper;

/**
 * 计数器service
 * @author panguixiang
 *
 */
@Service
public class CounterService {

	@Autowired
	private CounterMapper countMapper;
	
	/**
	 * 根据counter查询计数器里的count字段值
	 * @param counter
	 * @return
	 * @throws SQLException
	 */
	public int counter(String counter) throws SQLException{
		return countMapper.counter(counter);
	}
	
	/**
	 * 根据counter修改计数器里的count字段值
	 * @param count
	 * @param counter
	 * @throws SQLException
	 */
	public void updateCounter(int count, String counter) throws SQLException {
		countMapper.updateCounter(count, counter);
	}
}
