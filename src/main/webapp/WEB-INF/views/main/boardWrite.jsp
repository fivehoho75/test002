<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div class="pt-5 pb-5 mx-auto" style="width: 200px;"><h2>게시판 쓰기</h2></div>
    <form id="frm">
    <div class="container">
    	<div class="form-group">
    		<label for="TITLE">제목</label>
    		<input type="text" class="form-control" id="title" name="title">
    	</div>
    	<div class="form-group">
    		 <textarea class="form-control" rows="15" cols="100" id="contents" name="contents"></textarea>
    	</div>
        
        <div class="float-right form-actions">
	        <button id="write" type="button" class="btn btn-primary">작성하기</button>
			<button id="list" type="button" class="btn btn-info">목록으로</button>
		</div>
    </div>
    </form>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
        	$("#list").click(function(e) {
        		e.preventDefault();
        		fn_openBoardList();
        	});
             
            $("#write").click(function(e) {
                e.preventDefault();
                fn_insertBoard();
            });         
        });
        
        function fn_openBoardList(){
        	$(location).attr('href', "<c:url value='/selectBoardList.do'/>");
        }
        
        function fn_insertBoard(){
        	var formData = $("#frm").serialize();

        	$.ajax({
                url : "/insertBoard.do",
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
        
    </script>
</body>
</html>