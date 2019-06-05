<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

	<!-- 여기부터 -->
	
	<div class="container-inner sideBorder boxsing">
		
		<h2>리스트 등록</h2>
		<form name="frm" method="post" action="create"
			onsubmit="return incheck(this);">
			<input type="hidden" name="uuid" value="${member.uuid}">
			<input type="hidden" name="c_code" value="${member.c_code}">
			
			<table class="table">
				<tr>
					<th>제목</th>
					<td><input type="text" class="form-control" id="title"
						name="title" /></td> 
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="form-control" id="content" name="content"
							rows="20"></textarea></td>
				</tr>
			</table>
			<div class="col-sm-offset-4 col-sm-4 col-sm-offset-4">
				<button type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">리셋</button>
				<button type="button" class="btn btn-default"
					onclick="location.href='${root}/c_list/list'">목록</button>
			</div>
		</form>
		
	</div>


	
	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script type="text/javascript">
		function incheck(f) {
			if (f.title.value == '') {
				alert('제목을 입력해주세요');
				f.title.focus();
				return false;
			}
	
			if (f.content.value == '') {
				alert('내용을 입력하세요');
				f.content.focus();
				return false;
			}
		}
	</script>
