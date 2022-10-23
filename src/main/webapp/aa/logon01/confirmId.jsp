<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<%@ page import="aa.logon01.LogonDBBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("id");
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.confirmId(id);
%>
<script lang="javascript">
	function setid() {
		opener.document.userinput.id.value="<%=id%>";
		self.close();
	}
</script>
</head>
<body bgcolor="<%=back_c%>">
<% 
	if (check == 1) {
%>
	<table width="270" border="0" cellspacing="0" cellpadding="5"
		align="center">
		<tr bgcolor="<%=title_c%>">
			<td height="39" align="center"><%=id%>이미 사용 중인 아이디 입니다.</td>
		</tr>
	</table>
	<form action="confirmId.jsp" name="checkForm" method="post">
	<table align="center">
		<tr bgcolor="<%=value_c%>">
			<td align="center">
				<p>다른 아이디를 선택하세요.</p>
				<input type="text" size="10" maxlength="12" name="id">
				<input type="submit" style="background-color:<%=bodyback_c%>" value="ID 중복확인">
			</td>
		</tr>
	</table>
	</form>
<% 
	} else { 
%>
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
	<tr bgcolor="<%=title_c %>" align="center" height="100">
		<td align="center">
			<p>입력하신 <%=id %>는 사용하실 수 있는 ID입니다.</p>
		</td>
	</tr>
	<tr bgcolor="<%=back_c%>" align="center">
		<td align="center">	
			<input type="button" value="닫  기" onclick="setid()" style="background-color:<%=bodyback_c%>">
		</td>
	</tr>
</table>
<%
	}
%>
</body>
</html>