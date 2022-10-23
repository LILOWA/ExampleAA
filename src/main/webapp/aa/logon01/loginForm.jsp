<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script lang="javascript">
	function begin() {
		document.myform.id.focus();
	}
	
	function checkIt() {
		if (!document.myform.id.value) {
			alert("이름을 입력하지 않으셨습니다");
			document.myform.id.focus();
			return false;
		}
		if (!document.myform.passwd.value) {
			alert("비밀번호를 입력하지 않으셨습니다");
			document.myform.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body onload="begin()" bgcolor="<%=back_c%>">
<form action="loginPro.jsp" name="myform" method="post" onsubmit="return checkIt()">
	<table cellSpacing=1 cellPadding=1 width="300" border="0" align="center">
		<tr height="30">
			<td colspan="3" align="center" bgcolor="<%=bar_c%>"><strong>회원로그인</strong></td>
		</tr>
		<tr height="30">
			<td width="110" bgcolor="<%=title_c%>" align="center">아이디</td>
			<td width="190" bgcolor="<%=value_c%>">
				<input type="text" name="id" maxlength="12" style="border:0" placeholder="아이디를 입력하세요">
			</td>
		</tr>
		<tr height="30">
			<td width="110" bgcolor="<%=title_c%>" align="center">비밀번호</td>
			<td width="190" bgcolor="<%=value_c%>">
				<input type="password" name="passwd" maxlength="12" style="border:0" placeholder="비밀번호를 입력하세요">
			</td>
		</tr>
		<tr height="30">
			<td colspan="3" bgcolor="<%=value_c%>" align="center">
				<input type="submit" value="로그인" style="background-color:<%=bodyback_c%>">
				<input type="reset" value="다시입력" style="background-color:<%=bodyback_c%>">
				<input type="button" value="회원가입" style="background-color:<%=bodyback_c%>" onclick="javascript:window.location='inputForm.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>