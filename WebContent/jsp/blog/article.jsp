<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<tbody>
	<c:forEach items="${blogList}" var="blog">
		<tr><td></td><td>${blog.title}</td><td><a attr="${blog.blogId}" class="modifyBlog pointer">modify</a><a attr="${blog.blogId}" class="deleteBlog pointer">delete</a></td></tr>
	</c:forEach>
</tbody>
<c:if test="${blogList != null}">
 	<input type="hidden" id="blogCount" value="${blogCount}">
</c:if>
