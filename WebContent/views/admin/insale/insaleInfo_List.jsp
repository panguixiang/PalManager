<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>内计费包信息管理</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>内计费包信息列表</td>
				<td align="right"><input type="button" value="添加" id="addInsalePakcageInfo"></td>
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
 	 	<form action="" method="post" id="insaleForm">
 	 	<input type="hidden" name="id" id="infoID" value=""/>
 	 	<input type="hidden" name="inSalePackageID" value="${id}"/>
 	 	<table class="queryTable" style="padding:8px 30px;">
			<tr style="line-height: 40px;">
				<td align="right">mccMnc：</td>
				<td><input type="text" name="mccMnc" value="" id="mccMncId" maxlength="5" style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">端口号：</td>
				<td><input type="text" name="port" value=""  id="portID" maxlength="15" style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">指 令：</td>
				<td><input type="text" name="cmd" value="" id="cmdID" maxlength="25" style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">价 格：</td>
				<td><input type="text" name="price" value=""  id="priceID" maxlength="10" style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">单 位：</td>
				<td>
					<select name="unit" id="unitId">
						<option value="USD">-USD-</option>
						<option value="RMB">-RMB-</option>
					</select>
				</td>
			</tr>
			<tr style="line-height: 40px;">
				<td align="right">汇 率：</td>
				<td><input type="text" name="rate" value="" id="rateId" maxlength="6" style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></td>
				<td width="10px;"></td>
			</tr>
	</table></form>
 	</div>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton saveClass" data-options="iconCls:'icon-ok'" href="javascript:void(0)" >确定</a>  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="cleanForm();">取消</a>  
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
	 queryTable({inSalePackageID:"${id}"});
});

$("#addInsalePakcageInfo").click(function() {
	$("#addInsaleInfoDiv").window("open");
});

$(".saveClass").click(function(){
	if(check()) {
		$.ajax({
			url:'../insale/saveInSaleInfo',
			type:'post',
			secureuri: false,
			dataType:'json',
			data:$("#insaleForm").serialize(),
			success:function(data) {
				showMessage('操作成功','操作成功!');
				cleanForm();
				queryTable({inSalePackageID:"${id}"});
			},
			error:function(response,data){
				$.messager.alert('错误提示',"ajax请求发生错误!");
			} 
		});
	}
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
        idField:'id',
        url:'../insale/infoList',
        fitColumns:true,
        columns:[[
			{field:'mccMnc',title:'mccMnc',width:300},
			{field:'port',title:'端口号',width:300},
			{field:'cmd',title:'指令',width:300},
			{field:'price',title:'价格',width:300},
			{field:'unit',title:'单位',width:300},
			{field:'rate',title:'汇率',width:300,formatter:function(value,obj,index){
				if(obj.unit=="RMB") {
					return obj.rateRMB;
				} else {
					return obj.rateUSD;
				}
			}},
			{field:'opt',title:'操作',width:300, formatter:function(value,obj,index){
					return "<a href='#' onclick=update('"+obj.id+"','"+obj.mccMnc+"','"
							+obj.port+"','"+obj.cmd+"','"+obj.price+"','"+obj.unit+"','"+obj.rateRMB+"','"+obj.rateUSD+"');>编辑</a>";
			}},
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

function update(id, mccMnc, port, cmd, price, unit, rateRMB, rateUSD) {
	$("#infoID").val(id);
	$("#mccMncId").val(mccMnc);
	$("#portID").val(port);
	$("#cmdID").val(cmd);
	$("#priceID").val(price);
	$("#unitId").val(unit);
	if(unit=="RMB") {
		$("#rateId").val(rateRMB);
	} else {
		$("#rateId").val(rateUSD);
	}
	$("#addInsaleInfoDiv").window("open");
}

function check() {
	var mccMncId = $.trim($("#mccMncId").val());
	var numPattern = /^\d{5}$/;
	if(!numPattern.test($.trim(mccMncId))) {
		$.messager.alert('错误提示','请输入5位数字mccMnc!');
		return false;
	}
	
	var portID = $("#portID").val();
	if($.trim(portID).length==0) {
		$.messager.alert('错误提示','请输入端口号!'); 
		return false;
	}
	var cmdID = $("#cmdID").val();
	if($.trim(cmdID).length==0) {
		$.messager.alert('错误提示','请输入指令!'); 
		return false;
	}
	
	var pricePattern = /^[0-9]*$/;
	var priceID = $("#priceID").val();
	if(!pricePattern.test($.trim(priceID))) {
		$.messager.alert('错误提示','确认正确格式的价格!');
		return false;
	}
	var rateID = $("#rateID").val();
	if(!pricePattern.test($.trim(rateID))) {
		$.messager.alert('错误提示','确认正确格式的汇率!');
		return false;
	}
	return true;
}

function cleanForm() {
	$("#addInsaleInfoDiv").window("close");
	$("#infoID").val("");
	$("#mccMncId").val("");
	$("#portID").val("");
	$("#cmdID").val("");
	$("#priceID").val("");
	$("#unitId").val("");
	$("#rateId").val("");
	
}
</script>
</html>