<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>内计费包管理</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 50%;">
			<tr>
				<td>内计费包列表</td>
				<td align="right"><input type="button" value="添加" id="addInsalePakcage"></td>
			</tr>
	</table>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>

</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 queryTableHome();
});

$("#addInsalePakcage").click(function() {
	$.ajax({
		url:'../insale/saveInSalePackage',
		type:'get',
		secureuri: false,
		dataType:'json',
		data:null,
		success:function(data) {
			showMessage('操作成功','操作成功!');
			queryTableHome();
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		} 
	});
});

function queryTableHome() {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: null,
        singleSelect:true,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'inSalePackageID',
        url:'../insale/packageList',
        fitColumns:true,
        columns:[[
			{field:'inSalePackageID',title:'计费包',align:'center', width:300, formatter:function(value){
				value = value+"";
				if(value.length==1) {
					return "<a href='../insale/initView?id="+value+"&view=admin/insale/insaleInfo_List'>00"+value+"</a>";
				} else if(value.length==2) {
					return "<a href='../insale/initView?id="+value+"&view=admin/insale/insaleInfo_List'>0"+value+"</a>";
				} else {
					return "<a href='../insale/initView?id="+value+"&view=admin/insale/insaleInfo_List'>"+value+"</a>";
				}
			}}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}
</script>
</html>