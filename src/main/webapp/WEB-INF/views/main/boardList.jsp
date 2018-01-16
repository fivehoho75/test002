<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="container">
	<div class="pt-5 mx-auto" style="width: 200px;"><h2>게시판 목록</h2></div>
	<table class="table table-hover">
	    <colgroup>
	        <col width="10%"/>
	        <col width="*"/>
	        <col width="15%"/>
	        <col width="20%"/>
	    </colgroup>
	    <thead>
	        <tr>
	            <th scope="col" class="text-center">글번호</th>
	            <th scope="col" class="text-center">제목</th>
	            <th scope="col" class="text-center">조회수</th>
	            <th scope="col" class="text-center">작성일</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:choose>
	            <c:when test="${fn:length(list) > 0}">
	                <c:forEach items="${list }" var="row">
	                    <tr>
	                        <td class="text-center">${row.IDX }</td>
	                        <td>${row.TITLE }</td>
	                        <td class="text-center">${row.HIT_CNT }</td>
	                        <td>${row.CREA_DTM }</td>
	                    </tr>
	                </c:forEach>
	            </c:when>
	            <c:otherwise>
	                <tr>
	                    <td colspan="4">조회된 결과가 없습니다.</td>
	                </tr>
	            </c:otherwise>
	        </c:choose>
	         
	    </tbody>
	</table>
</div>
</body>
</html>