<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>内计费申请管理</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>CP名称:&nbsp;&nbsp;<input type="text" name="cpName" value="" id="cpsearchNameId" /></td>
				<td></td>
				<td>是否收费:&nbsp;&nbsp;
					<select name="inSalePool" id="inSalePoolId">
						<option value="">-收费-</option>
						<option value="001">-免费-</option>
					</select>
				</td>
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
 	 	<input type="hidden" name="cpId" id="cpID" value=""/>
 	 	<table class="queryTable" style="padding:8px 30px;">
			<tr style="line-height: 40px;">
				<td align="right">CP名称：</td>
				<td><input type="text" value="" id="cpNameId" maxlength="5" readOnly="true" style="background: #F5F5F5;"/></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">新代码：</td>
				<td><input type="text" value=""  id="cpInSaleCodeID" maxlength="15" readOnly="true" style="background: #F5F5F5;"/></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">内计费包：</td>
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
			<tr style="line-height: 40px;">
				<td colspan="2" align="center"><font color="red">温馨提示:请牢记您的内计费新代码</font></td>
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
	queryTable({cpName:$("#cpsearchNameId").val(),inSalePool:$("#inSalePoolId").val()});
}); 

$("#searchButton").click(function() {
	queryTable({cpName:$("#cpsearchNameId").val(),inSalePool:$("#inSalePoolId").val()});
});

$(".closeClass").click(function() {
	$("#cpID").val("");
	$("#addInsaleInfoDiv").window("close");
});
$(".saveClass").click(function(){
	$.ajax({
		url:"../insale/addCpInSalePackage?packageID="+$("#inSalePackageIDSele").val()+"&cpID="+$("#cpID").val(),
		type:"get",
		secureuri: false,
		success:function(data) {
			showMessage('操作成功','操作成功!');
			$("#addInsaleInfoDiv").window("close");
			queryTable({cpName:$("#cpsearchNameId").val(),inSalePool:$("#inSalePoolId").val()});
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
        url:'../insale/cpInsaleList',
        fitColumns:true,
        columns:[[
			{field:'name',title:'CP名称',width:400,formatter:function(value,obj,index){
				return "<a href='../insale/cpInsaleView?viewUrl=admin/insale/cpItem_Insale_List&cpID="+obj.cpID+"'>"+value+"</a>";
			}},
			{field:'inSalePool',title:'内计费代码',width:300,formatter:function(value,obj,index){
				if(obj.inSalePackageID) {
					return obj.cpID+value;
				} else {
					return "";
				}
			}},
			{field:'inSalePackageID',title:'内计费包',width:300,formatter:function(value){
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
					return "<a href='#' onclick=update('"+obj.cpID+"','"+obj.name+"','"+obj.inSalePool+"','"+obj.inSalePackageID+"');>生成代码</a>";
			}},
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

function update(cpID, cpName, inSalePool, inSalePackageID) {
	$("#cpID").val(cpID);
	$("#cpNameId").val(cpName);
	$("#cpInSaleCodeID").val(cpID+inSalePool);
	$("#inSalePackageIDSele").val(inSalePackageID);
	$("#addInsaleInfoDiv").window("open");
}

</script>
</html>