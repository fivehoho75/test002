<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div class="ui container">
		<div class="ui grid" style="margin-top:5px;margin-bottom:5px;">
			<div class="center aligned column"><h2>게시판 상세</h2></div>
		</div>
	    <table class="ui table">
	        <colgroup>
	            <col width="15%"/>
	            <col width="35%"/>
	            <col width="15%"/>
	            <col width="35%"/>
	        </colgroup>
	        <tbody>
	            <tr>
	                <th scope="row">글 번호</th>
	                <td>${map.TITLE}</td>
	                <th scope="row">조회수</th>
	                <td>${map.HIT_CNT}</td>
	            </tr>
	            <tr>
	                <th scope="row">작성자</th>
	                <td>${map.CREA_ID}</td>
	                <th scope="row">작성시간</th>
	                <td>${map.CREA_DTM}</td>
	            </tr>
	            <tr>
	                <th scope="row">제목</th>
	                <td colspan="3">${map.TITLE}</td>
	            </tr>
	            <tr>
	                <td colspan="4">${fn:replace(map.CONTENTS, crlf, "<BR/>")}</td>
	            </tr>
	            <tr>
                <th scope="row">첨부파일</th>
                <td colspan="3">
                    <c:forEach var="row" items="${files}">
                        <input type="hidden" id="idx" value="${row.IDX}">
                        <a href="#this" name="file">${row.ORIGINAL_FILE_NAME}</a>
                        (${row.FILE_SIZE }kb)
                    </c:forEach>
                </td>
            </tr>
	        </tbody>
	    </table>
	    <div class="ui grid">
			<div class="right aligned column">
				<button id="update" type="button" class="ui green button">수정하기</button>
				<button id="list" type="button" class="ui grey button">목록으로</button>
			</div>
		</div>
     </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
        	$("#list").click(function() {
        		fn_openBoardList();
        	});
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            });
            
            $("a[name='file']").on("click", function(e){
                e.preventDefault();
                fn_downloadFile($(this));
            });
        });
         
        function fn_openBoardList(){
        	$(location).attr('href', "<c:url value='/selectBoardList.do'/>");
        }
         
        function fn_openBoardUpdate(){
            var idx = "${map.IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/openBoardUpdate.do'/>");
            comSubmit.addParam("idx", idx);
            comSubmit.submit();
        }
        
        function fn_downloadFile(obj){
            var idx = obj.parent().find("#idx").val();
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/common/downloadFile.do'/>");
            comSubmit.addParam("idx", idx);
            comSubmit.submit();
        }
    </script>
</body>
</html>