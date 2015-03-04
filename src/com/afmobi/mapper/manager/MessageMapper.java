package com.afmobi.mapper.manager;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.afmobi.model.manager.SysMsg;
import com.afmobi.model.manager.SysMsgCountry;

public interface MessageMapper {

	public List<SysMsg> sysMsgList(@Param("start") int start, @Param("end") int end) throws SQLException;
	
	public int sysMsgCount() throws SQLException;
	
	public void saveMessage(SysMsg msg) throws SQLException;
	
	public void batchSaveMsgCountry(@Param("msgID") int msgID, @Param("array") String[] array) throws SQLException;
	
	public void deleteBatchMessageByMsgId(@Param("msgIDArray") String[] msgId) throws SQLException;
	
	public void deleteBatchMessageCountryCodeByMsgId(@Param("msgIDArray") String[] msgId) throws SQLException;
	
	public List<SysMsgCountry> getSysMsgCountrysByMsgId(@Param("msgIDArray") Integer[] msgId) throws SQLException;
}
