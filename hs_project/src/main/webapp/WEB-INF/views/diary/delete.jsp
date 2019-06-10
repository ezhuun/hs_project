<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<style>
.well {
	font: 30px;
}
</style>

<!-- 여기부터 -->

<div class="container-inner sideBorder boxsing">
	<form class="form-horizontal" action="delete" method="post">
		<input hidden="diary_num" id="diary_num" name="diary_num" value="${diary_num }">
		<div class="bootstrap">
			<div class="well">삭제하시겠습니까?</div>

			<button type="submit" class="btn btn-defulat">삭제</button>
			<button type="button" class="btn btn-defulat" onclick="window.close();">취소</button>
		</div>
	</form>
</div>


<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
<script>
	function test() {
		console.log('g');
	}
	test();
</script>

<!-- 여기까지 -->
