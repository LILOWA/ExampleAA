<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link href="style.css" rel="stylesheet" type="text/css">

<%
	try {
		if(session.getAttribute("memId") == null) { %>

<script language="javascript">
	function focusIt() {
		document.inform.id.focus();
	}
	
	
	function checkIt() {
		inputForm = window.eval("document.inform");
		
			if (!inputForm.id.value) {
				alert("아이디를 입력하세요.");	
			inputForm.id.focus();
			return false;
			}
			
			if (!inputForm.passwd.value) {
				alert("비밀번호를 입력하세요.");	
			inputForm.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body onload="focusIt();" bgcolor="<%=back_c%>">
	<table width="500" cellpadding="1" cellspacing="1" align="center" border="0" height="90">
		<tr>
			<td width="280" bgcolor="<%=bar_c%>" height="20" rowspan="3" align="center">
				<a href="/EZEN/board/list.jsp" style="">게시판</a><br><br>
				<a href="/EZEN/board/list.jsp">방명록</a>
			</td>
			
			<form name="inform" method="post" action="loginPro.jsp" onsubmit="return checkIt();">
			<td bgcolor="<%=title_c%>" width="100" align="center">아이디</td>
			<td width="120" bgcolor="<%=value_c%>">
				<input type="text" name="id" maxlength="10" style="border:0" placeholder="아이디를 입력하세요">
			</td>
		</tr>
		<tr>
			<td bgcolor="<%=title_c%>" width="100" align="center">비밀번호</td>
			<td width="120" bgcolor="<%=value_c%>">
				<input type="password" name="passwd" maxlength="10" style="border:0" placeholder="비밀번호를 입력하세요">
			</td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="<%=back_c%>" align="center">
				<input type="submit" name="Submit" value="로그인" style="background-color:<%=bodyback_c%>">
				<input type="button" value="회원가입" onclick="javascript:window.location='inputForm.jsp'" style="background-color:<%=bodyback_c%>">
			</td>
			</form>
		</tr>
	</table>
<%
		} else {
%>
	<table width="500" cellpadding="1" cellspacing="1" align="center" border="0">
		<tr height="100">
			<td width="300" bgcolor="<%=title_c%>" height="20" align="center">
				<a href="/EZEN/board/list.jsp" style="">게시판</a><br><br>
				<a href="/EZEN/board/list.jsp">방명록</a>
			</td>	
			<td rowspan="3" bgcolor="<%=value_c%>" align="center">
				<%=session.getAttribute("memId") %>님이 <br>
				방문하셨습니다
			<form action="logout.jsp" method="post">
				<input type="submit" value="로그아웃"  style="background-color:<%=bodyback_c%>">
				<input type="button" value="회원정보변경" onclick="javascript:window.location='modify.jsp'"  style="background-color:<%=bodyback_c%>">
			</form>
			</td>
		</tr>
	</table>
<br>
<%
		}
	} catch(NullPointerException e) {}
%>
</body>
</html>