<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script lang="javascript">
	function checkIt() {
		var userinput = window.eval("document.userinput");
		if (!userinput.id.value) {
			alert("ID를 입력하세요");
			return false;
		}
		if (!userinput.passwd.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (userinput.passwd.value != userinput.passwd2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		if(!userinput.name.value) {
			alert("사용자 이름을 입력하세요");
			return false;
		}
		if(!userinput.jumin1.value || !userinput.jumin2.value)
			{
			alert("주민등록번호를 입력하세요");
			return false;
			}
	}
	
	function openConfirmid(userinput) {
		if(userinput.id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		url = "confirmId.jsp?id=" + userinput.id.value;
		
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	
	function zipCheck() {
		url = "ZipCheck.jsp?check=y";
		window.open(url,"post","toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
	}
</script>
</head>
<body bgcolor="<%=back_c%>">	
<form action="inputPro.jsp" method="post" name="userinput" onsubmit="return checkIt()">
	<table width="600" border="0" cellspacing="1" cellpadding="3" align="center">
		<tr>
			<td colspan="2" height="39" align="center" bgcolor="<%=bar_c%>">
				<font size="+1"><b>회원가입</b></font>
			</td>
		</tr>
		<tr>
			<td width="30%" bgcolor="<%=value_c%>"><center><b>아이디 입력</b></center></td>
			<td width="70%" bgcolor="<%=value_c%>"></td>
		</tr>
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>사용자 ID</center></td>
			<td width="70%">
				<input type="text" name="id" size="0" maxlength="12" style="border: 0" placeholder="아이디를 입력하세요">
				<input type="button" name="confirm_id" value="ID 중복확인" onclick="openConfirmid(this.form)" style="background-color:<%=bodyback_c%>">
			</td>
			</tr>
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>비밀번호</center></td>
			<td width="70%">
				<input type="password" name="passwd" size="30" maxlength="12" style="border: 0" placeholder="비밀번호를 입력하세요">
			</td>
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>비밀번호 확인</center></td>
			<td width="70%">
				<input type="password" name="passwd2" size="30" maxlength="12" style="border: 0" placeholder="비밀번호를 재입력하세요">
			</td>
		</tr>
		
		<tr>
			<td width="30%" bgcolor="<%=value_c%>"><center><B>개인정보 입력</B></center></td>
			<td width="70%" bgcolor="<%=value_c%>"></td> 
		<tr>
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>사용자 이름</center></td>
			<td width="70%" >
				<input type="text" name="name" size="30" maxlength="10" style="border: 0" placeholder="이름을 입력하세요">
			</td>
		</tr>
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>주민등록번호</center></td>
			<td width="70%">
				<input type="text" name="jumin1" size="7" maxlength="6" style="border:none" placeholder="앞 6자리">
				-<input type="text" name="jumin2" size="7" maxlength="7" style="border: 0" placeholder="뒷 7자리">
			</td>
		</tr>
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>E-Mail</center></td>
			<td width="70%">
				<input type="text" name="email" size="40" maxlength="30" style="border: 0" placeholder="이메일을 입력하세요">
			</td>
		</tr>
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>Blog</center></td>
			<td width="70%">
				<input type="text" name="blog" size="60" maxlength="50" style="border: 0" placeholder="블로그를 입력하세요">
			</td>
		</tr>
		
		<tr>
			<td width="30%" bgcolor="<%=title_c%>"><center>우편번호</center></td>
			<td> <input type="text" name="zipcode" size="20" style="border: 0" onclick="zipCheck()" placeholder="우편번호를 검색하세요">
				 <input type="button" value="우편번호찾기" onclick="zipCheck()" style="background-color:<%=bodyback_c%>">
				 <!-- &nbsp; . </td> -->
		</tr>
		<tr>
		<tr>
			<td rowspan="2" width="30%" bgcolor="<%=title_c%>"><center>주소</center></td>
			<td><input type="text" name="address" size="70" style="border: 0" placeholder="주소를 입력하세요"></td>
		</tr>
		<tr>
			<td><input type="text" size="70" style="border: 0" placeholder="상세 주소를 입력하세요"></td>
		</tr>
			
		<tr height="50">
			<td colspan="2" align="center" bgcolor="<%=value_c %>">	
				<input type="submit" name="confirm" value="등      록" style="background-color:<%=bodyback_c%>">
				<input type="reset" name="reset"    value="다시입력" style="background-color:<%=bodyback_c%>">	
				<input type="button" value="가입안함" onclick="javascript:window.location='main.jsp'" style="background-color:<%=bodyback_c%>">
			</td>
		</tr>
	</table>
</form>
</body>
</html>