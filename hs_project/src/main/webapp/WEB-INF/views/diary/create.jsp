<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!-- 여기부터 -->

<div class="container-inner sideBorder boxsing">


	<div class="bootstrap">

		
		<form class="form-horizontal" method="post" action="create" enctype="multipart/form-data" onsubmit="return inCheck(this);">
			<input type="hidden" id="uuid" name="uuid" value="${member.uuid}">
			<input type="hidden" id="c_code" name="c_code" value="${member.c_code}">
			
			<div class="form-group" style="margin-top: 10px">
				<div class="col-sm-5" style="left: 10%;">
					<input type="text" id="title" name="title" placeholder="제목을 입력하세요." style="border: 0px;margin: 0px;font-size: 25px;"/>	
				</div>
				
			</div>
			<hr style="color: gray;border: solid 1px;width: 80%;">
			

			<div class="form-group">
				<div class="col-sm-5" style="left: 10%;">
					<label id="d_date"  for="d_date" style="cursor:pointer;text-align: left;">
						<span id="need" >*</span>
						데이트 날짜선택
					</label>
					<input type="text" id="d_date1" name="d_date" style="display: none;"  readonly required/>
					<label for="d_date" style="margin: 6px;color: #F49696;"></label>
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-10" style="left: 10%;">
					<textarea class="form-control" id="content" name="content"
						rows="10"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				
				<div class="col-sm-10" style="left: 10%;">
					<label class="control-label" for="content">썸네일</label>
					<br>
					<input class="form-control" type="file" name="filenameMF" id="filename" accept=".jpg,.gif,.png">
				</div>
			</div>
			

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10" align="right" style="margin-top: 10px;right: 7%;">
				
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default" onclick="history.back()">취소</button>
					<button type="button" class="btn btn-default"
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
		const d_date1 = document.querySelector("#d_date1");
		d_date.addEventListener('click', function() {
			picker.open();
		}, false);	

		const picker = new MaterialDatetimePicker({
			el : d_date1,
			format : 'YYYY-MM-DD',
			openedBy : 'focus'
		});
		
		d_date1.addEventListener("change",function(e){
			e.target.nextElementSibling.innerText = e.target.value;
		},false);
	});
</script>
<script>
	function inCheck(f){
		//alert("fffff");
		if(f.title.value == ""){
			alert('제목을 입력하세요');
			f.title.focus();
			return false;
		}
		if(f.d_date1.value == ""){
			alert('데이트 날짜를 선택해주세요!');
			f.d_date1.focus();
			return false;
		}
		if(f.content.value == ""){
			alert('내용을 입력하세요');
			f.content.focus();
			return false;
		}
		
	}
</script>
<style>
.btn-default{
    background-color: #fff;
    border-color: #ccc
}
</style>
<!-- 여기까지 -->