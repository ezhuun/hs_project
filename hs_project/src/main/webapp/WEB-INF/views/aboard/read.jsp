<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


	<!-- 여기부터 -->
	<div class="container-inner sideBorder boxsing">
		<form class="form-horizontal" name="frm" method="post">
		<input type="hidden" name="a_num" id="a_num" value="${dto.a_num }">
			<div class="bootstrap">
				<H2>조회</H2>
				<div class="panel panel-default">
					<div class="panel-heading">번호</div>
					<div class="panel-body">${dto.a_num}</div>
				
					<div class="panel-heading">제목</div>
					<div class="panel-body">${dto.title}</div>  
					  
					<div class="panel-heading">내용</div>
					<div class="panel-body">${dto.content}</div>
					
					<div class="panel-heading">작성자</div>
					<div class="panel-body">${dto.a_name}</div>
					
					<div class="panel-heading">조회수</div>
					<div class="panel-body">${dto.viewcnt}</div>  
					
					<div class="panel-heading">날짜</div>
					<div class="panel-body">${dto.regdate}</div>

				</div>
				<div>
					<button type="button" class="btn" onclick="location.href='./create'">등록</button>
					<button type="button" class="btn" onclick="updateM();">수정</button>
					<button type="button" class="btn" id="btndelete">삭제</button>
					<button type="button" class="btn" onclick="listM();">목록</button>
				</div>
			</div>
		</form> 	
	</div>


	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script src="${root}/ckeditor/ckeditor.js"></script>
	<script>
	window.onload = function(){
		CKEDITOR.replace("content");
	}
	</script>
	<script>
		function test(){
			console.log('g');
		}
		test();
	</script>
	<script>
		
		$(document).ready(function(){
			$("#btndelete").click(function(){
				if(confirm("삭제?")){
					document.frm.action = "./delete";
					document.frm.method = "post";
					document.frm.submit();
					
				}
			})
		})
	</script>
	
	<script type="text/javascript">
		function updateM(){
			var url = "update";
			url +="?a_num=${dto.a_num}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}"
  
			location.href=url;   	
		}

		
		function listM(){
		
			var url = "list";
			url += "?col=${param.col}"; 
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}"
			
			location.href=url;
		
		}	
	</script>	
	<!-- 여기까지 -->
	