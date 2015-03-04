<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>内计费申请</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>产品名称:&nbsp;&nbsp;<input type="text" name="itemName" value="" id="itemNameId" /></td>
				<td></td>
				<td><input type="button" value="查 询" id="searchButton" /></td>
			</tr>
	</table>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>


<div id="addInsaleInfoDiv" class="easyui-window" data-options="title:'编辑计费包信息',iconCls:'icon-save',closable:false" 
	style="width:430px;height:430px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<div align="center">
 	 	<input type="hidden" value="" id="packageId">
 	 	<table class="queryTable" style="padding:8px 30px;">
			<tr style="line-height: 40px;">
				<td align="right">产品名称：</td>
				<td id="itemNameTd"></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">内计费代码：</td>
				<td id="inSaleCodeTd"></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">计 费 包：</td>
				<td>
					<select name="inSalePackageID" id="inSalePackageIDSele">
					<c:forEach var="map" items="${inSalePackagelist}">
					    <c:forEach var="entry" items="${map}">
					    <c:if test="${entry.value<10}"><option value="${entry.value}">00${entry.value}</option></c:if>
						<c:if test="${entry.value>10 && entry.value<100}"><option value="${entry.value}">0${entry.value}</option></c:if>
						<c:if test="${entry.value>100}"><option value="${entry.value}">${entry.value}</option></c:if>
					    </c:forEach>
					</c:forEach>
					</select>
				</td>
			</tr>
	</table>
 	</div>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton saveClass" data-options="iconCls:'icon-ok'" href="javascript:void(0)" >确定</a>  
     <a class="easyui-linkbutton closeClass" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
     </div>
	</div> 
</div>
</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#addInsaleInfoDiv").window("close");
	queryTable({cpID:"${cpID}",itemName:$("#itemNameId").val()});
}); 

$("#searchButton").click(function() {
	queryTable({cpID:"${cpID}",itemName:$("#itemNameId").val()});
});

$(".closeClass").click(function() {
	$("#packageId").val("");
	$("#addInsaleInfoDiv").window("close");
});
$(".saveClass").click(function(){
	$.ajax({
		url:"../insale/updateItemInSalePackage?packageCode="+$("#inSalePackageIDSele").val()+"&id="+$("#packageId").val(),
		type:"get",
		secureuri: false,
		success:function(data) {
			$("#addInsaleInfoDiv").window("close");
			showMessage('操作成功','操作成功!');
			queryTable({itemName:$("#itemNameId").val()});
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		} 
	});
});

function queryTable(param) {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: param,
        singleSelect:true,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'cpID',
        url:'../insale/cpItemInSaleList',
        fitColumns:true,
        columns:[[
			{field:'name',title:'产品名称',width:400},
			{field:'inSaleID',title:'内计费代码',width:300,formatter:function(value){
				if(value) {
					return value;
				} else {
					return "";
				}
			}},
			{field:'inSalePackageID',title:'计费包',width:300,formatter:function(value){
				if(!value) {
					return "";
				} 
				value = value+"";
				if(value.length==1) {
					return "00"+value;
				} else if(value.length==2) {
					return "0"+value;
				} else {
					return value;
				}
			}},
			{field:'opt',title:'操作',width:300, formatter:function(value,obj,index){
					return "<a href='#' onclick=update('"+obj.inSaleID+"','"+obj.id+"','"+obj.name+"','"+obj.inSalePackageID+"');>编 辑</a>";
			}},
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

function update(cpInSaleCode, packageId,name, inSalePackageID) {
	$("#inSaleCodeTd").text(cpInSaleCode);
	$("#packageId").val(packageId);
	$("#itemNameTd").text(name); 
	$("#inSalePackageIDSele").val(inSalePackageID);
	$("#addInsaleInfoDiv").window("open");
}

</script>
</html>