<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!-- 여기부터 -->

<div class="container-inner sideBorder boxsing">


	<div class="bootstrap">

		<h1>Diary</h1>
		<form class="form-horizontal" method="post" action="create" enctype="multipart/form-data">
			<input type="hidden" id="uuid" name="uuid" value="${member.uuid}">
			<input type="hidden" id="c_code" name="c_code" value="${member.c_code}">
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="title" >제목</label>
				<div class="col-sm-3">
					<input  class="form-control" id="title" name="title" placeholder="제목을 입력하세요." />
				</div>
			</div>
			
			

			<div class="form-group">
				<label class="control-label col-sm-2" for="d_date">날짜</label>
				<div class="col-sm-8">
					<input type="text" id="d_date" name="d_date" readonly required />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-8">
					
					<textarea class="form-control" id="content" name="content"
						rows="10"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">썸네일</label>
				<div class="col-sm-8">
					<input type="file" name="filenameMF" id="filename" accept=".jpg,.gif,.png">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-defulat">등록</button>
					<button type="reset" class="btn btn-defulat">취소</button>
					<button type="button" class="btn btn-defulat"
						onclick="location.href='./list'">목록</button>
				</div>
			</div>
		</form>
	
	</div>

</div>


<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};

	document.addEventListener("DOMContentLoaded", function() {
		const d_date = document.querySelector("#d_date");
		d_date.addEventListener('click', function() {
			picker.open();
		}, false);

		const picker = new MaterialDatetimePicker({
			el : d_date,
			format : 'YYYY-MM-DD',
			openedBy : 'focus'
		});
	});
</script>

<!-- 여기까지 -->