<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">
软&nbsp;件&nbsp;&nbsp;&nbsp;
<a href="../item/initAddItem?category1=Video&category2=&jsp=addVideo">视&nbsp;频</a>&nbsp;&nbsp;&nbsp;
<a href="../item/initAddItem?category1=Digital&category2=Music&jsp=addMusic">音&nbsp;乐</a>&nbsp;&nbsp;&nbsp;
<a href="../item/initAddItem?category1=Digital&category2=Picture&jsp=addPicture">图&nbsp;片</a>
</div>
<h1 style="margin-left:20px;" align="left">填写产品信息：</h1>
<div style="margin-left: 20px; margin-bottom: 20px;margin-right: 20px;">
<form action="" method="post" id="itemFormId">
<input type="hidden" name="category1" value="${item.category1}"/>
<c:choose>
		<c:when test="${item.status=='LIST' && type != ''}">
			<input type="hidden" name="status" value="READY_CHECK"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="status" value="${item.status}"/>
		</c:otherwise>
</c:choose>
<input type="hidden" name="sourceSize" value="${item.sourceSize}" id="sourceSizeId"/>
<input type="hidden" name="iconSID" value="${item.iconSID}" id="iconBigId"/>
<input type="hidden" name="iconID" value="${item.iconID}" id="iconSmallId"/>
<input type="hidden" name="img0" value="${product.img0}" id="IdimgId0" class="idImgClass"/>
<input type="hidden" name="img1" value="${product.img1}" id="IdimgId1" class="idImgClass"/>
<input type="hidden" name="img2" value="${product.img2}" id="IdimgId2" class="idImgClass"/>
<input type="hidden" name="img3" value="${product.img3}" id="IdimgId3" class="idImgClass"/>
<input type="hidden" name="img4" value="${product.img4}" id="IdimgId4" class="idImgClass"/>
<input type="hidden" name="oldPackage" id="oldPackageId" value="${product.packageName}" /> 
<input type="hidden" name="oldVersion" id="oldVersionId" value="${product.versionCode}" />
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
		<td align="right">软件包上传：</td>
		<td><input type="text" size="50px" id="sourceNameId" value="" readOnly="true" style="background: #F5F5F5;"/>&nbsp;&nbsp; 
		<input type="button" value="浏览" onclick="openDiv({sourceSizeByte:999999999999});">
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
		<td colspan="4" class="pMsg">文件类型必须为APK格式</td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">产品ID：</td>
		<td colspan="3"><input type="text" size="50px" name="itemID" value="${item.itemID}" id="itemID" readOnly="true" style="background: #F5F5F5;"/></td>
		<td></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">资源ID：</td>
		<td colspan="3">
		<input type="text" size="50px" id="resourceId" name="sourceID" value="${item.sourceID}" readOnly="true" style="background: #F5F5F5;"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">包名称：</td>
		<td colspan="3">
			<input type="text" name="packageName" value="${product.packageName}" id="packageNameId" readOnly="true" size="50px"  style="background: #F5F5F5;" />
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">版本名称：</td>
		<td colspan="3">
		<input type="text" readOnly="true" size="50px" id="versionNameId" 
			name="versionName" style="background: #F5F5F5;" value="${product.versionName}"  />
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">版本代码：</td>
		<td colspan="3">
		<input type="text" readOnly="true" size="50px" name="versionCode" id="versionId" style="background: #F5F5F5;" value="${product.versionCode}"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">产品名称：</td>
		<td colspan="3">
		<input type="text" size="50px" name="name" id="proNameId" value="${item.name}"/>
	</td>
	<td></td>
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
	<tr style="line-height:15px;">
		<td align="right">产品截图：</td>
		<td colspan="3">
		<div class="div1">
		<c:choose>
			<c:when test="${product.img0 != ''}">
				<img src="${StaticUrl}${product.img0}" id="imgshow0" class="div2"/>
				<input id="imgId0" type="file" name="imgId0" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId0','','480*800-800*480-320*480','imgId0','','');"/>
				<div style="display:;" class="imgDeleteClass"><span onclick="delPic1('imgshow0','IdimgId0');">删&nbsp;&nbsp;除</span></div>
			</c:when>
			<c:otherwise>
				<img src="../images/addPic.jpg" id="imgshow0" class="div2"/>
				<input id="imgId0" type="file" name="imgId0" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId0','','480*800-800*480-320*480','imgId0','','');"/>
				<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow0','IdimgId0');">删&nbsp;&nbsp;除</span></div>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="div1">
		<c:choose>
			<c:when test="${product.img1 != ''}">
				<img src="${StaticUrl}${product.img1}" id="imgshow1" class="div2"/>
				<input id="imgId1" type="file" name="imgId1" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId1','','480*800-800*480-320*480','imgId1','','');"/>
				<div style="display:;" class="imgDeleteClass"><span onclick="delPic1('imgshow1','IdimgId1');">删&nbsp;&nbsp;除</span></div>
			</c:when>
			<c:otherwise>
				<img src="../images/addPic.jpg" id="imgshow1" class="div2"/>
				<input id="imgId1" type="file" name="imgId1" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId1','','480*800-800*480-320*480','imgId1','','');"/>
				<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow1','IdimgId1');">删&nbsp;&nbsp;除</span></div>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="div1">
		<c:choose>
			<c:when test="${product.img2 != ''}">
				<img src="${StaticUrl}${product.img2}" id="imgshow2" class="div2"/>
				<input id="imgId2" type="file" name="imgId2" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId2','','480*800-800*480-320*480','imgId2','','');"/>
				<div style="display:;" class="imgDeleteClass"><span onclick="delPic1('imgshow2','IdimgId2');">删&nbsp;&nbsp;除</span></div>
			</c:when>
			<c:otherwise>
				<img src="../images/addPic.jpg" id="imgshow2" class="div2"/>
				<input id="imgId2" type="file" name="imgId2" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId2','','480*800-800*480-320*480','imgId2','','');"/>
				<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow2','IdimgId2');">删&nbsp;&nbsp;除</span></div>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="div1">
		<c:choose>
			<c:when test="${product.img3 != ''}">
				<img src="${StaticUrl}${product.img3}" id="imgshow3" class="div2"/>
				<input id="imgId3" type="file" name="imgId3" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId3','','480*800-800*480-320*480','imgId3','','');"/>
				<div style="display:;" class="imgDeleteClass"><span onclick="delPic1('imgshow3','IdimgId3');">删&nbsp;&nbsp;除</span></div>
			</c:when>
			<c:otherwise>
				<img src="../images/addPic.jpg" id="imgshow3" class="div2"/>
				<input id="imgId3" type="file" name="imgId3" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId3','','480*800-800*480-320*480','imgId3','','');"/>
				<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow3','IdimgId3');">删&nbsp;&nbsp;除</span></div>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="div1">
		<c:choose>
			<c:when test="${product.img4 != ''}">
				<img src="${StaticUrl}${product.img4}" id="imgshow4" class="div2"/>
				<input id="imgId4" type="file" name="imgId4" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId4','','480*800-800*480-320*480','imgId4','','');"/>
				<div style="display:;" class="imgDeleteClass"><span onclick="delPic1('imgshow4','IdimgId4');">删&nbsp;&nbsp;除</span></div>
			</c:when>
			<c:otherwise>
				<img src="../images/addPic.jpg" id="imgshow4" class="div2"/>
				<input id="imgId4" type="file" name="imgId4" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId4','','480*800-800*480-320*480','imgId4','','');"/>
				<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow4','IdimgId4');">删&nbsp;&nbsp;除</span></div>
			</c:otherwise>
		</c:choose>
		</div>
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg">截图大小为480*800/800*480，格式为gif/png/jpg/jpeg，2-5张。</td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">软件类型：</td>
		<td id="catetd2">
		</td>
		<td>应用类别：</td>
		<td id="cate3Td"></td>
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
		<td colspan="4" class="pMsg">推荐关键字最多选择5个。</td>
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
		<td align="right">资费类型：</td>
		<!-- 修改操作-->
			<c:choose>
			<c:when test="${product.isInSale=='T'}">
				<td><input type="radio" name="isInSale" class="inSaleClass" value="T" checked="checked"/>内计费</td>
				<td><input type="text" name="inSaleID" value="${product.inSaleID}" readonly="readonly" style="background: #F5F5F5;" id="inSaleCodeId"/></td>
				<td></td>
			</c:when>
			<c:otherwise>
				<td><input type="radio" checked="checked" name="isInSale" class="inSaleClass" value="F"/>免费</td>
				<td><input type="hidden"  id="inSaleCodeId"/></td>
				<td></td>
			</c:otherwise>
			</c:choose>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">是否允许联网更新：</td>
		<td>
			<select name="isLineUpdate">
				<option value="T" <c:if test="${product.isLineUpdate=='T'}">selected=selected</c:if>>允许</option>
				<option value="F" <c:if test="${product.isLineUpdate=='F'}">selected=selected</c:if>>不允许</option>
			</select>
		</td>
		<td colspan="3"></td>
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
					<input type="button" value="提交更新"  onclick="saveSoft('../item/renewSoft');"/>
				</c:when>
				<c:otherwise>
					<input type="button" value="提交修改"  onclick="saveSoft('../item/updateSoft');"/>
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
			selectObj,{'htmlId':'cpTd','selectedOption':'${item.cpID}','selectName':'cpID','id':'cpNameId'});
	
  	var cate = categoryDictJSON['Soft'];
	selectObj2(cate['category2'],'catetd2','${item.category2}','category2','cate2NameId');
	
	ajaxGetPro('../item/getProStr?type=cate3&param=${item.category2}',
			selectObj,{'htmlId':'cate3Td','selectedOption':'${item.category3}','selectName':'category3','id':'cate3NameId'});
	
	ajaxGetPro('../item/getProStr?type=tag&param=${item.category3}',
			tagDiv,{'checkedVars':'${tags}'});
	
	selectObj2(langArray,'langSeId','${product.lan}','lan',''); 
	
	$("#countryNamesId").val(getCountryNameStrs('${item.countryCodes}'));
	
	 $(".inSaleClass").change(function(){
		 if($(this).val()=="T") {
			 $("#inSaleCodeId").attr("disabled",false);
		 } else {
			 $("#inSaleCodeId").val("");
			 $("#inSaleCodeId").attr("disabled",true);
		 }
	 });
});

function checkForm() {
	var resourceId = $("#resourceId").val();
	if(resourceId.length==0) {
		$.messager.alert('错误提示','请上传软件包!'); 
		return false;
	}
	if("${type}".length>0 && resourceId==$("#oldResourceId").val()) {//更新操作下是否上传新的软件包 
		$.messager.alert('错误提示','请更新软件包!'); 
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
	var len = 0;
	$(".idImgClass").each(function(){
		if($(this).val().length>0) {
			++len;
		}
	});
	if(len<2) {
		$.messager.alert('错误提示','请最少上次2个产品截图!'); 
		return false;
	}
	if($("#cate3NameId").val()==0) {
		$.messager.alert('错误提示','请选择应用类别!'); 
		return false;
	}
	if($("input[name='tagCheckRight']").size()>5) {
		$.messager.alert('错误提示','推荐关键字最多选择5个!'); 
		return false;
	}
	var countryNamesId = $("#countryNamesId").val();
	if(countryNamesId.length==0) {
		$.messager.alert('错误提示','请选择入库国家!'); 
		return false;
	}
	
	var isInSale=$('input:radio[name="isInSale"]:checked').val();
	if(isInSale=="T") {
		var inSaleCode =$("#inSaleCodeId").val();
		if(inSaleCode.length!=7) {
			$.messager.alert('错误提示','请输入7位有效内计费代码!'); 
			return false;
		}
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