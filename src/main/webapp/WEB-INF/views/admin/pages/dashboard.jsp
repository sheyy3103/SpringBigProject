<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="entities.AccountDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!AccountDetails account = (AccountDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();%>
<div class="jumbotron">
	<h1 class="display-4">
		Xin chào quản trị viên
		<%
	out.print(account.getFullName());
	%>
		!
	</h1>
	<p>Tôi ngỡ tình ta xanh ngát trời xuân, nâu biết ngày đông kéo đến
		bất chợt.</p>
	<p class="lead">Yêu mấy rồi nay cũng hóa tàn phai. Theo người...</p>
</div>