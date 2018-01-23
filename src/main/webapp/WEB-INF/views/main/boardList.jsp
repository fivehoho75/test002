<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div class="ui container">
		<div class="ui grid" style="margin-top:5px;margin-bottom:5px;">
			<div class="center aligned column"><h2>게시판 목록</h2></div>
		</div>
		<table id="boardList" class="ui selectable celled striped table">
		    <colgroup>
		        <col width="100px"/>
		        <col width="*"/>
		        <col width="90px"/>
		        <col width="110px"/>
		    </colgroup>
		    <thead>
		        <tr>
		            <th scope="col" class="center aligned">글번호</th>
		            <th scope="col" class="center aligned">제목</th>
		            <th scope="col" class="center aligned">조회수</th>
		            <th scope="col" class="center aligned">작성일</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:set var="listCnt" value="${fn:length(list)}"/>
		        <c:choose>
		            <c:when test="${listCnt > 0}">
		                <c:forEach items="${list}" var="row" varStatus="status">
		                    <tr id="${row.IDX}">
		                        <td class="center aligned">${listCnt-status.index}</td>
		                        <td>${row.TITLE}</td>
		                        <td class="center aligned">${row.HIT_CNT}</td>
		                        <td class="center aligned"><fmt:formatDate value="${row.CREA_DTM}" pattern="yyyy-MM-dd"/></td>
		                    </tr>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		                <tr>
		                    <td colspan="4" class="center aligned">조회된 결과가 없습니다.</td>
		                </tr>
		            </c:otherwise>
		        </c:choose>
		         
		    </tbody>
		</table>
		<div class="ui grid">
			<div class="right floated two wide column">
				<button id="write" class="ui red button">
					<i class="write icon"></i>
					글쓰기
				</button>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
        	 $("#write").click(function(e) {
                 e.preventDefault();
                 fn_openBoardWrite();
             });
             
            $("#boardList tr").click(function(e) {
                e.preventDefault();
                fn_openBoardDetail($(this).attr("id"));
            });
        });
         
         
        function fn_openBoardWrite(){
        	$(location).attr('href', "<c:url value='/openBoardWrite.do'/>");
        }
         
        function fn_openBoardDetail(obj){
        	if ( obj == undefined ) return;
        	
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/openBoardDetail.do'/>");
            comSubmit.addParam("idx", obj);
            comSubmit.submit();
        }
    </script>
</body>
</html>