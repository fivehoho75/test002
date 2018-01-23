<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div class="ui grid" style="margin-top:5px;margin-bottom:5px;">
		<div class="center aligned column"><h2>게시판 쓰기</h2></div>
	</div>
    <form id="frm" name="frm" enctype="multipart/form-data">
    <div class="ui container form">
    	<div class="field">
    		<label for="TITLE">제목</label>
    		<input type="text" class="ui input" id="title" name="title">
    	</div>
    	<div class="field">
    		 <textarea class="form-control" rows="10" cols="100" id="contents" name="contents"></textarea>
    	</div>
    	<div class="field">
    		 <input type="file" class="form-control" id="file" name="file">
    	</div>
        <div class="ui grid">
			<div class="right aligned column">
				<button id="write" type="button" class="ui red button">작성하기</button>
				<button id="list" type="button" class="ui grey button">목록으로</button>
			</div>
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
        	var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/insertBoard.do' />");
            comSubmit.submit();
        }
        
    </script>
</body>
</html>