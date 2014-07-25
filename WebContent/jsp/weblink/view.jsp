<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航</title>
<link href="${base}/js/xDialog-master/xDialog.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@include file="../../static/headNew.jsp" %>
<link type="text/css" rel="stylesheet" href="${base}/css/weblink.css" />
<div class="main">
	<div class="container">
		  	<ul class="nav nav-tabs chat-tabs">
		  	    <li class="liWebType" attr="-1"><a class="typeTab pointer" attr="-1">谷歌</a></li>
		  		<li class="liWebType" attr="0"><a class="typeTab pointer" attr="0">百度</a></li>
		    	<c:forEach items="${webLinkTypeList}" var="webLinktype" >
		       		 <li class="liWebType" attr="${webLinktype.webLinktypeId}">
		       		 	<span class="deleteType pointer hide">x</span>
		       		 	<a class="typeTab pointer" attr="${webLinktype.webLinktypeId}">${webLinktype.name}</a>
		       		 </li>
		        </c:forEach>
            </ul>
		    
		    <ul style="list-style:none;" id="type-1" class="tabContent hide">
				 <li class="liWeblink" style="float:none;width:100%;padding:0;margin:0;">
				    <iframe class="fullHeight" style="width:100%;border:0 none;display:block;" src="http://www.google.com.hk/custom"></iframe>
				 </li>
			 </ul>
		    
		    <ul style="list-style:none;" id="type0" class="tabContent hide">
				 <li class="liWeblink" style="float:none;width:100%;padding:0;margin:0;">
				    <iframe class="fullHeight" style="width:100%;border:0 none;display:block;" src="http://www.baidu.com"></iframe>
				 </li>
			 </ul>
		    
			<c:forEach items="${webLinkTypeList}" var="webLinktype" >
				 <ul style="list-style:none;" id="type${webLinktype.webLinktypeId}" class="tabContent hide">
				     <c:if test="${webLinktype.webLinkList != null && webLinktype.webLinkList[0].name != null}">
						 <c:forEach items="${webLinktype.webLinkList}" var="webLink" >
							 <li class="liWeblink" attr="${webLink.webLinkId}" id="webLink${webLink.webLinkId}">
							    <div class="linkTitle"><img class="iconClass" src="${webLink.icon}" />
							    	<span title="${webLink.name}" class="webLinkName">
								    	<c:choose>
										   <c:when test="${fn:length(webLink.name) > 16}">
										   	   <c:out value="${fn:substring(webLink.name, 0, 16)}..." /> 
										   </c:when>
										   <c:otherwise>
										       ${webLink.name}
										   </c:otherwise>
										</c:choose>
							    	</span>
							    </div>
							    <div class="linkContent">
							    	<a title="${webLink.description}" class="webLinkDescription" href="${webLink.link}">
							    		<c:choose>
										   <c:when test="${fn:length(webLink.description) > 64}">
										   	   <c:out value="${fn:substring(webLink.description, 0, 64)}..." /> 
										   </c:when>
										   <c:otherwise>
										       ${webLink.description}
										   </c:otherwise>
										</c:choose>
							        </a>
							    </div>
							    <div class="linkBottom"></div>
							 </li>
						 </c:forEach>
				     </c:if>
				 </ul>
			</c:forEach>
	</div>
</div>
<%@include file="../../static/endNew.jsp" %>
<script src="${base}/js/xDialog-master/xDialog.js"></script>
<script src="${base}/js/cookie/jquery.cookie.js"></script>
<script>
	$(function(){
		resetHeight();
		$(window).resize(function(){
			resetHeight();
		});
		var tabIndex = $.cookie('tabIndex');
		if(tabIndex == undefined){
			tabIndex = "0";
		}
		
		$(".typeTab[attr="+tabIndex+"]").parent().addClass("active");
		$("#type"+tabIndex).show();
		$(".typeTab").live("click",function(){
			$(".nav-tabs li").removeClass("active");
			$(this).parent().addClass("active");
			$(".tabContent").hide();
			var tabIndex = $(this).attr("attr");
			$("#type"+tabIndex).show();
			$.cookie('tabIndex',tabIndex,{
				expires : 7
			});
		});
	});
	function resetHeight(){
		$(".tabContent,.fullHeight").css("height",$(window).height()-60-40);	
	}
</script>
</body>
</html>