<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>CP信息管理</div>
<div style="margin-left: 20px; margin-bottom: 56px;margin-right: 30px;margin-top: 10px;">
	<form action="" method="post" id="queryFormId">
		<table class="queryTable" style="padding:8px 30px;width: 75%;">
				<tr>
					<td width="80px">CP账号：</td>
					<td><input type="text" id="searchaccountId" name="account" value=""/></td>
					<td width="80px">CP名称：</td>
					<td><input type="text" id="searchnameID" name="name" value=""/></td>
					
				</tr>
				<tr>
					<td width="60px">状态：</td>
					<td>
					<select name="status" id="searcstatusId">
						<option value="">-全部-</option>
						<option value="0">正常</option>
						<option value="1">冻结</option>
					</select>
					</td>
					<td><input type="button" value="查  询" id="queryButton"/></td>
					<td><input type="button" value="添加CP" class="addRankButton"/></td>
					<td colspan="1"></td>
				</tr>
		</table>
	</form>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>


<div id="addCp" class="easyui-window" data-options="title:'创建CP',iconCls:'icon-save',closable:false" style="width:780px;min-height:660px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 <form action="" method="post" id="cpForm">
 	 	<input type="hidden" name="cpID" id="cpID" value=""/>
 	 		<table>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">类      型:&nbsp;</td>
 	 				<td>
 	 					<select name="cpType" id="cpTypeId" style="width:66%;">
 	 						<option value="公司">公司</option>
 	 						<option value="个人">个人</option>
 	 					</select>
 	 					&nbsp;&nbsp;<span style="color:red;">*</span>
 	 				</td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">名       称:&nbsp;</td> 
 	 				<td><input type="text" name="name" id="nameID" size="56px;" maxlength="150" value=""/>&nbsp;&nbsp;<span style="color:red;">*</span></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">账       号:&nbsp;</td>
 	 				<td><input type="text" name="account" id="accountID" size="56px;" maxlength="50" value="" 
 	 					style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/>&nbsp;&nbsp;<span style="color:red;">*</span></td>
 	 			</tr>
 	 			<tr style="line-height:30px;" id="trPas">
 	 				<td align="right">密       码:&nbsp;</td>
 	 				<td><input type="password" name="pw" id="pwID" size="56px;" maxlength="150" value=""/>&nbsp;&nbsp;<span style="color:red;">*</span></td>
 	 			</tr>
 	 			<tr style="line-height:30px;" id="trPasRe">
 	 				<td align="right">确认密码:&nbsp;</td>
 	 				<td><input type="password" name="repw" id="repwID" size="56px;" maxlength="150" value=""/>&nbsp;&nbsp;<span style="color:red;">*</span></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">货币类型:&nbsp;</td>
 	 				<td>
 	 					<select name="unit" id="unitId" style="width:66%;">
 	 						<option value="USD">USD</option>
 	 						<option value="RMB">RMB</option>
 	 					</select>
 	 					&nbsp;&nbsp;<span style="color:red;">*</span>
 	 				</td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">扣量比例:&nbsp;</td>
 	 				<td><input type="text" name="subSaleRate" id="subSaleRateID" size="56px;" maxlength="6" value="0.00"
 	 				 style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/>&nbsp;&nbsp;<span class="pMsg">请输入小于等于1的2位正浮点数,例如:0.10</span></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">联 系  人:&nbsp;</td><td><input type="text" name="contacts" id="contactsID" size="56px;" maxlength="150" value=""/></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">电      话:&nbsp;</td><td><input type="text" name="phone" id="phoneID" size="56px;" maxlength="60" value=""
 	 				 style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">邮      箱:&nbsp;</td><td><input type="text" name="email" id="emailID" size="56px;" maxlength="100" value=""
 	 				 style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">地     址:&nbsp;</td><td><input type="text" name="addr" id="addrID" size="56px;" maxlength="100" value=""/></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">状     态:&nbsp;</td>
 	 				<td>
 	 					<select name="status" id="statusId" style="width:66%;">
 	 						<option value="0">正常</option>
 	 						<option value="1">冻结</option>
 	 					</select>
 	 					&nbsp;&nbsp;<span style="color:red;">*</span>
 	 				</td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">备      注:&nbsp;</td>
 	 				<td>
 	 					<textarea rows="10" cols="50%" name="des" id="desID" ></textarea>
 	 					&nbsp;&nbsp;<span style="color:red;">*</span><span class="pMsg">请保持简介在200个字符以内</span>
 	 				</td>
 	 			</tr>
 	 		</table>
         	<br/><br/>
     </form>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addPc();">确定</a>  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="clean();">取消</a>  
     </div>
     
	</div>
</div>

<div id="resetPwDiv" class="easyui-window" data-options="title:'密码重置',iconCls:'icon-save',closable:false" style="width:300px;min-height:160px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<input type="hidden" id="newpscpID" value=""/>
 	 		<table>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">新密码:&nbsp;</td>
 	 				<td><input type="password" name="newPassword" id="newPaswdId" value="" maxlength="150"/></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">新密码确认:&nbsp;</td> 
 	 				<td><input type="password" name="renewPassword" id="renewPasswordId" maxlength="150" value=""/></td>
 	 			</tr>
 	 		</table>
         	<br/><br/>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="resetPw();">确定</a>  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="cleanPw();">取消</a>  
     </div>
	</div>
</div>
</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/proper.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#addCp').window('close');
	$("#resetPwDiv").window("close");
	 queryTable({name:$("#searchnameID").val(),account:$("#searchaccountId").val(),status:$("#searcstatusId").val()});
});
 $("#queryButton").click(function() {//点击查询 
	 queryTable({name:$("#searchnameID").val(),account:$("#searchaccountId").val(),status:$("#searcstatusId").val()});  
 });
$(".addRankButton").click(function(){
	$('#addCp').window('open');
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
        idField:'cpID',
        url:'../cp/cpList',
        fitColumns:true,
        columns:[[
			{field:'account',title:'CP账号',width:200},
			{field:'name',title:'CP名称',width:300},
            {field:'subSaleRate',title:'扣量比例', width:150},
            {field:'status',title:'CP状态',width:150,formatter:function(value,obj,index){
            	if(value=='1') {
            		return "冻结";
            	} else {
            		return "正常";
            	}
            }},
            {field:'ddate',width:250,title:'创建日期',formatter:function(value){
            	 var unixTimestamp = new Date(value);
                 return unixTimestamp.toLocaleString();
            }},
            {field:'opt',width:400,align:'center',title:'操  作',formatter:function(value,obj,index){
            	var e = '<a href="#" mce_href="#" onclick="updateCp(\''+ obj.cpID + '\')">修 改</a>&nbsp;&nbsp;';
            		e = e+'<a href="#" mce_href="#" onclick="resetPs(\''+ obj.cpID + '\')">密码重置</a>&nbsp;&nbsp;'; 
            		e = e+"<a href='#' mce_href='#' onclick=deleteCp('"+ index +"','"+obj.cpID+"')>删 除</a>";
                return e;
            }}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

//删除列
function deleteCp(index,cpID){
    $.messager.confirm('确认','确认删除?',function(row){
        if(row){
            $.ajax({
                url:'../cp/deleteCp?cpID='+cpID,
                success:function(){
                	showMessage('删除成功','删除成功!');
            		$('#tt').datagrid('deleteRow',index);
                }
            });
        }  
    });
  }
  
function addPc() {
	if(checkForm()) {
		$.ajax({
			url:'../cp/updateCp',
			type:'post',
			secureuri: false,
			dataType:'json',
			data:$("#cpForm").serialize(),
			success:function(data) {
				showMessage('操作成功','操作成功!');
				clean();
				queryTable({name:$("#searchnameID").val(),account:$("#searchaccountId").val(),status:$("#searcstatusId").val()});
			},
			error:function(response,data){
				$.messager.alert('错误提示',"ajax请求发生错误!");
			} 
		});
	}
}
function resetPs(cpID) {
	$("#newpscpID").val(cpID);
	$("#resetPwDiv").window("open");
}
function resetPw() {
	var newPaswdId = $("#newPaswdId").val();
	if($.trim(newPaswdId).length==0) {
		$.messager.alert('错误提示','请输入新密码!'); 
		return false;
	}
	var renewPasswordId = $("#renewPasswordId").val();
	if($.trim(newPaswdId) != $.trim(renewPasswordId)) {
		$.messager.alert('错误提示','新密码确认输入不正确!');
		return false;
	}
	$.ajax({
		url:'../cp/resetCpPaswd?cpID='+$("#newpscpID").val()+"&password="+newPaswdId,
		type:'get',
		secureuri: false,
		dataType:'json',
		success:function(data) {
			$.messager.alert('成功提示','密码重置成功!');
			cleanPw();
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		} 
	});
}
function updateCp(cpID) {
	$.ajax({
		url:'../cp/cpDetail?cpID='+cpID,
		type:'get',
		secureuri: false,
		dataType:'json',
		success:function(data) {
			var cp = data.cp;
			$("#cpID").val(cp.cpID);
			$("#cpTypeId").val(cp.cpType);
			$("#cpTypeId").attr("disabled","disabled");
			$("#nameID").val(cp.name);
			$("#trPas").css("display","none");
			$("#trPasRe").css("display","none");
			$("#accountID").val(cp.account);
			$("#accountID").attr("disabled","disabled");
			$("#unitId").val(cp.unit);
			$("#subSaleRateID").val(cp.subSaleRate);
			$("#contactsID").val(cp.contacts); 
			$("#phoneID").val(cp.phone);
			$("#emailID").val(cp.email);
			$("#addrID").val(cp.addr);
			$("#statusId").val(cp.status);
			$("#desID").text(cp.des);
			$('#addCp').window('open');
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		} 
	});
}

function checkForm() {
	var cpID = $.trim($("#cpID").val());
	var nameID = $("#nameID").val();
	if($.trim(nameID).length==0) {
		$.messager.alert('错误提示','请输入公司名称!'); 
		return false;
	}
	var accountID = $("#accountID").val();
	if(cpID.length==0 && $.trim(accountID).length==0) {
		$.messager.alert('错误提示','请输入公司账号!'); 
		return false;
	}
	var pwID = $("#pwID").val();
	if(cpID.length==0 && $.trim(pwID).length==0) {
		$.messager.alert('错误提示','请输入公司密码!'); 
		return false;
	}
	var repwID = $("#repwID").val();
	if(cpID.length==0 && $.trim(pwID)!=$.trim(repwID)) {
		$.messager.alert('错误提示','确认密码不正确!'); 
		return false;
	}
	var subSaleRateID = $("#subSaleRateID").val();
	var pattern=/^0\.\d{2}$/;       
	if($.trim(subSaleRateID).length>0 && $.trim(subSaleRateID)!='1' && $.trim(subSaleRateID)!='1.0' 
			&& $.trim(subSaleRateID)!='1.00' && !pattern.exec($.trim(subSaleRateID))) {
		$.messager.alert('错误提示','请输入小于等于1并且小数点后两位的非负小数!'); 
	    return false;
	}
	var desID = $("#desID").val();
	if($.trim(desID).length==0) {
		$.messager.alert('错误提示','请输入公司简介!'); 
		return false;
	}
	if($.trim(desID).length>200) {
		$.messager.alert('错误提示','请保持简介在200个字符以内!'); 
		return false;
	}
	return true;
}

function clean() {
	$("#cpID").val("");
	$("#desID").text("");
	$("#cpTypeId").attr("disabled",false);
	$("#accountID").attr("disabled",false);
	$("#trPas").css("display","");
	$("#trPasRe").css("display","");
	$("#cpForm")[0].reset();
	$("#addCp").window('close');
}
function cleanPw(){
	$("#newPaswdId").val("");
	$("#renewPasswordId").val("");
	$("#newpscpID").val("");
	$("#resetPwDiv").window("close");
}
</script>
</html>