package com.afmobi.frame;

import java.io.File;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;


/**
 * 项目启动需要加载的配置
 * 
 * @author panguixiang
 * 
 */
public class ApplicationListener implements ServletContextListener {

	static Logger logger = Logger.getLogger(ApplicationListener.class.getName());
	
	private static Configuration config;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		String webPath = arg0.getServletContext().getRealPath("/");
		String  fileContent="";
		try {
			config = new PropertiesConfiguration("constant.properties");
			File file = new File(webPath+"/countryCode_array.txt");
			fileContent = org.apache.commons.io.FileUtils.readFileToString(file, "UTF-8");
			ContentObject.jsonArrayCountry = new JSONArray(fileContent);
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
	/**
	 * 根据Key读取全局配置文件的value
	 * 
	 * @param key
	 * @return
	 */
	public static String getValueByKey(String key) {
		if (StringUtils.isBlank(key)) {
			return null;
		}
		return config.getString(key);
	}

}