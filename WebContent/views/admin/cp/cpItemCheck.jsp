<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<body>
	<div class=crumbs>CP产品审批</div>
	<br/><br/>
	<div style="margin-left: 20px;">
	<table class="gridView" cellspacing="0" border="1" rules="all"
		style="width: 70%; border-collapse: collapse; margin-left: 0px;">
		<tbody>
			<tr>
				<th class="gridViewHeader" scope="col" colspan="6">产品申请单</th>
			</tr>
			<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
				<td class="gridViewHeader">CP名称</td>
				<td class="gridViewItem" width="80px">${detail.cpName}</td>
				<td class="gridViewHeader">产品ID</td>
				<td class="gridViewItem">${detail.itemID}</td>
				<td class="gridViewHeader">产品名称</td>
				<td class="gridViewItem">${detail.name}</td>
			</tr>
			<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
				<td class="gridViewHeader">一级类别</td>
				<td class="gridViewItem">${detail.category1}</td>
				<td class="gridViewHeader">产品类型</td>
				<td class="gridViewItem">${detail.category2}</td>
				<td class="gridViewHeader">版本名称</td>
				<td class="gridViewItem">${detail.versionName}</td>
			</tr>
			<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
				<td class="gridViewHeader">版本代码</td>
				<td class="gridViewItem">${detail.versionCode}</td>
				<td class="gridViewHeader">申请人</td>
				<td class="gridViewItem">${detail.contacts}</td>
				<td class="gridViewHeader">资费类型</td>
				<td class="gridViewItem">
					<c:if test="${detail.isInSale=='F'}">免费</c:if>
					<c:if test="${detail.isInSale==''}">免费</c:if>
					<c:if test="${detail.isInSale=='T'}">收费</c:if>
				</td>
			</tr>
			
			<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
				<td class="gridViewItem" colspan="6" style="height: 80px;">${detail.des}</td>
			</tr>
			<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
				<td class="gridViewItem"  style="height:150px;">审批意见</td>
				<td class="gridViewItem" colspan="5">
					<table width="100%">
						<c:forEach items="${checkList}" var="check">
						<tr>
							<td>${check.des}</td>
							<td align="right">${check.name}
							&nbsp;<fmt:formatDate value="${check.ddate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td class="gridViewHeader" scope="col" colspan="6"><div><div id= "left">附件</div>
				<c:choose>
					<c:when test="${sessionScope.manager.role=='tester' && detail.status=='READY_TEST'}">
						<div align="right">
						<input type="button" value="添加附件" onclick="openDiv({sourceSizeByte:999999999999});">
						</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.manager.role=='super' && detail.status=='READY_CHECK'}">
					<div id= "right" align="right">
						<input type="button" value="添加附件" onclick="openDiv({sourceSizeByte:999999999999});">
						</div>
					</c:when>
				</c:choose>
				</div></td>
			</tr>
			<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
				<td colspan="6"><br/>
				<a href="${SourceUrl}${detail.sourceID}">资源包</a><br/>
				<c:forEach items="${checkList}" var="check">
					<c:if test="${check.testResultFileID != null && check.testResultFileID != ''}">
						<a href="${StaticUrl}${check.testResultFileID}">附件</a><br/>
					</c:if>
				</c:forEach>
				<span id="fileTd"></span>
				</td>
			</tr>
			<c:choose>
				<c:when test="${sessionScope.manager.role=='tester' && detail.status=='READY_TEST'}">
				<tr>
					<td class="gridViewHeader" scope="col" colspan="6">审批意见</td>
				</tr>
					<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
						<td class="gridViewItem"  style="height:150px;">输入审批意见</td>
						<td class="gridViewItem" colspan="5" height="150px">
						 <textarea rows="10" cols="100%" id="descId"></textarea><span class="pMsg">请输入100个字符以内</span >
						</td>
					</tr>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${sessionScope.manager.role=='super' && detail.status=='READY_CHECK'}">
				<tr>
					<td class="gridViewHeader" scope="col" colspan="6">审批意见</td>
				</tr>
					<tr style="background-color: white; background-position: initial initial; background-repeat: initial initial;">
						<td class="gridViewItem"  style="height:150px;">输入审批意见</td>
						<td class="gridViewItem" colspan="5" height="150px">
						 <textarea rows="10" cols="100%" id="descId"></textarea><br/><span class="pMsg">请输入100个字符以内</span >
						</td>
					</tr>
				</c:when>
			</c:choose>
			<tr style="ine-height: 170px;">
				<td class="gridViewItem" scope="col" colspan="6" align="center">
				<br/><br/>
				<c:if test="${sessionScope.manager.role=='tester' && detail.status=='READY_TEST'}">
					<input type="button" value="未通过测试" onclick="subBut('NO_TEST');"/>&nbsp;&nbsp;
					<input type="button" value="通过测试" onclick="subBut('READY_LIST');"/>&nbsp;&nbsp;
				</c:if>
				<c:if test="${sessionScope.manager.role=='super' && detail.status=='READY_CHECK'}">
					<input type="button" value="未通过审核" onclick="subBut('NO_CHECK');"/>&nbsp;&nbsp;
					<input type="button" value="通过审核" onclick="subBut('READY_TEST');"/>&nbsp;&nbsp;
				</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" id="fileHidId" value="" />
	</div>
	<br/><br/>
	<div class="white_content">
	<input type="file" name="file_upload" id="file_upload" />
	<br/><br/>
	<p align="center">
	<a href="javascript:$('#file_upload').uploadify('upload');">上传</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:closeDivBut();">关闭</a>
	</p>
</div>
</body>
<script type="text/javascript" src="../uploadify/jquery.uploadify.min.js"></script>
<link href="../uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="../js/uploadSource.js"></script>
<script type="text/javascript" src="../js/proper.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var parsedJson;
	$("#file_upload").uploadify(
		{
			'buttonText' : '选择文件',
			'swf' : '../uploadify/uploadify.swf',
			'uploader' : '/PalmplayUpload/upload/static?isNotImg=notImg',
		    'removeTimeout':1,
		    'multi' : true,
		    'auto' : false,
		    'method': 'post',
		    'sizeLimit' : paramSource.sourceSizeByte,//byte-->30M
		    'onUploadStart' : function(file) {
		    	if(file.size>paramSource.sourceSizeByte) {
		    		$.messager.alert('错误提示',"文件最大不能超过"+paramSource.sourceSize+",但当前文件大小为" + formatFileSize(file.size,0,'KB'));
			    	destroy();
			    	return;
		    	}
		    },
		    'onUploadSuccess':function(file,data,response)
		     {
		    	 parsedJson = jQuery.parseJSON(data);
		    	 $("#fileHidId").val(parsedJson.resourceId);
		    	 $("#fileTd").html("<a href='"+staticUrl+parsedJson.resourceId+"'>附件</a><br/>");
		     },
		     'onUploadError': function(event, queueID, fileObj) {
		    	 if (errorObj.type === "File Size"){
		    		 $.messager.alert('错误提示','超过文件上传大小限制'+paramSource.sourceSize+'！');
		    		  destroy();
					  return;
				 }
			},
			'onCancel': function(event, queueID, fileObj){
			}
		});
});

function subBut(status) {
	var desc = $("#descId").val();
	var fileHid = $("#fileHidId").val();
	var param = {itemID:"${detail.itemID}",desc:desc,fileHid:fileHid,status:status};
	if($.trim(desc).length==0) {
		$.messager.alert('错误提示','请输入审批意见!');
		return;
	}
	$.ajax({
		url:"../cp/subCheck",
		type:"post",
		data:param,
		dataType:"json",
		success:function(data) {
			showMessage('审批成功',"审批成功!");
			location.href="../body/initPage?viewUrl=admin/cp/cpItemCheckList";
		},
		error:function(response,data){
			$.messager.alert('错误提示',"ajax请求发生错误");
		}
	});
}
</script>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
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
}

#left{float:left;}
#right{float:right;margin-right: 10px;}
</style>
</html>