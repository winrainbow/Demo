<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function ajax(url, fnSucc) {
		var xmlhttp = null;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("Get", url, true);
		xmlhttp.send();
		xmlhttp.onreadystatechange = function() { //OnReadyStateChange事件
			if (xmlhttp.readyState == 4) { //4为完成
				if (xmlhttp.status == 200) { //200为成功
					fnSucc(xmlhttp.responseText);
				}
			}
		};
	};
	window.onload = function() {
		var Obtn = document.getElementById("btn");
		var oCon = document.getElementById("con");
		var ofir = document.getElementById("fir");

		Obtn.onclick = function() {
			ajax("/Ajax/Query?userName=" + ofir.value, function fSu(str) {
				var jsonStr = eval("(" + str + ")");
				oCon.innerHTML = jsonStr["userName"];
			});
		};
	};
</script>

</head>

<body>
	<form action="/Ajax/Commit" method="post">
		<table align="center">
			<tr align="center">
				<td>
				First name:
				</td>
				<td> 
				<input type="text" name="fname" id="fir" />
				</td>
				<td>
				<input id="btn" type="button" value="验证"/>
				</td>
			</tr>
			<tr>
				<td>
				Last name:
				</td>
				<td id="con">
				</td>
			</tr>
			<tr>
			<td align="center" colspan=3>
				<input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
