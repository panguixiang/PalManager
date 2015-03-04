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
<input type="hidden" name="category1" value="${category1}"/>
<input type="hidden" name="status" value="READY_CHECK"/>
<input type="hidden" name="sourceSize" value="" id="sourceSizeId"/>
<input type="hidden" name="iconSID" value="" id="iconBigId"/>
<input type="hidden" name="iconID" value="" id="iconSmallId"/>
<input type="hidden" name="img0" value="" id="IdimgId0" class="idImgClass"/>
<input type="hidden" name="img1" value="" id="IdimgId1" class="idImgClass"/>
<input type="hidden" name="img2" value="" id="IdimgId2" class="idImgClass"/>
<input type="hidden" name="img3" value="" id="IdimgId3" class="idImgClass"/>
<input type="hidden" name="img4" value="" id="IdimgId4" class="idImgClass"/>
<input type="hidden" name="oldPackage" id="oldPackageId" value="" /> 
<input type="hidden" name="oldVersion" id="oldVersionId" value="" />
<input type="hidden" value="" name="countryCodes" id="countryCodes" />
<input type="hidden" name="advBannerID" value="" id="bannerId"/> 
<input type="hidden" name="advIconID" value="" id="smallBannerId"/> 
	<table class="queryTable" style="width: 80%;">
	<tr>
		<td align="right">软件包上传：</td>
		<td><input type="text" size="50px" id="sourceNameId" value="" readOnly="true" style="background: #F5F5F5;"/>&nbsp;&nbsp; 
		<input type="button" value="浏览" onclick="openDiv({sourceSizeByte:999999999999});">
		</td>
		<td colspan="2"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg">文件类型必须为APK格式</td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">资源ID：</td>
		<td colspan="3">
		<input type="text" size="50px" id="resourceId" name="sourceID" readOnly="true" style="background: #F5F5F5;"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">包名称：</td>
		<td colspan="3">
			<input type="text" name="packageName" value="" id="packageNameId" readOnly="true" size="50px"  style="background: #F5F5F5;" />
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
		<input type="text" readOnly="true" size="50px" id="versionNameId" name="versionName" style="background: #F5F5F5;"/>
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
		<input type="text" readOnly="true" size="50px" name="versionCode" id="versionId" style="background: #F5F5F5;"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">产品名称：</td>
		<td colspan="3">
		<input type="text" size="50px" name="name" id="proNameId" value=""/>
	</td>
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
				<img src="../images/addPic.jpg" id="imgSd"  class="div2"/>
				<input id="iconId" type="file" name="iconId" class="inputstyle"/>
			</div>
			<input type="button" value="上传" onclick="uploadButton('iconBigId','iconSmallId','','iconId');"/>
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg">图片格式为gif/png/jpg/jpeg</td>
	</tr>
	<tr style="line-height:50px;">
		<td align="right">产品简介：</td>
		<td colspan="3"><textarea name="des" cols="80%" rows="10" id="descId"></textarea></td>
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
			<img src="../images/addPic.jpg" id="imgshow0" class="div2"/>
			<input id="imgId0" type="file" name="imgId0" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId0','','480*800-800*480-320*480','imgId0','','');"/>
			<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow0','IdimgId0');">删&nbsp;&nbsp;除</span></div>
		</div>
		<div class="div1">
			<img src="../images/addPic.jpg" id="imgshow1" class="div2"/>
			<input id="imgId1" type="file" name="imgId1" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId1','','480*800-800*480-320*480','imgId1','','');"/>
			<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow1','IdimgId1');">删&nbsp;&nbsp;除</span></div>
		</div>
		<div class="div1">
			<img src="../images/addPic.jpg" id="imgshow2" class="div2"/>
			<input id="imgId2" type="file" name="imgId2" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId2','','480*800-800*480-320*480','imgId2','','');"/>
			<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow2','IdimgId2');">删&nbsp;&nbsp;除</span></div>
		</div>
		<div class="div1">
			<img src="../images/addPic.jpg" id="imgshow3" class="div2"/>
			<input id="imgId3" type="file" name="imgId3" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId3','','480*800-800*480-320*480','imgId3','','');"/>
			<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow3','IdimgId3');">删&nbsp;&nbsp;除</span></div>
		</div>
		<div class="div1">
			<img src="../images/addPic.jpg" id="imgshow4" class="div2"/>
			<input id="imgId4" type="file" name="imgId4" class="inputstyle zidongClass" onchange="zidongMehtohd('IdimgId4','','480*800-800*480-320*480','imgId4','','');"/>
			<div style="display:none;" class="imgDeleteClass"><span onclick="delPic1('imgshow4','IdimgId4');">删&nbsp;&nbsp;除</span></div>
		</div>
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg">截图大小为480*800/800*480/320*480，格式为gif/png/jpg/jpeg，2-5张。</td>
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
			<select name="star">
				<option value="1">一星</option>
				<option value="2">二星</option>
				<option value="3">三星</option>
				<option value="4">四星</option>
				<option value="5">五星</option>
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
		<td><input type="button" value="选 择" onclick="openCountryDiv();"/>&nbsp;&nbsp; 
		<input type="text" id="countryNamesId" readonly="readonly" size="52px" style="background: #F5F5F5;"/></td>
		<td colspan="3" ></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">资费类型：</td>
		<td><input type="radio" checked="checked" name="isInSale" class="inSaleClass" value="F"/>免费</td>
		<td><input type="radio" name="isInSale" class="inSaleClass" value="T"/>内计费</td>
		<td><input type="text" name="inSaleID" value="" disabled="disabled" id="inSaleCodeId"/></td>
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
				<option value="T">允许</option>
				<option value="F">不允许</option>
			</select>
		</td>
		<td colspan="3"></td>
	</tr>
	<tr style="line-height:40px;">
		<td align="right">广告推广图片：</td>
		<td colspan="3">
		<div class="divbanner1">
			<img src="../images/addBanner.jpg" class="divbannerimg1"/>
			<input type="file" name="banner1" id="banner1Id" class="inputbannerimg1 zidongClass"
			 onchange="zidongMehtohd('bannerId','','','banner1Id','','');"/>
		</div>
		<div class="divbanner2"> 
			<img src="../images/addBanner2.jpg"  class="divbannerimg2"/>
			<input type="file" name="banner2" id="banner2Id" class="inputbannerimg2 zidongClass"
				onchange="zidongMehtohd('smallBannerId','','','banner2Id','','');"/>
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
			<input type="button" value="提交保存"  onclick="saveSoft('../item/saveSoft');"/>
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
			selectObj,{'htmlId':'cpTd','selectedOption':'','selectName':'cpID','id':'cpNameId'});
	
	var cate = categoryDictJSON['Soft'];
	selectObj2(cate['category2'],'catetd2','','category2','cate2NameId');
	
	selectObj2(langArray,'langSeId','','lan','');
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