<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<style>
.title {
	padding: 5px;
	font-size: 50px;
	text-align: center;
}
.se-main-container{
	text-align: center;
}
.bootstrap .container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    padding: 20px;
}
.bootstrap p {
    margin: 0 0 20px;
}
</style>
<script>
	function update(){
		var url = "update";
		url += "?diary_num=${diarydto.diary_num}";
		location.href = url;
	}
</script>
<!-- 여기부터 -->
<div class="container-inner sideBorder boxsing">
	<%-- <b># 파일 다운로드 방법</b><br>
		경로설정 = ${root}/download?dir=/resources/upload/profile&filename=test.jpg<br>
		<a href="${root}/downloadr?dir=/resources/upload/profile&filename=test.jpg">다운로드</a>
		<br><br> --%>
	<div class="bootstrap">
	<input type="hidden" name="diary_num" id="diary_num" value="${diarydto.diary_num }">
	<%-- <input type="hidden" name="title" id="title" value="${diarydto.title }"> --%>
		<div class="se-section-content">
			<p class="title">${diarydto.title }</p>
			<div class="container">
					<span class="writer_date">
						<span class="profile">
							<img src="#"><!-- 작성자 프로파일 -->
						</span>
						<span class="uuid">${diarydto.uuid }</span>
						<i class="dot"> ・ </i>
						<span class="date">${diarydto.regdate }</span><!-- 작성날짜 -->
					</span>
					
			</div>
		</div>
		
		<hr>
		
		<div class="se-main-container">
			<div>${diarydto.content }</div>
		</div>
	</div>

<button type="button" onclick="location.href='./list'">목록</button>
<button type="button" onclick="update()">수정</button>
<button type="button" onclick="location.href='./create'">생성</button>
<button type="button" onclick="location.href='history.back()'">취소</button>
</div>


<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
<script>
	function test() {
		console.log('g');
	}
	test();
</script>

<!-- 여기까지 -->