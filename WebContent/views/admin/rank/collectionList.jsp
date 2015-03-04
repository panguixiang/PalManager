<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>
&nbsp;<span class="clickA brCick" id="NOLIST">主页</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>专 题 列 表</td>
				<td colspan="8"></td>
				<td align="right">
				<input type="button" value="添加" class="addRankButton"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="保 存" class="saveUpdaSovtClass"/>
				</td>
				<td></td>
			</tr>
	</table>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true" style="word-break:break-all;"></table>
	</div>
</div>

<div id="addCollectionDiv" class="easyui-window" data-options="title:'添 加 专 题',iconCls:'icon-save',closable:false" style="width:560px;height:600px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 <form action="" method="post" id="FORMCollection">
 	 	<input type="hidden" name="colID" id="colID" value=""/>
 	 	<input type="hidden" name="iconId" id="iconId" value=""/>
 	 		<table>
 	 			<tr style="line-height:20px;">
 	 				<td>专题名称:&nbsp;</td><td><input type="text" name="name" id="nameID" size="56px;" maxlength="150"/></td>
 	 			</tr>
 	 			<tr style="line-height:20px;">
 	 				<td>宣传图片:&nbsp;</td>
 	 				<td>
	 	 				<div class="div1">&nbsp;
							<img src="../images/addPic.jpg" id="imgshow0" class="div2"/>
							<input id="imgId0" type="file" name="imgId0" class="inputstyle zidongClass" 
								onchange="zidongMehtohd('iconId','','','imgId0','','');"/>
						</div>
 	 				</td>
 	 			</tr>
 	 			<tr style="line-height:120px;">
 	 				<td colspan="2">
 	 					<span id="spanCate1"></span>&nbsp;&nbsp;&nbsp;
 	 					<span id="2CateId">产品类型:&nbsp;</span><span id="spanCate2"></span>
 	 				</td>
 	 			</tr>
 	 			<tr style="line-height:20px;">
 	 				<td>专题描述:&nbsp;</td>
 	 				<td>
 	 					<textarea rows="10" cols="50" name="des" id="desId"></textarea>
 	 				</td>
 	 			</tr>
 	 		</table>
         	<br/><br/>
     </form>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addCollection();">确定</a>  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="clean();">取消</a>  
     </div>
     
	</div>
</div>
</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../uploadify/jquery.uploadify.min.js"></script>
<link href="../uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="../js/uploadSource.js"></script>
<script type="text/javascript" src="../js/proper.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#addCollectionDiv').window('close'); 
	 //构造一级类别select begin 
	createCate1Select({title:'一级类型',seleName:'cate1gory',seleId:'cate1Id',optionSeled:'',divId:'spanCate1'});
	queryTable();
});

$("#cate1Id").live('click',function(){
	$("#spanCate2").empty();
	var arry  = categoryDictJSON[$("#cate1Id").val()]['category2'];
	selectObj2(arry,'spanCate2','','cate2gory','cate2goryId','kong');
});

$(".addRankButton").click(function(){
	$('#addCollectionDiv').window('open'); 
});

$(".saveUpdaSovtClass").click(function(){
	var strs = "";
	var rows = $('#tt').datagrid('getRows');
	for(var i=0; i<rows.length; i++){
		strs+=(rows[i].colID+" ,"+$("#sortV"+rows[i].colID).val()+"|");
	}
	if($.trim(strs).length==0) {
		return;
	}
	$.ajax({
		url:'../rank/updateSortV?tableName=collection&key=colID&ids='+strs,
		type:'get',
		secureuri: false,
		dataType:'json',
		success:function(data) {
			showMessage('操作成功','操作成功!');
			clean();
			queryTable();
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		} 
	});
});
function queryTable () {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: "", 
        singleSelect:false,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'colID',
        url:'../rank/collectionList',
        fitColumns:true,
        rownumbers:true,
        nowrap:false,
        columns:[[
			{field: 'name',title:'专题名称',width:150,formatter:function(value,obj,index){
				return "<a href='../rank/initCollectItemList?colID="+obj.colID+"'>"+value+"</a>";
			}},
            {field:'iconID',title:'图标', width:250,formatter:function(value,obj,index){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=80px height=40px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'des',title:'专题描述',width:250},
            {field:'sortV',title:'专题排名', width:150,formatter:function(value,obj,index){
            	var selecSort = "<select name='sortV' id='sortV"+obj.colID+"'>"; 
            	for(var i=1;i<=20;i++) {
            		if(value == i) {
            			selecSort+="<option value='"+i+"' selected='selected'>"+i+"</option>";
            		} else {
            			selecSort+="<option value='"+i+"'>"+i+"</option>";
            		}
            	}
            	if(value==100) {
            		selecSort+="<option value='100' selected='selected'>100</option>";
            	} else {
            		selecSort+="<option value='100'>100</option>";
            	}
            	selecSort+="</select>";
            	return selecSort;
            }},
            {field:'opt',width:200,align:'center',title:'操  作',rowspan:2,formatter:function(value,obj,index){
            	 var e = '<a href="#" onclick="updateColl(\''+ obj.colID + '\')">编 辑</a>&nbsp;&nbsp;';
            		e = e+'<a href="#" mce_href="#" onclick="deleteColl(\''+index+ '\')">删 除</a>';
                return e;
            }}  
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

function updateColl(colId) {
	$.ajax({
		url:'../rank/initUpdateCollection?colId='+colId,
		type:'get',
		dataType:'json',
		success:function(data) {
			$("#colID").val(data.colID);
			$("#iconId").val(data.iconID);
			$("#imgshow0").attr("src",staticUrl+data.iconID);
			$("#nameID").val(data.name);
			$("#desId").text(data.des);
			$("#cate1Id").empty(); 
			createCate1Select({title:'一级类型',seleName:'cate1gory',seleId:'cate1Id',optionSeled:data.category1,divId:'spanCate1'});
			$("#spanCate2").empty();
			var arry  = categoryDictJSON[$("#cate1Id").val()]['category2'];
			selectObj2(arry,'spanCate2',data.category2,'cate2gory','cate2goryId','kong');
			$('#addCollectionDiv').window('open'); 
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		}
	});
}

function addCollection() {
	var nameIDHOME = $("#nameID").val();
	var iconId = $("#iconId").val();
	var cate1Id = $("#cate1Id").val();
	if($.trim(nameIDHOME).length==0) {
		$.messager.alert('错误提示',"请输入专题名称!"); 
		return;
	}
	if($.trim(iconId).length==0) {
		$.messager.alert('错误提示',"请上传专题宣传图片!"); 
		return;
	}
	if($.trim(cate1Id).length==0) {
		$.messager.alert('错误提示',"请选择一级类型!"); 
		return;
	}
	$.ajax({
		url:'../rank/addCollection',
		type:'post',
		data:$("#FORMCollection").serialize(),
		secureuri: false,
		dataType:'json',
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
function deleteColl(index) {
    $.messager.confirm('确认','确认删除?',function(row){
        if(row){
            var selectedRow = $('#tt').datagrid('getSelected');//获取选中行 
            $.ajax({
                url:'../rank/deleteColl?colID='+selectedRow.colID,
                success:function(){
                	showMessage('删除成功','删除成功!');
            		$('#tt').datagrid('deleteRow',index);
                }
            });
        }  
    });
}
function clean() {
	$('#addCollectionDiv').window('close'); 
	$("#colID").val("");
	$("#nameID").val("");
	$("#iconId").val("");
	$("#imgshow0").attr("src","../images/addPic.jpg");
	$("#desId").text(""); 
}
</script>
<script type="text/javascript" src="../daterangepicker/datepicker/js/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript" src="../daterangepicker/datepicker/js/daterangepicker.jQuery.js"></script>
<link rel="stylesheet" href="../daterangepicker/css/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="../daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
</html>
<style>
<!--
.div1{ 
float: left;
height: 175px;
width: 382px;
position:relative;
}
.div2{
text-align:center;
font-size:15px;
font-weight:800;
height: 170px;
width: 378px;
}
.inputstyle{
    width: 382px; 
    height: 170px;
    cursor: pointer;
    position: absolute;
    filter:alpha(opacity=0);
    -moz-opacity:0;
    opacity:0; 
    left:0px;
    top: 0px;
}
</style>