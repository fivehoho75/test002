<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <form id="frm">
    <div class="container">
    	<div class="form-group">
    		<label for="TITLE">제목</label>
    		<input type="text" class="form-control" id="TITLE" name="TITLE">
    	</div>
    	<div class="form-group">
    		 <textarea class="form-control" rows="20" cols="100" id="CONTENTS" name="CONTENTS"></textarea>
    	</div>
        
        <button type="button" class="btn btn-outline-primary">작성하기</button>
		<button type="button" class="btn btn-outline-info">목록으로</button>
    </div>
    </form>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
                     
        });
    </script>
</body>
</html>