package com.afmobi.model.manager;


/**
 * 三级类别 新增 修改时候用到的bean
 * @author panguixiang
 *
 */
public class CateGory3 {

	private String category3;
	private String name="";
	private String category2="";
	private String iconID="";
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getIconID() {
		return this.iconID;
	}
	public void setIconID(String iconID) {
		this.iconID = iconID;
	}
	
}
