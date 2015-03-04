var countryDict = "[{\"countryNameCN\":\"尼日利亚\",\"countryCode\":\"NG\",\"countryNameEN\":\"Nigeria\"},{\"countryNameCN\":\"肯尼亚\",\"countryCode\":\"KE\",\"countryNameEN\":\"Kenya\"},{\"countryNameCN\":\"埃塞俄比亚\",\"countryCode\":\"ET\",\"countryNameEN\":\"Ethiopia\"},{\"countryNameCN\":\"坦桑尼亚\",\"countryCode\":\"TZ\",\"countryNameEN\":\"Tanzania\"},{\"countryNameCN\":\"乌干达\",\"countryCode\":\"UG\",\"countryNameEN\":\"Uganda\"},{\"countryNameCN\":\"喀麦隆\",\"countryCode\":\"CM\",\"countryNameEN\":\"Cameroon\"},{\"countryNameCN\":\"中国\",\"countryCode\":\"CN\",\"countryNameEN\":\"China\"},{\"countryNameCN\":\"法国\",\"countryCode\":\"FR\",\"countryNameEN\":\"France\"},{\"countryNameCN\":\"西班牙\",\"countryCode\":\"ES\",\"countryNameEN\":\"Spain\"},{\"countryNameCN\":\"葡萄牙\",\"countryCode\":\"PT\",\"countryNameEN\":\"Portugal\"},{\"countryNameCN\":\"阿尔及利亚\",\"countryCode\":\"DZ\",\"countryNameEN\":\"Algeria\"},{\"countryNameCN\":\"安哥拉\",\"countryCode\":\"AO\",\"countryNameEN\":\"Angola\"},{\"countryNameCN\":\"巴林\",\"countryCode\":\"BH\",\"countryNameEN\":\"Bahrain\"},{\"countryNameCN\":\"不丹\",\"countryCode\":\"BT\",\"countryNameEN\":\"Bhutan\"},{\"countryNameCN\":\"中非共和国\",\"countryCode\":\"CF\",\"countryNameEN\":\"Central African Rep.\"},{\"countryNameCN\":\"乍得\",\"countryCode\":\"TD\",\"countryNameEN\":\"Chad\"},{\"countryNameCN\":\"刚果\",\"countryCode\":\"CG\",\"countryNameEN\":\"Congo\"},{\"countryNameCN\":\"刚果民主共和国\",\"countryCode\":\"CD\",\"countryNameEN\":\"Congo Democratic Rep.\"},{\"countryNameCN\":\"哥斯达黎加\",\"countryCode\":\"CR\",\"countryNameEN\":\"Costa Rica\"},{\"countryNameCN\":\"科特迪瓦\",\"countryCode\":\"CI\",\"countryNameEN\":\"Cote D'lvoire\"},{\"countryNameCN\":\"多米尼加\",\"countryCode\":\"DM\",\"countryNameEN\":\"Dominica\"},{\"countryNameCN\":\"多米尼加共和国\",\"countryCode\":\"DO\",\"countryNameEN\":\"Dominican Rep.\"},{\"countryNameCN\":\"埃及\",\"countryCode\":\"EG\",\"countryNameEN\":\"Egypt\"},{\"countryNameCN\":\"赤道几内亚\",\"countryCode\":\"GQ\",\"countryNameEN\":\"Equatorial Guinea\"},{\"countryNameCN\":\"厄立特里亚\",\"countryCode\":\"ER\",\"countryNameEN\":\"Eritrea\"},{\"countryNameCN\":\"爱沙尼亚\",\"countryCode\":\"EE\",\"countryNameEN\":\"Estonia\"},{\"countryNameCN\":\"法属圭亚那\",\"countryCode\":\"GF\",\"countryNameEN\":\"French Guiana\"},{\"countryNameCN\":\"法属波利尼西亚\",\"countryCode\":\"PF\",\"countryNameEN\":\"French Polynesia\"},{\"countryNameCN\":\"加蓬\",\"countryCode\":\"GA\",\"countryNameEN\":\"Gabon\"},{\"countryNameCN\":\"冈比亚\",\"countryCode\":\"GM\",\"countryNameEN\":\"Gambia\"},{\"countryNameCN\":\"格鲁吉亚\",\"countryCode\":\"GE\",\"countryNameEN\":\"Georgia\"},{\"countryNameCN\":\"德国\",\"countryCode\":\"DE\",\"countryNameEN\":\"Germany\"},{\"countryNameCN\":\"加纳\",\"countryCode\":\"GH\",\"countryNameEN\":\"Ghana\"},{\"countryNameCN\":\"直布罗陀\",\"countryCode\":\"GI\",\"countryNameEN\":\"Gibraltar\"},{\"countryNameCN\":\"几内亚\",\"countryCode\":\"GN\",\"countryNameEN\":\"Guinea\"},{\"countryNameCN\":\"几内亚比绍\",\"countryCode\":\"GW\",\"countryNameEN\":\"Guinea Bissau\"},{\"countryNameCN\":\"香港\",\"countryCode\":\"HK\",\"countryNameEN\":\"Hong Kong\"},{\"countryNameCN\":\"匈牙利\",\"countryCode\":\"HU\",\"countryNameEN\":\"Hungary\"},{\"countryNameCN\":\"冰岛\",\"countryCode\":\"IS\",\"countryNameEN\":\"Iceland\"},{\"countryNameCN\":\"印度\",\"countryCode\":\"IN\",\"countryNameEN\":\"India\"},{\"countryNameCN\":\"伊拉克\",\"countryCode\":\"IQ\",\"countryNameEN\":\"Iraq\"},{\"countryNameCN\":\"伊朗\",\"countryCode\":\"IR\",\"countryNameEN\":\"Iran\"},{\"countryNameCN\":\"意大利\",\"countryCode\":\"IT\",\"countryNameEN\":\"Italy\"},{\"countryNameCN\":\"牙买加\",\"countryCode\":\"JM\",\"countryNameEN\":\"Jamaica\"},{\"countryNameCN\":\"约旦\",\"countryCode\":\"JO\",\"countryNameEN\":\"Jordan\"},{\"countryNameCN\":\"哈萨克斯坦\",\"countryCode\":\"KZ\",\"countryNameEN\":\"Kazakhstan\"},{\"countryNameCN\":\"科威特\",\"countryCode\":\"KW\",\"countryNameEN\":\"Kuwait\"},{\"countryNameCN\":\"利比里亚\",\"countryCode\":\"LR\",\"countryNameEN\":\"Liberia\"},{\"countryNameCN\":\"利比亚\",\"countryCode\":\"LY\",\"countryNameEN\":\"Libya\"},{\"countryNameCN\":\"澳门\",\"countryCode\":\"MO\",\"countryNameEN\":\"Macau\"},{\"countryNameCN\":\"马拉维\",\"countryCode\":\"MW\",\"countryNameEN\":\"Malawi\"},{\"countryNameCN\":\"马提尼克\",\"countryCode\":\"MQ\",\"countryNameEN\":\"Martinique\"},{\"countryNameCN\":\"毛里塔尼亚\",\"countryCode\":\"MR\",\"countryNameEN\":\"Mauritania\"},{\"countryNameCN\":\"毛里求斯\",\"countryCode\":\"MU\",\"countryNameEN\":\"Mauritius\"},{\"countryNameCN\":\"摩纳哥\",\"countryCode\":\"MC\",\"countryNameEN\":\"Monaco\"},{\"countryNameCN\":\"卢旺达\",\"countryCode\":\"RW\",\"countryNameEN\":\"Rwanda\"},{\"countryNameCN\":\"西萨摩亚\",\"countryCode\":\"WS\",\"countryNameEN\":\"Samoa\"},{\"countryNameCN\":\"沙特阿拉伯\",\"countryCode\":\"SA\",\"countryNameEN\":\"Saudi Arabia\"},{\"countryNameCN\":\"索马里\",\"countryCode\":\"SO\",\"countryNameEN\":\"Somalia\"},{\"countryNameCN\":\"南非\",\"countryCode\":\"ZA\",\"countryNameEN\":\"South Africa\"},{\"countryNameCN\":\"台湾\",\"countryCode\":\"TW\",\"countryNameEN\":\"Taiwan\"},{\"countryNameCN\":\"塔吉克斯坦\",\"countryCode\":\"TJ\",\"countryNameEN\":\"Tajikistan\"},{\"countryNameCN\":\"多哥\",\"countryCode\":\"TG\",\"countryNameEN\":\"Togo\"},{\"countryNameCN\":\"特利尼达和多巴哥\",\"countryCode\":\"TT\",\"countryNameEN\":\"Trinidad & Tobago\"},{\"countryNameCN\":\"突尼斯\",\"countryCode\":\"TN\",\"countryNameEN\":\"Tunisia\"},{\"countryNameCN\":\"土耳其\",\"countryCode\":\"TR\",\"countryNameEN\":\"Turkey\"},{\"countryNameCN\":\"阿拉伯联合酋长国\",\"countryCode\":\"AE\",\"countryNameEN\":\"United Arab Emirates\"},{\"countryNameCN\":\"英国\",\"countryCode\":\"GB\",\"countryNameEN\":\"United Kingdom\"},{\"countryNameCN\":\"美国\",\"countryCode\":\"US\",\"countryNameEN\":\"United States\"},{\"countryNameCN\":\"英属维尔京群岛\",\"countryCode\":\"VG\",\"countryNameEN\":\"Virgin islands British\"},{\"countryNameCN\":\"美属维尔京群岛\",\"countryCode\":\"VI\",\"countryNameEN\":\"Virgin Island U.S.\"},{\"countryNameCN\":\"赞比亚\",\"countryCode\":\"ZM\",\"countryNameEN\":\"Zambia\"},{\"countryNameCN\":\"津巴布韦\",\"countryCode\":\"ZW\",\"countryNameEN\":\"Zimbabwe\"},{\"countryNameCN\":\"其他国家\",\"countryCode\":\"OT\",\"countryNameEN\":\"Other Countries\"}]";
var langArray = ["English","Chinese","French","Spanish","Arabic","Amharic"];
var publicCountrArra = ["America","China","France","England","Spain","Portugal"];
var publicYear = ["1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014"];
var categoryDict = "{\"Soft\":{\"category1\":\"Soft\",\"category2\":[\"App\",\"Game\"]},\"Digital\":{\"category1\":\"Digital\",\"category2\":[\"Picture\",\"Music\"]},\"Video\":{\"category1\":\"Video\",\"category2\":[\"TV\",\"Movie\",\"Cartoon\",\"Variety\"]}}";
var countryDictJSON = eval("("+countryDict+")");
var categoryDictJSON = eval("("+categoryDict+")");

var creatCountryDiv = function() {
	if(($(".countryList").text()).length<40) {
		var countryHtml = "<table>";
		$(countryDictJSON).each(function(index,obj){
			if(index%3==0) {
				countryHtml+="<tr>";
			}
			countryHtml+="<td><input type='checkbox' name='countryCode' class='countryClass' value='"+obj.countryCode+"'/><span>"+obj.countryNameCN+"</span></td><td align='left'></td>";
			if((index+1)%3==0) {
				countryHtml+="</tr>";
			}
		});
		countryHtml +="" +
		"<tr><td><input type='radio' name='radioAll' value='all' class='radioCountrClass' />&nbsp;全选</td><td>"+
		"<input type='radio' name='radioAll' value='no' class='radioCountrClass' />&nbsp;反选</td><td></td></tr></table>";
		$(".countryList").html(countryHtml);
	}
};
	
$('.radioCountrClass').live('click',function(){
	if($(this).val()=='all') {
		$(".countryClass").each(function(){
			$(this).attr("checked", true); 
		});
	} else {
		$(".countryClass").each(function(){
			$(this).attr("checked", false); 
		});
	}
});

var openCountryDiv = function() {
	creatCountryDiv();
	$(".country_content").css("display","block");
};

var closeCountryDiv = function(type,idsDoc,namesDoc) {
	if(type=="close") {
		$(".country_content").css("display","none");
		return;
	}
	var idStr="",nameStr="";
	$("input[name='countryCode']:checkbox").each(function(){
		if($(this).attr("checked")){
			idStr += $(this).val()+", ";
			nameStr +=$(this).next().text()+", ";
		};
	});
	$("#"+idsDoc).val(idStr);
	$("#"+namesDoc).val(nameStr);
	$(".country_content").css("display","none");
};

/**
 * 通用的select 从ajax里获得的list
 * array 或list
 * htmlId select的显示父级对象Id
 * selectedOption 选中的option值
 * selectName  select的name
 * array,htmlId,selectedOption,selectName,id
 */
var selectObj = function(params) {
	$("#"+params.htmlId).empty();
	var selectHtml="<select name='"+params.selectName+"' id='"+params.id+"'>";
	var arrays = params.array;
	$.each(arrays,function(n,value) {
		if(params.selectedOption==value.id) {
			selectHtml+="<option value='"+value.id+"' selected='selected'>"+value.name+"</option>";
		} else {
			selectHtml+="<option value='"+value.id+"'>"+value.name+"</option>";
		}
	});
	selectHtml+="</select>";
	$("#"+params.htmlId).html(selectHtml);
};

/**
 * 通用的select
 * array 配表数据
 * htmlId select的显示父级对象Id
 * selectedOption 选中的option值
 * selectName  select的name
 */
var selectObj2 = function(array,htmlId,selectedOption,selectName,id,kong) {
	$("#"+htmlId).empty();
	var selectHtml="<select name='"+selectName+"' id='"+id+"'>";
	if(kong) {
		selectHtml+="<option value=''>-全部-</option>";
	}
	$.each(array,function(n,value) {
		if(selectedOption==value) {
			selectHtml+="<option value='"+value+"' selected='selected'>"+value+"</option>";
		} else {
			selectHtml+="<option value='"+value+"'>"+value+"</option>";
		}
	});
	selectHtml+="</select>";
	$("#"+htmlId).html(selectHtml);
};
/*标签级联*/
var tagDiv = function(params) {
	var arrays = params.array;
	$("#lefDiv").empty();
	$("#rightDiv").empty();
	var selectHtml = "",rightSelectHtml = "";
	var checkedVars = params.checkedVars;
	
	$.each(arrays,function(n,value) {
		if(!checkedVars) {
			selectHtml+="<div style='height:20px; '><input type='checkbox' value='"+value.id+"' name='tagCheck'/>"+value.name+"</div>";
		} else {
			if(checkedVars.indexOf(value.id)>-1) {
				rightSelectHtml+="<div style='height:20px; '><input type='checkbox' checked='checked' value='"+value.id+"' name='tagCheckRight'/>"+value.name+"</div>";
			} else {
				selectHtml+="<div style='height:20px; '><input type='checkbox' value='"+value.id+"' name='tagCheck'/>"+value.name+"</div>";
			}
		}
		
	});
	$("#lefDiv").html(selectHtml);
	$("#rightDiv").html(rightSelectHtml);
};

var ajaxGetPro = function(url,methodName,params) {
	$.ajax({
		url:url,
		type:'get',
		dataType:'json',
		success:function(data) {
			params = $.extend(params,{'array':data.proList});
			methodName(params);
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		}
	});
};



/**
 * 产品备注信息校验
 */
$("#descId").mouseout(function(){
	var num = $(this).val().length;
	var surplusNum = 1000 - num;
	if(surplusNum<=0) {
		$("#descNumId").css("color","red").text("最多可输入1000个字符，现在已输入"+num+"个字符，已经超过1000个字符。");
	} else {
		$("#descNumId").css("color","#999").text("最多可输入1000个字符，现在已输入"+num+"个字符，还可以输入"+surplusNum+"个字符。");
	}
});

$("#cate2NameId").live('click',function(){//级联3菜单 
	$("#lefDiv").empty();
	$("#rightDiv").empty();
	ajaxGetPro('../item/getProStr?type=cate3&param='+$(this).val(),
			selectObj,{'htmlId':'cate3Td','selectedOption':'','selectName':'category3','id':'cate3NameId'});
});

$("#cate3NameId").live('click',function(){//级联关键字 
	$("#lefDiv").empty();
	$("#rightDiv").empty();
	ajaxGetPro('../item/getProStr?type=tag&param='+$(this).val(),
			tagDiv,{'htmlId':'lefDiv','name':'tagCheck'});
});

$("#cateGroy2Id").live('click',function(){//级联3菜单 无 关键字
	ajaxGetPro('../item/getProStr?type=cate3&param='+$(this).val(),
			selectObj,{'htmlId':'cate3Td','selectedOption':'','selectName':'category3','id':'category3Id'});
});

/**
 * 入库国家select插件 查询用
 */
var selectCountry = function(htmlId,selectedOption,selectName,id) {
	$("#"+htmlId).empty();
	var selectHtml="<select name='"+selectName+"' id='"+id+"'><option value=''>-请选择-</option>";
	$.each(countryDictJSON,function(n,value) {
		if(selectedOption==value.countryCode) {
			selectHtml+="<option value='"+value.countryCode+"' selected='selected'>"+value.countryNameCN+"</option>";
		} else {
			selectHtml+="<option value='"+value.countryCode+"'>"+value.countryNameCN+"</option>";
		}
	});
	selectHtml+="</select>";
	$("#"+htmlId).html(selectHtml);
};

/**
 * 根据入库国家Code获得name 字符串
 * @param countryIds
 * @returns {String}
 */
function getCountryNameStrs(countryIds) {
	var nameStrs="";
	$(countryDictJSON).each(function(index,obj){
		if(countryIds.indexOf(obj.countryCode)>-1) {
			nameStrs+=obj.countryNameCN+",";
		}
	});
	return nameStrs;
}
/**
 * 构造1级类别select
 */
var createCate1Select = function(params) {
	var cate1Select = params.title+"&nbsp;<select name='"+params.seleName+"' id='"+params.seleId+"'>";
	if(params.kong) {
		cate1Select+="<option value=''>-全部-</option>";
	}
	 for(var key in categoryDictJSON) {
		 	if(params.optionSeled == key) {
		 		cate1Select+="<option value='"+key+"' selected='selected'>"+key+"</option>";
		 	} else {
		 		cate1Select+="<option value='"+key+"'>"+key+"</option>";
		 	}
	 }
	 cate1Select+="</select>";
	$("#"+params.divId).html(cate1Select);
};
/**
 * 构造所有二级类别
 */
var createAllCate2Select = function(params) {
	$("#"+params.divId).empty();
	var cate2SelectSpanRANK = params.title+"&nbsp;<select name='"+params.seleName+"' id='"+params.seleId+"'>";
	if(params.kong) {
		cate2SelectSpanRANK+="<option value=''>-全部-</option>";
	}
	for(var key in categoryDictJSON) {
			var obj = categoryDictJSON[key];
			 $.each(obj.category2,function(n,value){
				 if(params.optionSeled == value) {
					 	cate2SelectSpanRANK+="<option value='"+value+"' selected='selected'>"+value+"</option>";
				 	} else {
				 		cate2SelectSpanRANK+="<option value='"+value+"'>"+value+"</option>";
				 	}
				 
			 });
		}
	cate2SelectSpanRANK+="</select>";
	$("#"+params.divId).html(cate2SelectSpanRANK);
};

/**
 * 弹出国家div checkbox 选中
 */
var creatCountryDivChecked = function(codes) {
	$(".countryList").empty();
		var countryHtml = "<table>";
		$(countryDictJSON).each(function(index,obj){
			if(index%3==0) {
				countryHtml+="<tr>";
			}
			if(codes.indexOf(obj.countryCode)>-1) {
				countryHtml+="<td><input type='checkbox' name='countryCode' class='countryClass' value='"
					+obj.countryCode+"' checked='checked'/><span>"+obj.countryNameCN+"</span></td><td align='left'></td>";
			} else {
				countryHtml+="<td><input type='checkbox' name='countryCode' class='countryClass' value='"
					+obj.countryCode+"'/><span>"+obj.countryNameCN+"</span></td><td align='left'></td>";
			}
			if((index+1)%3==0) {
				countryHtml+="</tr>";
			}
		});
		countryHtml +="</table>" +
		$(".countryList").html(countryHtml);
	$(".country_content").css("display","block");
};