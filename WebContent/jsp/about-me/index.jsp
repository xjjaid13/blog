<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../static/css-file.jsp" %>
<link type="text/css" rel="stylesheet" href="${base}/css/common.css" />
</head>
<body>
<div class="container">
	<%@include file="../../static/left-nav.jsp" %>
	<img id="pic" src="${base}/image/temp/cloud.jpg" style="margin-left:10%;height:400px;margin-top:100px;float:left;position:relative;top:-500px;">
	<div id="pic-info" style="float:left;margin-top:100px;margin-left:100px;position : relative;right:-1800px;">云烟，南京信息工程大学09软件工程毕业，现就职于某互联网公司，从事java开发。</div>
</div>
<%@include file="../../static/js-file.jsp" %>
<script>
	$(function(){
		$("#pic").animate({
			top : '0'
		});
		$("#pic-info").animate({
			right : '0'
		});
		
	})
</script>
</body>
</html>