<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>
<span class="noCick clickA">黑名单管理</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<form action="" method="post" id="queryFormId">
		<input type = "hidden" name="status" value="LIST" id="searStatus"/>
		<input type="hidden" value="" name="countryCodes" id="countryCodes" />
		<input type="hidden" name="versionCateGory" value="" id="versionCateGoryId"/>
		<table class="queryTable" style="padding:8px 30px; width: 75%;">
				<tr>
					<td align="left" width="100px">一级类型：</td>
					<td id="catetd1"></td>
					<td width="10px;"></td>
					<td align="left" width="100px">产品类型：</td>
					<td id="cate2Td"></td>
					<td width="10px;"></td>
				</tr>
				<tr> 
					<td>产品ID：</td>
					<td><input type="text" id="itemId" name="itemID" value="" size="30px"/></td>
					<td width="10px;"></td>
					<td>产品名称：</td>
					<td><input type="text" id="nameId" name="name" value="" size="30px"/></td>
					<td width="10px;"></td>
				</tr>
				<tr>
					<td colspan="6"><input type="button" value="查 询" id="queryButton" /></td>
				</tr>
				<tr>
					<td id="rukuId" colspan="6">拉黑国家：
					<input type="button" value="选 择" onclick="openCountryDiv();"/>
					<input type="text" id="countryNamesId" readonly="readonly" size="52px" style="background: #F5F5F5;"/>
					&nbsp;&nbsp;<input type="button" value="拉 黑" id="blackButton" />
					</td>
				</tr>
		</table>
	</form>
<br/>
<div class="easyui-layout" >
<table id="tt" rownumbers="true" pagination="true" style="word-break:break-all;"></table>
</div>
</div>

<div class="country_content">
<div class="countryList"></div>
<div>
	<input type="button" value="关闭" onclick="closeCountryDiv('close','','');" />
	<input type="button" value="确定" onclick="closeCountryDiv('','countryCodes','countryNamesId');" />
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
	 $(".country_content").css("top",20);//修改国家弹出层div到top的距离 
	 queryTable(params());
});
$("#cateGroy1Id").live('click',function(){//级联二级 
	var cateList = categoryDictJSON[$(this).val()]['category2'];
	selectObj2(cateList,'cate2Td','','category2','cateGroy2Id','kong');//二级列表 
});

$("#queryButton").click(function() {//点击查询 
	 queryTable(params());
});

$("#blackButton").click(function(){//产品拉黑
	 var idStr = "", blackCodes = $("#countryCodes").val();
	var rows = $('#tt').datagrid('getSelections');//获得所有选中的产品ID
	for(var i=0; i<rows.length; i++){
		idStr+=rows[i].itemID+",";
	}
	 if(idStr.length>2 && ($.trim(blackCodes)).length>2) {
		 $.ajax({
				url:'../item/blackItemOpt',
				type:'post',
				dataType:'json',
				data:{itemIDS:idStr,blackCountryCodes:blackCodes},
				success:function(data) {
						$.messager.alert('成功提示','操作成功!');
						queryTable(params());
				},
				error:function(response,data){
					$.messager.alert('错误提示',"ajax请求发生错误!");
				}
			});
	 } else {
		 $.messager.alert('错误提示','拉黑国家和拉黑产品都不能为空，请选择!');
	 }
});

function queryTable(params) {
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
            {field:'iconID',title:'图标', width:150,formatter:function(value,obj,index){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'name',title:'产品名称',width:400,formatter:function(value,obj,index){
            	return '<a href="../item/initUpdate?view=detail&itemID=+'+obj.itemID+'">'+value+'</a>&nbsp;&nbsp;';
            }},
            {field:'id',title:'产品ID',width:300,formatter:function(value,obj,index){
        		return obj.itemID;
        	}},
            {field:'category2',width:250,title:'产品类型'},
            {field:'versionCode',width:250,title:'产品版本',formatter:function(value){
            	if(value == null) {
            		return "1";
            	}
            	return value;
            }},
            {field:'versionName',title:'版本名称',width:250}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

var params = function() {
	return {status:$("#searStatus").val(),versionCateGory:$("#versionCateGoryId").val(),itemID:$("#itemId").val(),
		category1:$("#cateGroy1Id").val(),
		name:$("#nameId").val(),category2:$("#cateGroy2Id").val()};
};
</script>
</html>