<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div class="container">
	    <form id="frm">
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
	                    <td>
	                        ${map.IDX}
	                        <input type="hidden" id="IDX" name="idx" value="${map.IDX}">
	                    </td>
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
	                    <td colspan="3">
	                        <input type="text" class="form-control" id="title" name="title" class="wdp_90" value="${map.TITLE}"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="4" class="view_text">
	                        <textarea class="form-control" rows="10" cols="100" title="내용" id="contents" name="contents">${map.CONTENTS}</textarea>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </form>
		<div class="float-right form-actions">
			<button id="update" type="button" class="btn btn-primary">저장하기</button>
			<button id="delete" type="button" class="btn btn-warning">삭제하기</button>
			<button id="list" type="button" class="btn btn-info">목록으로</button>
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
                fn_updateBoard();
            });
             
        	$("#delete").on("click", function(e){
                e.preventDefault();
                fn_deleteBoard();
            });
        });
         
        function fn_openBoardList(){
        	$(location).attr('href', "<c:url value='/selectBoardList.do'/>");
        }
         
        function fn_updateBoard(){
        	var formData = $("#frm").serialize();

        	$.ajax({
                url : "/updateBoard.do",
                type : "POST",
                cache : false,
                data : formData,
                success : function(response){
                	alert(response.msg);
                	$(location).attr('href', "<c:url value='/selectBoardList.do'/>");
               
                },
                error : function(request,status,error) {
                	alert("저장중 에러가 발생하였습니다.");
                }
            });
        }
         
        function fn_deleteBoard(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
            comSubmit.addParam("IDX", $("#IDX").val());
            comSubmit.submit();
             
        }
    </script>
</body>
</html>