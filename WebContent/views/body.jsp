<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
<div class="crumbs">待办事宜</div>
   <div>
       <table style="width: 100%;line-height:25px;margin-left: 1%;">
       <tr><td></td></tr>
       <c:forEach items="${itemList}" var="item">
       		<tr>
				<td>
				<a href="../cp/cpItemDetail?itemID=${item.itemID}">${item.cpName}${item.contacts}的${item.name}
					<c:if test="${sessionScope.manager.role=='super'}">待审核</c:if>
	        		<c:if test="${sessionScope.manager.role=='tester'}">待测试</c:if>
				</a>
				</td>
			</tr>
       </c:forEach>
		</table>
    </div>
</body>
</html>