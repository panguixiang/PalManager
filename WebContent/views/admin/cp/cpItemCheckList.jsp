<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>
<span class="noCick clickA brCick">CP产品审批</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<form action="" method="post" id="queryFormId">
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
				<td align="left">CP名称：</td>
				<td ><input type="text" id="cpNameId" name="cpName" value="" size="30px"/></td>
				<td width="10px;"></td>
				<td align="left">产品状态：</td>
				<td>
					<select name="status" id="statusId">
						<option value="">-全部-</option>
						<option value="READY_CHECK">待审核</option>
						<option value="NO_CHECK">审核未通过</option>
						<option value="READY_TEST">待测试</option>
						<option value="READY_LIST">待上架</option>
						<option value="NO_TEST"> 测试未通过</option>
						<option value="DW_LIST"> 已下架</option>
					</select>
				</td>
			<td width="10px;"></td>
			</tr>
			<tr>
				<td><input type="button" value="查   询" id="queryButton" /></td>
				<td colspan="5"></td>
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
var role;
$(document).ready(function(){
	$("#versionCateGoryId").val(categoryDictJSON['Soft']["category2"]);//二级是否是软件类别  
	createCate1Select({title:'',seleName:'category1',seleId:'cateGroy1Id',optionSeled:'',divId:'catetd1'});
	selectObj2(categoryDictJSON[$("#cateGroy1Id").val()]['category2'],'cate2Td','','category2','cateGroy2Id','kong');//二级列表 
	role = "${sessionScope.manager.role}";//=='super  operater  tester'
	queryTable(params());
});

$("#cateGroy1Id").live('click',function(){//级联二级 
	var cateList = categoryDictJSON[$(this).val()]['category2'];
	selectObj2(cateList,'cate2Td','','category2','cateGroy2Id','kong');//二级列表 
});

$("#queryButton").click(function() {//点击查询 
	 queryTable(params());
});

function queryTable(params) {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: params,
        singleSelect:true,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'itemID',
        url:'../cp/cpItemList',
        fitColumns:true,
        columns:[[
            {field:'iconID',title:'图标', width:150,formatter:function(value,obj,index){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'name',title:'产品名称',width:320,formatter:function(value,obj,index){
            	return '<a href="../item/initUpdate?view=detail&itemID=+'+obj.itemID+'">'+value+'</a>&nbsp;';
            }},
            {field:'itemID',width:320,title:'产品ID'},
            {field:'versionCode',width:110,title:'版本代码',formatter:function(value){
            	if(value == null) {
            		return "1";
            	}
            	return value;
            }},
            {field:'category1',width:140,title:'一级类型'},
            {field:'category2',width:140,title:'产品类型'},
            {field:'cpName',width:140,title:'CP名称'},
            {field:'status',width:130,title:'产品状态',align:'center', formatter:function(value,obj,index){
            	if(value=='READY_CHECK') {
            		if(role=="super") {
            			return '<div class="editcls"><a href="../cp/cpItemDetail?itemID='+obj.itemID+'">待审核</a></div>&nbsp;';
            		} else {
            			return '<a href="../cp/cpItemDetail?itemID='+obj.itemID+'">待审核</a>&nbsp;';
            		}
            	}
            	if(value=='NO_CHECK') {
            		return '<a href="../cp/cpItemDetail?itemID='+obj.itemID+'">审核未通过</a>&nbsp;';
            	}
            	if(value=='READY_TEST') {
            		if(role=="tester") {
            			return '<div class="editcls"><a href="../cp/cpItemDetail?itemID='+obj.itemID+'">待测试</a></div>&nbsp;';
            		} else {
            			return '<a href="../cp/cpItemDetail?itemID='+obj.itemID+'">待测试</a>&nbsp;';
            		}
            	}
            	if(value=='READY_LIST') {
            			return '<a href="../cp/cpItemDetail?itemID='+obj.itemID+'">待上架</a>&nbsp;';
            	}
            	if(value=='NO_TEST') {
            		return '<a href="../cp/cpItemDetail?itemID='+obj.itemID+'">测试未通过</a>&nbsp;';
            	}
            	if(value=='DW_LIST') {
            		return '<a href="../cp/cpItemDetail?itemID='+obj.itemID+'">已下架</a>&nbsp;';
            		return "";
            	}
            	if(value=='LIST') {
            		return '<a href="../cp/cpItemDetail?itemID='+obj.itemID+'">已上架</a>&nbsp;';
            	}
            }},
            {field:'manName',width:140,title:'处理人'}
           ]]
        });
	//$('#tt').datagrid("clearSelections");
} 
var params = function() {
	var param = {status:$("#statusId").val(),
			itemID:$("#itemID").val(),name:$("#name").val(),category1:$("#cateGroy1Id").val(),category2:$("#cateGroy2Id").val(),
		 	cpName:$("#cpNameId").val()};
	return param;
};

function checkBut() {
	location.href="../body/initPage?viewUrl=admin/cp/cpItemCheck";
}
</script>
<style>
<!--
.editcls a{
 font-family: Arial;
 font-size: .8em;
 text-align:center;
 margin:3px;
}
.editcls a:link, a:visited{ 
 color: #A62020;
 padding:4px 10px 4px 10px;
 background-color: #ecd8db;
 text-decoration: none;
 border-top: 1px solid #EEEEEE; 
 border-left: 1px solid #EEEEEE;
 border-bottom: 1px solid #717171;
 border-right: 1px solid #717171;
}
-->
</style>
</html>