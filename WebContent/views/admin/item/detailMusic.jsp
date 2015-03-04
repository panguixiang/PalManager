<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">
音&nbsp;乐&nbsp;&nbsp;&nbsp;
</div>
<h1 style="margin-left:20px;" align="left"></h1>
<div style="margin-left: 20px; margin-bottom: 20px;margin-right: 20px;">
	<table class="queryTable" style="width: 80%;">
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
		<td colspan="3"><input type="text" name="name" value="${item.name}" id="proNameId" size="50px" readOnly="true" style="background: #F5F5F5;"/></td>
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
			</div>
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg"></td>
	</tr>
	<tr style="line-height:50px;">
		<td align="right">产品简介：</td>
		<td colspan="3"><textarea name="des" cols="80%" rows="10" id="descId" readOnly="true" style="background: #F5F5F5;">${item.des}</textarea></td>
		<td></td> 
	</tr>
	<tr>
		<td></td>
		<td colspan="4" class="pMsg" id="descNumId">
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
		<td colspan="3"><input type="text" name="singer" value="${product.singer}" size="100px" id="singerId" readOnly="true" style="background: #F5F5F5;"/></td>
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
			<select name="star" id="starId">
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
		<td><input type="button" value="查  看" onclick="creatCountryDivChecked('${item.countryCodes}');" />
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
			</c:when>
			<c:otherwise>
				<img src="../images/addBanner.jpg" class="divbannerimg1"/>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="divbanner2">
		<c:choose>
			<c:when test="${item.advBannerID != ''}">
				<img src="${StaticUrl}${item.advIconID}" class="divbannerimg2"/>
			</c:when>
			<c:otherwise>
				<img src="../images/addBanner2.jpg"  class="divbannerimg2"/>
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
</table>
</div>
<div class="country_content">
<div class="countryList"></div>
<div>
	<input type="button" value="关闭" onclick="closeCountryDiv('close','','');" />
</div>
</div>
</body></html>
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
	selectObj2(langArray,'langSeId','${product.lan}','lan','lanId');
	$("#countryNamesId").val(getCountryNameStrs('${item.countryCodes}'));
	
	
	$("#cpNameId").attr("disabled","disabled");
	$("#cate3NameId").attr("disabled","disabled");
	$("#publicYearId").attr("disabled","disabled");
	$("#publicCountryId").attr("disabled","disabled");
	$("#lanId").attr("disabled","disabled");
	$("#starId").attr("disabled","disabled");
});
 
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
</html>