<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>广告管理</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">

<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 60%;">
	<tr>
	<td colspan="4"><h2>广告 列 表</h2></td>
	</tr>
  <tr style="line-height: 100px;">
    <td width="120px" rowspan="3">广告宣传图片：</td>
    <td colspan="3"> 
    	<input type="hidden" id="adJson0" value="" /> 
    	<div class="divbanner1">
			<img src="../images/addBanner.jpg" class="divbannerimg1" id="imgadJson0"/>
			<input type="file" name="adJson0" id="fileadJson0" class="inputbannerimg1 zidongClass"
			 onchange="zidongMehtohd('adJson0','','','fileadJson0','','');"/>
		</div>
    </td>
  </tr>
   <tr>
     <td colspan="4" width="90"><input type="text" id="argsadJson0" name="args" size="80px" readOnly="true" style="background: #F5F5F5;"/></td>
  </tr>
  <tr>
     <td colspan="3"><input type="button" value="内  链" size="5" onclick="openDiv('addInner','adJson0');"/>&nbsp;&nbsp;
		<input type="button" value="外  链" size="5" onclick="openDiv('addOut','adJson0');"/>&nbsp;&nbsp;
	 	<input type="button" value="删  除" size="5" onclick="deleteAdJson('adJson0');"/>
	 </td>
  </tr>
  
  <tr>
    <td rowspan="3">广告宣传图片：</td>
    <td colspan="3">
    	<input type="hidden" id="adJson1" value="" />
    	<div class="divbanner1">
			<img src="../images/addBanner.jpg" class="divbannerimg1" id="imgadJson1"/>
			<input type="file" name="adJson1" id="fileadJson1" class="inputbannerimg1 zidongClass"
			 onchange="zidongMehtohd('adJson1','','','fileadJson1','','');"/>
		</div>
    </td>
  </tr>
   <tr>
     <td colspan="4"><input type="text" id="argsadJson1" name="args" size="80px" readOnly="true" style="background: #F5F5F5;"/></td>
  </tr>
  <tr>
      <td colspan="3"><input type="button" value="内  链" size="5" onclick="openDiv('addInner','adJson1');"/>&nbsp;&nbsp;
		<input type="button" value="外  链" size="5"  onclick="openDiv('addOut','adJson1');"/>&nbsp;&nbsp;
	 	<input type="button" value="删  除" size="5" onclick="deleteAdJson('adJson1');"/>
	 </td>
  </tr>
  
  <tr>
    <td rowspan="3">广告宣传图片：</td>
    <td colspan="3">
    	<input type="hidden" id="adJson2" value="" />
    	<div class="divbanner1">
			<img src="../images/addBanner.jpg" class="divbannerimg1" id="imgadJson2"/>
			<input type="file" name="adJson2" id="fileadJson2" class="inputbannerimg1 zidongClass"
			 onchange="zidongMehtohd('adJson2','','','fileadJson2','','');"/>
		</div>
    </td>
  </tr>
   <tr>
     <td colspan="4"><input type="text" id="argsadJson2" name="args" size="80px" readOnly="true" style="background: #F5F5F5;"/></td>
  </tr>
  <tr>
     <td colspan="3"><input type="button" value="内  链" size="5" onclick="openDiv('addInner','adJson2');"/>&nbsp;&nbsp;
		<input type="button" value="外  链" size="5"  onclick="openDiv('addOut','adJson2');"/>&nbsp;&nbsp;
	 	<input type="button" value="删  除" size="5" onclick="deleteAdJson('adJson2');"/>
	 </td>
  </tr>
  
  <tr>
    <td rowspan="3">广告宣传图片：</td>
    <td colspan="3">
    	<input type="hidden" id="adJson3" value="" />
    	<div class="divbanner1">
			<img src="../images/addBanner.jpg" class="divbannerimg1" id="imgadJson3"/>
			<input type="file" name="adJson3" id="fileadJson3" class="inputbannerimg1 zidongClass"
			 onchange="zidongMehtohd('adJson3','','','fileadJson3','','');"/>
		</div>
    </td>
  </tr> 
   <tr>
     <td colspan="4"><input type="text" id="argsadJson3" name="args" size="80px" readOnly="true" style="background: #F5F5F5;"/></td>
  </tr>
  <tr>
  	 <td colspan="3"><input type="button" value="内  链" size="5" onclick="openDiv('addInner','adJson3');"/>&nbsp;&nbsp;
		<input type="button" value="外  链" size="5"  onclick="openDiv('addOut','adJson3');"/>&nbsp;&nbsp;
	 	<input type="button" value="删  除" size="5" onclick="deleteAdJson('adJson3');"/>
	 </td>
  </tr>
  
  <tr>
    <td rowspan="3">广告宣传图片：</td>
    <td colspan="3">
    	<input type="hidden" id="adJson4" value="" />
    	<div class="divbanner1">
			<img src="../images/addBanner.jpg" class="divbannerimg1" id="imgadJson4"/>
			<input type="file" name="adJson4" id="fileadJson4" class="inputbannerimg1 zidongClass"
			 onchange="zidongMehtohd('adJson4','','','fileadJson4','','');"/>
		</div>
    </td>
  </tr>
   <tr>
     <td colspan="4"><input type="text" id="argsadJson4" name="args" size="80px" readOnly="true" style="background: #F5F5F5;"/></td>
  </tr>
  <tr>
      <td colspan="3"><input type="button" value="内  链" size="5" onclick="openDiv('addInner','adJson4');"/>&nbsp;&nbsp;
		<input type="button" value="外  链" size="5" onclick="openDiv('addOut','adJson4');"/>&nbsp;&nbsp;
	 	<input type="button" value="删  除" size="5" onclick="deleteAdJson('adJson4');"/>
	 </td>
  </tr>
</table>
</div>
<br/>
<br/>
<br/>
<br/>
<input type="hidden" name="addJsonField" id="addJsonFieldId" value="" />
<div id="addInner" class="easyui-window" data-options="title:'广告内链',iconCls:'icon-save',closable:false" style="width:450px;min-height:400px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<div>
 	 		<font size="3px">产品ID/名称：</font>&nbsp;<input type='text' id="itemNameId" value="" maxlength="150" />&nbsp;&nbsp;<input type="button" value="搜 索" id="checkSeachId"/>
 	 	</div></br>
         <div class="easyui-layout" >
			<table id="tt" pagination="false"></table>
		</div>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateAdJson('addInner');">确定</a>  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="closeDiv('addInner');">取消</a>  
     </div>
	</div>
</div>

<div id="addOut" class="easyui-window" data-options="title:'广告外链',iconCls:'icon-save',closable:false" style="width:600px;min-height:150px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<div>
 	 		<font size="3px">输入网址：</font>&nbsp;<input type='text' id="urlId" value="" maxlength="250" size="70px"/>&nbsp;&nbsp;
 	 	</div></br>
         <div class="easyui-layout" >
			<table id="tt" pagination="false"></table>
		</div>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateAdJson('addOut');">确定</a>
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="closeDiv('addOut');">取消</a>  
     </div>
	</div>
</div>

</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="../js/uploadSource.js"></script>
<script type="text/javascript" src="../uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#addInner').window('close');
	$('#addOut').window('close');
	var arr = new Array();
	arr[0] = '${rank.adJson0}';
	arr[1] = '${rank.adJson1}';
	arr[2] = '${rank.adJson2}';
	arr[3] = '${rank.adJson3}';
	arr[4] = '${rank.adJson4}';
	$.each(arr,function(index,json){
		if(json.length>5) {
			json = eval("("+json+")");
			$("#adJson"+index).val(json.imgID);
			$("#imgadJson"+index).attr("src",staticUrl+json.imgID);
			$("#argsadJson"+index).val(json.args);
		}
	});
});

$("#checkSeachId").click(function(){
	var itemName = $("#itemNameId").val();
	if($.trim(itemName).length==0) {
		$.messager.alert('错误提示',"请输入产品ID或名称");
		return false;
	} 
	queryTableHome({name:itemName});
});

function queryTableHome(params) {
	$('#tt').datagrid({
		width: 400,
		height:300,
    	queryParams: params,
        singleSelect:true,
        loadMsg: "数据加载中，请稍后...",
        idField:'itemID',
        url:'../rank/searchFeItemList',
        columns:[[
            {field:'iconID',title:'图标', width:150,formatter:function(value,obj,index){
            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
            }},
            {field:'itemID',title:'产品ID',width:200,align:'center'},
            {field:'name',title:'产品名称',width:200,align:'center'}
           ]]
        });
}

function updateAdJson(div) {
	var jsonStr;
	var imgUrl = $("#"+$("#addJsonFieldId").val()).val();
	var args="";
	if(imgUrl.length==0) {
		$.messager.alert('错误提示',"请上传广告图片!");
		return;
	}
	if(div=="addInner") {
		var obj = $("#tt").datagrid("getSelected");
		args = obj.itemID;
		jsonStr = "{\"imgID\":\""+imgUrl+"\",\"isIner\":\"T\",\"args\":\""+args+"\"}";
	} else {
		args = $("#urlId").val();
		jsonStr = "{\"imgID\":\""+imgUrl+"\",\"isIner\":\"F\",\"args\":\""+args+"\"}";
	}
	if(args.length==0) {
		return;
	}
	$.ajax({
		url:'../rank/updateAdJson',
		type:'get',
		dataType:'json',
		data:{rankID:'${rank.rankID}',adJsonStr:jsonStr,field:$("#addJsonFieldId").val()},
		success:function(data) {
				$("#args"+$("#addJsonFieldId").val()).val(args);
				closeDiv(div);
				showMessage('操作成功','操作成功!');
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		}
	});
}

function deleteAdJson(div) {
	$.ajax({
		url:'../rank/updateAdJson',
		type:'get',
		dataType:'json',
		data:{rankID:'${rank.rankID}',adJsonStr:"{}",field:div},
		success:function(data) {
				$("#args"+div).val("");
				$("#img"+div).attr("src","../images/addBanner.jpg");
				closeDiv(div);
				showMessage('删除成功','操作成功!');
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		}
	});
}

function closeDiv(div) {
	$('#'+div).window('close');
}

function openDiv(divID, jsonId) {
	$('#'+divID).window('open');
	$("#addJsonFieldId").val(jsonId);
}
</script>
<style>
<!--
.divbanner1{
float: left;
height: 150px;
width: 530px;
position:relative;
}
.divbannerimg1{
text-align:center;
font-size:15px;
font-weight:800;
height: 140px;
width: 528px;
}
.inputbannerimg1{
    width: 528px; 
    height: 150px;
    cursor: pointer;
    position: absolute;
    filter:alpha(opacity=0);
    -moz-opacity:0;
    opacity:0; 
    left:0px;
    top: 0px;
}

-->
</style>
</html>