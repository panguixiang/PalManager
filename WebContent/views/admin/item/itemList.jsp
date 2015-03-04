<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>
<span class="noCick clickA brCick" id="NOLIST">未上架产品</span>&nbsp;&nbsp;&nbsp;
<span class="noCick brCick" id="LIST">上架产品</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<form action="" method="post" id="queryFormId">
<input type="hidden" name="status" value="NOLIST" id="statusId"/>
<input type="hidden" name="versionCateGory" value="" id="versionCateGoryId"/>
	<table class="queryTable" style="padding:8px 30px;width: 85%;">
			<tr>
				<td align="left">一级类型：</td>
				<td id="catetd1">
				</td>
				<td width="10px;"></td>
				<td align="left">产品类型：</td>
				<td id="cate2Td">
				</td>
				<td width="10px;"></td>
			</tr>
			<tr>
				<td align="left" width="100px">产品ID：</td>
				<td><input type="text" id="itemID" name="itemID" value="" size="30px"/></td>
				<td width="10px;"></td>
				<td align="left" width="100px">产品名称：</td>
				<td><input type="text" id="name" name="name" value="" size="30px"/></td>
				<td width="10px;"></td>
			</tr>
			<tr>
				<td id="rukuId" align="left">入库国家：</td>
				<td id="countryId"></td>
				<td width="10px;"></td>
				<td align="left">选择时间：</td>
				<td colspan="2">
				<input type="text" value="" name="addTime" class="rangeA" size="30px" id="addTimeId"/>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="查   询" id="queryButton" /></td>
				<td><input type="button" value="删    除" id="deleteId"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="上   架" id="buttId" class="updateStatusClass"/></td>
				<td colspan="4"></td>
			</tr>
	</table>
</form>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>
</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/proper.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#versionCateGoryId").val(categoryDictJSON['Soft']["category2"]);//二级是否是软件类别  
	createCate1Select({title:'',seleName:'category1',seleId:'cateGroy1Id',optionSeled:'',divId:'catetd1'});
	selectObj2(categoryDictJSON[$("#cateGroy1Id").val()]['category2'],'cate2Td','','category2','cateGroy2Id','kong');//二级列表 
	selectCountry('countryId','','countryCode','countryCodeId');//入库国家
	queryTable(params());
	 $('.rangeA').daterangepicker({
         presetRanges:[
         ],
         presets:{
             dateRange:'自定义时间'
         },
         rangeStartTitle:'起始日期',
         rangeEndTitle:'结束日期',
         nextLinkText:'下月',
         prevLinkText:'上月',
         doneButtonText:'确定',
         cancelButtonText:'取消',
         earliestDate:'',
         latestDate:Date.parse('today'),
         constrainDates:true,
         rangeSplitter:'--',
         dateFormat:'yy-mm-dd',
         closeOnSelect:false,
         onOpen:function(){
             $('.ui-daterangepicker-dateRange').click().parent().hide();
         }
	});
	
});

$("#cateGroy1Id").live('click',function(){//级联二级 
	var cateList = categoryDictJSON[$(this).val()]['category2'];
	selectObj2(cateList,'cate2Td','','category2','cateGroy2Id','kong');//二级列表 
});

$(".updateStatusClass").click(function(){//产品上架、下架  
	 var idStr = "",status = $('.clickA').attr('id');
	var selected = $('#tt').datagrid("getSelections");
	var packageName="",message="";
	if(status=='LIST') {
		status = 'DW_LIST';
	} else {
		status = 'LIST';
	}
	$.each(selected, function(index, item){
		if(item.packageName != '' && status == 'LIST' && packageName.indexOf(item.packageName)>-1) {
			message="您已经选择了多个，包名称为 "+item.packageName+"的软件产品，同一包名称的软件产品最多只能够有一个处于上架状态，请重新选择！";
			return;
		}
		idStr += item.itemID + ",";
       packageName+=item.packageName+",";
   });
	if(message.length>2) {
		$.messager.alert('错误提示',message);
		return;
	}
	if(idStr.length>2) {
	 	ajaxPro('../item/updateItemStatus',queryTable,{'itemIds':idStr,'status':status},params()); 
	}
});

$("#queryButton").click(function() {//点击查询 
	 queryTable(params());
});

$(".noCick").click(function() {//却换面包屑 
	 $(".noCick").removeClass("clickA");
	 $(this).addClass("clickA");
	 if($(this).attr("id")=="NOLIST") {
		 $("#statusId").val('NOLIST');
		 $("#rukuId").text("入库国家：");
		 $("#deleteId").css("display",""); 
		 $("#buttId").val("上  架");
	 } else {
		 $("#statusId").val('LIST');
		 $("#rukuId").text("上架国家："); 
		 $("#deleteId").css("display","none");
		 $("#buttId").val("下   架");
	 }
	 queryTable(params());
});

$("#deleteId").click(function(){//产品删除
	 $.messager.confirm('确认', '确认删除?', function(r){  
        if (r){
       	 var idStr = "";
			 $("input[name='itemID']:checkbox").each(function(){
					if($(this).attr("checked")){
						idStr += $(this).val()+","+$(this).parent().parent().next().children().text()+"|"; 
					}
				});
			 if(idStr.length>2) {
				 ajaxPro('../item/deleteItems',queryTable,{'itemIds':idStr},params()); 
			 }
        }  
    });  
});

var checkReNew = function(itemId) {
	location.href='../item/initUpdate?view=update&itemID='+itemId+'&type=renew'; 
};

var ajaxPro = function(url,methodName,data,params) {
	$.ajax({
		url:url,
		type:'get',
		dataType:'json',
		data:data,
		success:function(data) {
			if(data.message) {
				$.messager.alert('错误提示',data.message);
			} else {
				methodName(params);
			}
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		}
	});
};

function queryTable(params) {
	var s = false;
	if($('.clickA').attr('id')=="LIST") {
		s = true;
		dataTitle="上架时间";
	} else {
		dataTitle="入库时间";
	}
	//$('#tt').datagrid("clearSelections");
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: params,
        singleSelect:false,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'itemID',
        url:'../item/itemList',
        fitColumns:true,
        columns:[[
			{field: 'itemID',checkbox:'true',width:50},
			{field: 'country',hidden:true,width:3},
            {field:'iconID',title:'图标', width:150,formatter:function(value,obj,index){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'name',title:'产品名称',width:320,formatter:function(value,obj,index){
            	return '<a href="../item/initUpdate?view=detail&itemID=+'+obj.itemID+'">'+value+'</a>&nbsp;&nbsp;';
            }},
            {field:'packageName',title:'包名称',width:320},
            {field:'status',hidden:s,width:130,title:'产品状态',formatter:function(value){
            	if(value=='READY_CHECK') {
            		return "待审核";
            	}
            	if(value=='NO_CHECK') {
            		return "审核未通过";
            	}
            	if(value=='READY_TEST') {
            		return "待测试";
            	}
            	if(value=='READY_LIST') {
            		return "待上架";
            	}
            	if(value=='NO_TEST') {
            		return "测试未通过";
            	}
            	if(value=='DW_LIST') {
            		return "已下架";
            	}
            }},
            {field:'category2',width:140,title:'产品类型'},
            {field:'versionCode',width:110,title:'版本代码',formatter:function(value){
            	if(value == null) {
            		return "1";
            	}
            	return value;
            }},
            {field:'versionName',title:'版本名称',width:110},
            {field:'date',width:250,title:dataTitle,formatter:function(value,obj,index){
            	var unixTimestamp;
            	if(s) {
           	 		unixTimestamp = new Date(obj.listDate);
            	} else {
            		unixTimestamp = new Date(obj.createDate);
            	}
                return unixTimestamp.toLocaleString();
           	}},
            {field:'opt',width:200,align:'center',title:'编辑',align:'center',rowspan:2,formatter:function(value,obj,index){
            	var e = "";
            	if(obj.status=='NO_CHECK' || obj.status=='NO_TEST') {
            		e = '<a href="../item/initUpdate?view=update&itemID=+'+obj.itemID+'">修改</a>&nbsp;&nbsp;';
            	}
            	else if(obj.status=='LIST') {
            		e = '<a href="../item/initUpdate?view=update&itemID=+'+obj.itemID+'">修改</a>&nbsp;&nbsp;';
            		e = e+'<a href="#" mce_href="#" onclick="checkReNew(\''+ obj.itemID + '\')">更新</a>';
            	}
                return e;
            }}  
           ]]
        });
	$('#tt').datagrid("clearSelections");
}
var params = function() {
	var param = {status:$("#statusId").val(),versionCateGory:$("#versionCateGoryId").val(),itemID:$("#itemID").val(),
		 name:$("#name").val(),category1:$("#cateGroy1Id").val(),category2:$("#cateGroy2Id").val(),
		 countryCode:$("#countryCodeId").val(),addTime:$("#addTimeId").val()};
	return param;
};
</script>
<script type="text/javascript" src="../daterangepicker/datepicker/js/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript" src="../daterangepicker/datepicker/js/daterangepicker.jQuery.js"></script>
<link rel="stylesheet" href="../daterangepicker/css/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="../daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
</html>