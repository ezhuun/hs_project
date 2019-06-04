<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

	<!-- 여기부터 -->
	
	<div class="container-inner sideBorder boxsing">
		<div class="bootstrap">
			<h1 class="col-sm-offset-2 col-sm-10">D-day 생성</h1>
			<form class="form-horizontal" method="post" action="create">
				<input type="hidden" name="uuid" value="${member.uuid}">
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">Title</label>
					<div class="col-sm-8">
						<input type="text" name="title" id="title" class="form-control">
					</div>
				</div>
	
				<div class="form-group">
					<label class="control-label col-sm-2" for="date">Date</label>
					<div class="col-sm-6">
						<input type="text" name="date" id="date"
							class="form-control">
					</div>
				</div>
	
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-5">
						<button class="btn">등록</button>
						<button type="reset" class="btn">취소</button>
						<button type="button" class="btn" onclick="location.href='./list'">목록</button>
					</div>
				</div>
			</form>
		</div>
		
	</div>
	
	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script>
	document.addEventListener("DOMContentLoaded", function(){
		const date = document.querySelector("#date");
		date.addEventListener('click', function() {
		  picker.open();
		}, false);

		const picker= new MaterialDatetimePicker({
			el: date,
			format: 'YYYY-MM-DD',
			openedBy: 'focus'
		});
	});
	</script>
	
	<!-- 여기까지 -->

