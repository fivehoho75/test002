<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div class="ui container">
	    <form id="frm">
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
	                    	<div class="ui fluid input">
	                        	<input type="text" id="title" name="title" class="wdp_90" value="${map.TITLE}"/>
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="4" class="view_text">
	                    	<div class="ui form field">
	                       		<textarea rows="10" cols="100" title="내용" id="contents" name="contents">${map.CONTENTS}</textarea>
	                        </div>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </form>
		<div class="ui grid">
			<div class="right aligned column">
				<button id="update" type="button" class="ui red button">저장하기</button>
				<button id="delete" type="button" class="ui orange button">삭제하기</button>
				<button id="list" type="button" class="ui grey button">목록으로</button>
			</div>
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
        	var formData = $("#frm").serialize();

        	$.ajax({
                url : "/deleteBoard.do",
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