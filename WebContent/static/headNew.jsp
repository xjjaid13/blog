<%@page import="com.util.Constant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" type="image/x-icon" href="http://115.29.149.76/datac/image/littleCat.ico" media="screen" />
<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/2.2.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/2.2.2/css/bootstrap-responsive.css">
<link type="text/css" rel="stylesheet" href="${base}/css/global.css">
<link type="text/css" rel="stylesheet" href="${base}/css/face/<%=Constant.STYLE%>.css">
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner" style="height:60px;">
		<div class="container">
			<div class="nav-collapse">
				 
				<a class="brand" href="${base}/login/index" style="margin-left : 50px;margin-top:0;padding-top:0;">
					<img src="${base}/image/angryCat.png" style="height:50px;margin-top:5px;"/>
					angryCat
				</a>
				
				<c:choose>
					<c:when test="${user != null}">
						<ul class="nav pull-right" style="padding-top:10px;">
						    <% 
						    	if(request.getRequestURL().indexOf("weblink/view") != -1){ 
						    %>
								<li class="active">
							<%
								}else{
							%>
								<li>
							<% 
								}
							%>
								    <a href="${base}/weblink/view/${user.userId}">导航</a>
								</li>
							<% 
								if(request.getRequestURL().indexOf("blog/view") != -1){ 
							%>
								<li class="active">
							<% 
								}else{
							%>
								<li>
							<% 
								}
							%>
								    <a href="${base}/blog/view/${user.userId}">博客</a>
								</li>
							<% 
								if(request.getRequestURL().indexOf("note/view") != -1){ 
							%>
								<li class="active">
							<% 
								}else{
							%>
								<li>
							<% 
								}
							%>
								    <a href="${base}/note/view/${user.userId}">便签</a>
								</li>
							<%
								if(request.getRequestURL().indexOf("my") != -1){
							%>
								<li class="dropdown active">
							<%  
								}else{
							%>
								<li class="dropdown">
							<% 
								}
							%>
								<a href="#" id="dropdownMenu1" data-toggle="dropdown">${user.username}</a>
								<ul aria-labelledby="drop5" role="menu" class="dropdown-menu" id="userInfo" >
				                    <li role="presentation" class="dropdown-header"><a href="${base}/weblink/my/${user.userId}" tabindex="-1" role="menuitem">我的导航</a></li>
				                    <li role="presentation" class="dropdown-header"><a target="_blank" href="${base}/weblink/index/${user.userId}?view=0" tabindex="-1" role="menuitem">新导航(test)</a></li>
				                    <li role="presentation" class="dropdown-header"><a href="${base}/blog/my/${user.userId}" tabindex="-1" role="menuitem">我的博客</a></li>
				                    <li role="presentation" class="dropdown-header"><a href="${base}/note/my/${user.userId}" tabindex="-1" role="menuitem">我的便签</a></li>
				                    <li class="divider" role="presentation"></li>
				                    <li role="presentation" class="dropdown-header"><a href="#" tabindex="-1" role="menuitem">退出</a></li>
				                </ul>
		            		</li>
		            	</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav pull-right" style="padding-top:10px;">
							<li>
								<a href="${base}/login/index" style="color : #8DD1FF;">登陆</a>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
				<c:if test="${user != null}">
				</c:if>
			</div>
		</div>
	</div>
</div>