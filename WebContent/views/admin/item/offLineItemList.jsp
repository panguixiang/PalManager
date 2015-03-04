<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">
	<span class="noCick brCick clickA" id="Feature">Feature</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick" id="MustHave">MustHave</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick " id="App">App</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick " id="Game">Game</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick " id="Video">Video</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick" id="Music">Music</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick" id="Picture">Picture</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;width: 85%;">
			<tr>
				<td align="left" width="100px">产品ID：</td>
				<td><input type="text" id="itemID" name="itemID" value="" size="30px"/></td>
				<td align="left" width="100px">产品名称：</td>
				<td><input type="text" id="name" name="name" value="" size="30px"/></td>
			</tr>
			<tr>
				<td align="left">选择时间：</td>
				<td colspan="2">
				<input type="text" value="" name="addTime" class="rangeA" size="60px" id="addTimeId"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" value="查   询" id="queryButton" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="删    除" id="deleteId"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="保  存" id="buttId" class="updateStatusClass"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="添加产品" id="addButId"/>
				</td>
			</tr>
	</table>
<br/>
<div class="easyui-layout" >
	<table id="tt" rownumbers="true" pagination="true"></table>
</div>
</div>

<div id="addItemDiv" class="easyui-window" data-options="title:'添加线下产品上榜',iconCls:'icon-save',closable:false" 
	style="width:900px;height:700px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<div>
 	 	<table class="queryTable" style="padding:8px 30px;">
			<tr>
				<td>产品ID：</td>
				<td><input type="text" value="" id="itemIDID"/></td>
				<td width="10px;"></td>
				<td>产品名称：</td>
				<td><input type="text" value=""  id="itemNameID"/></td>
				<td width="10px;"></td>
			</tr>
			<tr>
			<td><input type="button" value="查   询" id="searchButton" /></td>
			<td>
			<input type="button" value="产品上榜" id="RankingButton"/>
			</td>
			<td colspan="4"></td>
			</tr>
	</table>
 	</div></br>
         <div class="easyui-layout" >
        	 <table id="ttSearch" rownumbers="true" pagination="true" style="word-break:break-all;"></table>
		</div>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="closeDiv();">关闭</a>  
     </div>
	</div>
</div>

</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#addItemDiv").window("close");
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
	queryTable(params());
});

$(".noCick").click(function() {//却换面包屑 
	 $(".noCick").removeClass("clickA");
	 $(this).addClass("clickA");
	 queryTable(params());
});

function queryTable(param) {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams:param,
        idField:'id',
        url:'../item/offLineItemList',
        singleSelect:false,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        fitColumns:true,
        columns:[[
			{field:'id',checkbox:'true',width:50},
            {field:'iconID',title:'图标',align:'center', width:200,formatter:function(value){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'itemID',align:'center',title:'产品ID', width:200},
            {field:'name',align:'center',title:'产品名称', width:200},
            {field:'versionCode',align:'center',title:'产品版本', width:100},
            {field:'category3',align:'center',title:'产品类别', width:100},
            {field:'price',title:'销售价格', width:150,formatter:function(value,obj,index){
            	var selecPrice = "<select name='price' id='price"+obj.id+"'>"; 
            	for(var i=0;i<=100;) {
            		if(value == i) {
            			selecPrice+="<option value='"+i+"' selected='selected'>"+i+"</option>";
            		} else {
            			selecPrice+="<option value='"+i+"'>"+i+"</option>";
            		}
            		i=i+10;
            	}
            	selecPrice+="</select>";
            	return selecPrice;
            }},
            {field:'sortV',title:'排 名', width:150,formatter:function(value,obj,index){
            	var selecSort = "<select name='sortV' id='sortV"+obj.id+"'>"; 
            	for(var i=1;i<=20;i++) {
            		if(value == i) {
            			selecSort+="<option value='"+i+"' selected='selected'>"+i+"</option>";
            		} else {
            			selecSort+="<option value='"+i+"'>"+i+"</option>";
            		}
            	}
            	if(value==100) {
            		selecSort+="<option value='10000' selected='selected'>10000</option>";
            	} else {
            		selecSort+="<option value='10000'>10000</option>";
            	}
            	selecSort+="</select>";
            	return selecSort;
            }}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

var params = function() {
	var param = {status:"LIST",itemID:$("#itemID").val(),name:$("#name").val(),
			rank:$(".clickA").attr("id"),
			addTime:$("#addTimeId").val()};
	return param;
};

$("#queryButton").click(function(){
	 queryTable(params());
});

$("#deleteId").click(function(){//删除
	 var idStr = "";
	var rows = $('#tt').datagrid('getSelections');//获得所有选中的产品ID
	for(var i=0; i<rows.length; i++){
		idStr+=rows[i].id+",";
	}
	 if(idStr.length>1) {
		 $.ajax({
				url:'../item/deleteOfline?ids='+idStr,
				type:'get',
				dataType:'json',
				success:function(data) {
						$.messager.alert('成功提示','操作成功!');
						queryTable(params());
				},
				error:function(response,data){
					$.messager.alert('错误提示',"ajax请求发生错误!");
				}
			});
	 } else {
		 $.messager.alert('错误提示','请选择需要删除的下线产品!');
	 }
});

$(".updateStatusClass").click(function(){
	var strs = "";
	var rows = $('#tt').datagrid('getRows');
	for(var i=0; i<rows.length; i++){
		strs+=(rows[i].id+"-"+$("#price"+rows[i].id).val()+"-"+$("#sortV"+rows[i].id).val()+",");
	}
	if($.trim(strs).length==0) {
		return;
	}
	$.ajax({
		url:'../item/updateOfLineSortV?str='+strs,
		type:'get',
		secureuri: false,
		dataType:'json',
		success:function(data) {
			showMessage('操作成功','操作成功!');
			queryTable(params());
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		}
	});
});

$("#addButId").click(function() {
	$("#addItemDiv").window("open");
	queryTableSearch({});
});

$("#searchButton").click(function() {
	queryTableSearch({name:$("#itemNameID").val(),itemID:$("#itemIDID").val(),status:'LIST'});
});

function queryTableSearch(params) {
	var type = $(".clickA").attr("id");
	if(type=="MustHave") {
		params = $.extend(params,{category1:'Soft'});
	} else if(type=="Feature") {
		params = $.extend(params,{category1:'Soft'});
	} else {
		params = $.extend(params,{category2:type});
	}
	$('#ttSearch').datagrid({
		width: $("#addItemDiv").width()*0.96,
		height:($("#addItemDiv").height()*0.88),
    	queryParams:params,
        loadMsg: "数据加载中，请稍后...",
        idField:'itemID',
        url:'../item/itemList',
        singleSelect:false,
        fitColumns:true,
        columns:[[
			{field:'Router',title:'<img src="../images/noCheck.png" id="Router" class="devicTypeClass" width="16px" height="16px">路由器</img>',width:120,formatter:function(value, rowData, rowIndex)
			{
				return '<input name="Router" type="checkbox">'; 
			}},//自定义checkbox
			{field:'PAD',title:'<img src="../images/noCheck.png" id="PAD" class="devicTypeClass" width="16px" height="16px">PAD</img>',width:100,formatter:function(value, rowData, rowIndex)
				{
					return '<input name="PAD" type="checkbox">'; 
				}},//自定义checkbox
            {field:'iconID',title:'图标',align:'center', width:200,formatter:function(value){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'itemID2',align:'center',title:'产品ID', width:200,formatter:function(value,obj,index){
            	return obj.itemID;
            }},
            {field:'name',align:'center',title:'产品名称', width:200},
            {field:'versionCode',align:'center',title:'产品版本', width:100},
            {field:'category2',align:'center',title:'产品类型', width:100},
            {field:'cate3Name',align:'center',title:'产品类别', width:100}
           ]]
        });
	$('#ttSearch').datagrid("clearSelections");
}
function closeDiv() {
	$("#addItemDiv").window("close");
}

//全选
$(".devicTypeClass").live("click",function(){
	if($(this).attr("src")=="../images/noCheck.png") {
        $("input[name='"+$(this).attr("id")+"']").attr("checked",'checked');
        $(this).attr("src","../images/allCheck.png");
    }else{
    	 $("input[name='"+$(this).attr("id")+"']").removeAttr("checked");
    	 $(this).attr("src","../images/noCheck.png");
    }
});

$("#RankingButton").click(function(){
	var strs = "";
	var pad,itemId;
	$('input[type="checkbox"][name="Router"]').each(function() {
		pad = $(this).parent().parent().next().children().children();
		if($(this).attr("checked")=="checked" || $(pad).attr("checked")=="checked") {
			itemId = $(pad).parent().parent().next().next().children().text();
			strs += itemId+"-";
			if($(this).attr("checked")=="checked") {
				strs +="Router";
			}
			if($(pad).attr("checked")=="checked") {
				strs +=" PAD";
			}
			strs+=",";
		}
	});
	if($.trim(strs).length==0){
		$.messager.alert('错误提示',"请选择产品添加设备!");
		return;
	}
    $.ajax({
		url:'../item/addOfLineSortV?str='+strs+"&rank="+$(".clickA").attr("id"),
		type:'get',
		secureuri: false,
		dataType:'json',
		success:function(data) {
			showMessage('操作成功','操作成功!');
			$("#addItemDiv").window("close");
			queryTable(params());
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		}
	});
});
</script>
<script type="text/javascript" src="../daterangepicker/datepicker/js/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript" src="../daterangepicker/datepicker/js/daterangepicker.jQuery.js"></script>
<link rel="stylesheet" href="../daterangepicker/css/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="../daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
</html>