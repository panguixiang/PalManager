<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>
<span class="noCick brCick clickA" id="HOME">主页</span>&nbsp;&nbsp;&nbsp;
<span class="noCick brCick" id="RANK">排名</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<form action="" method="post" id="queryFormId">
<input type="hidden" name="status" value="NOLIST" id="statusId"/>
<input type="hidden" name="versionCateGory" value="" id="versionCateGoryId"/>
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>榜 单 列 表</td>
				<td colspan="8"></td>
				<td align="right">
				<input type="button" value="添加榜单" class="addRankButton"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="保 存" class="saveUpdaSovtClass"/>
				</td>
				<td></td>
			</tr>
	</table>
</form>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>

<div id="addRANK" class="easyui-window" data-options="title:'添 加 榜 单',iconCls:'icon-save',closable:false" style="width:350px;height:300px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
         	<form action="" method="post" id="FORMRANK">
         		<input type="hidden" name="rankID" value="" id="rankID"/> 
         		<input type="hidden" name="type" id="typeId" value="HOME"/>
 	 			榜单名称:&nbsp;<input type="text" name="name" id="nameID" size="20px;" /><br/><br/>
         		<span id="cate1SelectSpan"></span>&nbsp;&nbsp;产品类型:&nbsp;<span id="cate2SelectSpan">z</span><br/><br/>
         		<div id="ruleDiv" style="display:none;">
         			排名参数:
	         		<select name="rule" id="ruleID" disabled="disabled">
		         		<option value='DOWNLOAD'>下载量</option>
		         		<option value='LIST_TIME'>上架时间</option> 
		         		<option value='STAR_USER'>评星用户数</option>
		         		<option value='STAR_COUNT'>评星总数</option>
	         		</select>
         		</div>
 	 	</form>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addRank();">确定</a>  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="closeRank();">取消</a>  
     </div>
	</div>
</div>

</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/proper.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#addRANK').window('close');
	queryTableHome({rankType:$(".clickA").attr("id")});
	createCate1Select({title:"一级类型:",seleName:"category1",seleId:"category1Id",optionSeled:"",divId:"cate1SelectSpan"});
	selectObj2(categoryDictJSON[$("#category1Id").val()]["category2"],"cate2SelectSpan","","category2","category2Id","kong");
});
 $(".noCick").click(function() {//却换面包屑 
	 $(".noCick").removeClass("clickA");
	 $(this).addClass("clickA");
	 $("#tt").empty();
	 if($(this).attr("id")=="HOME") {
		 $("#ruleDiv").css("display","none");
		 $("#ruleID").attr("disabled","disabled");
		 queryTableHome({rankType:'HOME'}); 
	 } else {
		 $("#ruleID").attr("disabled",false);
		 $("#ruleDiv").css("display","");
		 queryTableNoHome({rankType:'RANK'});
	 }
 });

 $("#category1Id").live('click',function(){//级联关键字 
	 selectObj2(categoryDictJSON[$("#category1Id").val()]["category2"],"cate2SelectSpan","","category2","category2Id","kong");
 });
 
$(".addRankButton").click(function(){
	$("#category1Id").attr("disabled",false);  
	$("#category2Id").attr("disabled",false);
	$("#addRANK").window('open');
	$("#typeId").val($(".clickA").attr("id"));
});

$(".saveUpdaSovtClass").click(function(){
	var strs = "";
	var rows = $('#tt').datagrid('getRows');
	for(var i=0; i<rows.length; i++){
		strs+=(rows[i].rankID+" ,"+$("#sortV"+rows[i].rankID).val()+"|");
	}
	if($.trim(strs).length==0) {
		return;
	}
	$.ajax({
		url:'../rank/updateSortV?tableName=rank&key=rankID&ids='+strs,
		type:'get',
		secureuri: false,
		dataType:'json',
		success:function(data) {
			showMessage('操作成功','操作成功!');
			queryTable();
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		} 
	});
});

function queryTableHome(params) {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: params,
        singleSelect:true,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'rankID',
        url:'../rank/rankList?'+params, 
        fitColumns:true,
        columns:[[
			{field:'rankID',title:'榜单名称', width:150,formatter:function(value,obj,index){
				if(value=='100') {
					return "<a href='../rank/featureList'>"+obj.name+"</a>"; 
				}
				if(value=='101') {
					return "<a href='../body/initPage?viewUrl=admin/rank/collectionList'>"+obj.name+"</a>";
				} else {
					return "<a href='../rank/initRankItem?rankID="+obj.rankID+"&view=admin/rank/rankHomeList'>"+obj.name+"</a>";
				}
			 }},
            {field:'sortV',title:'排 名', width:150,formatter:function(value,obj,index){
            	var selecSort = "<select name='sortVSel' id='sortV"+obj.rankID+"'>";
            	for(var i=1;i<=20;i++) {
            		if(value == i) {
            			selecSort+="<option value='"+i+"' selected='selected'>"+i+"</option>";
            		} else {
            			selecSort+="<option value='"+i+"'>"+i+"</option>";
            		}
            	}
            	if(value == 100) {
            		selecSort +="<option value='100' selected='selected'>100</option>";
            	} else {
            		selecSort +="<option value='100'>100</option>";
            	}
            	selecSort+="</select>";
            	return selecSort;
            }},
            {field:'opt',width:200,align:'center',title:'操 作',rowspan:2,formatter:function(value,obj,index){
            	var e = "";
            	if(obj.rankID != '100' && obj.rankID != '101') {
            		e = "<a href='#' onclick=update('"+obj.rankID+"','"+obj.name+"','"+obj.category1+"','"+obj.category2+"','"+obj.rule+"');>编 辑</a>&nbsp;&nbsp;";
            		e = e+"<a href='#' mce_href='#' onclick=deleteRank('"+ index +"','"+obj.rankID+"')>删除</a>";
            	}
                return e;
            }}  
           ]]
        });
	$('#tt').datagrid("clearSelections");
}

function queryTableNoHome(params) {
	$('#tt').datagrid({
        width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
    	queryParams: params,
        singleSelect:true,
        pageSize: 25,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [25,35,45,65,100],
        idField:'rankID',
        url:'../rank/rankList?'+params, 
        fitColumns:true,
        columns:[[
			{field:'name',title:'榜单名称', width:50,formatter:function(value,obj,index){
				return "<a href='../rank/initRankItem?rankID="+obj.rankID+"&view=admin/rank/rankNoHomeList'>"+obj.name+"</a>"; 
			 }},
			 {field:'rule',title:'排名参数', width:50,formatter:function(value,obj,index){
				 	if(obj.rule=="DOWNLOAD") {
				 		return "下载量"; 
				 	}
				 	if(obj.rule=="LIST_TIME") {
				 		return "上架时间";
				 	}
				 	if(obj.rule=="STAR_USER") {
				 		return "评星用户数";
				 	}
				 	if(obj.rule=="STAR_COUNT") {
				 		return "评星总数";
				 	}
			 }},
            {field:'sortV',title:'排 名', width:50,formatter:function(value,obj,index){
            	var selecSort = "<select name='sortVSel' id='sortV"+obj.rankID+"'>";
            	for(var i=1;i<=20;i++) {
            		if(value == i) {
            			selecSort+="<option value='"+i+"' selected='selected'>"+i+"</option>";
            		} else {
            			selecSort+="<option value='"+i+"'>"+i+"</option>";
            		}
            	}
            	if(value == 100) {
            		selecSort +="<option value='60' selected='selected'>100</option>";
            	} else {
            		selecSort +="<option value='60'>100</option>";
            	}
            	selecSort+="</select>";
            	return selecSort;
            }},
            {field:'opt',width:150,align:'center',title:'操 作',formatter:function(value,obj,index){
            	var e = "";
            	e = "<a href='#' onclick=update('"+obj.rankID+"','"+obj.name+"','"+obj.category1+"','"+obj.category2+"','"+obj.rule+"');>编 辑</a>&nbsp;&nbsp;";
            	e = e+"<a href='#' mce_href='#' onclick=deleteRank('"+ index +"','"+obj.rankID+"')>删除</a>";
                return e;
            }}  
           ]]
        });
	$('#tt').datagrid("clearSelections");
}
function deleteRank(index,rankID) {
	var type = "";
	if($(".clickA").attr("id") == "HOME") {
		type = "HOME";
	}
    $.messager.confirm('确认','确认删除?',function(row){
        if(row){
            $.ajax({
                url:'../rank/deleteRank?rankID='+rankID+'&type='+type,
                success:function(){
                	showMessage('删除成功','删除成功!');
            		$('#tt').datagrid('deleteRow',index);
                }
            });
        }  
    });
}

function update(rankID, name, category1, category2, rule) {
	$("#rankID").val(rankID);
	$("#typeId").val($(".clickA").attr("id"));
	$("#nameID").val(name);
	createCate1Select({title:"一级类型:",seleName:"category1",seleId:"category1Id",optionSeled:category1,divId:"cate1SelectSpan"});
	selectObj2(categoryDictJSON[$("#category1Id").val()]["category2"],"cate2SelectSpan",category2,"category2","category2Id","kong");
	$("#category1Id").attr("disabled","disabled"); 
	$("#category2Id").attr("disabled","disabled");
	$("#ruleID").val(rule);
	$('#addRANK').window('open');
}

//添加榜单
function addRank() {
	var name = $("#nameID").val();
	if($.trim(name).length==0) {
		$.messager.alert('错误提示',"请输入榜单名称!");
		return;
	}
	var category2 = $("#category2Id").val();
	if($(".clickA").attr("id")=="HOME" && $("#category1Id").val()=="Digital" && $("#rankID").val().length==0 && $.trim(category2).length==0) {
		$.messager.alert('错误提示',"请选择产品类型!");
		return;
	}
	$.ajax({
		url:'../rank/addRank',
		type:'post',
		dataType:'json',
		data:$("#FORMRANK").serialize(),
		success:function(data) {
			clean();
			$('#tt').datagrid('reload');
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		} 
	});
}

function closeRank() {
	clean();
}

function clean() {
	$('#addRANK').window('close');
	$("#FORMRANK")[0].reset();
	$("#rankID").val(""); 
	$("#typeId").val("");
}
</script>
</html>