package com.afmobi.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.model.manager.SysMsg;
import com.afmobi.model.manager.SysMsgCountry;
import com.afmobi.service.MessageService;

/**
 * 消息管理
 * @author panguixiang
 *
 */
@Controller
@RequestMapping("/message")
public class MessageController {

	static Logger logger = Logger.getLogger(MessageController.class.getName());
	
	@Autowired
	private MessageService messageService;
	
	/**
	 * 消息列表
	 * @param page
	 * @param rows
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "list")
	public Map<String, Object> getMesageList(@RequestParam("page") int page, @RequestParam("rows") int rows) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<SysMsg> list = null;
		int count = 0;
		try {
			list = messageService.sysMsgList((page-1)*rows, rows);
			count = messageService.sysMsgCount();
		} catch (SQLException e) {
			logger.error(e);
		}
		returnMap.put("total", count);
		if(CollectionUtils.isEmpty(list)) {
			returnMap.put("rows", list);
			return returnMap;
		}
		SysMsg msg = null;
		Map<Integer, Integer> contiueMap = new HashMap<Integer, Integer>();//用来存储临时的msgId和list的下标
		Integer[] msgIdArr = new Integer[list.size()];
		for(int i=0;i<list.size();i++) {
			msg = list.get(i);
			contiueMap.put(msg.getMsgId(), i);
			msgIdArr[i]=msg.getMsgId();
		}
		List<SysMsgCountry> msgCountrList = null;
		try {
			msgCountrList = messageService.getSysMsgCountrysByMsgId(msgIdArr);
		} catch (SQLException e) {
			logger.error(e);
		}
		if(CollectionUtils.isEmpty(msgCountrList)) {
			returnMap.put("rows", list);
			return returnMap;
		}
		for(SysMsgCountry country : msgCountrList) {//遍历循环放入SysMsg关联的国家Code
			msg = list.get(contiueMap.get(country.getMsgID()));
			msg.setCountryCodes(msg.getCountryCodes().concat(country.getCountryCode()).concat(","));
		}
		returnMap.put("rows", list);
		return returnMap;
	} 
	
	/**
	 * 新增消息
	 * @param sysMsg
	 */
	@ResponseBody
	@RequestMapping(value = "addMessage", method = RequestMethod.POST)
	public void addMessage(SysMsg sysMsg) {

		try {
			messageService.saveMessage(sysMsg);
			if(sysMsg.getMsgId() != null && sysMsg.getCountryCodes().length()>2) {
				messageService.batchSaveMsgCountry(sysMsg.getMsgId(), sysMsg.getCountryCodes().split(","));
			}
		} catch (SQLException e) {
			logger.error(e);
		}
	}
	
	/**
	 * 批量删除msg
	 * @param msgIds
	 */
	@ResponseBody
	@RequestMapping(value = "deletMessage")
	public void deletMessage(@RequestParam("msgIds") String msgIds) {

		String[] msgIdArr = msgIds.split(",");
		try {
			messageService.deleteBatchMessageByMsgId(msgIdArr);
			messageService.deleteBatchMessageCountryCodeByMsgId(msgIdArr);
		} catch (SQLException e) {
			logger.error(e);
		}
	}
}
