<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>排名</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<input type="hidden" name="rankID" value="${rank.rankID}" id="rankIDID"/>
	<table class="queryTable" style="padding:8px 30px;width: 75%;">
			<tr>
				<td>${rank.name}产品列表</td>
			</tr>
	</table>
<br/>
<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true" style="word-break:break-all;"></table>
</div>
</div>


</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#tt').datagrid({
			width: $(".queryTable").width()+60,
			height:($(window).height()*0.88),
	    	queryParams:{'category2':'${rank.category2}'},
	        idField:'id',
	        url:'../rank/rankItemList',
	        singleSelect:false,
	        pageSize: 25,
	        loadMsg: "数据加载中，请稍后...",
	    	pageList: [25,35,45,65,100],
	        fitColumns:true,
	        columns:[[
	            {field:'iconID',title:'图标',align:'center', width:200,formatter:function(value){
	            	if(value.length>0) {
	            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
	            	} else {
	            		return "暂无图片";
	            	}
	            }},
	            {field:'itemID',align:'center',title:'产品ID', width:200},
	            {field:'name',align:'center',title:'产品名称', width:200},
	            {field:'category2',align:'center',title:'产品类型', width:100},
	            {field:'cate3Name',align:'center',title:'产品类别', width:100}
	           ]]
	        });
		$('#tt').datagrid("clearSelections");
	});
</script>
</html>