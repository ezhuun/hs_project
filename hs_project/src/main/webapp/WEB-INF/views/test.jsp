<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

	<!-- 여기부터 -->
	
	<div class="container-inner sideBorder boxsing">
			
		<b># ckeditor 사용</b><br>
		<script src="${root}/ckeditor/ckeditor.js"></script>
		<script>
		window.onload = function(){
			CKEDITOR.replace("content");
		}
		</script>
		<textarea name="content"></textarea>
		<br><br>
		
		
		<b># 부트스트랩 사용</b><br>
		<div class="bootstrap">
			<div class="well"> div class="bootstrap"를 만든뒤 기존과 동일하게 사용..</div>
		</div>
		
	</div>


	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script>
		function test(){
			console.log('g');
		}
		test();
	</script>
	
	<!-- 여기까지 -->
	