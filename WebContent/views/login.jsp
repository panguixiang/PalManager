<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns=" http://www.w3.org/1999/xhtml"> 
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Palmplay后台管理系统登陆</title>
<link rel="stylesheet" type="text/css" href="../css/login.css"/>
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script  type="text/javascript" language="javascript">
   function textBoxOnKeyDown(evt) {
        var event = (evt) ? evt : ((window.event) ? window.event : "");
        if (event.keyCode == 13) {
            checkLogin();
        }
    }
     
    function checkLogin(go) {
    	$("#goId").val(go);
    	$("#loginForm").submit();
    }
</script>
</head>
<body style="padding-top:167px">
<form id="loginForm" method="post" action="${pageContext.request.contextPath}/body/admin_main" >
<input type="hidden" name="go" value="" id="goId"/>		
	<div class="box">
<dl>
<dt id="logMsg">&nbsp;</dt>	
<dd><div class="s1">用户：</div>
<div class="s2">
<input type="text" class="inp1" name="account" id="accountId" size="12" maxlength="50" value="${account}"
 style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"/></div>
</dd>
<dd><div class="s3">密码：</div>
<div class="s4"><input type="password" class="inp2" name="password" id="passwordId"  onkeydown="textBoxOnKeyDown(event);" size="12" maxlength="50"/></div>
</dd>
<dd>
<div class="s8"><button type="button" onclick="checkLogin('1');">产品管理</button></div> 
</dd>
<dd>
<div class="s7"><button type="button" onclick="checkLogin('2');">运营管理</button></div>
</dd>

</dl>
	</div>
	<div class="copyright"><p id="cp"> &copy;艾弗移动科技有限公司 版权所有</p></div>
</form>
</body>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var loginError = "${loginError}";
	if(loginError && loginError.length>0) {
		$.messager.alert('错误提示',"${loginError}"); 
	}
});
</script>
</html>