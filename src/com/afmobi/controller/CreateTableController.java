package com.afmobi.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afmobi.service.CreateTableService;
import com.afmobi.util.CommonUtil;

/**
 * 此控制器仅用来生成分表
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/createTable")
public class CreateTableController {
	
	static Logger logger = Logger.getLogger(CreateTableController.class.getName());
	
	@Autowired
	private CreateTableService service;
	
	@ResponseBody
	@RequestMapping(value="dowork")
	public String createTable(@RequestParam("saleTime") String saleTime,@RequestParam("dbName") String dbName, 
			@RequestParam("creatype") String creatype,@RequestParam("tempTableName") String tempTableName,
			@RequestParam("sqlInfo") String sqlInfo) {
		StringBuffer buffer = new StringBuffer();
		tempTableName = tempTableName.trim();
		StringBuffer message = new StringBuffer("");
		String table = "";
		try {
			String[] time = saleTime.split("--");
			String startTime = time[0],	endTime=time[1];
			if(StringUtils.equals(creatype, "day")) {
				List<Date> dateList = CommonUtil.findDates(startTime, endTime);
				for(Date date : dateList) {
					table = CommonUtil.date2Str(date,"yyyy_MM_dd");
					message.append(tempTableName).append("_").append(table).append(",");
					buffer.append("create table ").append(tempTableName).append("_").append(table).append(" ").append(sqlInfo);
					service.createService(buffer.toString(), dbName);
					buffer.delete(0, buffer.length());
				}
			} else {
				Map<String, String> map = CommonUtil.findMonths(startTime, endTime);
				Iterator<String> i = map.keySet().iterator();
				while(i.hasNext()) {
					table = i.next();
					message.append(tempTableName).append("_").append(table).append(",");
					buffer.append("create table ").append(tempTableName).append("_").append(table).append(" ").append(sqlInfo);
					service.createService(buffer.toString(), dbName);
					buffer.delete(0, buffer.length());
				}
			}
		} catch(Exception e) {
			logger.error(e);
			return "error:"+e.getMessage();
		}
		return message.toString();
		
	}

}
