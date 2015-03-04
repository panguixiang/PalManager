package com.afmobi.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afmobi.mapper.manager.MessageMapper;
import com.afmobi.model.manager.SysMsg;
import com.afmobi.model.manager.SysMsgCountry;

/**
 * 消息service
 * @author panguixiang
 *
 */
@Service
public class MessageService {

	@Autowired
	private MessageMapper mapper;
	
	/*
	 * 查询List
	 */
	public List<SysMsg> sysMsgList(int start, int end) throws SQLException {
		return mapper.sysMsgList(start, end);
	}
	
	public int sysMsgCount() throws SQLException {
		return mapper.sysMsgCount();
	}
	
	public void saveMessage(SysMsg msg) throws SQLException{
		mapper.saveMessage(msg);
	}
	
	public void batchSaveMsgCountry(int msgId, String[] countryCodes) throws SQLException{
		mapper.batchSaveMsgCountry(msgId, countryCodes);
	}
	
	public void deleteBatchMessageByMsgId(String[] msgId) throws SQLException{
		mapper.deleteBatchMessageByMsgId(msgId);
	}
	
	public void deleteBatchMessageCountryCodeByMsgId(String[] msgId) throws SQLException{
		mapper.deleteBatchMessageCountryCodeByMsgId(msgId);
	}
	
	public List<SysMsgCountry> getSysMsgCountrysByMsgId(Integer[] msgIdArr) throws SQLException{
		return mapper.getSysMsgCountrysByMsgId(msgIdArr);
	}
}
