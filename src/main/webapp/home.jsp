<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    		  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty userinfo}">
						<h5 class="text-center text-success">${userinfo.name}</h5>
						<h5 class="text-center text-success">${userinfo.email}</h5>
						<c:remove var="userinfo" scope="session"/>
						
						</c:if>


</body>
</html>