<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/403.scss"/>
</head>
<body>
	<div id="app">
   <div>403</div>
   <div class="txt">
      Forbidden<span class="blink">_</span>
   </div>
</div>
</body>
</html>