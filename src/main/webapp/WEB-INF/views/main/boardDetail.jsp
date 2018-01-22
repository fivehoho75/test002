<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div class="container">
		<div class="pt-5 pb-5 mx-auto" style="width: 200px;"><h2>게시판 상세</h2></div>
	    <table class="table">
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
	        </tbody>
	    </table>
	    <div class="float-right form-actions">
		    <button id="update" type="button" class="btn btn-primary">수정하기</button>
			<button id="list" type="button" class="btn btn-info"><i class="icon-search"></i>목록으로</button>
	    </div>
     </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
        	$("#list").click(function(e) {
        		e.preventDefault();
        		fn_openBoardList();
        	});
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            });
        });
         
        function fn_openBoardList(){
        	$(location).attr('href', "<c:url value='/selectBoardList.do'/>");
        }
         
        function fn_openBoardUpdate(){
            var idx = "${map.IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/openBoardUpdate.do' />");
            comSubmit.addParam("idx", idx);
            comSubmit.submit();
        }
    </script>
</body>
</html>