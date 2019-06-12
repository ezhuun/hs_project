<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style type="text/css">
#red {
	color: red;
}
</style>

	<div class="container-inner sideBorder boxsing">
	<div class="bootstrap">
		<h1 class="col-sm-offset-2 col-sm-10">D-day 삭제</h1>
		<form class="form-horizontal" method="post" action="delete">
		
			<input type="hidden" name="uuid" value="${member.uuid}">
			<input type="hidden" name="d_num" value="${dto.d_num}">
			<input type="hidden" name="col" value="${param.col}">
			<input type="hidden" name="word" value="${param.word}">
			<input type="hidden" name="nowPage" value="${param.nowPage}>">

			<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">삭제</button>
					<button type="reset" class="btn">취소</button>
					<button type="button" class="btn" onclick="location.href='./list'">목록</button>
				</div>
			</div>
		</form>
	</div>
</div>
