<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>
<span class="noCick brCick clickA" id="HOME">用户管理</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>用户列表</td>
				<td align="right"><input type="button" value="新增用户" id="addManagerDIv"/></td>
			</tr>
	</table>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>

<div id="addManager" class="easyui-window" data-options="title:'管理用户',iconCls:'icon-save',closable:false" style="width:700px;min-height:560px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 <form action="" method="post" id="managerForm">
 	 	<input type="hidden" name="managerID" id="managerID" value=""/>
 	 		<table>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">登录名:&nbsp;</td> 
 	 				<td><input type="text" name="account" id="accountID" size="56px;" maxlength="150" value=""
 	 				  style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/>&nbsp;&nbsp;<span style="color:red;">*</span></td>
 	 			</tr>
 	 			<tr style="line-height:30px;">
 	 				<td align="right">姓名:&nbsp;</td>
 	 				<td><input type="text" name="name" id="nameID" size="56px;" maxlength="50" value="" 
 	 					/>&nbsp;&nbsp;<span style="color:red;">*</span></td>
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
 	 				<td align="right">用户类别:&nbsp;</td>
 	 				<td>
 	 					<select name="role" id="roleId" style="width:66%;">
 	 						<option value="super">超级管理员</option>
 	 						<option value="operater">运营管理员</option>
 	 						<option value="tester">测试管理员</option>
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
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addManager();">确定</a>  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="clean();">取消</a>  
     </div>
     
	</div>
</div>


<div id="resetPwDiv" class="easyui-window" data-options="title:'密码重置',iconCls:'icon-save',closable:false" style="width:300px;min-height:160px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<input type="hidden" id="ReMangeID" value=""/>
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
<script type="text/javascript">
$(document).ready(function(){
	$("#addManager").window('close');
	$("#resetPwDiv").window('close');
	queryTable();
});

function queryTable() {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: '',
        singleSelect:true,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'managerID',
        url:'../manager/managerList',
        fitColumns:true,
        columns:[[
			{field:'account',title:'登录名',width:300},
			{field:'name',title:'姓 名', width:350},
			{field:'role',title:'用户类别', width:200,formatter:function(value,obj,index){
				if(value=="super") {
					return "超级管理员";
				}
				else if(value=="operater") {
					return "运营管理员";
				} else {
					return "测试管理员";
				}
			}},
			{field:'ddate',title:'创建时间', width:250,formatter:function(value,obj,index){
				 var unixTimestamp = new Date(value);
                 return unixTimestamp.toLocaleString();
			}},//
            {field:'opt',title:'操  作',align:'center', width:200,formatter:function(value,obj,index){
           	 var e = "<a href='#' mce_href='#' onclick=updateMang('"+obj.managerID+"','"+obj.account+"','"+obj.name+"','"+obj.role+"','"+obj.des+"')>修 改</a>&nbsp;&nbsp;";
        		e = e+"<a href='#' mce_href='#' onclick=resetPs('"+ obj.managerID +"')>密码重置</a>&nbsp;&nbsp;";
        		e = e+"<a href='#' mce_href='#' onclick=deleteMan('"+index+"','"+obj.managerID+"')>删 除</a>";
          	    return e;
            }}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

$("#addManagerDIv").click(function(){
	$("#trPas").css("display","");
	$("#trPasRe").css("display","");
	$("#accountID").attr("disabled",false);
	$("#addManager").window('open');
});

function addManager() {
	if(checkAdd()) {
		$.ajax({
			url:'../manager/addManager',
			type:'post',
			secureuri: false,
			dataType:'json',
			data:$("#managerForm").serialize(),
			success:function(data) {
				showMessage('操作成功','操作成功!');
				clean();
				queryTable();
			},
			error:function(response,data){
				$.messager.alert('错误提示',"ajax请求发生错误!");
			} 
		});
	}
}
function clean() {
	$("#addManager").window('close');
	$("#managerID").val("");
	$("#desID").text("");
	$("#managerForm")[0].reset();
}

function checkAdd() {
	var accountID = $("#accountID").val();
	if($.trim(accountID).length==0) {
		$.messager.alert('错误提示','请输入登录账号!'); 
		return false;
	}
	var nameID = $("#nameID").val();
	if($.trim(nameID).length==0) {
		$.messager.alert('错误提示','请输入姓名!'); 
		return false;
	}
	var pwID = $("#pwID").val();
	if($.trim($("#managerID").val()).length==0 && $.trim(pwID).length==0) {
		$.messager.alert('错误提示','请输入登录密码!'); 
		return false;
	}
	
	var repwID = $("#repwID").val();
	if($.trim($("#managerID").val()).length==0 && $.trim(repwID)!=$.trim(pwID)) {
		$.messager.alert('错误提示','确认密码不正确!'); 
		return false;
	}
	var desID = $("#desID").val();
	if($.trim(desID).length==0) {
		$.messager.alert('错误提示','请输入个人备注!'); 
		return false;
	}
	if($.trim(desID).length>200) {
		$.messager.alert('错误提示','备注请保持简介在200个字符以内!'); 
		return false;
	}
	return true;
}

function deleteMan(index,managerID) {
    $.messager.confirm('确认','确认删除?',function(row){
        if(row){
            $.ajax({
                url:'../manager/deleteManager?managerID='+managerID,
                success:function(){
                	showMessage('删除成功','删除成功!');
            		$('#tt').datagrid('deleteRow',index);
                }
            });
        }  
    });
}

function updateMang(managerID,account,name,role,des) {
	$("#managerID").val(managerID);
	$("#accountID").val(account);
	$("#nameID").val(name);
	$("#roleId").val(role);
	$("#desID").text(des);
	$("#accountID").attr("disabled","disabled");
	$("#trPas").css("display","none");
	$("#trPasRe").css("display","none");
	$("#addManager").window('open');
}

function resetPs(managerID) {
	$("#ReMangeID").val(managerID);
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
		url:'../manager/resetPaswd?managerID='+$("#ReMangeID").val()+"&password="+newPaswdId,
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

function cleanPw(){
	$("#ReMangeID").val("");
	$("#newPaswdId").val("");
	$("#renewPasswordId").val("");
	$("#resetPwDiv").window("close");
}
</script>
</html>