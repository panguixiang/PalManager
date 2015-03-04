<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns=" http://www.w3.org/1999/xhtml"> 
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/adminleft.css" />
<style type="text/css">
dl,dd,dt{ padding:0; margin:0}
dt{ 
	background:url(../images/admin/d.png) no-repeat;
	height:29px; 
	line-height:29px; 
	color:#fff;
    text-indent:3em;
    font-size:12px;
    margin-top:1px; 
    margin-bottom:8px
}
dd{background:url(../images/admin/defa.png) no-repeat 0 -29px; height:28px; line-height:28px; text-indent:1em}
dd a.onblur_1 {display:block;background:url(../images/admin/click.png) no-repeat 0 -57px; height:28px; color:#F97A0F}
</style>
    <script type="text/javascript">
         $(document).ready(function(){
        	 /*超级管理员： super
     		运营管理员： operater
     		测试管理员： tester*/
        	 $("."+"${sessionScope.manager.role}").css("display","");
        	$(".menuClass").click(function(){
        		var child = $(this).nextAll();
        		if($(child).css("display")=="none") {
        			$(child).css("display", "block");
        		} else {
        			$(child).css("display", "none");
        		}
        	});
         });
</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" style="font-size: 12px;
    border-width: 0; border-style: none;" scroll="no">
    
<div class="super" style="display:none;">
	<div>
	<dl>
	    <dt class="menuClass">线上产品管理</dt>
		     <dd class="defaultDt"><a target="right" href="../item/initAddItem?category1=Soft&category2=&jsp=addSoft" class="">产品入库</a></dd>
		     <dd class="defaultDt"><a target="right" href="../body/initPage?viewUrl=admin/item/itemList" class="">产品编辑</a></dd>
		     <dd class="defaultDt"><a target="right" href="../body/initPage?viewUrl=admin/rank/rankList" class="">榜单管理</a></dd>
		     <dd class="defaultDt"><a target="right" href="../body/initPage?viewUrl=admin/black/itemBlack" class="">黑名单管理</a></dd>
		     <dd class="defaultDt"><a target="right" href="../body/initPage?viewUrl=admin/cate/cateList" class="">产品类别管理</a></dd>
	  </dl>
	</div>
	<div>
	<dl>
	    <dt class="menuClass">线下产品管理</dt>
		     <dd class="defaultDt"><a target="right" href="../body/initPage?viewUrl=admin/item/offLineItemList" class="">线下产品</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">广告管理</dt>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/advertise/adverList" class="">广告管理</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">个人中心背景管理</dt>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/personCenter/personCenterList" class="">个人中心背景管理</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">CP管理</dt>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/cp/cpManagList" class="">CP信息管理</a></dd>
	      <dd><a target="right" href="../insale/cpInsaleView?viewUrl=admin/insale/insale_List" class="">内计费申请</a></dd>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/insale/insalePackage_List" class="">内计费包管理</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">CP产品审批</dt>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/cp/cpItemCheckList" class="">CP产品审批</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">消息管理</dt>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/message/message_List" class="">消息管理</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">用户管理</dt>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/manager/managerList" class="">用户管理</a></dd>
	  </dl>
	</div>
</div>

<div class="tester" style="display:none;">
	<div>
	  <dl>
	    <dt class="menuClass">CP产品审批</dt>
	      <dd><a target="right" href="../body/initPage?viewUrl=admin/cp/cpItemCheckList" class="">CP产品审批</a></dd>
	  </dl>
	</div>
</div>

<div class="operater" style="display:none;">
   <div>
	  <dl>
	    <dt class="menuClass">产品数据管理</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">产品数据查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">分类数据查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">产品信息反馈查询</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">运营报表</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">基础数据</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">下载数据</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">计费数据</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">CP数据管理</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">CP产品上架查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">CP产品下载查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">CP销售查询</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">用户数据管理</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">用户总数查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">新增用户总数查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">活跃用户数查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">新增活跃用户数查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">留存用户数查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">登录用户数查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">下载用户数查询</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">新增下载用户数查询</a></dd>
	  </dl>
	</div>
	<div>
	  <dl>
	    <dt class="menuClass">付费用户数查询</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">新增付费用户数查询</a></dd>
	  </dl>
	</div>
	
	<div>
	  <dl>
	    <dt class="menuClass">用户属性分析管理</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">用户属性分析</a></dd>
	  </dl>
	</div>
	
	<div>
	  <dl>
	    <dt class="menuClass">用户使用功能分析</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">支付转化分析</a></dd>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">关键字搜索分析</a></dd>
	  </dl>
	</div>
	
	<div>
	  <dl>
	    <dt class="menuClass">用户管理</dt>
	      <dd><a target="right" href="ArticleAdd.aspx" class="">重置密码</a></dd>
	  </dl>
	</div>
</div>

<script type="text/javascript">
    document.onclick = function (e) {
        e = window.event || e;
        var obj = e.srcElement ? e.srcElement : e.target;
        var aobj;
        if (document.all) {
            aobj = document.all.tags("a");
        }
        else {
            aobj = document.getElementsByTagName("a");
        }
        for (var i = 0; i < aobj.length; i++) {
            aobj[i].className = "";
        }
        obj.className = "onblur_1";
    };
</script>
</body>
</html>