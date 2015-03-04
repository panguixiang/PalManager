package com.afmobi.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;


/**
 * 
 * @author panguixiang
 *
 */
public class CommonUtil {

	public static String create32UUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static String createItemId(String cate1) {
		return cate1.concat("_").concat(create32UUID());
	}
	
	public static String[] subStringUtil(String str, String subExt) throws Exception{
		String[] arr = new String[2];
		StringBuffer buffer = new StringBuffer(str);
		arr[0] = buffer.substring(0, str.lastIndexOf(subExt));
		arr[1] = buffer.substring(str.lastIndexOf(subExt)+1, str.length());
		return arr;
	}
	
	/**
	 * Date转化为pattern格式字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String date2Str(Date date, String pattern) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		return simpleDateFormat.format(date);
	}
	
	/**
	 * 计算两个日期之间的日期集合
	 * @param dBegin
	 * @param dEnd
	 * @return
	 * @throws ParseException 
	 */
	public static List<Date> findDates(String start, String end) throws ParseException
	 {
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	  Date dBegin = sdf.parse(start);
	  Date dEnd = sdf.parse(end);
	  List<Date> lDate = new ArrayList<Date>();
	  lDate.add(dBegin);
	  Calendar calBegin = Calendar.getInstance();
	  // 使用给定的 Date 设置此 Calendar 的时间
	  calBegin.setTime(dBegin);
	  Calendar calEnd = Calendar.getInstance();
	  // 使用给定的 Date 设置此 Calendar 的时间
	  calEnd.setTime(dEnd);
	  // 测试此日期是否在指定日期之后
	  while (dEnd.after(calBegin.getTime()))
	  {
	   // 根据日历的规则，为给定的日历字段添加或减去指定的时间量
	   calBegin.add(Calendar.DAY_OF_MONTH, 1);
	   lDate.add(calBegin.getTime());
	  }
	  //lDate.remove(0);//移除收尾两个日期
     // if(lDate.size()>0) {
	   //lDate.remove(lDate.size()-1);
      //}
	  return lDate;
	}

	/**
	 * 
	 * @param inSalePool cp内计费池
	 * @param saleID 输入的内计费代码
	 * @return
	 */
	public static boolean checkInSaleId(String inSalePool,String saleID) {
		/*再截取出后3位，转为整形和CP中的inSalePool对比，大于后者则不合法*/
		String saleIdChil = (saleID.substring(4, saleID.length())).replaceAll("^(0+)", "");
		return Integer.parseInt(inSalePool)>Integer.parseInt(saleIdChil);
	}
	/**
	 * 计算两个日期之间的月集合
	 * @param dBegin
	 * @param dEnd
	 * @return
	 * @throws ParseException 
	 */
	public static Map<String,String> findMonths(String start, String end) throws ParseException
	 {
		List<Date> list = findDates(start,end);
		Map<String,String> montMap = new HashMap<String,String>();
		String montStr = "";
		for(Date date: list) {
			montStr = date2Str(date,"yyyy_MM");
			if(!montMap.containsKey(montStr)) {
				montMap.put(montStr,montStr);
			}
		}
		return montMap;
	}
	
	/**
	 * 获得指定长度的整形字符串，不足长度的前面以0补齐
	 * @param length
	 * @param number
	 * @return
	 */
	public static String lpad(int length, int number) {
        String f = "%0" + length + "d";
        return String.format(f, number);
    }
	
	/**
	 * 根据itemId规则及cateGory2规则获得search类别分表名称
	 * @param itemId
	 * @param cateGory2
	 * @return
	 */
	public static String searchTableName(String itemId, String cateGory2) {
		if(StringUtils.isBlank(itemId) || StringUtils.isBlank(cateGory2)) {
			return "";
		}
		itemId = itemId.trim();
		char type = itemId.charAt(0);
		String tableNames = "";
		if(type=='s') {
			tableNames = "item_soft,search_soft";
		} else if(type=='v') {
			tableNames = "item_video,search_video";
		} else if(type=='d') {
			tableNames = "item_music,search_".concat(cateGory2.trim());
		}
		return tableNames;
	}
	
	public static void main(String args[]) throws Exception{
		System.out.print(checkInSaleId("001","0001001"));
		/*List<Date> list = findDates("2014-06-11","2014-07-10");
		Map<String,String> montMap = new HashMap<String,String>();
		String montStr = "";
		for(Date date: list) {
			System.out.println(date2Str(date,"yyyy_MM_dd"));
			montStr = date2Str(date,"yyyy_MM");
			if(!montMap.containsKey(montStr)) {
				montMap.put(montStr,montStr);
			}
		}
		Iterator i = montMap.keySet().iterator();
		while(i.hasNext()) {
			System.out.println("month=="+i.next());
		}*/
		/*String[] arr = subStringUtil("E:/program/dsdsf.jpg",".");
		System.out.println(arr[0]+"  "+arr[1]);*/
	}
	
	
}
