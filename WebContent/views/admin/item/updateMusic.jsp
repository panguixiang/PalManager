<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">
<a href="../item/initAddItem?category1=Soft&category2=&jsp=addSoft">软&nbsp;件</a>&nbsp;&nbsp;&nbsp;
<a href="../item/initAddItem?category1=Video&category2=&jsp=addVideo">视&nbsp;频</a>&nbsp;&nbsp;&nbsp;
音&nbsp;乐&nbsp;&nbsp;&nbsp;
<a href="../item/initAddItem?category1=Digital&category2=Picture&jsp=addPicture">图&nbsp;片</a>
</div>
<h1 style="margin-left:20px;" align="left">填写产品信息：</h1>
<div style="margin-left: 20px; margin-bottom: 20px;margin-right: 20px;">
<form action="" method="post" id="itemFormId">
<c:choose>
		<c:when test="${item.status=='LIST' && type != ''}">
			<input type="hidden" name="status" value="READY_LIST"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="status" value="${item.status}"/>
		</c:otherwise>
</c:choose>
<input type="hidden" name="category1" value="${item.category1}"/>
<input type="hidden" name="category2" value="${item.category2}"/>
<input type="hidden" name="sourceSize" value="${item.sourceSize}" id="sourceSizeId"/> 
<input type="hidden" name="iconSID" value="${item.iconSID}" id="iconBigId"/>
<input type="hidden" name="iconID" value="${item.iconID}" id="iconSmallId"/>
<input type="hidden" name="oldCategory2" value="${item.category2}" />
<input type="hidden" value="${item.countryCodes}" name="oldCountryCodes" id="oldCountryCodes" />
<input type="hidden" value="${item.countryCodes}" name="countryCodes" id="countryCodes" />
<input type="hidden" name="advBannerID" value="${item.advBannerID}" id="bannerId"/> 
<input type="hidden" name="advIconID" value="${item.advIconID}" id="smallBannerId"/> 
<input type="hidden" value="${item.sourceID}" id="oldResourceId"/>
	<table class="queryTable" style="width: 80%;">
	<c:choose>
		<c:when test="${item.status=='LIST' && type == ''}">
			<tr style="display: none;">
		</c:when>
		<c:otherwise>
			<tr>
		</c:otherwise>
	</c:choose>
		<td align="right">音乐上传：</td>
		<td>
		<input type="text" size="50px" id="sourceNameId" value="" readOnly="true" style="background: #F5F5F5;"/>&nbsp;&nbsp; 
		<input type="button" value="浏览" onclick="openDiv({sourceSizeByte:50485760,sourceType:'.MP3',isShotFile:'no'});">
		</td>
		<td colspan="2"></td>
		<td></td>
	</tr>
	<c:choose>
		<c:when test="${item.status=='LIST' && type == ''}">
			<tr style="display: none;">
		</c:when>
		<c:otherwise>
			<tr>
		</c:otherwise>
	</c:choose>
		<td></td>
		<td colspan="4" class="pMsg">上传文件大小&lt;50M</td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">产品ID：</td>
		<td colspan="3"><input type="text" size="50px" name="itemID" value="${item.itemID}" id="itemID" readOnly="true" style="background: #F5F5F5;"/></td>
		<td></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">资源ID：</td>
		<td colspan="3"><input type="text" size="50px" name="sourceID" value="${item.sourceID}" id="resourceId" readOnly="true" style="background: #F5F5F5;"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">产品名称：</td>
		<td colspan="3"><input type="text" name="name" value="${item.name}" id="proNameId" size="50px"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">公司/个人：</td>
		<td colspan="3" id="cpTd">
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">产品图标：</td>
		<td colspan="3">
			<div class="div1">
				<c:choose>
					<c:when test="${item.iconID != ''}">
						<img src="${StaticUrl}${item.iconID}" id="imgSd"  class="div2"/>
					</c:when>
					<c:otherwise>
						<img src="../images/addPic.jpg" id="imgSd"  class="div2"/>
					</c:otherwise>
				</c:choose>
				<input id="iconId" type="file" name="iconId" class="inputstyle"/>
			</div>
			<input type="button" value="上传" onclick="uploadButton('iconBigId','iconSmallId','','iconId');"/>
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg">图标格式为gif/png/jpg/jpeg</td>
	</tr>
	<tr style="line-height:50px;">
		<td align="right">产品简介：</td>
		<td colspan="3"><textarea name="des" cols="80%" rows="10" id="descId">${item.des}</textarea></td>
		<td></td> 
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg" id="descNumId">
			最多可输入1000个字符，现在已输入0个字符，还可以输入1000个字符。
		</td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">音乐类别：</td>
		<td colspan="3" id="cate3Td">
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">推荐关键字：</td>
		<td colspan="3">
		<div style="height:100%;">
  			<div id="lefDiv" style="float:left; height:250px;width:200px;border:1px solid gray;overflow:scroll">
	  			
  			</div>
  			<div style="float:left; width:4%;">
  				<br/><br/>
  				<div align="center">
	  				<span id="toRight">》》</span>
					<span id="toLeft">《《</span>
  				</div>
  			</div>
  			<div id="rightDiv" style="word-wrap:break-word;float:left; height:250px;width:200px;border:1px solid gray; min-height:100px;overflow:scroll ">
  			 
  			</div>
 		</div>
	</td>
	<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">年&nbsp;&nbsp;份：</td>
		<td id="publicYearTdId">
		</td>
		<td colspan="3"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">歌&nbsp;&nbsp;手：</td>
		<td colspan="3"><input type="text" name="singer" value="${product.singer}" size="100px" id="singerId"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">出品国家：</td>
		<td id="publicCountrytdId">
		</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">产品等级：</td>
		<td>
			<select name="star" disabled="disabled">
				<option value="1" <c:if test="${itemStatics.star=='1'}">selected=selected</c:if>>一星</option>
				<option value="2" <c:if test="${itemStatics.star=='2'}">selected=selected</c:if>>二星</option>
				<option value="3" <c:if test="${itemStatics.star=='3'}">selected=selected</c:if>>三星</option>
				<option value="4" <c:if test="${itemStatics.star=='4'}">selected=selected</c:if>>四星</option>
				<option value="5" <c:if test="${itemStatics.star=='5'}">selected=selected</c:if>>五星</option>
			</select>
		</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">默认语言：</td>
		<td id="langSeId">
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">入库国家：</td>
		<td><input type="button" value="选择" onclick="openCountryDiv();"/>&nbsp;&nbsp; 
		<input type="text" id="countryNamesId" readonly="readonly" size="52px" style="background: #F5F5F5;"/></td>
		<td colspan="3" ></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">广告推广图片：</td>
		<td colspan="3">
		<div class="divbanner1">
		<c:choose>
			<c:when test="${item.advBannerID != ''}">
				<img src="${StaticUrl}${item.advBannerID}" class="divbannerimg1"/>
				<input type="file" name="banner1" id="banner1Id" class="inputbannerimg1 zidongClass"
			 		onchange="zidongMehtohd('bannerId','','','banner1Id','','');"/>
			</c:when>
			<c:otherwise>
				<img src="../images/addBanner.jpg" class="divbannerimg1"/>
				<input type="file" name="banner1" id="banner1Id" class="inputbannerimg1 zidongClass"
			 		onchange="zidongMehtohd('bannerId','','','banner1Id','','');"/>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="divbanner2">
		<c:choose>
			<c:when test="${item.advBannerID != ''}">
				<img src="${StaticUrl}${item.advIconID}" class="divbannerimg2"/>
				<input type="file" name="banner2" id="banner2Id" class="inputbannerimg2 zidongClass"
				 onchange="zidongMehtohd('smallBannerId','','','banner2Id','','');"/>
			</c:when>
			<c:otherwise>
				<img src="../images/addBanner2.jpg"  class="divbannerimg2"/>
				<input type="file" name="banner2" id="banner2Id" class="inputbannerimg2 zidongClass"
				 onchange="zidongMehtohd('smallBannerId','','','banner2Id','','');"/>
			</c:otherwise>
		</c:choose>
		</div>
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="center" colspan="3">
		<c:choose>
				<c:when test="${item.status=='LIST' && type != ''}">
					<input type="button" value="提交更新"  onclick="saveSoft('../item/renewMusic');"/>
				</c:when>
				<c:otherwise>
					<input type="button" value="提交修改"  onclick="saveSoft('../item/updateMusic');"/>
				</c:otherwise>
		</c:choose>
			&nbsp;&nbsp;<img width="40px" height="40px" src="../images/loading.gif" style="display: none;" id="logdingSubId"/> 
		</td>
		<td colspan="2">
		</td>
	</tr>
</table>
</form>
</div>
<div class="white_content">
	<input type="file" name="file_upload" id="file_upload" />
	<br/><br/>
	<p align="center">
	<a href="javascript:$('#file_upload').uploadify('upload');">上传</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:closeDivBut();">关闭</a>
	</p>
</div>
<div class="country_content">
<div class="countryList"></div>
<div>
	<input type="button" value="关闭" onclick="closeCountryDiv('close','','');" />
	<input type="button" value="确定" onclick="closeCountryDiv('','countryCodes','countryNamesId');" />
</div>
</div>
</body></html>
<script type="text/javascript" src="../uploadify/jquery.uploadify.min.js"></script>
<link href="../uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="../js/uploadSource.js"></script>
<script type="text/javascript" src="../js/proper.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	ajaxGetPro('../item/getProStr?type=cp&status=0',
			selectObj,{'htmlId':'cpTd','selectedOption':'${item.cpID}','selectName':'cpID','id':'cpNameId'});//获得公司select
	ajaxGetPro('../item/getProStr?type=cate3&param=${item.category2}',
			selectObj,{'htmlId':'cate3Td','selectedOption':'${item.category3}','selectName':'category3','id':'cate3NameId'});//获得三级 select
	ajaxGetPro('../item/getProStr?type=tag&param=${item.category3}',
			tagDiv,{'checkedVars':'${tags}'});
	selectObj2(publicYear,'publicYearTdId','${product.publicYear}','publicYear','publicYearId');//年份
	selectObj2(publicCountrArra,'publicCountrytdId','${product.publicCountry}','publicCountry','publicCountryId');//出品国家
	selectObj2(langArray,'langSeId','${product.lan}','lan','');
	$("#countryNamesId").val(getCountryNameStrs('${item.countryCodes}'));
});
 
function checkForm() {
	var resourceId = $("#resourceId").val();
	if(resourceId.length==0) {
		$.messager.alert('错误提示','请上传音乐!'); 
		return false;
	}
	if("${type}".length>0 && resourceId==$("#oldResourceId").val()) {//更新操作下是否上传新的软件包 
		$.messager.alert('错误提示','请更音乐!'); 
		return false;
	}
	var proNameId = $("#proNameId").val();
	if(proNameId.length==0) {
		$.messager.alert('错误提示','请输入产品名称!'); 
		return false;
	}
	var iconBigId = $("#iconBigId").val();
	if(iconBigId.length==0) {
		$.messager.alert('错误提示','请上传产品图标!'); 
		return false;
	}
	var descId=$("#descId").val();
	if(descId.length==0) {
		$.messager.alert('错误提示','请输入产品简介!'); 
		return false;
	}
	if(descId.length>1000) {
		$.messager.alert('错误提示','产品简介最多输入1000个字符!'); 
		return false;
	}
	if($("#cate3NameId").val()==0) {
		$.messager.alert('错误提示','请选音乐类别!'); 
		return false;
	}
	if($("input[name='tagCheckRight']").size()>5) {
		$.messager.alert('错误提示','推荐关键字最多选择5个!'); 
		return false;
	}
	var singerId = $("#singerId").val();
	if(singerId.length==0) {
		$.messager.alert('错误提示','请输入歌手名称!'); 
		return false;
	}
	
	var countryNamesId = $("#countryNamesId").val();
	if(countryNamesId.length==0) {
		$.messager.alert('错误提示','请选择入库国家!'); 
		return false;
	}
	var bannerId = $("#bannerId").val();
	var smallBannerId = $("#smallBannerId").val();
	if(bannerId.length > 0 && smallBannerId.length == 0) {
		$.messager.alert('错误提示','广告推广图片两张图片必须同时存在或不存在!'); 
		return false;
	}
	if(bannerId.length == 0 && smallBannerId.length > 0) {
		$.messager.alert('错误提示','广告推广图片两张图片必须同时存在或不存在!'); 
		return false;
	}
	return true;
	
}
</script>
<style>
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


.divbanner2{
float: left;
height: 150px;
width: 182px;
position:relative;
}
.divbannerimg2{
text-align:center;
font-size:15px;
font-weight:800;
height: 140px;
width: 175px;
}
.inputbannerimg2{
    width: 175px; 
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
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
</html>