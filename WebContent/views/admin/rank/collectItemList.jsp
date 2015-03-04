<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>${col.name}榜单 产品列表</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<input type="hidden" name="colID" value="${col.colID}" id="colID"/>
	<table class="queryTable" style="padding:8px 30px;">
			<tr>
				<td>产品ID：</td>
				<td><input type="text" id="itemID" name="itemID" value=""/></td>
				<td width="10px;"></td>
				<td>产品名称：</td>
				<td><input type="text" id="nameId" name="itemName" value=""/></td>
				<td width="10px;"></td>
				<td>产品类型：</td>
				<td id="catetd2"></td>
			</tr>
			<tr>
				<td><input type="button" value="查   询" id="queryButton" /></td>
				<td><input type="button" value="添  加" class="addItemsButton"/>&nbsp;&nbsp;
				<input type="button" value="删  除"  class="deleteButton">&nbsp;&nbsp;
				<input type="button" value="保  存" class="saveSortVButton"/></td>
				<td colspan="6"></td>
			</tr>
	</table>
<br/>
<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true" style="word-break:break-all;"></table>
</div>
</div>

<div id="addItemDiv" class="easyui-window" data-options="title:'上榜产品添加',iconCls:'icon-save',closable:false" style="width:800px;height:700px;padding:5px;"> 
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
				<td>产品类型：</td>
				<td id="searchCatetd2"></td>
			</tr>
			<tr>
				<td><input type="button" value="查   询" id="searchButton" /></td>
				<td><input type="button" value="上  榜" id="RankingButton"/></td>
				<td colspan="6"></td>
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
<script type="text/javascript" src="../js/proper.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#addItemDiv").window("close");
		var cate = categoryDictJSON['${col.category1}'];
		selectObj2(cate['category2'],'catetd2','','category2','cate2NameId','kong');//主页div
		selectObj2(cate['category2'],'searchCatetd2','','category2','searchCate2NameId','kong');//查询div
		queryTable({category1:'${col.category1}',colID:'${col.colID}'});
	});
	
	$(".addItemsButton").click(function() {
		$("#addItemDiv").window("open");
	});
	
	$("#searchButton").click(function() {
		queryTableSearch({name:$("#itemNameID").val(),itemID:$("#itemIDID").val(),
				status:'LIST',category1:'${col.category1}',category2:$("#searchCate2NameId").val()});
	});
	
	$("#RankingButton").click(function() {//添加产品 
		var strs = "";
		var rows = $('#ttSearch').datagrid('getSelections');
		for(var i=0; i<rows.length; i++){
			strs+=rows[i].itemID+",";
		}
		if($.trim(strs).length==0) {
			return;
		}
		$.ajax({
			url:'../rank/addCollectionItems?colID=${col.colID}&itemIDS='+strs.substring(0,strs.length-1),
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
	
	$("#queryButton").click(function(){
		queryTable(params());
	});
	$(".saveSortVButton").click(function(){//修改排序
		var strs = "";
		var rows = $('#tt').datagrid('getRows');
		for(var i=0; i<rows.length; i++){
			strs+=(rows[i].id+" ,"+$("#sortV"+rows[i].id).val()+"|");
		}
		if($.trim(strs).length==0) {
			return;
		}
		$.ajax({
			url:'../rank/updateSortV?tableName=item_collection&key=id&ids='+strs,
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
	
	$(".deleteButton").click(function() {//删除产品  
		var strs = "";
		var rows = $('#tt').datagrid('getSelections');
		for(var i=0; i<rows.length; i++){
			strs+=rows[i].id+",";
		}
		if($.trim(strs).length==0) {
			return;
		}
		 $.messager.confirm('确认', '确认删除?', function(r){  
             if (r){
            	 strs = strs.substring(0,strs.length-1);
				$.ajax({
					url:'../rank/deleteCollectItems?id='+strs,
					type:'get',
					secureuri: false,
					dataType:'json',
					success:function(data) {
						showMessage('操作成功','删除成功!');
						queryTable(params());
					},
					error:function(response,data){
						$.messager.alert('错误提示',"ajax请求发生错误!");
					} 
				});
            }
		 });
	});
	
	function closeDiv() {
		$("#addItemDiv").window("close");
	}
	function queryTable(param) {
		$('#tt').datagrid({
			width: $(".queryTable").width()+60,
			height:($(window).height()*0.88),
	    	queryParams:param,
	        idField:'id',
	        url:'../rank/collectionItemList',
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
	            {field:'category2',align:'center',title:'产品类型', width:100},
	            {field:'cate3Name',align:'center',title:'产品类别', width:100},
	            {field:'sortV',title:'排  名', width:150,formatter:function(value,obj,index){
	            	var selecSort = "<select name='sortV' id='sortV"+obj.id+"'>"; 
	            	for(var i=1;i<=20;i++) {
	            		if(value == i) {
	            			selecSort+="<option value='"+i+"' selected='selected'>"+i+"</option>";
	            		} else {
	            			selecSort+="<option value='"+i+"'>"+i+"</option>";
	            		}
	            	}
	            	if(value==100) {
	            		selecSort+="<option value='100' selected='selected'>100</option>";
	            	} else {
	            		selecSort+="<option value='100'>100</option>";
	            	}
	            	selecSort+="</select>";
	            	return selecSort;
	            }}
	           ]]
	        });
		$('#tt').datagrid("clearSelections");
	}
	
	function queryTableSearch(params) {
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
				{field: 'itemID',checkbox:'true',width:50},
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
	var params = function() {
		return {itemID:$("#itemID").val(),itemName:$("#nameId").val(),
			colID:$("#colID").val(),category1:'${col.category1}',category2:$("#cate2NameId").val()};
	};
</script>
</html>