<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">
	<span class="noCick brCick clickA" id="AppClick">App</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick" id="GameClick">Game</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick " id="VideoClick">Video</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick" id="MusicClick">Music</span>&nbsp;&nbsp;&nbsp;
	<span class="noCick brCick" id="PictureClick">Picture</span>&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<input type="hidden" name="status" value="NOLIST" id="statusId"/>
<input type="hidden" name="versionCateGory" value="" id="versionCateGoryId"/>
<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
	<tr>
		<td id="titleFont"></font></td>
	</tr>
</table>
<br/>

<table class="gridView" cellspacing="0" border="1" rules="all" style="width: 70%; border-collapse: collapse; margin-left: 0px;">
<tbody>
<tr>
	<th class="gridViewHeader" scope="col">推广图片</th>
	<th class="gridViewHeader" scope="col">产品ID</th>
	<th class="gridViewHeader" scope="col">产品名称</th>
	<th class="gridViewHeader" scope="col">产品类别</th>
	<th class="gridViewHeader" scope="col">产品版本</th>
	<th class="gridViewHeader" scope="col">操作</th>
</tr>
<c:if test='${feautMap.size==0}'>
	<tr class="trClass typeClassTr${feaute.key}" onmouseout="this.style.background='white'" onmouseover="this.style.background='#f0f0f0'" 
		style="background-color: white; background-position: initial initial;background-repeat: initial initial;display:none;">
			<td class="gridViewItem" colspan="6"><input type="button" value="添 加 产 品 " onclick = "update('itemID0');" /></td>
	</tr>
</c:if>
<c:set value="0" var="sum" />
	<c:forEach items="${feautMap}" var="feaute" varStatus="status">
			<c:forEach items="${feaute.value}" var="map" varStatus="statuslist">
			 <c:set value="${statuslist.index+1}" var="sum" />
			 <tr class="trClass typeClassTr${feaute.key}" onmouseout="this.style.background='white'" onmouseover="this.style.background='#f0f0f0'" 
				style="background-color: white; background-position: initial initial;background-repeat: initial initial;display:none;">
					<td class="gridViewItem"><img src="${StaticUrl}${map.iconID}" width="50px" height="50px"/></td>
					<td class="gridViewItem itemId${feaute.key}">${map.itemID}</td>
					<td class="gridViewItem">${map.name}</td>
					<td class="gridViewItem">${map.cate3Name}</td>
					<td class="gridViewItem">${map.versionCode}</td>
					<td class="gridViewItem"><input type="button" value="修  改" onclick = "update('itemID${statuslist.index}');" /></td>
				</tr>
			</c:forEach>
			<c:if test="${sum<5}">
				<tr class="trClass typeClassTr${feaute.key}" onmouseout="this.style.background='white'" onmouseover="this.style.background='#f0f0f0'" 
					style="background-color: white; background-position: initial initial;background-repeat: initial initial;display:none;">
					<td class="gridViewItem" colspan="6"><input type="button" value="添 加 产 品 " onclick = "update('itemID${sum}');" /></td>
			</tr>
			</c:if>
			<c:set value="0" var="sum" />
	</c:forEach>
	</tbody>
</table>
</div>

<div id="addFeature" class="easyui-window" data-options="title:'关键字添加',iconCls:'icon-save',closable:false" style="width:450px;height:400px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<div>
 	 		产品名称：&nbsp;<input type='text' id="itemNameId" value="" maxlength="150" />&nbsp;&nbsp;<input type="button" value="搜 索" id="checkSeachId"/>
 	 	</div></br>
         <div class="easyui-layout" >
			<table id="tt" pagination="false"></table>
		</div>
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateFeature();">确定</a>  
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
var newItemId="",field="";
$(document).ready(function(){
	$('#addFeature').window('close');
	var cate = '${category2}';
	if(cate.length!=0) {
		$(".noCick").removeClass("clickA");
		$("#"+cate+"Click").addClass("clickA");
	}
	$("#titleFont").text($(".clickA").text()+" 产 品 列 表");
	$(".typeClassTr"+$(".clickA").text()).css("display","");
});

$(".noCick").click(function() {//却换面包屑 
	 $(".noCick").removeClass("clickA");
	 $(this).addClass("clickA");
	 $("#titleFont").text($(this).text()+" 产品 列 表");
	 $(".trClass").css("display","none");
	 $(".typeClassTr"+$(this).text()).css("display","");
});

$("#checkSeachId").click(function(){
	var itemName = $("#itemNameId").val();
	if($.trim(itemName).length==0) {
		$.messager.alert('错误提示',"请输入产品名称");
		return false;
	} 
	queryTableHome({name:$.trim(itemName),category2:$(".clickA").text()});
});

function update(itemIDField) {
	$('#addFeature').window('open');
	field = itemIDField;
}

function updateFeature() {
	var obj = $("#tt").datagrid("getSelected");
	var itemIdArr = $(".itemId"+$(".clickA").text());
	var message = "";
	$.each(itemIdArr,function() {
		if(obj.itemID==$(this).text()) {
			message = "此产品已经存在于榜单中，请选择其他产品!"; 
			return;
		}
	});
	if(message.length>0) {
		$.messager.alert('错误提示', message);
		return false;
	} else if(obj == null) {
		$.messager.alert('错误提示', "请选择产品!");
		return false;
	} else {
		location.href="../rank/updateFeature?field="+field+"&newItemId="+obj.itemID+"&feautype="+$(".clickA").text();
	}
}

function closeRank() {
	newItemId="",field="";
	$("#itemNameId").val("");
	$('#addFeature').window('close');
	$("#tt").html("");
}
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
            {field:'name',title:'名称',width:200,align:'center'}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}
</script>
<style>
.gridView {
BORDER-RIGHT: #bad6ec 1px;
BORDER-TOP: #bad6ec 1px;
BORDER-LEFT: #bad6ec 1px;
COLOR: #566984;
BORDER-BOTTOM: #bad6ec 1px;
FONT-FAMILY: Courier New;
}
.gridViewHeader {
BORDER-RIGHT: #bad6ec 1px solid;
BORDER-TOP: #bad6ec 1px solid;
background-color: #ebf8fe;
BORDER-LEFT: #bad6ec 1px solid;
LINE-HEIGHT: 27px;
BORDER-BOTTOM: #bad6ec 1px solid;
}
.gridViewItem {
BORDER-RIGHT: #bad6ec 1px solid;
BORDER-TOP: #bad6ec 1px solid;
BORDER-LEFT: #bad6ec 1px solid;
LINE-HEIGHT: 32px;
BORDER-BOTTOM: #bad6ec 1px solid;
TEXT-ALIGN: center;
}

</style>
</html>