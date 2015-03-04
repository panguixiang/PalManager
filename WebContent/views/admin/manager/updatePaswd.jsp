<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../top.jsp" %>
<body>
<div class="crumbs">密码修改</div>
<div class="divClass">
		<table>
			<tr>
				<td align="right">旧密码：</td>
				<td><input type="text" name="oldPasword" style="width: 350px;height:20px; size: 50px;" id="oldPasId"/></td>
			</tr>
			<tr>
				<td align="right">新密码：</td>
				<td><input type="text" name="newPaswd" style="width: 350px;height:20px; size: 50px;" id="newPasId"/></td>
			</tr>
			<tr>
				<td align="right">新密码确认：</td>
				<td><input type="text" name="renewPaswd" style="width: 350px;height:20px; size: 50px;" id="reNewPasId"/></td>
			</tr>
			<tr align="center">
				<td colspan="3"><input type="button" value="确定" class="saveBut"/>&nbsp;&nbsp;&nbsp;
			</tr>
		</table>
</div>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript">
 $(".saveBut").click(function(){
			var oldPasId = $("#oldPasId").val();
			if($.trim(oldPasId).length==0) {
				$.messager.alert('错误提示','请输入旧密码!'); 
				return false;
			}
			var newPasId = $("#newPasId").val();
			if($.trim(newPasId).length==0) {
				$.messager.alert('错误提示','请输入新密码!'); 
				return false;
			}
			var reNewPasId = $("#reNewPasId").val();
			if($.trim(newPasId) != $.trim(reNewPasId)) {
				$.messager.alert('错误提示','新密码确认不正确!');
				return false;
			}
			$.ajax({
				url:'../manager/updatePaswd?oldPassword='+oldPasId+"&password="+newPasId,
				type:'get',
				secureuri: false,
				dataType:'json',
				success:function(data) {
					if(data.ERROR) {
						$.messager.alert('错误提示',data.ERROR);
					} else {
						$.messager.alert('成功提示',data.SUCCESS);
						cleanPw();
					}
				},
				error:function(response,data){
					$.messager.alert('错误提示',"ajax请求发生错误!");
				} 
			});
 });
 function cleanPw() {
	 $("#oldPasId").val("");
	 $("#newPasId").val("");
	 $("#reNewPasId").val("");
 }
</script>
</body>
</html>