<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">个人中心背景管理</div>
<div style="margin-left: 30px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<table id="tableTd" style="width:70%;table-layout:fixed;">
	<tr>
	<td>背景列表</td>
	<td align="right"><input type="button" value="添加背景" onclick="update('save');"/></td>
	<td></td>
	</tr>
</table>

<br/>
	<div class="easyui-layout" >
		<table id="tt" rownumbers="true" pagination="true"></table>
	</div>
</div>

<div id="w" class="easyui-window" data-options="title:'个人中心背景管理',iconCls:'icon-save',closable:false" style="width:500px;min-height:350px;padding:5px;"> 
 <div class="easyui-layout" data-options="fit:true">
  <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
  	<input type="hidden" name="bgID" value="" id="bgID"/>
	<input type="hidden" name="imgID" value="" id="imgID"/> 
	<table style="margin-left: 20%;margin-right: 20%;"> 
		<tr style="line-height: 60px;">
			<td style="font-weight: bold;" >背景名称：</td>
			<td>
				<input type="text" size="15px" name="name" id="nameId" value="" />&nbsp;&nbsp; 
			</td>
			<td></td>
		</tr>
		<tr style="line-height:60px;">
			<td style="font-weight: bold;" >背景图片：</td>
			<td>
				<div class="div1">
				<img src="../images/addPic.jpg" id="imgshow0" class="div2"/>
				<input id="imgId0" type="file" name="imgId0" class="inputstyle zidongClass" 
					onchange="zidongMehtohd('imgID','','','imgId0','','');"/>
				</div>
			</td>
		</tr>
		<tr><td></td><td></td><td></td>
		</tr>
	 </table>
   </div>  
   <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addPersonCenter();">确定</a>
     <a class="easyui-linkbutton noSubmitCate" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
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
	$('#w').window('close');
	queryTable();

});
$(".noSubmitCate").click(function(){
	clean();
});
function queryTable() {
	$('#tt').datagrid({
		width: $("#tableTd").width()*0.74,
		height:($(window).height()*0.88),
        loadMsg: "数据加载中，请稍后...",
        idField:'bgID',
        pageSize: 25,
        pageList: [25,35,45,65,100],
        url:'../personCenter/personCenterList',
        fitColumns:true,
        columns:[[
			{field:'bgID',align:'center',title:'背景编号', width:200},
            {field:'name',title:'背景名称',align:'center', width:200},
            {field:'imgID',title:'背景图片',align:'center', width:200,formatter:function(value){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=60px height=45px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'opt',width:200,align:'center',title:'操作',formatter:function(value,obj,index){
            	var e = "<a href=# mce_href=# onclick=update('"+ obj.bgID +"')>修改</a>&nbsp;&nbsp;";    
                var d = "<a href=# mce_href=# onclick=del('"+ index +"')>删除</a>";
                return e+d;
            }}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}
//删除列
function del(index){
    $.messager.confirm('确认','确认删除?',function(row){
        if(row){
        	var selectedRow = $('#tt').datagrid('getSelected');//获取选中行 
            $.ajax({
                url:'../personCenter/deletePersonCenter?bgID='+selectedRow.bgID,
                success:function(){
                	showMessage('删除成功','删除成功!');
            		$('#tt').datagrid('deleteRow',index);
                }
            });
        }  
    });
  }
//弹出新增或修改div  
function update(bgID) {
	if(bgID!="save") {//修改操作 
		$.ajax({
			url:'../personCenter/personCenter?bgID='+bgID, 
			type:'get',
			dataType:'json',
			success:function(data) {
				$("#bgID").val(data.bgID);
				$("#imgID").val(data.imgID); 
				$("#nameId").val(data.name);
				$("#imgshow0").attr("src",staticUrl+data.imgID); 
			},
			error:function(response,data){
				$.messager.alert('错误提示',"ajax请求发生错误");
			} 
		});
	}
	$('#w').window('open');
}
//执行三级类别新增操作 
function addPersonCenter() {
	var nameId = $("#nameId").val();
	if(nameId.length==0) {
		$.messager.alert('错误提示',"请输入背景名称");
		return;
	}
	if(($("#imgID").val()).length==0) {
		$.messager.alert('错误提示',"请上传背景图片");
		return;
	}
	$.ajax({
		url:'../personCenter/updatePersonCenter',
		type:'post',
		data:{bgID:$("#bgID").val(),name:nameId,imgID:$("#imgID").val()},
		success:function(data) {
			showMessage('操作成功','操作成功!');
			clean();
			$('#tt').datagrid('reload');
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		} 
	});
}
function clean() {  
	$("#bgID").val("");
	$("#imgID").val(""); 
	$("#nameId").val("");
	$("#imgshow0").attr("src","../images/addPic.jpg"); 
	$('#w').window('close');
}
</script>
<style>
.sss {
	display:-moz-inline-box;
	display:inline-block;
	width:120px;
	text-overflow: ellipsis;
}
<!--
.div1{ 
float: left;
height: 105px;
width: 82px;
position:relative;
}
.div2{
text-align:center;
font-size:15px;
font-weight:800;
height: 81px;
width: 75px;
}
.inputstyle{
    width: 75px; 
    height: 83px;
    cursor: pointer;
    position: absolute;
    filter:alpha(opacity=0);
    -moz-opacity:0;
    opacity:0; 
    left:0px;
    top: 0px;
}
</style>
</html>