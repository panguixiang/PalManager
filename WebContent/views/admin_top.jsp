<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns=" http://www.w3.org/1999/xhtml"> 
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
  *{ padding:0; margin:0; text-decoration:none}
body{margin:0;background:url(../images/admin/admin_tbg.png) repeat-x;padding:0; color:#fff;font-family:宋体,arial; font-size:12px;}
.wrap{ position:relative; height:102px;font-size: 15px; background:url(../images/admin/p.png) no-repeat right top }
.logo{ background:url(../images/admin/admin_logo.png) no-repeat; left:11px; top:27px; position:absolute; height:31px; width:125px;}
.menu{ position:absolute; left:156px; top:36px;}
.menu li{ float:left; list-style:none; font-size:14px; height:39px; line-height:39px;}
.menu a{ text-decoration:none;display:block;}
.menu li.selected a{ background:url(../images/admin/menu.png) no-repeat right -39px; color:#0A6697;padding-right:17px; font-weight:bold}
.menu li.selected span { background:url(../images/admin/menu.png) no-repeat left top; display:block; padding-left:17px; text-decoration:none}
.menu li a{ display:block;background:url(../images/admin/menu.png) no-repeat right -117px; padding-right:17px; text-decoration:none; color:#fff}
.menu span{ background:url(../images/admin/menu.png) no-repeat 0 -78px; display:block; padding-left:17px;}
.member{ position:absolute; left:1%; top:82px;color:#077FBC}
.wangqi{ position:absolute; right:16px; top:9px;}
.s1 a:link,.s1 a:visited{ color:#fff; text-decoration:none;padding:0 10px 0 10px}
.s1 a:hover {color:#fff; text-decoration:underline}
.s4{ position:absolute; right:220px; top:80px;  text-indent:2em; line-height:18px; color:Blue;}
.s2{ position:absolute; right:130px; top:80px; background:url(../images/admin/q.png) no-repeat; text-indent:1.2em; line-height:18px;}
.s3{line-height:18px; position:absolute; right:40px; top:80px;background:url(../images/admin/t.png) no-repeat;text-indent:1.2em;}
</style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" style="font-size: 12px;
    border-width:0; border-style: none;" scroll="no">
    <div class="wrap">
        <div class="logo"></div>
        <div class="member">
        	【${sessionScope.manager.account} --
        	<c:if test="${sessionScope.manager.role=='super'}">系统管理员</c:if>
        	<c:if test="${sessionScope.manager.role=='operater'}">运营管理员</c:if>
        	<c:if test="${sessionScope.manager.role=='tester'}">测试管理员</c:if>】,欢迎您!
       </div>
       <div class="s4">
       		<a target="right" href="body/body" style="cursor:pointer;" class="">首页</a>
       </div>
        <div class="s2">
            <a target="right" href="../body/initPage?viewUrl=admin/manager/updatePaswd" style="color: #1598E0;cursor:pointer;" class="">密码修改</a>
         </div>
        <div class="s3">
            <a href="../body/loginOut" style="color: #1598E0" target="_top">安全退出</a></div>
    </div>
   
   
</body>
</html>
