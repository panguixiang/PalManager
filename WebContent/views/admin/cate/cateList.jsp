<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">
</div>
<div style="margin-left: 20px; margin-bottom: 40px;margin-right: 30px;margin-top: 10px;">
<table id="tableTd" style="width:80%;table-layout:fixed;">
	<tr>
	<td id="catetd2"></td>
	<td><input type="button" value="查  询" id="searChBuId"/></td>
	<td id="rightDivs"><input type="button" value="新增类别" onclick="update('');"/></td>
	</tr>
</table>

<br/>
	<div class="easyui-layout" >
		<table id="tt" ></table>
	</div>
</div>

<div id="w" class="easyui-window" data-options="title:'类别添加',iconCls:'icon-save',closable:false" style="width:600px;height:400px;padding:5px;"> 
 <div class="easyui-layout" data-options="fit:true">
  <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
   <form action="" method="post" id="cateFormId">
	<input type="hidden" name="category2" id="category2Id" value=""/>
	<input type="hidden" name="iconID" value="" id="iconBigId"/>
	<input type="hidden" name="category3" id="category3Id" value=""/> 
	<input type="hidden" name="addTagHid" value="" id="addTagHidId"/>
	<table>
		<tr>
			<td style="font-weight: bold;" >类别名称：</td>
			<td>
				<input type="text" size="25px" name="name" id="cateNameId" value="" />&nbsp;&nbsp; 
			</td>
			<td></td>
		</tr>
		<tr style="line-height:40px;">
			<td style="font-weight: bold;" >类别图标：</td>
			<td>
				<div class="div1">
				<img src="../images/addPic.jpg" id="imgshow0" class="div2"/>
				<input id="imgId0" type="file" name="imgId0" class="inputstyle zidongClass" 
					onchange="zidongMehtohd('iconBigId','','','imgId0','','');"/>
				</div>
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="pMsg"></td>
		</tr>
		<tr>
			<td style="font-weight: bold;" >关键字：</td>
			<td colspan="2" class="pMsg"></td>
		</tr>
		<tr>
			<td colspan="3">
				<div id="tbodyTag" style='margin-left:20px;width: 300px;display:block;word-break: break-all;word-wrap: break-word;background-color: #ccc;'>
				</div>
				<div style='margin-left:20px;width: 300px;display:block;word-break: break-all;word-wrap: break-word;background-color: #ccc;'>
					<input type="button" value="添加" class="initAddTagClass"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="删除" class="initDeleteTagClass"/>
				</div>
			</td>
		</tr>
		<tr><td></td><td></td><td></td>
		</tr>
	 </table>
	</form>   
   </div>  
   <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addCate3();">确定</a>  
     <a class="easyui-linkbutton noSubmitCate" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
     </div>  
  </div>
</div>  
    
<div id="w2" class="easyui-window" data-options="title:'关键字添加',iconCls:'icon-save',closable:false" style="width:300px;height:200px;padding:5px;"> 
   <div class="easyui-layout" data-options="fit:true">  
 	 <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
         	  关键字:&nbsp;<input type="text" name="addTagName" id="addTagNameId" size="20px;" />
 	 </div>  
   	 <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">  
     <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addTag();">确定</a>  
     <a class="easyui-linkbutton closeTagDiv" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
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
	$('#w2').window('close');
	var crumbHtml = "";
	var i=0;
	for(var key in categoryDictJSON) {
		if(i==0) {
			crumbHtml+="<span class='noCick brCick clickA' id='"+key+"'>"+key+"</span>&nbsp;&nbsp;&nbsp;";
		} else {
			crumbHtml+="<span class='noCick brCick' id='"+key+"'>"+key+"</span>&nbsp;&nbsp;&nbsp;";
		}
		i++;
	}
	$(".crumbs").html(crumbHtml); 
	var cate = categoryDictJSON['Soft'];
	selectObj2(cate['category2'],'catetd2','','category2','cate2NameId');
	
	$(".noCick").live("click",function() {//却换面包屑
		 $(".noCick").removeClass("clickA");
		 $(this).addClass("clickA");
		 cate = categoryDictJSON[$(this).attr("id")];
		 selectObj2(cate['category2'],'catetd2','','category2','cate2NameId');
		 queryTable({selectedCategory:$("#cate2NameId").val()});
	 });
	
	$(".initAddTagClass").click(function(){
		$("#w2").window('open');
	});
	
	$(".closeTagDiv").click(function(){
		$("#addTagNameId").val("");
		$("#w2").window('close');
	});
	//删除标签 
	$(".initDeleteTagClass").click(function(){
		var str="",addTagHidId="";
		$("input[name='tagCheckIdAdd']:checkbox").each(function(){//删除新添加的
			if($(this).attr("checked")){
				addTagHidId = ($("#addTagHidId").val()).replace($(this).next().text()+"|","");
				$("#addTagHidId").val(addTagHidId);
				$(this).parent().remove();
			}
		});
		$("input[name='tagCheckId']:checkbox").each(function(){//需要去后台删除的
			if($(this).attr("checked")){
				str += $(this).val()+", ";
			}
		});
		if(str.length>2) {
			$.ajax({
				url:'../category/deleteTag?tagIDS='+str,
				type:'get',
				dataType:'json',
				success:function(data) {
					$.each(str.split(","),function(n,value) {
						$("#"+value).remove();
					});
				},
				error:function(response,data){
					$.messager.alert('错误提示',"ajax请求发生错误");
				} 
			});
		}
	});
	//取消操作情况浏览器表单域缓存 
	$(".noSubmitCate").click(function() {
		clean();
	});
	queryTable({selectedCategory:$("#cate2NameId").val()});
	$("#searChBuId").click(function(){
		queryTable({selectedCategory:$("#cate2NameId").val()});
	});
});

function queryTable(param) {
	$('#tt').datagrid({
		width: $("#tableTd").width()*0.74,
		height:($(window).height()*0.88),
    	queryParams:param,
        loadMsg: "数据加载中，请稍后...",
        idField:'category3',
        url:'../category/list',
        fitColumns:true,
        columns:[[
			{field:'name',align:'center',title:'类别', width:200},
            {field:'iconID',title:'图标',align:'center', width:200,formatter:function(value){
            	if(value.length>0) {
            		return "<img src="+staticUrl+value+" width=40px height=40px></img>";
            	} else {
            		return "暂无图片";
            	}
            }},
            {field:'opt',width:200,align:'center',title:'操作',formatter:function(value,obj,index){
            	var e = "<a href=# mce_href=# onclick=update('"+ obj.category3 +"')>修改</a>&nbsp;&nbsp;";    
                var d = "<a href=# mce_href=# onclick=del('"+ index +"','"+obj.category3+"')>删除</a>";
                return e+d;
            }}
           ]]
        });
	$('#tt').datagrid("clearSelections");
}
//删除列
function del(index,category3){
    $.messager.confirm('确认','确认删除?',function(row){
        if(row){
            $.ajax({
                url:'../category/deleteCate?cate3Id='+category3,
                success:function(){
                	showMessage('删除成功','删除成功!');
            		$('#tt').datagrid('deleteRow',index);
                }
            });
        }  
    });
  }
function clean() {
	$("#category3Id").val("");
	$("#cateNameId").val(""); 
	$("#iconBigId").val("");
	$("#imgshow0").attr("src","../images/addPic.jpg");
	$("#tbodyTag").empty();
	$('#w').window('close');
}
//弹出新增或修改div  
function update(cateId) {
	$.ajax({
		url:'../category/initupdate?cateId='+cateId+'&category2='+$("#cate2NameId").val(),
		type:'get',
		dataType:'json',
		success:function(data) {
			$("#addTagHidId").val("");
			if(data.category3) {
				$("#category3Id").val(data.category3.category3);
				if((data.category3.iconID).length>0) {
					$("#iconBigId").val(data.category3.iconID);
					$("#imgshow0").attr("src",staticUrl+data.category3.iconID);
				}
				$("#cateNameId").val(data.category3.name);
			}
			$("#category2Id").val(data.category2);
			var tbodyTagHtml = "";
			if(data.tagList) {
				$.each(data.tagList,function(n,value) {
					tbodyTagHtml+="<span class='sss' id="+value.tagID+"><input type='checkbox' name='tagCheckId' value="+value.tagID+">&nbsp;</input><span>"+value.name+"</span></span>&nbsp;";
				});
				$("#tbodyTag").html(tbodyTagHtml);
			}
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		} 
	});
	$('#w').window('open');
}
//执行三级类别新增操作 
function addCate3() {
	var cateNameId = $("#cateNameId").val();
	if(cateNameId.length==0) {
		$.messager.alert('错误提示',"请输入类别名称");
		return;
	}
	$.ajax({
		url:'../category/addCate3',
		type:'post',
		dataType:'text',
		data:$("#cateFormId").serialize(),
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
//添加标签操作
function addTag() {
	var tagName = $("#addTagNameId").val();
	if(tagName.length==0 || tagName.indexOf("|")>-1) {
		$.messager.alert('错误提示',"请输入不包含|字符的关键字");
		return;
	}
	if(ledd(tagName)>10) {
		$.messager.alert('错误提示',"关键字最多可以输入10个字符，1个汉字2个字符");
		return;
	}
	var addTagHidId = $("#addTagHidId").val();
	addTagHidId +=tagName+"|";
	$("#addTagHidId").val(addTagHidId);
	$("#tbodyTag").append("<span class='sss'><input type='checkbox' name='tagCheckIdAdd' value=''/>&nbsp;<span>"+tagName+"</span></span>");
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