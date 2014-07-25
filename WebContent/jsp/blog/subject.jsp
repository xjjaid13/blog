<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<tbody>
	<c:forEach items="${blogSubjectList}" var="blogSubject">
		<tr><td></td><td><a attr="${blogSubject.blogSubjectId}" class="blogList pointer">${blogSubject.subjectTitle}</a></td><td><a class="modifySubject pointer">modify</a><a class="deleteSubject pointer">delete</a></td></tr>
	</c:forEach>
</tbody>
<c:if test="${blogSubjectList != null}">
 	<input type="hidden" id="subjectCount" value="${subjectCount}">
</c:if>
