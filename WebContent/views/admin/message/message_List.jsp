<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class=crumbs>消息管理</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
	<table class="queryTable" style="padding:8px 30px;margin-top: 20px;width: 70%;">
			<tr>
				<td>消息列表</td>
				<td></td>
				<td align="right"><input type="button" value="新  增" id="addButton"/>&nbsp;&nbsp;&nbsp;
			<input type="button" value="删  除" id="deleteButton" /></td>
			</tr>
	</table>
	<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>



<div id="addMessageDiv" class="easyui-window" data-options="title:'新增消息',iconCls:'icon-save',closable:false" 
	style="width:700px;height:800px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
 	 	<div align="center">
 	 	<form action="" method="post" id="formIDMessage">
	 	 	<input type="hidden" name="imgID" id="imgId" value=""/>
	 	 	<table class="queryTable" style="padding:8px 30px;">
				<tr>
					<td align="right">标 题：</td>
					<td>
						<input type="text" name="title" value="" id="titleID"/>
					</td>
				</tr>
				<tr>
					<td align="right">图 片：</td>
					<td>
						<div class="divbanner1">
							<img src="../images/addBanner.jpg" class="divbannerimg1"/>
							<input type="file" name="banner1" id="banner1Id" class="inputbannerimg1 zidongClass"
				 				onchange="zidongMehtohd('imgId','','','banner1Id','','');"/>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">内 容：</td>
					<td>
						<textarea rows="10" cols="66" name="content" id="contentId"></textarea>
					</td>
				</tr>
				<tr>
					<td>国家：</td>
					<td>
						<div id="countryCheck" style="word-wrap:break-word;float:left; height:300px;width:90%;border:1px solid gray;overflow:scroll "></div>
					</td>
				</tr>
			</table>
	</form>
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
	$("#addMessageDiv").window("close");
	queryTable();
	creatCountryCheck("");
}); 

var creatCountryCheck = function(readyCountryCodes) {
		$("#countryCheck").empty();
		var countryHtml = "<table><tr><td><input type='radio' name='radioAll' value='all' class='radioAll' />&nbsp;全选</td><td>"+
		"<input type='radio' name='radioAll' value='no' class='radioAll' />&nbsp;反选</td><td></td></tr>";
		$(countryDictJSON).each(function(index,obj){
			if(index%3==0) {
				countryHtml+="<tr style='line-height:3px;'>";
			}
			if(readyCountryCodes.indexOf(obj.countryCode)>-1) {
				countryHtml+="<td><input type='checkbox' name='countryCodes' class='countrClass' checked='checked' value='"+
					obj.countryCode+"'/><span>"+obj.countryNameCN+"</span></td><td align='left'></td>";
			} else {
				countryHtml+="<td><input type='checkbox' name='countryCodes' class='countrClass' value='"+
				obj.countryCode+"'/><span>"+obj.countryNameCN+"</span></td><td align='left'></td>";
			}
			if((index+1)%3==0) {
				countryHtml+="</tr>";
			}
		});
		countryHtml +="" +
		"</table>";
		$("#countryCheck").html(countryHtml);
};

$(".radioAll").live("click",function(){
	if($(this).val()=="all") {
		$(".countrClass").each(function(){
			$(this).attr("checked", true); 
		});
	} else {
		$(".countrClass").each(function(){
			$(this).attr("checked", false); 
		});
	}
});

$("#addButton").click(function(){
	$(".saveClass").css("display","");
	$("#banner1Id").css("display","");
	$(".divbannerimg1").attr("src","../images/addBanner.jpg");
	$("#addMessageDiv").window("open");
});

$("#deleteButton").click(function(){
	var selected = $('#tt').datagrid("getSelections");
	var msgIds="";
	$.each(selected, function(index, obj){
		msgIds += obj.msgId + ",";
   });
	if(msgIds.length==0) {
		$.messager.alert('错误提示',"请选择需要删除的消息!");
	} else {
		$.ajax({
			url:"../message/deletMessage?msgIds="+msgIds,
			type:"get",
			secureuri: false,
			success:function(data) {
				showMessage('操作成功','操作成功!');
				$("#addMessageDiv").window("close");
				queryTable();
			},
			error:function(response,data){
				$.messager.alert('错误提示',"ajax请求发生错误!");
			} 
		});
	}
});

$(".closeClass").click(function() {
	$("#msgId").val("");
	$("#imgId").val("");
	$("#titleID").val("");
	$("#contentId").val("");
	$(".countrClass").each(function(){
		$(this).attr("checked", false); 
	});
	$("#addMessageDiv").window("close");
});
$(".saveClass").click(function(){
	$.ajax({
		url:"../message/addMessage",
		type:"post",
		data:$("#formIDMessage").serialize(),
		secureuri: false,
		success:function(data) {
			showMessage('操作成功','操作成功!');
			$("#addMessageDiv").window("close");
			queryTable();
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误!");
		} 
	});
});

function queryTable() {
	$('#tt').datagrid({
		width: $(".queryTable").width()+60,
		height:($(window).height()*0.88),
        singleSelect:false,
        pageSize: 15,
        loadMsg: "数据加载中，请稍后...",
    	pageList: [15,25,35,45,50],
        idField:'msgId',
        url:'../message/list',
        fitColumns:true,
        columns:[[
			{field:'msgId',checkbox:'true',width:50},
			{field:'title',title:'标题',width:400,formatter:function(value,obj,index){
				return "<a href='#' onclick=showDetail('"+obj.title+"','"+obj.content+"','"+obj.imgID+"','"+obj.countryCodes+"')>"+value+"</a>";
			}},
			{field:'ddate',title:'发布时间',width:300,formatter:function(value){
				 var unixTimestamp = new Date(value);
                 return unixTimestamp.toLocaleString();
			}}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}
function showDetail(title,content,imgID,countryCode) {
	$("#titleID").val(title);
	$("#imgId").val(imgID);
	if(imgID.length>0) {
		$(".divbannerimg1").attr("src",staticUrl+imgID);
	}
	$("#contentId").text(content);
	creatCountryCheck(countryCode);
	$(".saveClass").css("display","none");
	$("#banner1Id").css("display","none");
	$("#addMessageDiv").window("open");
}
</script>
<script type="text/javascript" src="../uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="../js/uploadSource.js"></script>
<script type="text/javascript" src="../js/proper.js"></script>
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
    width: 520px; 
    height: 140px;
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