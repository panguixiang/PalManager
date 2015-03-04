<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>
<span class="noCick brCick clickA" id="HOME">主页广告管理</span>&nbsp;&nbsp;&nbsp;
<span class="noCick brCick" id="RANK">排名广告管理</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>广告 列 表</td>
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
	 $(".noCick").click(function() {//却换面包屑 
		 $(".noCick").removeClass("clickA");
		 $(this).addClass("clickA");
		 $("#tt").empty();
		 if($(this).attr("id")=="HOME") {
			 queryTableHome({rankType:'HOME'}); 
		 } else {
			 queryTableHome({rankType:'RANK'}); 
		 }
	 });
	 queryTableHome({rankType:$(".clickA").attr("id")});
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
        url:'../rank/rankList',
        fitColumns:true,
        columns:[[
			{field:'name',title:'广告名称', width:300,formatter:function(value,obj,index){
				return "<a href='../rank/initRankItem?rankID="+obj.rankID+"&view=admin/advertise/adverUpdate'>"+obj.name+"</a>";
			}},
            {field:'opt',title:'已添加广告数', width:150,formatter:function(value,obj,index){
            	var selecSort = 0;
            	if($.trim((obj.adJson0)).length>5) {
            		selecSort++;
            	}
            	if($.trim((obj.adJson1)).length>5) {
            		selecSort++;
            	}
            	if($.trim((obj.adJson2)).length>5) {
            		selecSort++;
            	}
            	if($.trim((obj.adJson3)).length>5) {
            		selecSort++;
            	}
            	if($.trim((obj.adJson4)).length>5) {
            		selecSort++;
            	}
            	return selecSort+"条广告 ";
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
	var type = $(".clickA").attr("id");
	$("#nameID"+type).val(name);
	$("#rankID"+type).val(rankID);
	if(type=="HOME") {
	 	//构造一级类别select begin 
	 	$("#cate1SelectSpanHOME").html("产品类型:&nbsp;<input type='text' name='cate1Name' value='"+category1+"' id='cateHOME' readOnly='true' style='background: #F5F5F5;' />");
	} else {
	 	//构造er级类别select begin
	 	createAllCate2Select({title:'产品类型:',seleName:'cate2Name',seleId:'cateRANK',optionSeled:category2,divId:'cate2SelectSpanRANK'});
		$("#cate1IdRANK").val(category1);
		$("#ruleID").val(rule);
	}
	$("#add"+$(".clickA").attr("id")).window('open');
}

//添加榜单
function addRank(type) {
	var rankName = $("#nameID"+type).val();
	if(rankName.length==0 || rankName.indexOf("|")>-1) {
		$.messager.alert('错误提示',"请输入榜单名称"); 
		return;
	}
	if(type=="RANK") { //规则榜单 需要 获得对应的一级类别 
		 for(var key in categoryDictJSON) {
			var obj = categoryDictJSON[key];
			if($.inArray($("#cate"+type).val(), obj.category2)>-1) {
				$("#cate1IdRANK").val(key);
				break;
			}
		}
	}
	$.ajax({
		url:'../rank/addRank',
		type:'post',
		dataType:'text',
		data:$("#FORM"+type).serialize(),
		success:function(data) {
			clean(type);
			$('#tt').datagrid('reload');
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		} 
	});
}

function closeRank(type) {
	clean(type);
}

function clean(type) {
	 $("#nameID"+type).val("");
	 $("#cate1IdRANK").val("");
	 $("#rankID"+type).val("");
	$("#add"+type).window('close');
}
</script>
</html>